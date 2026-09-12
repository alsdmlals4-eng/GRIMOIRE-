extends RefCounted
## Event-only snapshot transaction. No legacy save migration, clock resolver,
## scene mutation, hand consumption, or UI authority is implied by this service.

const Semantics = preload("res://src/core/shared_spell/spell_semantics.gd")
const Ledger = preload("res://src/core/atomic_result_ledger.gd")
const TEMPERATURES := ["cold", "warm", "hot", "overheated"]

func cast(state: Dictionary, command: Dictionary) -> Dictionary:
    if not _valid_state(state):
        return _reject("INVALID_STATE")
    if not _valid_command(command):
        return _reject("INVALID_COMMAND")
    var glyphs: Array = command.glyphs.duplicate()
    glyphs.sort()
    var identity := {"attempt_id": state.attempt_id, "glyphs": glyphs,
        "target_id": command.target_id, "destination_id": command.destination_id,
        "expected_revision": command.expected_revision}
    var ledger = Ledger.new()
    ledger.restore(state.receipts)
    if ledger.has_result(command.id):
        var previous: Dictionary = ledger.result_for(command.id)
        if previous.get("identity") != identity:
            return _reject("COMMAND_ID_CONFLICT")
        # Return CURRENT state, never roll back a later action to an old receipt.
        return {"status": "REPLAY", "state": state.duplicate(true), "receipt": previous}
    if command.expected_revision != state.revision:
        return _reject("STALE_REVISION")
    var assessment: Dictionary = Semantics.new().assess_scene(glyphs, state.learned,
        state.objects, command.target_id, command.destination_id)
    if assessment.status == "INVALID":
        return _reject(assessment.reason)
    if state.mana < assessment.cost:
        return _reject("INSUFFICIENT_MANA")
    var source: Dictionary = state.objects[command.target_id]
    if assessment.action in ["HEAT_POINT", "HEAT_FLOW", "FOCUS_HEAT"]:
        if source.get("temperature") not in TEMPERATURES:
            return _reject("INVALID_TEMPERATURE")
    var next := state.duplicate(true)
    if assessment.status == "VALID_CHANGE":
        _apply_effect(next, assessment)
        if next.objects == state.objects:
            assessment.status = "VALID_NO_CHANGE"
            assessment.reason = "NO_STATE_CHANGE"
            assessment.warnings.append("COST_WITHOUT_CHANGE")
    next.mana -= assessment.cost
    next.elapsed_actions += assessment.time
    next.revision += 1
    var receipt := {"command_id": command.id, "identity": identity,
        "assessment": assessment.duplicate(true), "mana_before": state.mana,
        "mana_after": next.mana, "actions_before": state.elapsed_actions,
        "actions_after": next.elapsed_actions, "revision": next.revision}
    ledger.commit_once(command.id, receipt)
    next.receipts = ledger.serialize()
    return {"status": "CAST", "state": next, "receipt": receipt.duplicate(true)}

func effect_active(state: Dictionary, object_id: String, effect: String) -> bool:
    if not _valid_state(state) or not state.objects.has(object_id):
        return false
    var effects: Dictionary = state.objects[object_id].get("effects", {})
    # Evaluate at the START of each paid action, including the creation action.
    return effects.get(effect, -1) > state.elapsed_actions

func _apply_effect(state: Dictionary, assessment: Dictionary) -> void:
    var target: Dictionary = state.objects[assessment.target_id]
    match assessment.action:
        "HEAT_POINT", "HEAT_FLOW", "FOCUS_HEAT":
            var steps := 2 if assessment.action == "FOCUS_HEAT" else 1
            var index := TEMPERATURES.find(target.temperature)
            target.temperature = TEMPERATURES[mini(index + steps, TEMPERATURES.size() - 1)]
            if "DAMAGE_RISK" in assessment.warnings:
                target["damaged"] = true
        "PUSH":
            target["location_id"] = assessment.destination_id
        "REDIRECT":
            target["redirected_to"] = assessment.destination_id
        "GATHER_LOCAL", "TRANSPORT":
            target["empty"] = true
            state.objects[assessment.destination_id].capture_load += 1
        "BLOCK":
            _temporary(target, "blocked", state.elapsed_actions)
        "RETAIN_HEAT":
            _temporary(target, "heat_retained", state.elapsed_actions)
        "SEAL":
            _temporary(target, "leak_suppressed", state.elapsed_actions)

func _temporary(target: Dictionary, effect: String, action: int) -> void:
    if not target.has("effects"):
        target.effects = {}
    target.effects[effect] = action + 2 # Refresh, never stack or set permanent flags.

func _valid_state(state: Dictionary) -> bool:
    if state.get("schema") != "GRIMOIRE_EVENT_CAST_1":
        return false
    if not state.get("attempt_id") is String or state.attempt_id.is_empty():
        return false
    for key in ["revision", "mana", "elapsed_actions"]:
        if not state.get(key) is int or state[key] < 0:
            return false
    if not state.get("objects") is Dictionary or not state.get("receipts") is Dictionary or not state.get("learned") is Array:
        return false
    for record in state.receipts.values():
        if not record is Dictionary:
            return false
    for object_id in state.objects:
        var record = state.objects[object_id]
        if not record is Dictionary or record.get("id") != object_id:
            return false
        var effects = record.get("effects", {})
        if not effects is Dictionary:
            return false
        for expiry in effects.values():
            if not expiry is int or expiry < 0:
                return false
    return true

func _valid_command(command: Dictionary) -> bool:
    for key in ["id", "target_id", "destination_id"]:
        if not command.get(key) is String:
            return false
    if command.id.is_empty() or command.target_id.is_empty():
        return false
    if not command.get("expected_revision") is int or command.expected_revision < 0:
        return false
    if not command.get("glyphs") is Array:
        return false
    for glyph in command.glyphs:
        if not glyph is String:
            return false
    return true

func _reject(reason: String) -> Dictionary:
    return {"status": "REJECTED", "reason": reason, "cost": 0, "time": 0}

extends RefCounted
## Whole event actions: effects -> time consequences -> goals -> receipt.
## Outer receipts own complete event actions; inner receipts own spell effects.

const Definitions = preload("res://src/core/shared_spell/event_definitions.gd")
const Spell = preload("res://src/core/shared_spell/event_spell_cast.gd")
const Ledger = preload("res://src/core/atomic_result_ledger.gd")
const KINDS := ["CAST", "CLOSE_LEAK", "CLEAN", "COOL", "LOCK", "PLACE", "WAIT", "HELP", "STOP", "STOP_DEVICE", "MOVE_SAMPLE"]

func start(event_id: String, attempt_id: String) -> Dictionary:
    return Definitions.new().start(event_id, attempt_id)

func preview(state: Dictionary, command: Dictionary) -> Dictionary:
    # Same reducer and exact consequences, but caller retains original snapshot.
    return act(state, command)

func act(state: Dictionary, command: Dictionary) -> Dictionary:
    if not valid_state(state):
        return _reject("INVALID_EVENT_STATE")
    if not _valid_command(command):
        return _reject("INVALID_COMMAND")
    var identity := command.duplicate(true)
    if command.kind == "CAST":
        identity.glyphs.sort()
    var ledger = Ledger.new()
    ledger.restore(state.receipts)
    if ledger.has_result(command.id):
        var prior: Dictionary = ledger.result_for(command.id)
        if prior.get("identity") != identity:
            return _reject("COMMAND_ID_CONFLICT")
        return {"status": "REPLAY", "state": state.duplicate(true), "receipt": prior}
    if state.outcome != "ONGOING":
        return _reject("EVENT_FINISHED")
    if command.expected_revision != state.spell_state.revision:
        return _reject("STALE_REVISION")
    var next := state.duplicate(true)
    var assessment: Dictionary = {}
    var changes: Array = []
    if command.kind == "CAST":
        var cast_command := {"id": command.id, "expected_revision": command.expected_revision,
            "glyphs": command.glyphs, "target_id": command.target_id, "destination_id": command.destination_id}
        var casted: Dictionary = Spell.new().cast(state.spell_state, cast_command)
        if casted.status != "CAST":
            return _reject(casted.get("reason", "INVALID_SPELL"))
        next.spell_state = casted.state
        assessment = casted.receipt.assessment
        _spell_consequences(next, assessment, changes)
    else:
        var reason := _manual(next, command.kind, changes)
        if not reason.is_empty():
            return _reject(reason)
        next.spell_state.revision += 1
        if command.kind not in ["HELP", "STOP"]:
            next.spell_state.elapsed_actions += 1
    if next.outcome == "ONGOING":
        _time_and_goal(next, state.spell_state.elapsed_actions, changes)
    var receipt := {"identity": identity, "event_id": state.event_id,
        "attempt_id": state.spell_state.attempt_id, "assessment": assessment,
        "object_changes": _object_changes(state, next),
        "changes": changes, "hazard_before": state.hazard, "hazard_after": next.hazard,
        "mana_before": state.spell_state.mana, "mana_after": next.spell_state.mana,
        "actions_before": state.spell_state.elapsed_actions, "actions_after": next.spell_state.elapsed_actions,
        "outcome": next.outcome, "consequences": next.consequences.duplicate()}
    ledger.commit_once(command.id, receipt)
    next.receipts = ledger.serialize()
    return {"status": "APPLIED", "state": next, "receipt": receipt.duplicate(true)}

func _manual(state: Dictionary, kind: String, changes: Array) -> String:
    var objects: Dictionary = state.spell_state.objects
    if state.event_id == "LAB_SAMPLE_02" and kind in ["HELP","STOP"]:
        objects.device.closed = true
        if objects.sample.location_id != "safe": _consequence(state,"SAMPLE_PROCESS_INTERRUPTED")
    match kind:
        "STOP_DEVICE":
            if state.event_id != "LAB_SAMPLE_02": return "ACTION_NOT_AVAILABLE"
            objects.device.closed = true
            if objects.sample.location_id != "safe": _consequence(state,"SAMPLE_PROCESS_INTERRUPTED")
        "MOVE_SAMPLE":
            if state.event_id != "LAB_SAMPLE_02": return "ACTION_NOT_AVAILABLE"
            if objects.sample.location_id == "safe": return "SAMPLE_ALREADY_SAFE"
            objects.sample.location_id = "safe"
            if objects.device.get("effects",{}).get("blocked",-1) <= state.spell_state.elapsed_actions:
                _hazard(state,2,"UNPROTECTED_TRANSFER",changes)
        "HELP":
            state.outcome = "ASSISTED"
        "STOP":
            state.outcome = "STOPPED"
        "WAIT":
            pass
        "CLOSE_LEAK":
            if state.event_id != "GREENHOUSE_LEAK_01":
                return "ACTION_NOT_AVAILABLE"
            if objects.leak.closed:
                changes.append({"cause": "ALREADY_CLOSED", "delta": 0})
            objects.leak.closed = true
        "CLEAN":
            if state.event_id != "GREENHOUSE_LEAK_01":
                return "ACTION_NOT_AVAILABLE"
            if not objects.leak.closed:
                return "LEAK_STILL_OPEN"
            if not objects.cloud.empty:
                state.cleanup_step = mini(2, state.cleanup_step + 1)
                objects.cloud.empty = state.cleanup_step == 2
                _hazard(state, -1, "MANUAL_CLEANUP", changes)
        "COOL":
            if state.event_id not in ["LESSON_HEAT_01", "FESTIVAL_LIGHTS_01"]:
                return "ACTION_NOT_AVAILABLE"
            var target: Dictionary = objects.vessel if state.event_id == "LESSON_HEAT_01" else objects.lamp
            if target.temperature not in ["hot", "overheated"]:
                return "NOT_TOO_HOT"
            target.temperature = "hot" if target.temperature == "overheated" else "warm"
        "LOCK":
            if state.event_id != "FESTIVAL_LIGHTS_01":
                return "ACTION_NOT_AVAILABLE"
            objects.latch.closed = true
        "PLACE":
            if state.event_id != "FESTIVAL_LIGHTS_01":
                return "ACTION_NOT_AVAILABLE"
            state.placement_step = mini(2, state.placement_step + 1)
            if state.placement_step == 2:
                objects.decorations.location_id = "stage"
    return ""

func _spell_consequences(state: Dictionary, assessment: Dictionary, changes: Array) -> void:
    if state.event_id == "LESSON_HEAT_01" and state.spell_state.objects.sample.get("damaged", false):
        _consequence(state, "SAMPLE_DAMAGED")
    if state.event_id == "GREENHOUSE_LEAK_01":
        if assessment.action == "TRANSPORT" and assessment.target_id == "cloud" and assessment.status == "VALID_CHANGE":
            _hazard(state, -2, "CLOUD_COLLECTED", changes)
        if "DAMAGE_RISK" in assessment.warnings:
            _hazard(state, 2, "HEAT_DAMAGE", changes)
            _consequence(state, "DEVICE_DAMAGED")
    if state.event_id == "FESTIVAL_LIGHTS_01":
        if assessment.action == "TRANSPORT" and assessment.target_id == "decorations" and assessment.status == "VALID_CHANGE":
            state.spell_state.objects.decorations.location_id = assessment.destination_id
        if "AUDIENCE_RISK" in assessment.warnings or "DAMAGE_RISK" in assessment.warnings or assessment.get("destination_id") == "audience":
            _consequence(state, "AUDIENCE_UNSAFE")
            state.outcome = "ASSISTED"

func _time_and_goal(state: Dictionary, action_start: int, changes: Array) -> void:
    var objects: Dictionary = state.spell_state.objects
    var solved := false
    match state.event_id:
        "LAB_SAMPLE_02":
            var protected: bool = objects.device.get("effects",{}).get("blocked",-1) > action_start
            if not objects.device.closed and not protected: _hazard(state,1,"LAB_LEAK_TIME",changes)
            state.hazard = clampi(state.hazard,0,6)
            solved = objects.device.closed
            if state.hazard == 6 and not solved:
                objects.device.closed = true
                _consequence(state,"LAB_INTERVENTION")
                if objects.sample.location_id != "safe": _consequence(state,"SAMPLE_PROCESS_INTERRUPTED")
                state.outcome = "ASSISTED"
        "LESSON_HEAT_01":
            solved = objects.vessel.temperature == "warm"
        "GREENHOUSE_LEAK_01":
            var effects: Dictionary = objects.leak.get("effects", {})
            var suppressed: bool = effects.get("blocked", -1) > action_start or effects.get("leak_suppressed", -1) > action_start
            if not objects.leak.closed and not suppressed:
                objects.cloud.empty = false
                state.cleanup_step = 0
                _hazard(state, 1, "LEAK_TIME", changes)
            solved = objects.leak.closed and objects.cloud.empty
            state.hazard = clampi(state.hazard, 0, 6)
            if state.hazard == 6:
                _consequence(state, "AREA_CLOSED")
                state.outcome = "ASSISTED"
        "FESTIVAL_LIGHTS_01":
            solved = objects.lamp.temperature == "warm" and objects.decorations.location_id == "stage" and objects.latch.closed
    if solved:
        state.outcome = "SOLVED"

func _hazard(state: Dictionary, delta: int, cause: String, changes: Array) -> void:
    state.hazard = maxi(0, state.hazard + delta)
    changes.append({"cause": cause, "delta": delta})

func _consequence(state: Dictionary, key: String) -> void:
    if key not in state.consequences:
        state.consequences.append(key)

func _object_changes(before: Dictionary, after: Dictionary) -> Array:
    var result: Array = []
    for id in after.spell_state.objects:
        var old: Dictionary = before.spell_state.objects[id]
        var current: Dictionary = after.spell_state.objects[id]
        for property in ["temperature", "closed", "empty", "damaged", "location_id", "redirected_to", "capture_load"]:
            if old.get(property) != current.get(property):
                result.append({"label": current.label, "property": property, "before": old.get(property), "after": current.get(property)})
        for effect in current.get("effects", {}):
            if old.get("effects", {}).get(effect) != current.effects[effect]:
                result.append({"label": current.label, "property": "effects." + effect,
                    "before": old.get("effects", {}).get(effect, 0), "after": current.effects[effect]})
    return result

func valid_state(state: Dictionary) -> bool:
    if not state.get("event_id") is String or not state.get("spell_state") is Dictionary:
        return false
    if not state.spell_state.get("attempt_id") is String:
        return false
    var template := start(state.event_id, state.spell_state.attempt_id)
    if template.is_empty() or not _shape(state, template):
        return false
    if state.outcome not in ["ONGOING", "SOLVED", "ASSISTED", "STOPPED"]:
        return false
    if state.schema != template.schema or state.spell_state.schema != template.spell_state.schema:
        return false
    for value in [state.hazard, state.cleanup_step, state.placement_step, state.spell_state.mana,
            state.spell_state.revision, state.spell_state.elapsed_actions]:
        if value < 0:
            return false
    if state.hazard > 6 or state.cleanup_step > 2 or state.placement_step > 2:
        return false
    for consequence in state.consequences:
        if not consequence is String:
            return false
    for collection in [state.receipts, state.spell_state.receipts]:
        for receipt in collection.values():
            if not receipt is Dictionary:
                return false
    for id in state.receipts:
        var receipt: Dictionary = state.receipts[id]
        if not valid_receipt(receipt) or receipt.identity.id != id or receipt.event_id != state.event_id or receipt.attempt_id != state.spell_state.attempt_id:
            return false
    for glyph in state.spell_state.learned:
        if glyph not in ["EMBER", "WIND", "WARD", "GATHER"]:
            return false
    for id in state.spell_state.objects:
        var object = state.spell_state.objects[id]
        if not object is Dictionary or object.get("id") != id or not object.get("label") is String:
            return false
        if object.has("capture_capacity"):
            if not object.capture_capacity is int or not object.get("capture_load") is int or object.capture_load < 0 or object.capture_load > object.capture_capacity:
                return false
        if object.has("temperature") and object.temperature not in Spell.TEMPERATURES:
            return false
        if object.has("effects"):
            if not object.effects is Dictionary:
                return false
            for expiry in object.effects.values():
                if not expiry is int or expiry < 0:
                    return false
    return true

func valid_receipt(receipt: Dictionary) -> bool:
    if not receipt.get("identity") is Dictionary or not _valid_command(receipt.identity):
        return false
    for key in ["event_id", "attempt_id", "outcome"]:
        if not receipt.get(key) is String:
            return false
    if receipt.outcome not in ["ONGOING", "SOLVED", "ASSISTED", "STOPPED"]:
        return false
    for key in ["hazard_before", "hazard_after", "mana_before", "mana_after", "actions_before", "actions_after"]:
        if not receipt.get(key) is int or receipt[key] < 0:
            return false
    if not receipt.get("assessment") is Dictionary or not receipt.get("changes") is Array or not receipt.get("consequences") is Array:
        return false
    for change in receipt.changes:
        if not change is Dictionary or not change.get("cause") is String or not change.get("delta") is int:
            return false
    for consequence in receipt.consequences:
        if not consequence is String:
            return false
    var object_changes = receipt.get("object_changes", [])
    if not object_changes is Array:
        return false
    for change in object_changes:
        if not change is Dictionary or not change.get("label") is String or not change.get("property") is String:
            return false
        for key in ["before", "after"]:
            if not change.has(key) or typeof(change[key]) not in [TYPE_NIL, TYPE_BOOL, TYPE_INT, TYPE_STRING]:
                return false
        if change.property.begins_with("effects.") and not change.after is int:
            return false
    return true

func _shape(value: Variant, template: Variant) -> bool:
    if typeof(value) != typeof(template):
        return false
    if template is Dictionary:
        for key in template:
            if not value.has(key) or not _shape(value[key], template[key]):
                return false
    return true

func _valid_command(command: Dictionary) -> bool:
    if not command.get("id") is String or command.id.is_empty() or command.get("kind") not in KINDS:
        return false
    if not command.get("expected_revision") is int or command.expected_revision < 0:
        return false
    if command.kind == "CAST":
        if not command.get("glyphs") is Array or not command.get("target_id") is String or not command.get("destination_id") is String:
            return false
        for glyph in command.glyphs:
            if not glyph is String:
                return false
    return true

func _reject(reason: String) -> Dictionary:
    return {"status": "REJECTED", "reason": reason, "cost": 0, "time": 0}

class_name StarCircuitCommitCoordinator
extends RefCounted

const SELF_PATH := "res://src/core/star/star_circuit_commit_coordinator.gd"
const GlyphResourceTypes = preload("res://src/core/resources/glyph_resource_types.gd")

var _state
var _validator
var _calculator
var _ledger
var _mana
var _service
var _request_script
var _plan: Dictionary = {}
var _committed_result: Dictionary = {}

static func create(state, validator, calculator, ledger, mana, service, request_script):
    if state == null or validator == null or calculator == null or ledger == null or mana == null or service == null or request_script == null:
        return null
    var requirements := [
        [state, &"set_circuit_draft"], [state, &"request_circuit_preview"],
        [state, &"select_target"], [state, &"request_final_preview"],
        [state, &"request_commit_confirmation"], [state, &"can_commit"],
        [state, &"mark_committed"], [validator, &"validate"],
        [calculator, &"preview"], [ledger, &"reserve_node"],
        [ledger, &"release_node"], [service, &"commit"],
    ]
    for requirement in requirements:
        if not requirement[0].has_method(requirement[1]):
            return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var coordinator = script.new()
    coordinator._state = state
    coordinator._validator = validator
    coordinator._calculator = calculator
    coordinator._ledger = ledger
    coordinator._mana = mana
    coordinator._service = service
    coordinator._request_script = request_script
    return coordinator

func prepare_circuit_preview(transaction_id: StringName, main: Dictionary, auxiliaries: Array) -> Dictionary:
    if transaction_id.is_empty():
        return {"status": &"INVALID_TRANSACTION"}
    var validation: Dictionary = _validator.validate(main, auxiliaries)
    if StringName(validation.get("status", &"")) != &"OK":
        return validation
    var preview: Dictionary = _calculator.preview(main, auxiliaries, {})
    var preview_contract := validation.duplicate(true)
    preview_contract["preview"] = preview.duplicate(true)
    if not _state.set_circuit_draft(main, auxiliaries):
        return {"status": &"CIRCUIT_DRAFT_REJECTED"}
    if not _state.request_circuit_preview(preview_contract):
        return {"status": &"CIRCUIT_PREVIEW_REJECTED"}
    _plan = {
        "transaction_id": transaction_id,
        "main": main.duplicate(true),
        "auxiliaries": auxiliaries.duplicate(true),
        "validation": validation.duplicate(true),
        "circuit_preview": preview.duplicate(true),
    }
    _committed_result.clear()
    return {
        "status": &"CIRCUIT_PREVIEW_READY",
        "validation": validation.duplicate(true),
        "preview": preview.duplicate(true),
    }

func select_target_and_prepare_final_preview(
    target_keyword: StringName,
    target: Dictionary,
    result_payload: Dictionary,
    conflict_penalty: float = 0.0,
    situation_modifier: float = 0.0,
    other_mana_rate: float = 0.0
) -> Dictionary:
    if _plan.is_empty() or not _state.select_target(target_keyword):
        return {"status": &"INVALID_TARGET"}
    var target_data: Dictionary = target.duplicate(true)
    target_data["keyword"] = target_keyword
    var preview: Dictionary = _calculator.preview(
        _plan.main, _plan.auxiliaries, target_data,
        conflict_penalty, situation_modifier, other_mana_rate
    )
    if not _state.request_final_preview(preview):
        return {"status": &"FINAL_PREVIEW_REJECTED"}
    _plan["target"] = target_data
    _plan["preview"] = preview.duplicate(true)
    var payload: Dictionary = result_payload.duplicate(true)
    payload["target_valid"] = true
    payload["target_keyword"] = target_keyword
    payload["success_percent"] = preview.success_percent
    _plan["result_payload"] = payload
    return {"status": &"FINAL_PREVIEW_READY", "preview": preview.duplicate(true)}

func request_confirmation() -> bool:
    return not _plan.is_empty() and _plan.has("preview") and _state.request_commit_confirmation()

func cancel_confirmation() -> bool:
    return _state.cancel_commit_confirmation()

func confirm_commit() -> Dictionary:
    if not _committed_result.is_empty():
        return _committed_result.duplicate(true)
    if _plan.is_empty() or not _state.can_commit():
        return {"status": &"COMMIT_CONFIRMATION_REQUIRED"}
    var transaction_id: StringName = StringName(_plan.transaction_id)
    var reserved_nodes: Array[StringName] = []
    var glyphs: Array = [_plan.main]
    glyphs.append_array(_plan.auxiliaries)
    for index in range(glyphs.size()):
        var glyph: Dictionary = glyphs[index]
        var node_id: StringName = &"main" if index == 0 else StringName("aux-%s" % glyph.get("slot", index - 1))
        var source: int = _source_value(StringName(glyph.get("source", &"")))
        if source < 0:
            _release_nodes(reserved_nodes)
            return {"status": &"SOURCE_SELECTION_REQUIRED"}
        var reservation: Dictionary = _ledger.reserve_node(
            node_id, StringName(glyph.get("glyph_id", &"")), source, transaction_id, true
        )
        if StringName(reservation.get("status", &"")) != &"OK":
            _release_nodes(reserved_nodes)
            return {"status": reservation.get("status", &"RESERVATION_FAILED"), "node_id": node_id}
        reserved_nodes.append(node_id)
    var request = _request_script.create(
        transaction_id, int(_plan.preview.final_mana), Dictionary(_plan.result_payload).duplicate(true)
    )
    if request == null:
        _release_nodes(reserved_nodes)
        return {"status": &"INVALID_COMMIT_REQUEST"}
    var result: Dictionary = _service.commit(request, _ledger, _mana)
    if StringName(result.get("status", &"")) != &"COMMITTED":
        _release_nodes(reserved_nodes)
        return result
    _state.mark_committed(result)
    _committed_result = result.duplicate(true)
    return _committed_result.duplicate(true)

func _source_value(source_name: StringName) -> int:
    if source_name == &"VAULT":
        return GlyphResourceTypes.Source.VAULT
    if source_name == &"STOCK":
        return GlyphResourceTypes.Source.UNIVERSAL_STOCK
    return -1

func _release_nodes(node_ids: Array[StringName]) -> void:
    for node_id in node_ids:
        _ledger.release_node(node_id)

class_name Stage2CommitCoordinator
extends RefCounted

const SELF_PATH := "res://src/core/stage2/stage2_commit_coordinator.gd"
const GlyphResourceTypes = preload("res://src/core/resources/glyph_resource_types.gd")

var _state = null
var _validator = null
var _ledger = null
var _mana = null
var _service = null
var _request_script = null
var _recorder = null
var _plan: Dictionary = {}
var _committed_result: Dictionary = {}


static func create(state, validator, ledger, mana, service, request_script):
    if state == null or validator == null or ledger == null or mana == null or service == null or request_script == null:
        return null
    var required := [
        [state, &"set_circuit_draft"],
        [state, &"request_preview"],
        [state, &"request_commit_confirmation"],
        [state, &"can_commit"],
        [validator, &"validate"],
        [ledger, &"reserve_node"],
        [ledger, &"release_node"],
        [service, &"commit"],
    ]
    for requirement in required:
        if not requirement[0].has_method(requirement[1]):
            return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var coordinator = script.new()
    coordinator._state = state
    coordinator._validator = validator
    coordinator._ledger = ledger
    coordinator._mana = mana
    coordinator._service = service
    coordinator._request_script = request_script
    return coordinator


func attach_event_recorder(recorder) -> bool:
    if recorder == null or not recorder.has_method(&"record"):
        return false
    _recorder = recorder
    return true


func prepare_preview(
    transaction_id: StringName,
    nodes: Array,
    edges: Array,
    mana_cost: int,
    result_payload: Dictionary
) -> Dictionary:
    if transaction_id.is_empty() or mana_cost < 0:
        return {"status": &"INVALID_PREVIEW_REQUEST"}
    var validation: Dictionary = _validator.validate(nodes, edges)
    if validation.get("status", &"") != &"OK":
        return {
            "status": validation.get("status", &"INVALID_CIRCUIT"),
            "validation": validation,
        }
    if not bool(result_payload.get("target_valid", false)):
        return {"status": &"INVALID_TARGET"}

    for node_variant in nodes:
        var node: Dictionary = node_variant
        var kind := StringName(node.get("kind", &""))
        if kind not in [&"MAIN", &"SUPPORT"]:
            continue
        _state.set_glyph_source(
            StringName(node.get("id", &"")),
            StringName(node.get("glyph_id", &"")),
            StringName(node.get("source", &""))
        )
    if not _state.set_circuit_draft(nodes, edges):
        return {"status": &"CIRCUIT_DRAFT_REJECTED"}
    if not _state.request_preview({"valid": true, "validation": validation}):
        return {"status": &"PREVIEW_STATE_REJECTED"}

    _plan = {
        "transaction_id": transaction_id,
        "nodes": nodes.duplicate(true),
        "edges": edges.duplicate(true),
        "mana_cost": mana_cost,
        "result_payload": result_payload.duplicate(true),
        "validation": validation.duplicate(true),
    }
    _committed_result.clear()
    _record_core_event(&"preview", {
        "state": &"PREVIEW_READY",
        "mana_cost": mana_cost,
        "node_count": nodes.size(),
        "edge_count": edges.size(),
    })
    return {
        "status": &"PREVIEW_READY",
        "transaction_id": transaction_id,
        "mana_cost": mana_cost,
        "result_payload": result_payload.duplicate(true),
        "validation": validation.duplicate(true),
    }


func request_confirmation() -> bool:
    var accepted: bool = not _plan.is_empty() and _state.request_commit_confirmation()
    if accepted:
        _record_core_event(&"confirm", {"state": &"COMMIT_CONFIRM"})
    return accepted


func cancel_confirmation() -> bool:
    var cancelled: bool = _state.cancel_commit_confirmation()
    if cancelled:
        _record_core_event(&"cancel", {"state": &"PREVIEW_READY", "mutation": 0})
    return cancelled


func confirm_commit() -> Dictionary:
    if not _committed_result.is_empty():
        return _committed_result.duplicate(true)
    if _plan.is_empty() or not _state.can_commit():
        return {"status": &"COMMIT_CONFIRMATION_REQUIRED"}

    var transaction_id := StringName(_plan.get("transaction_id", &""))
    var reserved_nodes: Array[StringName] = []
    for node_variant in _plan.get("nodes", []):
        var node: Dictionary = node_variant
        var kind := StringName(node.get("kind", &""))
        if kind not in [&"MAIN", &"SUPPORT"]:
            continue
        var node_id := StringName(node.get("id", &""))
        var source_name := StringName(node.get("source", &""))
        var source := _source_value(source_name)
        if source < 0:
            _release_nodes(reserved_nodes)
            return {"status": &"SOURCE_SELECTION_REQUIRED"}
        var reserved: Dictionary = _ledger.reserve_node(
            node_id,
            StringName(node.get("glyph_id", &"")),
            source,
            transaction_id,
            true
        )
        if reserved.get("status", &"") != &"OK":
            _release_nodes(reserved_nodes)
            return {
                "status": reserved.get("status", &"RESERVATION_FAILED"),
                "node_id": node_id,
            }
        reserved_nodes.append(node_id)

    var request = _request_script.create(
        transaction_id,
        int(_plan.get("mana_cost", 0)),
        Dictionary(_plan.get("result_payload", {})).duplicate(true)
    )
    if request == null:
        _release_nodes(reserved_nodes)
        return {"status": &"INVALID_COMMIT_REQUEST"}

    var result: Dictionary = _service.commit(request, _ledger, _mana)
    if result.get("status", &"") != &"COMMITTED":
        _release_nodes(reserved_nodes)
        _record_core_event(&"commit_failed", {
            "state": &"COMMIT_CONFIRM",
            "status": result.get("status", &"UNKNOWN"),
        })
        return result

    _state.transition_to(_state.State.SYSTEM_RESOLVE)
    _committed_result = result.duplicate(true)
    _record_core_event(&"commit", {
        "state": &"SYSTEM_RESOLVE",
        "status": &"COMMITTED",
    })
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


func _record_core_event(suffix: StringName, payload: Dictionary) -> void:
    if _recorder == null or _plan.is_empty():
        return
    var transaction_id := StringName(_plan.get("transaction_id", &""))
    if transaction_id.is_empty():
        return
    var event_id := StringName("%s:%s" % [String(transaction_id), String(suffix)])
    var event := payload.duplicate(true)
    event["transaction_id"] = transaction_id
    _recorder.record(&"CORE_LOOP_EVENT_STREAM", event_id, event)

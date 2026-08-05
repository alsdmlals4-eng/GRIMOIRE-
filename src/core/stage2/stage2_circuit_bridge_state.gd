class_name Stage2CircuitBridgeState
extends RefCounted


enum State {
    SCENARIO_BRIEF,
    INTENT_AND_SOURCE_SELECT,
    WRITING_FOCUS,
    CIRCUIT_EDIT,
    PREVIEW_READY,
    COMMIT_CONFIRM,
    SYSTEM_RESOLVE,
    RESULT_EXPLAIN,
    ERROR_SAFE_RECOVERY,
}


var _state: State = State.SCENARIO_BRIEF
var _scenario: Dictionary = {}
var _intent: StringName = &""
var _glyph_sources: Dictionary = {}
var _circuit_nodes: Array = []
var _circuit_edges: Array = []
var _recognition_retry_reason: StringName = &""
var _hard_stop_reason: StringName = &""
var _writing_return_state: State = State.INTENT_AND_SOURCE_SELECT


func current_state() -> State:
    return _state


func configure_scenario(fixture: Dictionary) -> bool:
    if _state != State.SCENARIO_BRIEF or not _hard_stop_reason.is_empty():
        return false
    for key in [&"fixture_id", &"objective", &"threat", &"situation", &"targets"]:
        if not fixture.has(key):
            return false
    var targets: Variant = fixture.get("targets")
    if typeof(targets) != TYPE_ARRAY or targets.is_empty() or targets.size() > 4:
        return false
    _scenario = fixture.duplicate(true)
    return true


func transition_to(next_state: State) -> bool:
    if not _hard_stop_reason.is_empty():
        return false
    if not _transition_allowed(_state, next_state):
        return false
    _state = next_state
    return true


func select_intent(intent: StringName) -> bool:
    if _state != State.INTENT_AND_SOURCE_SELECT or intent.is_empty():
        return false
    _intent = intent
    return true


func set_glyph_source(slot_id: StringName, glyph_id: StringName, source: StringName) -> bool:
    if slot_id.is_empty() or glyph_id.is_empty() or source not in [&"VAULT", &"STOCK"]:
        return false
    _glyph_sources[slot_id] = {
        "glyph_id": glyph_id,
        "source": source,
    }
    return true


func set_circuit_draft(nodes: Array, edges: Array) -> bool:
    if nodes.is_empty():
        return false
    _circuit_nodes = nodes.duplicate(true)
    _circuit_edges = edges.duplicate(true)
    return true


func begin_writing() -> bool:
    if _state not in [State.INTENT_AND_SOURCE_SELECT, State.CIRCUIT_EDIT]:
        return false
    _writing_return_state = _state
    _state = State.WRITING_FOCUS
    return true


func active_stroke_owner_is_writing_canvas() -> bool:
    return _state == State.WRITING_FOCUS


func mark_recognition_retry(reason: StringName) -> bool:
    if _state != State.WRITING_FOCUS or reason.is_empty():
        return false
    _recognition_retry_reason = reason
    return true


func end_writing() -> bool:
    if _state != State.WRITING_FOCUS:
        return false
    _state = _writing_return_state
    return true


func request_preview(validation: Dictionary) -> bool:
    if _state not in [State.INTENT_AND_SOURCE_SELECT, State.CIRCUIT_EDIT]:
        return false
    if not bool(validation.get("valid", false)):
        return false
    if _scenario.is_empty() or _intent.is_empty() or _circuit_nodes.is_empty():
        return false
    _state = State.PREVIEW_READY
    return true


func request_commit_confirmation() -> bool:
    if _state != State.PREVIEW_READY or not _hard_stop_reason.is_empty():
        return false
    _state = State.COMMIT_CONFIRM
    return true


func cancel_commit_confirmation() -> bool:
    if _state != State.COMMIT_CONFIRM:
        return false
    _state = State.PREVIEW_READY
    return true


func can_commit() -> bool:
    return _state == State.COMMIT_CONFIRM and _hard_stop_reason.is_empty()


func raise_hard_stop(reason: StringName) -> bool:
    if reason.is_empty():
        return false
    _hard_stop_reason = reason
    return true


func hard_stop_reason() -> StringName:
    return _hard_stop_reason


func context_snapshot() -> Dictionary:
    return {
        "scenario": _scenario.duplicate(true),
        "targets": Array(_scenario.get("targets", [])).duplicate(true),
        "intent": _intent,
        "glyph_sources": _glyph_sources.duplicate(true),
        "circuit_nodes": _circuit_nodes.duplicate(true),
        "circuit_edges": _circuit_edges.duplicate(true),
        "recognition_retry_reason": _recognition_retry_reason,
    }


func _transition_allowed(from_state: State, to_state: State) -> bool:
    match from_state:
        State.SCENARIO_BRIEF:
            return to_state == State.INTENT_AND_SOURCE_SELECT and not _scenario.is_empty()
        State.INTENT_AND_SOURCE_SELECT:
            return to_state in [State.WRITING_FOCUS, State.CIRCUIT_EDIT]
        State.WRITING_FOCUS:
            return to_state in [State.INTENT_AND_SOURCE_SELECT, State.CIRCUIT_EDIT, State.ERROR_SAFE_RECOVERY]
        State.CIRCUIT_EDIT:
            return to_state in [State.WRITING_FOCUS, State.PREVIEW_READY, State.ERROR_SAFE_RECOVERY]
        State.PREVIEW_READY:
            return to_state in [State.CIRCUIT_EDIT, State.COMMIT_CONFIRM, State.ERROR_SAFE_RECOVERY]
        State.COMMIT_CONFIRM:
            return to_state in [State.PREVIEW_READY, State.SYSTEM_RESOLVE, State.ERROR_SAFE_RECOVERY]
        State.SYSTEM_RESOLVE:
            return to_state in [State.RESULT_EXPLAIN, State.ERROR_SAFE_RECOVERY]
        State.RESULT_EXPLAIN:
            return to_state == State.SCENARIO_BRIEF
        State.ERROR_SAFE_RECOVERY:
            return to_state in [State.INTENT_AND_SOURCE_SELECT, State.WRITING_FOCUS, State.CIRCUIT_EDIT, State.PREVIEW_READY]
    return false

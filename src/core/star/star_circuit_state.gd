class_name StarCircuitState
extends RefCounted

enum State {
    SCENARIO_BRIEF,
    CIRCUIT_EDIT,
    CIRCUIT_PREVIEW,
    TARGET_SELECT,
    FINAL_PREVIEW,
    COMMIT_CONFIRM,
    SYSTEM_RESOLVE,
    RESULT_EXPLAIN,
    ERROR_SAFE_RECOVERY,
}

var _state: State = State.SCENARIO_BRIEF
var _scenario: Dictionary = {}
var _main: Dictionary = {}
var _auxiliaries: Array = []
var _circuit_preview: Dictionary = {}
var _target_keyword: StringName = &""
var _final_preview: Dictionary = {}
var _committed_result: Dictionary = {}

func current_state() -> State:
    return _state

func configure_scenario(fixture: Dictionary) -> bool:
    if _state != State.SCENARIO_BRIEF:
        return false
    for key in [&"fixture_id", &"objective", &"threat", &"situation", &"target_keywords"]:
        if not fixture.has(key):
            return false
    var targets: Variant = fixture.get("target_keywords")
    if typeof(targets) != TYPE_ARRAY or targets.is_empty():
        return false
    _scenario = fixture.duplicate(true)
    return true

func transition_to(next_state: State) -> bool:
    if _state == State.SCENARIO_BRIEF and next_state == State.CIRCUIT_EDIT and not _scenario.is_empty():
        _state = next_state
        return true
    if _state == State.SYSTEM_RESOLVE and next_state == State.RESULT_EXPLAIN:
        _state = next_state
        return true
    if next_state == State.ERROR_SAFE_RECOVERY:
        _state = next_state
        return true
    return false

func set_circuit_draft(main: Dictionary, auxiliaries: Array) -> bool:
    if _state != State.CIRCUIT_EDIT or main.is_empty() or auxiliaries.size() > 5:
        return false
    _main = main.duplicate(true)
    _auxiliaries = auxiliaries.duplicate(true)
    _target_keyword = &""
    _final_preview.clear()
    return true

func request_circuit_preview(validation: Dictionary) -> bool:
    if _state != State.CIRCUIT_EDIT or _main.is_empty():
        return false
    if not bool(validation.get("valid", validation.get("status", &"") == &"OK")):
        return false
    _circuit_preview = validation.duplicate(true)
    _state = State.TARGET_SELECT
    return true

func select_target(keyword: StringName) -> bool:
    if _state != State.TARGET_SELECT or keyword.is_empty():
        return false
    var options: Array = _scenario.get("target_keywords", [])
    if keyword not in options:
        return false
    _target_keyword = keyword
    return true

func request_final_preview(preview: Dictionary) -> bool:
    if _state != State.TARGET_SELECT or _target_keyword.is_empty():
        return false
    if not preview.has("success_percent") or not preview.has("final_mana"):
        return false
    _final_preview = preview.duplicate(true)
    _state = State.FINAL_PREVIEW
    return true

func request_commit_confirmation() -> bool:
    if _state != State.FINAL_PREVIEW or _final_preview.is_empty():
        return false
    _state = State.COMMIT_CONFIRM
    return true

func cancel_commit_confirmation() -> bool:
    if _state != State.COMMIT_CONFIRM:
        return false
    _state = State.FINAL_PREVIEW
    return true

func can_commit() -> bool:
    return _state == State.COMMIT_CONFIRM and not _target_keyword.is_empty() and not _final_preview.is_empty()

func mark_committed(result: Dictionary) -> bool:
    if not can_commit() or StringName(result.get("status", &"")) != &"COMMITTED":
        return false
    _committed_result = result.duplicate(true)
    _state = State.SYSTEM_RESOLVE
    return true

func context_snapshot() -> Dictionary:
    return {
        "state": _state,
        "scenario": _scenario.duplicate(true),
        "main": _main.duplicate(true),
        "auxiliaries": _auxiliaries.duplicate(true),
        "circuit_preview": _circuit_preview.duplicate(true),
        "target_keyword": _target_keyword,
        "final_preview": _final_preview.duplicate(true),
        "committed_result": _committed_result.duplicate(true),
    }

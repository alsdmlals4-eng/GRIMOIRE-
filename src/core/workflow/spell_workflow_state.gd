# v2 세 단계 주문 흐름의 대상·확인·해결 전이를 독립적으로 관리한다.
class_name SpellWorkflowState
extends RefCounted

enum State {
	INCIDENT_BRIEF,
	GLYPH_DRAWING,
	CIRCUIT_EDIT,
	CIRCUIT_PREVIEW,
	SPELL_READY,
	SPELL_USE_TARGET,
	SPELL_USE_PREVIEW,
	SPELL_USE_CONFIRM,
	SYSTEM_RESOLVE,
	RESULT_EXPLAIN,
	INCIDENT_OVERLAY,
}

var _state: State = State.INCIDENT_BRIEF
var _overlay_return_state: State = State.INCIDENT_BRIEF
var _selected_spell_id: StringName = &""
var _target_keyword: StringName = &""
var _final_preview: Dictionary = {}


func current_state() -> State:
	return _state


func begin_glyph_drawing() -> bool:
	return _transition(State.INCIDENT_BRIEF, State.GLYPH_DRAWING)


func begin_circuit_edit() -> bool:
	return _transition(State.GLYPH_DRAWING, State.CIRCUIT_EDIT)


func show_circuit_preview() -> bool:
	return _transition(State.CIRCUIT_EDIT, State.CIRCUIT_PREVIEW)


func mark_spell_ready() -> bool:
	return _transition(State.CIRCUIT_PREVIEW, State.SPELL_READY)


func select_prepared_spell(spell_id: StringName) -> bool:
	if _state != State.SPELL_READY or spell_id.is_empty():
		return false
	_selected_spell_id = spell_id
	_target_keyword = &""
	_final_preview.clear()
	_state = State.SPELL_USE_TARGET
	return true


func select_target(target_keyword: StringName) -> bool:
	if _state != State.SPELL_USE_TARGET or target_keyword.is_empty():
		return false
	_target_keyword = target_keyword
	_final_preview.clear()
	return true


func show_final_preview(preview: Dictionary) -> bool:
	if _state != State.SPELL_USE_TARGET or _target_keyword.is_empty():
		return false
	if not preview.has("success_percent") or not preview.has("final_mana"):
		return false
	_final_preview = preview.duplicate(true)
	_state = State.SPELL_USE_PREVIEW
	return true


func request_use_confirmation() -> bool:
	return _transition(State.SPELL_USE_PREVIEW, State.SPELL_USE_CONFIRM)


func can_confirm_use() -> bool:
	return _state == State.SPELL_USE_CONFIRM and not _selected_spell_id.is_empty() and not _target_keyword.is_empty() and not _final_preview.is_empty()


func begin_system_resolution() -> bool:
	if not can_confirm_use():
		return false
	_state = State.SYSTEM_RESOLVE
	return true


func show_result_explanation() -> bool:
	return _transition(State.SYSTEM_RESOLVE, State.RESULT_EXPLAIN)


func open_incident_overlay() -> bool:
	if _state == State.SYSTEM_RESOLVE or _state == State.INCIDENT_OVERLAY:
		return false
	_overlay_return_state = _state
	_state = State.INCIDENT_OVERLAY
	return true


func close_incident_overlay() -> bool:
	if _state != State.INCIDENT_OVERLAY:
		return false
	_state = _overlay_return_state
	return true


func selected_spell_id() -> StringName:
	return _selected_spell_id


func target_keyword() -> StringName:
	return _target_keyword


func final_preview() -> Dictionary:
	return _final_preview.duplicate(true)


func _transition(expected: State, next_state: State) -> bool:
	if _state != expected:
		return false
	_state = next_state
	return true

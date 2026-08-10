# Stage 3 주문 사용의 불변 입력과 대상·최종 Preview 결속을 보관한다.
class_name SpellUseRequest
extends RefCounted

const SELF_PATH := "res://src/core/spells/spell_use_request.gd"

var _use_transaction_id: StringName
var _spell_id: StringName
var _target_keyword: StringName
var _final_preview: Dictionary = {}
var _result_payload: Dictionary = {}


static func create(
	use_transaction_id: StringName,
	spell_id: StringName,
	target_keyword: StringName,
	final_preview: Dictionary,
	result_payload: Dictionary
):
	if use_transaction_id.is_empty() or spell_id.is_empty() or target_keyword.is_empty():
		return null
	if not final_preview.has("success_percent") or not final_preview.has("final_mana"):
		return null
	if int(final_preview.get("final_mana", -1)) < 0:
		return null
	if not result_payload.has("target_valid") or typeof(result_payload.get("target_valid")) != TYPE_BOOL:
		return null
	var script = load(SELF_PATH)
	if script == null or not script.can_instantiate():
		return null
	var request = script.new()
	request._use_transaction_id = use_transaction_id
	request._spell_id = spell_id
	request._target_keyword = target_keyword
	request._final_preview = final_preview.duplicate(true)
	request._result_payload = result_payload.duplicate(true)
	return request


func use_transaction_id() -> StringName:
	return _use_transaction_id


func spell_id() -> StringName:
	return _spell_id


func target_keyword() -> StringName:
	return _target_keyword


func final_preview() -> Dictionary:
	return _final_preview.duplicate(true)


func result_payload() -> Dictionary:
	return _result_payload.duplicate(true)

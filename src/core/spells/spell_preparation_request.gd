# Stage 2 준비 요청의 불변 입력과 별형 초안 유효성을 보관한다.
class_name SpellPreparationRequest
extends RefCounted

const SELF_PATH := "res://src/core/spells/spell_preparation_request.gd"

var _transaction_id: StringName
var _spell_id: StringName
var _draft: Dictionary = {}
var _base_preview: Dictionary = {}


static func create(transaction_id: StringName, spell_id: StringName, draft: Dictionary, base_preview: Dictionary):
	if transaction_id.is_empty() or spell_id.is_empty():
		return null
	if not _valid_draft(draft):
		return null
	if not base_preview.has("success_percent") or not base_preview.has("final_mana"):
		return null
	var script = load(SELF_PATH)
	if script == null or not script.can_instantiate():
		return null
	var request = script.new()
	request._transaction_id = transaction_id
	request._spell_id = spell_id
	request._draft = draft.duplicate(true)
	request._base_preview = base_preview.duplicate(true)
	return request


func transaction_id() -> StringName:
	return _transaction_id


func spell_id() -> StringName:
	return _spell_id


func draft() -> Dictionary:
	return _draft.duplicate(true)


func base_preview() -> Dictionary:
	return _base_preview.duplicate(true)


static func _valid_draft(draft: Dictionary) -> bool:
	if not draft.has("layout") or StringName(draft.get("layout", &"")) != &"FIVE_POINT_STAR":
		return false
	if typeof(draft.get("main", null)) != TYPE_DICTIONARY:
		return false
	var main: Dictionary = draft.get("main", {})
	if StringName(main.get("glyph_id", &"")).is_empty():
		return false
	if typeof(draft.get("auxiliaries", null)) != TYPE_ARRAY:
		return false
	if Array(draft.get("auxiliaries", [])).size() > 5:
		return false
	var seen_slots: Dictionary = {}
	for auxiliary_variant in Array(draft.get("auxiliaries", [])):
		if typeof(auxiliary_variant) != TYPE_DICTIONARY:
			return false
		var auxiliary: Dictionary = Dictionary(auxiliary_variant)
		if StringName(auxiliary.get("glyph_id", &"")).is_empty():
			return false
		if typeof(auxiliary.get("slot", null)) != TYPE_INT:
			return false
		var slot: int = int(auxiliary.get("slot", -1))
		if slot < 0 or slot > 4 or seen_slots.has(slot):
			return false
		seen_slots[slot] = true
	if typeof(draft.get("reservation_records", null)) != TYPE_ARRAY:
		return false
	return true

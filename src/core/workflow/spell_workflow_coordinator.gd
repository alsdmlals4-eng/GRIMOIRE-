# v2 주문 흐름의 Stage 2 준비와 Stage 3 대상·사용을 분리 조정한다.
class_name SpellWorkflowCoordinator
extends RefCounted

const SELF_PATH := "res://src/core/workflow/spell_workflow_coordinator.gd"

var _state
var _validator
var _calculator
var _preparation_service
var _preparation_request_script
var _use_service
var _use_request_script
var _ledger
var _inventory
var _mana
var _result_ledger
var _preparation_transaction_id: StringName = &""
var _draft: Dictionary = {}
var _base_preview: Dictionary = {}
var _selected_spell: Dictionary = {}
var _use_plan: Dictionary = {}
var _use_results: Dictionary = {}


static func create(state, validator, calculator, preparation_service, preparation_request_script, use_service, use_request_script, ledger, inventory, mana, result_ledger):
	var required := [
		[state, &"begin_glyph_drawing"], [state, &"begin_circuit_edit"], [state, &"show_circuit_preview"],
		[state, &"mark_spell_ready"], [state, &"select_prepared_spell"], [state, &"select_target"],
		[state, &"show_final_preview"], [state, &"request_use_confirmation"], [state, &"can_confirm_use"],
		[state, &"begin_system_resolution"], [validator, &"validate"], [calculator, &"preview"],
		[inventory, &"spell"], [mana, &"current"], [result_ledger, &"serialize"],
	]
	for requirement in required:
		if requirement[0] == null or not requirement[0].has_method(requirement[1]):
			return null
	if preparation_service == null or preparation_request_script == null or use_service == null or use_request_script == null or ledger == null:
		return null
	var script = load(SELF_PATH)
	if script == null or not script.can_instantiate():
		return null
	var coordinator = script.new()
	coordinator._state = state
	coordinator._validator = validator
	coordinator._calculator = calculator
	coordinator._preparation_service = preparation_service
	coordinator._preparation_request_script = preparation_request_script
	coordinator._use_service = use_service
	coordinator._use_request_script = use_request_script
	coordinator._ledger = ledger
	coordinator._inventory = inventory
	coordinator._mana = mana
	coordinator._result_ledger = result_ledger
	return coordinator


func configure_preparation(preparation_transaction_id: StringName, draft: Dictionary) -> bool:
	if preparation_transaction_id.is_empty() or draft.is_empty():
		return false
	if not _state.begin_glyph_drawing() or not _state.begin_circuit_edit():
		return false
	_preparation_transaction_id = preparation_transaction_id
	_draft = draft.duplicate(true)
	_base_preview.clear()
	_selected_spell.clear()
	_use_plan.clear()
	return true


func prepare_preview() -> Dictionary:
	if _preparation_transaction_id.is_empty() or _draft.is_empty():
		return {"status": &"PREPARATION_REQUIRED"}
	var main: Dictionary = _as_validator_glyph(Dictionary(_draft.get("main", {})))
	var auxiliaries: Array = []
	for auxiliary_variant in Array(_draft.get("auxiliaries", [])):
		auxiliaries.append(_as_validator_glyph(Dictionary(auxiliary_variant)))
	var validation: Dictionary = _validator.validate(main, auxiliaries)
	if StringName(validation.get("status", &"")) != &"OK":
		return validation
	var preview: Dictionary = _calculator.preview(main, auxiliaries, {})
	if not _state.show_circuit_preview():
		return {"status": &"CIRCUIT_PREVIEW_REJECTED"}
	_base_preview = preview.duplicate(true)
	return {"status": &"CIRCUIT_PREVIEW_READY", "validation": validation.duplicate(true), "preview": preview.duplicate(true)}


func confirm_preparation(spell_id: StringName) -> Dictionary:
	if spell_id.is_empty() or _base_preview.is_empty():
		return {"status": &"PREPARATION_PREVIEW_REQUIRED"}
	var request = _preparation_request_script.create(_preparation_transaction_id, spell_id, _draft, _base_preview)
	if request == null:
		return {"status": &"INVALID_PREPARATION_REQUEST"}
	var result: Dictionary = _preparation_service.prepare(request, _ledger, _inventory)
	if StringName(result.get("status", &"")) == &"PREPARED" and not _state.mark_spell_ready():
		return {"status": &"SPELL_READY_REJECTED"}
	return result.duplicate(true)


func select_prepared_spell(spell_id: StringName) -> bool:
	var spell: Dictionary = _inventory.spell(spell_id)
	if StringName(spell.get("status", &"")) != &"READY":
		return false
	if not _state.select_prepared_spell(spell_id):
		return false
	_selected_spell = spell.duplicate(true)
	_use_plan.clear()
	return true


func prepare_target_preview(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> Dictionary:
	if _selected_spell.is_empty() or target_keyword.is_empty():
		return {"status": &"SPELL_SELECTION_REQUIRED"}
	if not bool(target.get("target_valid", false)):
		return {"status": &"INVALID_TARGET"}
	if not _state.select_target(target_keyword):
		return {"status": &"INVALID_TARGET"}
	var target_data: Dictionary = target.duplicate(true)
	target_data["keyword"] = target_keyword
	var preview: Dictionary = _calculator.preview(
		Dictionary(_selected_spell.get("main", {})),
		Array(_selected_spell.get("auxiliaries", [])),
		target_data
	)
	if not _state.show_final_preview(preview):
		return {"status": &"FINAL_PREVIEW_REJECTED"}
	var result_payload: Dictionary = payload.duplicate(true)
	result_payload["target_valid"] = true
	result_payload["target_keyword"] = target_keyword
	result_payload["success_percent"] = preview.get("success_percent", 0)
	_use_plan = {
		"target_keyword": target_keyword,
		"final_preview": preview.duplicate(true),
		"result_payload": result_payload.duplicate(true),
	}
	return {"status": &"FINAL_PREVIEW_READY", "preview": preview.duplicate(true)}


func request_use_confirmation() -> bool:
	return not _use_plan.is_empty() and _state.request_use_confirmation()


func confirm_use(use_transaction_id: StringName) -> Dictionary:
	if _use_results.has(String(use_transaction_id)):
		return Dictionary(_use_results[String(use_transaction_id)]).duplicate(true)
	if use_transaction_id.is_empty() or _selected_spell.is_empty() or _use_plan.is_empty() or not _state.can_confirm_use():
		return {"status": &"USE_CONFIRMATION_REQUIRED"}
	var request = _use_request_script.create(
		use_transaction_id,
		StringName(_selected_spell.get("spell_id", &"")),
		StringName(_use_plan.get("target_keyword", &"")),
		Dictionary(_use_plan.get("final_preview", {})),
		Dictionary(_use_plan.get("result_payload", {}))
	)
	if request == null:
		return {"status": &"INVALID_USE_REQUEST"}
	var result: Dictionary = _use_service.use(request, _inventory, _mana, _result_ledger)
	if StringName(result.get("status", &"")) != &"USED":
		return result
	if not _state.begin_system_resolution():
		return {"status": &"SYSTEM_RESOLUTION_REJECTED"}
	_use_results[String(use_transaction_id)] = result.duplicate(true)
	return result.duplicate(true)


func _as_validator_glyph(glyph: Dictionary) -> Dictionary:
	var validated: Dictionary = glyph.duplicate(true)
	var source: Variant = validated.get("source", null)
	if typeof(source) == TYPE_INT:
		validated["source"] = &"VAULT" if int(source) == 1 else &"STOCK" if int(source) == 0 else &""
	return validated

# Stage 3 Mana·PreparedSpell·결과를 하나의 정확히 한 번 원자 거래로 처리한다.
class_name AtomicSpellUseService
extends RefCounted


static func use(request, inventory, mana_pool, result_ledger) -> Dictionary:
	if not _valid_dependencies(request, inventory, mana_pool, result_ledger):
		return {"status": &"INVALID_REQUEST"}

	var use_transaction_id: StringName = request.use_transaction_id()
	var spell_id: StringName = request.spell_id()
	var prior := _prior_result(use_transaction_id, spell_id, request, inventory, result_ledger)
	if not prior.is_empty():
		return prior

	var spell: Dictionary = inventory.spell(spell_id)
	if spell.is_empty():
		return {"status": &"SPELL_NOT_FOUND"}
	if StringName(spell.get("status", &"")) != &"READY":
		return {"status": &"SPELL_ALREADY_USED"}
	var payload: Dictionary = request.result_payload()
	if not bool(payload.get("target_valid", false)) or request.target_keyword().is_empty():
		return {"status": &"INVALID_TARGET"}
	var final_preview: Dictionary = request.final_preview()
	var final_mana: int = int(final_preview.get("final_mana", -1))
	if final_mana < 0:
		return {"status": &"INVALID_REQUEST"}
	if not mana_pool.can_spend(final_mana):
		return {"status": &"INSUFFICIENT_MANA"}
	payload["final_mana"] = final_mana

	var inventory_snapshot: Dictionary = inventory.serialize()
	var mana_snapshot: Dictionary = mana_pool.to_dict()
	var result_snapshot: Dictionary = result_ledger.serialize()
	if not mana_pool.spend(final_mana):
		return _rollback(inventory, mana_pool, result_ledger, inventory_snapshot, mana_snapshot, result_snapshot, &"INSUFFICIENT_MANA")
	var marked: Dictionary = inventory.mark_used_once(spell_id, use_transaction_id)
	if not bool(marked.get("ok", false)):
		return _rollback(inventory, mana_pool, result_ledger, inventory_snapshot, mana_snapshot, result_snapshot, StringName(marked.get("code", &"SPELL_USE_FAILED")))

	var committed: Dictionary = result_ledger.commit_once(use_transaction_id, payload)
	if not bool(committed.get("applied", false)):
		return _rollback(inventory, mana_pool, result_ledger, inventory_snapshot, mana_snapshot, result_snapshot, &"RESULT_COMMIT_FAILED")
	return _success(use_transaction_id, spell_id, final_mana, Dictionary(committed.get("result", {})))


static func _valid_dependencies(request, inventory, mana_pool, result_ledger) -> bool:
	if request == null or inventory == null or mana_pool == null or result_ledger == null:
		return false
	for method_name in [&"use_transaction_id", &"spell_id", &"target_keyword", &"final_preview", &"result_payload"]:
		if not request.has_method(method_name):
			return false
	for method_name in [&"spell", &"serialize", &"restore", &"mark_used_once"]:
		if not inventory.has_method(method_name):
			return false
	for method_name in [&"can_spend", &"spend", &"to_dict", &"restore_state"]:
		if not mana_pool.has_method(method_name):
			return false
	for method_name in [&"commit_once", &"serialize", &"restore"]:
		if not result_ledger.has_method(method_name):
			return false
	return true


static func _prior_result(use_transaction_id: StringName, spell_id: StringName, request, inventory, result_ledger) -> Dictionary:
	for record_variant in Array(inventory.serialize().get("use_transactions", [])):
		if typeof(record_variant) != TYPE_DICTIONARY:
			continue
		var record: Dictionary = record_variant
		if StringName(record.get("spell_id", &"")) != spell_id:
			continue
		if StringName(record.get("use_transaction_id", &"")) != use_transaction_id:
			continue
		if not result_ledger.has_method(&"result_for"):
			return {"status": &"IDEMPOTENCY_RESULT_MISSING"}
		var result_payload: Dictionary = Dictionary(result_ledger.result_for(use_transaction_id))
		if result_payload.is_empty() or not result_payload.has("final_mana"):
			return {"status": &"IDEMPOTENCY_RESULT_MISSING"}
		return _success(use_transaction_id, spell_id, int(result_payload.get("final_mana", 0)), result_payload)
	return {}


static func _success(use_transaction_id: StringName, spell_id: StringName, final_mana: int, result_payload: Dictionary) -> Dictionary:
	var public_result: Dictionary = result_payload.duplicate(true)
	public_result.erase("final_mana")
	return {
		"status": &"USED",
		"use_transaction_id": use_transaction_id,
		"spell_id": spell_id,
		"mana_spent": final_mana,
		"result": public_result,
	}


static func _rollback(inventory, mana_pool, result_ledger, inventory_snapshot: Dictionary, mana_snapshot: Dictionary, result_snapshot: Dictionary, failure_status: StringName) -> Dictionary:
	var inventory_restored: bool = inventory.restore(inventory_snapshot)
	var mana_restored: bool = mana_pool.restore_state(mana_snapshot)
	result_ledger.restore(result_snapshot)
	if not inventory_restored or not mana_restored:
		return {"status": &"ROLLBACK_FAILED", "failure_status": failure_status}
	return {"status": failure_status}

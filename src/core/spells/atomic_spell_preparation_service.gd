# Stage 2 글자 예약 소비와 준비 주문 보관을 하나의 원자 거래로 처리한다.
class_name AtomicSpellPreparationService
extends RefCounted

const PREPARED_SPELL_PATH := "res://src/core/spells/prepared_spell.gd"


static func prepare(request, ledger, inventory) -> Dictionary:
	if request == null or ledger == null or inventory == null:
		return {"status": &"INVALID_REQUEST"}
	if not request.has_method(&"transaction_id") or not request.has_method(&"spell_id"):
		return {"status": &"INVALID_REQUEST"}
	if not ledger.has_method(&"validate_transaction") or not ledger.has_method(&"snapshot_state"):
		return {"status": &"INVALID_REQUEST"}
	if not inventory.has_method(&"serialize") or not inventory.has_method(&"restore"):
		return {"status": &"INVALID_REQUEST"}

	var transaction_id: StringName = request.transaction_id()
	var spell_id: StringName = request.spell_id()
	var prior := _prior_result(transaction_id, inventory)
	if not prior.is_empty():
		return prior

	var draft: Dictionary = request.draft()
	var records: Array = Array(draft.get("reservation_records", []))
	if records.is_empty() or not ledger.validate_transaction(transaction_id):
		return {"status": &"INVALID_RESERVATION"}
	if records != ledger.reservation_records_for_transaction(transaction_id):
		return {"status": &"INVALID_RESERVATION"}
	if not _draft_matches_records(draft, records, transaction_id):
		return {"status": &"INVALID_RESERVATION"}

	var ledger_snapshot: Dictionary = ledger.snapshot_state()
	var inventory_snapshot: Dictionary = inventory.serialize()
	var consumed: Dictionary = ledger.consume_transaction(transaction_id)
	if StringName(consumed.get("status", &"")) != &"OK":
		return _rollback(ledger, inventory, ledger_snapshot, inventory_snapshot, &"RESOURCE_CONSUME_FAILED")

	var PreparedSpell = load(PREPARED_SPELL_PATH)
	if PreparedSpell == null:
		return _rollback(ledger, inventory, ledger_snapshot, inventory_snapshot, &"PREPARED_SPELL_UNAVAILABLE")
	var spell = PreparedSpell.create(
		spell_id,
		Dictionary(draft.get("main", {})),
		Array(draft.get("auxiliaries", [])),
		request.base_preview(),
		records
	)
	if spell == null:
		return _rollback(ledger, inventory, ledger_snapshot, inventory_snapshot, &"INVALID_REQUEST")

	var added: Dictionary = inventory.add_once(transaction_id, spell)
	if not bool(added.get("ok", false)):
		return _rollback(ledger, inventory, ledger_snapshot, inventory_snapshot, &"INVENTORY_CONFLICT")
	return {
		"status": &"PREPARED",
		"spell": Dictionary(added.get("spell", {})).duplicate(true),
		"consumed_count": int(consumed.get("consumed_count", 0)),
	}


static func _draft_matches_records(draft: Dictionary, records: Array, transaction_id: StringName) -> bool:
	var expected_by_node: Dictionary = {}
	var main: Dictionary = Dictionary(draft.get("main", {}))
	if not _bind_expected_record(expected_by_node, StringName("%s:main" % transaction_id), main):
		return false
	for auxiliary_variant in Array(draft.get("auxiliaries", [])):
		if typeof(auxiliary_variant) != TYPE_DICTIONARY:
			return false
		var auxiliary: Dictionary = Dictionary(auxiliary_variant)
		if typeof(auxiliary.get("slot", null)) != TYPE_INT:
			return false
		var slot: int = int(auxiliary.get("slot", -1))
		if slot < 0 or slot > 4:
			return false
		var node_id := StringName("%s:aux-%s" % [transaction_id, slot])
		if not _bind_expected_record(expected_by_node, node_id, auxiliary):
			return false
	if expected_by_node.size() != records.size():
		return false
	for record_variant in records:
		if typeof(record_variant) != TYPE_DICTIONARY:
			return false
		var record: Dictionary = Dictionary(record_variant)
		var node_id := StringName(record.get("node_id", &""))
		if not expected_by_node.has(node_id):
			return false
		var expected: Dictionary = Dictionary(expected_by_node[node_id])
		if StringName(record.get("transaction_id", &"")) != transaction_id:
			return false
		if StringName(record.get("glyph_id", &"")) != StringName(expected.get("glyph_id", &"")):
			return false
		if int(record.get("source", -1)) != int(expected.get("source", -1)):
			return false
	return true


static func _bind_expected_record(expected_by_node: Dictionary, node_id: StringName, glyph: Dictionary) -> bool:
	if node_id.is_empty() or expected_by_node.has(node_id):
		return false
	if StringName(glyph.get("glyph_id", &"")).is_empty():
		return false
	if typeof(glyph.get("source", null)) != TYPE_INT:
		return false
	expected_by_node[node_id] = {
		"glyph_id": StringName(glyph.get("glyph_id", &"")),
		"source": int(glyph.get("source", -1)),
	}
	return true


static func _prior_result(transaction_id: StringName, inventory) -> Dictionary:
	if transaction_id.is_empty():
		return {}
	var serialized: Dictionary = inventory.serialize()
	for record_variant in Array(serialized.get("preparation_transactions", [])):
		if typeof(record_variant) != TYPE_DICTIONARY:
			continue
		var record: Dictionary = record_variant
		if StringName(record.get("preparation_transaction_id", &"")) != transaction_id:
			continue
		var spell: Dictionary = inventory.spell(StringName(record.get("spell_id", &"")))
		if spell.is_empty():
			return {}
		return {
			"status": &"PREPARED",
			"spell": spell.duplicate(true),
			"consumed_count": Array(spell.get("source_records", [])).size(),
		}
	return {}


static func _rollback(ledger, inventory, ledger_snapshot: Dictionary, inventory_snapshot: Dictionary, failure_status: StringName) -> Dictionary:
	var ledger_restored: bool = bool(ledger.restore_state(ledger_snapshot))
	var inventory_restored: bool = bool(inventory.restore(inventory_snapshot))
	if not ledger_restored or not inventory_restored:
		return {"status": &"ROLLBACK_FAILED", "failure_status": failure_status}
	return {"status": failure_status}

# Stage 2 별형 회로 배치의 즉시 예약과 거래별 해제를 관리한다.
class_name CircuitPlacementSession
extends RefCounted

const SELF_PATH := "res://src/core/workflow/circuit_placement_session.gd"

var _transaction_id: StringName
var _ledger
var _main: Dictionary = {}
var _auxiliaries_by_slot: Dictionary = {}


static func create(transaction_id: StringName, ledger):
	if transaction_id.is_empty() or ledger == null:
		return null
	if not ledger.has_method(&"reserve_node") or not ledger.has_method(&"release_node"):
		return null
	var script = load(SELF_PATH)
	if script == null or not script.can_instantiate():
		return null
	var session = script.new()
	session._transaction_id = transaction_id
	session._ledger = ledger
	return session


func place_main(glyph: Dictionary) -> Dictionary:
	return _place_node(&"main", glyph)


func place_auxiliary(slot: int, glyph: Dictionary) -> Dictionary:
	if slot < 0 or slot > 4:
		return {"status": &"AUXILIARY_SLOT_OUT_OF_RANGE"}
	return _place_node(StringName("aux-%s" % slot), glyph)


func remove_node(node_key: StringName) -> Dictionary:
	var normalized := _normalized_node_key(node_key)
	if normalized.is_empty():
		return {"status": &"INVALID_NODE_KEY"}
	var node_id := _node_id(normalized)
	if not _ledger.release_node(node_id):
		return {"status": &"NODE_NOT_RESERVED"}
	if normalized == &"main":
		_main.clear()
	else:
		_auxiliaries_by_slot.erase(_slot_for_node_key(normalized))
	return {"status": &"OK", "node_id": node_id}


func reset() -> Dictionary:
	var result: Dictionary = _ledger.release_transaction(_transaction_id)
	if StringName(result.get("status", &"")) != &"OK":
		return result
	_main.clear()
	_auxiliaries_by_slot.clear()
	return result.duplicate(true)


func draft() -> Dictionary:
	var auxiliaries: Array = []
	var slots: Array = _auxiliaries_by_slot.keys()
	slots.sort()
	for slot in slots:
		auxiliaries.append(Dictionary(_auxiliaries_by_slot[slot]).duplicate(true))
	var reservation_records: Array = _ledger.reservation_records_for_transaction(_transaction_id)
	return {
		"layout": &"FIVE_POINT_STAR",
		"main": _main.duplicate(true),
		"auxiliaries": auxiliaries,
		"reservation_records": reservation_records.duplicate(true),
	}


func _place_node(node_key: StringName, glyph: Dictionary) -> Dictionary:
	var glyph_id := StringName(glyph.get("glyph_id", &""))
	if glyph_id.is_empty() or not glyph.has("source"):
		return {"status": &"INVALID_GLYPH"}
	var source := int(glyph.get("source", -1))
	var is_learned := bool(glyph.get("is_learned", false))
	var node_id := _node_id(node_key)
	var previous := _node_payload(node_key)
	if not previous.is_empty():
		if not _ledger.release_node(node_id):
			return {"status": &"RESOURCE_STATE_CORRUPT"}
		_clear_node_payload(node_key)

	var reservation: Dictionary = _ledger.reserve_node(node_id, glyph_id, source, _transaction_id, is_learned)
	if StringName(reservation.get("status", &"")) != &"OK":
		if not previous.is_empty():
			var rollback: Dictionary = _ledger.reserve_node(
				node_id,
				StringName(previous.get("glyph_id", &"")),
				int(previous.get("source", -1)),
				_transaction_id,
				bool(previous.get("is_learned", false))
			)
			if StringName(rollback.get("status", &"")) == &"OK":
				_store_node_payload(node_key, previous)
				return {
					"status": &"REPLACEMENT_ROLLED_BACK",
					"replacement_status": reservation.get("status", &"UNKNOWN"),
				}
		return reservation.duplicate(true)

	var payload := glyph.duplicate(true)
	payload["glyph_id"] = glyph_id
	payload["source"] = source
	payload["is_learned"] = is_learned
	if node_key != &"main":
		payload["slot"] = _slot_for_node_key(node_key)
	_store_node_payload(node_key, payload)
	return {"status": &"OK", "node_id": node_id, "reservation": reservation.duplicate(true)}


func _node_id(node_key: StringName) -> StringName:
	return StringName("%s:%s" % [_transaction_id, node_key])


func _normalized_node_key(node_key: StringName) -> StringName:
	if node_key == &"main":
		return node_key
	var slot := _slot_for_node_key(node_key)
	if slot < 0 or slot > 4:
		return StringName()
	return StringName("aux-%s" % slot)


func _slot_for_node_key(node_key: StringName) -> int:
	var text := String(node_key)
	if not text.begins_with("aux-"):
		return -1
	var suffix := text.trim_prefix("aux-")
	if suffix.is_empty() or not suffix.is_valid_int():
		return -1
	return suffix.to_int()


func _node_payload(node_key: StringName) -> Dictionary:
	if node_key == &"main":
		return _main.duplicate(true)
	var slot := _slot_for_node_key(node_key)
	if not _auxiliaries_by_slot.has(slot):
		return {}
	return Dictionary(_auxiliaries_by_slot[slot]).duplicate(true)


func _store_node_payload(node_key: StringName, payload: Dictionary) -> void:
	if node_key == &"main":
		_main = payload.duplicate(true)
		return
	_auxiliaries_by_slot[_slot_for_node_key(node_key)] = payload.duplicate(true)


func _clear_node_payload(node_key: StringName) -> void:
	if node_key == &"main":
		_main.clear()
		return
	_auxiliaries_by_slot.erase(_slot_for_node_key(node_key))

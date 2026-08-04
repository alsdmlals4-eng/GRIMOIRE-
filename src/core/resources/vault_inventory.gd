class_name VaultInventory
extends RefCounted

const GlyphResourceTypes = preload("res://src/core/resources/glyph_resource_types.gd")

const SELF_PATH := "res://src/core/resources/vault_inventory.gd"
const SCHEMA_VERSION := 1

var _slot_capacity: int
var _slots: Array = []


static func create(slot_capacity: int):
    if slot_capacity <= 0:
        return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var vault = script.new()
    vault._slot_capacity = slot_capacity
    for index in range(slot_capacity):
        vault._slots.append(vault._empty_slot(StringName("slot-%d" % index)))
    return vault


static func from_dict(data: Dictionary) -> Dictionary:
    if int(data.get("schema_version", -1)) != SCHEMA_VERSION:
        return _corrupt_result()
    var slot_capacity := int(data.get("slot_capacity", -1))
    var raw_slots: Variant = data.get("slots", null)
    if slot_capacity <= 0 or typeof(raw_slots) != TYPE_ARRAY:
        return _corrupt_result()
    if raw_slots.size() != slot_capacity:
        return _corrupt_result()

    var vault = create(slot_capacity)
    if vault == null:
        return _corrupt_result()
    vault._slots.clear()
    var seen_slots: Dictionary = {}
    var seen_reservations: Dictionary = {}

    for raw_slot in raw_slots:
        if typeof(raw_slot) != TYPE_DICTIONARY:
            return _corrupt_result()
        var slot: Dictionary = raw_slot
        var normalized := {
            "slot_id": StringName(slot.get("slot_id", "")),
            "glyph_id": StringName(slot.get("glyph_id", "")),
            "state": int(slot.get("state", -1)),
            "reservation_id": StringName(slot.get("reservation_id", "")),
            "node_id": StringName(slot.get("node_id", "")),
            "transaction_id": StringName(slot.get("transaction_id", "")),
        }
        if not _valid_slot(normalized, seen_slots, seen_reservations):
            return _corrupt_result()
        seen_slots[normalized.slot_id] = true
        if normalized.reservation_id != StringName():
            seen_reservations[normalized.reservation_id] = true
        vault._slots.append(normalized)

    return {"status": &"OK", "vault": vault}


func slot_capacity() -> int:
    return _slot_capacity


func empty_slot_count() -> int:
    var count := 0
    for slot in _slots:
        if slot.state == GlyphResourceTypes.VaultSlotState.EMPTY:
            count += 1
    return count


func matching_available_count(glyph_id: StringName) -> int:
    var count := 0
    for slot in _slots:
        if slot.state == GlyphResourceTypes.VaultSlotState.AVAILABLE and slot.glyph_id == glyph_id:
            count += 1
    return count


func reserve_for_scribe(glyph_id: StringName, transaction_id: StringName) -> Dictionary:
    if glyph_id == StringName() or transaction_id == StringName():
        return {"status": &"INVALID_SCRIBE_REQUEST"}
    for index in range(_slots.size()):
        var slot: Dictionary = _slots[index]
        if slot.state != GlyphResourceTypes.VaultSlotState.EMPTY:
            continue
        var node_id := StringName("scribe:%s" % String(slot.slot_id))
        var reservation_id := GlyphResourceTypes.reservation_id(
            transaction_id, node_id, GlyphResourceTypes.Source.VAULT
        )
        if has_reservation(reservation_id):
            return {"status": &"DUPLICATE_RESERVATION"}
        slot.glyph_id = glyph_id
        slot.state = GlyphResourceTypes.VaultSlotState.RESERVED_FOR_SCRIBE
        slot.reservation_id = reservation_id
        slot.node_id = node_id
        slot.transaction_id = transaction_id
        _slots[index] = slot
        return _reservation_result(slot)
    return {"status": &"VAULT_FULL"}


func complete_scribe(reservation_id: StringName) -> bool:
    var index := _find_reservation_index(reservation_id)
    if index < 0:
        return false
    var slot: Dictionary = _slots[index]
    if slot.state != GlyphResourceTypes.VaultSlotState.RESERVED_FOR_SCRIBE:
        return false
    slot.state = GlyphResourceTypes.VaultSlotState.AVAILABLE
    _clear_reservation_fields(slot)
    _slots[index] = slot
    return true


func reserve_matching(
    glyph_id: StringName,
    node_id: StringName,
    transaction_id: StringName
) -> Dictionary:
    if glyph_id == StringName() or node_id == StringName() or transaction_id == StringName():
        return {"status": &"INVALID_VAULT_REQUEST"}
    var reservation_id := GlyphResourceTypes.reservation_id(
        transaction_id, node_id, GlyphResourceTypes.Source.VAULT
    )
    if has_reservation(reservation_id):
        return {"status": &"DUPLICATE_RESERVATION"}
    for index in range(_slots.size()):
        var slot: Dictionary = _slots[index]
        if slot.state != GlyphResourceTypes.VaultSlotState.AVAILABLE:
            continue
        if slot.glyph_id != glyph_id:
            continue
        slot.state = GlyphResourceTypes.VaultSlotState.RESERVED
        slot.reservation_id = reservation_id
        slot.node_id = node_id
        slot.transaction_id = transaction_id
        _slots[index] = slot
        return _reservation_result(slot)
    return {"status": &"NO_MATCHING_VAULT_GLYPH"}


func release(reservation_id: StringName) -> bool:
    var index := _find_reservation_index(reservation_id)
    if index < 0:
        return false
    var slot: Dictionary = _slots[index]
    if slot.state == GlyphResourceTypes.VaultSlotState.RESERVED_FOR_SCRIBE:
        _slots[index] = _empty_slot(slot.slot_id)
        return true
    if slot.state == GlyphResourceTypes.VaultSlotState.RESERVED:
        slot.state = GlyphResourceTypes.VaultSlotState.AVAILABLE
        _clear_reservation_fields(slot)
        _slots[index] = slot
        return true
    return false


func consume(reservation_id: StringName) -> bool:
    var index := _find_reservation_index(reservation_id)
    if index < 0:
        return false
    var slot: Dictionary = _slots[index]
    if slot.state != GlyphResourceTypes.VaultSlotState.RESERVED:
        return false
    _slots[index] = _empty_slot(slot.slot_id)
    return true


func has_reservation(reservation_id: StringName) -> bool:
    return _find_reservation_index(reservation_id) >= 0


func reservation_record(reservation_id: StringName) -> Dictionary:
    var index := _find_reservation_index(reservation_id)
    if index < 0:
        return {}
    return _reservation_record(_slots[index])


func to_dict() -> Dictionary:
    var serialized_slots: Array = []
    for slot in _slots:
        serialized_slots.append(slot.duplicate(true))
    return {
        "schema_version": SCHEMA_VERSION,
        "slot_capacity": _slot_capacity,
        "slots": serialized_slots,
    }


func _find_reservation_index(reservation_id: StringName) -> int:
    if reservation_id == StringName():
        return -1
    for index in range(_slots.size()):
        if _slots[index].reservation_id == reservation_id:
            return index
    return -1


func _reservation_result(slot: Dictionary) -> Dictionary:
    var result := _reservation_record(slot)
    result.status = &"OK"
    return result


func _reservation_record(slot: Dictionary) -> Dictionary:
    return {
        "reservation_id": slot.reservation_id,
        "source": GlyphResourceTypes.Source.VAULT,
        "glyph_id": slot.glyph_id,
        "node_id": slot.node_id,
        "transaction_id": slot.transaction_id,
        "slot_id": slot.slot_id,
        "slot_state": slot.state,
    }


func _empty_slot(slot_id: StringName) -> Dictionary:
    return {
        "slot_id": slot_id,
        "glyph_id": StringName(),
        "state": GlyphResourceTypes.VaultSlotState.EMPTY,
        "reservation_id": StringName(),
        "node_id": StringName(),
        "transaction_id": StringName(),
    }


func _clear_reservation_fields(slot: Dictionary) -> void:
    slot.reservation_id = StringName()
    slot.node_id = StringName()
    slot.transaction_id = StringName()


static func _valid_slot(
    slot: Dictionary,
    seen_slots: Dictionary,
    seen_reservations: Dictionary
) -> bool:
    if slot.slot_id == StringName() or seen_slots.has(slot.slot_id):
        return false
    if slot.state < GlyphResourceTypes.VaultSlotState.EMPTY:
        return false
    if slot.state > GlyphResourceTypes.VaultSlotState.RESERVED_FOR_SCRIBE:
        return false

    if slot.state == GlyphResourceTypes.VaultSlotState.EMPTY:
        return (
            slot.glyph_id == StringName()
            and slot.reservation_id == StringName()
            and slot.node_id == StringName()
            and slot.transaction_id == StringName()
        )

    if slot.glyph_id == StringName():
        return false
    if slot.state == GlyphResourceTypes.VaultSlotState.AVAILABLE:
        return (
            slot.reservation_id == StringName()
            and slot.node_id == StringName()
            and slot.transaction_id == StringName()
        )

    if slot.reservation_id == StringName() or seen_reservations.has(slot.reservation_id):
        return false
    if slot.node_id == StringName() or slot.transaction_id == StringName():
        return false
    return slot.reservation_id == GlyphResourceTypes.reservation_id(
        slot.transaction_id, slot.node_id, GlyphResourceTypes.Source.VAULT
    )


static func _corrupt_result() -> Dictionary:
    return {"status": &"CORRUPT_VAULT"}

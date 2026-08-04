class_name UniversalStockPool
extends RefCounted

const GlyphResourceTypes = preload("res://src/core/resources/glyph_resource_types.gd")

const SELF_PATH := "res://src/core/resources/universal_stock_pool.gd"
const SCHEMA_VERSION := 1

var _capacity: int
var _current_total: int = 0
var _reservations: Dictionary = {}


static func create(capacity: int):
    if capacity <= 0:
        return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var pool = script.new()
    pool._capacity = capacity
    return pool


static func from_dict(data: Dictionary) -> Dictionary:
    if int(data.get("schema_version", -1)) != SCHEMA_VERSION:
        return _corrupt_result()

    var capacity := int(data.get("capacity", -1))
    var current_total := int(data.get("current_total", -1))
    var reservation_data: Variant = data.get("reservations", null)
    if capacity <= 0 or current_total < 0 or current_total > capacity:
        return _corrupt_result()
    if typeof(reservation_data) != TYPE_ARRAY:
        return _corrupt_result()
    if reservation_data.size() > current_total:
        return _corrupt_result()

    var pool = create(capacity)
    if pool == null:
        return _corrupt_result()
    pool._current_total = current_total
    var seen: Dictionary = {}

    for raw_record in reservation_data:
        if typeof(raw_record) != TYPE_DICTIONARY:
            return _corrupt_result()
        var record: Dictionary = raw_record
        var reservation_id := StringName(record.get("reservation_id", ""))
        var glyph_id := StringName(record.get("glyph_id", ""))
        var node_id := StringName(record.get("node_id", ""))
        var transaction_id := StringName(record.get("transaction_id", ""))
        var source := int(record.get("source", -1))
        if reservation_id == StringName() or glyph_id == StringName():
            return _corrupt_result()
        if node_id == StringName() or transaction_id == StringName():
            return _corrupt_result()
        if source != GlyphResourceTypes.Source.UNIVERSAL_STOCK:
            return _corrupt_result()
        if seen.has(reservation_id):
            return _corrupt_result()
        if reservation_id != GlyphResourceTypes.reservation_id(
            transaction_id, node_id, GlyphResourceTypes.Source.UNIVERSAL_STOCK
        ):
            return _corrupt_result()

        seen[reservation_id] = true
        pool._reservations[reservation_id] = {
            "reservation_id": reservation_id,
            "source": source,
            "glyph_id": glyph_id,
            "node_id": node_id,
            "transaction_id": transaction_id,
        }

    return {"status": &"OK", "pool": pool}


func capacity() -> int:
    return _capacity


func current_total() -> int:
    return _current_total


func available_count() -> int:
    return _current_total - _reservations.size()


func add_one() -> bool:
    if _current_total >= _capacity:
        return false
    _current_total += 1
    return true


func reserve(
    glyph_id: StringName,
    node_id: StringName,
    transaction_id: StringName
) -> Dictionary:
    var reservation_id := GlyphResourceTypes.reservation_id(
        transaction_id, node_id, GlyphResourceTypes.Source.UNIVERSAL_STOCK
    )
    if _reservations.has(reservation_id):
        return {"status": &"DUPLICATE_RESERVATION"}
    if available_count() <= 0:
        return {"status": &"NO_UNIVERSAL_STOCK"}

    var record := {
        "reservation_id": reservation_id,
        "source": GlyphResourceTypes.Source.UNIVERSAL_STOCK,
        "glyph_id": glyph_id,
        "node_id": node_id,
        "transaction_id": transaction_id,
    }
    _reservations[reservation_id] = record
    var result := record.duplicate(true)
    result["status"] = &"OK"
    return result


func release(reservation_id: StringName) -> bool:
    if not _reservations.has(reservation_id):
        return false
    _reservations.erase(reservation_id)
    return true


func consume(reservation_id: StringName) -> bool:
    if not _reservations.has(reservation_id):
        return false
    _reservations.erase(reservation_id)
    _current_total -= 1
    return true


func has_reservation(reservation_id: StringName) -> bool:
    return _reservations.has(reservation_id)


func reservation_record(reservation_id: StringName) -> Dictionary:
    if not _reservations.has(reservation_id):
        return {}
    return _reservations[reservation_id].duplicate(true)


func to_dict() -> Dictionary:
    var reservation_ids: Array = _reservations.keys()
    reservation_ids.sort()
    var records: Array = []
    for reservation_id in reservation_ids:
        records.append(_reservations[reservation_id].duplicate(true))
    return {
        "schema_version": SCHEMA_VERSION,
        "capacity": _capacity,
        "current_total": _current_total,
        "reservations": records,
    }


static func _corrupt_result() -> Dictionary:
    return {"status": &"CORRUPT_UNIVERSAL_STOCK"}

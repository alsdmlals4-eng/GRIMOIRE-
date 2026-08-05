class_name TypedGlyphStockPool
extends RefCounted

const GlyphResourceTypes = preload("res://src/core/resources/glyph_resource_types.gd")
const SELF_PATH := "res://src/core/resources/typed_glyph_stock_pool.gd"
const SCHEMA_VERSION := 1
const KIND := "TYPED_GLYPH_STOCK"

var _capacity: int = 0
var _counts: Dictionary = {}
var _reservations: Dictionary = {}
var _generation_reservations: Dictionary = {}


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
        return {"status": &"CORRUPT_TYPED_STOCK"}
    if String(data.get("kind", "")) != KIND:
        return {"status": &"CORRUPT_TYPED_STOCK"}
    var capacity: int = int(data.get("capacity", -1))
    var raw_counts: Variant = data.get("counts", null)
    var raw_reservations: Variant = data.get("reservations", null)
    var raw_generations: Variant = data.get("generation_reservations", null)
    if capacity <= 0 or typeof(raw_counts) != TYPE_DICTIONARY:
        return {"status": &"CORRUPT_TYPED_STOCK"}
    if typeof(raw_reservations) != TYPE_ARRAY or typeof(raw_generations) != TYPE_ARRAY:
        return {"status": &"CORRUPT_TYPED_STOCK"}
    var pool = create(capacity)
    if pool == null:
        return {"status": &"CORRUPT_TYPED_STOCK"}
    for raw_glyph_id in raw_counts.keys():
        var glyph_id := StringName(raw_glyph_id)
        var count: int = int(raw_counts[raw_glyph_id])
        if glyph_id.is_empty() or count < 0:
            return {"status": &"CORRUPT_TYPED_STOCK"}
        if count > 0:
            pool._counts[glyph_id] = count
    if pool.current_total() > capacity:
        return {"status": &"CORRUPT_TYPED_STOCK"}
    for raw_record in raw_reservations:
        if typeof(raw_record) != TYPE_DICTIONARY:
            return {"status": &"CORRUPT_TYPED_STOCK"}
        var record: Dictionary = raw_record.duplicate(true)
        var reservation_id := StringName(record.get("reservation_id", &""))
        var glyph_id := StringName(record.get("glyph_id", &""))
        if reservation_id.is_empty() or glyph_id.is_empty() or pool._reservations.has(reservation_id):
            return {"status": &"CORRUPT_TYPED_STOCK"}
        pool._reservations[reservation_id] = record
    for raw_record in raw_generations:
        if typeof(raw_record) != TYPE_DICTIONARY:
            return {"status": &"CORRUPT_TYPED_STOCK"}
        var record: Dictionary = raw_record.duplicate(true)
        var event_id := StringName(record.get("event_id", &""))
        var glyph_id := StringName(record.get("glyph_id", &""))
        if event_id.is_empty() or glyph_id.is_empty() or pool._generation_reservations.has(event_id):
            return {"status": &"CORRUPT_TYPED_STOCK"}
        pool._generation_reservations[event_id] = record
    if pool.current_total() + pool._generation_reservations.size() > capacity:
        return {"status": &"CORRUPT_TYPED_STOCK"}
    for record_variant in pool._reservations.values():
        var record: Dictionary = record_variant
        if pool.matching_count(StringName(record.get("glyph_id", &""))) <= 0:
            return {"status": &"CORRUPT_TYPED_STOCK"}
    return {"status": &"OK", "pool": pool}


func capacity() -> int:
    return _capacity


func current_total() -> int:
    var total := 0
    for count_variant in _counts.values():
        total += int(count_variant)
    return total


func available_capacity() -> int:
    return _capacity - current_total() - _generation_reservations.size()


func matching_count(glyph_id: StringName) -> int:
    return int(_counts.get(glyph_id, 0))


func matching_available_count(glyph_id: StringName) -> int:
    var reserved := 0
    for record_variant in _reservations.values():
        var record: Dictionary = record_variant
        if StringName(record.get("glyph_id", &"")) == glyph_id:
            reserved += 1
    return matching_count(glyph_id) - reserved


func available_count() -> int:
    return current_total() - _reservations.size()


func add_one(glyph_id: StringName) -> bool:
    if glyph_id.is_empty() or current_total() >= _capacity:
        return false
    _counts[glyph_id] = matching_count(glyph_id) + 1
    return true


func reserve(glyph_id: StringName, node_id: StringName, transaction_id: StringName) -> Dictionary:
    if glyph_id.is_empty() or node_id.is_empty() or transaction_id.is_empty():
        return {"status": &"INVALID_TYPED_STOCK_RESERVATION"}
    if matching_available_count(glyph_id) <= 0:
        return {"status": &"NO_MATCHING_TYPED_STOCK", "glyph_id": glyph_id}
    var reservation_id := GlyphResourceTypes.reservation_id(
        transaction_id, node_id, GlyphResourceTypes.TYPED_STOCK
    )
    if _reservations.has(reservation_id):
        return {"status": &"DUPLICATE_RESERVATION"}
    var record := {
        "reservation_id": reservation_id,
        "source": GlyphResourceTypes.TYPED_STOCK,
        "glyph_id": glyph_id,
        "node_id": node_id,
        "transaction_id": transaction_id,
    }
    _reservations[reservation_id] = record
    var result: Dictionary = record.duplicate(true)
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
    var record: Dictionary = _reservations[reservation_id]
    var glyph_id := StringName(record.get("glyph_id", &""))
    if matching_count(glyph_id) <= 0:
        return false
    _reservations.erase(reservation_id)
    var remaining := matching_count(glyph_id) - 1
    if remaining <= 0:
        _counts.erase(glyph_id)
    else:
        _counts[glyph_id] = remaining
    return true


func has_reservation(reservation_id: StringName) -> bool:
    return _reservations.has(reservation_id)


func reservation_record(reservation_id: StringName) -> Dictionary:
    if not _reservations.has(reservation_id):
        return {}
    return Dictionary(_reservations[reservation_id]).duplicate(true)


func reserve_generation(glyph_id: StringName, event_id: StringName) -> Dictionary:
    if glyph_id.is_empty() or event_id.is_empty():
        return {"status": &"INVALID_STOCK_GENERATION"}
    if _generation_reservations.has(event_id):
        return {"status": &"DUPLICATE_STOCK_GENERATION"}
    if available_capacity() <= 0:
        return {"status": &"NO_STOCK_CAPACITY"}
    var record := {"event_id": event_id, "glyph_id": glyph_id}
    _generation_reservations[event_id] = record
    return {"status": &"OK", "event_id": event_id, "glyph_id": glyph_id}


func complete_generation(event_id: StringName) -> Dictionary:
    if not _generation_reservations.has(event_id):
        return {"status": &"INVALID_STOCK_GENERATION"}
    var record: Dictionary = _generation_reservations[event_id]
    var glyph_id := StringName(record.get("glyph_id", &""))
    _generation_reservations.erase(event_id)
    if not add_one(glyph_id):
        return {"status": &"STOCK_GENERATION_FAILED"}
    return {"status": &"TYPED_STOCK_CREATED", "event_id": event_id, "glyph_id": glyph_id}


func cancel_generation(event_id: StringName) -> bool:
    if not _generation_reservations.has(event_id):
        return false
    _generation_reservations.erase(event_id)
    return true


func has_generation_reservation(event_id: StringName) -> bool:
    return _generation_reservations.has(event_id)


func restore_state(data: Dictionary) -> bool:
    var restored: Dictionary = from_dict(data)
    if StringName(restored.get("status", &"")) != &"OK":
        return false
    var pool = restored.get("pool")
    _capacity = pool._capacity
    _counts = pool._counts.duplicate(true)
    _reservations = pool._reservations.duplicate(true)
    _generation_reservations = pool._generation_reservations.duplicate(true)
    return true


func to_dict() -> Dictionary:
    var reservations: Array = []
    for reservation_id in _reservations.keys():
        reservations.append(Dictionary(_reservations[reservation_id]).duplicate(true))
    var generations: Array = []
    for event_id in _generation_reservations.keys():
        generations.append(Dictionary(_generation_reservations[event_id]).duplicate(true))
    return {
        "schema_version": SCHEMA_VERSION,
        "kind": KIND,
        "capacity": _capacity,
        "counts": _counts.duplicate(true),
        "reservations": reservations,
        "generation_reservations": generations,
    }

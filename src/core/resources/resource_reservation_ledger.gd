class_name ResourceReservationLedger
extends RefCounted

const GlyphResourceTypes = preload("res://src/core/resources/glyph_resource_types.gd")

const SELF_PATH := "res://src/core/resources/resource_reservation_ledger.gd"

var _stock_pool
var _vault
var _reservations_by_node: Dictionary = {}


static func create(stock_pool, vault):
    if stock_pool == null or vault == null:
        return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var ledger = script.new()
    ledger._stock_pool = stock_pool
    ledger._vault = vault
    return ledger


func available_sources(glyph_id: StringName, is_learned: bool) -> Array:
    if not is_learned:
        return []

    var sources: Array = []
    if _stock_pool.available_count() > 0:
        sources.append(GlyphResourceTypes.Source.UNIVERSAL_STOCK)
    if _vault.matching_available_count(glyph_id) > 0:
        sources.append(GlyphResourceTypes.Source.VAULT)
    return sources


func reserve_node(
    node_id: StringName,
    glyph_id: StringName,
    source: int,
    transaction_id: StringName,
    is_learned: bool
) -> Dictionary:
    if not is_learned:
        return {"status": &"GLYPH_NOT_LEARNED"}
    if source != GlyphResourceTypes.Source.UNIVERSAL_STOCK and source != GlyphResourceTypes.Source.VAULT:
        return {"status": &"SOURCE_SELECTION_REQUIRED"}
    if _reservations_by_node.has(node_id):
        return {"status": &"NODE_ALREADY_RESERVED"}

    var result := _reserve_from_source(glyph_id, node_id, transaction_id, source)
    if result.get("status", &"") == &"OK":
        _reservations_by_node[node_id] = result.duplicate(true)
    return result


func release_node(node_id: StringName) -> bool:
    if not _reservations_by_node.has(node_id):
        return false
    var record: Dictionary = _reservations_by_node[node_id]
    if not _release_record(record):
        return false
    _reservations_by_node.erase(node_id)
    return true


func replace_node_source(node_id: StringName, new_source: int) -> Dictionary:
    if new_source != GlyphResourceTypes.Source.UNIVERSAL_STOCK and new_source != GlyphResourceTypes.Source.VAULT:
        return {"status": &"SOURCE_SELECTION_REQUIRED"}
    if not _reservations_by_node.has(node_id):
        return {"status": &"NODE_NOT_RESERVED"}

    var old_record: Dictionary = _reservations_by_node[node_id].duplicate(true)
    if int(old_record.source) == new_source:
        var unchanged := old_record.duplicate(true)
        unchanged.status = &"OK"
        return unchanged

    if not _release_record(old_record):
        return {"status": &"RESOURCE_STATE_CORRUPT", "release_status": &"FAILED"}
    _reservations_by_node.erase(node_id)

    var replacement := _reserve_from_source(
        old_record.glyph_id,
        old_record.node_id,
        old_record.transaction_id,
        new_source
    )
    if replacement.get("status", &"") == &"OK":
        _reservations_by_node[node_id] = replacement.duplicate(true)
        return replacement

    var rollback := _reserve_from_source(
        old_record.glyph_id,
        old_record.node_id,
        old_record.transaction_id,
        int(old_record.source)
    )
    if rollback.get("status", &"") != &"OK":
        return {
            "status": &"RESOURCE_STATE_CORRUPT",
            "replacement_status": replacement.get("status", &"UNKNOWN"),
            "rollback_status": rollback.get("status", &"UNKNOWN"),
        }

    _reservations_by_node[node_id] = rollback.duplicate(true)
    return {
        "status": &"REPLACEMENT_ROLLED_BACK",
        "replacement_status": replacement.get("status", &"UNKNOWN"),
        "reservation": rollback.duplicate(true),
    }


func reservation_for_node(node_id: StringName) -> Dictionary:
    if not _reservations_by_node.has(node_id):
        return {}
    return _reservations_by_node[node_id].duplicate(true)


func reservation_count() -> int:
    return _reservations_by_node.size()


func reservation_records() -> Array:
    var node_ids: Array = _reservations_by_node.keys()
    node_ids.sort()
    var records: Array = []
    for node_id in node_ids:
        records.append(_reservations_by_node[node_id].duplicate(true))
    return records


func cancel_node(node_id: StringName) -> bool:
    return release_node(node_id)


func replace_source(node_id: StringName, new_source: int) -> Dictionary:
    return replace_node_source(node_id, new_source)


func _reserve_from_source(
    glyph_id: StringName,
    node_id: StringName,
    transaction_id: StringName,
    source: int
) -> Dictionary:
    if source == GlyphResourceTypes.Source.UNIVERSAL_STOCK:
        return _stock_pool.reserve(glyph_id, node_id, transaction_id)
    if source == GlyphResourceTypes.Source.VAULT:
        return _vault.reserve_matching(glyph_id, node_id, transaction_id)
    return {"status": &"SOURCE_SELECTION_REQUIRED"}


func _release_record(record: Dictionary) -> bool:
    var reservation_id := StringName(record.get("reservation_id", ""))
    var source := int(record.get("source", -1))
    if source == GlyphResourceTypes.Source.UNIVERSAL_STOCK:
        return _stock_pool.release(reservation_id)
    if source == GlyphResourceTypes.Source.VAULT:
        return _vault.release(reservation_id)
    return false

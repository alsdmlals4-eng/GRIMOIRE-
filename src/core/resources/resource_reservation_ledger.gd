class_name ResourceReservationLedger
extends RefCounted

const GlyphResourceTypes = preload("res://src/core/resources/glyph_resource_types.gd")
const UniversalStockPoolScript = preload("res://src/core/resources/universal_stock_pool.gd")
const TypedGlyphStockPoolScript = preload("res://src/core/resources/typed_glyph_stock_pool.gd")
const VaultInventoryScript = preload("res://src/core/resources/vault_inventory.gd")

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
    if _stock_available_for(glyph_id) > 0:
        sources.append(GlyphResourceTypes.TYPED_STOCK)
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
    if source != GlyphResourceTypes.TYPED_STOCK and source != GlyphResourceTypes.Source.VAULT:
        return {"status": &"SOURCE_SELECTION_REQUIRED"}
    if _reservations_by_node.has(node_id):
        return {"status": &"NODE_ALREADY_RESERVED"}
    var result: Dictionary = _reserve_from_source(glyph_id, node_id, transaction_id, source)
    if StringName(result.get("status", &"")) == &"OK":
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


func release_transaction(transaction_id: StringName) -> Dictionary:
    if transaction_id.is_empty():
        return {"status": &"INVALID_TRANSACTION", "released_count": 0}
    var records := reservation_records_for_transaction(transaction_id)
    var released := 0
    for record_variant in records:
        var node_id := StringName(Dictionary(record_variant).get("node_id", &""))
        if not release_node(node_id):
            return {"status": &"RESOURCE_STATE_CORRUPT", "released_count": released}
        released += 1
    return {"status": &"OK", "released_count": released}


func replace_node_source(node_id: StringName, new_source: int) -> Dictionary:
    if new_source != GlyphResourceTypes.TYPED_STOCK and new_source != GlyphResourceTypes.Source.VAULT:
        return {"status": &"SOURCE_SELECTION_REQUIRED"}
    if not _reservations_by_node.has(node_id):
        return {"status": &"NODE_NOT_RESERVED"}
    var old_record: Dictionary = Dictionary(_reservations_by_node[node_id]).duplicate(true)
    if int(old_record.get("source", -1)) == new_source:
        var unchanged: Dictionary = old_record.duplicate(true)
        unchanged["status"] = &"OK"
        return unchanged
    if not _release_record(old_record):
        return {"status": &"RESOURCE_STATE_CORRUPT", "release_status": &"FAILED"}
    _reservations_by_node.erase(node_id)
    var replacement: Dictionary = _reserve_from_source(
        StringName(old_record.get("glyph_id", &"")),
        StringName(old_record.get("node_id", &"")),
        StringName(old_record.get("transaction_id", &"")),
        new_source
    )
    if StringName(replacement.get("status", &"")) == &"OK":
        _reservations_by_node[node_id] = replacement.duplicate(true)
        return replacement
    var rollback: Dictionary = _reserve_from_source(
        StringName(old_record.get("glyph_id", &"")),
        StringName(old_record.get("node_id", &"")),
        StringName(old_record.get("transaction_id", &"")),
        int(old_record.get("source", -1))
    )
    if StringName(rollback.get("status", &"")) != &"OK":
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
    return Dictionary(_reservations_by_node[node_id]).duplicate(true)


func reservation_count() -> int:
    return _reservations_by_node.size()


func reservation_records() -> Array:
    var node_ids: Array = _reservations_by_node.keys()
    node_ids.sort()
    var records: Array = []
    for node_id in node_ids:
        records.append(Dictionary(_reservations_by_node[node_id]).duplicate(true))
    return records


func reservation_records_for_transaction(transaction_id: StringName) -> Array:
    var records: Array = []
    for record_variant in reservation_records():
        var record: Dictionary = record_variant
        if StringName(record.get("transaction_id", &"")) == transaction_id:
            records.append(record)
    return records


func validate_transaction(transaction_id: StringName) -> bool:
    var records: Array = reservation_records_for_transaction(transaction_id)
    if records.is_empty():
        return false
    for record_variant in records:
        var record: Dictionary = record_variant
        if not _record_exists_in(_stock_pool, _vault, record):
            return false
    return true


func consume_transaction(transaction_id: StringName) -> Dictionary:
    var records: Array = reservation_records_for_transaction(transaction_id)
    if records.is_empty():
        return {"status": &"MISSING_RESERVATION"}
    for record_variant in records:
        var record: Dictionary = record_variant
        if not _consume_record(record):
            return {"status": &"RESOURCE_CONSUME_FAILED"}
        _reservations_by_node.erase(StringName(record.get("node_id", &"")))
    return {"status": &"OK", "consumed_count": records.size()}


func snapshot_state() -> Dictionary:
    var stock_state: Dictionary = _stock_pool.to_dict()
    return {
        "stock_pool": stock_state.duplicate(true),
        "universal_stock": stock_state.duplicate(true),
        "vault": _vault.to_dict(),
        "reservations_by_node": _reservations_by_node.duplicate(true),
    }


func restore_state(data: Dictionary) -> bool:
    var stock_data: Variant = data.get("stock_pool", data.get("universal_stock", null))
    var vault_data: Variant = data.get("vault", null)
    var reservation_data: Variant = data.get("reservations_by_node", null)
    if typeof(stock_data) != TYPE_DICTIONARY:
        return false
    if typeof(vault_data) != TYPE_DICTIONARY:
        return false
    if typeof(reservation_data) != TYPE_DICTIONARY:
        return false

    var stock_result: Dictionary = _stock_from_dict(stock_data)
    var vault_result: Dictionary = VaultInventoryScript.from_dict(vault_data)
    if StringName(stock_result.get("status", &"")) != &"OK":
        return false
    if StringName(vault_result.get("status", &"")) != &"OK":
        return false

    var temp_stock = stock_result.get("pool")
    var temp_vault = vault_result.get("vault")
    var normalized: Dictionary = {}
    var stock_record_count := 0
    var vault_record_count := 0
    for raw_node_id in reservation_data.keys():
        var node_id := StringName(raw_node_id)
        var raw_record: Variant = reservation_data[raw_node_id]
        if typeof(raw_record) != TYPE_DICTIONARY:
            return false
        var record: Dictionary = Dictionary(raw_record).duplicate(true)
        if StringName(record.get("node_id", &"")) != node_id:
            return false
        if not _record_exists_in(temp_stock, temp_vault, record):
            return false
        if int(record.get("source", -1)) == GlyphResourceTypes.TYPED_STOCK:
            stock_record_count += 1
        else:
            vault_record_count += 1
        normalized[node_id] = record

    var stock_serialized: Dictionary = temp_stock.to_dict()
    if Array(stock_serialized.get("reservations", [])).size() != stock_record_count:
        return false
    if _vault_circuit_reservation_count(temp_vault) != vault_record_count:
        return false
    if not _stock_pool.restore_state(stock_data):
        return false
    if not _vault.restore_state(vault_data):
        return false
    _reservations_by_node = normalized.duplicate(true)
    return true


func cancel_node(node_id: StringName) -> bool:
    return release_node(node_id)


func replace_source(node_id: StringName, new_source: int) -> Dictionary:
    return replace_node_source(node_id, new_source)


func _stock_available_for(glyph_id: StringName) -> int:
    if _stock_pool.has_method(&"matching_available_count"):
        return int(_stock_pool.matching_available_count(glyph_id))
    return int(_stock_pool.available_count())


func _stock_from_dict(stock_data: Dictionary) -> Dictionary:
    if String(stock_data.get("kind", "")) == TypedGlyphStockPoolScript.KIND:
        return TypedGlyphStockPoolScript.from_dict(stock_data)
    return UniversalStockPoolScript.from_dict(stock_data)


func _reserve_from_source(
    glyph_id: StringName,
    node_id: StringName,
    transaction_id: StringName,
    source: int
) -> Dictionary:
    if source == GlyphResourceTypes.TYPED_STOCK:
        return _stock_pool.reserve(glyph_id, node_id, transaction_id)
    if source == GlyphResourceTypes.Source.VAULT:
        return _vault.reserve_matching(glyph_id, node_id, transaction_id)
    return {"status": &"SOURCE_SELECTION_REQUIRED"}


func _release_record(record: Dictionary) -> bool:
    var reservation_id := StringName(record.get("reservation_id", &""))
    var source := int(record.get("source", -1))
    if source == GlyphResourceTypes.TYPED_STOCK:
        return _stock_pool.release(reservation_id)
    if source == GlyphResourceTypes.Source.VAULT:
        return _vault.release(reservation_id)
    return false


func _consume_record(record: Dictionary) -> bool:
    var reservation_id := StringName(record.get("reservation_id", &""))
    var source := int(record.get("source", -1))
    if source == GlyphResourceTypes.TYPED_STOCK:
        return _stock_pool.consume(reservation_id)
    if source == GlyphResourceTypes.Source.VAULT:
        return _vault.consume(reservation_id)
    return false


func _record_exists_in(stock_pool, vault, record: Dictionary) -> bool:
    var source := int(record.get("source", -1))
    var reservation_id := StringName(record.get("reservation_id", &""))
    var actual: Dictionary = {}
    if source == GlyphResourceTypes.TYPED_STOCK:
        actual = stock_pool.reservation_record(reservation_id)
    elif source == GlyphResourceTypes.Source.VAULT:
        actual = vault.reservation_record(reservation_id)
    else:
        return false
    if actual.is_empty():
        return false
    return (
        StringName(actual.get("glyph_id", &"")) == StringName(record.get("glyph_id", &""))
        and StringName(actual.get("node_id", &"")) == StringName(record.get("node_id", &""))
        and StringName(actual.get("transaction_id", &"")) == StringName(record.get("transaction_id", &""))
        and int(actual.get("source", -1)) == source
    )


func _vault_circuit_reservation_count(vault) -> int:
    var count := 0
    var data: Dictionary = vault.to_dict()
    for slot_variant in Array(data.get("slots", [])):
        var slot: Dictionary = slot_variant
        if int(slot.get("state", -1)) == GlyphResourceTypes.VaultSlotState.RESERVED:
            count += 1
    return count

extends RefCounted

const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const STOCK_PATH := "res://src/core/resources/universal_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const TYPES_PATH := "res://src/core/resources/glyph_resource_types.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(LEDGER_PATH), "resource_reservation_ledger.gd must exist")
    if not FileAccess.file_exists(LEDGER_PATH):
        return

    var Ledger = load(LEDGER_PATH)
    var Stock = load(STOCK_PATH)
    var Vault = load(VAULT_PATH)
    var Types = load(TYPES_PATH)
    case.assert_true(Ledger != null, "ResourceReservationLedger must load")
    if Ledger == null:
        return

    var stock = Stock.create(3)
    stock.add_one()
    stock.add_one()
    stock.add_one()
    var vault = Vault.create(1)
    var scribe = vault.reserve_for_scribe(&"HEAT", &"seed-vault")
    vault.complete_scribe(scribe.reservation_id)
    var ledger = Ledger.create(stock, vault)

    var omitted = ledger.reserve_node(&"HEAT", &"node-none", &"tx-none", -1)
    case.assert_equal(&"SOURCE_REQUIRED", omitted.status, "source is never chosen automatically")
    case.assert_equal(3, stock.available_count(), "omitted source consumes no Stock")
    case.assert_equal(1, vault.matching_available_count(&"HEAT"), "omitted source consumes no Vault glyph")

    var stock_result = ledger.reserve_node(
        &"HEAT", &"node-a", &"tx-a", Types.Source.UNIVERSAL_STOCK
    )
    case.assert_equal(&"OK", stock_result.status, "explicit Stock source reserves")
    case.assert_equal(Types.Source.UNIVERSAL_STOCK, stock_result.source, "source is retained")
    case.assert_equal(2, stock.available_count(), "one Stock is reserved")

    var duplicate_node = ledger.reserve_node(
        &"FLOW", &"node-a", &"tx-other", Types.Source.UNIVERSAL_STOCK
    )
    case.assert_equal(&"NODE_ALREADY_RESERVED", duplicate_node.status, "one node owns one reservation")

    var vault_result = ledger.reserve_node(&"HEAT", &"node-b", &"tx-b", Types.Source.VAULT)
    case.assert_equal(&"OK", vault_result.status, "matching Vault source reserves")
    case.assert_equal(0, vault.matching_available_count(&"HEAT"), "Vault glyph becomes reserved")

    case.assert_true(ledger.cancel_node(&"node-a"), "cancel releases node Stock")
    case.assert_equal(3, stock.available_count(), "cancel restores Stock")

    var replace = ledger.replace_source(&"node-b", Types.Source.UNIVERSAL_STOCK)
    case.assert_equal(&"OK", replace.status, "source can be replaced explicitly")
    case.assert_equal(Types.Source.UNIVERSAL_STOCK, replace.source, "replacement source is visible")
    case.assert_equal(1, vault.matching_available_count(&"HEAT"), "old Vault source is released")
    case.assert_equal(2, stock.available_count(), "new Stock source is reserved")

    var flow = ledger.reserve_node(&"FLOW", &"node-c", &"tx-c", Types.Source.UNIVERSAL_STOCK)
    case.assert_equal(&"OK", flow.status, "second Stock node reserves")
    case.assert_equal(1, stock.available_count(), "two Stock reservations are active")

    var failed_replace = ledger.replace_source(&"node-c", Types.Source.VAULT)
    case.assert_equal(&"NO_MATCHING_VAULT_GLYPH", failed_replace.status, "unavailable replacement fails")
    var rolled_back = ledger.reservation_for_node(&"node-c")
    case.assert_equal(Types.Source.UNIVERSAL_STOCK, rolled_back.source, "failed replacement restores old source")
    case.assert_equal(1, stock.available_count(), "rollback preserves original Stock reservation")

    case.assert_true(ledger.cancel_node(&"node-b"), "first node cancels")
    case.assert_true(ledger.cancel_node(&"node-c"), "second node cancels")
    case.assert_equal(3, stock.available_count(), "all Stock reservations are released")
    case.assert_false(ledger.cancel_node(&"node-c"), "duplicate cancel is rejected")

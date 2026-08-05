extends RefCounted

const POOL_PATH := "res://src/core/resources/universal_stock_pool.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(POOL_PATH), "universal_stock_pool.gd must exist")
    if not FileAccess.file_exists(POOL_PATH):
        return

    var Pool = load(POOL_PATH)
    case.assert_true(Pool != null, "UniversalStockPool must load")
    if Pool == null:
        return

    var stock = Pool.create(2)
    case.assert_true(stock != null, "positive capacity creates a pool")
    case.assert_true(stock.add_one(), "first Stock fits")
    case.assert_true(stock.add_one(), "second Stock fits")
    case.assert_false(stock.add_one(), "capacity blocks third Stock")

    var reserved = stock.reserve(&"HEAT", &"node-a", &"tx-a")
    case.assert_equal(&"OK", reserved.status, "learned glyph choice reserves one fungible Stock")
    case.assert_equal(1, stock.available_count(), "reservation changes availability only")
    case.assert_equal(2, stock.current_total(), "reservation does not add capacity usage")

    case.assert_true(stock.release(reserved.reservation_id), "cancel releases reservation")
    case.assert_equal(2, stock.available_count(), "released Stock becomes available")

    var second = stock.reserve(&"FLOW", &"node-b", &"tx-b")
    case.assert_true(stock.consume(second.reservation_id), "commit consumes reservation")
    case.assert_equal(1, stock.current_total(), "consumption reduces total")
    case.assert_false(stock.consume(second.reservation_id), "duplicate consume is rejected")

    var saved_reservation = stock.reserve(&"FOCUS", &"node-c", &"tx-c")
    var data = stock.to_dict()
    case.assert_equal(1, data.schema_version, "Stock schema is versioned")
    case.assert_equal(2, data.capacity, "capacity is serialized")
    case.assert_equal(1, data.current_total, "total is serialized")
    case.assert_equal(1, data.reservations.size(), "reservations are serialized")
    case.assert_equal(saved_reservation.reservation_id, data.reservations[0].reservation_id, "reservations are stable")

    var restored = Pool.from_dict(data)
    case.assert_equal(&"OK", restored.status, "valid state restores")
    case.assert_equal(0, restored.pool.available_count(), "restored reservation remains owned")

    var over_capacity = data.duplicate(true)
    over_capacity.current_total = 3
    case.assert_equal(&"CORRUPT_UNIVERSAL_STOCK", Pool.from_dict(over_capacity).status, "over-capacity state is rejected")

    var duplicate_ids = data.duplicate(true)
    duplicate_ids.reservations.append(duplicate_ids.reservations[0].duplicate(true))
    case.assert_equal(&"CORRUPT_UNIVERSAL_STOCK", Pool.from_dict(duplicate_ids).status, "duplicate reservations are rejected")

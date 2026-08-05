extends RefCounted

const POOL_PATH := "res://src/core/resources/typed_glyph_stock_pool.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(POOL_PATH), "typed_glyph_stock_pool.gd must exist")
    if not FileAccess.file_exists(POOL_PATH):
        return
    var Pool = load(POOL_PATH)
    case.assert_true(Pool != null and Pool.can_instantiate(), "TypedGlyphStockPool compiles")
    if Pool == null or not Pool.can_instantiate():
        return

    var pool = Pool.create(3)
    case.assert_true(pool != null, "Typed stock pool factory succeeds")
    case.assert_true(pool.add_one(&"HEAT"), "first HEAT stock is added")
    case.assert_true(pool.add_one(&"HEAT"), "second HEAT stock is added")
    case.assert_true(pool.add_one(&"FLOW"), "FLOW stock is added")
    case.assert_false(pool.add_one(&"PROTECT"), "shared capacity blocks a fourth stock")
    case.assert_equal(2, pool.matching_count(&"HEAT"), "HEAT count is typed")
    case.assert_equal(1, pool.matching_count(&"FLOW"), "FLOW count is typed")
    case.assert_equal(0, pool.matching_count(&"PROTECT"), "missing glyph has no stock")

    var wrong: Dictionary = pool.reserve(&"PROTECT", &"node-p", &"tx-p")
    case.assert_equal(&"NO_MATCHING_TYPED_STOCK", wrong.status, "other glyph stock cannot substitute")
    var flow: Dictionary = pool.reserve(&"FLOW", &"node-f", &"tx-f")
    case.assert_equal(&"OK", flow.status, "matching FLOW stock reserves")
    case.assert_equal(0, pool.matching_available_count(&"FLOW"), "reserved FLOW is unavailable")
    case.assert_true(pool.consume(flow.reservation_id), "matching FLOW reservation consumes")
    case.assert_equal(0, pool.matching_count(&"FLOW"), "FLOW count decreases only after consume")
    case.assert_equal(2, pool.matching_count(&"HEAT"), "FLOW consume does not mutate HEAT")

    var generation_pool = Pool.create(2)
    case.assert_true(generation_pool.add_one(&"HEAT"), "seed HEAT for generation capacity test")
    var generation: Dictionary = generation_pool.reserve_generation(&"FLOW", &"scribe-flow")
    case.assert_equal(&"OK", generation.status, "focus scribe reserves shared capacity")
    case.assert_equal(0, generation_pool.available_capacity(), "generation reservation owns last capacity")
    case.assert_equal(&"NO_STOCK_CAPACITY", generation_pool.reserve_generation(&"PROTECT", &"scribe-protect").status, "second generation cannot overbook")
    var completed: Dictionary = generation_pool.complete_generation(&"scribe-flow")
    case.assert_equal(&"TYPED_STOCK_CREATED", completed.status, "generation creates typed stock")
    case.assert_equal(1, generation_pool.matching_count(&"FLOW"), "generated stock keeps selected glyph id")

    var restored_result: Dictionary = Pool.from_dict(generation_pool.to_dict())
    case.assert_equal(&"OK", restored_result.status, "typed stock snapshot restores")
    if restored_result.status == &"OK":
        case.assert_equal(1, restored_result.pool.matching_count(&"HEAT"), "restored HEAT count matches")
        case.assert_equal(1, restored_result.pool.matching_count(&"FLOW"), "restored FLOW count matches")

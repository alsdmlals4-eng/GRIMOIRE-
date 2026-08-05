extends RefCounted

const CHARGE_PATH := "res://src/core/resources/universal_stock_charge.gd"
const STOCK_PATH := "res://src/core/resources/universal_stock_pool.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(CHARGE_PATH), "universal_stock_charge.gd must exist")
    if not FileAccess.file_exists(CHARGE_PATH):
        return

    var Charge = load(CHARGE_PATH)
    var Stock = load(STOCK_PATH)
    case.assert_true(Charge != null, "UniversalStockCharge must load")
    if Charge == null:
        return
    case.assert_true(Charge.can_instantiate(), "UniversalStockCharge must compile")
    if not Charge.can_instantiate():
        return

    var charge = Charge.create(10.0)
    var stock = Stock.create(2)
    case.assert_true(charge != null, "positive duration creates a charge state")
    if charge == null:
        return

    var required_methods := [
        &"advance_active_pressure",
        &"apply_direct_hit_pause",
        &"progress_seconds",
        &"waiting_for_capacity",
        &"has_target_glyph",
        &"to_dict",
    ]
    var methods_ready := true
    for method_name in required_methods:
        var exists: bool = bool(charge.has_method(method_name))
        case.assert_true(exists, "Charge method must exist: %s" % String(method_name))
        methods_ready = methods_ready and exists
    if not methods_ready:
        return

    charge.advance_active_pressure(4.0, stock)
    case.assert_near(4.0, charge.progress_seconds(), 0.001, "one shared progress advances")
    case.assert_false(charge.has_target_glyph(), "universal charge has no glyph target")

    charge.apply_direct_hit_pause(0.5)
    charge.advance_active_pressure(0.25, stock)
    case.assert_near(4.0, charge.progress_seconds(), 0.001, "pause blocks first partial frame")
    charge.advance_active_pressure(0.25, stock)
    case.assert_near(4.0, charge.progress_seconds(), 0.001, "pause consumes its remaining boundary")
    charge.advance_active_pressure(6.0, stock)
    case.assert_equal(1, stock.current_total(), "completion creates one Universal Stock")
    case.assert_near(0.0, charge.progress_seconds(), 0.001, "progress resets after completion")

    stock.add_one()
    charge.advance_active_pressure(10.0, stock)
    case.assert_equal(2, stock.current_total(), "capacity remains full")
    case.assert_true(charge.waiting_for_capacity(), "full capacity pauses at completion boundary")
    case.assert_near(10.0, charge.progress_seconds(), 0.001, "full progress is preserved while waiting")

    charge.advance_active_pressure(2.0, stock)
    case.assert_equal(2, stock.current_total(), "repeated full frames do not duplicate Stock")
    case.assert_near(10.0, charge.progress_seconds(), 0.001, "waiting progress stays clamped")

    var held = stock.reserve(&"HEAT", &"node-capacity", &"tx-capacity")
    case.assert_true(stock.consume(held.reservation_id), "one Stock can be spent to free capacity")
    charge.advance_active_pressure(0.1, stock)
    case.assert_equal(2, stock.current_total(), "next positive advance retries exactly one completion")
    case.assert_false(charge.waiting_for_capacity(), "capacity wait clears after successful retry")
    case.assert_near(0.0, charge.progress_seconds(), 0.001, "retried completion resets progress")

    var save_stock = Stock.create(2)
    var save_charge = Charge.create(10.0)
    save_charge.advance_active_pressure(9.5, save_stock)
    var state = save_charge.to_dict()
    case.assert_equal(1, state.schema_version, "charge schema is versioned")
    case.assert_near(9.5, float(state.progress_seconds), 0.001, "partial progress is serialized")

    var restored = Charge.from_dict(state)
    case.assert_equal(&"OK", restored.status, "valid charge state restores")
    restored.charge.advance_active_pressure(0.5, save_stock)
    case.assert_equal(1, save_stock.current_total(), "restored completion creates one Stock")
    restored.charge.advance_active_pressure(0.5, save_stock)
    case.assert_equal(1, save_stock.current_total(), "post-completion frame does not duplicate Stock")

    var corrupt = state.duplicate(true)
    corrupt.progress_seconds = 11.0
    case.assert_equal(&"CORRUPT_UNIVERSAL_STOCK_CHARGE", Charge.from_dict(corrupt).status, "over-threshold progress is rejected")

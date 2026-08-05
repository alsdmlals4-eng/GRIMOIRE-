extends RefCounted

const SESSION_PATH := "res://src/core/resources/focus_scribing_session.gd"
const STOCK_PATH := "res://src/core/resources/typed_glyph_stock_pool.gd"
const MANA_PATH := "res://src/core/resources/mana_pool.gd"


func run(case) -> void:
    for path in [SESSION_PATH, STOCK_PATH, MANA_PATH]:
        case.assert_true(FileAccess.file_exists(path), "Focus scribe dependency exists: %s" % path)
    if not FileAccess.file_exists(SESSION_PATH) or not FileAccess.file_exists(STOCK_PATH):
        return
    var Session = load(SESSION_PATH)
    var Stock = load(STOCK_PATH)
    var Mana = load(MANA_PATH)
    case.assert_true(Session != null and Session.can_instantiate(), "FocusScribingSession compiles")
    if Session == null or not Session.can_instantiate():
        return

    var stock = Stock.create(2)
    var mana = Mana.create(10)
    var session = Session.create(stock, mana, &"HEAT", &"focus-heat", 3.0, 1.0)
    case.assert_true(session != null, "Focus scribe session factory succeeds")
    case.assert_equal(&"ACTIVE", session.start().status, "Focus scribe reserves capacity and starts")
    var after_one: Dictionary = session.advance(1.0)
    case.assert_equal(&"ACTIVE", after_one.status, "Focus scribe remains active before duration")
    case.assert_equal(9, mana.current(), "Mana drains by real second")
    var completed: Dictionary = session.advance(2.0)
    case.assert_equal(&"FOCUS_SCRIBE_COMPLETED", completed.status, "Focus scribe completes at duration")
    case.assert_equal(1, completed.stock_gain, "Completion creates one stock")
    case.assert_equal(1, stock.matching_count(&"HEAT"), "Completion creates selected glyph stock")
    case.assert_equal(7, mana.current(), "Completion keeps spent mana")
    case.assert_equal(0.25, completed.active_pressure_scale, "Active pressure uses approved 0.25 test value")

    var cancel_stock = Stock.create(2)
    var cancel_mana = Mana.create(10)
    var cancel_session = Session.create(cancel_stock, cancel_mana, &"FLOW", &"focus-flow", 3.0, 1.0)
    cancel_session.start()
    cancel_session.advance(1.0)
    var cancelled: Dictionary = cancel_session.cancel()
    case.assert_equal(&"FOCUS_SCRIBE_INTERRUPTED", cancelled.status, "Player cancel interrupts session")
    case.assert_true(cancelled.cancel_no_refund, "Cancel explicitly has no refund")
    case.assert_equal(9, cancel_mana.current(), "Spent mana is not refunded")
    case.assert_equal(0, cancel_stock.matching_count(&"FLOW"), "Cancelled scribe creates no stock")
    case.assert_equal(2, cancel_stock.available_capacity(), "Cancelled scribe releases capacity")

    var empty_stock = Stock.create(1)
    var empty_mana = Mana.create(0)
    var empty_session = Session.create(empty_stock, empty_mana, &"PROTECT", &"focus-protect", 2.0, 1.0)
    empty_session.start()
    var mana_zero: Dictionary = empty_session.advance(1.0)
    case.assert_equal(&"FOCUS_SCRIBE_INTERRUPTED", mana_zero.status, "Mana zero interrupts")
    case.assert_equal(&"MANA_ZERO", mana_zero.reason, "Mana zero cause is explicit")
    case.assert_equal(0, empty_stock.matching_count(&"PROTECT"), "Mana-zero scribe creates no stock")

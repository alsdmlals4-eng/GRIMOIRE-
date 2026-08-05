extends RefCounted

const RESULT_LEDGER_PATH := "res://src/core/atomic_result_ledger.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(RESULT_LEDGER_PATH), "atomic_result_ledger.gd must exist")
    if not FileAccess.file_exists(RESULT_LEDGER_PATH):
        return

    var Ledger = load(RESULT_LEDGER_PATH)
    case.assert_true(Ledger != null, "AtomicResultLedger must load")
    if Ledger == null:
        return
    case.assert_true(Ledger.can_instantiate(), "AtomicResultLedger must compile")
    if not Ledger.can_instantiate():
        return

    var ledger = Ledger.new()
    var required_methods := [&"commit_once", &"serialize", &"restore", &"result_for"]
    var methods_ready := true
    for method_name in required_methods:
        var exists: bool = bool(ledger.has_method(method_name))
        case.assert_true(exists, "Result ledger method must exist: %s" % String(method_name))
        methods_ready = methods_ready and exists
    if not methods_ready:
        return

    var first = ledger.commit_once(&"tx-001", {"effect": &"HEAT_FLOW", "nested": {"value": 1}})
    case.assert_true(first.applied, "first transaction applies")
    case.assert_equal(&"tx-001", first.transaction_id, "transaction ID is retained")
    case.assert_equal(1, first.result.nested.value, "result payload is stored")

    first.result.nested.value = 99
    var duplicate = ledger.commit_once(&"tx-001", {"effect": &"OTHER", "nested": {"value": -1}})
    case.assert_false(duplicate.applied, "duplicate transaction does not apply")
    case.assert_equal(&"HEAT_FLOW", duplicate.result.effect, "duplicate returns original payload")
    case.assert_equal(1, duplicate.result.nested.value, "returned payload mutation cannot corrupt ledger")

    var direct = ledger.result_for(&"tx-001")
    direct.nested.value = 55
    case.assert_equal(1, ledger.result_for(&"tx-001").nested.value, "result_for returns a deep copy")

    var saved = ledger.serialize()
    saved["tx-001"].nested.value = 77
    case.assert_equal(1, ledger.result_for(&"tx-001").nested.value, "serialized data is a deep copy")

    var restored = Ledger.new()
    restored.restore(ledger.serialize())
    var after_restore = restored.commit_once(&"tx-001", {})
    case.assert_false(after_restore.applied, "restored ledger remains idempotent")
    case.assert_equal(&"HEAT_FLOW", after_restore.result.effect, "restored result is preserved")

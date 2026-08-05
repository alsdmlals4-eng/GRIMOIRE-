class_name PocTestCase
extends RefCounted

var _failures: Array[String] = []
var _assertions: int = 0

func assert_true(condition: bool, message: String) -> void:
    _assertions += 1
    if not condition:
        _fail(message)

func assert_false(condition: bool, message: String) -> void:
    assert_true(not condition, message)

func assert_equal(expected: Variant, actual: Variant, message: String) -> void:
    _assertions += 1
    if expected != actual:
        _fail("%s | expected=%s actual=%s" % [message, str(expected), str(actual)])

func assert_near(expected: float, actual: float, tolerance: float, message: String) -> void:
    _assertions += 1
    if absf(expected - actual) > tolerance:
        _fail("%s | expected=%f actual=%f tolerance=%f" % [message, expected, actual, tolerance])

func fail(message: String) -> void:
    _assertions += 1
    _fail(message)

func failure_count() -> int:
    return _failures.size()

func assertion_count() -> int:
    return _assertions

func failures() -> Array[String]:
    return _failures.duplicate()

func _fail(message: String) -> void:
    _failures.append(message)
    push_error(message)

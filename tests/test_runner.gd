extends SceneTree

const TestCase = preload("res://tests/test_case.gd")

const SUITES: Array[String] = [
    "res://tests/unit/test_glyph_resource_types.gd",
    "res://tests/unit/test_universal_stock_pool.gd",
    "res://tests/unit/test_vault_inventory.gd",
    "res://tests/unit/test_resource_reservation_ledger.gd",
    "res://tests/unit/test_universal_stock_charge.gd",
    "res://tests/unit/test_atomic_result_ledger.gd",
    "res://tests/unit/test_atomic_spell_commit_service.gd",
    "res://tests/unit/test_glyph_resource_snapshot.gd",
    "res://tests/integration/test_glyph_resource_lifecycle.gd",
    "res://tests/unit/test_glyph_resource_view_model.gd",
    "res://tests/unit/test_glyph_definition.gd",
    "res://tests/unit/test_glyph_template_repository.gd",
    "res://tests/unit/test_dollar_one_recognizer.gd",
    "res://tests/unit/test_dollar_n_recognizer.gd",
    "res://tests/unit/test_glyph_recognition_service.gd",
]

func _init() -> void:
    var case = TestCase.new()
    for suite_path in SUITES:
        var suite_script = load(suite_path)
        if suite_script == null:
            case.fail("Could not load suite: %s" % suite_path)
            continue
        if not suite_script.can_instantiate():
            case.fail("Suite cannot instantiate: %s" % suite_path)
            continue
        var suite = suite_script.new()
        if not suite.has_method("run"):
            case.fail("Suite has no run(case): %s" % suite_path)
            continue
        suite.run(case)

    var report := {
        "schema_version": 1,
        "suite_count": SUITES.size(),
        "assertions": case.assertion_count(),
        "failures": case.failure_count(),
        "failure_messages": case.failures(),
    }
    print(JSON.stringify(report))
    quit(0 if case.failure_count() == 0 else 1)

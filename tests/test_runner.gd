extends SceneTree

const TestCase = preload("res://tests/test_case.gd")

const SUITES: Array[String] = [
    "res://tests/unit/test_no_star_runtime_guard.gd",
    "res://tests/unit/test_circle_composition.gd",
    "res://tests/unit/test_event_clock_resolver.gd",
    "res://tests/unit/test_card_ruleset.gd",
    "res://tests/unit/test_story_progress.gd",
    "res://tests/integration/test_story_front_door.gd",
    "res://tests/integration/test_first_class_root.gd",
    "res://tests/integration/test_story_event_root.gd",
    "res://tests/integration/test_duel_practicum_root.gd",
    "res://tests/integration/test_festival_canopy_root.gd",
    "res://tests/integration/test_circle_glyph_writing_panel.gd",
    "res://tests/integration/test_card_archive_screen.gd",
    "res://tests/unit/test_artifact_recovery_scanner_boundary.gd",
    "res://tests/unit/test_tmp_scanner_boundary.gd",
    "res://tests/unit/test_glyph_resource_types.gd",
    "res://tests/unit/test_glyph_catalog.gd",
    "res://tests/unit/test_universal_stock_pool.gd",
    "res://tests/unit/test_typed_glyph_stock_pool.gd",
    "res://tests/unit/test_vault_inventory.gd",
    "res://tests/unit/test_resource_reservation_ledger.gd",
    "res://tests/unit/test_universal_stock_charge.gd",
    "res://tests/unit/test_focus_scribing_session.gd",
    "res://tests/unit/test_atomic_result_ledger.gd",
    "res://tests/unit/test_glyph_resource_snapshot.gd",
    "res://tests/unit/test_glyph_resource_view_model.gd",
    "res://tests/unit/test_glyph_definition.gd",
    "res://tests/unit/test_glyph_template_repository.gd",
    "res://tests/unit/test_dollar_one_recognizer.gd",
    "res://tests/unit/test_dollar_n_recognizer.gd",
    "res://tests/unit/test_glyph_recognition_service.gd",
    "res://tests/integration/test_slice_glyph_recognition.gd",
    "res://tests/unit/test_glyph_writing_view_model.gd",
    "res://tests/integration/test_mobile_safe_root.gd",
    "res://tests/integration/test_glyph_stroke_canvas.gd",
]


func _init() -> void:
    call_deferred("_run")


func _run() -> void:
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

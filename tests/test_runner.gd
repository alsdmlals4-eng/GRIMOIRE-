extends SceneTree

const TestCase = preload("res://tests/test_case.gd")

const SUITES: Array[String] = [
    "res://tests/unit/test_glyph_resource_types.gd",
    "res://tests/unit/test_glyph_catalog.gd",
    "res://tests/unit/test_glyph_source_loadout.gd",
    "res://tests/unit/test_universal_stock_pool.gd",
    "res://tests/unit/test_typed_glyph_stock_pool.gd",
    "res://tests/unit/test_vault_inventory.gd",
    "res://tests/unit/test_resource_reservation_ledger.gd",
    "res://tests/unit/test_universal_stock_charge.gd",
    "res://tests/unit/test_focus_scribing_session.gd",
    "res://tests/unit/test_atomic_result_ledger.gd",
    "res://tests/unit/test_atomic_spell_commit_service.gd",
    "res://tests/unit/test_prepared_spell_inventory.gd",
    "res://tests/unit/test_circuit_placement_session.gd",
    "res://tests/unit/test_atomic_spell_preparation_service.gd",
    "res://tests/unit/test_atomic_spell_use_service.gd",
    "res://tests/unit/test_spell_workflow_state.gd",
    "res://tests/unit/test_spell_workflow_coordinator.gd",
    "res://tests/unit/test_glyph_resource_snapshot.gd",
    "res://tests/integration/test_glyph_resource_lifecycle.gd",
    "res://tests/unit/test_glyph_resource_view_model.gd",
    "res://tests/unit/test_glyph_definition.gd",
    "res://tests/unit/test_glyph_template_repository.gd",
    "res://tests/unit/test_dollar_one_recognizer.gd",
    "res://tests/unit/test_dollar_n_recognizer.gd",
    "res://tests/unit/test_glyph_recognition_service.gd",
    "res://tests/unit/test_focus_scribe_recognition.gd",
    "res://tests/integration/test_slice_glyph_recognition.gd",
    "res://tests/unit/test_glyph_writing_view_model.gd",
    "res://tests/unit/test_glyph_visual_resolver.gd",
    "res://tests/integration/test_mobile_safe_root.gd",
    "res://tests/unit/test_star_circuit_validator.gd",
    "res://tests/unit/test_star_circuit_calculator.gd",
    "res://tests/unit/test_star_circuit_state.gd",
    "res://tests/unit/test_star_circuit_commit_coordinator.gd",
    "res://tests/unit/test_star_circuit_layout_model.gd",
    "res://tests/unit/test_spell_resolution_policy.gd",
    "res://tests/unit/test_focus_scribing_overlay.gd",
    "res://tests/integration/test_star_circuit_harness_scene.gd",
    "res://tests/integration/test_star_ui_kit_scene.gd",
    "res://tests/integration/test_component_sheet_pack.gd",
    "res://tests/integration/test_star_circuit_end_to_end.gd",
    "res://tests/integration/test_frostbloom_star_ux_map.gd",
    "res://tests/integration/test_glyph_drawing_workflow_screen.gd",
    "res://tests/integration/test_circuit_placement_workflow_screen.gd",
    "res://tests/integration/test_spell_use_screen.gd",
    "res://tests/integration/test_spell_workflow_product_root.gd",
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

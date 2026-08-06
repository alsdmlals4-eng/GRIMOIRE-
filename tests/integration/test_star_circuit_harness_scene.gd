extends RefCounted

const SCENE_PATH := "res://src/ui/star_circuit_harness.tscn"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(SCENE_PATH), "Star circuit harness scene must exist")
    if not FileAccess.file_exists(SCENE_PATH):
        return
    var packed = load(SCENE_PATH)
    case.assert_true(packed != null and packed.can_instantiate(), "Star harness scene must load")
    if packed == null or not packed.can_instantiate():
        return

    var scene = packed.instantiate()
    case.assert_true(scene.get_node_or_null("SafeArea/CenterGlyph") != null, "Center glyph control exists")
    for index in range(5):
        case.assert_true(scene.get_node_or_null("SafeArea/StarVertices/Vertex%s" % index) != null, "Vertex %s exists" % index)
    case.assert_true(scene.get_node_or_null("SafeArea/CircuitPreviewPanel") != null, "Circuit preview exists")
    case.assert_true(scene.get_node_or_null("SafeArea/TargetKeywordPanel") != null, "Target keyword panel exists")
    case.assert_true(scene.get_node_or_null("SafeArea/FinalPreviewPanel") != null, "Final preview exists")
    case.assert_true(scene.get_node_or_null("SafeArea/PreviewButton") != null, "Explicit circuit preview button exists")
    case.assert_true(scene.get_node_or_null("SafeArea/TargetKeywordPanel/Content/TargetButtons/FlowerButton") != null, "Flower target button exists")
    case.assert_true(scene.get_node_or_null("SafeArea/TargetKeywordPanel/Content/TargetButtons/WardButton") != null, "Ward target button exists")
    case.assert_true(scene.get_node_or_null("SafeArea/CommitButton") != null, "Explicit commit button exists")
    case.assert_true(scene.has_method("test_contract_snapshot"), "Harness exposes read-only test contract snapshot")
    if scene.has_method("test_contract_snapshot"):
        var snapshot: Dictionary = scene.test_contract_snapshot()
        case.assert_equal(5, snapshot.vertex_count, "Harness has five vertices")
        case.assert_true(float(snapshot.minimum_touch_target) >= 48.0, "Harness touch target is at least 48dp")
        case.assert_false(bool(snapshot.slot_order_effect), "Vertex order has no hidden effect")
        case.assert_true(bool(snapshot.target_after_circuit_preview), "Target follows circuit preview")
        case.assert_true(bool(snapshot.numeric_success_preview), "Numeric success preview is exposed")
        case.assert_true(bool(snapshot.interactive_demo), "Harness declares an interactive demo")

    case.assert_true(scene.has_method("initialize_demo"), "Harness exposes deterministic demo initialization")
    case.assert_true(scene.has_method("test_interaction_snapshot"), "Harness exposes interaction state for tests")
    if not scene.has_method("initialize_demo") or not scene.has_method("test_interaction_snapshot"):
        scene.free()
        return

    scene.initialize_demo()
    var initial: Dictionary = scene.test_interaction_snapshot()
    case.assert_equal(&"EDIT", initial.phase, "Demo starts in edit phase")
    case.assert_equal(&"HEAT", initial.main_glyph, "Demo starts with HEAT as main glyph")
    case.assert_equal(&"FLOW", initial.auxiliary_glyphs[0], "Demo starts with FLOW auxiliary for a visible typed-stock example")
    case.assert_false(bool(initial.target_enabled), "Targets remain locked before circuit preview")
    case.assert_false(bool(initial.commit_enabled), "Commit remains locked before final preview")

    scene.get_node("SafeArea/PreviewButton").pressed.emit()
    var circuit_ready: Dictionary = scene.test_interaction_snapshot()
    case.assert_equal(&"TARGET", circuit_ready.phase, "Preview advances to target selection")
    case.assert_true(bool(circuit_ready.target_enabled), "Targets unlock after circuit preview")
    case.assert_false(bool(circuit_ready.commit_enabled), "Commit remains locked until target selection")

    scene.get_node("SafeArea/TargetKeywordPanel/Content/TargetButtons/FlowerButton").pressed.emit()
    var final_ready: Dictionary = scene.test_interaction_snapshot()
    case.assert_equal(&"FINAL", final_ready.phase, "Target selection creates final preview")
    case.assert_equal(70, final_ready.success_percent, "Interactive example exposes the approved 70 percent final preview")
    case.assert_equal(16, final_ready.final_mana, "Interactive example exposes the approved 16 mana final preview")
    case.assert_true(bool(final_ready.commit_enabled), "Commit unlocks only after final preview")

    scene.get_node("SafeArea/CommitButton").pressed.emit()
    var confirmation: Dictionary = scene.test_interaction_snapshot()
    case.assert_equal(&"CONFIRM", confirmation.phase, "First commit press requests explicit confirmation")
    case.assert_equal("CONFIRM COMMIT", scene.get_node("SafeArea/CommitButton").text, "Commit button clearly changes to confirmation")

    scene.get_node("SafeArea/CommitButton").pressed.emit()
    var committed: Dictionary = scene.test_interaction_snapshot()
    case.assert_equal(&"COMMITTED", committed.phase, "Second commit press commits the spell")
    case.assert_true(int(committed.mana) < int(initial.mana), "Committed demo consumes the previewed mana")
    case.assert_equal(
        int(initial.stock_counts.get(&"FLOW", 0)) - 1,
        int(committed.stock_counts.get(&"FLOW", 0)),
        "Committed demo consumes only the matching FLOW typed stock"
    )
    case.assert_true(String(committed.last_status).contains("COMMITTED"), "Committed result is visible")
    scene.free()

    var cancel_scene = packed.instantiate()
    cancel_scene.initialize_demo()
    var before_cancel: Dictionary = cancel_scene.test_interaction_snapshot()
    cancel_scene.get_node("SafeArea/CancelButton").pressed.emit()
    var after_cancel: Dictionary = cancel_scene.test_interaction_snapshot()
    case.assert_equal(before_cancel.mana, after_cancel.mana, "Cancel/reset spends no mana")
    case.assert_equal(before_cancel.stock_counts, after_cancel.stock_counts, "Cancel/reset consumes no typed stock")
    case.assert_equal(&"EDIT", after_cancel.phase, "Cancel returns to a fresh edit phase")
    cancel_scene.free()

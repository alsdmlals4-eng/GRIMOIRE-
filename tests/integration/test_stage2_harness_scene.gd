extends RefCounted

const SCENE_PATH := "res://src/ui/stage2_circuit_bridge_harness.tscn"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(SCENE_PATH), "Stage2 low-fi Harness scene must exist")
    if not FileAccess.file_exists(SCENE_PATH):
        return
    var packed = load(SCENE_PATH)
    case.assert_true(packed is PackedScene, "Stage2 Harness scene must parse")
    if not (packed is PackedScene):
        return
    var root = packed.instantiate()
    case.assert_true(root != null, "Stage2 Harness scene instantiates")
    if root == null:
        return

    for path in [
        "SafeRoot/ObjectiveThreatSituation",
        "SafeRoot/Body/GlyphRail",
        "SafeRoot/Body/TargetCircuit",
        "SafeRoot/Body/WritingFocus",
        "SafeRoot/ResourcePreviewCommit",
    ]:
        case.assert_true(root.has_node(path), "Required low-fi region exists: %s" % path)

    for path in [
        "SafeRoot/ResourcePreviewCommit/PreviewButton",
        "SafeRoot/ResourcePreviewCommit/CommitButton",
        "SafeRoot/ResourcePreviewCommit/CancelButton",
    ]:
        var button = root.get_node_or_null(path)
        case.assert_true(button is Button, "Required tap action is a Button: %s" % path)
        if button is Button:
            case.assert_true(button.custom_minimum_size.x >= 48.0, "Button width meets 48dp test target")
            case.assert_true(button.custom_minimum_size.y >= 48.0, "Button height meets 48dp test target")
            case.assert_true(not button.text.strip_edges().is_empty(), "Button has explicit text label")

    case.assert_true(root.has_node("SafeRoot/Body/TargetCircuit/CircuitGrid"), "3x3 CircuitGrid exists")
    var grid = root.get_node("SafeRoot/Body/TargetCircuit/CircuitGrid")
    case.assert_true(grid is GridContainer, "CircuitGrid uses explicit grid container")
    if grid is GridContainer:
        case.assert_equal(3, grid.columns, "CircuitGrid has three columns")
        case.assert_equal(9, grid.get_child_count(), "CircuitGrid exposes nine tap cells")

    for method_name in [&"apply_scenario", &"set_active_stroke", &"apply_accessibility_mode"]:
        case.assert_true(root.has_method(method_name), "Harness controller exposes %s" % method_name)
    if not root.has_method(&"apply_scenario") or not root.has_method(&"set_active_stroke"):
        root.free()
        return

    case.assert_true(root.apply_scenario({
        "objective": "Keep the ward intact",
        "threat": "Cracks are spreading",
        "situation": "Students are evacuating",
    }), "Scenario context applies to persistent top region")
    var context_text: String = root.get_node("SafeRoot/ObjectiveThreatSituation/ContextText").text
    case.assert_true(context_text.contains("Keep the ward intact"), "Objective remains visible")
    case.assert_true(context_text.contains("Cracks are spreading"), "Threat remains visible")
    case.assert_true(context_text.contains("Students are evacuating"), "Situation remains visible")

    case.assert_true(root.set_active_stroke(true), "Writing Canvas can acquire active stroke ownership")
    for cell in grid.get_children():
        case.assert_true(cell.disabled, "Circuit cells disable during active stroke")
    case.assert_true(root.get_node("SafeRoot/ResourcePreviewCommit/PreviewButton").disabled, "Preview disables during active stroke")
    case.assert_true(root.get_node("SafeRoot/ResourcePreviewCommit/CommitButton").disabled, "Commit disables during active stroke")
    case.assert_false(root.get_node("SafeRoot/ResourcePreviewCommit/CancelButton").disabled, "Tap cancel remains available")
    case.assert_true(root.set_active_stroke(false), "Writing Canvas releases active stroke ownership")

    case.assert_true(root.apply_accessibility_mode(true), "Reduced motion mode applies")
    case.assert_equal(0, root.get_meta("transition_duration_ms"), "Reduced motion uses 0ms state swap")
    root.free()

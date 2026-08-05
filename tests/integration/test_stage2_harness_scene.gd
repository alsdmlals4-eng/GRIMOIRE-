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
    root.free()

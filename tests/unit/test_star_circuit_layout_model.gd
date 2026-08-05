extends RefCounted

const PATH := "res://src/ui/star_circuit_layout_model.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Star circuit layout model must exist")
    if not FileAccess.file_exists(PATH):
        return
    var script = load(PATH)
    case.assert_true(script != null and script.can_instantiate(), "Star layout model must load")
    if script == null or not script.can_instantiate():
        return
    var model = script.new()
    var layout: Dictionary = model.layout_for(Vector2(1280, 720), Rect2(0, 0, 1280, 720), 1.0, false)
    case.assert_equal(5, Array(layout.get("vertices", [])).size(), "Five equal star vertices are exposed")
    case.assert_equal(Vector2(640, 340), layout.get("center"), "Main glyph stays at center")
    case.assert_true(float(layout.get("minimum_touch_target", 0.0)) >= 48.0, "Mobile target is at least 48dp")
    case.assert_equal(0, layout.get("transition_ms_reduced_motion"), "Reduced motion uses zero duration")
    case.assert_false(bool(layout.get("slot_order_effect", true)), "Vertex order has no hidden effect")

extends RefCounted

const ROOT_SCRIPT_PATH := "res://src/ui/mobile_safe_root.gd"
const ROOT_SCENE_PATH := "res://src/ui/mobile_safe_root.tscn"
const RESOLUTIONS: Array[Vector2i] = [
    Vector2i(1280, 720),
    Vector2i(1600, 900),
    Vector2i(1920, 1080),
    Vector2i(2400, 1080),
]
const TEXT_SCALES: Array[float] = [1.0, 1.3, 2.0]


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(ROOT_SCRIPT_PATH), "mobile_safe_root.gd must exist")
    case.assert_true(FileAccess.file_exists(ROOT_SCENE_PATH), "mobile_safe_root.tscn must exist")
    if not FileAccess.file_exists(ROOT_SCRIPT_PATH) or not FileAccess.file_exists(ROOT_SCENE_PATH):
        return

    var root_script = load(ROOT_SCRIPT_PATH)
    case.assert_true(root_script != null and root_script.can_instantiate(), "MobileSafeRoot script compiles")
    var packed_scene = load(ROOT_SCENE_PATH)
    case.assert_true(packed_scene is PackedScene, "MobileSafeRoot scene loads")
    if not packed_scene is PackedScene or root_script == null:
        return
    var instance = packed_scene.instantiate()
    case.assert_true(instance is Control, "MobileSafeRoot scene root is Control")
    case.assert_true(instance.has_node("Objective"), "Objective context node exists")
    case.assert_true(instance.has_node("Threat"), "Threat context node exists")
    case.assert_true(instance.has_node("Situation"), "Situation context node exists")
    case.assert_true(instance.has_node("WritingPanel"), "Writing Focus panel exists")
    instance.free()

    for resolution in RESOLUTIONS:
        for text_scale in TEXT_SCALES:
            var insets := Vector4(24.0, 16.0, 28.0, 18.0)
            var snapshot: Dictionary = root_script.layout_snapshot(resolution, text_scale, insets)
            case.assert_equal(&"PASS", snapshot.get("status", &""), "layout matrix passes: %s @ %.1f" % [resolution, text_scale])
            var safe_rect: Rect2 = snapshot.safe_rect
            for key in ["objective_rect", "threat_rect", "situation_rect", "writing_panel_rect", "canvas_rect"]:
                var rect: Rect2 = snapshot.get(key, Rect2())
                case.assert_true(rect.size.x > 0.0 and rect.size.y > 0.0, "%s has positive size" % key)
                case.assert_true(_contains_rect(safe_rect, rect), "%s remains inside safe area" % key)
            case.assert_false(snapshot.threat_rect.intersects(snapshot.canvas_rect), "canvas does not obscure threat/timer")
            case.assert_false(snapshot.threat_rect.intersects(snapshot.writing_panel_rect), "writing panel does not obscure threat/timer")
            case.assert_false(snapshot.objective_rect.intersects(snapshot.writing_panel_rect), "writing panel preserves objective")
            case.assert_false(snapshot.situation_rect.intersects(snapshot.writing_panel_rect), "writing panel preserves situation")
            case.assert_true(snapshot.context_visible.objective, "objective remains visible")
            case.assert_true(snapshot.context_visible.threat, "threat remains visible")
            case.assert_true(snapshot.context_visible.situation, "situation remains visible")
            for action_name in ["undo", "delete", "cancel", "retry", "confirm"]:
                var action_rect: Rect2 = snapshot.controls.get(action_name, Rect2())
                case.assert_true(action_rect.size.x >= 48.0 and action_rect.size.y >= 48.0, "%s meets 48dp minimum" % action_name)
                case.assert_true(_contains_rect(safe_rect, action_rect), "%s remains inside safe area" % action_name)
            case.assert_false(bool(snapshot.get("numeric_probability_visible", true)), "numeric success probability stays hidden")
            case.assert_false(bool(snapshot.get("automatic_solution_hint_visible", true)), "automatic solution hints stay hidden")
            case.assert_equal("AUTOMATED_LAYOUT_ONLY", snapshot.get("evidence_scope", ""), "layout result is not a device claim")


func _contains_rect(outer: Rect2, inner: Rect2) -> bool:
    return outer.has_point(inner.position) and outer.has_point(inner.position + inner.size - Vector2(0.001, 0.001))

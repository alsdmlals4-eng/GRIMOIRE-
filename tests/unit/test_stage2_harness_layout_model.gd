extends RefCounted

const MODEL_PATH := "res://src/ui/stage2_circuit_bridge_layout_model.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(MODEL_PATH), "Stage2 layout model must exist")
    if not FileAccess.file_exists(MODEL_PATH):
        return
    var Model = load(MODEL_PATH)
    case.assert_true(Model != null and Model.can_instantiate(), "Stage2 layout model must load")
    if Model == null or not Model.can_instantiate():
        return

    var viewports := [Vector2i(1280, 720), Vector2i(1920, 1080), Vector2i(2340, 1080), Vector2i(2532, 1170)]
    for viewport in viewports:
        for text_scale in [1.0, 1.3, 2.0]:
            var model: Dictionary = Model.build(viewport, text_scale, false)
            case.assert_equal(&"OK", model.status, "Landscape layout builds at %s / %.1f" % [viewport, text_scale])
            case.assert_equal(48.0, model.android_touch_target_dp, "Android target remains 48dp")
            case.assert_equal(44.0, model.ios_touch_target_pt, "iOS target remains 44pt")
            for region in [
                &"TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT",
                &"LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL",
                &"CENTER_TARGET_AND_3X3_CIRCUIT",
                &"RIGHT_WRITING_FOCUS_PANEL",
                &"BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT",
            ]:
                case.assert_true(model.regions.has(region), "Required region exists: %s" % region)
                var rect: Rect2 = model.regions[region]
                case.assert_true(rect.size.x > 0.0 and rect.size.y > 0.0, "Region has positive size")
                case.assert_true(rect.position.x >= 0.0 and rect.position.y >= 0.0, "Region stays in safe root")
                case.assert_true(rect.end.x <= viewport.x + 0.01 and rect.end.y <= viewport.y + 0.01, "Region stays inside viewport")

    var reduced: Dictionary = Model.build(Vector2i(1280, 720), 1.0, true)
    case.assert_equal(0, reduced.transition_duration_ms, "Reduced motion uses 0ms state swaps")
    var normal: Dictionary = Model.build(Vector2i(1280, 720), 1.0, false)
    case.assert_true(normal.transition_duration_ms >= 120 and normal.transition_duration_ms <= 180, "Normal transition stays TEST_VALUE range")

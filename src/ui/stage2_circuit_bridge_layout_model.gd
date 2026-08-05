class_name Stage2CircuitBridgeLayoutModel
extends RefCounted


const ANDROID_TOUCH_TARGET_DP := 48.0
const IOS_TOUCH_TARGET_PT := 44.0
const NORMAL_TRANSITION_MS := 150


static func build(viewport: Vector2i, text_scale: float, reduced_motion: bool) -> Dictionary:
    if viewport.x <= viewport.y or viewport.y < 480 or text_scale < 1.0 or text_scale > 2.0:
        return {"status": &"INVALID_LAYOUT_REQUEST"}

    var width := float(viewport.x)
    var height := float(viewport.y)
    var top_height := minf(maxf(72.0 * text_scale, height * 0.14), height * 0.22)
    var bottom_height := minf(maxf(72.0 * text_scale, height * 0.14), height * 0.22)
    var body_height := height - top_height - bottom_height
    if body_height <= 0.0:
        return {"status": &"INVALID_LAYOUT_REQUEST"}

    var left_width := minf(maxf(160.0 * text_scale, width * 0.16), width * 0.25)
    var right_width := minf(maxf(220.0 * text_scale, width * 0.22), width * 0.32)
    var center_width := width - left_width - right_width
    if center_width < ANDROID_TOUCH_TARGET_DP * 3.0:
        return {"status": &"INSUFFICIENT_CENTER_SPACE"}

    var regions := {
        &"TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT": Rect2(0.0, 0.0, width, top_height),
        &"LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL": Rect2(0.0, top_height, left_width, body_height),
        &"CENTER_TARGET_AND_3X3_CIRCUIT": Rect2(left_width, top_height, center_width, body_height),
        &"RIGHT_WRITING_FOCUS_PANEL": Rect2(left_width + center_width, top_height, right_width, body_height),
        &"BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT": Rect2(0.0, top_height + body_height, width, bottom_height),
    }
    return {
        "status": &"OK",
        "viewport": viewport,
        "text_scale": text_scale,
        "android_touch_target_dp": ANDROID_TOUCH_TARGET_DP,
        "ios_touch_target_pt": IOS_TOUCH_TARGET_PT,
        "transition_duration_ms": 0 if reduced_motion else NORMAL_TRANSITION_MS,
        "reduced_motion": reduced_motion,
        "regions": regions,
    }

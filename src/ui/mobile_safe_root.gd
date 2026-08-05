class_name MobileSafeRoot
extends Control


static func layout_snapshot(
    resolution: Vector2i,
    text_scale: float,
    safe_insets: Vector4
) -> Dictionary:
    if resolution.x <= 0 or resolution.y <= 0 or text_scale <= 0.0:
        return {"status": &"INVALID_LAYOUT_INPUT"}

    var safe_rect := Rect2(
        safe_insets.x,
        safe_insets.y,
        maxf(1.0, float(resolution.x) - safe_insets.x - safe_insets.z),
        maxf(1.0, float(resolution.y) - safe_insets.y - safe_insets.w)
    )
    var gap := 16.0
    var context_width := maxf(420.0, floorf(safe_rect.size.x * 0.52))
    var writing_width := safe_rect.size.x - context_width - gap
    if writing_width < 320.0:
        writing_width = 320.0
        context_width = safe_rect.size.x - writing_width - gap
    var header_height := clampf(72.0 * minf(text_scale, 2.0), 72.0, 144.0)

    var objective_width := floorf(context_width * 0.58)
    var threat_width := context_width - objective_width - gap
    var objective_rect := Rect2(safe_rect.position, Vector2(objective_width, header_height))
    var threat_rect := Rect2(
        safe_rect.position + Vector2(objective_width + gap, 0.0),
        Vector2(threat_width, header_height)
    )
    var situation_rect := Rect2(
        safe_rect.position + Vector2(0.0, header_height + gap),
        Vector2(context_width, safe_rect.size.y - header_height - gap)
    )
    var writing_panel_rect := Rect2(
        safe_rect.position + Vector2(context_width + gap, 0.0),
        Vector2(writing_width, safe_rect.size.y)
    )

    var inner_margin := 16.0
    var control_gap := 8.0
    var control_height := maxf(48.0, 48.0 * minf(text_scale, 1.35))
    var control_area_height := control_height + inner_margin * 2.0
    var canvas_rect := Rect2(
        writing_panel_rect.position + Vector2(inner_margin, inner_margin),
        Vector2(
            writing_panel_rect.size.x - inner_margin * 2.0,
            writing_panel_rect.size.y - control_area_height - inner_margin * 2.0
        )
    )

    var control_names := ["undo", "delete", "cancel", "retry", "confirm"]
    var available_control_width := writing_panel_rect.size.x - inner_margin * 2.0 - control_gap * 4.0
    var control_width := maxf(48.0, floorf(available_control_width / 5.0))
    var controls := {}
    var control_y := writing_panel_rect.end.y - inner_margin - control_height
    for index in control_names.size():
        controls[control_names[index]] = Rect2(
            Vector2(
                writing_panel_rect.position.x + inner_margin + float(index) * (control_width + control_gap),
                control_y
            ),
            Vector2(control_width, control_height)
        )

    var valid := _contains(safe_rect, objective_rect) \
        and _contains(safe_rect, threat_rect) \
        and _contains(safe_rect, situation_rect) \
        and _contains(safe_rect, writing_panel_rect) \
        and _contains(safe_rect, canvas_rect) \
        and not threat_rect.intersects(canvas_rect) \
        and not threat_rect.intersects(writing_panel_rect)
    for action_rect in controls.values():
        valid = valid and _contains(safe_rect, action_rect)

    return {
        "status": &"PASS" if valid else &"FAIL",
        "safe_rect": safe_rect,
        "objective_rect": objective_rect,
        "threat_rect": threat_rect,
        "situation_rect": situation_rect,
        "writing_panel_rect": writing_panel_rect,
        "canvas_rect": canvas_rect,
        "controls": controls,
        "context_visible": {
            "objective": true,
            "threat": true,
            "situation": true,
        },
        "numeric_probability_visible": false,
        "automatic_solution_hint_visible": false,
        "evidence_scope": "AUTOMATED_LAYOUT_ONLY",
        "physical_touch": "NOT_RUN",
        "text_scale": text_scale,
    }


static func _contains(outer: Rect2, inner: Rect2) -> bool:
    if inner.size.x <= 0.0 or inner.size.y <= 0.0:
        return false
    return outer.has_point(inner.position) and outer.has_point(inner.end - Vector2(0.001, 0.001))

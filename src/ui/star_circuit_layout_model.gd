class_name StarCircuitLayoutModel
extends RefCounted

func layout_for(viewport_size: Vector2, safe_rect: Rect2, text_scale: float, reduced_motion: bool) -> Dictionary:
    var rect := safe_rect
    if rect.size.x <= 0.0 or rect.size.y <= 0.0:
        rect = Rect2(Vector2.ZERO, viewport_size)
    var center := Vector2(rect.position.x + rect.size.x * 0.5, rect.position.y + rect.size.y * 0.5 - 20.0)
    var radius := minf(rect.size.x * 0.22, rect.size.y * 0.30)
    var vertices: Array[Vector2] = []
    for index in range(5):
        var angle := -PI * 0.5 + TAU * float(index) / 5.0
        vertices.append(center + Vector2(cos(angle), sin(angle)) * radius)
    return {
        "layout": &"FIVE_POINT_STAR",
        "center": center,
        "vertices": vertices,
        "minimum_touch_target": maxf(48.0, 44.0 * maxf(1.0, text_scale)),
        "transition_ms": 0 if reduced_motion else 150,
        "transition_ms_reduced_motion": 0,
        "slot_order_effect": false,
        "hidden_vertex_bonus": false,
        "target_after_circuit_preview": true,
        "numeric_success_preview": true,
    }

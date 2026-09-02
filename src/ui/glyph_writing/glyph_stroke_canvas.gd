# 글자 입력 획을 수집해 사용자의 명시 제출 때만 인식 화면으로 보낸다.
extends Control

signal strokes_submitted(strokes: Array)

const MIN_NORMALISED_POINT_DISTANCE := 0.002
const POINTER_NONE := &"NONE"
const POINTER_MOUSE := &"MOUSE"
const POINTER_TOUCH := &"TOUCH"

var _strokes: Array = []
var _active_stroke: Array = []
var _active_pointer: StringName = POINTER_NONE
var _active_touch_index := -1
var _reference_glyph_id: StringName = &""
var _reference_strokes: Array = []


func _ready() -> void:
    mouse_filter = Control.MOUSE_FILTER_STOP
    custom_minimum_size = Vector2(300, 132)
    queue_redraw()


func _gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        if not _is_emulated_event(event):
            _handle_mouse_button(event)
        accept_event()
        return
    if event is InputEventMouseMotion:
        if not _is_emulated_event(event) and _active_pointer == POINTER_MOUSE:
            _append_point(event.position)
        accept_event()
        return
    if event is InputEventScreenTouch:
        if not _is_emulated_event(event):
            _handle_screen_touch(event)
        accept_event()
        return
    if event is InputEventScreenDrag:
        if not _is_emulated_event(event) and _active_pointer == POINTER_TOUCH and event.index == _active_touch_index:
            _append_point(_viewport_to_local(event.position))
        accept_event()


func submit_collected_strokes() -> Array:
    if not _active_stroke.is_empty():
        _finish_active_stroke()
    _reset_active_pointer()
    var submitted := snapshot_strokes()
    if submitted.is_empty():
        return []
    strokes_submitted.emit(submitted)
    return submitted


func clear_strokes() -> void:
    _strokes.clear()
    _active_stroke.clear()
    _reset_active_pointer()
    queue_redraw()


func stroke_count() -> int:
    return _strokes.size() + (1 if _active_stroke.size() >= 2 else 0)


func snapshot_strokes() -> Array:
    var snapshot: Array = []
    for stroke_variant in _strokes:
        snapshot.append(_packed_stroke(stroke_variant))
    if _active_stroke.size() >= 2:
        snapshot.append(_packed_stroke(_active_stroke))
    return snapshot


func configure_reference(glyph_id: StringName, strokes: Array) -> void:
    _reference_glyph_id = glyph_id
    _reference_strokes = _copy_normalised_strokes(strokes)
    queue_redraw()


func clear_reference() -> void:
    _reference_glyph_id = &""
    _reference_strokes.clear()
    queue_redraw()


func reference_glyph_id() -> StringName:
    return _reference_glyph_id


func _handle_mouse_button(event: InputEventMouseButton) -> void:
    if event.pressed:
        if _active_pointer != POINTER_NONE:
            return
        _active_pointer = POINTER_MOUSE
        _begin_stroke(event.position)
        return
    if _active_pointer != POINTER_MOUSE:
        return
    _end_stroke(event.position)
    _reset_active_pointer()


func _handle_screen_touch(event: InputEventScreenTouch) -> void:
    if event.pressed:
        if _active_pointer != POINTER_NONE:
            return
        _active_pointer = POINTER_TOUCH
        _active_touch_index = event.index
        _begin_stroke(_viewport_to_local(event.position))
        return
    if _active_pointer != POINTER_TOUCH or event.index != _active_touch_index:
        return
    if event.canceled:
        _finish_active_stroke()
    else:
        _end_stroke(_viewport_to_local(event.position))
    _reset_active_pointer()


func _is_emulated_event(event: InputEvent) -> bool:
    return event.device == InputEvent.DEVICE_ID_EMULATION


func _viewport_to_local(viewport_position: Vector2) -> Vector2:
    if not is_inside_tree():
        return viewport_position - position
    return get_global_transform_with_canvas().affine_inverse() * viewport_position


func _reset_active_pointer() -> void:
    _active_pointer = POINTER_NONE
    _active_touch_index = -1


func _begin_stroke(point: Vector2) -> void:
    _active_stroke = [_normalised_point(point)]
    queue_redraw()


func _append_point(point: Vector2) -> void:
    if _active_stroke.is_empty():
        return
    var next := _normalised_point(point)
    if Vector2(_active_stroke.back()).distance_to(next) < MIN_NORMALISED_POINT_DISTANCE:
        return
    _active_stroke.append(next)
    queue_redraw()


func _end_stroke(point: Vector2) -> void:
    _append_point(point)
    _finish_active_stroke()


func _finish_active_stroke() -> void:
    if _active_stroke.size() >= 2:
        _strokes.append(_active_stroke.duplicate(true))
    _active_stroke.clear()
    queue_redraw()


func _normalised_point(point: Vector2) -> Vector2:
    if size.x <= 0.0 or size.y <= 0.0:
        return point
    return Vector2(clampf(point.x / size.x, 0.0, 1.0), clampf(point.y / size.y, 0.0, 1.0))


func _copy_normalised_strokes(strokes: Array) -> Array:
    var copied: Array = []
    for stroke_variant in strokes:
        var copied_stroke: Array = []
        if stroke_variant is PackedVector2Array:
            for point in stroke_variant:
                copied_stroke.append(Vector2(point))
        elif typeof(stroke_variant) == TYPE_ARRAY:
            for point_variant in stroke_variant:
                if point_variant is Vector2:
                    copied_stroke.append(Vector2(point_variant))
        if copied_stroke.size() >= 2:
            copied.append(copied_stroke)
    return copied


func _packed_stroke(stroke_variant: Array) -> PackedVector2Array:
    var packed := PackedVector2Array()
    for point_variant in stroke_variant:
        if point_variant is Vector2:
            packed.append(Vector2(point_variant))
    return packed


func _draw() -> void:
    _draw_normalised_strokes(_reference_strokes, Color(0.48, 0.78, 1.0, 0.34), 2.5)
    _draw_normalised_strokes(snapshot_strokes(), Color("81d7ff"), 4.0)


func _draw_normalised_strokes(strokes: Array, color: Color, width: float) -> void:
    for stroke_variant in strokes:
        if not (stroke_variant is PackedVector2Array) and typeof(stroke_variant) != TYPE_ARRAY:
            continue
        var stroke_size: int = stroke_variant.size()
        if stroke_size < 2:
            continue
        var points := PackedVector2Array()
        for value in stroke_variant:
            if value is Vector2:
                var normalised := Vector2(value)
                points.append(normalised * size if size.x > 0.0 and size.y > 0.0 else normalised)
        draw_polyline(points, color, width, true)

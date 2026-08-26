# 글자 입력 획을 수집해 사용자의 명시 제출 때만 인식 화면으로 보낸다.
class_name GlyphStrokeCanvas
extends Control

signal strokes_submitted(strokes: Array)

var _strokes: Array = []
var _active_stroke: Array = []


func _ready() -> void:
    mouse_filter = Control.MOUSE_FILTER_STOP
    custom_minimum_size = Vector2(360, 220)
    queue_redraw()


func _gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        if event.pressed:
            _begin_stroke(event.position)
        else:
            _end_stroke(event.position)
        accept_event()
        return
    if event is InputEventMouseMotion and not _active_stroke.is_empty():
        _append_point(event.position)
        accept_event()
        return
    if event is InputEventScreenTouch:
        if event.pressed:
            _begin_stroke(event.position)
        else:
            _end_stroke(event.position)
        accept_event()
        return
    if event is InputEventScreenDrag:
        _append_point(event.position)
        accept_event()


func submit_collected_strokes() -> Array:
    if not _active_stroke.is_empty():
        _finish_active_stroke()
    var submitted := snapshot_strokes()
    if submitted.is_empty():
        return []
    strokes_submitted.emit(submitted)
    return submitted


func clear_strokes() -> void:
    _strokes.clear()
    _active_stroke.clear()
    queue_redraw()


func stroke_count() -> int:
    return _strokes.size() + (1 if _active_stroke.size() >= 2 else 0)


func snapshot_strokes() -> Array:
    var snapshot: Array = []
    for stroke_variant in _strokes:
        snapshot.append(Array(stroke_variant).duplicate(true))
    if _active_stroke.size() >= 2:
        snapshot.append(_active_stroke.duplicate(true))
    return snapshot


func _begin_stroke(point: Vector2) -> void:
    _active_stroke = [_normalised_point(point)]
    queue_redraw()


func _append_point(point: Vector2) -> void:
    if _active_stroke.is_empty():
        return
    var next := _normalised_point(point)
    if Vector2(_active_stroke.back()).distance_to(next) < 1.0:
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


func _draw() -> void:
    for stroke_variant in snapshot_strokes():
        var stroke: Array = stroke_variant
        if stroke.size() < 2:
            continue
        var points := PackedVector2Array()
        for value in stroke:
            var normalised := Vector2(value)
            points.append(normalised * size if size.x > 0.0 and size.y > 0.0 else normalised)
        draw_polyline(points, Color("81d7ff"), 4.0, true)

# 실제 포인터 입력이 명시 제출 전에는 인식으로 넘어가지 않음을 검증한다.
extends RefCounted

const CANVAS_PATH := "res://src/ui/glyph_writing/glyph_stroke_canvas.gd"
const CANVAS_ORIGIN := Vector2(254, 295)
const CANVAS_SIZE := Vector2(772, 132)


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(CANVAS_PATH), "Glyph stroke canvas must exist")
    if not FileAccess.file_exists(CANVAS_PATH):
        return

    var Canvas = load(CANVAS_PATH)
    case.assert_true(Canvas != null and Canvas.can_instantiate(), "Glyph stroke canvas must compile")
    if Canvas == null or not Canvas.can_instantiate():
        return

    var host := Control.new()
    var tree := Engine.get_main_loop() as SceneTree
    tree.root.add_child(host)
    var canvas = Canvas.new()
    host.add_child(canvas)
    canvas.position = CANVAS_ORIGIN
    canvas.size = CANVAS_SIZE

    canvas._gui_input(_mouse_button(Vector2(8, 8), true))
    canvas._gui_input(_mouse_motion(Vector2(40, 40)))
    canvas._gui_input(_mouse_button(Vector2(64, 64), false))

    case.assert_equal(1, canvas.stroke_count(), "release stores one valid separate stroke")
    var submitted: Array = canvas.submit_collected_strokes()
    case.assert_equal(1, submitted.size(), "explicit submit returns the collected stroke payload")
    if not submitted.is_empty():
        case.assert_true(submitted[0] is PackedVector2Array, "runtime strokes are converted into the recognizer's PackedVector2Array input contract")
    canvas.clear_strokes()
    case.assert_equal(0, canvas.stroke_count(), "clear removes retry strokes")

    var local_stroke := [Vector2(0.20, 0.80), Vector2(0.50, 0.15), Vector2(0.80, 0.80)]
    _draw_viewport_touch(canvas, local_stroke)
    case.assert_equal(1, canvas.stroke_count(), "touch drag stores one valid separate stroke")

    canvas.clear_strokes()
    _draw_viewport_touch(canvas, local_stroke)
    var viewport_snapshot: Array = canvas.snapshot_strokes()
    case.assert_equal(1, viewport_snapshot.size(), "viewport touch stores one direct-writing stroke")
    if not viewport_snapshot.is_empty():
        var viewport_stroke = viewport_snapshot[0]
        case.assert_near(0.20, Vector2(viewport_stroke[0]).x, 0.001, "touch X converts from viewport space into canvas-local space")
        case.assert_near(0.80, Vector2(viewport_stroke[0]).y, 0.001, "touch Y converts from viewport space into canvas-local space")
        case.assert_near(0.80, Vector2(viewport_stroke[viewport_stroke.size() - 1]).x, 0.001, "touch keeps the final local X coordinate")
        case.assert_near(0.80, Vector2(viewport_stroke[viewport_stroke.size() - 1]).y, 0.001, "touch keeps the final local Y coordinate")

    canvas.clear_strokes()
    _draw_touch_with_emulated_mouse_noise(canvas)
    var deduplicated_snapshot: Array = canvas.snapshot_strokes()
    case.assert_equal(1, deduplicated_snapshot.size(), "one physical touch cannot create a second mouse-emulation stroke")
    if not deduplicated_snapshot.is_empty():
        var deduplicated_stroke = deduplicated_snapshot[0]
        case.assert_near(0.20, Vector2(deduplicated_stroke[0]).x, 0.001, "emulated mouse input cannot replace a physical touch start")
        case.assert_near(0.80, Vector2(deduplicated_stroke[0]).y, 0.001, "emulated mouse input cannot replace a physical touch start Y")
        case.assert_near(0.80, Vector2(deduplicated_stroke[deduplicated_stroke.size() - 1]).x, 0.001, "emulated mouse input cannot replace a physical touch end")
        case.assert_near(0.80, Vector2(deduplicated_stroke[deduplicated_stroke.size() - 1]).y, 0.001, "emulated mouse input cannot replace a physical touch end Y")

    host.queue_free()


func _draw_viewport_touch(canvas, normalised_points: Array) -> void:
    for point_index in normalised_points.size():
        var normalised: Vector2 = normalised_points[point_index]
        var viewport_position := CANVAS_ORIGIN + (normalised * CANVAS_SIZE)
        if point_index == 0:
            canvas._gui_input(_screen_touch(viewport_position, true))
        elif point_index == normalised_points.size() - 1:
            canvas._gui_input(_screen_drag(viewport_position))
            canvas._gui_input(_screen_touch(viewport_position, false))
        else:
            canvas._gui_input(_screen_drag(viewport_position))


func _draw_touch_with_emulated_mouse_noise(canvas) -> void:
    var first := CANVAS_ORIGIN + (Vector2(0.20, 0.80) * CANVAS_SIZE)
    var middle := CANVAS_ORIGIN + (Vector2(0.50, 0.15) * CANVAS_SIZE)
    var last := CANVAS_ORIGIN + (Vector2(0.80, 0.80) * CANVAS_SIZE)
    canvas._gui_input(_screen_touch(first, true))
    canvas._gui_input(_mouse_button(CANVAS_ORIGIN + (Vector2(0.90, 0.10) * CANVAS_SIZE), true, InputEvent.DEVICE_ID_EMULATION))
    canvas._gui_input(_screen_drag(middle))
    canvas._gui_input(_mouse_motion(CANVAS_ORIGIN + (Vector2(0.85, 0.20) * CANVAS_SIZE), InputEvent.DEVICE_ID_EMULATION))
    canvas._gui_input(_screen_drag(last))
    canvas._gui_input(_screen_touch(last, false))
    canvas._gui_input(_mouse_button(CANVAS_ORIGIN + (Vector2(0.85, 0.20) * CANVAS_SIZE), false, InputEvent.DEVICE_ID_EMULATION))


func _mouse_button(position: Vector2, pressed: bool, device: int = 0) -> InputEventMouseButton:
    var event := InputEventMouseButton.new()
    event.button_index = MOUSE_BUTTON_LEFT
    event.position = position
    event.pressed = pressed
    event.device = device
    return event


func _mouse_motion(position: Vector2, device: int = 0) -> InputEventMouseMotion:
    var event := InputEventMouseMotion.new()
    event.position = position
    event.device = device
    return event


func _screen_touch(position: Vector2, pressed: bool) -> InputEventScreenTouch:
    var event := InputEventScreenTouch.new()
    event.index = 0
    event.position = position
    event.pressed = pressed
    return event


func _screen_drag(position: Vector2) -> InputEventScreenDrag:
    var event := InputEventScreenDrag.new()
    event.index = 0
    event.position = position
    return event

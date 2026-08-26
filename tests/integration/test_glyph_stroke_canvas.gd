# 실제 포인터 입력이 명시 제출 전에는 인식으로 넘어가지 않음을 검증한다.
extends RefCounted

const CANVAS_PATH := "res://src/ui/spell_workflow/components/glyph_stroke_canvas.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(CANVAS_PATH), "Glyph stroke canvas must exist")
    if not FileAccess.file_exists(CANVAS_PATH):
        return

    var Canvas = load(CANVAS_PATH)
    case.assert_true(Canvas != null and Canvas.can_instantiate(), "Glyph stroke canvas must compile")
    if Canvas == null or not Canvas.can_instantiate():
        return

    var canvas = Canvas.new()
    canvas._gui_input(_mouse_button(Vector2(8, 8), true))
    canvas._gui_input(_mouse_motion(Vector2(40, 40)))
    canvas._gui_input(_mouse_button(Vector2(64, 64), false))

    case.assert_equal(1, canvas.stroke_count(), "release stores one valid separate stroke")
    var submitted: Array = canvas.submit_collected_strokes()
    case.assert_equal(1, submitted.size(), "explicit submit returns the collected stroke payload")
    canvas.clear_strokes()
    case.assert_equal(0, canvas.stroke_count(), "clear removes retry strokes")


func _mouse_button(position: Vector2, pressed: bool) -> InputEventMouseButton:
    var event := InputEventMouseButton.new()
    event.button_index = MOUSE_BUTTON_LEFT
    event.position = position
    event.pressed = pressed
    return event


func _mouse_motion(position: Vector2) -> InputEventMouseMotion:
    var event := InputEventMouseMotion.new()
    event.position = position
    return event

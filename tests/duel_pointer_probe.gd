extends "res://src/ui/shared_duel/shared_duel_screen.gd"
## Test-only viewport input driver. Does not call selection/drop/cast handlers.
var qa_pointer_result: Dictionary = {}

func qa_start_pointer_drag(source_id: int, target_id: int) -> void:
    _qa_complete_pointer_drag(source_id,target_id)

func _qa_complete_pointer_drag(source_id: int, target_id: int) -> void:
    qa_pointer_result = await qa_pointer_drag(source_id,target_id)

func qa_pointer_drag(source_id: int, target_id: int) -> Dictionary:
    var source: Control = hand.get_node("HandCard" + str(source_id))
    var start := source.get_global_rect().get_center()
    var finish := Vector2(8,8)
    if target_id >= 0:
        finish = hand.get_node("HandCard" + str(target_id)).get_global_rect().get_center()
    var before: Dictionary = session.duplicate(true)
    _pointer_button(start,true)
    await get_tree().process_frame
    _pointer_motion(start+Vector2(30,-20),Vector2(30,-20))
    await get_tree().process_frame
    _pointer_motion(finish,finish-start-Vector2(30,-20))
    await get_tree().process_frame
    var started: bool = get_viewport().gui_is_dragging()
    _pointer_button(finish,false)
    await get_tree().process_frame
    return {"drag_started":started,"selection":selection.duplicate(),"state_unchanged":session==before,"drag_ended":not get_viewport().gui_is_dragging()}

func _pointer_button(at: Vector2, down: bool) -> void:
    var event := InputEventMouseButton.new()
    event.position = at
    event.global_position = at
    event.button_index = MOUSE_BUTTON_LEFT
    event.button_mask = MOUSE_BUTTON_MASK_LEFT if down else 0
    event.pressed = down
    get_viewport().push_input(event,true)

func _pointer_motion(at: Vector2, delta: Vector2) -> void:
    var event := InputEventMouseMotion.new()
    event.position = at
    event.global_position = at
    event.relative = delta
    event.button_mask = MOUSE_BUTTON_MASK_LEFT
    get_viewport().push_input(event,true)

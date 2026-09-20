extends SceneTree
func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    root.size = Vector2i(1280,720)
    var screen = load("res://tests/duel_pointer_probe.tscn").instantiate()
    root.add_child(screen)
    await process_frame
    await process_frame
    var result: Dictionary = await screen.qa_pointer_drag(0,2)
    c.assert_true(result.drag_started,"real viewport gesture starts card drag")
    c.assert_equal([2,0],result.selection,"real release over another card prepares pair")
    c.assert_true(result.state_unchanged,"drag is preparation not cast")
    c.assert_true(result.drag_ended,"release cleans up drag state")
    screen.cancel_selection()
    result = await screen.qa_pointer_drag(0,-1)
    c.assert_equal([],result.selection,"release outside cards preserves empty preparation")
    c.assert_true(result.drag_ended and result.state_unchanged,"outside release is free and ends drag")
    screen.select_card(4)
    result = await screen.qa_pointer_drag(0,-1)
    c.assert_equal([4],result.selection,"outside release preserves prior prepared choice")
    c.assert_true(result.state_unchanged,"outside release cannot change game state")
    screen.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

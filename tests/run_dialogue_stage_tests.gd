extends SceneTree
func _initialize() -> void:
    call_deferred("_run")
func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    root.size = Vector2i(1280,720)
    var screen = preload("res://src/ui/story/story_screen.tscn").instantiate()
    screen.save_folder = "res://artifacts/local-validation/dialogue-stage-tests"
    root.add_child(screen)
    await process_frame
    for stage_index in [0,1]:
        if stage_index == 1: screen.advance_story(0)
        await process_frame
        var stage = screen.find_child("DialogueStage",true,false)
        c.assert_true(stage != null,"all conversation scenes use the common stage")
        if stage == null: continue
        var before = screen.story.duplicate(true)
        c.assert_true(screen.story_copy.global_position.y >= 480,"speech is below actors, not in a central status column")
        c.assert_true(screen.story_copy.size.x >= 900,"dialogue spans the usable width")
        var line = screen.story_copy.text
        stage.navigation.get_children().back().grab_focus()
        stage.next_requested.emit()
        await process_frame
        await process_frame
        c.assert_true(root.gui_get_focus_owner() != null,"keyboard focus survives dialogue rebuild")
        c.assert_true(screen.story_copy.text != line,"stage next signal is connected to story reading")
        stage = screen.find_child("DialogueStage",true,false)
        stage.records_requested.emit()
        c.assert_true(screen.records_open,"stage opens records without advancing story")
        stage = screen.find_child("DialogueStage",true,false)
        stage.records_requested.emit()
        c.assert_equal(before,screen.story,"stage presentation and record reading have no gameplay cost")
        for ignored in range(20): screen.next_dialogue()
        await process_frame
        stage = screen.find_child("DialogueStage",true,false)
        c.assert_true(stage.scroll.size.y >= 35,"last-line choices must leave at least one readable body line")
        root.size = Vector2i(1024,576)
        root.content_scale_size = Vector2i(1024,576)
        screen._render()
        await process_frame
        await process_frame
        stage = screen.find_child("DialogueStage",true,false)
        c.assert_true(stage.scroll.size.y >= 35,"small viewport retains readable speech beside choices")
        for button in stage.find_children("*","Button",true,false):
            c.assert_true(button.get_global_rect().end.y <= 576,"all action buttons stay inside small viewport")
        root.size = Vector2i(1280,720)
        root.content_scale_size = Vector2i(1280,720)
    screen.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

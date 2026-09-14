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
    var standalone = preload("res://src/ui/story/dialogue_stage.tscn").instantiate()
    var review_lines = preload("res://src/ui/story/story_dialogue.gd").lines({"stage":5,"reflection":""})
    for review_line in review_lines:
        c.assert_equal({"LEFT":"PLAYER","CENTER":"TUTOR","RIGHT":"PEER"},review_line.actor_slots,"review keeps both witnesses present across speakers")
    root.add_child(standalone)
    standalone.configure({"text":"긴 대사입니다. ".repeat(150),"records":false,"previous":false,"next":true,"records_label":"기록","choices":[],"blocked":false})
    var resource = preload("res://src/ui/story/dialogue_line.gd").new()
    resource.actor_slots = {"LEFT":"PLAYER","CENTER":"TUTOR","RIGHT":"PEER"}
    resource.speaker_id = "TUTOR"
    resource.portrait_state = "missing_expression"
    standalone.present(resource,32)
    await process_frame
    var portraits = standalone.find_children("*Illustration","TextureRect",true,false)
    c.assert_equal(3,portraits.size(),"resource actor slots display three independent actors")
    var center = standalone.find_child("CenterIllustration",true,false)
    c.assert_true(center != null,"center slot is consumed")
    if center != null:
        c.assert_equal(preload("res://src/ui/story/story_portraits.gd").ART.TUTOR,center.texture,"missing expression uses approved neutral art")
        c.assert_equal(Color.WHITE,center.modulate,"current speaker is emphasized")
    resource.speaker_id = "NARRATOR"
    for viewport_size in [Vector2i(1280,720),Vector2i(1024,576)]:
        root.size = viewport_size
        root.content_scale_size = viewport_size
        for font_size in [24,28,32]:
            standalone.present(resource,font_size)
            await process_frame
            await process_frame
            c.assert_equal(font_size,standalone.body.get_theme_font_size("font_size"),"requested readable text size is used")
            c.assert_true(standalone.scroll.size.y >= font_size,"long dialogue retains a readable line")
            for actor in standalone.find_children("*Illustration","TextureRect",true,false):
                c.assert_true(actor.get_global_rect().end.x <= viewport_size.x,"three actor slots remain within viewport")
            for button in standalone.find_children("*","Button",true,false):
                c.assert_true(button.get_global_rect().end.y <= viewport_size.y,"reading controls remain reachable at every text size")
    standalone.present(resource,24)
    c.assert_equal("",standalone.speaker.text,"narration has no invented speaker")
    for portrait in standalone.find_children("*Illustration","TextureRect",true,false):
        c.assert_true(portrait.modulate != Color.WHITE,"narration clears previous speaker emphasis")
    resource.actor_slots = {"LEFT":"UNKNOWN","CENTER":"","RIGHT":"PEER","EXTRA":"PLAYER"}
    standalone.present(resource,28)
    c.assert_equal(1,standalone.find_children("*Illustration","TextureRect",true,false).size(),"unknown and unsupported slots never invent actors")
    standalone.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var menu = preload("res://src/ui/story/story_menu.tscn").instantiate()
    menu.save_folder = "res://artifacts/local-validation/story-pause-tests/" + str(Time.get_ticks_usec())
    root.add_child(menu)
    await process_frame
    c.assert_true(menu.has_method("open_pause"),"story can pause without discarding draft selection")
    if not menu.has_method("open_pause"):
        menu.queue_free()
        await process_frame
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count()}))
        quit(1)
        return
    menu.request_new()
    menu.story_view.advance_story(0)
    menu.story_view.advance_story(1)
    await process_frame
    var original = menu.story_view
    var lesson = original.activity_view
    lesson.select_glyph("EMBER")
    lesson.select_target("vessel")
    var before: Dictionary = original.story.duplicate(true)
    var quoted: Dictionary = lesson.quote.duplicate(true)
    menu.open_pause()
    c.assert_true(not original.visible,"paused story hidden from input")
    menu.open_codex()
    menu.show_menu()
    menu.resume_story()
    c.assert_equal(original,menu.story_view,"same story instance restored")
    c.assert_equal(["EMBER"],lesson.selected,"uncast glyph selection preserved")
    c.assert_equal("vessel",lesson.target_id,"uncast target preserved")
    c.assert_equal(quoted,lesson.quote,"quote not recalculated or consumed by menu")
    c.assert_equal(before,original.story,"pause read resume does not advance time or mana")
    lesson.confirm_action()
    c.assert_equal(1,original.story.activity.spell_state.elapsed_actions,"only explicit cast consumes one action")
    lesson.continue_story()
    await process_frame
    var duel = original.activity_view
    duel.select_pair(0,2)
    var duel_state: Dictionary = duel.session.duplicate(true)
    menu.open_pause()
    menu.open_settings()
    menu.show_menu()
    menu.resume_story()
    c.assert_equal([0,2],duel.selection,"duel pair selection survives settings visit")
    c.assert_equal(duel_state,duel.session,"menu does not draw or mutate duel")
    menu.open_pause()
    menu.save_and_main()
    await process_frame
    c.assert_true(not is_instance_valid(menu.story_view) and not is_instance_valid(menu.suspended_story),"explicit save and main releases play instance")
    menu.continue_story()
    await process_frame
    c.assert_equal(duel_state,menu.story_view.story.activity,"main continue restores authoritative duel state")
    menu.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

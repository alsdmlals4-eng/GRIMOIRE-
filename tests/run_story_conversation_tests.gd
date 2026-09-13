extends SceneTree
func _initialize() -> void:
    call_deferred("_run")
func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var screen = preload("res://src/ui/story/story_screen.tscn").instantiate()
    screen.save_folder = "res://artifacts/local-validation/story-conversation-tests"
    root.add_child(screen)
    await process_frame
    c.assert_true(screen.has_method("next_dialogue"),"reading advances dialogue, not whole scene")
    if screen.has_method("next_dialogue"):
        var before: Dictionary = screen.story.duplicate(true)
        var first: String = screen.story_copy.text
        var speaker: String = screen.find_child("Speaker",true,false).text
        screen.next_dialogue()
        c.assert_true(screen.find_child("Speaker",true,false).text != speaker,"next turn changes speaker")
        c.assert_true(screen.story_copy.text != first,"next turn shows reply")
        c.assert_equal(before,screen.story,"reading cannot change game state")
        screen.previous_dialogue()
        c.assert_equal(first,screen.story_copy.text,"back rereads prior speech")
        screen.toggle_records()
        c.assert_true(screen.records_open,"reference opens separately")
        screen.toggle_records()
        c.assert_equal(first,screen.story_copy.text,"reference close restores same line")
        for i in range(20): screen.next_dialogue()
        var last: String = screen.story_copy.text
        screen.next_dialogue()
        c.assert_equal(last,screen.story_copy.text,"end cannot auto advance scene")
        c.assert_equal(before,screen.story,"all reading retains original state")
        screen.previous_dialogue()
        var cursor: int = screen.dialogue_index
        screen.refresh_preferences()
        c.assert_equal(cursor,screen.dialogue_index,"font refresh retains read position")
        var lesson = preload("res://src/ui/story/story_dialogue.gd").turns({"stage":1})
        c.assert_true(lesson.any(func(row): return row.speaker == "나") and lesson.any(func(row): return row.speaker == "지도교수"),"lesson includes player question and tutor answer")
    screen.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

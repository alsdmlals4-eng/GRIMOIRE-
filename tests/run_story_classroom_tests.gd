extends SceneTree
func _initialize() -> void:
    call_deferred("_run")
func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var screen = preload("res://src/ui/story/story_screen.tscn").instantiate()
    screen.story = preload("res://src/core/shared_spell/story_flow.gd").new().advance(preload("res://src/core/shared_spell/story_flow.gd").new().create(),0).state
    root.size = Vector2i(1280,720)
    root.add_child(screen)
    await process_frame
    var plate = screen.find_child("FullSceneIllustration",true,false)
    c.assert_true(plate != null,"approved classroom is continuous scene, not portrait columns")
    if plate != null:
        var before: Dictionary = screen.story.duplicate(true)
        c.assert_true(screen.story_copy.global_position.y >= 500,"speech overlays bottom of scene")
        c.assert_true(screen.story_copy.size.x >= 900,"shared dialogue spans screen")
        var art = plate.texture
        screen.next_dialogue()
        c.assert_equal("나",screen.find_child("Speaker",true,false).text,"next speaker shown in shared nameplate")
        c.assert_equal(art,screen.find_child("FullSceneIllustration",true,false).texture,"all cast remains during speaker change")
        screen.toggle_records()
        c.assert_true(screen.story_copy.text.contains("불씨"),"lesson reference remains readable")
        screen.toggle_records()
        c.assert_equal(before,screen.story,"overlay interactions do not advance gameplay")
    screen.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

extends SceneTree
func _initialize() -> void:
    call_deferred("_run")
func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    root.size = Vector2i(1280,720)
    var screen = preload("res://src/ui/story/story_screen.tscn").instantiate()
    screen.save_folder = "res://artifacts/local-validation/story-portrait-tests"
    root.add_child(screen)
    await process_frame
    var left = screen.find_child("PlayerIllustration",true,false)
    var right = screen.find_child("PartnerIllustration",true,false)
    c.assert_true(left != null and right != null,"dialogue consumes both approved character illustrations")
    if left != null and right != null:
        c.assert_true(left.texture != null and right.texture != null,"both illustrations actually loaded")
        c.assert_true(right.texture.resource_path.ends_with("peer-personality-01.png"),"entrance uses approved peer")
        c.assert_true(right.modulate.r > left.modulate.r,"speaking peer emphasized")
        var before: Dictionary = screen.story.duplicate(true)
        screen.next_dialogue()
        left = screen.find_child("PlayerIllustration",true,false)
        right = screen.find_child("PartnerIllustration",true,false)
        c.assert_true(left.modulate.r > right.modulate.r,"player reply transfers emphasis")
        c.assert_equal(before,screen.story,"portrait changes do not alter gameplay")
        screen.advance_story(0)
        right = screen.find_child("FullSceneIllustration",true,false)
        c.assert_true(right != null,"classroom uses user approved shared-stage composition")
        await process_frame
        c.assert_true(right.get_global_rect().end.y <= 720,"portrait within viewport")
        c.assert_true(screen.story_copy.size.x >= 400,"portrait leaves readable dialogue width")
    screen.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

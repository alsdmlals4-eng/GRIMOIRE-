extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    root.size = Vector2i(1280,720)
    var screen = load("res://src/ui/shared_duel/shared_duel_screen.tscn").instantiate()
    root.add_child(screen)
    await process_frame
    var view = screen.get("spell_visual")
    c.assert_true(view != null,"spell manifestation replaces prepared card plates")
    if view == null:
        screen.queue_free()
        await process_frame
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    var original: Dictionary = screen.session.duplicate(true)
    screen.select_card(0)
    c.assert_equal(1,view.layer_count,"one component prepares one circle")
    c.assert_equal("EMBER",view.spell_key,"single flame uses illustrated elemental art")
    var single_texture = view.manifestation.texture
    screen.select_card(2)
    c.assert_equal(2,view.layer_count,"second component adds a circle layer")
    for ring in view.circles:
        c.assert_true(ring.size.x <= 160 and ring.size.y <= 116,"ring stays inside its presentation viewport")
    await process_frame
    await process_frame
    var information = screen.find_child("DuelInformation",true,false)
    c.assert_true(screen.details.get_global_rect().end.y <= information.get_global_rect().end.y,"full consequence quote is visible at desktop baseline")
    c.assert_equal("EMBER+WIND",view.spell_key,"pair uses shared normalized recipe")
    c.assert_true(single_texture != view.manifestation.texture,"combined spell is a separate integrated manifestation")
    c.assert_equal(original,screen.session,"preparation animation never commits game state")
    screen.cancel_selection()
    c.assert_equal(0,view.layer_count,"cancel releases all prepared circles")
    c.assert_equal(original,screen.session,"cancel animation is free")
    view.set_reduced_motion(true)
    screen.select_pair(2,4)
    c.assert_equal(2,view.layer_count,"reduced motion retains readable layer count")
    c.assert_true(view.motion == null,"reduced motion does not start continuous animation")
    screen.confirm_action()
    c.assert_equal(1,view.cast_count,"only confirmed cast emits one presentation")
    c.assert_equal("WARD+WIND",view.last_cast_key,"cast preserves the spell that actually resolved")
    var after_cast: Dictionary = screen.session.duplicate(true)
    screen.confirm_action()
    c.assert_equal(1,view.cast_count,"double confirm cannot replay a committed spell")
    view.set_reduced_motion(false)
    screen.cancel_selection()
    c.assert_equal(after_cast,screen.session,"animation cancellation does not change committed result")
    for key in screen.Semantics.RECIPES:
        c.assert_true(view.Art.texture_for(key) != null,"art covers recipe " + key)
    view.prepare(["EMBER","WIND"])
    c.assert_true(view.motion != null,"full presentation animates prepared circle assembly")
    view.prepare([])
    await create_timer(0.5).timeout
    c.assert_equal("IDLE",view.phase,"cancel fade returns to idle")
    c.assert_true(not view.manifestation.visible,"cancel leaves no stale manifestation")
    view.play_cast(["EMBER"],"불씨")
    view.prepare(["WARD"])
    await create_timer(1.0).timeout
    c.assert_equal("WARD",view.spell_key,"new preparation interrupts prior cast without stale completion")
    c.assert_equal(1,view.layer_count,"new preparation survives old tween end")
    screen.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

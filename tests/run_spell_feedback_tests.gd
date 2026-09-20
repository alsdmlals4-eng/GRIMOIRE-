extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    root.size = Vector2i(1280,720)
    var cases := [
        ["LESSON_HEAT_01",["EMBER"],"vessel","","EMBER"],
        ["GREENHOUSE_LEAK_01",["GATHER","WIND"],"cloud","receiver","GATHER+WIND"],
        ["LAB_SAMPLE_02",["WARD"],"device","","WARD"],
        ["FESTIVAL_LIGHTS_01",["EMBER"],"lamp","","EMBER"],
    ]
    for row in cases:
        var screen = load("res://src/ui/event_session/event_session_screen.tscn").instantiate()
        screen.session = screen.engine.start(row[0],"feedback-" + row[0])
        root.add_child(screen)
        await process_frame
        var visual = screen.get("spell_visual")
        c.assert_true(visual != null,"event consumes common spell presentation: " + row[0])
        if visual == null:
            screen.queue_free()
            await process_frame
            continue
        var before: Dictionary = screen.session.duplicate(true)
        for button in screen.glyph_buttons:
            c.assert_true(button.icon != null,"learned-magic picker carries illustrated phenomenon")
        for glyph in row[1]: screen.select_glyph(glyph)
        c.assert_equal(row[1].size(),visual.layer_count,"prepared component count matches circle layers")
        screen.confirm_action()
        c.assert_equal(0,visual.cast_count,"invalid target must not show successful cast")
        c.assert_equal(before,screen.session,"rejected cast is free")
        screen.select_target(row[2])
        if row[3] != "": screen.select_destination(row[3])
        await process_frame
        await process_frame
        c.assert_true(screen.preview_text.get_index() < screen.details_toggle.get_index(),"cast preview precedes optional details")
        var quote_after: Dictionary = screen.quote.state.duplicate(true)
        screen.confirm_action()
        c.assert_equal(quote_after,screen.session,"presentation cannot change authoritative quoted result")
        c.assert_equal(1,visual.cast_count,"valid event cast is shown once")
        c.assert_equal(row[4],visual.last_cast_key,"event casts the selected semantic spell")
        screen.confirm_action()
        c.assert_equal(1,visual.cast_count,"empty repeat cannot replay cast")
        c.assert_equal(4,screen.glyph_buttons.size(),"event does not discard learned magic")
        screen.cancel_selection()
        visual.set_reduced_motion(true)
        c.assert_equal(quote_after,screen.session,"cancel or reduced motion cannot alter event outcome")
        if screen.session.outcome == "ONGOING":
            screen.select_manual("HELP")
            screen.confirm_action()
            c.assert_equal(1,visual.cast_count,"manual help must not masquerade as spell")
        screen.queue_free()
        await process_frame
    var duel = load("res://src/ui/shared_duel/shared_duel_screen.tscn").instantiate()
    root.add_child(duel)
    await process_frame
    duel.select_pair(2,4)
    duel.confirm_action()
    var text_value: String = duel.review.text
    var last_index := -1
    for section in ["내 주문","상대 행동","남은 효과","결계 결과"]:
        var index: int = text_value.find(section)
        c.assert_true(index > last_index,"review orders authoritative causality section: " + section)
        last_index = index
    c.assert_true(text_value.contains("흐름 공격 4"),"review describes resolved opponent not next heat preview")
    c.assert_true(text_value.contains("내 결계 15 / 16") and text_value.contains("상대 결계 13 / 16"),"review reports actual barrier aftermath")
    duel.find_child("ReviewToggle",true,false).pressed.emit()
    c.assert_true(not duel.prepared.get_parent().visible and not duel.details.visible,"expanded review replaces preparation, not hand or actions")
    c.assert_true(duel.review.get_parent().custom_minimum_size.y >= 200,"review can show a useful multi-line receipt")
    var snapshot: Dictionary = duel.session.duplicate(true)
    duel.select_card(duel.session.hand[0])
    c.assert_true(not duel.review.get_parent().visible and duel.prepared.get_parent().visible and duel.details.visible,"new choice returns to live preview")
    c.assert_equal(text_value,duel.review.text,"new preview cannot replace committed review")
    c.assert_equal(snapshot,duel.session,"review selection has no gameplay side effects")
    duel.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

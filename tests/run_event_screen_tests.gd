extends SceneTree

func _init() -> void:
    call_deferred("_run")

func _run() -> void:
    root.size = Vector2i(1280, 720)
    var check = preload("res://tests/test_case.gd").new()
    var path := "res://src/ui/event_session/event_session_screen.tscn"
    check.assert_true(FileAccess.file_exists(path), "event screen must consume actual session reducer")
    if FileAccess.file_exists(path):
        var screen = load(path).instantiate()
        root.add_child(screen)
        await process_frame
        var before: Dictionary = screen.session.duplicate(true)
        var drop_button = screen.glyph_buttons[1]
        check.assert_true(not drop_button._can_drop_data(Vector2.ZERO,{"spell_glyph":"EMBER"}),"foreign drag without current-screen context is rejected")
        screen.session.spell_state.learned.erase("WARD")
        screen.select_glyph("EMBER")
        screen.select_glyph("WARD")
        check.assert_equal(["EMBER"],screen.selected,"unlearned tap preserves current selection")
        screen.select_pair("EMBER","WARD")
        check.assert_equal(["EMBER"],screen.selected,"unlearned pair preserves current selection")
        screen.session = before.duplicate(true)
        screen.cancel_selection()
        var payload := {"spell_glyph":"EMBER","context":drop_button.drag_context.duplicate(true)}
        check.assert_true(drop_button._can_drop_data(Vector2.ZERO,payload),"current-screen learned pair accepts drag")
        drop_button._drop_data(Vector2.ZERO,payload)
        check.assert_equal(["WIND","EMBER"],screen.selected,"drop uses the same pair selection path")
        var pair_before = screen.selected.duplicate()
        screen.select_glyph("GATHER")
        check.assert_equal(pair_before,screen.selected,"third glyph cannot replace a selected pair")
        payload.context.revision -= 1
        check.assert_true(not drop_button._can_drop_data(Vector2.ZERO,payload),"stale action drag is rejected")
        drop_button._drop_data(Vector2.ZERO,payload)
        check.assert_equal(pair_before,screen.selected,"direct stale drop also preserves selection")
        payload.context = drop_button.drag_context.duplicate(true)
        payload.context.screen += 1
        check.assert_true(not drop_button._can_drop_data(Vector2.ZERO,payload),"other screen drag is rejected even with same glyph")
        payload.context = drop_button.drag_context.duplicate(true)
        payload.spell_glyph = "WIND"
        check.assert_true(not drop_button._can_drop_data(Vector2.ZERO,payload),"same glyph drop is rejected")
        check.assert_equal(before,screen.session,"all rejected input and valid pair selection cost nothing")
        screen.cancel_selection()
        screen.select_target("vessel")
        screen.select_pair("EMBER", "GATHER")
        check.assert_true("뜨거움" in screen.preview_text.text, "focus preview exposes actual hot result before spending")
        screen.cancel_selection()
        screen.select_target("vessel")
        screen.select_glyph("EMBER")
        check.assert_equal(before, screen.session, "selection and preview never commit")
        check.assert_equal("SOLVED", screen.quote.state.outcome, "UI preview sees goal outcome")
        screen.confirm_action()
        check.assert_equal("SOLVED", screen.session.outcome, "explicit confirm consumes reducer result")
        check.assert_equal(5, screen.session.spell_state.mana, "screen consumes once")
        screen.confirm_action()
        check.assert_equal(5, screen.session.spell_state.mana, "second confirm is harmless")
        screen.continue_story()
        check.assert_equal("GREENHOUSE_LEAK_01", screen.session.event_id, "story progresses from result not mode picker")
        screen.select_pair("GATHER", "WIND")
        screen.select_target("cloud")
        screen.select_destination("receiver")
        check.assert_equal(1, screen.quote.state.hazard, "screen preview includes renewed leak")
        var clock = screen.find_child("EventClock",true,false)
        check.assert_true(clock != null,"hazard events expose a dedicated clock")
        if clock != null:
            check.assert_equal(2,clock.current,"preview never fills the current clock")
            check.assert_true("작용 -2" in clock.summary.text and "시간 +1" in clock.summary.text,"spell relief and elapsed danger stay distinct")
            check.assert_true("2 → 1" in clock.summary.text,"clock projection uses reducer result")
        await process_frame
        await process_frame
        check.assert_true(screen.confirm.get_global_rect().end.y <= 720, "confirm must remain inside mobile landscape viewport")
        screen.cancel_selection()
        check.assert_equal(6, screen.session.spell_state.mana, "cancel costs no mana")
        check.assert_equal(2, screen.session.hazard, "cancel costs no time tick")
        screen.select_target("leak")
        screen.select_glyph("WARD")
        check.assert_true("다음 1행동" in screen.preview_text.text, "ward preview communicates actual duration")
        screen.confirm_action()
        check.assert_true("억제" in screen.facts.text, "active ward remains visible after selection clears")
        screen.select_manual("HELP")
        screen.confirm_action()
        check.assert_equal("ASSISTED", screen.session.outcome, "help remains an explicit confirmed action")
        screen.continue_story()
        check.assert_equal("FESTIVAL_LIGHTS_01", screen.session.event_id, "help does not block next story")
        if clock != null: check.assert_true(not clock.visible,"events without hazard never invent a threat clock")
        check.assert_true(screen.has_method("save_progress"), "screen exposes tested local save")
        check.assert_true(screen.has_method("load_progress"), "screen exposes tested local resume")
        if screen.has_method("save_progress") and screen.has_method("load_progress"):
            screen.save_folder = "res://artifacts/local-validation/event-screen-save-tests"
            screen.save_progress()
            screen.select_manual("HELP")
            screen.confirm_action()
            screen.load_progress()
            check.assert_equal("ONGOING", screen.session.outcome, "resume restores saved current event")
            check.assert_equal("FESTIVAL_LIGHTS_01", screen.session.event_id, "resume keeps story position")
        screen.session = screen.engine.start("GREENHOUSE_LEAK_01", "overflow")
        screen.story_index = 1
        screen.cancel_selection()
        screen.select_target("leak")
        screen.select_glyph("EMBER")
        screen.confirm_action()
        screen.select_manual("WAIT")
        screen.confirm_action()
        await process_frame
        await process_frame
        check.assert_true(screen.confirm.get_global_rect().end.y <= 720, "long consequence receipt cannot push footer offscreen")
        screen.session = screen.engine.start("GREENHOUSE_LEAK_01", "clock-floor")
        screen.session.hazard = 0
        screen.cancel_selection()
        screen.select_pair("GATHER","WIND")
        screen.select_target("cloud")
        screen.select_destination("receiver")
        if clock != null:
            check.assert_true("0 → 1" in clock.summary.text and "상하한 보정 +2" in clock.summary.text,"lower bound never displays impossible negative hazard")
        screen.session = screen.engine.start("GREENHOUSE_LEAK_01", "clock-ceiling")
        screen.session.hazard = 5
        screen.cancel_selection()
        screen.select_glyph("EMBER")
        screen.select_target("leak")
        if clock != null:
            check.assert_true("5 → 6" in clock.summary.text and "상하한 보정 -2" in clock.summary.text,"upper bound reconciles raw effects with actual result")
        var preview_before = screen.session.duplicate(true)
        for ignored in range(4): screen._render()
        check.assert_equal(preview_before,screen.session,"clock redraw cannot advance time or resources")
        screen.select_manual("HELP")
        if clock != null: check.assert_true("작용 +0 · 시간 +0" in clock.summary.text,"help preview does not invent elapsed danger")
        screen.queue_free()
        await process_frame
    print(JSON.stringify({"assertions": check.assertion_count(), "failures": check.failure_count(), "messages": check.failures()}))
    quit(0 if check.failure_count() == 0 else 1)

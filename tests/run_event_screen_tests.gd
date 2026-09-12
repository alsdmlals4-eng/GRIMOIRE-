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
        screen.queue_free()
        await process_frame
    print(JSON.stringify({"assertions": check.assertion_count(), "failures": check.failure_count(), "messages": check.failures()}))
    quit(0 if check.failure_count() == 0 else 1)

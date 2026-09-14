extends SceneTree
func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    root.size = Vector2i(1280,720)
    var cases := {
        "LESSON_HEAT_01":["vessel","sample"],
        "GREENHOUSE_LEAK_01":["leak","cloud","receiver"],
        "LAB_SAMPLE_02":["device","sample"],
        "FESTIVAL_LIGHTS_01":["lamp","decorations","latch","stage","audience"]}
    for event_id in cases:
        var screen = preload("res://src/ui/event_session/event_session_screen.tscn").instantiate()
        screen.save_folder = "res://artifacts/local-validation/event-presentation-tests"
        screen.session = screen.engine.start(event_id,"presentation-" + event_id)
        root.add_child(screen)
        await process_frame
        var view = screen.find_child("EventSceneView",true,false)
        c.assert_true(view != null,"every event consumes the object scene presentation")
        if view != null:
            var before = screen.session.duplicate(true)
            c.assert_true(not screen.facts.visible,"expanded diagnostic detail is not the default play surface")
            var detail_button = screen.find_child("DetailsToggle",true,false)
            c.assert_true(detail_button != null,"details remain explicitly accessible")
            if detail_button != null:
                detail_button.pressed.emit()
                c.assert_true(screen.facts.visible,"detail toggle reveals current rules and records")
                detail_button.pressed.emit()
                c.assert_true(not screen.facts.visible,"detail toggle returns to uncluttered play")
            if event_id == "LESSON_HEAT_01":
                screen.select_pair("EMBER","GATHER")
                c.assert_true("응축 불씨" in screen.selected_text.text,"selected glyph pair exposes the shared spell name before target selection")
                screen.cancel_selection()
            c.assert_equal(cases[event_id].size(),view.buttons.size(),"all real objects have exactly one hitbox")
            for id in cases[event_id]:
                c.assert_true(view.buttons.has(id),"object id has an actionable panel: " + id)
                if not view.buttons.has(id): continue
                var button: Button = view.buttons[id]
                button.grab_focus()
                button.pressed.emit()
                var is_destination: bool = id in ["receiver","stage","audience"]
                c.assert_equal(id,screen.destination_id if is_destination else screen.target_id,"panel selects stable target/destination id")
                c.assert_true(button.button_pressed,"selected object is visibly marked")
                c.assert_equal(button,root.gui_get_focus_owner(),"selection redraw retains keyboard focus")
            c.assert_equal(before,screen.session,"inspection and selection cost no gameplay state")
            for viewport_size in [Vector2i(1280,720),Vector2i(1024,576)]:
                root.size = viewport_size
                root.content_scale_size = viewport_size
                await process_frame
                await process_frame
                c.assert_true(screen.confirm.get_global_rect().end.y <= viewport_size.y,"explicit cast remains in viewport")
                c.assert_true(screen.next_button.get_global_rect().end.x <= viewport_size.x,"next action remains in viewport")
                var scene_scroll = screen.find_child("SceneScroll",true,false)
                for button in view.buttons.values():
                    scene_scroll.ensure_control_visible(button)
                    await process_frame
                    c.assert_true(scene_scroll.get_global_rect().encloses(button.get_global_rect()),"every target is reachable without horizontal scrolling")
            root.size = Vector2i(1280,720)
            root.content_scale_size = Vector2i(1280,720)
            if event_id == "LESSON_HEAT_01":
                screen.select_target("vessel")
                screen.select_glyph("EMBER")
                c.assert_true("차가움" in view.buttons.vessel.text,"preview never paints future temperature onto current object")
                screen.confirm_action()
                c.assert_true("따뜻함" in view.buttons.vessel.text,"committed temperature appears on the vessel")
                for button in view.buttons.values(): c.assert_true(button.disabled,"resolved event disables object selection")
            if event_id == "LAB_SAMPLE_02":
                c.assert_true("장치 내부" in view.buttons.sample.text,"sample exposes current location")
                screen.select_manual("MOVE_SAMPLE")
                screen.confirm_action()
                c.assert_true("안전 용기" in view.buttons.sample.text,"sample movement updates actual object location")
            if event_id == "GREENHOUSE_LEAK_01":
                screen.cancel_selection()
                screen.select_pair("GATHER","WIND")
                screen.select_target("cloud")
                screen.select_destination("receiver")
                var selection_before = screen.session.duplicate(true)
                screen.select_pair("EMBER","WARD")
                c.assert_equal("",screen.destination_id,"new non-transport spell clears stale destination")
                c.assert_equal("",screen.target_id,"new spell clears incompatible target without picking a replacement")
                c.assert_equal(selection_before,screen.session,"selection reconciliation never commits or spends")
                screen.select_target("leak")
                screen.select_pair("EMBER","GATHER")
                c.assert_equal("leak",screen.target_id,"dangerous but legal target remains selectable")
                screen.select_manual("HELP")
                screen.select_glyph("WIND")
                c.assert_equal("HELP",screen.action_kind,"rejected third glyph cannot switch the chosen manual action")
                screen.glyph_buttons[1].set_pressed_no_signal(true)
                screen.glyph_buttons[1].pressed.emit()
                c.assert_true(not screen.glyph_buttons[1].button_pressed,"rejected toggle cannot remain visually selected")
                screen.select_target("cloud")
                screen.select_destination("receiver")
                screen.session.spell_state.objects.receiver.capture_load = 3
                screen.select_pair("GATHER","WIND")
                c.assert_equal("cloud",screen.target_id,"full destination does not discard the valid source")
                c.assert_equal("",screen.destination_id,"full receiver is cleared when changing spell")
                screen.session.spell_state.objects.receiver.capture_load = 0
                screen.cancel_selection()
                screen.select_target("leak")
                screen.select_glyph("WARD")
                screen.confirm_action()
                c.assert_true("임시 보호 1행동" in view.buttons.leak.text,"temporary protection is visible on affected object")
                screen.select_manual("WAIT")
                screen.confirm_action()
                c.assert_true("임시 보호" not in view.buttons.leak.text,"expired protection is not retained as stale artwork")
        screen.queue_free()
        await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    root.size = Vector2i(1280,720)
    var screen = load("res://src/ui/shared_duel/shared_duel_screen.tscn").instantiate()
    root.add_child(screen)
    await process_frame
    await process_frame
    var before: Dictionary = screen.session.duplicate(true)
    var first = screen.hand.get_child(0)
    var second = screen.hand.get_child(1)
    var first_instance: int = first.get_instance_id()
    c.assert_true(first.icon != null,"hand consumes a visible glyph candidate, not only system text")
    c.assert_true(first.custom_minimum_size.y > first.custom_minimum_size.x,"hand cards have portrait proportions")
    first.grab_focus()
    screen.select_card(0)
    c.assert_equal(first_instance,screen.hand.get_child(0).get_instance_id(),"selection keeps the same card node and focus")
    c.assert_true(screen.hand.get_child(0).has_focus(),"selection does not destroy keyboard focus")
    screen.select_card(2)
    screen.choose_action("TIDY")
    screen.select_card(4)
    c.assert_equal("TIDY",screen.action_kind,"rejected third card cannot change action")
    var third = screen.hand.get_child(2)
    third.set_pressed(true)
    third.pressed.emit()
    c.assert_true(not third.button_pressed,"rejected third button restores its own toggled display")
    screen.cancel_selection()
    second = screen.hand.get_child(1)
    c.assert_true(not second._can_drop_data(Vector2.ZERO,{"duel_card":0}),"unscoped drag cannot impersonate current hand")
    # Direct drop must defend itself too, not depend on Godot calling can_drop first.
    second._drop_data(Vector2.ZERO,{"duel_card":0})
    c.assert_equal([],screen.selection,"direct foreign drop preserves selection")
    c.assert_equal(before,screen.session,"rejected input and selection never spend or draw")
    c.assert_true(screen.find_child("PreparedSpell",true,false) != null,"selected letters have a dedicated prepared spell consumer")
    first = screen.hand.get_child(0)
    second = screen.hand.get_child(1)
    var payload := {"duel_card":0,"context":first.drag_context.duplicate(true)}
    c.assert_true(second._can_drop_data(Vector2.ZERO,payload),"same screen live hand allows pair")
    second._drop_data(Vector2.ZERO,payload)
    c.assert_equal([2,0],screen.selection,"valid drop prepares two instances without casting")
    c.assert_true(screen.prepared.text.contains("온기 흐름"),"prepared spell consumes shared composition name")
    var selected_before: Array = screen.selection.duplicate()
    var stale: Dictionary = payload.duplicate(true)
    stale.context.revision -= 1
    second._drop_data(Vector2.ZERO,stale)
    c.assert_equal(selected_before,screen.selection,"stale revision drop rejected again at drop time")
    stale = payload.duplicate(true)
    stale.context.screen += 1
    c.assert_true(not second._can_drop_data(Vector2.ZERO,stale),"another screen with identical cards cannot supply a pair")
    stale = payload.duplicate(true)
    stale.duel_card = 1
    c.assert_true(not second._can_drop_data(Vector2.ZERO,stale),"card outside hand cannot be dropped")
    var announced_before: String = screen.announced.text
    screen.cancel_selection()
    c.assert_equal(announced_before,screen.announced.text,"selection never rerolls opponent intent")
    screen.select_pair(2,4)
    screen.confirm_action()
    c.assert_equal(1,screen.session.revision,"prepared cast commits once")
    screen.confirm_action()
    c.assert_equal(1,screen.session.revision,"double confirm cannot recast")
    c.assert_true(not screen.accepts_card_drop(screen.session.hand[0],payload),"used-card payload cannot reenter after exchange")
    c.assert_equal(screen.session.hand.size(),screen.hand.get_child_count(),"one visible node per live hand instance")
    screen.save_folder = "res://artifacts/local-validation/w06-presentation-save"
    screen.save_progress()
    var saved: Dictionary = screen.session.duplicate(true)
    var old_context: Dictionary = screen._drag_context()
    screen.load_progress()
    c.assert_equal(saved,screen.session,"save restore preserves hand RNG and receipts")
    c.assert_true(old_context != screen._drag_context(),"reload at same revision invalidates prior drag")
    screen.set_persistence_blocked(true)
    var blocked_selection: Array = screen.selection.duplicate()
    screen.select_card(screen.session.hand[0])
    screen.select_pair(screen.session.hand[0],screen.session.hand[1])
    c.assert_equal(blocked_selection,screen.selection,"blocked save cannot prepare new actions")
    for card in screen.hand.get_children(): c.assert_true(card.disabled,"save block is visible on every card")
    screen.set_persistence_blocked(false)
    # A genuine random deal containing two copies of the same glyph.
    for seed_value in range(100):
        var deal: Dictionary = screen.rules.create(seed_value,false)
        var pair: Array = []
        for a in deal.hand:
            for b in deal.hand:
                if a != b and int(a / 2) == int(b / 2): pair = [a,b]
        if pair.is_empty(): continue
        screen.session = deal
        screen.cancel_selection()
        screen.select_card(pair[0])
        screen.select_card(pair[1])
        c.assert_equal([pair[0]],screen.selection,"second copy cannot replace or combine same glyph")
        screen.select_pair(pair[0],pair[1])
        c.assert_equal([pair[0]],screen.selection,"same glyph pair function also preserves selection")
        c.assert_equal(deal.hand.size(),screen.hand.get_child_count(),"duplicate glyph instances remain separately visible")
        break
    for viewport_size in [Vector2i(1280,720),Vector2i(1024,576)]:
        root.size = viewport_size
        screen.size = Vector2(viewport_size)
        await process_frame
        await process_frame
        c.assert_true(screen.confirm.get_global_rect().end.y <= viewport_size.y,"confirm remains visible at " + str(viewport_size))
        for card in screen.hand.get_children():
            c.assert_true(card.get_global_rect().end.x <= viewport_size.x,"all four hand cards fit viewport")
    screen.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

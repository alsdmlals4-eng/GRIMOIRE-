extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var path := "res://src/ui/shared_duel/shared_duel_screen.tscn"
    c.assert_true(FileAccess.file_exists(path),"duel screen exists")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"failures":c.failure_count()}))
        quit(1)
        return
    var screen = load(path).instantiate()
    root.size = Vector2i(1280,720)
    root.add_child(screen)
    await process_frame
    await process_frame
    screen.save_folder = "res://artifacts/local-validation/duel-screen-tests"
    screen.select_card(0)
    c.assert_equal(0,screen.session.revision,"selection free")
    c.assert_equal("APPLIED",screen.quote.status,"selection quotes")
    screen.cancel_selection()
    c.assert_equal(0,screen.session.revision,"cancel free")
    screen.select_pair(2,4)
    c.assert_equal(15,screen.quote.state.player_barrier,"redirect preview")
    screen.confirm_action()
    c.assert_equal(1,screen.session.revision,"explicit cast once")
    var review = screen.find_child("ExchangeReview",true,false)
    c.assert_true(review != null,"completed exchange has review consumer")
    if review == null:
        screen.queue_free()
        await process_frame
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    c.assert_true(review.text.contains("되돌림 3") and review.text.contains("받는 피해 1"),"redirect receipt explains outcome")
    var saved_review: String = review.text
    screen.confirm_action()
    c.assert_equal(1,screen.session.revision,"empty second confirm no cast")
    screen.save_progress()
    var saved: Dictionary = screen.session.duplicate(true)
    screen.choose_action("WAIT")
    screen.confirm_action()
    c.assert_true(review.text.contains("대기") and review.text.contains("받는 피해 3"),"wait receipt replaces spell result")
    screen.load_progress()
    c.assert_equal(saved,screen.session,"UI save restore")
    c.assert_equal(saved_review,review.text,"review restored from saved receipt")
    screen.choose_action("STOP")
    screen.confirm_action()
    c.assert_equal("STOPPED",screen.session.outcome,"stop confirmation")
    c.assert_true(screen.confirm.disabled,"terminal disables cast")
    c.assert_true(review.text.contains("중단") and not review.text.contains("받는 피해"),"stop clears previous damage review")
    c.assert_true(screen.confirm.get_global_rect().end.y <= 720,"footer visible")
    var store = load("res://src/core/shared_spell/duel_save.gd").new()
    var folder := ProjectSettings.globalize_path(screen.save_folder)
    var newest: Dictionary = store.save_progress(folder,{"session":screen.session})
    var file := FileAccess.open(newest.path,FileAccess.WRITE)
    file.store_string("interrupted-write")
    file.close()
    c.assert_equal(saved,store.load_progress(folder).payload.session,"corrupt newest falls back")
    screen.restart()
    c.assert_true(review.text.contains("아직"),"retry clears prior review")
    screen.session = screen.rules.create(17)
    screen.cancel_selection()
    screen.select_pair(4,6)
    var before_preview: Dictionary = screen.session.duplicate(true)
    c.assert_true(review.text.contains("아직"),"preview is not a completed receipt")
    c.assert_equal(before_preview,screen.session,"review rendering does not mutate session")
    screen.confirm_action()
    c.assert_true(review.text.contains("복구량은 0") and review.text.contains("비용 2"),"full barrier repair warning survives cast")
    await process_frame
    await process_frame
    c.assert_true(screen.confirm.get_global_rect().end.y <= 720,"long warning does not push footer offscreen")
    screen.select_card(screen.session.hand[0])
    screen.choose_action("TIDY")
    screen.confirm_action()
    c.assert_true(review.text.contains("정돈") and review.text.contains("주문 없이"),"tidy is not described as spell")
    screen.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

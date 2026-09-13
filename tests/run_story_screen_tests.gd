extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var path := "res://src/ui/story/story_screen.tscn"
    c.assert_true(FileAccess.file_exists(path),"connected story screen exists")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count()}))
        quit(1)
        return
    var screen = load(path).instantiate()
    screen.save_folder = "res://artifacts/local-validation/story-screen-tests"
    root.size = Vector2i(1280,720)
    root.add_child(screen)
    await process_frame
    var fresh: Dictionary = screen.story.duplicate(true)
    c.assert_true(screen.find_child("Speaker",true,false) != null,"dialogue has a dedicated speaker plate")
    c.assert_true(screen.find_child("Narration",true,false) != null,"scene narration is separate from speech")
    c.assert_true(not screen.story_copy.text.contains("연결되지") and not screen.story_copy.text.contains("구현판"),"player prose excludes production status")
    var normal_folder: String = screen.save_folder
    screen.save_folder = "res://src/ui/story/story_screen.gd/no-save"
    screen.load_story()
    c.assert_equal(fresh,screen.story,"failed dialogue load preserves current story")
    var notices = screen.find_children("*","Label",true,false)
    c.assert_true(notices.any(func(label): return label.text.contains("정상 이야기 저장이 없습니다")),"dialogue load failure is visible")
    screen.save_folder = normal_folder
    screen.advance_story(0)
    screen.advance_story(1)
    await process_frame
    var lesson = screen.activity_view
    c.assert_equal("LESSON_HEAT_01",lesson.session.event_id,"embedded lesson")
    lesson.select_glyph("EMBER")
    lesson.select_target("vessel")
    lesson.confirm_action()
    c.assert_equal("SOLVED",screen.story.activity.outcome,"action checkpoints parent")
    lesson.continue_story()
    await process_frame
    c.assert_equal(3,screen.story.stage,"event finish leads to duel not greenhouse")
    await process_frame
    screen.activity_view.select_card(0)
    screen.activity_view.confirm_action()
    await process_frame
    c.assert_true(screen.activity_view.notice.text.contains("저장"),"duel action retains parent save notification")
    var mid_duel: Dictionary = screen.story.duplicate(true)
    screen.load_story()
    await process_frame
    c.assert_equal(mid_duel,screen.story,"ongoing duel resume keeps exact cards and state")
    screen.activity_view.choose_action("STOP")
    screen.activity_view.confirm_action()
    screen.activity_view.continue_story()
    await process_frame
    c.assert_equal(4,screen.story.stage,"duel stop can progress")
    screen.activity_view.select_manual("HELP")
    screen.activity_view.confirm_action()
    screen.activity_view.continue_story()
    await process_frame
    c.assert_equal(5,screen.story.stage,"greenhouse leads to review")
    c.assert_true(screen.story_copy.text.contains("도움") and screen.story_copy.text.contains("중단"),"review uses actual results")
    c.assert_true(screen.has_method("choose_reflection"),"review choice has UI consumer")
    if not screen.has_method("choose_reflection"):
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    c.assert_equal("",screen.story.get("reflection",""),"no automatic explanation")
    screen.choose_reflection("CAUSE")
    c.assert_true(screen.story_copy.text.contains("내 설명: 원인"),"explicit choice is shown as self report")
    var saved: Dictionary = screen.story.duplicate(true)
    screen.story = screen.flow.create()
    screen.load_story()
    await process_frame
    c.assert_equal(saved,screen.story,"autosaved story restores")
    c.assert_true(screen.story_copy.text.contains("후속"),"review does not claim full chapter done")
    screen.advance_story(5)
    await process_frame
    c.assert_true(is_instance_valid(screen.activity_view),"lab embeds existing event UI")
    if not is_instance_valid(screen.activity_view):
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    c.assert_equal("LAB_SAMPLE_02",screen.activity_view.session.event_id,"lab identity")
    screen.activity_view.select_manual("STOP_DEVICE")
    screen.activity_view.confirm_action()
    screen.activity_view.continue_story()
    await process_frame
    c.assert_equal("FESTIVAL_LIGHTS_01",screen.activity_view.session.event_id,"festival reached without mode menu")
    screen.activity_view.select_manual("HELP")
    screen.activity_view.confirm_action()
    screen.activity_view.continue_story()
    await process_frame
    c.assert_equal(8,screen.story.stage,"final record UI")
    c.assert_true(screen.story_copy.text.contains("시료 처리 중단") and screen.story_copy.text.contains("축제"),"ending preserves tradeoff and festival outcome")
    c.assert_true(screen.story_copy.text.contains("담당자"),"assisted festival gets outcome appropriate dialogue")
    screen.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

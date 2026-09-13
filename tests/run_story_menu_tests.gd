extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var path := "res://src/ui/story/story_menu.tscn"
    c.assert_true(FileAccess.file_exists(path),"story menu runtime consumer exists")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count()}))
        quit(1)
        return
    var menu = load(path).instantiate()
    menu.save_folder = "res://artifacts/local-validation/story-menu-tests/" + str(Time.get_ticks_usec())
    root.add_child(menu)
    await process_frame
    c.assert_true(menu.continue_button.disabled,"absent save disables continue")
    menu.continue_story()
    c.assert_true(not is_instance_valid(menu.story_view),"invalid continue stays in menu")
    menu.request_new()
    await process_frame
    c.assert_equal(0,menu.story_view.story.stage,"new starts admission")
    menu.story_view.advance_story(0)
    var saved: Dictionary = menu.story_view.story.duplicate(true)
    menu.show_menu()
    await process_frame
    menu.request_new()
    c.assert_true(menu.new_pending,"existing save requires player confirmation")
    menu.cancel_new()
    menu.continue_story()
    await process_frame
    c.assert_equal(saved,menu.story_view.story,"cancel preserves resumable exact story")
    menu.show_menu()
    await process_frame
    menu.confirm_new()
    c.assert_true(not is_instance_valid(menu.story_view),"stale confirmation cannot start")
    menu.request_new()
    menu.confirm_new()
    await process_frame
    c.assert_equal(0,menu.story_view.story.stage,"confirmed new begins stage0")
    menu.show_menu()
    menu.continue_story()
    await process_frame
    c.assert_equal(0,menu.story_view.story.stage,"new stage0 saved before entry")
    menu.show_menu()
    c.assert_true(menu.has_method("open_codex"),"main menu opens readable codex")
    if not menu.has_method("open_codex"):
        menu.queue_free()
        await process_frame
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    var store = preload("res://src/core/shared_spell/story_save.gd").new()
    var before_read: Dictionary = store.load_progress(ProjectSettings.globalize_path(menu.save_folder))
    menu.open_codex()
    c.assert_true(menu.find_children("*","Label",true,false).any(func(label): return label.text.contains("아직 배우지")),"prelesson codex explains locked letters")
    menu.show_menu()
    c.assert_equal(before_read,store.load_progress(ProjectSettings.globalize_path(menu.save_folder)),"codex reading does not rewrite save or RNG")
    c.assert_true(menu.has_method("choose_text_size"),"settings has actual dialogue font consumer")
    if not menu.has_method("choose_text_size"):
        menu.queue_free()
        await process_frame
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    menu.choose_text_size(32)
    menu.show_menu()
    menu.continue_story()
    await process_frame
    c.assert_equal(32,menu.story_view.story_copy.get_theme_font_size("font_size"),"chosen large text reaches dialogue body")
    c.assert_equal(before_read,store.load_progress(ProjectSettings.globalize_path(menu.save_folder)),"font setting leaves story slots untouched")
    menu.show_menu()
    menu.save_folder = "res://src/ui/story/story_menu.gd/not-a-directory"
    menu.request_new()
    c.assert_true(not is_instance_valid(menu.story_view),"failed save does not enter new story")
    c.assert_true(menu.message.contains("저장"),"save failure explained")
    var corrupt_folder := "res://artifacts/local-validation/story-menu-tests/corrupt-" + str(Time.get_ticks_usec())
    DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(corrupt_folder))
    var corrupt_path := corrupt_folder.path_join("event-0.save")
    var corrupt = FileAccess.open(corrupt_path,FileAccess.WRITE)
    corrupt.store_string("invalid-save-fixture")
    corrupt.close()
    menu.save_folder = corrupt_folder
    menu.show_menu()
    menu.request_new()
    c.assert_true(not is_instance_valid(menu.story_view),"corrupt-only save prevents automatic replacement")
    c.assert_equal("invalid-save-fixture",FileAccess.get_file_as_string(corrupt_path),"corrupt bytes preserved for recovery")
    c.assert_true(menu.continue_button.disabled,"corrupt-only continue disabled")
    menu.queue_free()
    await process_frame
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

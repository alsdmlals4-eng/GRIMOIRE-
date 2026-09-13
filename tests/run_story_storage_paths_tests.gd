extends SceneTree

func _initialize() -> void:
    call_deferred("_run")

func _run() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var path := "res://src/core/shared_spell/story_storage_paths.gd"
    c.assert_true(FileAccess.file_exists(path),"exported saves must not use read-only resources")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    var paths = load(path)
    c.assert_equal("res://artifacts/local-validation",paths.root(true),"development writes remain in project")
    c.assert_equal("user://grimoire",paths.root(false),"export uses writable player storage")
    for name in ["story-progress","event-session-progress","shared-duel-progress"]:
        c.assert_true(paths.folder(name,false).begins_with("user://grimoire/"),"export family uses user data")
    var store = preload("res://src/core/shared_spell/story_save.gd").new()
    var flow = preload("res://src/core/shared_spell/story_flow.gd").new()
    var folder: String = paths.folder("storage-contract-tests",true)
    var packet := {"story":flow.create()}
    var first: Dictionary = store.save_progress(folder,packet)
    var second: Dictionary = store.save_progress(folder,packet)
    c.assert_equal("SAVED",second.status,"test creates real bounded slots")
    c.assert_true(not store.load_progress(folder).get("recovery",true),"healthy slots do not claim recovery")
    var file := FileAccess.open(second.path,FileAccess.WRITE)
    file.store_buffer(PackedByteArray([0,1,2]))
    file.close()
    var corrupt_bytes := FileAccess.get_file_as_bytes(second.path)
    var recovered: Dictionary = store.load_progress(folder)
    c.assert_true(recovered.get("recovery",false),"invalid slot is disclosed when valid backup loads")
    c.assert_equal(first.generation,recovered.generation,"actual backup generation restored")
    c.assert_true(not recovered.get("diagnostics",[]).is_empty(),"recovery includes diagnostic reason")
    c.assert_equal(corrupt_bytes,FileAccess.get_file_as_bytes(second.path),"read never overwrites corrupt source")
    var recovery_menu = preload("res://src/ui/story/story_menu.tscn").instantiate()
    recovery_menu.save_folder = folder
    root.add_child(recovery_menu)
    recovery_menu.continue_story()
    c.assert_true(recovery_menu.story_view.save_message.contains("일부 기록"),"menu discloses backup recovery")
    c.assert_equal(corrupt_bytes,FileAccess.get_file_as_bytes(second.path),"continue does not rewrite corrupt source")
    recovery_menu.queue_free()
    await process_frame
    file = FileAccess.open(first.path,FileAccess.WRITE)
    file.store_buffer(PackedByteArray([3,4,5]))
    file.close()
    c.assert_equal("REJECTED",store.load_progress(folder).status,"two invalid slots cannot load")
    # This directory is dedicated to the test; no player data is modified.
    var menu = preload("res://src/ui/story/story_menu.tscn").instantiate()
    menu.save_folder = folder
    root.add_child(menu)
    menu.request_new()
    c.assert_true(menu.story_view == null,"corrupt-only save blocks automatic new-game overwrite")
    c.assert_equal(corrupt_bytes,FileAccess.get_file_as_bytes(second.path),"menu preserves corrupt slot")
    menu.queue_free()
    await process_frame
    # Leave one valid + one corrupt test slot for the live recovery walkthrough.
    c.assert_equal("SAVED", store.save_progress(folder, packet).status, "prepare isolated runtime recovery fixture")
    var preserved: Dictionary = store.load_progress(folder)
    var oversized := packet.duplicate(true)
    oversized["padding"] = "x".repeat(store.MAX_BYTES + 1)
    c.assert_equal("SAVE_TOO_LARGE",store.save_progress(folder,oversized).get("reason"),"oversized write rejected")
    c.assert_equal(preserved.generation,store.load_progress(folder).generation,"oversized write preserves good generation")
    var prefs = preload("res://src/core/shared_spell/story_preferences.gd").new()
    c.assert_true(prefs.save_size(folder,32),"preferences use independent subfolder")
    c.assert_equal(32,prefs.load_size(folder),"preferences roundtrip")
    c.assert_equal(preserved.payload,store.load_progress(folder).payload,"settings cannot replace story payload")
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

extends SceneTree

func _initialize() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var path := "res://src/core/shared_spell/story_preferences.gd"
    c.assert_true(FileAccess.file_exists(path),"dialogue preference has persisted consumer")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count()}))
        quit(1)
        return
    var prefs = load(path).new()
    var folder := "res://artifacts/local-validation/story-preferences-tests/" + str(Time.get_ticks_usec())
    c.assert_equal(24,prefs.load_size(folder),"missing preference defaults to readable baseline")
    c.assert_true(prefs.save_size(folder,32),"valid large preference saved")
    c.assert_equal(32,prefs.load_size(folder),"preference restored")
    c.assert_true(not prefs.save_size(folder,-1),"invalid size rejected")
    c.assert_equal(32,prefs.load_size(folder),"invalid input does not replace prior preference")
    c.assert_equal("REJECTED",prefs.save_progress(folder.path_join("preferences"),{"font_size":"large"}).status,"wrong type payload rejected")
    c.assert_true(prefs.save_size(folder,28),"second preference slot saved")
    var corrupt := FileAccess.open(folder.path_join("preferences/event-1.save"),FileAccess.WRITE)
    corrupt.store_string("interrupted-preference-fixture")
    corrupt.close()
    c.assert_equal(32,prefs.load_size(folder),"corrupt latest preference falls back to prior")
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

extends RefCounted

const PATH := "res://src/core/story/story_progress.gd"
const ADMISSION_SCENE_PATH := "res://src/ui/story/admission_prologue.tscn"
const FIRST_CLASS_SCENE_PATH := "res://src/ui/story/first_class_root.tscn"
const FIRST_EVENT_SCENE_PATH := "res://src/ui/story/story_event_root.tscn"
const DUEL_PRACTICUM_SCENE_PATH := "res://src/ui/story/duel_practicum_root.tscn"
const FESTIVAL_CANOPY_SCENE_PATH := "res://src/ui/story/festival_canopy_root.tscn"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Story progress implementation must exist")
    if not FileAccess.file_exists(PATH):
        return

    var story_progress_script = load(PATH)
    case.assert_true(story_progress_script != null, "Story progress script loads")
    if story_progress_script == null:
        return

    # Breaks if a new record starts anywhere other than the admission narrative beat.
    var progress = story_progress_script.create_new()
    case.assert_equal(&"ADMISSION_PROLOGUE", progress.current_beat(), "New record begins at admission")
    case.assert_equal(ADMISSION_SCENE_PATH, progress.next_scene_path(), "New record routes to the admission prologue")
    case.assert_true(ResourceLoader.exists(progress.next_scene_path()), "New record route loads the admission prologue")

    # Breaks if a front door regresses into a free activity-mode hub.
    var front_door_actions: Array = progress.available_front_door_actions()
    case.assert_equal([&"NEW_RECORD", &"RESUME_RECORD", &"ARCHIVE", &"SETTINGS", &"QUIT"], front_door_actions, "Valid story progress exposes record, archive, settings, and quit actions")
    for forbidden_action in [&"LESSON", &"PRACTICUM", &"DUEL", &"FESTIVAL", &"CARD_ARCHIVE", &"EVENT_ARCHIVE"]:
        case.assert_false(front_door_actions.has(forbidden_action), "Front door never offers %s mode selection" % forbidden_action)

    # Breaks if the admission action skips the first-class narrative beat.
    var advanced: Dictionary = progress.advance_from_admission()
    case.assert_equal(&"FIRST_CLASS_ROUTE", advanced.get("status", &""), "Admission continues through the first-class route")
    case.assert_equal(&"FIRST_CLASS", progress.current_beat(), "Admission continuation advances only to the first class")
    case.assert_equal(FIRST_CLASS_SCENE_PATH, progress.next_scene_path(), "Admission continuation targets the first-class route")
    case.assert_true(ResourceLoader.exists(progress.next_scene_path()), "First-class route loads")

    # Breaks if the first class can be skipped before the greenhouse practicum.
    var practicum: Dictionary = progress.advance_from_class()
    case.assert_equal(&"FIRST_EVENT_ROUTE", practicum.get("status", &""), "First class routes only to the first practicum")
    case.assert_equal(&"FIRST_EVENT", progress.current_beat(), "First class advances to the first practicum beat")
    case.assert_equal(FIRST_EVENT_SCENE_PATH, progress.next_scene_path(), "First practicum keeps the existing Circle/Clock root")

    # Breaks if the supervised duel or festival are selectable from an earlier beat.
    var duel: Dictionary = progress.advance_from_first_practicum()
    case.assert_equal(&"DUEL_PRACTICUM_ROUTE", duel.get("status", &""), "Resolved first practicum routes to supervised duel practice")
    case.assert_equal(&"DUEL_PRACTICUM", progress.current_beat(), "First practicum advances to the duel beat")
    case.assert_equal(DUEL_PRACTICUM_SCENE_PATH, progress.next_scene_path(), "Duel beat loads the dedicated practicum scene")
    case.assert_true(ResourceLoader.exists(progress.next_scene_path()), "Duel practicum scene loads")

    var festival: Dictionary = progress.advance_from_duel_practicum()
    case.assert_equal(&"FESTIVAL_CANOPY_ROUTE", festival.get("status", &""), "Supervised duel routes to the festival canopy")
    case.assert_equal(&"FESTIVAL_CANOPY", progress.current_beat(), "Duel advances to the festival beat")
    case.assert_equal(FESTIVAL_CANOPY_SCENE_PATH, progress.next_scene_path(), "Festival beat loads the closing story scene")
    case.assert_true(ResourceLoader.exists(progress.next_scene_path()), "Festival canopy scene loads")

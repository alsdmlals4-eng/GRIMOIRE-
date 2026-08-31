extends RefCounted

const PATH := "res://src/core/story/story_progress.gd"
const ADMISSION_SCENE_PATH := "res://src/ui/story/admission_prologue.tscn"


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
    case.assert_equal([&"NEW_RECORD", &"RESUME_RECORD", &"SETTINGS"], front_door_actions, "Front door exposes only record and settings actions")
    for forbidden_action in [&"LESSON", &"PRACTICUM", &"DUEL", &"FESTIVAL", &"CARD_ARCHIVE", &"EVENT_ARCHIVE"]:
        case.assert_false(front_door_actions.has(forbidden_action), "Front door never offers %s mode selection" % forbidden_action)

    # Breaks if the admission action skips the story route or exposes an arbitrary scene jump.
    var advanced: Dictionary = progress.advance_from_admission()
    case.assert_equal(&"FIRST_EVENT_ROUTE", advanced.get("status", &""), "Admission continues through the first event route")
    case.assert_equal(&"FIRST_EVENT", progress.current_beat(), "Admission continuation advances the narrative beat")
    case.assert_equal("res://src/ui/story/story_event_root.tscn", progress.next_scene_path(), "Admission continuation targets the first event route")

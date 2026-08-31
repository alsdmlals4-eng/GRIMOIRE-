extends RefCounted

const PATH := "res://src/ui/front_door/story_front_door.gd"
const SCENE_PATH := "res://src/ui/front_door/story_front_door.tscn"
const PROLOGUE_SCENE_PATH := "res://src/ui/story/admission_prologue.tscn"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Story front door implementation must exist")
    case.assert_true(ResourceLoader.exists(SCENE_PATH), "Story front door scene exists")
    case.assert_true(ResourceLoader.exists(PROLOGUE_SCENE_PATH), "Admission prologue scene exists")
    if not FileAccess.file_exists(PATH) or not ResourceLoader.exists(SCENE_PATH) or not ResourceLoader.exists(PROLOGUE_SCENE_PATH):
        return

    var front_door_scene = load(SCENE_PATH)
    var front_door_script = load(PATH)
    case.assert_true(front_door_scene is PackedScene, "Story front door scene loads")
    case.assert_true(front_door_script != null, "Story front door script loads")
    if not front_door_scene is PackedScene or front_door_script == null:
        return

    var front_door = front_door_scene.instantiate()
    case.assert_true(front_door is Control, "Story front door root is a live Control")
    case.assert_true(front_door.has_node("NewRecordButton"), "New record is a live button")
    case.assert_true(front_door.has_node("ResumeRecordButton"), "Resume record is a live button")
    case.assert_true(front_door.has_node("SettingsButton"), "Settings is a live button")
    var configured_main_scene_path := str(ProjectSettings.get_setting("application/run/main_scene", ""))
    case.assert_equal(SCENE_PATH, configured_main_scene_path, "Story front door is the configured default main scene")
    if not front_door.has_node("NewRecordButton") or not front_door.has_node("ResumeRecordButton") or not front_door.has_node("SettingsButton"):
        front_door.free()
        return

    # Breaks if an empty record falsely appears resumable.
    front_door.configure(null)
    case.assert_false(front_door.get_node("ResumeRecordButton").visible, "Resume stays hidden without a valid record")
    case.assert_equal([&"NEW_RECORD", &"SETTINGS"], front_door.visible_action_ids(), "Empty front door presents no activity hub")

    # Breaks if starting a record skips the admission prologue.
    var new_record: Dictionary = front_door.start_new_record()
    case.assert_equal(&"NEW_RECORD_READY", new_record.get("status", &""), "New record is prepared for story entry")
    case.assert_equal(PROLOGUE_SCENE_PATH, new_record.get("route_path", ""), "New record points to admission prologue")

    # Breaks if a valid narrative record cannot resume, or if the front door adds mode buttons.
    front_door.configure(new_record.get("progress", null))
    case.assert_true(front_door.get_node("ResumeRecordButton").visible, "Valid story progress exposes resume")
    case.assert_equal([&"NEW_RECORD", &"RESUME_RECORD", &"SETTINGS"], front_door.visible_action_ids(), "Valid front door still exposes only record and settings actions")
    for forbidden_node in ["LessonButton", "PracticumButton", "DuelButton", "FestivalButton", "CardArchiveButton", "EventArchiveButton", "EventClock"]:
        case.assert_false(front_door.has_node(forbidden_node), "Story front door has no %s" % forbidden_node)

    var prologue_scene = load(PROLOGUE_SCENE_PATH)
    case.assert_true(prologue_scene is PackedScene, "Admission prologue scene loads")
    if prologue_scene is PackedScene:
        var prologue = prologue_scene.instantiate()
        case.assert_true(prologue.has_node("ContinueNarrativeButton"), "Admission has one live continue action")
        var visible_buttons: Array = []
        for node in prologue.get_children():
            if node is Button and node.visible:
                visible_buttons.append(String(node.name))
        case.assert_equal(["ContinueNarrativeButton"], visible_buttons, "Admission prologue exposes exactly one visible action")
        prologue.configure(new_record.get("progress", null))
        var continuation: Dictionary = prologue.continue_narrative()
        case.assert_equal(&"FIRST_EVENT_ROUTE", continuation.get("status", &""), "Admission continue advances only to the first event route")
        prologue.free()

    front_door.free()

extends RefCounted

const PATH := "res://src/ui/front_door/story_front_door.gd"
const SCENE_PATH := "res://src/ui/front_door/story_front_door.tscn"
const PROLOGUE_SCENE_PATH := "res://src/ui/story/admission_prologue.tscn"
const BACKGROUND_PATH := "res://assets/art/backgrounds/school/bg_school_admission_approach.png"
const LEGACY_CANDIDATE_PATH := "res://assets/art/source_candidates/circle_clock_card_core/front_door/front_door_admission_academy_candidate_01.png"
const LOCKED_BACKGROUND_SHA256 := "D002D5E8FE545631F48AC07F2AA4C2F4AB292B587E9476CE39F96276133A5FE0"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Story front door implementation must exist")
    case.assert_true(ResourceLoader.exists(SCENE_PATH), "Story front door scene exists")
    case.assert_true(ResourceLoader.exists(PROLOGUE_SCENE_PATH), "Admission prologue scene exists")
    case.assert_true(ResourceLoader.exists(BACKGROUND_PATH), "Locked admission background is promoted into the runtime art directory")
    case.assert_false(FileAccess.file_exists(LEGACY_CANDIDATE_PATH), "Locked background is moved out of the legacy source-candidate path rather than duplicated")
    var scene_text := FileAccess.get_file_as_string(SCENE_PATH)
    case.assert_false(scene_text.contains("uid=\"uid://xdiv8lv0fg4h\" path=\"res://src/ui/front_door/story_front_door.gd\""), "Front door script reference has no stale UID that produces a Godot runtime warning")
    if FileAccess.file_exists(BACKGROUND_PATH):
        case.assert_equal(LOCKED_BACKGROUND_SHA256, FileAccess.get_sha256(BACKGROUND_PATH).to_upper(), "Canonical background preserves the approved byte identity")
    if not FileAccess.file_exists(PATH) or not ResourceLoader.exists(SCENE_PATH) or not ResourceLoader.exists(PROLOGUE_SCENE_PATH) or not ResourceLoader.exists(BACKGROUND_PATH):
        return

    var front_door_scene = load(SCENE_PATH)
    var front_door_script = load(PATH)
    case.assert_true(front_door_scene is PackedScene, "Story front door scene loads")
    case.assert_true(front_door_script != null, "Story front door script loads")
    if not front_door_scene is PackedScene or front_door_script == null:
        return

    var front_door = front_door_scene.instantiate()
    case.assert_true(front_door is Control, "Story front door root is a live Control")
    var environment_background := front_door.get_node_or_null("EnvironmentBackground") as TextureRect
    case.assert_true(environment_background != null, "Story front door owns the locked admission environment as a live texture layer")
    if environment_background == null:
        front_door.free()
        return
    case.assert_true(environment_background.texture != null, "Admission environment texture is bound at runtime")
    if environment_background.texture != null:
        case.assert_equal(BACKGROUND_PATH, environment_background.texture.resource_path, "Admission environment uses the user-locked canonical background")
    case.assert_equal(Control.MOUSE_FILTER_IGNORE, environment_background.mouse_filter, "Admission environment does not intercept front-door input")
    case.assert_equal(TextureRect.STRETCH_KEEP_ASPECT_COVERED, environment_background.stretch_mode, "Admission environment covers the landscape viewport without a blank frame")
    case.assert_true(front_door.has_node("Content/MenuActions/NewRecordButton"), "New record is a live button")
    case.assert_true(front_door.has_node("Content/MenuActions/ResumeRecordButton"), "Resume record is a live button")
    case.assert_true(front_door.has_node("Content/MenuActions/ArchiveButton"), "Archive is a live read-only menu button")
    case.assert_true(front_door.has_node("Content/MenuActions/SettingsButton"), "Settings is a live button")
    case.assert_true(front_door.has_node("Content/MenuActions/QuitButton"), "Quit is a live menu button")
    case.assert_true(front_door.has_node("QuitConfirmationDialog"), "Quit requires a live confirmation dialog")
    var configured_main_scene_path := str(ProjectSettings.get_setting("application/run/main_scene", ""))
    case.assert_equal(SCENE_PATH, configured_main_scene_path, "Story front door is the configured default main scene")
    if not front_door.has_node("Content/MenuActions/NewRecordButton") or not front_door.has_node("Content/MenuActions/ResumeRecordButton") or not front_door.has_node("Content/MenuActions/ArchiveButton") or not front_door.has_node("Content/MenuActions/SettingsButton") or not front_door.has_node("Content/MenuActions/QuitButton"):
        front_door.free()
        return

    # Breaks if an empty record falsely appears resumable.
    front_door.configure(null)
    var resume_button := front_door.get_node("Content/MenuActions/ResumeRecordButton") as Button
    case.assert_true(resume_button.visible, "Resume remains present in the main menu without a valid record")
    case.assert_true(resume_button.disabled, "Resume is disabled without a valid record")
    case.assert_equal([&"NEW_RECORD", &"ARCHIVE", &"SETTINGS", &"QUIT"], front_door.visible_action_ids(), "Empty front door offers only record-safe and meta actions")
    case.assert_true(front_door.has_method("open_archive"), "Front door can open a read-only archive")
    case.assert_true(front_door.has_method("request_quit_confirmation"), "Front door asks before quitting")
    case.assert_true(front_door.has_method("cancel_quit"), "Front door can cancel quit without changing records")
    case.assert_true(front_door.has_method("confirm_quit"), "Front door confirms quit separately from its request")
    if front_door.has_method("open_archive"):
        var archive_request: Dictionary = front_door.open_archive()
        case.assert_equal(&"ARCHIVE_READY", archive_request.get("status", &""), "Archive request is explicitly read-only")
        case.assert_false(archive_request.has("route_path"), "Archive request does not create an activity route")
    if front_door.has_method("request_quit_confirmation"):
        var quit_request: Dictionary = front_door.request_quit_confirmation()
        case.assert_equal(&"QUIT_CONFIRMATION_REQUIRED", quit_request.get("status", &""), "Quit needs confirmation before the application exits")
    if front_door.has_method("cancel_quit"):
        var quit_cancel: Dictionary = front_door.cancel_quit()
        case.assert_equal(&"QUIT_CANCELLED", quit_cancel.get("status", &""), "Cancelling quit leaves the menu active")
    if front_door.has_method("confirm_quit"):
        var quit_confirm: Dictionary = front_door.confirm_quit()
        case.assert_equal(&"QUIT_CONFIRMED", quit_confirm.get("status", &""), "Confirmed quit is a distinct, explicit action")

    # Breaks if starting a record skips the admission prologue.
    var new_record: Dictionary = front_door.start_new_record()
    case.assert_equal(&"NEW_RECORD_READY", new_record.get("status", &""), "New record is prepared for story entry")
    case.assert_equal(PROLOGUE_SCENE_PATH, new_record.get("route_path", ""), "New record points to admission prologue")

    # Breaks if a valid narrative record cannot resume, or if the front door adds mode buttons.
    front_door.configure(new_record.get("progress", null))
    case.assert_true(resume_button.visible and not resume_button.disabled, "Valid story progress enables resume")
    case.assert_equal([&"NEW_RECORD", &"RESUME_RECORD", &"ARCHIVE", &"SETTINGS", &"QUIT"], front_door.visible_action_ids(), "Valid front door preserves story entry while exposing archive and quit utilities")
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

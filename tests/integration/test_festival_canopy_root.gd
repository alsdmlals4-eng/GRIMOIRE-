extends RefCounted

const ROOT_SCENE_PATH := "res://src/ui/story/festival_canopy_root.tscn"
const STORY_PROGRESS_PATH := "res://src/core/story/story_progress.gd"
const BACKGROUND_PATH := "res://assets/art/backgrounds/school/bg_school_common.webp"


func run(case) -> void:
    case.assert_true(ResourceLoader.exists(ROOT_SCENE_PATH), "Festival canopy scene exists")
    var root_scene = load(ROOT_SCENE_PATH)
    var story_progress_script = load(STORY_PROGRESS_PATH)
    case.assert_true(root_scene is PackedScene, "Festival canopy scene loads")
    case.assert_true(story_progress_script != null, "Story progress loads for festival")
    if not root_scene is PackedScene or story_progress_script == null:
        return

    var root = root_scene.instantiate()
    root._ready()
    var environment := root.get_node_or_null(NodePath("EnvironmentBackground")) as TextureRect
    case.assert_true(environment != null and environment.texture != null, "Festival has a reusable canonical academy environment instead of a blank frame")
    if environment != null and environment.texture != null:
        case.assert_equal(BACKGROUND_PATH, environment.texture.resource_path, "Festival reuses an existing canonical environment until a festival-specific art lock exists")
        case.assert_equal(Control.MOUSE_FILTER_IGNORE, environment.mouse_filter, "Festival environment does not consume dialogue input")
    case.assert_equal(&"FESTIVAL_CANOPY_PROGRESS_REQUIRED", root.confirm_first_session().get("status", &""), "Festival close cannot run on an absent or earlier beat")

    var progress = story_progress_script.create_new()
    progress.advance_from_admission()
    progress.advance_from_class()
    progress.advance_from_first_practicum()
    progress.advance_from_duel_practicum()
    root.configure(progress)
    var close_result: Dictionary = root.confirm_first_session()
    case.assert_equal(&"FIRST_SESSION_COMPLETE", close_result.get("status", &""), "Festival closes the authored first-session arc without exposing another activity picker")
    case.assert_false(close_result.has("route_path"), "Festival completion does not jump to a free-mode hub")
    case.assert_true(root.get_node("ClosingPanel/Festival/CompletionNotice").visible, "Festival confirmation produces a live completion notice")
    root.free()

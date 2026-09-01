extends RefCounted

const ROOT_SCENE_PATH := "res://src/ui/story/duel_practicum_root.tscn"
const STORY_PROGRESS_PATH := "res://src/core/story/story_progress.gd"
const BACKGROUND_PATH := "res://assets/art/backgrounds/academy/bg_duel_practice_cloister.png"


func run(case) -> void:
    case.assert_true(ResourceLoader.exists(ROOT_SCENE_PATH), "Supervised duel practicum scene exists")
    case.assert_true(ResourceLoader.exists(BACKGROUND_PATH), "User-locked duel environment is promoted to the runtime art directory")
    var root_scene = load(ROOT_SCENE_PATH)
    var story_progress_script = load(STORY_PROGRESS_PATH)
    case.assert_true(root_scene is PackedScene, "Supervised duel practicum scene loads")
    case.assert_true(story_progress_script != null, "Story progress loads for duel practicum")
    if not root_scene is PackedScene or story_progress_script == null:
        return

    var root = root_scene.instantiate()
    root._ready()
    var environment := root.get_node_or_null(NodePath("EnvironmentBackground")) as TextureRect
    case.assert_true(environment != null and environment.texture != null, "Duel scene binds an environment-only texture")
    if environment != null:
        case.assert_equal(Control.MOUSE_FILTER_IGNORE, environment.mouse_filter, "Duel environment never intercepts circle or dialogue input")
        case.assert_equal(TextureRect.STRETCH_KEEP_ASPECT_COVERED, environment.stretch_mode, "Duel environment covers the landscape viewport")
        if environment.texture != null:
            case.assert_equal(BACKGROUND_PATH, environment.texture.resource_path, "Duel scene uses the user-locked canonical environment")
    case.assert_false(root.has_method("request_start_duel"), "Story duel practice is not a card-minigame entry point")
    var writing_hint := root.get_node_or_null(NodePath("Content/Body/GlyphWritingPanel/Hint")) as Label
    case.assert_true(writing_hint != null and writing_hint.text.contains("수호 결계"), "Duel writing guidance names the live duel context instead of greenhouse seedlings")

    var progress = story_progress_script.create_new()
    progress.advance_from_admission()
    progress.advance_from_class()
    progress.advance_from_first_practicum()
    root.configure(progress)
    case.assert_equal(&"GLYPH_SELECTED", root.select_glyph(&"PROTECT").get("status", &""), "Duel practice accepts direct glyph input")
    case.assert_equal(&"PREVIEW_READY", root.request_circle_preview().get("status", &""), "Duel practice requires an explicit Circle preview")
    case.assert_equal(&"TARGET_SELECTED", root.select_target(&"DUEL_WARD").get("status", &""), "Duel practice requires a live practice-ward target")
    var resolution: Dictionary = root.request_commit()
    case.assert_equal(&"RESOLVED", resolution.get("status", &""), "Duel practice resolves one explicit cast through EventClock")
    case.assert_equal(1, root.goal_clock_segments(), "Duel practice advances its goal clock with a declared method")
    case.assert_equal(1, root.threat_clock_segments(), "Duel practice visibly retains its declared pressure")

    var festival_owner := Node.new()
    var festival_handoff: Dictionary = root.handoff_festival_canopy(festival_owner)
    case.assert_equal(&"FESTIVAL_CANOPY_HANDOFF_READY", festival_handoff.get("status", &""), "Resolved duel stages one festival handoff")
    var festival_progress = story_progress_script.consume_festival_canopy_handoff(festival_owner)
    case.assert_true(festival_progress != null and festival_progress.current_beat() == &"FESTIVAL_CANOPY", "Duel handoff advances only to the festival beat")
    festival_owner.free()
    root.free()

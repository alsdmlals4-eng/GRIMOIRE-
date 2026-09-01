extends RefCounted

const ROOT_SCENE_PATH := "res://src/ui/story/first_class_root.tscn"
const STORY_PROGRESS_PATH := "res://src/core/story/story_progress.gd"


func run(case) -> void:
    case.assert_true(ResourceLoader.exists(ROOT_SCENE_PATH), "First-class scene exists")
    var root_scene = load(ROOT_SCENE_PATH)
    var story_progress_script = load(STORY_PROGRESS_PATH)
    case.assert_true(root_scene is PackedScene, "First-class scene loads")
    case.assert_true(story_progress_script != null, "Story progress loads for first class")
    if not root_scene is PackedScene or story_progress_script == null:
        return

    var root = root_scene.instantiate()
    root._ready()
    case.assert_true(root.get_node_or_null(NodePath("EnvironmentBackground")) is TextureRect, "First class has a non-interactive environment layer")
    case.assert_true(root.get_node_or_null(NodePath("LessonPanel/Lesson/ContinueToPracticumButton")) is Button, "First class exposes exactly one narrative continuation")
    var writing_panel = root.get_node_or_null(NodePath("LessonPanel/Lesson/GlyphWritingPanel"))
    case.assert_true(writing_panel != null and writing_panel.has_signal("glyph_accepted"), "First class uses direct glyph writing and acceptance before continuation")
    case.assert_equal(&"FIRST_CLASS_PROGRESS_REQUIRED", root.continue_to_first_practicum().get("status", &""), "First-class control rejects any absent or wrong story beat")

    var progress = story_progress_script.create_new()
    progress.advance_from_admission()
    root.configure(progress)
    var continue_button := root.get_node_or_null(NodePath("LessonPanel/Lesson/ContinueToPracticumButton")) as Button
    case.assert_true(continue_button != null and continue_button.disabled, "First-class continuation remains locked before a glyph is accepted")
    case.assert_equal(&"FIRST_CLASS_GLYPH_ACCEPTANCE_REQUIRED", root.continue_to_first_practicum().get("status", &""), "First-class continuation cannot bypass direct glyph acceptance")
    if writing_panel != null:
        writing_panel.glyph_accepted.emit(&"HEAT")
    case.assert_true(continue_button != null and not continue_button.disabled, "Accepted lesson glyph unlocks the narrative continuation")
    var continuation: Dictionary = root.continue_to_first_practicum()
    case.assert_equal(&"FIRST_EVENT_ROUTE", continuation.get("status", &""), "Accepted first-class glyph hands the player to the greenhouse practicum")
    case.assert_equal(&"FIRST_EVENT", progress.current_beat(), "Accepted first-class continuation advances exactly one narrative beat")

    var handoff_progress = story_progress_script.create_new()
    handoff_progress.advance_from_admission()
    root.configure(handoff_progress)
    var handoff_owner := Node.new()
    if writing_panel != null:
        writing_panel.glyph_accepted.emit(&"PROTECT")
    var practicum_handoff: Dictionary = root.handoff_first_practicum(handoff_owner)
    case.assert_equal(&"FIRST_EVENT_HANDOFF_READY", practicum_handoff.get("status", &""), "First-class control stages the concrete scene-transition handoff")
    var practicum_progress = story_progress_script.consume_first_event_handoff(handoff_owner)
    case.assert_true(practicum_progress != null and practicum_progress.current_beat() == &"FIRST_EVENT", "First-class handoff transfers the valid first-practicum progress object")
    handoff_owner.free()

    root.configure(story_progress_script.create_new())
    var owner := Node.new()
    var failed_handoff: Dictionary = root.handoff_first_practicum(owner)
    case.assert_equal(&"FIRST_CLASS_PROGRESS_REQUIRED", failed_handoff.get("status", &""), "Wrong beat cannot stage the practicum handoff")
    owner.free()
    root.free()

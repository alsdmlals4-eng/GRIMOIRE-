class_name FirstClassRoot
extends Control

const StoryProgress = preload("res://src/core/story/story_progress.gd")
const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")
const LESSON_GLYPH_IDS: Array[StringName] = [&"HEAT", &"PROTECT"]

signal first_practicum_route_requested(progress, route_path: String)

var _progress = null
var _lesson_glyph_accepted := false


func _ready() -> void:
    theme = ThemeFactory.create_theme()
    if _progress == null and is_inside_tree() and get_tree() != null:
        configure(StoryProgress.consume_first_class_handoff(get_tree().root))
    _connect_controls()


func configure(progress) -> void:
    _progress = progress if _is_first_class_progress(progress) else null
    _lesson_glyph_accepted = false
    _render_lesson_state()


func continue_to_first_practicum() -> Dictionary:
    if not _is_first_class_progress(_progress):
        return {"status": &"FIRST_CLASS_PROGRESS_REQUIRED"}
    if not _lesson_glyph_accepted:
        return {"status": &"FIRST_CLASS_GLYPH_ACCEPTANCE_REQUIRED"}
    return _progress.advance_from_class()


func handoff_first_practicum(handoff_owner: Node) -> Dictionary:
    var continuation := continue_to_first_practicum()
    if StringName(continuation.get("status", &"")) != &"FIRST_EVENT_ROUTE":
        return continuation
    return StoryProgress.stage_first_event_handoff(continuation.get("progress", null), handoff_owner)


func _connect_controls() -> void:
    var writing_panel := get_node_or_null(NodePath("LessonPanel/Lesson/GlyphWritingPanel"))
    if writing_panel != null:
        if writing_panel.has_method("configure_context_hint"):
            writing_panel.configure_context_hint("첫 수업의 글자를 허공에 새기세요. 인식 후보를 고른 뒤, 글자로 사용할 때만 온실 실습이 열립니다.")
        if writing_panel.has_method("configure_allowed_glyphs"):
            writing_panel.configure_allowed_glyphs(LESSON_GLYPH_IDS)
        if writing_panel.has_signal("glyph_accepted") and not writing_panel.glyph_accepted.is_connected(_on_lesson_glyph_accepted):
            writing_panel.glyph_accepted.connect(_on_lesson_glyph_accepted)
    var button := get_node_or_null(NodePath("LessonPanel/Lesson/ContinueToPracticumButton")) as Button
    if button != null and not button.pressed.is_connected(_on_continue_to_practicum_pressed):
        button.pressed.connect(_on_continue_to_practicum_pressed)
    _render_lesson_state()


func _on_lesson_glyph_accepted(glyph_id: StringName) -> void:
    if not LESSON_GLYPH_IDS.has(glyph_id):
        return
    _lesson_glyph_accepted = true
    _render_lesson_state()


func _render_lesson_state() -> void:
    var button := get_node_or_null(NodePath("LessonPanel/Lesson/ContinueToPracticumButton")) as Button
    if button != null:
        button.disabled = not _is_first_class_progress(_progress) or not _lesson_glyph_accepted


func _on_continue_to_practicum_pressed() -> void:
    var handoff_owner: Node = get_tree().root if get_tree() != null else null
    var continuation := handoff_first_practicum(handoff_owner)
    if StringName(continuation.get("status", &"")) != &"FIRST_EVENT_HANDOFF_READY":
        return
    var route_path := String(continuation.get("route_path", ""))
    first_practicum_route_requested.emit(_progress, route_path)
    if ResourceLoader.exists(route_path) and get_tree() != null:
        get_tree().change_scene_to_file(route_path)


func _is_first_class_progress(progress) -> bool:
    return progress != null and progress.has_method("current_beat") and progress.call("current_beat") == StoryProgress.FIRST_CLASS

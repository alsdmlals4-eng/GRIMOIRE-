class_name AdmissionPrologue
extends Control

const StoryProgress = preload("res://src/core/story/story_progress.gd")
const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")

signal first_event_route_requested(progress, route_path: String)

var _progress = null


func _ready() -> void:
	theme = ThemeFactory.create_theme()
	if _progress == null:
		_progress = StoryProgress.create_new()
	var continue_button := get_node_or_null(NodePath("ContinueNarrativeButton")) as Button
	if continue_button != null and not continue_button.pressed.is_connected(_on_continue_narrative_pressed):
		continue_button.pressed.connect(_on_continue_narrative_pressed)


func configure(progress) -> void:
	_progress = progress if _is_admission_progress(progress) else StoryProgress.create_new()


func continue_narrative() -> Dictionary:
	if not _is_admission_progress(_progress):
		return {"status": &"ADMISSION_PROGRESS_REQUIRED"}
	return _progress.advance_from_admission()


func _on_continue_narrative_pressed() -> void:
	var continuation := continue_narrative()
	if StringName(continuation.get("status", &"")) != &"FIRST_EVENT_ROUTE":
		return
	var route_path := String(continuation.get("route_path", ""))
	first_event_route_requested.emit(_progress, route_path)
	if ResourceLoader.exists(route_path) and get_tree() != null:
		get_tree().change_scene_to_file(route_path)


func _is_admission_progress(progress) -> bool:
	return progress != null and progress.has_method("current_beat") and progress.call("current_beat") == StoryProgress.ADMISSION_PROLOGUE

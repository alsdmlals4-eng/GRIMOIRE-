class_name StoryFrontDoor
extends Control

const StoryProgress = preload("res://src/core/story/story_progress.gd")
const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")

signal route_requested(progress, route_path: String)
signal settings_requested

var _resume_progress = null

@onready var _resume_button := get_node_or_null(NodePath("ResumeRecordButton")) as Button


func _ready() -> void:
	theme = ThemeFactory.create_theme()
	configure(_resume_progress)
	_connect_actions()


func configure(progress) -> void:
	_resume_progress = progress if _is_valid_progress(progress) else null
	var resume_button := _resume_button
	if resume_button == null:
		resume_button = get_node_or_null(NodePath("ResumeRecordButton")) as Button
	if resume_button != null:
		resume_button.visible = _resume_progress != null


func visible_action_ids() -> Array[StringName]:
	var actions: Array[StringName] = [&"NEW_RECORD"]
	if _resume_progress != null:
		actions.append(&"RESUME_RECORD")
	actions.append(&"SETTINGS")
	return actions


func start_new_record() -> Dictionary:
	var progress = StoryProgress.create_new()
	return {
		"status": &"NEW_RECORD_READY",
		"progress": progress,
		"route_path": progress.next_scene_path(),
	}


func resume_record() -> Dictionary:
	if _resume_progress == null:
		return {"status": &"VALID_RECORD_REQUIRED"}
	return {
		"status": &"RESUME_RECORD_READY",
		"progress": _resume_progress,
		"route_path": _resume_progress.next_scene_path(),
	}


func request_settings() -> Dictionary:
	settings_requested.emit()
	return {"status": &"SETTINGS_REQUESTED"}


func _connect_actions() -> void:
	_connect_button(&"NewRecordButton", _on_new_record_pressed)
	_connect_button(&"ResumeRecordButton", _on_resume_record_pressed)
	_connect_button(&"SettingsButton", _on_settings_pressed)


func _connect_button(node_name: StringName, callback: Callable) -> void:
	var button := get_node_or_null(NodePath(node_name)) as Button
	if button != null and not button.pressed.is_connected(callback):
		button.pressed.connect(callback)


func _on_new_record_pressed() -> void:
	_request_route(start_new_record())


func _on_resume_record_pressed() -> void:
	_request_route(resume_record())


func _on_settings_pressed() -> void:
	request_settings()


func _request_route(result: Dictionary) -> void:
	var progress = result.get("progress", null)
	var route_path := String(result.get("route_path", ""))
	if not _is_valid_progress(progress) or route_path.is_empty():
		return
	route_requested.emit(progress, route_path)
	if ResourceLoader.exists(route_path) and get_tree() != null:
		get_tree().change_scene_to_file(route_path)


func _is_valid_progress(progress) -> bool:
	return progress != null and progress.has_method("is_valid") and bool(progress.call("is_valid"))

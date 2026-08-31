class_name StoryFrontDoor
extends Control

const StoryProgress = preload("res://src/core/story/story_progress.gd")
const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")
const CARD_ARCHIVE_SCENE = preload("res://src/ui/cards/card_archive_screen.tscn")

signal route_requested(progress, route_path: String)
signal settings_requested
signal archive_requested
signal quit_confirmation_requested
signal quit_confirmed

var _resume_progress = null

@onready var _content := get_node_or_null(NodePath("Content")) as Control
@onready var _resume_button := get_node_or_null(NodePath("Content/MenuActions/ResumeRecordButton")) as Button
@onready var _resume_hint := get_node_or_null(NodePath("Content/MenuActions/ResumeHint")) as Label
@onready var _quit_confirmation := get_node_or_null(NodePath("QuitConfirmationDialog")) as ConfirmationDialog


func _ready() -> void:
	theme = ThemeFactory.create_theme()
	configure(_resume_progress)
	_connect_actions()


func configure(progress) -> void:
	_resume_progress = progress if _is_valid_progress(progress) else null
	var resume_button := _resume_button
	if resume_button == null:
		resume_button = get_node_or_null(NodePath("Content/MenuActions/ResumeRecordButton")) as Button
	if resume_button != null:
		resume_button.visible = true
		resume_button.disabled = _resume_progress == null
	var resume_hint := _resume_hint
	if resume_hint == null:
		resume_hint = get_node_or_null(NodePath("Content/MenuActions/ResumeHint")) as Label
	if resume_hint != null:
		resume_hint.visible = _resume_progress == null


func visible_action_ids() -> Array[StringName]:
	var actions: Array[StringName] = [&"NEW_RECORD"]
	if _resume_progress != null:
		actions.append(&"RESUME_RECORD")
	actions.append(&"ARCHIVE")
	actions.append(&"SETTINGS")
	actions.append(&"QUIT")
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


func open_archive() -> Dictionary:
	archive_requested.emit()
	return {"status": &"ARCHIVE_READY"}


func request_quit_confirmation() -> Dictionary:
	quit_confirmation_requested.emit()
	return {"status": &"QUIT_CONFIRMATION_REQUIRED"}


func cancel_quit() -> Dictionary:
	return {"status": &"QUIT_CANCELLED"}


func confirm_quit() -> Dictionary:
	quit_confirmed.emit()
	return {"status": &"QUIT_CONFIRMED"}


func _connect_actions() -> void:
	_connect_button(&"Content/MenuActions/NewRecordButton", _on_new_record_pressed)
	_connect_button(&"Content/MenuActions/ResumeRecordButton", _on_resume_record_pressed)
	_connect_button(&"Content/MenuActions/ArchiveButton", _on_archive_pressed)
	_connect_button(&"Content/MenuActions/SettingsButton", _on_settings_pressed)
	_connect_button(&"Content/MenuActions/QuitButton", _on_quit_pressed)
	var quit_confirmation := _quit_confirmation
	if quit_confirmation == null:
		quit_confirmation = get_node_or_null(NodePath("QuitConfirmationDialog")) as ConfirmationDialog
	if quit_confirmation != null:
		if not quit_confirmation.confirmed.is_connected(_on_quit_confirmed):
			quit_confirmation.confirmed.connect(_on_quit_confirmed)
		var cancel_button := quit_confirmation.get_cancel_button()
		if cancel_button != null and not cancel_button.pressed.is_connected(_on_quit_cancelled):
			cancel_button.pressed.connect(_on_quit_cancelled)


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


func _on_archive_pressed() -> void:
	open_archive()
	_show_archive()


func _on_quit_pressed() -> void:
	request_quit_confirmation()
	var quit_confirmation := _quit_confirmation
	if quit_confirmation == null:
		quit_confirmation = get_node_or_null(NodePath("QuitConfirmationDialog")) as ConfirmationDialog
	if quit_confirmation != null:
		quit_confirmation.popup_centered_clamped(Vector2i(460, 200))


func _on_quit_confirmed() -> void:
	var result := confirm_quit()
	if result.get("status", &"") == &"QUIT_CONFIRMED" and get_tree() != null:
		get_tree().quit()


func _on_quit_cancelled() -> void:
	cancel_quit()


func _show_archive() -> void:
	if get_node_or_null(NodePath("ArchiveOverlay")) != null:
		return
	var archive = CARD_ARCHIVE_SCENE.instantiate()
	archive.name = "ArchiveOverlay"
	add_child(archive)
	if archive.has_method("configure_story_cards"):
		archive.configure_story_cards(_resume_progress, [])
	if archive.has_signal("return_requested"):
		archive.return_requested.connect(_on_archive_return_requested)
	if _content != null:
		_content.visible = false


func _on_archive_return_requested() -> void:
	var archive := get_node_or_null(NodePath("ArchiveOverlay"))
	if archive != null:
		archive.queue_free()
	if _content != null:
		_content.visible = true


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

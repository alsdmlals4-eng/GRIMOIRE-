class_name StoryProgress
extends RefCounted

const ADMISSION_PROLOGUE := &"ADMISSION_PROLOGUE"
const FIRST_EVENT := &"FIRST_EVENT"
const ADMISSION_PROLOGUE_SCENE := "res://src/ui/story/admission_prologue.tscn"
const FIRST_EVENT_SCENE := "res://src/ui/story/story_event_root.tscn"

var _current_beat: StringName = ADMISSION_PROLOGUE


static func create_new():
	return new()


func current_beat() -> StringName:
	return _current_beat


func is_valid() -> bool:
	return _current_beat == ADMISSION_PROLOGUE or _current_beat == FIRST_EVENT


func next_scene_path() -> String:
	if _current_beat == FIRST_EVENT:
		return FIRST_EVENT_SCENE
	return ADMISSION_PROLOGUE_SCENE


func available_front_door_actions() -> Array[StringName]:
	return [&"NEW_RECORD", &"RESUME_RECORD", &"SETTINGS"]


func advance_from_admission() -> Dictionary:
	if _current_beat != ADMISSION_PROLOGUE:
		return {
			"status": &"ADMISSION_CONTINUATION_UNAVAILABLE",
			"route_path": next_scene_path(),
		}
	_current_beat = FIRST_EVENT
	return {
		"status": &"FIRST_EVENT_ROUTE",
		"route_path": next_scene_path(),
	}

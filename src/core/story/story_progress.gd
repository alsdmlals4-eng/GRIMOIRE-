class_name StoryProgress
extends RefCounted

const ADMISSION_PROLOGUE := &"ADMISSION_PROLOGUE"
const FIRST_EVENT := &"FIRST_EVENT"
const ADMISSION_PROLOGUE_SCENE := "res://src/ui/story/admission_prologue.tscn"
const FIRST_EVENT_SCENE := "res://src/ui/story/story_event_root.tscn"
const FIRST_EVENT_HANDOFF_META := &"_grimoire_first_event_progress"
const FIRST_EVENT_CARD_UNLOCKS := {
    &"ARCHIVE_FROSTBLOOM_WIZARD": FIRST_EVENT,
}

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


func card_unlocks() -> Dictionary:
	if _current_beat != FIRST_EVENT:
		return {}
	return FIRST_EVENT_CARD_UNLOCKS.duplicate(true)


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
		"progress": self,
	}


static func stage_first_event_handoff(progress, owner: Node) -> Dictionary:
	if owner == null or progress == null or not progress.has_method("current_beat") or progress.call("current_beat") != FIRST_EVENT:
		return {"status": &"FIRST_EVENT_PROGRESS_REQUIRED"}
	owner.set_meta(FIRST_EVENT_HANDOFF_META, progress)
	return {
		"status": &"FIRST_EVENT_HANDOFF_READY",
		"progress": progress,
		"route_path": FIRST_EVENT_SCENE,
	}


static func consume_first_event_handoff(owner: Node):
	if owner == null or not owner.has_meta(FIRST_EVENT_HANDOFF_META):
		return null
	var progress = owner.get_meta(FIRST_EVENT_HANDOFF_META)
	owner.remove_meta(FIRST_EVENT_HANDOFF_META)
	if progress == null or not progress.has_method("current_beat") or progress.call("current_beat") != FIRST_EVENT:
		return null
	return progress

class_name StoryProgress
extends RefCounted

# The player never chooses these beats from the front door. They describe the
# single authored route for the first academy session.
const ADMISSION_PROLOGUE := &"ADMISSION_PROLOGUE"
const FIRST_CLASS := &"FIRST_CLASS"
const FIRST_EVENT := &"FIRST_EVENT"
const DUEL_PRACTICUM := &"DUEL_PRACTICUM"
const FESTIVAL_CANOPY := &"FESTIVAL_CANOPY"

const ADMISSION_PROLOGUE_SCENE := "res://src/ui/story/admission_prologue.tscn"
const FIRST_CLASS_SCENE := "res://src/ui/story/first_class_root.tscn"
const FIRST_EVENT_SCENE := "res://src/ui/story/story_event_root.tscn"
const DUEL_PRACTICUM_SCENE := "res://src/ui/story/duel_practicum_root.tscn"
const FESTIVAL_CANOPY_SCENE := "res://src/ui/story/festival_canopy_root.tscn"

const FIRST_CLASS_HANDOFF_META := &"_grimoire_first_class_progress"
const FIRST_EVENT_HANDOFF_META := &"_grimoire_first_event_progress"
const DUEL_PRACTICUM_HANDOFF_META := &"_grimoire_duel_practicum_progress"
const FESTIVAL_CANOPY_HANDOFF_META := &"_grimoire_festival_canopy_progress"

const FIRST_EVENT_CARD_UNLOCKS := {
    &"ARCHIVE_FROSTBLOOM_WIZARD": FIRST_EVENT,
}

var _current_beat: StringName = ADMISSION_PROLOGUE


static func create_new():
    return new()


func current_beat() -> StringName:
    return _current_beat


func is_valid() -> bool:
    return _current_beat in [
        ADMISSION_PROLOGUE,
        FIRST_CLASS,
        FIRST_EVENT,
        DUEL_PRACTICUM,
        FESTIVAL_CANOPY,
    ]


func next_scene_path() -> String:
    match _current_beat:
        FIRST_CLASS:
            return FIRST_CLASS_SCENE
        FIRST_EVENT:
            return FIRST_EVENT_SCENE
        DUEL_PRACTICUM:
            return DUEL_PRACTICUM_SCENE
        FESTIVAL_CANOPY:
            return FESTIVAL_CANOPY_SCENE
        _:
            return ADMISSION_PROLOGUE_SCENE


func available_front_door_actions() -> Array[StringName]:
    return [&"NEW_RECORD", &"RESUME_RECORD", &"ARCHIVE", &"SETTINGS", &"QUIT"]


func card_unlocks() -> Dictionary:
    if _current_beat not in [FIRST_EVENT, DUEL_PRACTICUM, FESTIVAL_CANOPY]:
        return {}
    return FIRST_EVENT_CARD_UNLOCKS.duplicate(true)


func advance_from_admission() -> Dictionary:
    return _advance(ADMISSION_PROLOGUE, FIRST_CLASS, &"FIRST_CLASS_ROUTE")


func advance_from_class() -> Dictionary:
    return _advance(FIRST_CLASS, FIRST_EVENT, &"FIRST_EVENT_ROUTE")


func advance_from_first_practicum() -> Dictionary:
    return _advance(FIRST_EVENT, DUEL_PRACTICUM, &"DUEL_PRACTICUM_ROUTE")


func advance_from_duel_practicum() -> Dictionary:
    return _advance(DUEL_PRACTICUM, FESTIVAL_CANOPY, &"FESTIVAL_CANOPY_ROUTE")


func _advance(required_beat: StringName, next_beat: StringName, route_status: StringName) -> Dictionary:
    if _current_beat != required_beat:
        return {
            "status": StringName("%s_CONTINUATION_UNAVAILABLE" % required_beat),
            "route_path": next_scene_path(),
        }
    _current_beat = next_beat
    return {
        "status": route_status,
        "route_path": next_scene_path(),
        "progress": self,
    }


static func stage_first_class_handoff(progress, owner: Node) -> Dictionary:
    return _stage_handoff(progress, owner, FIRST_CLASS, FIRST_CLASS_HANDOFF_META, &"FIRST_CLASS_HANDOFF_READY", FIRST_CLASS_SCENE)


static func consume_first_class_handoff(owner: Node):
    return _consume_handoff(owner, FIRST_CLASS, FIRST_CLASS_HANDOFF_META)


static func stage_first_event_handoff(progress, owner: Node) -> Dictionary:
    return _stage_handoff(progress, owner, FIRST_EVENT, FIRST_EVENT_HANDOFF_META, &"FIRST_EVENT_HANDOFF_READY", FIRST_EVENT_SCENE)


static func consume_first_event_handoff(owner: Node):
    return _consume_handoff(owner, FIRST_EVENT, FIRST_EVENT_HANDOFF_META)


static func stage_duel_practicum_handoff(progress, owner: Node) -> Dictionary:
    return _stage_handoff(progress, owner, DUEL_PRACTICUM, DUEL_PRACTICUM_HANDOFF_META, &"DUEL_PRACTICUM_HANDOFF_READY", DUEL_PRACTICUM_SCENE)


static func consume_duel_practicum_handoff(owner: Node):
    return _consume_handoff(owner, DUEL_PRACTICUM, DUEL_PRACTICUM_HANDOFF_META)


static func stage_festival_canopy_handoff(progress, owner: Node) -> Dictionary:
    return _stage_handoff(progress, owner, FESTIVAL_CANOPY, FESTIVAL_CANOPY_HANDOFF_META, &"FESTIVAL_CANOPY_HANDOFF_READY", FESTIVAL_CANOPY_SCENE)


static func consume_festival_canopy_handoff(owner: Node):
    return _consume_handoff(owner, FESTIVAL_CANOPY, FESTIVAL_CANOPY_HANDOFF_META)


static func _stage_handoff(progress, owner: Node, expected_beat: StringName, handoff_meta: StringName, ready_status: StringName, route_path: String) -> Dictionary:
    if owner == null or progress == null or not progress.has_method("current_beat") or progress.call("current_beat") != expected_beat:
        return {"status": StringName("%s_PROGRESS_REQUIRED" % expected_beat)}
    owner.set_meta(handoff_meta, progress)
    return {
        "status": ready_status,
        "progress": progress,
        "route_path": route_path,
    }


static func _consume_handoff(owner: Node, expected_beat: StringName, handoff_meta: StringName):
    if owner == null or not owner.has_meta(handoff_meta):
        return null
    var progress = owner.get_meta(handoff_meta)
    owner.remove_meta(handoff_meta)
    if progress == null or not progress.has_method("current_beat") or progress.call("current_beat") != expected_beat:
        return null
    return progress

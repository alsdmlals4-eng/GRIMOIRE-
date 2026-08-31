class_name EventClockState
extends RefCounted

var goal_segments := 0
var threat_segments := 0
var resolved_action_ids: Dictionary = {}
var visible_scene_state: Dictionary = {}


func has_resolved(action_id: StringName) -> bool:
    return resolved_action_ids.has(action_id)


func mark_resolved(action_id: StringName) -> void:
    resolved_action_ids[action_id] = true


func duplicate_state():
    var script = load("res://src/core/events/event_clock_state.gd")
    if script == null or not script.can_instantiate():
        return null
    var value = script.new()
    value.goal_segments = goal_segments
    value.threat_segments = threat_segments
    value.resolved_action_ids = resolved_action_ids.duplicate(true)
    value.visible_scene_state = visible_scene_state.duplicate(true)
    return value


func to_snapshot() -> Dictionary:
    var action_ids: Array[StringName] = []
    for action_id in resolved_action_ids:
        action_ids.append(StringName(action_id))
    action_ids.sort()
    return {
        "goal_segments": goal_segments,
        "threat_segments": threat_segments,
        "resolved_action_ids": action_ids,
        "visible_scene_state": visible_scene_state.duplicate(true),
    }

class_name EventClockResolver
extends RefCounted

const EventClockState = preload("res://src/core/events/event_clock_state.gd")

const NON_CLOCK_ACTION_KINDS: Array[StringName] = [
    &"MENU_OPEN",
    &"DIALOGUE_READ",
    &"UI_SIGNAL",
    &"WALL_CLOCK",
    &"ELAPSED_TIME",
    &"PAUSED",
]

var definition


func _init(next_definition = null) -> void:
    definition = next_definition


func resolve(state, action: Dictionary) -> Dictionary:
    var current = _state_copy(state)
    if current == null:
        return _resolution(&"INVALID_STATE", &"", 0, 0, [], null)

    if _is_non_clock_action(action):
        return _resolution(&"NO_CLOCK_CHANGE", StringName(action.get("action_id", &"")), 0, 0, [&"NO_CLOCK_CHANGE"], current)

    var action_id := StringName(action.get("action_id", &""))
    if action_id.is_empty():
        return _resolution(&"ACTION_ID_REQUIRED", action_id, 0, 0, [&"ACTION_ID_REQUIRED"], current)
    if current.has_resolved(action_id):
        return _resolution(&"ALREADY_RESOLVED", action_id, 0, 0, [&"ACTION_ALREADY_RESOLVED"], current)
    if definition == null:
        return _resolution(&"NO_CLOCK_CHANGE", action_id, 0, 0, [&"NO_DECLARED_CLOCK_CHANGE"], current)

    var change: Dictionary = definition.declared_change_for(action)
    if change.is_empty():
        return _resolution(&"NO_CLOCK_CHANGE", action_id, 0, 0, [&"NO_DECLARED_CLOCK_CHANGE"], current)

    var goal_delta := maxi(0, int(change.get("goal_delta", 0)))
    var threat_delta := int(change.get("threat_delta", 0))
    current.goal_segments = _shift(current.goal_segments, goal_delta, int(definition.goal_segment_count))
    current.threat_segments = _shift(current.threat_segments, threat_delta, int(definition.threat_segment_count))
    current.mark_resolved(action_id)
    current.visible_scene_state = {
        "last_action_id": action_id,
        "visible_consequence_tags": _consequence_tags(change.get("visible_consequence_tags", [])),
    }
    return _resolution(&"RESOLVED", action_id, goal_delta, threat_delta, _consequence_tags(change.get("visible_consequence_tags", [])), current)


func _state_copy(state):
    if state is EventClockState:
        return state.duplicate_state()
    return null


func _is_non_clock_action(action: Dictionary) -> bool:
    return NON_CLOCK_ACTION_KINDS.has(StringName(action.get("kind", &"")))


func _shift(current_segments: int, delta: int, segment_count: int) -> int:
    var shifted := maxi(0, current_segments + delta)
    if segment_count <= 0:
        return shifted
    return mini(shifted, segment_count)


func _consequence_tags(value: Variant) -> Array[StringName]:
    if typeof(value) != TYPE_ARRAY:
        return []
    var tags: Array[StringName] = []
    for item in value:
        var tag := StringName(item)
        if not tag.is_empty() and not tags.has(tag):
            tags.append(tag)
    return tags


func _resolution(status: StringName, action_id: StringName, goal_delta: int, threat_delta: int, visible_consequence_tags: Array[StringName], state) -> Dictionary:
    return {
        "status": status,
        "action_id": action_id,
        "goal_delta": goal_delta,
        "threat_delta": threat_delta,
        "visible_consequence_tags": visible_consequence_tags,
        "state": state,
        "state_snapshot": {} if state == null else state.to_snapshot(),
    }

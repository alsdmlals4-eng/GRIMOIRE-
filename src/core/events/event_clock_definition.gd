@tool
class_name EventClockDefinition
extends Resource

@export var event_id: StringName = &""
@export var goal_clock_id: StringName = &""
@export var threat_clock_id: StringName = &""
@export var goal_segment_count := 0
@export var threat_segment_count := 0
@export var action_resolutions: Array = []


func declared_change_for(action: Dictionary) -> Dictionary:
    var target_id := StringName(action.get("target_id", &""))
    var action_method_tags := _string_name_array(action.get("method_tags", []))
    for resolution in action_resolutions:
        if StringName(resolution.get("target_id", &"")) != target_id:
            continue
        var required_method_tags := _string_name_array(resolution.get("method_tags", []))
        if _contains_all(action_method_tags, required_method_tags):
            return resolution.duplicate(true)
    return {}


func _contains_all(actual: Array[StringName], required: Array[StringName]) -> bool:
    for tag in required:
        if not actual.has(tag):
            return false
    return true


func _string_name_array(value: Variant) -> Array[StringName]:
    if typeof(value) != TYPE_ARRAY:
        return []
    var result: Array[StringName] = []
    for item in value:
        var tag := StringName(item)
        if not tag.is_empty() and not result.has(tag):
            result.append(tag)
    return result

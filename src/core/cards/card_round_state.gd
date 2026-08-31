class_name CardRoundState
extends RefCounted

var pending_prepared_spell_id: StringName = &""
var resolved_action_ids: Dictionary = {}
var _resolved_prepared_spell_ids: Dictionary = {}


func _init(next_prepared_spell_id: StringName = &"") -> void:
    pending_prepared_spell_id = next_prepared_spell_id


func resolve_round_end(action_id: StringName) -> Dictionary:
    if action_id.is_empty():
        return {"status": &"ACTION_ID_REQUIRED"}
    if resolved_action_ids.has(action_id):
        return {
            "status": &"ALREADY_RESOLVED",
            "action_id": action_id,
            "prepared_spell_id": _resolved_prepared_spell_ids.get(action_id, &""),
        }

    var resolved_prepared_spell_id := pending_prepared_spell_id
    pending_prepared_spell_id = &""
    resolved_action_ids[action_id] = true
    _resolved_prepared_spell_ids[action_id] = resolved_prepared_spell_id
    return {
        "status": &"ROUND_END_RESOLVED",
        "action_id": action_id,
        "prepared_spell_id": resolved_prepared_spell_id,
    }

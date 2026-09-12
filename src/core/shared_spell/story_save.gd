extends "res://src/core/shared_spell/event_save.gd"
## Dedicated story directory only; inherits two-slot corruption recovery.
const Flow = preload("res://src/core/shared_spell/story_flow.gd")

func _valid_payload(payload: Dictionary) -> bool:
    return payload.get("story") is Dictionary and Flow.new().valid(payload.story)

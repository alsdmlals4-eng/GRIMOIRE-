# Frostbloom W6의 관찰·미확인·대상 선택 계약을 Resource로 제공한다.
class_name FrostbloomW6DecisionContext
extends Resource

const TargetDefinition = preload("res://src/core/content/frostbloom_w6_target_definition.gd")
const REQUIRED_TARGET_IDS := [&"FROST_SEEDLINGS", &"GREENHOUSE_STRUCTURE"]

@export_multiline var lens := ""
@export var known_observations: PackedStringArray = []
@export var unknown_categories: PackedStringArray = []
@export var targets: Array[Resource] = []


func validate() -> Dictionary:
    if lens.strip_edges().is_empty():
        return {"status": &"INVALID_W6_CONTEXT", "reason": &"LENS_REQUIRED"}
    if known_observations.size() != 2 or unknown_categories.size() != 2:
        return {"status": &"INVALID_W6_CONTEXT", "reason": &"BOUNDED_EVIDENCE_REQUIRED"}
    if targets.size() != 2:
        return {"status": &"INVALID_W6_CONTEXT", "reason": &"TWO_TARGETS_REQUIRED"}
    var seen_ids: Dictionary = {}
    for target in targets:
        if target == null or not (target is TargetDefinition):
            return {"status": &"INVALID_W6_CONTEXT", "reason": &"TARGET_REQUIRED"}
        var target_validation: Dictionary = Dictionary(target.call("validate"))
        if StringName(target_validation.get("status", &"")) != &"OK":
            return {"status": &"INVALID_W6_CONTEXT", "reason": target_validation.get("reason", &"TARGET_INVALID")}
        var target_id := StringName(target.get("id"))
        if seen_ids.has(target_id):
            return {"status": &"INVALID_W6_CONTEXT", "reason": &"DUPLICATE_TARGET"}
        seen_ids[target_id] = true
    for required_target_id in REQUIRED_TARGET_IDS:
        if not seen_ids.has(required_target_id):
            return {"status": &"INVALID_W6_CONTEXT", "reason": &"REQUIRED_TARGET_ID_MISSING"}
    return {"status": &"OK"}


func target_choices() -> Array:
    if StringName(validate().get("status", &"")) != &"OK":
        return []
    var choices: Array = []
    for target in targets:
        choices.append(Dictionary(target.call("to_choice")))
    return choices


func target_choice(target_id: StringName) -> Dictionary:
    if StringName(validate().get("status", &"")) != &"OK":
        return {}
    for target in targets:
        if StringName(target.get("id")) == target_id:
            return Dictionary(target.call("to_choice"))
    return {}


func summary() -> Dictionary:
    return {
        "lens": lens,
        "lens_label": lens,
        "known_observations": known_observations.duplicate(),
        "unknown_categories": unknown_categories.duplicate(),
        "target_count": targets.size(),
    }
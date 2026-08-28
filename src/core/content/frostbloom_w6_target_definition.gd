# Frostbloom W6의 선택 대상과 결과 영수증 payload를 정의한다.
@tool
class_name FrostbloomW6TargetDefinition
extends Resource

@export var id: StringName = &""
@export_multiline var label := ""
@export_multiline var hint := ""
@export_multiline var protected_value := ""
@export var target_keyword: StringName = &""
@export var difficulty := 0
@export var mana_cost := 0
@export var effect: StringName = &""
@export_multiline var actual := ""
@export_multiline var forgone_or_remaining := ""
@export_multiline var unknown := ""


func validate() -> Dictionary:
    if id.is_empty() or target_keyword.is_empty():
        return {"status": &"INVALID_W6_TARGET", "reason": &"ID_REQUIRED"}
    if label.strip_edges().is_empty() or hint.strip_edges().is_empty() or protected_value.strip_edges().is_empty():
        return {"status": &"INVALID_W6_TARGET", "reason": &"PLAYER_COPY_REQUIRED"}
    if difficulty <= 0 or mana_cost <= 0:
        return {"status": &"INVALID_W6_TARGET", "reason": &"COST_REQUIRED"}
    if effect.is_empty() or actual.strip_edges().is_empty() or forgone_or_remaining.strip_edges().is_empty() or unknown.strip_edges().is_empty():
        return {"status": &"INVALID_W6_TARGET", "reason": &"RECEIPT_REQUIRED"}
    return {"status": &"OK"}


func to_choice() -> Dictionary:
    return {
        "id": id,
        "label": label,
        "hint": hint,
        "protected_value": protected_value,
        "known_improvement": actual,
        "forgone_or_remaining": forgone_or_remaining,
        "unknown": unknown,
        "target_keyword": target_keyword,
        "target": {"difficulty": difficulty, "mana_cost": mana_cost, "target_valid": true},
        "payload": {
            "effect": effect,
            "receipt": {
                "actual": actual,
                "forgone_or_remaining": forgone_or_remaining,
                "unknown": unknown,
            },
        },
    }
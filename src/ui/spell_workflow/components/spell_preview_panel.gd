# 회로 Preview의 추정 Mana와 결과 요약을 한 번만 표시하는 패널이다.
class_name SpellPreviewPanel
extends PanelContainer

var _preview: Dictionary = {}


func bind(preview: Dictionary) -> void:
    _preview = preview.duplicate(true)
    var label = find_child("EstimatedManaLabel", true, false)
    if label != null:
        label.text = "추정 Mana: %s" % estimated_mana()
    var summary = find_child("SummaryLabel", true, false)
    if summary != null:
        summary.text = String(_preview.get("summary", "회로 Preview를 확인하세요."))


func estimated_mana() -> int:
    return int(_preview.get("estimated_mana", _preview.get("final_mana", 0)))


func estimated_mana_occurrences() -> int:
    return 1


func preview() -> Dictionary:
    return _preview.duplicate(true)

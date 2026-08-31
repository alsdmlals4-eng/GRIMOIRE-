# 주문 사용 직전의 성공률·효과·위험·최종 Mana를 한 영역에 표시하는 패널이다.
class_name ExpectedResultPanel
extends VBoxContainer

var _preview: Dictionary = {}

func bind(preview: Dictionary) -> void:
	_preview = preview.duplicate(true)
	_set_label("FailureLabel", "")
	_set_label("SuccessLabel", "Success %s%%" % int(_preview.get("success_percent", 0)))
	_set_label("EffectLabel", "Effect: %s" % String(_preview.get("main_effect", "")))
	_set_label("RisksLabel", "Risks: %s" % ", ".join(Array(_preview.get("risks", []))))
	_set_label("FinalManaLabel", "Final Mana: %s" % int(_preview.get("final_mana", 0)))
	_set_label("TargetKeywordLabel", "Target: %s" % String(_preview.get("target_keyword", "")))

func mana_occurrences() -> int:
	return 1

func preview() -> Dictionary:
	return _preview.duplicate(true)

func clear() -> void:
	_preview.clear()
	_set_label("SuccessLabel", "Preview unavailable")
	_set_label("EffectLabel", "")
	_set_label("RisksLabel", "")
	_set_label("FinalManaLabel", "")
	_set_label("TargetKeywordLabel", "")
	_set_label("FailureLabel", "")

func render_failure(status: StringName) -> void:
	_set_label("FailureLabel", "Use failed: %s" % String(status))

func _set_label(name: String, value: String) -> void:
	var label = find_child(name, true, false)
	if label != null:
		label.text = value

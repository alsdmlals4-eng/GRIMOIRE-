# 주문 사용 단계에서 사건 대상 키워드를 명시적으로 선택하는 패널이다.
class_name TargetSelectionPanel
extends VBoxContainer

signal target_selected(keyword: StringName)

var _targets: Array = []
var _selected_keyword: StringName = &""
var _interaction_locked := false

func bind(targets: Array) -> void:
	_targets = targets.duplicate(true)
	_selected_keyword = &""
	_render_targets()

func selected_keyword() -> StringName:
	return _selected_keyword

func set_interactable(interactable: bool) -> void:
	_interaction_locked = not interactable
	var list = find_child("TargetList", true, false)
	if list != null:
		for child in list.get_children():
			if child is BaseButton:
				child.disabled = _interaction_locked


func select_target(keyword: StringName) -> bool:
	if _interaction_locked:
		return false
	for target_variant in _targets:
		var target: Dictionary = Dictionary(target_variant)
		if StringName(target.get("keyword", &"")) == keyword:
			_selected_keyword = keyword
			target_selected.emit(keyword)
			return true
	return false

func _render_targets() -> void:
	var list = find_child("TargetList", true, false)
	if list == null:
		return
	for child in list.get_children():
		child.queue_free()
	for target_variant in _targets:
		var target: Dictionary = Dictionary(target_variant)
		var keyword: StringName = StringName(target.get("keyword", &""))
		var button := Button.new()
		button.text = String(target.get("label", keyword))
		button.custom_minimum_size = Vector2(0, 48)
		button.pressed.connect(select_target.bind(keyword))
		list.add_child(button)

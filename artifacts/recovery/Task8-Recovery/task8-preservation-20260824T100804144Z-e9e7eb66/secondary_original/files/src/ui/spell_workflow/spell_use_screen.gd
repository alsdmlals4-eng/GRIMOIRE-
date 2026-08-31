# 준비 주문과 사건 대상을 명시적으로 선택해 두 단계로 사용 의도를 전달하는 화면이다.
class_name SpellUseScreen
extends Control

signal spell_selected(spell_id: StringName)
signal target_selected(target_keyword: StringName)
signal preview_requested
signal use_requested(use_transaction_id: StringName)
signal cancel_requested

var _prepared_spells: Array = []
var _selected_spell_id: StringName = &""
var _final_preview: Dictionary = {}
var _confirmation_pending := false
var _use_in_flight := false
var _use_transaction_id: StringName = &""

func _ready() -> void:
	_set_confirmation_visible(false)
	_connect_button("PreviewButton", request_preview)
	_connect_button("UseButton", request_use)
	_connect_button("ConfirmUseButton", _confirm_from_ui)
	_connect_button("CancelButton", request_cancel)
	var target_panel = _named("TargetSelectionPanel")
	if target_panel != null and target_panel.has_signal("target_selected") and not target_panel.target_selected.is_connected(_on_target_panel_selected):
		target_panel.target_selected.connect(_on_target_panel_selected)

func render(prepared_spells: Array, targets: Array, _incoming_preview: Dictionary, current_mana: int) -> void:
	_prepared_spells = prepared_spells.duplicate(true)
	_selected_spell_id = &""
	_final_preview.clear()
	_confirmation_pending = false
	_use_in_flight = false
	_use_transaction_id = &""
	_render_spells()
	var result_panel = _named("ExpectedResultPanel")
	if result_panel != null and result_panel.has_method("clear"):
		result_panel.clear()
	var target_panel = _named("TargetSelectionPanel")
	if target_panel != null and target_panel.has_method("bind"):
		target_panel.bind(targets)
		if target_panel.has_method("set_interactable"):
			target_panel.set_interactable(true)
	var mana_label = _named("CurrentManaLabel")
	if mana_label != null:
		mana_label.text = "Current MP: %s" % current_mana
	_set_use_enabled(false)
	_set_confirmation_visible(false)

func selected_spell_id() -> StringName:
	return _selected_spell_id

func has_final_preview() -> bool:
	return not _final_preview.is_empty()

func current_mana_occurrences() -> int:
	return 1

func set_use_transaction_id(use_transaction_id: StringName) -> void:
	_use_transaction_id = use_transaction_id

func request_spell(spell_id: StringName) -> bool:
	if _use_in_flight:
		return false
	for spell_variant in _prepared_spells:
		var spell: Dictionary = Dictionary(spell_variant)
		if StringName(spell.get("spell_id", &"")) == spell_id and StringName(spell.get("status", &"")) == &"READY":
			_selected_spell_id = spell_id
			_invalidate_final_preview()
			spell_selected.emit(spell_id)
			return true
	return false

func request_target(target_keyword: StringName) -> bool:
	if _use_in_flight:
		return false
	var panel = _named("TargetSelectionPanel")
	return panel != null and panel.has_method("select_target") and panel.select_target(target_keyword)

func request_preview() -> bool:
	var panel = _named("TargetSelectionPanel")
	if _use_in_flight or _selected_spell_id.is_empty() or panel == null or not panel.has_method("selected_keyword") or StringName(panel.selected_keyword()).is_empty():
		return false
	preview_requested.emit()
	return true

func render_final_preview(preview: Dictionary) -> void:
	var target_panel = _named("TargetSelectionPanel")
	var selected_target: StringName = &""
	if target_panel != null and target_panel.has_method("selected_keyword"):
		selected_target = StringName(target_panel.selected_keyword())
	if selected_target.is_empty() or StringName(preview.get("target_keyword", &"")) != selected_target:
		return
	_final_preview = preview.duplicate(true)
	_confirmation_pending = false
	_use_in_flight = false
	var panel = _named("ExpectedResultPanel")
	if panel != null and panel.has_method("bind"):
		panel.bind(_final_preview)
	_set_use_enabled(true)

func request_use() -> bool:
	if _final_preview.is_empty() or _confirmation_pending or _use_in_flight:
		return false
	_confirmation_pending = true
	_set_confirmation_visible(true)
	return true

func is_confirmation_pending() -> bool:
	return _confirmation_pending

func confirm_use(use_transaction_id: StringName) -> bool:
	if use_transaction_id.is_empty() or not _confirmation_pending or _use_in_flight:
		return false
	_use_in_flight = true
	_set_use_enabled(false)
	_set_confirmation_visible(false)
	var target_panel = _named("TargetSelectionPanel")
	if target_panel != null and target_panel.has_method("set_interactable"):
		target_panel.set_interactable(false)
	_set_spell_interactable(false)
	use_requested.emit(use_transaction_id)
	return true

func render_use_result(result: Dictionary) -> void:
	_use_in_flight = false
	var panel = _named("ExpectedResultPanel")
	var status: StringName = StringName(result.get("status", &""))
	if status == &"USED":
		_confirmation_pending = false
		_final_preview.clear()
		_set_use_enabled(false)
		_set_confirmation_visible(false)
		return
	if panel != null and panel.has_method("render_failure"):
		panel.render_failure(status)
	_confirmation_pending = false
	_set_confirmation_visible(false)
	_set_use_enabled(not _final_preview.is_empty())
	var target_panel = _named("TargetSelectionPanel")
	if target_panel != null and target_panel.has_method("set_interactable"):
		target_panel.set_interactable(true)
	_set_spell_interactable(true)

func request_cancel() -> void:
	cancel_requested.emit()

func _confirm_from_ui() -> void:
	confirm_use(_use_transaction_id)

func _on_target_panel_selected(target_keyword: StringName) -> void:
	if _use_in_flight:
		return
	_invalidate_final_preview()
	target_selected.emit(target_keyword)

func _invalidate_final_preview() -> void:
	_final_preview.clear()
	var panel = _named("ExpectedResultPanel")
	if panel != null and panel.has_method("clear"):
		panel.clear()
	_confirmation_pending = false
	_set_use_enabled(false)
	_set_confirmation_visible(false)

func _render_spells() -> void:
	var list = _named("PreparedSpellList")
	if list == null:
		return
	for child in list.get_children():
		child.queue_free()
	for spell_variant in _prepared_spells:
		var spell: Dictionary = Dictionary(spell_variant)
		if StringName(spell.get("status", &"")) != &"READY":
			continue
		var button := Button.new()
		button.text = String(spell.get("spell_id", &""))
		button.custom_minimum_size = Vector2(0, 48)
		button.pressed.connect(request_spell.bind(StringName(spell.get("spell_id", &""))))
		list.add_child(button)

func _set_spell_interactable(interactable: bool) -> void:
	var list = _named("PreparedSpellList")
	if list != null:
		for child in list.get_children():
			if child is BaseButton:
				child.disabled = not interactable


func _set_use_enabled(enabled: bool) -> void:
	var button = _named("UseButton")
	if button != null:
		button.disabled = not enabled

func _set_confirmation_visible(visible: bool) -> void:
	var button = _named("ConfirmUseButton")
	if button != null:
		button.visible = visible
		button.disabled = not visible

func _connect_button(name: String, callback: Callable) -> void:
	var button = _named(name)
	if button != null and not button.pressed.is_connected(callback):
		button.pressed.connect(callback)

func _named(name: String):
	return find_child(name, true, false)

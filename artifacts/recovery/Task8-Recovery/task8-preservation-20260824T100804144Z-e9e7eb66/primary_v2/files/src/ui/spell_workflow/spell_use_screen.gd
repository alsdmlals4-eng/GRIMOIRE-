class_name SpellUseScreen
extends Control


signal cancel_requested


var _coordinator = null
var _use_transaction_id: StringName = &""
var _current_preview: Dictionary = {}
var _confirmation_requested := false
var _committed := false


func configure(coordinator, use_transaction_id: StringName = &"") -> void:
    _coordinator = coordinator
    _use_transaction_id = use_transaction_id
    _bind_confirm_button()
    _bind_cancel_button()


func render_prepared_spell_summary(summary: Dictionary) -> void:
    var summary_label := find_child("PreparedSpellSummaryLabel", true, false) as Label
    if summary_label == null:
        return
    summary_label.text = "준비된 주문: %s\n맥락: %s" % [
        summary.get("identity", "-"),
        summary.get("context", "-"),
    ]


func set_target_choices(target_choices: Array) -> void:
    var choices_container := find_child("TargetChoices", true, false) as Container
    if choices_container == null:
        return
    for child in choices_container.get_children():
        child.queue_free()
    for choice_variant in target_choices:
        var choice: Dictionary = Dictionary(choice_variant)
        var target_keyword := StringName(choice.get("target_keyword", &""))
        var target: Dictionary = Dictionary(choice.get("target", {})).duplicate(true)
        var payload: Dictionary = Dictionary(choice.get("payload", {})).duplicate(true)
        if target_keyword.is_empty():
            continue
        var target_button := Button.new()
        target_button.name = "TargetChoice_%s" % target_keyword
        target_button.text = "대상 선택: %s" % target.get("name", target_keyword)
        target_button.pressed.connect(_on_target_choice_pressed.bind(target_keyword, target, payload))
        choices_container.add_child(target_button)
        var confirm_button := find_child("ConfirmButton", true, false) as Button
        if confirm_button != null:
            target_button.focus_next = target_button.get_path_to(confirm_button)


func _on_target_choice_pressed(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> void:
    select_target(target_keyword, target, payload)


func select_target(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> Dictionary:
    if _coordinator == null or not _coordinator.has_method("prepare_target_preview"):
        return {"status": &"SPELL_SELECTION_REQUIRED"}
    var result: Dictionary = Dictionary(_coordinator.prepare_target_preview(target_keyword, target, payload)).duplicate(true)
    _confirmation_requested = false
    if StringName(result.get("status", &"")) == &"FINAL_PREVIEW_READY":
        _current_preview = Dictionary(result.get("preview", {})).duplicate(true)
        var target_label := find_child("SelectedTargetLabel", true, false) as Label
        if target_label != null:
            target_label.text = "선택 대상: %s" % target_keyword
        var mana_label := find_child("FinalManaLabel", true, false) as Label
        if mana_label != null:
            mana_label.text = "최종 마나: %s" % _current_preview.get("final_mana", "-")
        var result_label := find_child("ExpectedResultLabel", true, false) as Label
        if result_label != null:
            result_label.text = "예상 결과: %s" % _current_preview.get("expected_result", "-")
        var confirm_button := find_child("ConfirmButton", true, false) as Button
        if confirm_button != null:
            confirm_button.disabled = false
    else:
        _clear_preview_for_failed_target(StringName(result.get("status", &"SPELL_SELECTION_REQUIRED")))
    return result


func _clear_preview_for_failed_target(status: StringName) -> void:
    _current_preview.clear()
    _confirmation_requested = false
    var target_label := find_child("SelectedTargetLabel", true, false) as Label
    if target_label != null:
        target_label.text = "선택 대상: 없음"
    var mana_label := find_child("FinalManaLabel", true, false) as Label
    if mana_label != null:
        mana_label.text = "최종 마나: -"
    var result_label := find_child("ExpectedResultLabel", true, false) as Label
    if result_label != null:
        result_label.text = "예상 결과: -"
    var status_label := find_child("StatusLabel", true, false) as Label
    if status_label != null:
        status_label.text = "대상 선택 실패: %s" % status
    var confirm_button := find_child("ConfirmButton", true, false) as Button
    if confirm_button != null:
        confirm_button.disabled = true


func current_preview() -> Dictionary:
    return _current_preview.duplicate(true)


func request_confirmation() -> bool:
    if _coordinator == null or _current_preview.is_empty() or not _coordinator.has_method("request_use_confirmation"):
        return false
    _confirmation_requested = bool(_coordinator.request_use_confirmation())
    return _confirmation_requested


func confirm(transaction_id: StringName) -> Dictionary:
    if _committed or not _confirmation_requested or _coordinator == null or not _coordinator.has_method("confirm_use"):
        return {"status": &"USE_CONFIRMATION_REQUIRED"}
    var result: Dictionary = Dictionary(_coordinator.confirm_use(transaction_id)).duplicate(true)
    if StringName(result.get("status", &"")) == &"USED":
        _committed = true
        var confirm_button := find_child("ConfirmButton", true, false) as Button
        if confirm_button != null:
            confirm_button.disabled = true
    return result


func cancel() -> Dictionary:
    _confirmation_requested = false
    return {"status": &"CANCELLED"}


func activate_confirm(transaction_id: StringName) -> Dictionary:
    return confirm(transaction_id)


func _ready() -> void:
    var confirm_button := find_child("ConfirmButton", true, false) as Button
    if confirm_button != null:
        confirm_button.disabled = true
    _bind_confirm_button()
    _bind_cancel_button()


func _bind_cancel_button() -> void:
    var cancel_button := find_child("CancelButton", true, false) as Button
    if cancel_button != null and not cancel_button.pressed.is_connected(_on_cancel_button_pressed):
        cancel_button.pressed.connect(_on_cancel_button_pressed)


func _on_cancel_button_pressed() -> void:
    cancel()
    cancel_requested.emit()


func _bind_confirm_button() -> void:
    var confirm_button := find_child("ConfirmButton", true, false) as Button
    if confirm_button != null and not confirm_button.pressed.is_connected(_on_confirm_button_pressed):
        confirm_button.pressed.connect(_on_confirm_button_pressed)


func _on_confirm_button_pressed() -> void:
    if _committed or _current_preview.is_empty():
        return
    if not _confirmation_requested:
        request_confirmation()
        return
    if _use_transaction_id.is_empty():
        return
    confirm(_use_transaction_id)

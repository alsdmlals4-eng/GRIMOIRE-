# 주문 쓰기 화면은 기존 Coordinator의 대상·시전 권한을 표시하고 의도만 전달한다.
class_name SpellUseScreen
extends Control

signal cancel_requested
signal cast_resolved(result: Dictionary)

var _coordinator = null
var _use_transaction_id: StringName = &""
var _current_preview: Dictionary = {}
var _confirmation_requested := false
var _committed := false
var _target_choices_by_id: Dictionary = {}

func configure(coordinator, use_transaction_id: StringName = &"") -> void:
    _coordinator = coordinator
    _use_transaction_id = use_transaction_id
    _current_preview.clear()
    _confirmation_requested = false
    _committed = false
    _target_choices_by_id.clear()

func select_target(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> Dictionary:
    if _coordinator == null:
        return {"status": &"SPELL_SELECTION_REQUIRED"}
    var preview: Dictionary = _coordinator.prepare_target_preview(target_keyword, target, payload)
    if StringName(preview.get("status", &"")) != &"FINAL_PREVIEW_READY":
        _current_preview.clear()
        _render_preview_status(StringName(preview.get("status", &"INVALID_TARGET")), {}, false)
        return preview.duplicate(true)
    _current_preview = preview.duplicate(true)
    _render_preview_status(&"FINAL_PREVIEW_READY", _current_preview, true)
    return current_preview()

func _ready() -> void:
    var selector = get_node_or_null("Content/TargetSelector")
    if selector != null and selector.has_signal("target_selected") and not selector.target_selected.is_connected(_on_target_selected):
        selector.target_selected.connect(_on_target_selected)
    var commit_bar = get_node_or_null("Content/CommitBar")
    if commit_bar != null and commit_bar.has_signal("commit_requested") and not commit_bar.commit_requested.is_connected(_on_commit_requested):
        commit_bar.commit_requested.connect(_on_commit_requested)
    if commit_bar != null and commit_bar.has_signal("edit_requested") and not commit_bar.edit_requested.is_connected(_on_edit_requested):
        commit_bar.edit_requested.connect(_on_edit_requested)
    var cancel_button = get_node_or_null("Content/CancelButton") as Button
    if cancel_button != null and not cancel_button.pressed.is_connected(_on_cancel_pressed):
        cancel_button.pressed.connect(_on_cancel_pressed)

func set_target_choices(target_choices: Array) -> void:
    _target_choices_by_id.clear()
    var selector_choices: Array[Dictionary] = []
    for candidate_variant in target_choices:
        var candidate: Dictionary = Dictionary(candidate_variant)
        var choice_id := StringName(candidate.get("id", &""))
        if choice_id.is_empty() or not candidate.has("label") or not candidate.has("hint") or not candidate.has("target_keyword") or not candidate.has("target") or not candidate.has("payload"):
            continue
        _target_choices_by_id[choice_id] = candidate.duplicate(true)
        selector_choices.append({"id": choice_id, "label": str(candidate["label"]), "hint": str(candidate["hint"])})
    var selector = get_node_or_null("Content/TargetSelector")
    if selector != null and selector.has_method("configure_targets"):
        selector.configure_targets(selector_choices)

func _on_target_selected(choice_id: StringName) -> void:
    if not _target_choices_by_id.has(choice_id):
        return
    var choice: Dictionary = Dictionary(_target_choices_by_id[choice_id])
    select_target(StringName(choice.get("target_keyword", &"")), Dictionary(choice.get("target", {})), Dictionary(choice.get("payload", {})))

func _render_preview_status(status: StringName, preview_result: Dictionary, can_commit: bool) -> void:
    var status_label = get_node_or_null("Content/FinalPreview/Status") as Label
    if status_label != null:
        status_label.text = _player_preview_status(status)
    var preview: Dictionary = Dictionary(preview_result.get("preview", {}))
    var commit_bar = get_node_or_null("Content/CommitBar")
    if commit_bar != null and commit_bar.has_method("configure"):
        commit_bar.configure(str(preview.get("target_keyword", "—")), maxi(0, int(preview.get("estimated_mana", 0))), can_commit, _confirmation_requested)

func _player_preview_status(status: StringName) -> String:
    match status:
        &"FINAL_PREVIEW_READY":
            return "대상과 시전 결과를 확인하세요."
        &"INVALID_TARGET":
            return "유효한 대상을 다시 선택하세요."
        _:
            return "대상을 선택하세요."


func current_preview() -> Dictionary:
    return _current_preview.duplicate(true)

func request_confirmation() -> bool:
    if _coordinator == null or _current_preview.is_empty() or _committed:
        return false
    _confirmation_requested = _coordinator.request_use_confirmation()
    if _confirmation_requested:
        _render_preview_status(&"FINAL_PREVIEW_READY", _current_preview, true)
    return _confirmation_requested

func confirm(transaction_id: StringName) -> Dictionary:
    if _coordinator == null or transaction_id.is_empty() or transaction_id != _use_transaction_id:
        return {"status": &"USE_CONFIRMATION_REQUIRED"}
    if not _confirmation_requested or _committed:
        return {"status": &"USE_CONFIRMATION_REQUIRED"}
    var result: Dictionary = _coordinator.confirm_use(transaction_id)
    if StringName(result.get("status", &"")) == &"USED":
        _committed = true
        cast_resolved.emit(result.duplicate(true))
    return result.duplicate(true)

func cancel() -> void:
    cancel_requested.emit()

func _on_edit_requested() -> void:
    if _committed:
        return
    _confirmation_requested = false
    if not _current_preview.is_empty():
        _render_preview_status(&"FINAL_PREVIEW_READY", _current_preview, true)

func _on_commit_requested() -> void:
    if not _confirmation_requested:
        request_confirmation()
        return
    confirm(_use_transaction_id)

func _on_cancel_pressed() -> void:
    cancel()

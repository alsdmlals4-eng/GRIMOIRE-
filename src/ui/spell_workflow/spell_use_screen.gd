# 주문 쓰기 화면은 기존 Coordinator의 대상·시전 권한을 표시하고 의도만 전달한다.
class_name SpellUseScreen
extends Control

signal cancel_requested
signal cast_resolved(result: Dictionary)

var _coordinator = null
var _use_transaction_id: StringName = &""
var _current_preview: Dictionary = {}
var _current_choice: Dictionary = {}
var _confirmation_requested := false
var _committed := false
var _target_choices_by_id: Dictionary = {}

func configure(coordinator, use_transaction_id: StringName = &"") -> void:
    _coordinator = coordinator
    _use_transaction_id = use_transaction_id
    _current_preview.clear()
    _current_choice.clear()
    _confirmation_requested = false
    _committed = false
    _target_choices_by_id.clear()

func select_target(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> Dictionary:
    if _coordinator == null:
        return {"status": &"SPELL_SELECTION_REQUIRED"}
    var preview: Dictionary = _coordinator.prepare_target_preview(target_keyword, target, payload)
    if StringName(preview.get("status", &"")) != &"FINAL_PREVIEW_READY":
        _confirmation_requested = false
        _render_preview_status(StringName(preview.get("status", &"INVALID_TARGET")), _current_preview, false)
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
        if choice_id.is_empty() or not candidate.has("label") or not candidate.has("hint") or not candidate.has("protected_value") or not candidate.has("known_improvement") or not candidate.has("forgone_or_remaining") or not candidate.has("unknown") or not candidate.has("target_keyword") or not candidate.has("target") or not candidate.has("payload"):
            continue
        _target_choices_by_id[choice_id] = candidate.duplicate(true)
        selector_choices.append(candidate.duplicate(true))
    var selector = get_node_or_null("Content/TargetSelector")
    if selector != null and selector.has_method("configure_targets"):
        selector.configure_targets(selector_choices)

func _on_target_selected(choice_id: StringName) -> void:
    if not _target_choices_by_id.has(choice_id):
        return
    var choice: Dictionary = Dictionary(_target_choices_by_id[choice_id])
    _current_choice = choice.duplicate(true)
    select_target(StringName(choice.get("target_keyword", &"")), Dictionary(choice.get("target", {})), Dictionary(choice.get("payload", {})))

func _render_preview_status(status: StringName, preview_result: Dictionary, can_commit: bool) -> void:
    var status_label = get_node_or_null("Content/FinalPreview/Status") as Label
    if status_label != null:
        status_label.text = _preview_status_copy(status, preview_result)
    var preview: Dictionary = Dictionary(preview_result.get("preview", {}))
    var known_improvement = get_node_or_null("Content/FinalPreview/KnownImprovement") as Label
    if known_improvement != null:
        known_improvement.text = "확인된 개선\n%s" % str(_current_choice.get("known_improvement", "—"))
    var remaining_risk = get_node_or_null("Content/FinalPreview/RemainingRisk") as Label
    if remaining_risk != null:
        remaining_risk.text = "남는 위험\n%s" % str(_current_choice.get("forgone_or_remaining", "—"))
    var unknown = get_node_or_null("Content/FinalPreview/Unknown") as Label
    if unknown != null:
        unknown.text = "아직 미확인\n%s" % str(_current_choice.get("unknown", "—"))
    var forecast = get_node_or_null("Content/FinalPreview/Forecast") as Label
    if forecast != null:
        forecast.text = "시전 정보\n예상 성공률 %d%% · 필요 마나 %d" % [maxi(0, int(preview.get("success_percent", 0))), maxi(0, int(preview.get("estimated_mana", 0)))]
    var commit_bar = get_node_or_null("Content/CommitBar")
    if commit_bar != null and commit_bar.has_method("configure"):
        commit_bar.configure(str(_current_choice.get("label", preview.get("target_keyword", "—"))), maxi(0, int(preview.get("estimated_mana", 0))), can_commit, _confirmation_requested)


func _preview_status_copy(status: StringName, preview: Dictionary) -> String:
    if status == &"FINAL_PREVIEW_READY":
        return "대상: %s\n필요 마나: %d\n대상을 확인한 뒤 시전하세요." % [str(_current_choice.get("label", preview.get("target_keyword", "—"))), maxi(0, int(preview.get("estimated_mana", 0)))]
    match status:
        &"INVALID_TARGET":
            return "현재 확인된 대상이 아닙니다. 다른 대상을 선택하세요."
        &"SPELL_SELECTION_REQUIRED":
            return "완성 주문을 먼저 확인하세요."
        _:
            return "대상 정보를 다시 확인하세요."

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

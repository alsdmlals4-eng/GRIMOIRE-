class_name StoryEventRoot
extends Control

const CircleComposition = preload("res://src/core/circle/circle_composition.gd")
const CircleCompositionResolver = preload("res://src/core/circle/circle_composition_resolver.gd")
const EventClockResolver = preload("res://src/core/events/event_clock_resolver.gd")
const EventClockState = preload("res://src/core/events/event_clock_state.gd")
const StoryProgress = preload("res://src/core/story/story_progress.gd")
const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")
const GlyphCatalog = preload("res://src/core/glyphs/glyph_catalog.gd")

const EVENT_RESOURCE_PATH := "res://data/events/frostbloom/frostbloom_event_01.tres"

var _event_definition = null
var _clock_state = null
var _clock_resolver = null
var _circle_resolver = null
var _story_progress = null
var _selected_glyph_ids: Array[StringName] = []
var _selected_target_id: StringName = &""
var _circle_preview: Dictionary = {}
var _last_result: Dictionary = {}
var _last_success_tags: Array = []
var _commit_serial := 0
var _prepared_action_id: StringName = &""
var _prepared_action_consumed := false

signal glyph_selection_changed(selected_glyph_ids: Array)
signal circle_preview_requested(preview: Dictionary)
signal target_selection_changed(target_id: StringName)
signal commit_requested(action_id: StringName)


func _ready() -> void:
    theme = ThemeFactory.create_theme()
    if _story_progress == null and is_inside_tree() and get_tree() != null:
        configure(StoryProgress.consume_first_event_handoff(get_tree().root))
    _ensure_runtime()
    _render_clock_state()
    _connect_controls()
    _render_flow_state()


func configure(progress) -> void:
    _story_progress = progress if _is_first_event_progress(progress) else null
    _render_flow_state()


func select_glyph(glyph_id: StringName) -> Dictionary:
    if not _has_first_event_progress():
        return {"status": &"FIRST_EVENT_PROGRESS_REQUIRED"}
    if _prepared_action_consumed:
        return {"status": &"PREPARED_ACTION_ALREADY_RESOLVED"}
    if GlyphCatalog.metadata(glyph_id).is_empty():
        return {"status": &"GLYPH_UNAVAILABLE"}
    if _selected_glyph_ids.has(glyph_id):
        return {"status": &"GLYPH_ALREADY_SELECTED", "selected_glyph_ids": _selected_glyph_ids.duplicate()}
    if _selected_glyph_ids.size() >= CircleComposition.MAX_GLYPH_COUNT:
        return {"status": &"GLYPH_LIMIT_REACHED", "selected_glyph_ids": _selected_glyph_ids.duplicate()}
    _selected_glyph_ids.append(glyph_id)
    _clear_preview_and_target()
    glyph_selection_changed.emit(_selected_glyph_ids.duplicate())
    _render_flow_state()
    return {"status": &"GLYPH_SELECTED", "selected_glyph_ids": _selected_glyph_ids.duplicate()}


func request_circle_preview() -> Dictionary:
    if not _has_first_event_progress():
        return {"status": &"FIRST_EVENT_PROGRESS_REQUIRED"}
    if _prepared_action_consumed:
        return {"status": &"PREPARED_ACTION_ALREADY_RESOLVED"}
    var composition = CircleComposition.create(_selected_glyph_ids, _selected_glyph_ids)
    if composition == null:
        return {"status": &"CIRCLE_REQUIRED"}
    var validation: Dictionary = composition.validation()
    if StringName(validation.get("status", &"")) != &"OK":
        return validation
    _ensure_runtime()
    _circle_preview = _circle_resolver.preview(composition, {"risk_tags": [_event_definition.threat_clock_id]})
    _circle_preview["status"] = &"PREVIEW_READY"
    _selected_target_id = &""
    _prepared_action_id = _next_prepared_action_id()
    circle_preview_requested.emit(_circle_preview.duplicate(true))
    _render_flow_state()
    return _circle_preview.duplicate(true)


func current_circle_preview() -> Dictionary:
    return _circle_preview.duplicate(true)


func select_target(target_id: StringName) -> Dictionary:
    if not _has_first_event_progress():
        return {"status": &"FIRST_EVENT_PROGRESS_REQUIRED"}
    if _prepared_action_consumed:
        return {"status": &"PREPARED_ACTION_ALREADY_RESOLVED"}
    if StringName(_circle_preview.get("status", &"")) != &"PREVIEW_READY":
        return {"status": &"PREVIEW_REQUIRED"}
    if target_id != &"FROST_SEEDLINGS":
        return {"status": &"TARGET_UNAVAILABLE"}
    _selected_target_id = target_id
    target_selection_changed.emit(target_id)
    _render_flow_state()
    return {"status": &"TARGET_SELECTED", "target_id": target_id}


func request_commit() -> Dictionary:
    if not _has_first_event_progress():
        return {"status": &"FIRST_EVENT_PROGRESS_REQUIRED"}
    if _prepared_action_consumed:
        return _repeat_prepared_action()
    if StringName(_circle_preview.get("status", &"")) != &"PREVIEW_READY":
        return {"status": &"PREVIEW_REQUIRED"}
    if _selected_target_id.is_empty():
        return {"status": &"TARGET_REQUIRED"}
    if _prepared_action_id.is_empty():
        return _receipt(&"PREPARED_ACTION_REQUIRED", &"", _circle_preview)
    commit_requested.emit(_prepared_action_id)
    return _resolve_previewed_action(_prepared_action_id)


func resolve_event_action(action_id: StringName, glyph_ids: Array, target_id: StringName) -> Dictionary:
    _ensure_runtime()
    if not _has_first_event_progress():
        return _receipt(&"FIRST_EVENT_PROGRESS_REQUIRED", action_id, {})
    if target_id.is_empty():
        return _receipt(&"TARGET_REQUIRED", action_id, {})
    if action_id.is_empty():
        return _receipt(&"ACTION_ID_REQUIRED", action_id, {})
    if _prepared_action_consumed:
        return _repeat_prepared_action()

    var circle_glyph_ids: Array[StringName] = []
    for glyph_id in glyph_ids:
        var normalized_id := StringName(glyph_id)
        if not normalized_id.is_empty():
            circle_glyph_ids.append(normalized_id)
    var composition = CircleComposition.create(circle_glyph_ids, circle_glyph_ids)
    if composition == null:
        return _receipt(&"CIRCLE_REQUIRED", action_id, {})
    var preview: Dictionary = _circle_resolver.preview(composition, {"risk_tags": [_event_definition.threat_clock_id]})
    if StringName(composition.validation().get("status", &"")) != &"OK":
        return _receipt(StringName(composition.validation().get("status", &"")), action_id, preview)
    _circle_preview = preview
    _circle_preview["status"] = &"PREVIEW_READY"
    _selected_glyph_ids = circle_glyph_ids.duplicate()
    _selected_target_id = target_id
    _prepared_action_id = action_id
    return _resolve_previewed_action(action_id)


func goal_clock_segments() -> int:
    _ensure_runtime()
    return int(_clock_state.goal_segments)


func threat_clock_segments() -> int:
    _ensure_runtime()
    return int(_clock_state.threat_segments)


func last_result_receipt() -> Dictionary:
    return _last_result.duplicate(true)


func result_receipt_text() -> String:
    var receipt_label := get_node_or_null(NodePath("Content/Body/ActionPanel/ResultReceipt")) as Label
    return "" if receipt_label == null else receipt_label.text


func _ensure_runtime() -> void:
    if _event_definition == null:
        _event_definition = load(EVENT_RESOURCE_PATH)
    if _clock_state == null:
        _clock_state = EventClockState.new()
    if _clock_resolver == null:
        _clock_resolver = EventClockResolver.new(_event_definition)
    if _circle_resolver == null:
        _circle_resolver = CircleCompositionResolver.new()


func _render_clock_state(resolution: Dictionary = {}) -> void:
    var clock_view := get_node_or_null(NodePath("Content/Body/ActionPanel/EventClockView"))
    if clock_view == null:
        return
    if resolution.is_empty():
        clock_view.configure(_event_definition, _clock_state.to_snapshot())
    else:
        clock_view.apply_resolution(_event_definition, resolution)


func _render_receipt(resolution: Dictionary) -> void:
    var receipt_label := get_node_or_null(NodePath("Content/Body/ActionPanel/ResultReceipt")) as Label
    if receipt_label == null:
        return
    var status := StringName(resolution.get("status", &""))
    var tags: Array = resolution.get("visible_consequence_tags", [])
    if status == &"RESOLVED":
        _last_success_tags = tags.duplicate()
    elif status == &"ALREADY_RESOLVED":
        tags = _last_success_tags.duplicate()
        resolution["visible_consequence_tags"] = tags.duplicate()
        resolution["repeat_notice"] = &"ALREADY_RESOLVED_NO_CHANGE"
    receipt_label.text = " · ".join(tags.map(func(tag): return String(tag)))
    if status == &"ALREADY_RESOLVED":
        receipt_label.text += "\n이미 처리된 시전입니다. 변화는 없습니다."


func _receipt(status: StringName, action_id: StringName, preview: Dictionary) -> Dictionary:
    return {
        "status": status,
        "action_id": action_id,
        "preview": preview,
        "state": _clock_state,
        "state_snapshot": _clock_state.to_snapshot(),
        "visible_consequence_tags": [],
    }


func _resolve_previewed_action(action_id: StringName) -> Dictionary:
    if action_id.is_empty():
        return _receipt(&"ACTION_ID_REQUIRED", action_id, _circle_preview)
    var preview_method_tags: Array = Array(_circle_preview.get("method_tags", []))
    var resolution: Dictionary = _clock_resolver.resolve(_clock_state, {
        "action_id": action_id,
        "target_id": _selected_target_id,
        "method_tags": preview_method_tags,
    })
    _clock_state = resolution.get("state", _clock_state)
    resolution["preview"] = _circle_preview.duplicate(true)
    resolution["resolver_method_tags"] = preview_method_tags.duplicate()
    _render_clock_state(resolution)
    _render_receipt(resolution)
    if StringName(resolution.get("status", &"")) == &"RESOLVED":
        _prepared_action_consumed = true
    _last_result = resolution.duplicate(true)
    _render_flow_state()
    return resolution


func _next_prepared_action_id() -> StringName:
    _commit_serial += 1
    return StringName("frost-action-%d" % _commit_serial)


func _clear_preview_and_target() -> void:
    _circle_preview = {}
    _selected_target_id = &""
    _prepared_action_id = &""


func _repeat_prepared_action() -> Dictionary:
    var repeated := _receipt(&"ALREADY_RESOLVED", _prepared_action_id, _circle_preview)
    repeated["visible_consequence_tags"] = _last_success_tags.duplicate()
    repeated["repeat_notice"] = &"ALREADY_RESOLVED_NO_CHANGE"
    _render_receipt(repeated)
    _last_result = repeated.duplicate(true)
    _render_flow_state()
    return repeated


func _has_first_event_progress() -> bool:
    return _is_first_event_progress(_story_progress)


func _connect_controls() -> void:
    var writing_panel = get_node_or_null(NodePath("Content/Body/GlyphWritingPanel"))
    if writing_panel != null:
        if writing_panel.has_method("configure_allowed_glyphs"):
            writing_panel.configure_allowed_glyphs([&"HEAT", &"PROTECT"])
        if writing_panel.has_signal("glyph_accepted") and not writing_panel.glyph_accepted.is_connected(_on_glyph_accepted):
            writing_panel.glyph_accepted.connect(_on_glyph_accepted)
    _connect_button(&"Content/Body/ActionPanel/PreviewButton", request_circle_preview)
    _connect_button(&"Content/Body/ActionPanel/TargetButton", func(): select_target(&"FROST_SEEDLINGS"))
    _connect_button(&"Content/Body/ActionPanel/CommitButton", request_commit)


func _connect_button(node_path: StringName, callback: Callable) -> void:
    var button := get_node_or_null(NodePath(node_path)) as Button
    if button != null and not button.pressed.is_connected(callback):
        button.pressed.connect(callback)


func _on_glyph_accepted(glyph_id: StringName) -> void:
    select_glyph(glyph_id)


func _render_flow_state() -> void:
    var preview_ready := StringName(_circle_preview.get("status", &"")) == &"PREVIEW_READY"
    var progress_ready := _has_first_event_progress()
    var preview_button := get_node_or_null(NodePath("Content/Body/ActionPanel/PreviewButton")) as Button
    var target_button := get_node_or_null(NodePath("Content/Body/ActionPanel/TargetButton")) as Button
    var commit_button := get_node_or_null(NodePath("Content/Body/ActionPanel/CommitButton")) as Button
    var preview_status := get_node_or_null(NodePath("Content/Body/ActionPanel/PreviewStatus")) as Label
    var composition_status := get_node_or_null(NodePath("Content/Body/ActionPanel/GlyphCompositionStatus")) as Label
    if preview_button != null:
        preview_button.disabled = not progress_ready or _selected_glyph_ids.is_empty()
    if target_button != null:
        target_button.disabled = not progress_ready or not preview_ready
    if commit_button != null:
        commit_button.disabled = not progress_ready or not preview_ready or _selected_target_id.is_empty() or _prepared_action_consumed
    if preview_status != null:
        preview_status.visible = preview_ready
        if preview_ready:
            preview_status.text = "회로 Preview: %s" % String(_circle_preview.get("composition_signature", ""))
    if composition_status != null:
        var glyph_names: Array[String] = []
        for glyph_id in _selected_glyph_ids:
            glyph_names.append(String(GlyphCatalog.metadata(glyph_id).get("name", glyph_id)))
        composition_status.text = "서클 글자: %s" % (" · ".join(glyph_names) if not glyph_names.is_empty() else "아직 없음")


func _is_first_event_progress(progress) -> bool:
    return progress != null and progress.has_method("current_beat") and progress.call("current_beat") == StoryProgress.FIRST_EVENT

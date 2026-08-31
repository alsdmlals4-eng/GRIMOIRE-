class_name StoryEventRoot
extends Control

const CircleComposition = preload("res://src/core/circle/circle_composition.gd")
const CircleCompositionResolver = preload("res://src/core/circle/circle_composition_resolver.gd")
const EventClockResolver = preload("res://src/core/events/event_clock_resolver.gd")
const EventClockState = preload("res://src/core/events/event_clock_state.gd")
const StoryProgress = preload("res://src/core/story/story_progress.gd")
const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")

const EVENT_RESOURCE_PATH := "res://data/events/frostbloom/frostbloom_event_01.tres"

var _event_definition = null
var _clock_state = null
var _clock_resolver = null
var _circle_resolver = null
var _story_progress = null


func _ready() -> void:
    theme = ThemeFactory.create_theme()
    _ensure_runtime()
    _render_clock_state()


func configure(progress) -> void:
    _story_progress = progress if _is_first_event_progress(progress) else null


func resolve_event_action(action_id: StringName, glyph_ids: Array, target_id: StringName) -> Dictionary:
    _ensure_runtime()
    if target_id.is_empty():
        return _receipt(&"TARGET_REQUIRED", action_id, {})
    if action_id.is_empty():
        return _receipt(&"ACTION_ID_REQUIRED", action_id, {})

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

    var resolution: Dictionary = _clock_resolver.resolve(_clock_state, {
        "action_id": action_id,
        "target_id": target_id,
        "method_tags": composition.glyph_instance_ids(),
    })
    _clock_state = resolution.get("state", _clock_state)
    _render_clock_state(resolution)
    resolution["preview"] = preview
    _render_receipt(resolution)
    return resolution


func goal_clock_segments() -> int:
    _ensure_runtime()
    return int(_clock_state.goal_segments)


func threat_clock_segments() -> int:
    _ensure_runtime()
    return int(_clock_state.threat_segments)


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
    var clock_view := get_node_or_null(NodePath("Content/EventClockView"))
    if clock_view == null:
        return
    if resolution.is_empty():
        clock_view.configure(_event_definition, _clock_state.to_snapshot())
    else:
        clock_view.apply_resolution(_event_definition, resolution)


func _render_receipt(resolution: Dictionary) -> void:
    var receipt_label := get_node_or_null(NodePath("Content/ResultReceipt")) as Label
    if receipt_label == null:
        return
    var tags: Array = resolution.get("visible_consequence_tags", [])
    receipt_label.text = " · ".join(tags.map(func(tag): return String(tag)))


func _receipt(status: StringName, action_id: StringName, preview: Dictionary) -> Dictionary:
    return {
        "status": status,
        "action_id": action_id,
        "preview": preview,
        "state": _clock_state,
        "state_snapshot": _clock_state.to_snapshot(),
        "visible_consequence_tags": [],
    }


func _is_first_event_progress(progress) -> bool:
    return progress != null and progress.has_method("current_beat") and progress.call("current_beat") == StoryProgress.FIRST_EVENT

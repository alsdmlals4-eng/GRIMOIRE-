class_name EventClockView
extends PanelContainer

var _definition = null
var _goal_filled := 0
var _threat_filled := 0


func configure(definition, state_snapshot: Dictionary) -> void:
    _definition = definition
    _goal_filled = int(state_snapshot.get("goal_segments", 0))
    _threat_filled = int(state_snapshot.get("threat_segments", 0))
    _rebuild_live_controls()


func apply_resolution(definition, resolution: Dictionary) -> void:
    configure(definition, Dictionary(resolution.get("state_snapshot", {})))


func goal_label_text() -> String:
    return _label_for(&"goal_label", "")


func threat_label_text() -> String:
    return _label_for(&"threat_label", "")


func goal_segment_count() -> int:
    return 0 if _definition == null else int(_definition.goal_segment_count)


func threat_segment_count() -> int:
    return 0 if _definition == null else int(_definition.threat_segment_count)


func goal_filled_segments() -> int:
    return _goal_filled


func threat_filled_segments() -> int:
    return _threat_filled


func _rebuild_live_controls() -> void:
    for child in get_children():
        remove_child(child)
        child.free()

    var rows := VBoxContainer.new()
    rows.name = &"ClockRows"
    rows.add_theme_constant_override(&"separation", 12)
    add_child(rows)
    _append_clock(rows, &"GoalClock", goal_label_text(), goal_segment_count(), _goal_filled, &"AcademyPanelEmphasis")
    _append_clock(rows, &"ThreatClock", threat_label_text(), threat_segment_count(), _threat_filled, &"AcademyPanel")


func _append_clock(parent: VBoxContainer, clock_name: StringName, label_text: String, segment_count: int, filled_count: int, variation: StringName) -> void:
    var row := VBoxContainer.new()
    row.name = clock_name
    row.add_theme_constant_override(&"separation", 6)
    parent.add_child(row)

    var label := Label.new()
    label.name = &"GoalLabel" if clock_name == &"GoalClock" else &"ThreatLabel"
    label.text = label_text
    label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    row.add_child(label)

    var segments := HBoxContainer.new()
    segments.name = &"GoalSegments" if clock_name == &"GoalClock" else &"ThreatSegments"
    segments.add_theme_constant_override(&"separation", 6)
    row.add_child(segments)
    for index in range(maxi(0, segment_count)):
        var segment := PanelContainer.new()
        segment.name = "Segment%d" % (index + 1)
        segment.custom_minimum_size = Vector2(28, 18)
        segment.theme_type_variation = variation if index < filled_count else &"AcademyPanelPinned"
        segment.set_meta(&"filled", index < filled_count)
        segments.add_child(segment)


func _label_for(key: StringName, fallback: String) -> String:
    if _definition == null:
        return fallback
    return String(_definition.get_meta(key, fallback))

class_name Stage2CircuitBridgeHarness
extends Control

const NORMAL_TRANSITION_MS := 150

var _active_stroke := false
var _reduced_motion := false


func _ready() -> void:
    _initialize_metadata()


func apply_scenario(fixture: Dictionary) -> bool:
    var objective := String(fixture.get("objective", "")).strip_edges()
    var threat := String(fixture.get("threat", "")).strip_edges()
    var situation := String(fixture.get("situation", "")).strip_edges()
    var context_text := get_node_or_null("SafeRoot/ObjectiveThreatSituation/ContextText") as Label
    if objective.is_empty() or threat.is_empty() or situation.is_empty() or context_text == null:
        return false
    context_text.text = "목표: %s\n위협: %s\n상황: %s" % [objective, threat, situation]
    return true


func set_active_stroke(active: bool) -> bool:
    var circuit_grid := get_node_or_null("SafeRoot/Body/TargetCircuit/CircuitGrid") as GridContainer
    var preview_button := get_node_or_null("SafeRoot/ResourcePreviewCommit/PreviewButton") as Button
    var commit_button := get_node_or_null("SafeRoot/ResourcePreviewCommit/CommitButton") as Button
    var cancel_button := get_node_or_null("SafeRoot/ResourcePreviewCommit/CancelButton") as Button
    if circuit_grid == null or preview_button == null or commit_button == null or cancel_button == null:
        return false
    _initialize_metadata()
    _active_stroke = active
    set_meta("active_stroke_owner", &"WRITING_CANVAS" if active else &"NONE")
    for child in circuit_grid.get_children():
        if child is BaseButton:
            child.disabled = active
    preview_button.disabled = active
    commit_button.disabled = active
    cancel_button.disabled = false
    return true


func apply_accessibility_mode(reduced_motion: bool) -> bool:
    _initialize_metadata()
    _reduced_motion = reduced_motion
    set_meta("reduced_motion", reduced_motion)
    set_meta("transition_duration_ms", 0 if reduced_motion else NORMAL_TRANSITION_MS)
    return true


func active_stroke() -> bool:
    return _active_stroke


func reduced_motion() -> bool:
    return _reduced_motion


func _initialize_metadata() -> void:
    if not has_meta("active_stroke_owner"):
        set_meta("active_stroke_owner", &"NONE")
    if not has_meta("transition_duration_ms"):
        set_meta("transition_duration_ms", NORMAL_TRANSITION_MS)

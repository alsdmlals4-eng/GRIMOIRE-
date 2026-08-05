class_name Stage2CircuitBridgeHarness
extends Control

const NORMAL_TRANSITION_MS := 150

var _active_stroke := false
var _reduced_motion := false

@onready var _context_text: Label = $SafeRoot/ObjectiveThreatSituation/ContextText
@onready var _circuit_grid: GridContainer = $SafeRoot/Body/TargetCircuit/CircuitGrid
@onready var _preview_button: Button = $SafeRoot/ResourcePreviewCommit/PreviewButton
@onready var _commit_button: Button = $SafeRoot/ResourcePreviewCommit/CommitButton
@onready var _cancel_button: Button = $SafeRoot/ResourcePreviewCommit/CancelButton


func _ready() -> void:
    set_meta("active_stroke_owner", &"NONE")
    set_meta("transition_duration_ms", NORMAL_TRANSITION_MS)


func apply_scenario(fixture: Dictionary) -> bool:
    var objective := String(fixture.get("objective", "")).strip_edges()
    var threat := String(fixture.get("threat", "")).strip_edges()
    var situation := String(fixture.get("situation", "")).strip_edges()
    if objective.is_empty() or threat.is_empty() or situation.is_empty():
        return false
    _context_text.text = "목표: %s\n위협: %s\n상황: %s" % [objective, threat, situation]
    return true


func set_active_stroke(active: bool) -> bool:
    _active_stroke = active
    set_meta("active_stroke_owner", &"WRITING_CANVAS" if active else &"NONE")
    for child in _circuit_grid.get_children():
        if child is BaseButton:
            child.disabled = active
    _preview_button.disabled = active
    _commit_button.disabled = active
    _cancel_button.disabled = false
    return true


func apply_accessibility_mode(reduced_motion: bool) -> bool:
    _reduced_motion = reduced_motion
    set_meta("reduced_motion", reduced_motion)
    set_meta("transition_duration_ms", 0 if reduced_motion else NORMAL_TRANSITION_MS)
    return true


func active_stroke() -> bool:
    return _active_stroke


func reduced_motion() -> bool:
    return _reduced_motion

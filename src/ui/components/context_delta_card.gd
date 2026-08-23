class_name ContextDeltaCard
extends PanelContainer

var _still_true := ""
var _newly_learned := ""
var _new_tension := ""


func configure(still_true: String, newly_learned: String, new_tension: String) -> void:
    _still_true = still_true
    _newly_learned = newly_learned
    _new_tension = new_tension
    get_node("Margin/Rows/StillTrue/Value").text = _still_true
    get_node("Margin/Rows/NewlyLearned/Value").text = _newly_learned
    get_node("Margin/Rows/NewTension/Value").text = _new_tension


func visual_snapshot() -> Dictionary:
    return {
        "STILL_TRUE": _still_true,
        "NEWLY_LEARNED": _newly_learned,
        "NEW_TENSION": _new_tension,
    }

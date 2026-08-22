class_name ContextHeader
extends PanelContainer

var _location_text := ""
var _phase_text := ""
var _task_text := ""


func configure(location_text: String, phase_text: String, task_text: String) -> void:
    _location_text = location_text
    _phase_text = phase_text
    _task_text = task_text
    get_node("Margin/Rows/Top/Location").text = location_text
    get_node("Margin/Rows/Top/Phase").text = phase_text
    get_node("Margin/Rows/Task").text = task_text


func visual_snapshot() -> Dictionary:
    return {
        "location": _location_text,
        "phase": _phase_text,
        "task": _task_text,
    }

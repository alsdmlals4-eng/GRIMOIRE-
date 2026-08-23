class_name ResultAxisCard
extends PanelContainer

const ALLOWED_AXES := [&"FACILITY", &"LIFE", &"SPIRIT", &"RELATIONSHIP", &"DISCOVERY"]

var _axis_id: StringName = &"FACILITY"
var _summary := ""
var _detail := ""
var _status: StringName = &"VALID"


func configure(axis_id: StringName, summary: String, detail: String = "") -> void:
    _axis_id = axis_id
    _summary = summary
    _detail = detail
    _status = &"VALID" if ALLOWED_AXES.has(axis_id) else &"INVALID_AXIS"

    get_node("Margin/Rows/Axis").text = str(_axis_id)
    get_node("Margin/Rows/Summary").text = _summary
    get_node("Margin/Rows/Detail").text = _detail
    get_node("Margin/Rows/Status").text = str(_status)
    get_node("Margin/Rows/Detail").visible = not _detail.is_empty()


func visual_snapshot() -> Dictionary:
    return {
        "axis_id": _axis_id,
        "status": _status,
        "summary": _summary,
        "detail": _detail,
    }

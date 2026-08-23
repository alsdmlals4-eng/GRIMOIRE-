class_name ForecastCard
extends PanelContainer

var _known_improvement := ""
var _uncertain_consequence := ""
var _success_percent := 0
var _breakdown_rows: Array[Dictionary] = []
var _mana_cost := 0


func configure(known_improvement: String, uncertain_consequence: String, success_percent: int, breakdown_rows: Array[Dictionary], mana_cost: int) -> void:
    _known_improvement = known_improvement
    _uncertain_consequence = uncertain_consequence
    _success_percent = clampi(success_percent, 0, 100)
    _mana_cost = maxi(0, mana_cost)
    _breakdown_rows.clear()
    for row in breakdown_rows:
        _breakdown_rows.append(row.duplicate(true))

    get_node("Margin/Rows/Known/Value").text = _known_improvement
    get_node("Margin/Rows/Uncertain/Value").text = _uncertain_consequence
    get_node("Margin/Rows/Success/Header/Percent").text = "%d%%" % _success_percent
    get_node("Margin/Rows/Mana/Value").text = str(_mana_cost)
    _render_breakdown()


func visual_snapshot() -> Dictionary:
    var rows: Array[Dictionary] = []
    for row in _breakdown_rows:
        rows.append(row.duplicate(true))
    return {
        "KNOWN_IMPROVEMENT": _known_improvement,
        "UNCERTAIN_CONSEQUENCE": _uncertain_consequence,
        "FINAL_TARGET_SUCCESS_BREAKDOWN": {
            "percent": _success_percent,
            "rows": rows,
        },
        "MANA_COST": _mana_cost,
    }


func _render_breakdown() -> void:
    var holder := get_node("Margin/Rows/Success/Breakdown") as VBoxContainer
    for child in holder.get_children():
        holder.remove_child(child)
        child.free()
    for row in _breakdown_rows:
        var line := HBoxContainer.new()
        line.theme_override_constants.separation = 8
        var label := Label.new()
        label.text = str(row.get("label", ""))
        label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
        var value := Label.new()
        value.text = str(row.get("value", ""))
        value.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
        line.add_child(label)
        line.add_child(value)
        holder.add_child(line)

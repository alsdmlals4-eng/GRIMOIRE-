class_name CausalThread
extends PanelContainer

const ALLOWED_KINDS := [&"OBSERVATION", &"W6_CIRCUIT", &"W6_TARGET", &"W6_RESULT", &"CONTEXT_DELTA", &"W7_JUDGMENT", &"W7_RESULT"]

var _receipts: Array[Dictionary] = []
var _status: StringName = &"VALID"


func configure(receipts: Array[Dictionary]) -> void:
    _receipts.clear()
    _status = &"VALID"
    for receipt in receipts:
        var copy := receipt.duplicate(true)
        _receipts.append(copy)
        var kind := StringName(str(copy.get("kind", "")))
        if not ALLOWED_KINDS.has(kind):
            _status = &"INVALID_RECEIPT_KIND"
    _render_receipts()
    get_node("Margin/Rows/Status").text = str(_status)


func visual_snapshot() -> Dictionary:
    var receipts: Array[Dictionary] = []
    for receipt in _receipts:
        receipts.append(receipt.duplicate(true))
    return {
        "status": _status,
        "receipts": receipts,
    }


func _render_receipts() -> void:
    var holder := get_node("Margin/Rows/ReceiptList") as VBoxContainer
    for child in holder.get_children():
        holder.remove_child(child)
        child.free()

    for index in range(_receipts.size()):
        var receipt := _receipts[index]
        var row := PanelContainer.new()
        row.theme_type_variation = &"AcademyPanelPinned" if index == _receipts.size() - 1 else &"AcademyPanel"
        var margin := MarginContainer.new()
        margin.add_theme_constant_override("margin_left", 10)
        margin.add_theme_constant_override("margin_top", 7)
        margin.add_theme_constant_override("margin_right", 10)
        margin.add_theme_constant_override("margin_bottom", 7)
        var columns := HBoxContainer.new()
        columns.add_theme_constant_override("separation", 10)
        var kind_label := Label.new()
        kind_label.text = str(receipt.get("kind", ""))
        kind_label.custom_minimum_size.x = 130.0
        var text_label := Label.new()
        text_label.text = str(receipt.get("text", ""))
        text_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
        text_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
        columns.add_child(kind_label)
        columns.add_child(text_label)
        margin.add_child(columns)
        row.add_child(margin)
        holder.add_child(row)

        if index < _receipts.size() - 1:
            var connector := Label.new()
            connector.text = "TO"
            connector.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
            holder.add_child(connector)

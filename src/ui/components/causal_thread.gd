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
        var row := MarginContainer.new()
        row.add_theme_constant_override("margin_left", 6)
        row.add_theme_constant_override("margin_top", 1)
        row.add_theme_constant_override("margin_right", 6)
        row.add_theme_constant_override("margin_bottom", 1)

        var columns := HBoxContainer.new()
        columns.add_theme_constant_override("separation", 8)

        var connector := Label.new()
        connector.text = "" if index == 0 else "↓"
        connector.custom_minimum_size.x = 18.0
        connector.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER

        var kind_label := Label.new()
        kind_label.text = str(receipt.get("kind", ""))
        kind_label.custom_minimum_size.x = 110.0

        var text_label := Label.new()
        text_label.text = str(receipt.get("text", ""))
        text_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
        text_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

        columns.add_child(connector)
        columns.add_child(kind_label)
        columns.add_child(text_label)
        row.add_child(columns)
        holder.add_child(row)

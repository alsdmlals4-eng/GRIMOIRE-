class_name FocusScribingOverlay
extends Control

const TIME_SCALE_TEST_VALUE := 0.25
const DEFAULT_MANA_PER_REAL_SECOND := 1.0

var _selected_glyph_id: StringName = &""
var _remaining_seconds: float = 0.0
var _mana_per_real_second: float = DEFAULT_MANA_PER_REAL_SECOND
var _stock_current: int = 0
var _stock_capacity: int = 0
var _interruption_risk: String = "Direct HP loss / control / mana zero / focus loss"


func configure(
    glyph_id: StringName,
    remaining_seconds: float,
    mana_per_real_second: float,
    stock_current: int,
    stock_capacity: int
) -> bool:
    if glyph_id.is_empty() or remaining_seconds < 0.0 or mana_per_real_second < 0.0:
        return false
    if stock_current < 0 or stock_capacity <= 0 or stock_current > stock_capacity:
        return false
    _selected_glyph_id = glyph_id
    _remaining_seconds = remaining_seconds
    _mana_per_real_second = mana_per_real_second
    _stock_current = stock_current
    _stock_capacity = stock_capacity
    _render()
    return true


func update_progress(remaining_seconds: float, stock_current: int) -> bool:
    if remaining_seconds < 0.0 or stock_current < 0 or stock_current > _stock_capacity:
        return false
    _remaining_seconds = remaining_seconds
    _stock_current = stock_current
    _render()
    return true


func show_interruption_risk(interruption_risk: String) -> void:
    _interruption_risk = interruption_risk
    var label := get_node_or_null("Panel/Content/InterruptionRisk")
    if label != null:
        label.text = "Risk: %s" % interruption_risk


func cancel_no_refund() -> Dictionary:
    return {
        "status": &"FOCUS_SCRIBE_CANCEL_REQUESTED",
        "cancel_no_refund": true,
        "stock_gain": 0,
        "glyph_id": _selected_glyph_id,
        "active_pressure_scale": TIME_SCALE_TEST_VALUE,
        "interruption_risk": _interruption_risk,
    }


func contract_snapshot() -> Dictionary:
    return {
        "selected_glyph_id": _selected_glyph_id,
        "remaining_seconds": _remaining_seconds,
        "mana_per_real_second": _mana_per_real_second,
        "stock_current": _stock_current,
        "stock_capacity": _stock_capacity,
        "stock_gain": 1,
        "cancel_no_refund": true,
        "active_pressure_scale": TIME_SCALE_TEST_VALUE,
        "interruption_risk": _interruption_risk,
        "full_pause": false,
    }


func _render() -> void:
    var glyph_label := get_node_or_null("Panel/Content/SelectedGlyph")
    var time_label := get_node_or_null("Panel/Content/RemainingTime")
    var mana_label := get_node_or_null("Panel/Content/ManaDrain")
    var stock_label := get_node_or_null("Panel/Content/StockCapacity")
    if glyph_label != null:
        glyph_label.text = "Glyph: %s" % String(_selected_glyph_id)
    if time_label != null:
        time_label.text = "Remaining: %.1fs" % _remaining_seconds
    if mana_label != null:
        mana_label.text = "Mana: %.1f / real sec" % _mana_per_real_second
    if stock_label != null:
        stock_label.text = "Stock: %s / %s" % [_stock_current, _stock_capacity]

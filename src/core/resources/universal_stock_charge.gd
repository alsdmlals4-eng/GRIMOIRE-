class_name UniversalStockCharge
extends RefCounted

const SELF_PATH := "res://src/core/resources/universal_stock_charge.gd"
const SCHEMA_VERSION := 1

var _required_seconds: float
var _progress_seconds: float = 0.0
var _pause_remaining_seconds: float = 0.0
var _waiting_for_capacity: bool = false


static func create(required_seconds: float):
    if required_seconds <= 0.0:
        return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var charge = script.new()
    charge._required_seconds = required_seconds
    return charge


static func from_dict(data: Dictionary) -> Dictionary:
    if int(data.get("schema_version", -1)) != SCHEMA_VERSION:
        return _corrupt_result()

    var required_seconds := float(data.get("required_seconds", -1.0))
    var progress_seconds := float(data.get("progress_seconds", -1.0))
    var pause_remaining_seconds := float(data.get("pause_remaining_seconds", -1.0))
    var waiting_for_capacity := bool(data.get("waiting_for_capacity", false))

    if required_seconds <= 0.0:
        return _corrupt_result()
    if progress_seconds < 0.0 or progress_seconds > required_seconds:
        return _corrupt_result()
    if pause_remaining_seconds < 0.0:
        return _corrupt_result()
    if waiting_for_capacity and not is_equal_approx(progress_seconds, required_seconds):
        return _corrupt_result()
    if not waiting_for_capacity and is_equal_approx(progress_seconds, required_seconds):
        return _corrupt_result()

    var charge = create(required_seconds)
    if charge == null:
        return _corrupt_result()
    charge._progress_seconds = progress_seconds
    charge._pause_remaining_seconds = pause_remaining_seconds
    charge._waiting_for_capacity = waiting_for_capacity
    return {"status": &"OK", "charge": charge}


func advance_active_pressure(delta_seconds: float, stock_pool) -> void:
    if delta_seconds <= 0.0 or stock_pool == null:
        return

    var remaining := delta_seconds
    if _pause_remaining_seconds > 0.0:
        var paused := minf(remaining, _pause_remaining_seconds)
        _pause_remaining_seconds -= paused
        remaining -= paused
        if remaining <= 0.0:
            return

    if _waiting_for_capacity:
        if stock_pool.add_one():
            _progress_seconds = 0.0
            _waiting_for_capacity = false
        return

    _progress_seconds = minf(_required_seconds, _progress_seconds + remaining)
    if _progress_seconds < _required_seconds:
        return

    if stock_pool.add_one():
        _progress_seconds = 0.0
        _waiting_for_capacity = false
    else:
        _progress_seconds = _required_seconds
        _waiting_for_capacity = true


func apply_direct_hit_pause(seconds: float) -> void:
    if seconds <= 0.0:
        return
    _pause_remaining_seconds = maxf(_pause_remaining_seconds, seconds)


func required_seconds() -> float:
    return _required_seconds


func progress_seconds() -> float:
    return _progress_seconds


func pause_remaining_seconds() -> float:
    return _pause_remaining_seconds


func waiting_for_capacity() -> bool:
    return _waiting_for_capacity


func has_target_glyph() -> bool:
    return false


func to_dict() -> Dictionary:
    return {
        "schema_version": SCHEMA_VERSION,
        "required_seconds": _required_seconds,
        "progress_seconds": _progress_seconds,
        "pause_remaining_seconds": _pause_remaining_seconds,
        "waiting_for_capacity": _waiting_for_capacity,
    }


static func _corrupt_result() -> Dictionary:
    return {"status": &"CORRUPT_UNIVERSAL_STOCK_CHARGE"}

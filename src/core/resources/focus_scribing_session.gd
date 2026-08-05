class_name FocusScribingSession
extends RefCounted

const SELF_PATH := "res://src/core/resources/focus_scribing_session.gd"
const ACTIVE_PRESSURE_SCALE := 0.25
const DEFAULT_DURATION_SECONDS := 10.0
const DEFAULT_MANA_PER_REAL_SECOND := 1.0

var _stock_pool
var _mana_pool
var _glyph_id: StringName = &""
var _event_id: StringName = &""
var _duration_seconds: float = DEFAULT_DURATION_SECONDS
var _mana_per_real_second: float = DEFAULT_MANA_PER_REAL_SECOND
var _elapsed_seconds: float = 0.0
var _mana_fraction: float = 0.0
var _mana_spent: int = 0
var _status: StringName = &"CREATED"
var _terminal_result: Dictionary = {}


static func create(
    stock_pool,
    mana_pool,
    glyph_id: StringName,
    event_id: StringName,
    duration_seconds: float = DEFAULT_DURATION_SECONDS,
    mana_per_real_second: float = DEFAULT_MANA_PER_REAL_SECOND
):
    if stock_pool == null or mana_pool == null:
        return null
    if glyph_id.is_empty() or event_id.is_empty():
        return null
    if duration_seconds <= 0.0 or mana_per_real_second < 0.0:
        return null
    for requirement in [
        [stock_pool, &"reserve_generation"],
        [stock_pool, &"complete_generation"],
        [stock_pool, &"cancel_generation"],
        [mana_pool, &"can_spend"],
        [mana_pool, &"spend"],
    ]:
        if not requirement[0].has_method(requirement[1]):
            return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var session = script.new()
    session._stock_pool = stock_pool
    session._mana_pool = mana_pool
    session._glyph_id = glyph_id
    session._event_id = event_id
    session._duration_seconds = duration_seconds
    session._mana_per_real_second = mana_per_real_second
    return session


func start() -> Dictionary:
    if _status != &"CREATED":
        return {"status": &"FOCUS_SCRIBE_ALREADY_STARTED"}
    var reservation: Dictionary = _stock_pool.reserve_generation(_glyph_id, _event_id)
    if StringName(reservation.get("status", &"")) != &"OK":
        return reservation
    _status = &"ACTIVE"
    return snapshot()


func advance(real_seconds: float) -> Dictionary:
    if not _terminal_result.is_empty():
        return _terminal_result.duplicate(true)
    if _status != &"ACTIVE":
        return {"status": &"FOCUS_SCRIBE_NOT_ACTIVE"}
    if real_seconds <= 0.0:
        return {"status": &"INVALID_REAL_SECONDS"}

    var remaining_seconds: float = maxf(_duration_seconds - _elapsed_seconds, 0.0)
    var applied_seconds: float = minf(real_seconds, remaining_seconds)
    _mana_fraction += applied_seconds * _mana_per_real_second
    var mana_due: int = floori(_mana_fraction)
    if mana_due > 0:
        if not _mana_pool.can_spend(mana_due):
            return interrupt(&"MANA_ZERO")
        if not _mana_pool.spend(mana_due):
            return interrupt(&"MANA_ZERO")
        _mana_spent += mana_due
        _mana_fraction -= float(mana_due)

    _elapsed_seconds += applied_seconds
    if _elapsed_seconds + 0.0001 >= _duration_seconds:
        var completed: Dictionary = _stock_pool.complete_generation(_event_id)
        if StringName(completed.get("status", &"")) != &"TYPED_STOCK_CREATED":
            return interrupt(&"STOCK_GENERATION_FAILED")
        _status = &"COMPLETED"
        _terminal_result = {
            "status": &"FOCUS_SCRIBE_COMPLETED",
            "glyph_id": _glyph_id,
            "event_id": _event_id,
            "stock_gain": 1,
            "mana_spent": _mana_spent,
            "elapsed_real_seconds": _elapsed_seconds,
            "active_pressure_scale": ACTIVE_PRESSURE_SCALE,
        }
        return _terminal_result.duplicate(true)
    return snapshot()


func interrupt(reason: StringName) -> Dictionary:
    if not _terminal_result.is_empty():
        return _terminal_result.duplicate(true)
    if _status != &"ACTIVE":
        return {"status": &"FOCUS_SCRIBE_NOT_ACTIVE"}
    if reason.is_empty():
        return {"status": &"INVALID_INTERRUPTION_REASON"}
    _stock_pool.cancel_generation(_event_id)
    _status = &"INTERRUPTED"
    _terminal_result = {
        "status": &"FOCUS_SCRIBE_INTERRUPTED",
        "reason": reason,
        "glyph_id": _glyph_id,
        "event_id": _event_id,
        "stock_gain": 0,
        "mana_spent": _mana_spent,
        "refund": 0,
        "cancel_no_refund": true,
        "elapsed_real_seconds": _elapsed_seconds,
        "active_pressure_scale": ACTIVE_PRESSURE_SCALE,
    }
    return _terminal_result.duplicate(true)


func cancel() -> Dictionary:
    return interrupt(&"PLAYER_CANCELLED")


func snapshot() -> Dictionary:
    return {
        "status": _status,
        "glyph_id": _glyph_id,
        "event_id": _event_id,
        "duration_seconds": _duration_seconds,
        "elapsed_real_seconds": _elapsed_seconds,
        "remaining_seconds": maxf(_duration_seconds - _elapsed_seconds, 0.0),
        "mana_per_real_second": _mana_per_real_second,
        "mana_spent": _mana_spent,
        "stock_gain": 1,
        "cancel_no_refund": true,
        "interruption_risk": true,
        "active_pressure_scale": ACTIVE_PRESSURE_SCALE,
    }

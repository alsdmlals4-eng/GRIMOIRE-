class_name FocusScribeRecognitionCoordinator
extends RefCounted

const GlyphResourceTypes = preload("res://src/core/resources/glyph_resource_types.gd")

var _service = null
var _vault = null
var _stock = null
var _selected_glyph_id: StringName = &""
var _reservation_id: StringName = &""
var _terminal_result: Dictionary = {}


func _init(
    service = null,
    vault = null,
    stock = null,
    selected_glyph_id: StringName = &"",
    reservation_id: StringName = &""
) -> void:
    _service = service
    _vault = vault
    _stock = stock
    _selected_glyph_id = selected_glyph_id
    _reservation_id = reservation_id


func accept_candidate(candidate, current_revision: int) -> Dictionary:
    if not _terminal_result.is_empty():
        return _terminal_result.duplicate(true)

    var reservation_result := _active_reservation()
    if reservation_result.get("status", &"") != &"OK":
        return reservation_result.duplicate(true)
    if candidate == null or not candidate.has_method("glyph_id"):
        return {"status": &"NO_VALID_INPUT"}

    var accepted: Dictionary = _service.accept(candidate, current_revision)
    if accepted.get("status", &"") != &"ACCEPTED":
        return accepted.duplicate(true)
    if StringName(candidate.glyph_id()) != _selected_glyph_id:
        return {
            "status": &"RECOGNIZED_GLYPH_DOES_NOT_MATCH_SELECTED",
            "selected_glyph_id": _selected_glyph_id,
            "recognized_glyph_id": StringName(candidate.glyph_id()),
            "input_revision": current_revision,
        }
    if not bool(_vault.complete_scribe(_reservation_id)):
        return {"status": &"INVALID_SCRIBE_RESERVATION"}

    _terminal_result = {
        "status": &"VAULT_GLYPH_CREATED",
        "glyph_id": _selected_glyph_id,
        "input_revision": current_revision,
        "reservation_id": _reservation_id,
    }
    return _terminal_result.duplicate(true)


func interrupt(reason: StringName) -> Dictionary:
    if not _terminal_result.is_empty():
        return _terminal_result.duplicate(true)

    var reservation_result := _active_reservation()
    if reservation_result.get("status", &"") != &"OK":
        return reservation_result.duplicate(true)
    if String(reason).is_empty():
        return {"status": &"INVALID_INTERRUPTION_REASON"}
    if not bool(_vault.release(_reservation_id)):
        return {"status": &"INVALID_SCRIBE_RESERVATION"}

    _terminal_result = {
        "status": &"SCRIBE_INTERRUPTED",
        "reason": reason,
        "glyph_id": _selected_glyph_id,
        "reservation_id": _reservation_id,
    }
    return _terminal_result.duplicate(true)


func selected_glyph_id() -> StringName:
    return _selected_glyph_id


func reservation_id() -> StringName:
    return _reservation_id


func _active_reservation() -> Dictionary:
    if _service == null or _vault == null or _stock == null:
        return {"status": &"INVALID_SCRIBE_RESERVATION"}
    if String(_selected_glyph_id).is_empty() or String(_reservation_id).is_empty():
        return {"status": &"INVALID_SCRIBE_RESERVATION"}
    var record: Dictionary = _vault.reservation_record(_reservation_id)
    if record.is_empty():
        return {"status": &"INVALID_SCRIBE_RESERVATION"}
    if int(record.get("slot_state", -1)) != GlyphResourceTypes.VaultSlotState.RESERVED_FOR_SCRIBE:
        return {"status": &"INVALID_SCRIBE_RESERVATION"}
    if StringName(record.get("glyph_id", &"")) != _selected_glyph_id:
        return {"status": &"INVALID_SCRIBE_RESERVATION"}
    return {"status": &"OK"}

class_name Stage2RecognitionBridge
extends RefCounted

const SELF_PATH := "res://src/core/stage2/stage2_recognition_bridge.gd"

var _state = null
var _vault = null
var _recorder = null


static func create(state, vault, recorder):
    if state == null or vault == null or recorder == null:
        return null
    for requirement in [
        [state, &"mark_recognition_retry"],
        [vault, &"reserve_for_scribe"],
        [vault, &"complete_scribe"],
        [recorder, &"record"],
    ]:
        if not requirement[0].has_method(requirement[1]):
            return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var bridge = script.new()
    bridge._state = state
    bridge._vault = vault
    bridge._recorder = recorder
    return bridge


func accept_to_vault(
    recognition_result: Dictionary,
    selected_glyph_id: StringName,
    transaction_id: StringName,
    attempt_phase: StringName,
    event_id: StringName
) -> Dictionary:
    var source_status := StringName(recognition_result.get("status", &"NO_VALID_INPUT"))
    var recognized_glyph_id := StringName(recognition_result.get("glyph_id", &""))
    var final_status := source_status
    var reservation_id := StringName()

    if source_status != &"ACCEPTED":
        _state.mark_recognition_retry(source_status)
    elif selected_glyph_id.is_empty() or recognized_glyph_id != selected_glyph_id:
        final_status = &"RECOGNIZED_GLYPH_DOES_NOT_MATCH_SELECTED"
        _state.mark_recognition_retry(final_status)
    elif transaction_id.is_empty():
        final_status = &"INVALID_SCRIBE_REQUEST"
        _state.mark_recognition_retry(final_status)
    else:
        var reserved: Dictionary = _vault.reserve_for_scribe(selected_glyph_id, transaction_id)
        if reserved.get("status", &"") != &"OK":
            final_status = StringName(reserved.get("status", &"VAULT_WRITE_FAILED"))
            _state.mark_recognition_retry(final_status)
        else:
            reservation_id = StringName(reserved.get("reservation_id", &""))
            if not _vault.complete_scribe(reservation_id):
                _vault.release(reservation_id)
                final_status = &"VAULT_WRITE_FAILED"
                _state.mark_recognition_retry(final_status)
            else:
                final_status = &"VAULT_GLYPH_CREATED"

    _recorder.record(&"RECOGNITION_EVENT_STREAM", event_id, {
        "attempt_phase": attempt_phase,
        "source_status": source_status,
        "status": final_status,
        "selected_glyph_id": selected_glyph_id,
        "recognized_glyph_id": recognized_glyph_id,
        "transaction_id": transaction_id,
    })

    return {
        "status": final_status,
        "glyph_id": selected_glyph_id if final_status == &"VAULT_GLYPH_CREATED" else StringName(),
        "reservation_id": reservation_id,
    }

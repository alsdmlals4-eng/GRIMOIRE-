extends RefCounted

const BRIDGE_PATH := "res://src/core/stage2/stage2_recognition_bridge.gd"
const STATE_PATH := "res://src/core/stage2/stage2_circuit_bridge_state.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const RECORDER_PATH := "res://src/core/stage2/stage2_bridge_event_recorder.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(BRIDGE_PATH), "Stage2 recognition bridge must exist")
    if not FileAccess.file_exists(BRIDGE_PATH):
        return
    var Bridge = load(BRIDGE_PATH)
    var State = load(STATE_PATH)
    var Vault = load(VAULT_PATH)
    var Recorder = load(RECORDER_PATH)
    var scripts_ready := Bridge != null and Bridge.can_instantiate()
    case.assert_true(scripts_ready, "Stage2 recognition bridge must load")
    if not scripts_ready:
        return

    var state = State.new()
    state.configure_scenario({
        "fixture_id": &"SCENARIO_A_NONCOMBAT_PROTECT_CONTROL",
        "objective": "Protect",
        "threat": "Cracks",
        "situation": "Ward failure",
        "targets": [&"ward"],
    })
    state.transition_to(State.State.INTENT_AND_SOURCE_SELECT)
    state.begin_writing()
    var vault = Vault.create(2)
    var recorder = Recorder.create({
        "participant_id": &"P-ANON-002",
        "artifact_sha": "bridge-red-sha",
        "fixture_id": &"SCENARIO_A_NONCOMBAT_PROTECT_CONTROL",
        "hand": &"DOMINANT",
        "device_class": &"PHONE_WIDE",
    })
    var bridge = Bridge.create(state, vault, recorder)
    case.assert_true(bridge != null, "Bridge creates with existing State, Vault, and Recorder")
    if bridge == null:
        return

    var stale := bridge.accept_to_vault(
        {"status": &"STALE_RECOGNITION_RESULT", "glyph_id": &"PROTECT"},
        &"PROTECT", &"scribe-stale", &"FIRST_ATTEMPT", &"rec-stale"
    )
    case.assert_equal(&"STALE_RECOGNITION_RESULT", stale.status, "Stale acceptance is blocked")
    case.assert_equal(0, vault.matching_available_count(&"PROTECT"), "Stale result creates no Vault glyph")

    var mismatch := bridge.accept_to_vault(
        {"status": &"ACCEPTED", "glyph_id": &"FLOW"},
        &"PROTECT", &"scribe-mismatch", &"FIRST_ATTEMPT", &"rec-mismatch"
    )
    case.assert_equal(&"RECOGNIZED_GLYPH_DOES_NOT_MATCH_SELECTED", mismatch.status, "Selection mismatch is blocked")
    case.assert_equal(0, vault.matching_available_count(&"PROTECT"), "Mismatch creates no Vault glyph")

    var accepted := bridge.accept_to_vault(
        {"status": &"ACCEPTED", "glyph_id": &"PROTECT"},
        &"PROTECT", &"scribe-ok", &"POST_FEEDBACK", &"rec-ok"
    )
    case.assert_equal(&"VAULT_GLYPH_CREATED", accepted.status, "Accepted matching glyph writes exact Vault entry")
    case.assert_equal(1, vault.matching_available_count(&"PROTECT"), "Exact selected glyph is available in Vault")
    case.assert_equal(0, vault.matching_available_count(&"FLOW"), "Recognition never creates universal or mismatched stock")

    var exported: Dictionary = recorder.export_data()
    case.assert_equal(3, exported.streams.RECOGNITION_EVENT_STREAM.size(), "Every attempt outcome is logged")
    case.assert_equal(&"POST_FEEDBACK", exported.streams.RECOGNITION_EVENT_STREAM[2].attempt_phase, "Post-feedback is distinct")

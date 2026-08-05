extends RefCounted

const STATE_PATH := "res://src/core/stage2/stage2_circuit_bridge_state.gd"
const FIXTURE_REPOSITORY_PATH := "res://src/core/stage2/stage2_bridge_fixture_repository.gd"
const FIXTURE_PATH := "res://data/testing/stage2_bridge_scenarios.json"
const RECOGNITION_BRIDGE_PATH := "res://src/core/stage2/stage2_recognition_bridge.gd"
const RECORDER_PATH := "res://src/core/stage2/stage2_bridge_event_recorder.gd"
const COORDINATOR_PATH := "res://src/core/stage2/stage2_commit_coordinator.gd"
const VALIDATOR_PATH := "res://src/core/stage2/stage2_circuit_validator.gd"
const STOCK_PATH := "res://src/core/resources/universal_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const MANA_PATH := "res://src/core/resources/mana_pool.gd"
const SERVICE_PATH := "res://src/core/spells/atomic_spell_commit_service.gd"
const REQUEST_PATH := "res://src/core/spells/spell_commit_request.gd"
const RESULT_LEDGER_PATH := "res://src/core/atomic_result_ledger.gd"


func run(case) -> void:
    var State = load(STATE_PATH)
    var FixtureRepository = load(FIXTURE_REPOSITORY_PATH)
    var RecognitionBridge = load(RECOGNITION_BRIDGE_PATH)
    var Recorder = load(RECORDER_PATH)
    var Coordinator = load(COORDINATOR_PATH)
    var Validator = load(VALIDATOR_PATH)
    var Stock = load(STOCK_PATH)
    var Vault = load(VAULT_PATH)
    var Ledger = load(LEDGER_PATH)
    var Mana = load(MANA_PATH)
    var Service = load(SERVICE_PATH)
    var Request = load(REQUEST_PATH)
    var ResultLedger = load(RESULT_LEDGER_PATH)

    var repository = FixtureRepository.create(FIXTURE_PATH)
    var fixture: Dictionary = repository.fixture(&"SCENARIO_A_NONCOMBAT_PROTECT_CONTROL")
    var state = State.new()
    case.assert_true(state.configure_scenario(fixture), "Approved fixture configures state")
    case.assert_true(state.transition_to(State.State.INTENT_AND_SOURCE_SELECT), "Fixture enters intent state")
    case.assert_true(state.select_intent(&"STABILIZE_AND_PROTECT"), "Player intent is explicit")
    case.assert_true(state.begin_writing(), "Writing focus opens")

    var recorder = Recorder.create({
        "participant_id": &"P-ANON-003",
        "artifact_sha": "stage2-e2e-test-sha",
        "fixture_id": &"SCENARIO_A_NONCOMBAT_PROTECT_CONTROL",
        "hand": &"DOMINANT",
        "device_class": &"PHONE_WIDE",
    })
    var vault = Vault.create(2)
    var recognition_bridge = RecognitionBridge.create(state, vault, recorder)
    var recognition: Dictionary = recognition_bridge.accept_to_vault(
        {"status": &"ACCEPTED", "glyph_id": &"PROTECT"},
        &"PROTECT", &"e2e-scribe", &"FIRST_ATTEMPT", &"e2e-recognition"
    )
    case.assert_equal(&"VAULT_GLYPH_CREATED", recognition.status, "Recognition writes exact Vault glyph")
    case.assert_true(state.end_writing(), "Writing focus returns without losing context")

    var stock = Stock.create(1)
    stock.add_one()
    var ledger = Ledger.create(stock, vault)
    var mana = Mana.create(5)
    var service = Service.create(ResultLedger.new())
    var coordinator = Coordinator.create(state, Validator.new(), ledger, mana, service, Request)
    case.assert_true(coordinator.has_method(&"attach_event_recorder"), "Coordinator supports core-loop event recorder")
    if not coordinator.has_method(&"attach_event_recorder"):
        return
    case.assert_true(coordinator.attach_event_recorder(recorder), "Anonymous recorder attaches")

    var nodes := [
        {"id": &"main", "kind": &"MAIN", "cell": Vector2i(1, 1), "glyph_id": &"PROTECT", "source": &"VAULT"},
        {"id": &"support", "kind": &"SUPPORT", "cell": Vector2i(0, 1), "glyph_id": &"FLOW", "source": &"STOCK"},
        {"id": &"target", "kind": &"TARGET", "cell": Vector2i(1, 2), "target_id": &"WARD_CORE"},
    ]
    var edges := [
        {"from": &"main", "to": &"support"},
        {"from": &"main", "to": &"target"},
    ]
    case.assert_equal(
        &"PREVIEW_READY",
        coordinator.prepare_preview(&"e2e-spell", nodes, edges, 3, {
            "effect": &"PROTECT_FLOW",
            "target_valid": true,
            "risk": &"LOW",
        }).status,
        "End-to-end preview succeeds"
    )
    case.assert_true(coordinator.request_confirmation(), "Explicit confirmation opens")
    var committed: Dictionary = coordinator.confirm_commit()
    case.assert_equal(&"COMMITTED", committed.status, "End-to-end confirmed commit succeeds")
    case.assert_equal(State.State.SYSTEM_RESOLVE, state.current_state(), "State advances to system resolve")

    var exported: Dictionary = recorder.export_data()
    case.assert_equal(1, exported.streams.RECOGNITION_EVENT_STREAM.size(), "Recognition stream stays separate")
    case.assert_true(exported.streams.CORE_LOOP_EVENT_STREAM.size() >= 3, "Preview, confirm, and commit are logged")
    case.assert_equal(0, exported.streams.MODERATOR_INTERVENTION_EVENT.size(), "No moderator event is invented")

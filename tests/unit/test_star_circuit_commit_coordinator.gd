extends RefCounted

const COORDINATOR_PATH := "res://src/core/star/star_circuit_commit_coordinator.gd"
const VALIDATOR_PATH := "res://src/core/star/star_circuit_validator.gd"
const CALCULATOR_PATH := "res://src/core/star/star_circuit_calculator.gd"
const STATE_PATH := "res://src/core/star/star_circuit_state.gd"
const STOCK_PATH := "res://src/core/resources/typed_glyph_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const MANA_PATH := "res://src/core/resources/mana_pool.gd"
const REQUEST_PATH := "res://src/core/spells/spell_commit_request.gd"
const SERVICE_PATH := "res://src/core/spells/atomic_spell_commit_service.gd"
const RESULT_LEDGER_PATH := "res://src/core/atomic_result_ledger.gd"


func run(case) -> void:
    var required := [COORDINATOR_PATH, VALIDATOR_PATH, CALCULATOR_PATH, STATE_PATH, STOCK_PATH]
    for path in required:
        case.assert_true(FileAccess.file_exists(path), "Coordinator dependency exists: %s" % path)
    for path in required:
        if not FileAccess.file_exists(path):
            return
    var Coordinator = load(COORDINATOR_PATH)
    case.assert_true(Coordinator != null and Coordinator.can_instantiate(), "Coordinator compiles")
    if Coordinator == null or not Coordinator.can_instantiate():
        return

    var fixture := _fixture()
    var flow := _prepare_flow(fixture, Coordinator)
    case.assert_equal(&"CIRCUIT_PREVIEW_READY", flow.circuit.status, "Circuit preview is ready before target")
    case.assert_true(flow.circuit.has("preview"), "Circuit preview includes target-free numeric preview")
    if flow.circuit.has("preview"):
        case.assert_equal(75, flow.circuit.preview.success_percent, "Target-free one-auxiliary success is visible")
        case.assert_equal(16, flow.circuit.preview.final_mana, "Target-free one-auxiliary mana is visible")
    case.assert_equal(&"FINAL_PREVIEW_READY", flow.final.status, "Target selection creates final preview")
    case.assert_true(flow.coordinator.request_confirmation(), "Explicit confirmation is required")
    var committed: Dictionary = flow.coordinator.confirm_commit()
    case.assert_equal(&"COMMITTED", committed.status, "Confirmed star spell commits")
    case.assert_equal(4, fixture.mana.current(), "Final preview mana is consumed")
    case.assert_equal(0, fixture.stock.matching_count(&"FLOW"), "Stock auxiliary is consumed")
    case.assert_equal(0, fixture.stock.matching_count(&"HEAT"), "FLOW consume never mutates another typed stock")
    case.assert_equal(0, fixture.vault.matching_available_count(&"HEAT"), "Vault main glyph is consumed")
    case.assert_equal(0, fixture.ledger.reservation_count(), "Reservations are cleared")
    var duplicate: Dictionary = flow.coordinator.confirm_commit()
    case.assert_equal(committed, duplicate, "Duplicate commit returns immutable first result")
    case.assert_equal(4, fixture.mana.current(), "Duplicate commit spends no mana")

    var wrong_fixture := _fixture()
    wrong_fixture.stock = load(STOCK_PATH).create(1)
    wrong_fixture.stock.add_one(&"HEAT")
    wrong_fixture.ledger = load(LEDGER_PATH).create(wrong_fixture.stock, wrong_fixture.vault)
    var wrong_flow := _prepare_flow(wrong_fixture, Coordinator)
    case.assert_true(wrong_flow.coordinator.request_confirmation(), "Wrong typed stock fixture reaches confirmation")
    var wrong_result: Dictionary = wrong_flow.coordinator.confirm_commit()
    case.assert_equal(&"NO_MATCHING_TYPED_STOCK", wrong_result.status, "HEAT stock cannot substitute for FLOW")
    case.assert_equal(20, wrong_fixture.mana.current(), "Typed stock mismatch spends no mana")
    case.assert_equal(1, wrong_fixture.stock.matching_count(&"HEAT"), "Typed stock mismatch consumes nothing")

    var cancel_fixture := _fixture()
    var cancel_flow := _prepare_flow(cancel_fixture, Coordinator)
    case.assert_true(cancel_flow.coordinator.request_confirmation(), "Cancel fixture reaches confirmation")
    var before := _resource_state(cancel_fixture)
    case.assert_true(cancel_flow.coordinator.cancel_confirmation(), "Confirmation can be cancelled")
    case.assert_equal(before, _resource_state(cancel_fixture), "Cancel mutates no stock, vault, reservation or mana")
    case.assert_equal(&"COMMIT_CONFIRMATION_REQUIRED", cancel_flow.coordinator.confirm_commit().status, "Cancelled flow cannot commit")


func _fixture() -> Dictionary:
    var Stock = load(STOCK_PATH)
    var Vault = load(VAULT_PATH)
    var Ledger = load(LEDGER_PATH)
    var Mana = load(MANA_PATH)
    var Service = load(SERVICE_PATH)
    var ResultLedger = load(RESULT_LEDGER_PATH)
    var stock = Stock.create(1)
    stock.add_one(&"FLOW")
    var vault = Vault.create(1)
    var scribe: Dictionary = vault.reserve_for_scribe(&"HEAT", &"seed")
    vault.complete_scribe(scribe.reservation_id)
    var ledger = Ledger.create(stock, vault)
    var mana = Mana.create(20)
    return {
        "stock": stock,
        "vault": vault,
        "ledger": ledger,
        "mana": mana,
        "service": Service.create(ResultLedger.new()),
        "request": load(REQUEST_PATH),
        "state": load(STATE_PATH).new(),
        "validator": load(VALIDATOR_PATH).new(),
        "calculator": load(CALCULATOR_PATH).new(),
    }


func _prepare_flow(fixture: Dictionary, Coordinator) -> Dictionary:
    fixture.state.configure_scenario({
        "fixture_id": &"frostbloom",
        "objective": "Protect bloom",
        "threat": "Cold surge",
        "situation": "Ward failing",
        "target_keywords": [&"flower", &"ward"],
    })
    fixture.state.transition_to(fixture.state.State.CIRCUIT_EDIT)
    var coordinator = Coordinator.create(
        fixture.state, fixture.validator, fixture.calculator, fixture.ledger,
        fixture.mana, fixture.service, fixture.request
    )
    var main := {"glyph_id": &"HEAT", "source": &"VAULT", "mastery": 70, "base_mana": 10, "base_success": 75}
    var auxiliaries := [{"slot": 0, "glyph_id": &"FLOW", "source": &"STOCK", "mastery": 70, "base_mana": 4, "special": &"NORMAL"}]
    var circuit: Dictionary = coordinator.prepare_circuit_preview(&"star-spell", main, auxiliaries)
    var final: Dictionary = coordinator.select_target_and_prepare_final_preview(
        &"flower", {"difficulty": 5, "mana_cost": 0}, {"effect": &"HEAT_FLOW"}
    )
    return {"coordinator": coordinator, "circuit": circuit, "final": final}


func _resource_state(fixture: Dictionary) -> Dictionary:
    return {
        "stock": fixture.stock.to_dict(),
        "vault": fixture.vault.to_dict(),
        "reservations": fixture.ledger.reservation_records(),
        "mana": fixture.mana.to_dict(),
    }

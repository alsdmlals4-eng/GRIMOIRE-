extends RefCounted

const COORDINATOR_PATH := "res://src/core/stage2/stage2_commit_coordinator.gd"
const STATE_PATH := "res://src/core/stage2/stage2_circuit_bridge_state.gd"
const VALIDATOR_PATH := "res://src/core/stage2/stage2_circuit_validator.gd"
const STOCK_PATH := "res://src/core/resources/universal_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const MANA_PATH := "res://src/core/resources/mana_pool.gd"
const SERVICE_PATH := "res://src/core/spells/atomic_spell_commit_service.gd"
const REQUEST_PATH := "res://src/core/spells/spell_commit_request.gd"
const RESULT_LEDGER_PATH := "res://src/core/atomic_result_ledger.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(COORDINATOR_PATH), "Stage2 commit coordinator must exist")
    if not FileAccess.file_exists(COORDINATOR_PATH):
        return

    var Coordinator = load(COORDINATOR_PATH)
    var State = load(STATE_PATH)
    var Validator = load(VALIDATOR_PATH)
    var Stock = load(STOCK_PATH)
    var Vault = load(VAULT_PATH)
    var Ledger = load(LEDGER_PATH)
    var Mana = load(MANA_PATH)
    var Service = load(SERVICE_PATH)
    var Request = load(REQUEST_PATH)
    var ResultLedger = load(RESULT_LEDGER_PATH)
    case.assert_true(Coordinator != null and Coordinator.can_instantiate(), "Stage2 commit coordinator must load")
    if Coordinator == null or not Coordinator.can_instantiate():
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
    state.select_intent(&"STABILIZE_AND_PROTECT")

    var stock = Stock.create(1)
    stock.add_one()
    var vault = Vault.create(1)
    var scribe = vault.reserve_for_scribe(&"PROTECT", &"seed-protect")
    vault.complete_scribe(scribe.reservation_id)
    var ledger = Ledger.create(stock, vault)
    var mana = Mana.create(5)
    var service = Service.create(ResultLedger.new())
    var coordinator = Coordinator.create(state, Validator.new(), ledger, mana, service, Request)
    case.assert_true(coordinator != null, "Coordinator composes existing resource and atomic services")
    if coordinator == null:
        return

    var nodes := [
        {"id": &"main", "kind": &"MAIN", "cell": Vector2i(1, 1), "glyph_id": &"PROTECT", "source": &"VAULT"},
        {"id": &"support", "kind": &"SUPPORT", "cell": Vector2i(0, 1), "glyph_id": &"FLOW", "source": &"STOCK"},
        {"id": &"target", "kind": &"TARGET", "cell": Vector2i(1, 2), "target_id": &"ward"},
    ]
    var edges := [
        {"from": &"main", "to": &"support"},
        {"from": &"main", "to": &"target"},
    ]
    var before_preview := _resource_state(stock, vault, ledger, mana)
    var preview: Dictionary = coordinator.prepare_preview(
        &"stage2-spell-1", nodes, edges, 3,
        {"effect": &"PROTECT_FLOW", "target_valid": true, "risk": &"LOW"}
    )
    case.assert_equal(&"PREVIEW_READY", preview.status, "Valid circuit creates preview")
    case.assert_equal(before_preview, _resource_state(stock, vault, ledger, mana), "Preview reserves and consumes nothing")

    var accidental: Dictionary = coordinator.confirm_commit()
    case.assert_equal(&"COMMIT_CONFIRMATION_REQUIRED", accidental.status, "Commit cannot bypass explicit confirmation")
    case.assert_equal(before_preview, _resource_state(stock, vault, ledger, mana), "Blocked commit mutates nothing")

    case.assert_true(coordinator.request_confirmation(), "Preview opens separate confirmation")
    var before_cancel := _resource_state(stock, vault, ledger, mana)
    case.assert_true(coordinator.cancel_confirmation(), "Cancel returns to preview")
    case.assert_equal(before_cancel, _resource_state(stock, vault, ledger, mana), "Cancel has zero resource mutation")

    case.assert_true(coordinator.request_confirmation(), "Confirmation can be reopened")
    var committed: Dictionary = coordinator.confirm_commit()
    case.assert_equal(&"COMMITTED", committed.status, "Confirmed plan uses existing atomic commit service")
    case.assert_equal(2, mana.current(), "Mana is consumed once")
    case.assert_equal(0, vault.matching_available_count(&"PROTECT"), "Vault glyph is consumed once")
    case.assert_equal(0, stock.current_total(), "Universal stock is consumed once")
    case.assert_equal(0, ledger.reservation_count(), "Reservations clear after commit")

    var duplicate: Dictionary = coordinator.confirm_commit()
    case.assert_equal(committed, duplicate, "Duplicate confirmation returns immutable first result")
    case.assert_equal(2, mana.current(), "Duplicate confirmation spends no more mana")


func _resource_state(stock, vault, ledger, mana) -> Dictionary:
    return {
        "stock": stock.to_dict(),
        "vault": vault.to_dict(),
        "reservations": ledger.reservation_records(),
        "mana": mana.to_dict(),
    }

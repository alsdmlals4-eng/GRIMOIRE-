# v2 coordinator의 Stage 2 Preview와 Stage 3 대상·사용 분리를 검증한다.
extends RefCounted

const COORDINATOR_PATH := "res://src/core/workflow/spell_workflow_coordinator.gd"
const STATE_PATH := "res://src/core/workflow/spell_workflow_state.gd"
const VALIDATOR_PATH := "res://src/core/star/star_circuit_validator.gd"
const CALCULATOR_PATH := "res://src/core/star/star_circuit_calculator.gd"
const SESSION_PATH := "res://src/core/workflow/circuit_placement_session.gd"
const PREPARATION_REQUEST_PATH := "res://src/core/spells/spell_preparation_request.gd"
const PREPARATION_SERVICE_PATH := "res://src/core/spells/atomic_spell_preparation_service.gd"
const USE_REQUEST_PATH := "res://src/core/spells/spell_use_request.gd"
const USE_SERVICE_PATH := "res://src/core/spells/atomic_spell_use_service.gd"
const INVENTORY_PATH := "res://src/core/spells/prepared_spell_inventory.gd"
const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const STOCK_PATH := "res://src/core/resources/typed_glyph_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const MANA_PATH := "res://src/core/resources/mana_pool.gd"
const RESULT_LEDGER_PATH := "res://src/core/atomic_result_ledger.gd"
const TYPES_PATH := "res://src/core/resources/glyph_resource_types.gd"


func _make_ledger():
	var Pool = load(STOCK_PATH)
	var Vault = load(VAULT_PATH)
	var Ledger = load(LEDGER_PATH)
	var stock = Pool.create(3)
	stock.add_one(&"FLOW")
	var vault = Vault.create(1)
	var scribe = vault.reserve_for_scribe(&"HEAT", &"seed-heat")
	vault.complete_scribe(scribe.reservation_id)
	return Ledger.create(stock, vault)


func _glyph(glyph_id: StringName, source: int, is_main := false) -> Dictionary:
	var glyph := {"glyph_id": glyph_id, "source": source, "mastery": 70, "base_mana": 8, "is_learned": true}
	if is_main:
		glyph["base_success"] = 74
	else:
		glyph["special"] = &"NORMAL"
	return glyph


func run(case) -> void:
	case.assert_true(FileAccess.file_exists(COORDINATOR_PATH), "Task 5 coordinator must exist")
	if not FileAccess.file_exists(COORDINATOR_PATH):
		return

	var Coordinator = load(COORDINATOR_PATH)
	var State = load(STATE_PATH)
	var Validator = load(VALIDATOR_PATH)
	var Calculator = load(CALCULATOR_PATH)
	var Session = load(SESSION_PATH)
	var PreparationRequest = load(PREPARATION_REQUEST_PATH)
	var PreparationService = load(PREPARATION_SERVICE_PATH)
	var UseRequest = load(USE_REQUEST_PATH)
	var UseService = load(USE_SERVICE_PATH)
	var Inventory = load(INVENTORY_PATH)
	var ManaPool = load(MANA_PATH)
	var ResultLedger = load(RESULT_LEDGER_PATH)
	var Types = load(TYPES_PATH)
	case.assert_true(Coordinator != null and Coordinator.can_instantiate(), "SpellWorkflowCoordinator must compile")
	if Coordinator == null or State == null or Validator == null or Calculator == null or Session == null or PreparationRequest == null or PreparationService == null or UseRequest == null or UseService == null or Inventory == null or ManaPool == null or ResultLedger == null:
		return

	var ledger = _make_ledger()
	var inventory = Inventory.new()
	var mana = ManaPool.create(50, 50)
	var results = ResultLedger.new()
	var state = State.new()
	var coordinator = Coordinator.create(state, Validator.new(), Calculator.new(), PreparationService, PreparationRequest, UseService, UseRequest, ledger, inventory, mana, results)
	case.assert_true(coordinator != null, "coordinator accepts only explicit domain authorities")
	if coordinator == null:
		return

	var placement = Session.create(&"prepare-coordinator", ledger)
	placement.place_main(_glyph(&"HEAT", Types.Source.VAULT, true))
	placement.place_auxiliary(0, _glyph(&"FLOW", Types.TYPED_STOCK))
	case.assert_true(coordinator.configure_preparation(&"prepare-coordinator", placement.draft()), "coordinator accepts a reserved Stage 2 draft")
	var base = coordinator.prepare_preview()
	case.assert_equal(&"CIRCUIT_PREVIEW_READY", base.status, "Stage 2 creates only immutable circuit preview")
	case.assert_equal(&"", base.preview.target_keyword, "Stage 2 preview passes an empty target to calculator")
	case.assert_equal(50, mana.current(), "Stage 2 preview spends no mana")
	case.assert_equal(State.State.CIRCUIT_PREVIEW, state.current_state(), "Stage 2 remains before spell readiness")

	var prepared = coordinator.confirm_preparation(&"spell-coordinator")
	case.assert_equal(&"PREPARED", prepared.status, "confirmation consumes glyphs and creates READY spell")
	case.assert_equal(50, mana.current(), "Stage 2 preparation still spends no mana")
	case.assert_equal(State.State.SPELL_READY, state.current_state(), "prepared spell unlocks Stage 3")
	case.assert_true(coordinator.select_prepared_spell(&"spell-coordinator"), "player explicitly selects a prepared spell")
	var invalid_target = coordinator.prepare_target_preview(&"FORGED", {"target_valid": false}, {"effect": &"FORGED"})
	case.assert_equal(&"INVALID_TARGET", invalid_target.status, "coordinator never promotes an unvalidated target")
	var first_final = coordinator.prepare_target_preview(&"WARD", {"difficulty": 4, "mana_cost": 3, "target_valid": true}, {"effect": &"PROTECT_WARD"})
	case.assert_equal(&"FINAL_PREVIEW_READY", first_final.status, "first valid target produces a Stage 3 final preview")
	case.assert_equal(&"WARD", first_final.preview.target_keyword, "first final preview carries its selected target keyword")
	var final = coordinator.prepare_target_preview(&"FROSTBLOOM", {"difficulty": 6, "mana_cost": 5, "target_valid": true}, {"effect": &"FREEZE_FROSTBLOOM"})
	case.assert_equal(&"FINAL_PREVIEW_READY", final.status, "a second valid target refreshes the unconfirmed final preview")
	case.assert_equal(&"FROSTBLOOM", Dictionary(final.get("preview", {})).get("target_keyword", &""), "replacement final preview carries the new target keyword")
	case.assert_equal(&"READY", inventory.spell(&"spell-coordinator").status, "retargeting leaves the prepared spell ready")
	case.assert_equal(50, mana.current(), "retargeting spends no mana")
	case.assert_equal({}, results.serialize(), "retargeting commits no result transaction")
	case.assert_equal(State.State.SPELL_USE_PREVIEW, state.current_state(), "replacement target returns to an unconfirmed final preview")
	if StringName(final.get("status", &"")) != &"FINAL_PREVIEW_READY":
		return
	case.assert_equal(&"", inventory.spell(&"spell-coordinator").base_preview.target_keyword, "prepared Stage 2 base preview remains target-free")
	case.assert_true(coordinator.request_use_confirmation(), "use needs separate explicit confirmation")
	var used = coordinator.confirm_use(&"use-coordinator")
	case.assert_equal(&"USED", used.status, "confirmed Stage 3 use commits atomically")
	case.assert_equal(State.State.SYSTEM_RESOLVE, state.current_state(), "successful use alone enters resolution")
	case.assert_true(results.has_result(&"use-coordinator"), "coordinator commits exactly one result")
	case.assert_equal(50 - int(final.preview.final_mana), mana.current(), "coordinator spends only final Stage 3 mana")

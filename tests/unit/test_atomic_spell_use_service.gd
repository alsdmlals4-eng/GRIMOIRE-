# Stage 3 주문 사용의 Mana·PreparedSpell·결과 원자성과 정확히 한 번 계약을 검증한다.
extends RefCounted

const REQUEST_PATH := "res://src/core/spells/spell_use_request.gd"
const SERVICE_PATH := "res://src/core/spells/atomic_spell_use_service.gd"
const PREPARED_SPELL_PATH := "res://src/core/spells/prepared_spell.gd"
const INVENTORY_PATH := "res://src/core/spells/prepared_spell_inventory.gd"
const MANA_PATH := "res://src/core/resources/mana_pool.gd"
const RESULT_LEDGER_PATH := "res://src/core/atomic_result_ledger.gd"


class ResultCommitFailureDouble:
	extends RefCounted

	var _delegate

	static func create(delegate):
		var double = ResultCommitFailureDouble.new()
		double._delegate = delegate
		return double

	func commit_once(transaction_id: StringName, payload: Dictionary) -> Dictionary:
		_delegate.commit_once(transaction_id, payload)
		return {"applied": false, "transaction_id": transaction_id, "result": {}}

	func serialize() -> Dictionary:
		return _delegate.serialize()

	func restore(snapshot: Dictionary) -> void:
		_delegate.restore(snapshot)


func _make_inventory(PreparedSpell, Inventory, spell_id: StringName):
	var inventory = Inventory.new()
	var spell = PreparedSpell.create(
		spell_id,
		{"glyph_id": &"HEAT"},
		[{"glyph_id": &"STABILIZE", "slot": 0}],
		{"success_percent": 71, "final_mana": 7},
		[{"record_id": &"stage2-source"}]
	)
	inventory.add_once(StringName("prepare-%s" % spell_id), spell)
	return inventory


func _valid_request(Request, use_transaction_id: StringName, spell_id: StringName, target_valid := true):
	return Request.create(
		use_transaction_id,
		spell_id,
		&"WARD",
		{"success_percent": 79, "final_mana": 7, "target_keyword": &"WARD"},
		{"target_valid": target_valid, "target_keyword": &"WARD", "effect": &"PROTECT_WARD"}
	)


func run(case) -> void:
	var required_paths := [REQUEST_PATH, SERVICE_PATH]
	for path in required_paths:
		case.assert_true(FileAccess.file_exists(path), "Task 5 implementation must exist: %s" % path)
	if not FileAccess.file_exists(REQUEST_PATH) or not FileAccess.file_exists(SERVICE_PATH):
		return

	var Request = load(REQUEST_PATH)
	var Service = load(SERVICE_PATH)
	var PreparedSpell = load(PREPARED_SPELL_PATH)
	var Inventory = load(INVENTORY_PATH)
	var ManaPool = load(MANA_PATH)
	var ResultLedger = load(RESULT_LEDGER_PATH)
	case.assert_true(Request != null and Request.can_instantiate(), "SpellUseRequest must compile")
	case.assert_true(Service != null and Service.can_instantiate(), "AtomicSpellUseService must compile")
	if Request == null or Service == null or PreparedSpell == null or Inventory == null or ManaPool == null or ResultLedger == null:
		return

	var invalid_inventory = _make_inventory(PreparedSpell, Inventory, &"invalid-target-spell")
	var invalid_mana = ManaPool.create(20, 20)
	var invalid_results = ResultLedger.new()
	var invalid_request = _valid_request(Request, &"use-invalid-target", &"invalid-target-spell", false)
	var invalid_inventory_before = invalid_inventory.serialize()
	var invalid_mana_before = invalid_mana.to_dict()
	var invalid_results_before = invalid_results.serialize()
	var invalid_result = Service.use(invalid_request, invalid_inventory, invalid_mana, invalid_results)
	case.assert_equal(&"INVALID_TARGET", invalid_result.status, "invalid target rejects before every Stage 3 mutation")
	case.assert_equal(invalid_inventory_before, invalid_inventory.serialize(), "invalid target leaves READY spell snapshot unchanged")
	case.assert_equal(invalid_mana_before, invalid_mana.to_dict(), "invalid target spends no mana")
	case.assert_equal(invalid_results_before, invalid_results.serialize(), "invalid target commits no result")

	var insufficient_inventory = _make_inventory(PreparedSpell, Inventory, &"insufficient-spell")
	var insufficient_mana = ManaPool.create(6, 6)
	var insufficient_results = ResultLedger.new()
	var insufficient_request = _valid_request(Request, &"use-insufficient", &"insufficient-spell")
	var insufficient_inventory_before = insufficient_inventory.serialize()
	var insufficient_results_before = insufficient_results.serialize()
	var insufficient_result = Service.use(insufficient_request, insufficient_inventory, insufficient_mana, insufficient_results)
	case.assert_equal(&"INSUFFICIENT_MANA", insufficient_result.status, "insufficient mana rejects before use")
	case.assert_equal(insufficient_inventory_before, insufficient_inventory.serialize(), "insufficient mana leaves spell READY")
	case.assert_equal(6, insufficient_mana.current(), "insufficient mana spends nothing")
	case.assert_equal(insufficient_results_before, insufficient_results.serialize(), "insufficient mana commits no result")

	var success_inventory = _make_inventory(PreparedSpell, Inventory, &"success-spell")
	var success_mana = ManaPool.create(20, 20)
	var success_results = ResultLedger.new()
	var success_request = _valid_request(Request, &"use-success", &"success-spell")
	var used = Service.use(success_request, success_inventory, success_mana, success_results)
	case.assert_equal(&"USED", used.status, "valid Stage 3 use succeeds")
	case.assert_equal(13, success_mana.current(), "successful use spends only final_mana once")
	case.assert_equal(&"USED", success_inventory.spell(&"success-spell").status, "successful use marks one prepared spell USED")
	case.assert_true(success_results.has_result(&"use-success"), "successful use commits one result")

	var results_after_first = success_results.serialize()
	var replay = Service.use(success_request, success_inventory, success_mana, success_results)
	case.assert_equal(used, replay, "same use transaction returns the original exact result")
	var tampered_replay = Request.create(
		&"use-success",
		&"success-spell",
		&"WARD",
		{"success_percent": 1, "final_mana": 99, "target_keyword": &"WARD"},
		{"target_valid": true, "target_keyword": &"WARD", "effect": &"FORGED"}
	)
	case.assert_equal(used, Service.use(tampered_replay, success_inventory, success_mana, success_results), "tampered retry returns original exact use result")
	case.assert_equal(13, success_mana.current(), "same use transaction spends no additional mana")
	case.assert_equal(results_after_first, success_results.serialize(), "same use transaction commits no additional result")

	var reuse_request = _valid_request(Request, &"use-reuse", &"success-spell")
	var reuse_result = Service.use(reuse_request, success_inventory, success_mana, success_results)
	case.assert_equal(&"SPELL_ALREADY_USED", reuse_result.status, "another transaction cannot reuse an already used spell")
	case.assert_equal(13, success_mana.current(), "rejected reuse spends no mana")
	case.assert_equal(results_after_first, success_results.serialize(), "rejected reuse commits no result")

	var rollback_inventory = _make_inventory(PreparedSpell, Inventory, &"rollback-spell")
	var rollback_mana = ManaPool.create(20, 20)
	var rollback_results = ResultLedger.new()
	var rollback_request = _valid_request(Request, &"use-rollback", &"rollback-spell")
	var rollback_inventory_before = rollback_inventory.serialize()
	var rollback_mana_before = rollback_mana.to_dict()
	var rollback_results_before = rollback_results.serialize()
	var rollback_result = Service.use(
		rollback_request,
		rollback_inventory,
		rollback_mana,
		ResultCommitFailureDouble.create(rollback_results)
	)
	case.assert_equal(&"RESULT_COMMIT_FAILED", rollback_result.status, "result apply failure is explicit")
	case.assert_equal(rollback_inventory_before, rollback_inventory.serialize(), "result failure restores READY spell exactly")
	case.assert_equal(rollback_mana_before, rollback_mana.to_dict(), "result failure restores mana exactly")
	case.assert_equal(rollback_results_before, rollback_results.serialize(), "result failure restores result ledger exactly")

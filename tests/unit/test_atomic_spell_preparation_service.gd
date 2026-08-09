# Stage 2 원자 준비의 글자 소비·재고 기록·롤백을 검증한다.
extends RefCounted

const SESSION_PATH := "res://src/core/workflow/circuit_placement_session.gd"
const REQUEST_PATH := "res://src/core/spells/spell_preparation_request.gd"
const SERVICE_PATH := "res://src/core/spells/atomic_spell_preparation_service.gd"
const PREPARED_SPELL_PATH := "res://src/core/spells/prepared_spell.gd"
const INVENTORY_PATH := "res://src/core/spells/prepared_spell_inventory.gd"
const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const STOCK_PATH := "res://src/core/resources/typed_glyph_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const TYPES_PATH := "res://src/core/resources/glyph_resource_types.gd"


func _make_ledger():
	var Pool = load(STOCK_PATH)
	var Vault = load(VAULT_PATH)
	var Ledger = load(LEDGER_PATH)
	var stock = Pool.create(3)
	stock.add_one(&"FLOW")
	stock.add_one(&"PROTECT")
	var vault = Vault.create(1)
	var scribe = vault.reserve_for_scribe(&"HEAT", &"seed-heat")
	vault.complete_scribe(scribe.reservation_id)
	return Ledger.create(stock, vault)


func _glyph(glyph_id: StringName, source: int) -> Dictionary:
	return {"glyph_id": glyph_id, "source": source, "is_learned": true}


func _valid_request(Session, Request, ledger, Types, transaction_id: StringName, spell_id: StringName):
	var session = Session.create(transaction_id, ledger)
	session.place_main(_glyph(&"HEAT", Types.Source.VAULT))
	session.place_auxiliary(0, _glyph(&"FLOW", Types.TYPED_STOCK))
	return Request.create(
		transaction_id,
		spell_id,
		session.draft(),
		{"success_percent": 70, "final_mana": 11}
	)


func run(case) -> void:
	var required_paths := [SESSION_PATH, REQUEST_PATH, SERVICE_PATH]
	for path in required_paths:
		case.assert_true(FileAccess.file_exists(path), "Task 4 implementation must exist: %s" % path)
	if not FileAccess.file_exists(SESSION_PATH) or not FileAccess.file_exists(REQUEST_PATH) or not FileAccess.file_exists(SERVICE_PATH):
		return

	var Session = load(SESSION_PATH)
	var Request = load(REQUEST_PATH)
	var Service = load(SERVICE_PATH)
	var PreparedSpell = load(PREPARED_SPELL_PATH)
	var Inventory = load(INVENTORY_PATH)
	var Types = load(TYPES_PATH)
	case.assert_true(Session != null and Session.can_instantiate(), "CircuitPlacementSession must compile")
	case.assert_true(Request != null and Request.can_instantiate(), "SpellPreparationRequest must compile")
	case.assert_true(Service != null and Service.can_instantiate(), "AtomicSpellPreparationService must compile")
	if Session == null or Request == null or Service == null or PreparedSpell == null or Inventory == null:
		return

	var ledger = _make_ledger()
	var inventory = Inventory.new()
	var request = _valid_request(Session, Request, ledger, Types, &"prepare-1", &"spell-1")
	case.assert_true(request != null, "valid reserved FIVE_POINT_STAR draft creates a preparation request")
	if request == null:
		return
	var before_mana_estimate = request.base_preview().final_mana
	var prepared = Service.prepare(request, ledger, inventory)
	case.assert_equal(&"PREPARED", prepared.status, "valid Stage 2 preparation consumes glyph reservations and prepares once")
	case.assert_equal(2, prepared.consumed_count, "one main and one auxiliary glyph are consumed")
	case.assert_equal(before_mana_estimate, request.base_preview().final_mana, "Stage 2 retains mana estimate without any mana mutation")
	case.assert_equal(&"READY", inventory.spell(&"spell-1").status, "prepared spell enters immutable inventory as READY")
	case.assert_equal(0, ledger.reservation_records_for_transaction(&"prepare-1").size(), "prepared transaction no longer owns reservations")

	var replay = Service.prepare(request, ledger, inventory)
	case.assert_equal(prepared, replay, "same preparation transaction returns the original result")
	case.assert_equal(1, inventory.serialize().spells.size(), "idempotent retry creates no duplicate spell")

	var invalid_ledger = _make_ledger()
	case.assert_true(Request.create(&"invalid-layout", &"spell-invalid-layout", {"layout": &"THREE_BY_THREE", "main": {"glyph_id": &"HEAT"}, "auxiliaries": [], "reservation_records": []}, {"success_percent": 50, "final_mana": 9}) == null, "non-star draft is rejected")
	case.assert_true(Request.create(&"missing-layout", &"spell-missing-layout", {"main": {"glyph_id": &"HEAT"}, "auxiliaries": [], "reservation_records": []}, {"success_percent": 50, "final_mana": 9}) == null, "draft must state FIVE_POINT_STAR explicitly")
	var invalid_request = Request.create(
		&"missing-reservation",
		&"spell-invalid",
		{"layout": &"FIVE_POINT_STAR", "main": {"glyph_id": &"HEAT"}, "auxiliaries": [], "reservation_records": []},
		{"success_percent": 50, "final_mana": 9}
	)
	var invalid_inventory = Inventory.new()
	var invalid_result = Service.prepare(invalid_request, invalid_ledger, invalid_inventory)
	case.assert_equal(&"INVALID_RESERVATION", invalid_result.status, "missing reservation fails before consumption")
	case.assert_true(invalid_inventory.spell(&"spell-invalid").is_empty(), "invalid reservation writes no prepared spell")

	var conflict_ledger = _make_ledger()
	var conflict_inventory = Inventory.new()
	var existing = PreparedSpell.create(
		&"spell-conflict",
		{"glyph_id": &"HEAT"},
		[],
		{"success_percent": 10, "final_mana": 2},
		[]
	)
	conflict_inventory.add_once(&"existing-preparation", existing)
	var conflict_request = _valid_request(Session, Request, conflict_ledger, Types, &"prepare-conflict", &"spell-conflict")
	var conflict_before_ledger = conflict_ledger.snapshot_state()
	var conflict_before_inventory = conflict_inventory.serialize()
	var conflict_result = Service.prepare(conflict_request, conflict_ledger, conflict_inventory)
	case.assert_equal(&"INVENTORY_CONFLICT", conflict_result.status, "existing spell ID rejects a different preparation")
	case.assert_equal(conflict_before_ledger, conflict_ledger.snapshot_state(), "inventory conflict restores every glyph reservation")
	case.assert_equal(conflict_before_inventory, conflict_inventory.serialize(), "inventory conflict preserves inventory atomically")

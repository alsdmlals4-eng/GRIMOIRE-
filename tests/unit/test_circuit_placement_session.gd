# Stage 2 배치 세션의 예약·교체·거래 격리를 검증한다.
extends RefCounted

const SESSION_PATH := "res://src/core/workflow/circuit_placement_session.gd"
const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const STOCK_PATH := "res://src/core/resources/typed_glyph_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const TYPES_PATH := "res://src/core/resources/glyph_resource_types.gd"


func _make_ledger():
	var Pool = load(STOCK_PATH)
	var Vault = load(VAULT_PATH)
	var Ledger = load(LEDGER_PATH)
	var stock = Pool.create(4)
	stock.add_one(&"HEAT")
	stock.add_one(&"FLOW")
	stock.add_one(&"PROTECT")
	var vault = Vault.create(2)
	var heat_scribe = vault.reserve_for_scribe(&"HEAT", &"seed-heat")
	var flow_scribe = vault.reserve_for_scribe(&"FLOW", &"seed-flow")
	vault.complete_scribe(heat_scribe.reservation_id)
	vault.complete_scribe(flow_scribe.reservation_id)
	return Ledger.create(stock, vault)


func _glyph(glyph_id: StringName, source: int) -> Dictionary:
	return {
		"glyph_id": glyph_id,
		"source": source,
		"is_learned": true,
	}


func run(case) -> void:
	case.assert_true(FileAccess.file_exists(SESSION_PATH), "CircuitPlacementSession implementation must exist")
	if not FileAccess.file_exists(SESSION_PATH):
		return

	var Session = load(SESSION_PATH)
	var Types = load(TYPES_PATH)
	case.assert_true(Session != null and Session.can_instantiate(), "CircuitPlacementSession must compile")
	if Session == null or not Session.can_instantiate():
		return

	var ledger = _make_ledger()
	var other_transaction := &"other-placement"
	var other_reservation = ledger.reserve_node(&"other:main", &"PROTECT", Types.TYPED_STOCK, other_transaction, true)
	case.assert_equal(&"OK", other_reservation.status, "fixture transaction reserves independently")

	var session = Session.create(&"placement-1", ledger)
	case.assert_true(session != null, "placement session factory succeeds")
	if session == null:
		return
	var methods: Array = session.get_method_list()
	var place_main_args := -1
	for method in methods:
		if String(method.name) == "place_main":
			place_main_args = Array(method.args).size()
	case.assert_equal(1, place_main_args, "placement API accepts glyph only and no mana object")

	var main = session.place_main(_glyph(&"HEAT", Types.TYPED_STOCK))
	case.assert_equal(&"OK", main.status, "main placement reserves immediately")
	case.assert_false(ledger.reservation_for_node(&"placement-1:main").is_empty(), "main reservation is owned by the session node")

	var aux = session.place_auxiliary(0, _glyph(&"FLOW", Types.TYPED_STOCK))
	case.assert_equal(&"OK", aux.status, "auxiliary placement reserves immediately")
	var replacement = session.place_auxiliary(0, _glyph(&"FLOW", Types.Source.VAULT))
	case.assert_equal(&"OK", replacement.status, "replacement reserves an explicitly selected source")
	case.assert_equal(Types.Source.VAULT, ledger.reservation_for_node(&"placement-1:aux-0").source, "replacement releases old source before retaining new one")

	var draft = session.draft()
	case.assert_equal(&"HEAT", draft.main.glyph_id, "draft retains main glyph")
	case.assert_equal(1, draft.auxiliaries.size(), "draft sorts one auxiliary")
	case.assert_equal(0, draft.auxiliaries[0].slot, "draft preserves the auxiliary vertex slot")
	case.assert_equal(2, draft.reservation_records.size(), "draft exposes only this transaction reservations")

	var reset = session.reset()
	case.assert_equal(&"OK", reset.status, "reset releases this session")
	case.assert_equal(0, ledger.reservation_records_for_transaction(&"placement-1").size(), "reset releases all current transaction nodes")
	case.assert_equal(1, ledger.reservation_records_for_transaction(other_transaction).size(), "reset keeps another transaction untouched")
	case.assert_equal(&"INVALID_NODE_KEY", session.remove_node(&"aux-not-a-slot").status, "malformed auxiliary node key cannot alias slot zero")

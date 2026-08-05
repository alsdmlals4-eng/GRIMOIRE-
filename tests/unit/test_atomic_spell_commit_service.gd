extends RefCounted

const STOCK_PATH := "res://src/core/resources/universal_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const TYPES_PATH := "res://src/core/resources/glyph_resource_types.gd"
const MANA_PATH := "res://src/core/resources/mana_pool.gd"
const REQUEST_PATH := "res://src/core/spells/spell_commit_request.gd"
const SERVICE_PATH := "res://src/core/spells/atomic_spell_commit_service.gd"
const RESULT_LEDGER_PATH := "res://src/core/atomic_result_ledger.gd"

class RejectingResultLedger:
    extends RefCounted

    func result_for(_transaction_id: StringName) -> Dictionary:
        return {}

    func commit_once(transaction_id: StringName, _payload: Dictionary) -> Dictionary:
        return {
            "applied": false,
            "transaction_id": transaction_id,
            "result": {},
            "error": &"INJECTED_RESULT_FAILURE",
        }

    func serialize() -> Dictionary:
        return {}

    func restore(_value: Dictionary) -> void:
        pass


func run(case) -> void:
    var required_paths := [MANA_PATH, REQUEST_PATH, SERVICE_PATH]
    var all_exist := true
    for path in required_paths:
        var exists: bool = bool(FileAccess.file_exists(path))
        case.assert_true(exists, "Task 6 file must exist: %s" % path)
        all_exist = all_exist and exists
    if not all_exist:
        return

    var Stock = load(STOCK_PATH)
    var Vault = load(VAULT_PATH)
    var Ledger = load(LEDGER_PATH)
    var Types = load(TYPES_PATH)
    var Mana = load(MANA_PATH)
    var Request = load(REQUEST_PATH)
    var Service = load(SERVICE_PATH)
    var ResultLedger = load(RESULT_LEDGER_PATH)

    var scripts := [Mana, Request, Service]
    var scripts_ready := true
    for script in scripts:
        var ready: bool = bool(script != null and script.can_instantiate())
        case.assert_true(ready, "Task 6 script must load and compile")
        scripts_ready = scripts_ready and ready
    if not scripts_ready:
        return

    var fixture = _make_fixture(Stock, Vault, Ledger, Mana, ResultLedger, Service, 5)
    case.assert_true(fixture.service != null, "AtomicSpellCommitService factory succeeds")
    case.assert_true(fixture.mana != null, "ManaPool factory succeeds")
    if fixture.service == null or fixture.mana == null:
        return

    var ledger_methods := [
        &"reservation_records_for_transaction",
        &"validate_transaction",
        &"consume_transaction",
        &"snapshot_state",
        &"restore_state",
    ]
    var ledger_ready := true
    for method_name in ledger_methods:
        var exists: bool = bool(fixture.ledger.has_method(method_name))
        case.assert_true(exists, "Ledger transaction method must exist: %s" % String(method_name))
        ledger_ready = ledger_ready and exists
    case.assert_true(fixture.stock.has_method(&"restore_state"), "Stock state must support rollback")
    case.assert_true(fixture.vault.has_method(&"restore_state"), "Vault state must support rollback")
    if not ledger_ready:
        return

    var reserved = _reserve_spell(fixture, Types, &"spell-1")
    case.assert_equal(&"OK", reserved.heat.status, "HEAT reserved")
    case.assert_equal(&"OK", reserved.flow.status, "FLOW reserved")

    var request = Request.create(&"spell-1", 3, {"effect": &"HEAT_FLOW", "target_valid": true})
    var first = fixture.service.commit(request, fixture.ledger, fixture.mana)
    case.assert_equal(&"COMMITTED", first.status, "valid transaction commits")
    case.assert_equal(2, fixture.mana.current(), "mana is consumed")
    case.assert_equal(0, fixture.vault.matching_available_count(&"HEAT"), "Vault entry is consumed")
    case.assert_equal(0, fixture.stock.current_total(), "Stock is consumed")
    case.assert_equal(0, fixture.ledger.reservation_count(), "transaction reservations are cleared")

    var duplicate = fixture.service.commit(request, fixture.ledger, fixture.mana)
    case.assert_equal(first, duplicate, "duplicate transaction returns immutable first result")
    case.assert_equal(2, fixture.mana.current(), "duplicate does not spend mana")

    var low_mana = _make_fixture(Stock, Vault, Ledger, Mana, ResultLedger, Service, 2)
    _reserve_spell(low_mana, Types, &"spell-low")
    var low_before = _state(low_mana)
    var low_result = low_mana.service.commit(
        Request.create(&"spell-low", 3, {"effect": &"HEAT_FLOW", "target_valid": true}),
        low_mana.ledger,
        low_mana.mana
    )
    case.assert_equal(&"INSUFFICIENT_MANA", low_result.status, "insufficient mana fails preflight")
    case.assert_equal(low_before, _state(low_mana), "mana failure mutates nothing")

    var invalid_target = _make_fixture(Stock, Vault, Ledger, Mana, ResultLedger, Service, 5)
    _reserve_spell(invalid_target, Types, &"spell-target")
    var target_before = _state(invalid_target)
    var target_result = invalid_target.service.commit(
        Request.create(&"spell-target", 3, {"effect": &"HEAT_FLOW", "target_valid": false}),
        invalid_target.ledger,
        invalid_target.mana
    )
    case.assert_equal(&"INVALID_TARGET", target_result.status, "invalid target fails preflight")
    case.assert_equal(target_before, _state(invalid_target), "target failure mutates nothing")

    var missing = _make_fixture(Stock, Vault, Ledger, Mana, ResultLedger, Service, 5)
    var missing_before = _state(missing)
    var missing_result = missing.service.commit(
        Request.create(&"spell-missing", 3, {"effect": &"HEAT_FLOW", "target_valid": true}),
        missing.ledger,
        missing.mana
    )
    case.assert_equal(&"MISSING_RESERVATION", missing_result.status, "transaction requires reservations")
    case.assert_equal(missing_before, _state(missing), "missing reservation mutates nothing")

    var rollback = _make_fixture(Stock, Vault, Ledger, Mana, ResultLedger, Service, 5)
    _reserve_spell(rollback, Types, &"spell-rollback")
    rollback.service = Service.create(RejectingResultLedger.new())
    var rollback_before = _state(rollback)
    var rollback_result = rollback.service.commit(
        Request.create(&"spell-rollback", 3, {"effect": &"HEAT_FLOW", "target_valid": true}),
        rollback.ledger,
        rollback.mana
    )
    case.assert_equal(&"ROLLED_BACK", rollback_result.status, "result failure rolls transaction back")
    case.assert_equal(rollback_before, _state(rollback), "rollback restores resources, reservations, and mana")


func _make_fixture(Stock, Vault, Ledger, Mana, ResultLedger, Service, mana_value: int) -> Dictionary:
    var stock = Stock.create(1)
    stock.add_one()
    var vault = Vault.create(1)
    var scribe = vault.reserve_for_scribe(&"HEAT", &"seed-vault")
    vault.complete_scribe(scribe.reservation_id)
    var ledger = Ledger.create(stock, vault)
    var mana = Mana.create(mana_value)
    var result_ledger = ResultLedger.new()
    var service = Service.create(result_ledger)
    return {
        "stock": stock,
        "vault": vault,
        "ledger": ledger,
        "mana": mana,
        "result_ledger": result_ledger,
        "service": service,
    }


func _reserve_spell(fixture: Dictionary, Types, transaction_id: StringName) -> Dictionary:
    var heat = fixture.ledger.reserve_node(
        &"main", &"HEAT", Types.Source.VAULT, transaction_id, true
    )
    var flow = fixture.ledger.reserve_node(
        &"support", &"FLOW", Types.Source.UNIVERSAL_STOCK, transaction_id, true
    )
    return {"heat": heat, "flow": flow}


func _state(fixture: Dictionary) -> Dictionary:
    return {
        "stock": fixture.stock.to_dict(),
        "vault": fixture.vault.to_dict(),
        "reservations": fixture.ledger.reservation_records(),
        "mana": fixture.mana.to_dict(),
    }

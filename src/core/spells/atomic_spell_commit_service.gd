class_name AtomicSpellCommitService
extends RefCounted

const SELF_PATH := "res://src/core/spells/atomic_spell_commit_service.gd"

var _result_ledger


static func create(result_ledger):
    if result_ledger == null:
        return null
    for method_name in [&"result_for", &"commit_once", &"serialize", &"restore"]:
        if not result_ledger.has_method(method_name):
            return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var service = script.new()
    service._result_ledger = result_ledger
    return service


func commit(request, resource_ledger, mana_pool) -> Dictionary:
    if request == null or resource_ledger == null or mana_pool == null:
        return {"status": &"INVALID_REQUEST"}
    for method_name in [&"transaction_id", &"mana_cost", &"result_payload"]:
        if not request.has_method(method_name):
            return {"status": &"INVALID_REQUEST"}

    var transaction_id: StringName = request.transaction_id()
    var prior: Dictionary = _result_ledger.result_for(transaction_id)
    if not prior.is_empty():
        return prior.duplicate(true)

    var payload: Dictionary = request.result_payload()
    if not bool(payload.get("target_valid", true)):
        return {"status": &"INVALID_TARGET", "transaction_id": transaction_id}

    var reservations: Array = resource_ledger.reservation_records_for_transaction(transaction_id)
    if reservations.is_empty():
        return {"status": &"MISSING_RESERVATION", "transaction_id": transaction_id}
    if not resource_ledger.validate_transaction(transaction_id):
        return {"status": &"INVALID_RESERVATION", "transaction_id": transaction_id}
    if not mana_pool.can_spend(request.mana_cost()):
        return {"status": &"INSUFFICIENT_MANA", "transaction_id": transaction_id}

    var resource_snapshot: Dictionary = resource_ledger.snapshot_state()
    var mana_snapshot: Dictionary = mana_pool.to_dict()
    var result_snapshot: Dictionary = _result_ledger.serialize()

    var consumed: Dictionary = resource_ledger.consume_transaction(transaction_id)
    if consumed.get("status", &"") != &"OK":
        return _rollback(
            transaction_id,
            &"RESOURCE_CONSUME_FAILED",
            resource_ledger,
            resource_snapshot,
            mana_pool,
            mana_snapshot,
            result_snapshot
        )

    if not mana_pool.spend(request.mana_cost()):
        return _rollback(
            transaction_id,
            &"MANA_SPEND_FAILED",
            resource_ledger,
            resource_snapshot,
            mana_pool,
            mana_snapshot,
            result_snapshot
        )

    var committed := {
        "status": &"COMMITTED",
        "transaction_id": transaction_id,
        "mana_cost": request.mana_cost(),
        "result": payload.duplicate(true),
    }
    var applied: Dictionary = _result_ledger.commit_once(transaction_id, committed)
    if not bool(applied.get("applied", false)):
        return _rollback(
            transaction_id,
            &"RESULT_APPLY_FAILED",
            resource_ledger,
            resource_snapshot,
            mana_pool,
            mana_snapshot,
            result_snapshot
        )
    return Dictionary(applied.get("result", {})).duplicate(true)


func _rollback(
    transaction_id: StringName,
    reason: StringName,
    resource_ledger,
    resource_snapshot: Dictionary,
    mana_pool,
    mana_snapshot: Dictionary,
    result_snapshot: Dictionary
) -> Dictionary:
    var resource_restored: bool = bool(resource_ledger.restore_state(resource_snapshot))
    var mana_restored: bool = bool(mana_pool.restore_state(mana_snapshot))
    _result_ledger.restore(result_snapshot)
    if not resource_restored or not mana_restored:
        return {
            "status": &"RESOURCE_STATE_CORRUPT",
            "transaction_id": transaction_id,
            "reason": reason,
        }
    return {
        "status": &"ROLLED_BACK",
        "transaction_id": transaction_id,
        "reason": reason,
    }

class_name AtomicResultLedger
extends RefCounted

var _results: Dictionary = {}


func commit_once(transaction_id: StringName, payload: Dictionary) -> Dictionary:
    var key := String(transaction_id)
    if _results.has(key):
        return {
            "applied": false,
            "transaction_id": transaction_id,
            "result": _results[key].duplicate(true),
        }

    var result := payload.duplicate(true)
    _results[key] = result.duplicate(true)
    return {
        "applied": true,
        "transaction_id": transaction_id,
        "result": result.duplicate(true),
    }


func result_for(transaction_id: StringName) -> Dictionary:
    var key := String(transaction_id)
    if not _results.has(key):
        return {}
    return _results[key].duplicate(true)


func has_result(transaction_id: StringName) -> bool:
    return _results.has(String(transaction_id))


func serialize() -> Dictionary:
    return _results.duplicate(true)


func restore(value: Dictionary) -> void:
    _results = value.duplicate(true)

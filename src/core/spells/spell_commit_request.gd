class_name SpellCommitRequest
extends RefCounted

const SELF_PATH := "res://src/core/spells/spell_commit_request.gd"

var _transaction_id: StringName
var _mana_cost: int
var _result_payload: Dictionary


static func create(transaction_id: StringName, mana_cost: int, result_payload: Dictionary):
    if transaction_id == StringName() or mana_cost < 0:
        return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var request = script.new()
    request._transaction_id = transaction_id
    request._mana_cost = mana_cost
    request._result_payload = result_payload.duplicate(true)
    return request


func transaction_id() -> StringName:
    return _transaction_id


func mana_cost() -> int:
    return _mana_cost


func result_payload() -> Dictionary:
    return _result_payload.duplicate(true)

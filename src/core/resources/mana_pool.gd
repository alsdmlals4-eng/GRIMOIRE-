class_name ManaPool
extends RefCounted

const SELF_PATH := "res://src/core/resources/mana_pool.gd"
const SCHEMA_VERSION := 1

var _capacity: int
var _current: int


static func create(initial_mana: int, capacity: int = -1):
    var resolved_capacity := capacity
    if resolved_capacity < 0:
        resolved_capacity = initial_mana
    if initial_mana < 0 or resolved_capacity < 0 or initial_mana > resolved_capacity:
        return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var pool = script.new()
    pool._capacity = resolved_capacity
    pool._current = initial_mana
    return pool


static func from_dict(data: Dictionary) -> Dictionary:
    if int(data.get("schema_version", -1)) != SCHEMA_VERSION:
        return {"status": &"CORRUPT_MANA"}
    var capacity := int(data.get("capacity", -1))
    var current := int(data.get("current", -1))
    var pool = create(current, capacity)
    if pool == null:
        return {"status": &"CORRUPT_MANA"}
    return {"status": &"OK", "mana": pool}


func current() -> int:
    return _current


func capacity() -> int:
    return _capacity


func can_spend(amount: int) -> bool:
    return amount >= 0 and amount <= _current


func spend(amount: int) -> bool:
    if not can_spend(amount):
        return false
    _current -= amount
    return true


func refund(amount: int) -> bool:
    if amount < 0 or _current + amount > _capacity:
        return false
    _current += amount
    return true


func restore_state(data: Dictionary) -> bool:
    var script = load(SELF_PATH)
    var restored = script.from_dict(data)
    if restored.get("status", &"") != &"OK":
        return false
    var mana = restored.mana
    _capacity = mana._capacity
    _current = mana._current
    return true


func to_dict() -> Dictionary:
    return {
        "schema_version": SCHEMA_VERSION,
        "capacity": _capacity,
        "current": _current,
    }

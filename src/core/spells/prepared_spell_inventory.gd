# 준비된 주문의 불변 payload와 정확히 한 번 사용 수명주기를 관리한다.
class_name PreparedSpellInventory
extends RefCounted

const PREPARED_SPELL_PATH := "res://src/core/spells/prepared_spell.gd"

var _spells_by_id: Dictionary = {}
var _spell_id_by_preparation_transaction: Dictionary = {}
var _use_transaction_by_spell_id: Dictionary = {}


func add_once(preparation_transaction_id: StringName, spell) -> Dictionary:
    var preparation_key := String(preparation_transaction_id)
    if preparation_key.is_empty():
        return {"ok": false, "code": &"PREPARATION_TRANSACTION_ID_REQUIRED"}
    if _spell_id_by_preparation_transaction.has(preparation_key):
        return _add_success(StringName(_spell_id_by_preparation_transaction[preparation_key]))

    if spell == null or not spell.has_method("serialize"):
        return {"ok": false, "code": &"INVALID_PREPARED_SPELL"}
    var payload: Dictionary = spell.serialize()
    var PreparedSpell = load(PREPARED_SPELL_PATH)
    if PreparedSpell == null:
        return {"ok": false, "code": &"INVALID_PREPARED_SPELL"}
    var validated = PreparedSpell.from_serialized(payload)
    if validated == null:
        return {"ok": false, "code": &"INVALID_PREPARED_SPELL"}

    var spell_key := String(validated.spell_id())
    if _spells_by_id.has(spell_key):
        return {"ok": false, "code": &"SPELL_ID_CONFLICT"}
    _spells_by_id[spell_key] = validated.serialize().duplicate(true)
    _spell_id_by_preparation_transaction[preparation_key] = spell_key
    return _add_success(StringName(spell_key))


func spell(spell_id: StringName) -> Dictionary:
    var spell_key := String(spell_id)
    if not _spells_by_id.has(spell_key):
        return {}
    var public_payload: Dictionary = _spells_by_id[spell_key].duplicate(true)
    public_payload["status"] = &"USED" if _use_transaction_by_spell_id.has(spell_key) else &"READY"
    return public_payload


func mark_used_once(spell_id: StringName, use_transaction_id: StringName) -> Dictionary:
    var spell_key := String(spell_id)
    var use_key := String(use_transaction_id)
    if spell_key.is_empty():
        return {"ok": false, "code": &"SPELL_ID_REQUIRED"}
    if use_key.is_empty():
        return {"ok": false, "code": &"USE_TRANSACTION_ID_REQUIRED"}
    if not _spells_by_id.has(spell_key):
        return {"ok": false, "code": &"SPELL_NOT_FOUND"}

    if _use_transaction_by_spell_id.has(spell_key):
        if _use_transaction_by_spell_id[spell_key] == use_key:
            return _use_success(StringName(spell_key), StringName(use_key))
        return {"ok": false, "code": &"SPELL_ALREADY_USED"}

    for owned_use_transaction in _use_transaction_by_spell_id.values():
        if owned_use_transaction == use_key:
            return {"ok": false, "code": &"USE_TRANSACTION_CONFLICT"}

    _use_transaction_by_spell_id[spell_key] = use_key
    return _use_success(StringName(spell_key), StringName(use_key))


func serialize() -> Dictionary:
    var spell_keys := _spells_by_id.keys()
    spell_keys.sort()
    var spells: Array = []
    for spell_key in spell_keys:
        spells.append({
            "spell_id": StringName(spell_key),
            "payload": _spells_by_id[spell_key].duplicate(true),
        })

    var preparation_keys := _spell_id_by_preparation_transaction.keys()
    preparation_keys.sort()
    var preparations: Array = []
    for preparation_key in preparation_keys:
        preparations.append({
            "preparation_transaction_id": StringName(preparation_key),
            "spell_id": StringName(_spell_id_by_preparation_transaction[preparation_key]),
        })

    var use_spell_keys := _use_transaction_by_spell_id.keys()
    use_spell_keys.sort()
    var uses: Array = []
    for spell_key in use_spell_keys:
        uses.append({
            "spell_id": StringName(spell_key),
            "use_transaction_id": StringName(_use_transaction_by_spell_id[spell_key]),
        })

    return {
        "spells": spells,
        "preparation_transactions": preparations,
        "use_transactions": uses,
    }


func restore(value: Dictionary) -> bool:
    if not value.has("spells") or not value.has("preparation_transactions") or not value.has("use_transactions"):
        return false
    if typeof(value.spells) != TYPE_ARRAY or typeof(value.preparation_transactions) != TYPE_ARRAY or typeof(value.use_transactions) != TYPE_ARRAY:
        return false

    var PreparedSpell = load(PREPARED_SPELL_PATH)
    if PreparedSpell == null:
        return false
    var candidate_spells: Dictionary = {}
    for spell_record in value.spells:
        if typeof(spell_record) != TYPE_DICTIONARY or not spell_record.has("spell_id") or not spell_record.has("payload"):
            return false
        var spell_key := String(spell_record.spell_id)
        if spell_key.is_empty() or candidate_spells.has(spell_key) or typeof(spell_record.payload) != TYPE_DICTIONARY:
            return false
        var prepared = PreparedSpell.from_serialized(spell_record.payload)
        if prepared == null or String(prepared.spell_id()) != spell_key:
            return false
        candidate_spells[spell_key] = prepared.serialize().duplicate(true)

    var candidate_preparations: Dictionary = {}
    var prepared_spell_ids: Dictionary = {}
    for preparation_record in value.preparation_transactions:
        if typeof(preparation_record) != TYPE_DICTIONARY or not preparation_record.has("preparation_transaction_id") or not preparation_record.has("spell_id"):
            return false
        var preparation_key := String(preparation_record.preparation_transaction_id)
        var prepared_spell_key := String(preparation_record.spell_id)
        if preparation_key.is_empty() or prepared_spell_key.is_empty():
            return false
        if candidate_preparations.has(preparation_key) or prepared_spell_ids.has(prepared_spell_key):
            return false
        if not candidate_spells.has(prepared_spell_key):
            return false
        candidate_preparations[preparation_key] = prepared_spell_key
        prepared_spell_ids[prepared_spell_key] = true
    if candidate_preparations.size() != candidate_spells.size():
        return false

    var candidate_uses: Dictionary = {}
    var owned_use_transactions: Dictionary = {}
    for use_record in value.use_transactions:
        if typeof(use_record) != TYPE_DICTIONARY or not use_record.has("spell_id") or not use_record.has("use_transaction_id"):
            return false
        var used_spell_key := String(use_record.spell_id)
        var use_key := String(use_record.use_transaction_id)
        if used_spell_key.is_empty() or use_key.is_empty():
            return false
        if candidate_uses.has(used_spell_key) or owned_use_transactions.has(use_key):
            return false
        if not candidate_spells.has(used_spell_key):
            return false
        candidate_uses[used_spell_key] = use_key
        owned_use_transactions[use_key] = true

    _spells_by_id = candidate_spells.duplicate(true)
    _spell_id_by_preparation_transaction = candidate_preparations.duplicate(true)
    _use_transaction_by_spell_id = candidate_uses.duplicate(true)
    return true


func _add_success(spell_id: StringName) -> Dictionary:
    return {
        "ok": true,
        "code": &"PREPARED_SPELL_STORED",
        "spell": spell(spell_id),
    }


func _use_success(spell_id: StringName, use_transaction_id: StringName) -> Dictionary:
    return {
        "ok": true,
        "code": &"SPELL_MARKED_USED",
        "spell_id": spell_id,
        "use_transaction_id": use_transaction_id,
    }

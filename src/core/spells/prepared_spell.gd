# 준비된 주문의 불변 payload 값을 보관한다.
class_name PreparedSpell
extends RefCounted

const SELF_PATH := "res://src/core/spells/prepared_spell.gd"

var _payload: Dictionary = {}


static func create(
    spell_id: StringName,
    main: Dictionary,
    auxiliaries: Array,
    base_preview: Dictionary,
    source_records: Array
):
    if String(spell_id).is_empty():
        return null
    if main.is_empty():
        return null
    if auxiliaries.size() > 5:
        return null
    if not base_preview.has("success_percent") or not base_preview.has("final_mana"):
        return null

    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var prepared = script.new()
    prepared._payload = {
        "spell_id": spell_id,
        "layout": &"FIVE_POINT_STAR",
        "main": main.duplicate(true),
        "auxiliaries": auxiliaries.duplicate(true),
        "base_preview": base_preview.duplicate(true),
        "source_records": source_records.duplicate(true),
        "status": &"READY",
    }
    return prepared


static func from_serialized(payload: Dictionary):
    if payload.get("status", StringName()) != &"READY":
        return null
    if not payload.has("spell_id") or not payload.has("main"):
        return null
    if not payload.has("auxiliaries") or not payload.has("base_preview") or not payload.has("source_records"):
        return null
    if typeof(payload.main) != TYPE_DICTIONARY or typeof(payload.auxiliaries) != TYPE_ARRAY:
        return null
    if typeof(payload.base_preview) != TYPE_DICTIONARY or typeof(payload.source_records) != TYPE_ARRAY:
        return null
    var prepared = create(
        StringName(String(payload.spell_id)),
        payload.main,
        payload.auxiliaries,
        payload.base_preview,
        payload.source_records
    )
    if prepared == null:
        return null
    if payload.get("layout", StringName()) != &"FIVE_POINT_STAR":
        return null
    return prepared


func spell_id() -> StringName:
    return _payload.spell_id


func serialize() -> Dictionary:
    return _payload.duplicate(true)

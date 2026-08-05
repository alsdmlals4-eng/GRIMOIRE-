class_name StarCircuitValidator
extends RefCounted

const VALID_SOURCES := [&"VAULT", &"STOCK"]
const VALID_SPECIALS := [&"NORMAL", &"PRECISION", &"REDUCTION"]

func validate(main: Dictionary, auxiliaries: Array) -> Dictionary:
    var main_error := _validate_glyph(main, true)
    if not main_error.is_empty():
        return _invalid(main_error)
    if auxiliaries.size() > 5:
        return _invalid(&"AUXILIARY_COUNT_EXCEEDED")

    var used_slots: Dictionary = {}
    var used_glyphs: Dictionary = {}
    for item in auxiliaries:
        if typeof(item) != TYPE_DICTIONARY:
            return _invalid(&"INVALID_AUXILIARY")
        var auxiliary: Dictionary = item
        if StringName(auxiliary.get("kind", &"")) == &"TARGET" or auxiliary.has("target_id"):
            return _invalid(&"TARGET_NODE_PROHIBITED")
        var slot_value: Variant = auxiliary.get("slot", null)
        if typeof(slot_value) != TYPE_INT:
            return _invalid(&"INVALID_VERTEX")
        var slot := int(slot_value)
        if slot < 0 or slot > 4:
            return _invalid(&"INVALID_VERTEX")
        if used_slots.has(slot):
            return _invalid(&"DUPLICATE_VERTEX")
        var error := _validate_glyph(auxiliary, false)
        if not error.is_empty():
            return _invalid(error)
        var glyph_id := StringName(auxiliary.get("glyph_id", &""))
        if used_glyphs.has(glyph_id):
            return _invalid(&"DUPLICATE_AUXILIARY_GLYPH")
        used_slots[slot] = true
        used_glyphs[glyph_id] = true

    return {
        "status": &"OK",
        "valid": true,
        "layout": &"FIVE_POINT_STAR",
        "main_position": &"CENTER",
        "auxiliary_count": auxiliaries.size(),
        "target_nodes_inside_circuit": false,
        "slot_order_effect": false,
        "auto_corrected": false,
    }

func _validate_glyph(glyph: Dictionary, is_main: bool) -> StringName:
    if glyph.is_empty():
        return &"MAIN_GLYPH_REQUIRED" if is_main else &"INVALID_AUXILIARY"
    if StringName(glyph.get("glyph_id", &"")).is_empty():
        return &"MISSING_GLYPH_ID"
    if StringName(glyph.get("source", &"")) not in VALID_SOURCES:
        return &"MISSING_GLYPH_SOURCE"
    var mastery := float(glyph.get("mastery", -1.0))
    if mastery < 0.0 or mastery > 100.0:
        return &"MASTERY_OUT_OF_RANGE"
    if int(glyph.get("base_mana", -1)) < 0:
        return &"INVALID_BASE_MANA"
    if is_main:
        if int(glyph.get("base_success", -1)) < 0:
            return &"INVALID_BASE_SUCCESS"
    elif StringName(glyph.get("special", &"NORMAL")) not in VALID_SPECIALS:
        return &"INVALID_SPECIAL_AUXILIARY"
    return &""

func _invalid(status: StringName) -> Dictionary:
    return {"status": status, "valid": false, "auto_corrected": false}

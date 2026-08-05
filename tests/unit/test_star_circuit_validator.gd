extends RefCounted

const PATH := "res://src/core/star/star_circuit_validator.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Star circuit validator must exist")
    if not FileAccess.file_exists(PATH):
        return
    var script = load(PATH)
    case.assert_true(script != null and script.can_instantiate(), "Star validator must load")
    if script == null or not script.can_instantiate():
        return
    var validator = script.new()
    var main := {"glyph_id": &"HEAT", "source": &"VAULT", "mastery": 70, "base_mana": 10, "base_success": 75}
    var auxiliaries := [
        {"slot": 0, "glyph_id": &"FLOW", "source": &"STOCK", "mastery": 70, "base_mana": 4, "special": &"NORMAL"},
        {"slot": 4, "glyph_id": &"FOCUS", "source": &"VAULT", "mastery": 60, "base_mana": 4, "special": &"NORMAL"},
    ]
    var valid: Dictionary = validator.validate(main, auxiliaries)
    case.assert_equal(&"OK", valid.status, "Center main and 0-5 equal vertices are valid")
    case.assert_equal(2, valid.auxiliary_count, "Auxiliary count is reported")
    var duplicate_slots := auxiliaries.duplicate(true)
    duplicate_slots[1]["slot"] = 0
    case.assert_equal(&"DUPLICATE_VERTEX", validator.validate(main, duplicate_slots).status, "Each vertex is unique")
    var duplicate_glyphs := auxiliaries.duplicate(true)
    duplicate_glyphs[1]["glyph_id"] = &"FLOW"
    case.assert_equal(&"DUPLICATE_AUXILIARY_GLYPH", validator.validate(main, duplicate_glyphs).status, "Duplicate auxiliary glyph is prohibited")
    var target_inside := auxiliaries.duplicate(true)
    target_inside.append({"slot": 2, "kind": &"TARGET", "target_id": &"door"})
    case.assert_equal(&"TARGET_NODE_PROHIBITED", validator.validate(main, target_inside).status, "Targets never live inside the star circuit")
    var too_many := auxiliaries.duplicate(true)
    for i in range(3, 7):
        too_many.append({"slot": i % 5, "glyph_id": StringName("G%s" % i), "source": &"STOCK", "mastery": 50, "base_mana": 1, "special": &"NORMAL"})
    case.assert_equal(&"AUXILIARY_COUNT_EXCEEDED", validator.validate(main, too_many).status, "At most five auxiliaries are allowed")

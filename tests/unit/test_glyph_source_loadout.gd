extends RefCounted

const LOADOUT_PATH := "res://src/core/workflow/glyph_source_loadout.gd"


func _ids(values: Array) -> Array[StringName]:
    var ids: Array[StringName] = []
    for value in values:
        ids.append(StringName(value))
    return ids


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(LOADOUT_PATH), "glyph_source_loadout.gd must exist")
    if not FileAccess.file_exists(LOADOUT_PATH):
        return

    var Loadout = load(LOADOUT_PATH)
    case.assert_true(Loadout != null and Loadout.can_instantiate(), "GlyphSourceLoadout must compile")
    if Loadout == null or not Loadout.can_instantiate():
        return

    var valid = Loadout.create(_ids([&"HEAT"]), _ids([&"COOL"]))
    case.assert_true(valid != null, "one Vault and one Stock glyph is a valid loadout")
    if valid != null:
        var data: Dictionary = valid.to_dict()
        case.assert_equal([&"HEAT"], data.vault_ids, "Vault ids are preserved")
        case.assert_equal([&"COOL"], data.stock_ids, "Stock ids are preserved")
        case.assert_equal(1, data.count, "equal source count is exposed")
        case.assert_equal(5, data.maximum_each, "maximum count is fixed at five")
        data.vault_ids.append(&"FLOW")
        case.assert_equal([&"HEAT"], valid.to_dict().vault_ids, "serialized loadout is a defensive copy")

    case.assert_true(Loadout.create(_ids([&"HEAT", &"FLOW"]), _ids([&"COOL"])) == null, "unequal source counts fail")
    case.assert_true(Loadout.create(_ids([]), _ids([])) == null, "zero-count loadout fails")
    case.assert_true(
        Loadout.create(
            _ids([&"HEAT", &"FLOW", &"PROTECT", &"FOCUS", &"DISPERSE", &"MEND"]),
            _ids([&"COOL", &"MEND", &"STABILIZE", &"SUSTAIN", &"AMPLIFY", &"HEAT"])
        ) == null,
        "six glyphs per source fails"
    )
    case.assert_true(Loadout.create(_ids([&"UNKNOWN"]), _ids([&"COOL"])) == null, "unknown catalog ids fail")

extends GutTest

const GlyphSourceLoadout = preload("res://src/core/workflow/glyph_source_loadout.gd")


func _ids(values: Array) -> Array[StringName]:
    var ids: Array[StringName] = []
    for value in values:
        ids.append(StringName(value))
    return ids


func test_equal_one_by_one_loadout_exposes_copied_source_lists() -> void:
    var loadout = GlyphSourceLoadout.create(_ids([&"HEAT"]), _ids([&"COOL"]))

    assert_not_null(loadout)
    var data: Dictionary = loadout.to_dict()
    assert_eq(data.vault_ids, [&"HEAT"])
    assert_eq(data.stock_ids, [&"COOL"])
    assert_eq(data.count, 1)
    assert_eq(data.maximum_each, 5)
    data.vault_ids.append(&"FLOW")
    assert_eq(loadout.to_dict().vault_ids, [&"HEAT"])


func test_loadout_rejects_unequal_empty_too_large_and_unknown_catalog_inputs() -> void:
    assert_null(GlyphSourceLoadout.create(_ids([&"HEAT", &"FLOW"]), _ids([&"COOL"])))
    assert_null(GlyphSourceLoadout.create(_ids([]), _ids([])))
    assert_null(GlyphSourceLoadout.create(
        _ids([&"HEAT", &"FLOW", &"PROTECT", &"FOCUS", &"DISPERSE", &"MEND"]),
        _ids([&"COOL", &"MEND", &"STABILIZE", &"SUSTAIN", &"AMPLIFY", &"HEAT"])
    ))
    assert_null(GlyphSourceLoadout.create(_ids([&"UNKNOWN"]), _ids([&"COOL"])))

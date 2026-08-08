extends RefCounted

const CATALOG_PATH := "res://src/core/glyphs/glyph_catalog.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(CATALOG_PATH), "glyph_catalog.gd must exist")
    if not FileAccess.file_exists(CATALOG_PATH):
        return

    var catalog = load(CATALOG_PATH)
    case.assert_true(catalog != null and catalog.can_instantiate(), "GlyphCatalog compiles")
    if catalog == null or not catalog.can_instantiate():
        return

    var expected_ids: Array[StringName] = [
        &"HEAT", &"FLOW", &"PROTECT", &"COOL", &"MEND",
        &"FOCUS", &"DISPERSE", &"STABILIZE", &"SUSTAIN", &"AMPLIFY",
    ]
    case.assert_equal(expected_ids, catalog.all_ids(), "catalog order matches approved ten glyphs")

    var main_count := 0
    var aux_count := 0
    for glyph_id in catalog.all_ids():
        var meta: Dictionary = catalog.metadata(glyph_id)
        case.assert_false(meta.is_empty(), "every catalog id has metadata")
        match StringName(meta.get("role", &"")):
            &"MAIN":
                main_count += 1
            &"AUX":
                aux_count += 1
            _:
                case.fail("unknown glyph role: %s" % glyph_id)

    case.assert_equal(5, main_count, "catalog has five main glyphs")
    case.assert_equal(5, aux_count, "catalog has five auxiliary glyphs")
    case.assert_true(catalog.is_main(&"FLOW"), "FLOW is a main glyph in v2")
    case.assert_equal(&"AMPLIFY", catalog.normalize_id(&"BURST"), "legacy BURST normalizes to AMPLIFY")
    case.assert_equal([
        &"HEAT", &"FLOW", &"PROTECT", &"FOCUS", &"DISPERSE",
    ], catalog.drawable_vault_ids(), "first-slice drawable vault ids are preserved")

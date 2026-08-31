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

    for glyph_id in catalog.all_ids():
        var meta: Dictionary = catalog.metadata(glyph_id)
        case.assert_false(meta.is_empty(), "every catalog id has metadata")
        case.assert_false(meta.has("role"), "catalog metadata exposes no Main or Auxiliary role")
        case.assert_true(meta.has("meaning_tags"), "every glyph exposes semantic meaning tags")
        case.assert_true(meta.has("method_tags"), "every glyph exposes possible method tags")

    case.assert_equal([&"HEAT"], catalog.metadata(&"HEAT").get("meaning_tags", []), "HEAT keeps its semantic tag")
    case.assert_equal([&"INTENSIFY"], catalog.metadata(&"HEAT").get("method_tags", []), "HEAT keeps its method tag")
    case.assert_equal(&"AMPLIFY", catalog.normalize_id(&"BURST"), "legacy BURST normalizes to AMPLIFY")
    case.assert_equal([
        &"HEAT", &"FLOW", &"PROTECT", &"FOCUS", &"DISPERSE",
    ], catalog.drawable_vault_ids(), "first-slice drawable vault ids are preserved")

# 승인된 6종 문양의 런타임 시각 자산 해석 계약을 검증한다.
extends RefCounted

const RESOLVER_PATH := "res://src/ui/spell_workflow/glyph_visual_resolver.gd"
const DIRECT_IDS: Array[StringName] = [
    &"HEAT", &"PROTECT", &"FLOW", &"FOCUS", &"DISPERSE", &"BURST",
]


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(RESOLVER_PATH), "glyph visual resolver must exist")
    if not FileAccess.file_exists(RESOLVER_PATH):
        return

    var resolver = load(RESOLVER_PATH)
    case.assert_true(resolver != null and resolver.can_instantiate(), "glyph visual resolver compiles")
    if resolver == null or not resolver.can_instantiate():
        return

    for glyph_id in DIRECT_IDS:
        var expected_path := "res://assets/art/ui/glyphs/glyph_%s.png" % String(glyph_id).to_lower()
        case.assert_equal(glyph_id, resolver.asset_id_for(glyph_id), "%s keeps its approved visual ID" % glyph_id)
        case.assert_equal(expected_path, resolver.texture_path_for(glyph_id), "%s resolves its approved PNG" % glyph_id)
        case.assert_true(not resolver.korean_name_for(glyph_id).is_empty(), "%s has a live Korean name" % glyph_id)
        case.assert_true(resolver.texture_for(glyph_id) != null, "%s loads its approved texture" % glyph_id)

    case.assert_equal(&"BURST", resolver.asset_id_for(&"AMPLIFY"), "AMPLIFY uses BURST art only as visual compatibility")
    case.assert_equal("폭발", resolver.korean_name_for(&"AMPLIFY"), "AMPLIFY compatibility keeps the BURST display name")
    case.assert_equal(&"", resolver.asset_id_for(&"UNKNOWN"), "unknown IDs have no invented visual ID")
    case.assert_equal("", resolver.texture_path_for(&"UNKNOWN"), "unknown IDs have no invented texture path")
    case.assert_equal("", resolver.korean_name_for(&"UNKNOWN"), "unknown IDs have no invented Korean name")
    case.assert_true(resolver.texture_for(&"UNKNOWN") == null, "unknown IDs have no texture")

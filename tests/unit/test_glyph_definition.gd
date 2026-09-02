extends RefCounted

const DEFINITION_PATH := "res://src/input/glyph_definition.gd"
const REGISTRY_PATH := "res://data/glyphs/v1/glyph_vocabulary_v1.json"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(DEFINITION_PATH), "glyph_definition.gd must exist")
    if not FileAccess.file_exists(DEFINITION_PATH):
        return

    var definition_script = load(DEFINITION_PATH)
    case.assert_true(definition_script != null, "GlyphDefinition script loads")
    if definition_script == null:
        return
    case.assert_true(definition_script.can_instantiate(), "GlyphDefinition script compiles")
    if not definition_script.can_instantiate():
        return

    var parsed = definition_script.from_dict({
        "id": "HEAT",
        "name_ko": "열",
        "meaning": "온도 상승·가열",
        "preferred_strokes": 2,
        "slice_enabled": true,
        "shape_description": "위가 열린 삼각 불꽃 안에 짧은 중심선",
        "ornament_is_recognition_input": false,
    })
    case.assert_equal(&"OK", parsed.get("status", &""), "valid definition parses")
    if parsed.get("status", &"") == &"OK":
        var value = parsed.get("value")
        case.assert_false(value.has_method("role"), "Role-free glyph definition exposes no role classification")
        case.assert_false(value.has_method("is_main"), "Role-free glyph definition exposes no Main classification")
        case.assert_false(value.has_method("is_support"), "Role-free glyph definition exposes no Support classification")
        case.assert_true(value.is_slice_enabled(), "HEAT is Slice enabled")
        case.assert_equal(&"HEAT", value.glyph_id(), "glyph id is immutable read value")
        case.assert_equal(2, value.preferred_strokes(), "preferred stroke count is preserved")

    var retired_role = definition_script.from_dict({
        "id": "HEAT",
        "name_ko": "열",
        "role": "MAIN",
        "meaning": "온도 상승·가열",
        "preferred_strokes": 2,
        "slice_enabled": true,
        "shape_description": "shape",
        "ornament_is_recognition_input": false,
    })
    case.assert_equal(&"INVALID_GLYPH_DEFINITION", retired_role.get("status", &""), "retired role field is rejected")

    var invalid_id = definition_script.from_dict({
        "id": "Heat-1",
        "name_ko": "열",
        "meaning": "온도 상승·가열",
        "preferred_strokes": 2,
        "slice_enabled": true,
        "shape_description": "shape",
        "ornament_is_recognition_input": false,
    })
    case.assert_equal(&"INVALID_GLYPH_DEFINITION", invalid_id.get("status", &""), "non-uppercase ASCII id is rejected")

    var invalid_strokes = definition_script.from_dict({
        "id": "HEAT",
        "name_ko": "열",
        "meaning": "온도 상승·가열",
        "preferred_strokes": 4,
        "slice_enabled": true,
        "shape_description": "shape",
        "ornament_is_recognition_input": false,
    })
    case.assert_equal(&"INVALID_GLYPH_DEFINITION", invalid_strokes.get("status", &""), "four strokes are outside POC scope")

    case.assert_true(FileAccess.file_exists(REGISTRY_PATH), "glyph vocabulary registry must exist")
    if not FileAccess.file_exists(REGISTRY_PATH):
        return

    var registry_text := FileAccess.get_file_as_string(REGISTRY_PATH)
    var registry = JSON.parse_string(registry_text)
    case.assert_true(typeof(registry) == TYPE_DICTIONARY, "registry JSON parses as dictionary")
    if typeof(registry) != TYPE_DICTIONARY:
        return

    case.assert_equal(2, int(registry.get("schema_version", 0)), "role-free registry schema version")
    case.assert_equal("GM-CIRCLE-CLOCK-CARD-CORE-01", String(registry.get("decision_id", "")), "role-free registry decision id")
    case.assert_false(registry.has("main"), "Registry does not retain Main glyph grouping")
    case.assert_false(registry.has("support"), "Registry does not retain Support glyph grouping")

    var entries: Array = registry.get("entries", [])
    case.assert_equal(20, entries.size(), "registry contains exactly twenty entries")

    var unique_ids := {}
    var slice_ids: Array[StringName] = []
    for entry_variant in entries:
        case.assert_true(typeof(entry_variant) == TYPE_DICTIONARY, "each registry entry is a dictionary")
        if typeof(entry_variant) != TYPE_DICTIONARY:
            continue
        var entry: Dictionary = entry_variant
        var result = definition_script.from_dict(entry)
        case.assert_equal(&"OK", result.get("status", &""), "registry entry validates: %s" % entry.get("id", ""))
        var glyph_id := StringName(entry.get("id", ""))
        unique_ids[glyph_id] = true
        case.assert_false(entry.has("role"), "Registry entry has no retired role: %s" % glyph_id)
        if bool(entry.get("slice_enabled", false)):
            slice_ids.append(glyph_id)
        case.assert_false(bool(entry.get("ornament_is_recognition_input", true)), "ornament is display-only: %s" % glyph_id)

    case.assert_equal(20, unique_ids.size(), "all glyph ids are unique")
    case.assert_equal(6, slice_ids.size(), "exactly six Slice glyphs")

    var expected_slice: Array[StringName] = [&"HEAT", &"PROTECT", &"FLOW", &"FOCUS", &"DISPERSE", &"BURST"]
    for glyph_id in expected_slice:
        case.assert_true(slice_ids.has(glyph_id), "Slice registry includes %s" % glyph_id)

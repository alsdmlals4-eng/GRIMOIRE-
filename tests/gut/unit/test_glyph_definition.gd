extends GutTest

const GlyphDefinition = preload("res://src/input/glyph_definition.gd")


func _valid_heat() -> Dictionary:
    return {
        "id": "HEAT",
        "name_ko": "열",
        "role": "MAIN",
        "meaning": "온도 상승·가열",
        "preferred_strokes": 2,
        "slice_enabled": true,
        "shape_description": "위가 열린 삼각 불꽃 안에 짧은 중심선",
        "ornament_is_recognition_input": false,
    }


func test_valid_heat_definition_preserves_public_behavior() -> void:
    var parsed = GlyphDefinition.from_dict(_valid_heat())
    assert_eq(parsed.get("status", &""), &"OK")
    var value = parsed.get("value")
    assert_not_null(value)
    assert_true(value.is_main())
    assert_false(value.is_support())
    assert_true(value.is_slice_enabled())
    assert_eq(value.glyph_id(), &"HEAT")
    assert_eq(value.preferred_strokes(), 2)


func test_invalid_role_is_rejected() -> void:
    var data := _valid_heat()
    data["role"] = "UNKNOWN"
    var parsed = GlyphDefinition.from_dict(data)
    assert_eq(parsed.get("status", &""), &"INVALID_GLYPH_DEFINITION")


func test_invalid_identifier_is_rejected() -> void:
    var data := _valid_heat()
    data["id"] = "Heat-1"
    var parsed = GlyphDefinition.from_dict(data)
    assert_eq(parsed.get("status", &""), &"INVALID_GLYPH_DEFINITION")


func test_invalid_stroke_count_is_rejected() -> void:
    var data := _valid_heat()
    data["preferred_strokes"] = 4
    var parsed = GlyphDefinition.from_dict(data)
    assert_eq(parsed.get("status", &""), &"INVALID_GLYPH_DEFINITION")

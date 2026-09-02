class_name GlyphDefinition
extends RefCounted

const REQUIRED_FIELDS: Array[String] = [
    "id",
    "name_ko",
    "meaning",
    "preferred_strokes",
    "slice_enabled",
]

var _glyph_id: StringName = &""
var _name_ko: String = ""
var _meaning: String = ""
var _preferred_strokes: int = 0
var _slice_enabled: bool = false
var _shape_description: String = ""
var _ornament_is_recognition_input: bool = false


static func from_dict(data: Dictionary) -> Dictionary:
    if data.has("role"):
        return _invalid("RETIRED_ROLE_FIELD")
    for field_name in REQUIRED_FIELDS:
        if not data.has(field_name):
            return _invalid("MISSING_%s" % field_name.to_upper())

    var id_value := String(data.get("id", ""))
    var name_value := String(data.get("name_ko", ""))
    var meaning_value := String(data.get("meaning", ""))
    var strokes_value := int(data.get("preferred_strokes", 0))
    var slice_value = data.get("slice_enabled")

    if not _is_valid_id(id_value):
        return _invalid("INVALID_ID")
    if name_value.strip_edges().is_empty():
        return _invalid("EMPTY_NAME")
    if meaning_value.strip_edges().is_empty():
        return _invalid("EMPTY_MEANING")
    if strokes_value < 1 or strokes_value > 3:
        return _invalid("INVALID_STROKE_COUNT")
    if typeof(slice_value) != TYPE_BOOL:
        return _invalid("INVALID_SLICE_FLAG")

    var script = load("res://src/input/glyph_definition.gd")
    if script == null or not script.can_instantiate():
        return _invalid("SCRIPT_UNAVAILABLE")
    var value = script.new()
    value._glyph_id = StringName(id_value)
    value._name_ko = name_value
    value._meaning = meaning_value
    value._preferred_strokes = strokes_value
    value._slice_enabled = bool(slice_value)
    value._shape_description = String(data.get("shape_description", ""))
    value._ornament_is_recognition_input = bool(data.get("ornament_is_recognition_input", false))
    return {"status": &"OK", "value": value}


func glyph_id() -> StringName:
    return _glyph_id


func name_ko() -> String:
    return _name_ko


func meaning() -> String:
    return _meaning


func preferred_strokes() -> int:
    return _preferred_strokes


func is_slice_enabled() -> bool:
    return _slice_enabled


func shape_description() -> String:
    return _shape_description


func ornament_is_recognition_input() -> bool:
    return _ornament_is_recognition_input


static func _invalid(reason: String) -> Dictionary:
    return {"status": &"INVALID_GLYPH_DEFINITION", "reason": StringName(reason), "value": null}


static func _is_valid_id(value: String) -> bool:
    if value.is_empty():
        return false
    for index in value.length():
        var code := value.unicode_at(index)
        var is_upper_ascii := code >= 65 and code <= 90
        if not is_upper_ascii and code != 95:
            return false
    return true

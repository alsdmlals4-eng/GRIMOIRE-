class_name CircleComposition
extends RefCounted

const MAX_GLYPH_COUNT := 3
const SELF_PATH := "res://src/core/circle/circle_composition.gd"

var _sealed := false:
    set(_value):
        _sealed = true

var _glyph_ids_json := "[]":
    set(value):
        if not _sealed:
            _glyph_ids_json = value

var _visual_layers_json := "[]":
    set(value):
        if not _sealed:
            _visual_layers_json = value


static func create(glyph_ids: Array[StringName], visual_layers: Array[StringName]):
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var value = script.new()
    value._glyph_ids_json = _encode_ids(glyph_ids)
    value._visual_layers_json = _encode_ids(visual_layers)
    value._sealed = true
    return value


func validation() -> Dictionary:
    var glyph_count := glyph_instance_ids().size()
    if glyph_count == 0:
        return {"status": &"GLYPH_COUNT_REQUIRED"}
    if glyph_count > MAX_GLYPH_COUNT:
        return {"status": &"GLYPH_COUNT_EXCEEDED"}
    return {"status": &"OK"}


func logical_signature() -> StringName:
    var names: Array[String] = []
    for glyph_id in glyph_instance_ids():
        names.append(String(glyph_id))
    names.sort()
    return StringName("+".join(names))


func glyph_instance_ids() -> Array[StringName]:
    return _decode_ids(_glyph_ids_json)


func to_snapshot() -> Dictionary:
    return {
        "glyph_instance_ids": glyph_instance_ids(),
        "visual_layer_order": _decode_ids(_visual_layers_json),
        "logical_signature": logical_signature(),
    }


static func _encode_ids(ids: Array[StringName]) -> String:
    var values: Array[String] = []
    for glyph_id in ids:
        values.append(String(glyph_id))
    return JSON.stringify(values)


static func _decode_ids(encoded_ids: String) -> Array[StringName]:
    var parser := JSON.new()
    if parser.parse(encoded_ids) != OK or typeof(parser.data) != TYPE_ARRAY:
        return []
    var decoded: Array[StringName] = []
    for glyph_id in parser.data:
        decoded.append(StringName(glyph_id))
    return decoded

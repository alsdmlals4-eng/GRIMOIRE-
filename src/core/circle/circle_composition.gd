class_name CircleComposition
extends RefCounted

const MAX_GLYPH_COUNT := 3

var _glyph_ids: Array[StringName] = []
var _visual_layers: Array[StringName] = []


static func create(glyph_ids: Array[StringName], visual_layers: Array[StringName]):
    var value = preload("res://src/core/circle/circle_composition.gd").new()
    value._glyph_ids = glyph_ids.duplicate()
    value._visual_layers = visual_layers.duplicate()
    return value


func validation() -> Dictionary:
    if _glyph_ids.is_empty():
        return {"status": &"GLYPH_COUNT_REQUIRED"}
    if _glyph_ids.size() > MAX_GLYPH_COUNT:
        return {"status": &"GLYPH_COUNT_EXCEEDED"}
    return {"status": &"OK"}


func logical_signature() -> StringName:
    var names: Array[String] = []
    for glyph_id in _glyph_ids:
        names.append(String(glyph_id))
    names.sort()
    return StringName("+".join(names))


func glyph_instance_ids() -> Array[StringName]:
    return _glyph_ids.duplicate()


func to_snapshot() -> Dictionary:
    return {
        "glyph_instance_ids": glyph_instance_ids(),
        "visual_layer_order": _visual_layers.duplicate(),
        "logical_signature": logical_signature(),
    }

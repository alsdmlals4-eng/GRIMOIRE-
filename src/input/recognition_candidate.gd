class_name RecognitionCandidate
extends RefCounted

var _glyph_id: StringName = &""
var _score: float = 0.0
var _distance: float = 0.0
var _template_id: StringName = &""
var _input_revision: int = -1


static func create(
    glyph_id: StringName,
    score: float,
    distance: float,
    template_id: StringName,
    input_revision: int
) -> Dictionary:
    if String(glyph_id).is_empty() or String(template_id).is_empty():
        return _invalid(&"MISSING_ID")
    if not is_finite(score) or score < 0.0 or score > 1.0:
        return _invalid(&"INVALID_SCORE")
    if not is_finite(distance) or distance < 0.0:
        return _invalid(&"INVALID_DISTANCE")
    if input_revision < 0:
        return _invalid(&"INVALID_REVISION")

    var script = load("res://src/input/recognition_candidate.gd")
    if script == null or not script.can_instantiate():
        return _invalid(&"SCRIPT_UNAVAILABLE")
    var value = script.new()
    value._glyph_id = glyph_id
    value._score = score
    value._distance = distance
    value._template_id = template_id
    value._input_revision = input_revision
    return {"status": &"OK", "value": value}


func glyph_id() -> StringName:
    return _glyph_id


func score() -> float:
    return _score


func distance() -> float:
    return _distance


func template_id() -> StringName:
    return _template_id


func input_revision() -> int:
    return _input_revision


func to_dict() -> Dictionary:
    return {
        "glyph_id": _glyph_id,
        "score": _score,
        "distance": _distance,
        "template_id": _template_id,
        "input_revision": _input_revision,
    }.duplicate(true)


static func _invalid(reason: StringName) -> Dictionary:
    return {
        "status": &"INVALID_RECOGNITION_CANDIDATE",
        "reason": reason,
        "value": null,
    }

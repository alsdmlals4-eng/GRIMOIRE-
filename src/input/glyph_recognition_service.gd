class_name GlyphRecognitionService
extends RefCounted

const DOLLAR_N_PATH := "res://src/input/dollar_n_recognizer.gd"
const CANDIDATE_PATH := "res://src/input/recognition_candidate.gd"
const SCORE_DISTANCE_SCALE := 125.0
const MAX_CANDIDATES := 3

var _repository = null
var _confidence_threshold: float = 0.80
var _margin_threshold: float = 0.10
var _compiled_templates: Dictionary = {}
var _configuration_status: StringName = &"UNCONFIGURED"


func _init(repository = null, confidence_threshold: float = 0.80, margin_threshold: float = 0.10) -> void:
    _repository = repository
    _confidence_threshold = confidence_threshold
    _margin_threshold = margin_threshold
    _configuration_status = _build_cache()


func recognize(strokes: Array, input_revision: int) -> Dictionary:
    if _configuration_status != &"OK" or input_revision < 0:
        return _result(&"NO_VALID_INPUT", [])
    if strokes.size() < 1 or strokes.size() > 3:
        return _result(&"NO_VALID_INPUT", [])

    var dollar_n_script = load(DOLLAR_N_PATH)
    var candidate_script = load(CANDIDATE_PATH)
    if dollar_n_script == null or candidate_script == null:
        return _result(&"NO_VALID_INPUT", [])
    var dollar_n = dollar_n_script.new()
    var ranked: Array = []

    for glyph_id_variant in _compiled_templates.keys():
        var glyph_id: StringName = glyph_id_variant
        var definition = _repository.definition(glyph_id)
        if definition == null or int(definition.preferred_strokes()) != strokes.size():
            continue
        var best_distance := INF
        var best_template_id: StringName = &""
        var compiled_entries: Array = _compiled_templates.get(glyph_id, [])
        for entry_variant in compiled_entries:
            var entry: Dictionary = entry_variant
            var distance: float = float(dollar_n.best_distance(strokes, entry.get("variants", [])))
            if distance < best_distance:
                best_distance = distance
                best_template_id = StringName(entry.get("template_id", &""))
        if not is_finite(best_distance) or String(best_template_id).is_empty():
            continue
        var score_value := _score_from_distance(best_distance)
        var created: Dictionary = candidate_script.create(
            glyph_id,
            score_value,
            best_distance,
            best_template_id,
            input_revision
        )
        if created.get("status", &"") == &"OK":
            ranked.append(created.get("value"))

    ranked.sort_custom(func(a, b) -> bool:
        var score_delta: float = float(a.score()) - float(b.score())
        if absf(score_delta) > 0.000001:
            return score_delta > 0.0
        return String(a.glyph_id()) < String(b.glyph_id())
    )
    if ranked.size() > MAX_CANDIDATES:
        ranked.resize(MAX_CANDIDATES)
    if ranked.is_empty():
        return _result(&"NO_VALID_INPUT", ranked)

    var top = ranked[0]
    if float(top.score()) < _confidence_threshold:
        return _result(&"LOW_CONFIDENCE_REQUIRES_RETRY", ranked)
    if ranked.size() > 1:
        var margin: float = float(top.score()) - float(ranked[1].score())
        if margin < _margin_threshold:
            return _result(&"AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION", ranked)
    return _result(&"CANDIDATE_READY", ranked)


func accept(candidate, current_revision: int) -> Dictionary:
    if candidate == null or not candidate.has_method("input_revision"):
        return {"status": &"NO_VALID_INPUT"}
    if int(candidate.input_revision()) != current_revision:
        return {"status": &"STALE_RECOGNITION_RESULT"}
    if float(candidate.score()) < _confidence_threshold:
        return {"status": &"LOW_CONFIDENCE_REQUIRES_RETRY"}
    return {
        "status": &"ACCEPTED",
        "glyph_id": candidate.glyph_id(),
        "input_revision": current_revision,
    }


func confidence_threshold() -> float:
    return _confidence_threshold


func margin_threshold() -> float:
    return _margin_threshold


func configuration_status() -> StringName:
    return _configuration_status


func _build_cache() -> StringName:
    if _repository == null:
        return &"INVALID_REPOSITORY"
    if not is_finite(_confidence_threshold) or _confidence_threshold < 0.0 or _confidence_threshold > 1.0:
        return &"INVALID_THRESHOLD"
    if not is_finite(_margin_threshold) or _margin_threshold < 0.0 or _margin_threshold > 1.0:
        return &"INVALID_MARGIN"

    var dollar_n_script = load(DOLLAR_N_PATH)
    if dollar_n_script == null or not dollar_n_script.can_instantiate():
        return &"RECOGNIZER_UNAVAILABLE"
    var dollar_n = dollar_n_script.new()

    for glyph_id in _repository.slice_glyph_ids():
        var entries: Array = []
        for template in _repository.templates(glyph_id):
            var compiled: Dictionary = dollar_n.compile_checked(template.get("strokes", []))
            if compiled.get("status", &"") != &"OK":
                return &"TEMPLATE_COMPILE_FAILED"
            entries.append({
                "template_id": template.get("template_id", &""),
                "variants": compiled.get("variants", []).duplicate(true),
            })
        if entries.is_empty():
            return &"MISSING_TEMPLATE"
        _compiled_templates[glyph_id] = entries
    return &"OK"


func _score_from_distance(distance: float) -> float:
    if not is_finite(distance) or distance < 0.0:
        return 0.0
    return clampf(1.0 - (distance / SCORE_DISTANCE_SCALE), 0.0, 1.0)


func _result(status: StringName, candidates: Array) -> Dictionary:
    return {
        "status": status,
        "candidates": candidates.duplicate(),
        "confidence_threshold": _confidence_threshold,
        "margin_threshold": _margin_threshold,
    }

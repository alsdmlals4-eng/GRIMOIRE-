extends RefCounted

const CANDIDATE_PATH := "res://src/input/recognition_candidate.gd"
const SERVICE_PATH := "res://src/input/glyph_recognition_service.gd"
const REPOSITORY_PATH := "res://src/input/glyph_template_repository.gd"
const VOCABULARY_PATH := "res://data/glyphs/v1/glyph_vocabulary_v1.json"
const TEMPLATE_DIRECTORY := "res://data/glyphs/v1/slice_templates"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(CANDIDATE_PATH), "recognition_candidate.gd must exist")
    case.assert_true(FileAccess.file_exists(SERVICE_PATH), "glyph_recognition_service.gd must exist")
    if not FileAccess.file_exists(CANDIDATE_PATH) or not FileAccess.file_exists(SERVICE_PATH):
        return

    var candidate_script = load(CANDIDATE_PATH)
    var service_script = load(SERVICE_PATH)
    var repository_script = load(REPOSITORY_PATH)
    case.assert_true(candidate_script != null and candidate_script.can_instantiate(), "RecognitionCandidate compiles")
    case.assert_true(service_script != null and service_script.can_instantiate(), "GlyphRecognitionService compiles")
    if candidate_script == null or service_script == null or repository_script == null:
        return

    var repository_result: Dictionary = repository_script.load_from_paths(VOCABULARY_PATH, TEMPLATE_DIRECTORY)
    case.assert_equal(&"OK", repository_result.get("status", &""), "recognition repository loads")
    if repository_result.get("status", &"") != &"OK":
        return
    var service = service_script.new(repository_result.get("value"), 0.80, 0.10)

    var heat: Array[PackedVector2Array] = _load_strokes("res://tests/fixtures/glyphs/heat-positive.json")
    var result: Dictionary = service.recognize(heat, 7)
    case.assert_equal(&"CANDIDATE_READY", result.get("status", &""), "known HEAT input produces candidate")
    var candidates: Array = result.get("candidates", [])
    case.assert_true(not candidates.is_empty(), "known input produces ranked candidates")
    case.assert_true(candidates.size() <= 3, "service returns at most three glyph candidates")
    if not candidates.is_empty():
        var top = candidates[0]
        case.assert_equal(&"HEAT", top.glyph_id(), "HEAT ranks first")
        case.assert_equal(7, top.input_revision(), "revision is preserved")
        case.assert_true(top.score() >= 0.80, "top candidate crosses confidence threshold")
        case.assert_true(top.distance() >= 0.0, "candidate distance is non-negative")
        var snapshot: Dictionary = top.to_dict()
        snapshot["glyph_id"] = &"FLOW"
        case.assert_equal(&"HEAT", top.glyph_id(), "to_dict cannot mutate immutable candidate")

        var stale: Dictionary = service.accept(top, 8)
        case.assert_equal(&"STALE_RECOGNITION_RESULT", stale.get("status", &""), "stale candidate cannot be accepted")
        var accepted: Dictionary = service.accept(top, 7)
        case.assert_equal(&"ACCEPTED", accepted.get("status", &""), "current candidate can be accepted")
        case.assert_equal(&"HEAT", accepted.get("glyph_id", &""), "accept result names exact glyph")

    var unique_ids := {}
    for candidate in candidates:
        unique_ids[candidate.glyph_id()] = true
    case.assert_equal(candidates.size(), unique_ids.size(), "ranked candidates contain distinct glyph ids")

    var incomplete := _load_strokes("res://tests/fixtures/glyphs/incomplete-heat.json")
    var low: Dictionary = service.recognize(incomplete, 8)
    case.assert_equal(&"LOW_CONFIDENCE_REQUIRES_RETRY", low.get("status", &""), "incomplete input is not auto-confirmed")

    for confusing_path in [
        "res://tests/fixtures/glyphs/heat-light-confusing.json",
        "res://tests/fixtures/glyphs/flow-repeat-confusing.json",
    ]:
        var confusing: Array[PackedVector2Array] = _load_strokes(confusing_path)
        var confusing_result: Dictionary = service.recognize(confusing, 9)
        case.assert_true(
            confusing_result.get("status", &"") in [&"LOW_CONFIDENCE_REQUIRES_RETRY", &"AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION"],
            "confusing fixture is never silently accepted: %s" % confusing_path
        )

    var one_stroke_heat: Array[PackedVector2Array] = [PackedVector2Array([
        Vector2(0.20, 0.80), Vector2(0.50, 0.15), Vector2(0.80, 0.80),
        Vector2(0.50, 0.68), Vector2(0.50, 0.38)
    ])]
    var wrong_count: Dictionary = service.recognize(one_stroke_heat, 10)
    for candidate in wrong_count.get("candidates", []):
        case.assert_false(candidate.glyph_id() == &"HEAT", "HEAT cannot rank from an unapproved one-stroke input")

    var no_input: Dictionary = service.recognize([], 11)
    case.assert_equal(&"NO_VALID_INPUT", no_input.get("status", &""), "empty input has no candidate")

    var invalid_score: Dictionary = candidate_script.create(&"HEAT", 1.1, 0.0, &"heat-01", 0)
    case.assert_equal(&"INVALID_RECOGNITION_CANDIDATE", invalid_score.get("status", &""), "score above one is rejected")
    var invalid_distance: Dictionary = candidate_script.create(&"HEAT", 0.9, -0.1, &"heat-01", 0)
    case.assert_equal(&"INVALID_RECOGNITION_CANDIDATE", invalid_distance.get("status", &""), "negative distance is rejected")
    var invalid_revision: Dictionary = candidate_script.create(&"HEAT", 0.9, 0.1, &"heat-01", -1)
    case.assert_equal(&"INVALID_RECOGNITION_CANDIDATE", invalid_revision.get("status", &""), "negative revision is rejected")


func _load_strokes(path: String) -> Array[PackedVector2Array]:
    var output: Array[PackedVector2Array] = []
    var parser := JSON.new()
    if parser.parse(FileAccess.get_file_as_string(path)) != OK or typeof(parser.data) != TYPE_DICTIONARY:
        return output
    for raw_stroke in parser.data.get("strokes", []):
        if typeof(raw_stroke) != TYPE_ARRAY:
            continue
        var stroke := PackedVector2Array()
        for raw_point in raw_stroke:
            if typeof(raw_point) == TYPE_ARRAY and raw_point.size() == 2:
                stroke.append(Vector2(float(raw_point[0]), float(raw_point[1])))
        output.append(stroke)
    return output

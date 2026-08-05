extends RefCounted

const SERVICE_PATH := "res://src/input/glyph_recognition_service.gd"
const REPOSITORY_PATH := "res://src/input/glyph_template_repository.gd"
const VOCABULARY_PATH := "res://data/glyphs/v1/glyph_vocabulary_v1.json"
const TEMPLATE_DIRECTORY := "res://data/glyphs/v1/slice_templates"
const OUTPUT_PATH := "res://artifacts/foundation-poc/glyph-fixture-rows.json"
const CONFIDENCE_THRESHOLD := 0.80
const MARGIN_THRESHOLD := 0.10


func run(case) -> void:
    var repository_script = load(REPOSITORY_PATH)
    var service_script = load(SERVICE_PATH)
    case.assert_true(repository_script != null and service_script != null, "recognition integration dependencies load")
    if repository_script == null or service_script == null:
        return

    var repository_result: Dictionary = repository_script.load_from_paths(VOCABULARY_PATH, TEMPLATE_DIRECTORY)
    case.assert_equal(&"OK", repository_result.get("status", &""), "integration repository loads")
    if repository_result.get("status", &"") != &"OK":
        return
    var repository = repository_result.get("value")
    var service = service_script.new(repository, CONFIDENCE_THRESHOLD, MARGIN_THRESHOLD)
    case.assert_equal(&"OK", service.configuration_status(), "integration recognition service configures")

    var rows: Array[Dictionary] = []
    var revision: int = 100
    for glyph_id in [&"HEAT", &"PROTECT", &"FLOW", &"FOCUS", &"DISPERSE", &"BURST"]:
        var templates: Array = repository.templates(glyph_id)
        case.assert_true(not templates.is_empty(), "positive template exists: %s" % glyph_id)
        if templates.is_empty():
            continue
        var strokes: Array = templates[0].get("strokes", [])
        var row: Dictionary = _recognize_row(service, String(glyph_id).to_lower() + "-positive", glyph_id, strokes, revision, "developer_reference")
        rows.append(row)
        case.assert_equal("CANDIDATE_READY", row.status, "positive fixture is ready: %s" % glyph_id)
        case.assert_equal(String(glyph_id), row.predicted, "positive fixture predicts itself: %s" % glyph_id)
        revision += 1

    var swapped: Array[PackedVector2Array] = _load_strokes("res://tests/fixtures/glyphs/heat-stroke-order-swapped.json")
    var swapped_row: Dictionary = _recognize_row(service, "heat-stroke-order-swapped", &"HEAT", swapped, revision, "allowed_stroke_order")
    rows.append(swapped_row)
    case.assert_equal("HEAT", swapped_row.predicted, "allowed HEAT stroke order remains recognized")
    revision += 1

    var incomplete: Array[PackedVector2Array] = _load_strokes("res://tests/fixtures/glyphs/incomplete-heat.json")
    var incomplete_row: Dictionary = _recognize_row(service, "heat-incomplete", &"HEAT", incomplete, revision, "incomplete")
    rows.append(incomplete_row)
    case.assert_true(incomplete_row.status in ["LOW_CONFIDENCE_REQUIRES_RETRY", "AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION"], "incomplete HEAT requires retry or selection")
    revision += 1

    for confusing_fixture_variant in [
        "res://tests/fixtures/glyphs/heat-light-confusing.json",
        "res://tests/fixtures/glyphs/flow-repeat-confusing.json",
    ]:
        var confusing_fixture: String = String(confusing_fixture_variant)
        var confusing: Array[PackedVector2Array] = _load_strokes(confusing_fixture)
        var fixture_id: String = confusing_fixture.get_file().get_basename()
        var confusing_row: Dictionary = _recognize_row(service, fixture_id, &"", confusing, revision, "confusing_unknown")
        rows.append(confusing_row)
        case.assert_true(confusing_row.status in ["LOW_CONFIDENCE_REQUIRES_RETRY", "AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION"], "confusing input is not accepted: %s" % fixture_id)
        revision += 1

    var unknown: Array[PackedVector2Array] = [PackedVector2Array([
        Vector2(0.10, 0.10), Vector2(0.90, 0.10), Vector2(0.10, 0.90), Vector2(0.90, 0.90)
    ])]
    var unknown_row: Dictionary = _recognize_row(service, "unknown-zigzag", &"", unknown, revision, "unknown")
    rows.append(unknown_row)
    case.assert_true(unknown_row.status in ["LOW_CONFIDENCE_REQUIRES_RETRY", "AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION", "NO_VALID_INPUT"], "unknown input is not accepted")

    var output_directory: String = ProjectSettings.globalize_path(OUTPUT_PATH.get_base_dir())
    DirAccess.make_dir_recursive_absolute(output_directory)
    var output_file = FileAccess.open(OUTPUT_PATH, FileAccess.WRITE)
    case.assert_true(output_file != null, "fixture rows output opens")
    if output_file != null:
        output_file.store_string(JSON.stringify(rows, "  "))
        output_file.close()
    case.assert_equal(11, rows.size(), "integration emits eleven synthetic fixture rows")


func _recognize_row(
    service,
    fixture_id: String,
    expected: StringName,
    strokes: Array,
    revision: int,
    input_variant: String
) -> Dictionary:
    var started: int = Time.get_ticks_usec()
    var result: Dictionary = service.recognize(strokes, revision)
    var elapsed: int = Time.get_ticks_usec() - started
    var candidates: Array = result.get("candidates", [])
    var predicted: Variant = null
    var top_score: float = 0.0
    var second_score: float = 0.0
    if not candidates.is_empty():
        predicted = String(candidates[0].glyph_id())
        top_score = float(candidates[0].score())
    if candidates.size() > 1:
        second_score = float(candidates[1].score())
    return {
        "fixture_id": fixture_id,
        "expected": null if String(expected).is_empty() else String(expected),
        "predicted": predicted,
        "status": String(result.get("status", &"")),
        "top_score": top_score,
        "second_score": second_score,
        "elapsed_us": elapsed,
        "input_variant": input_variant,
        "confidence_threshold": CONFIDENCE_THRESHOLD,
        "margin_threshold": MARGIN_THRESHOLD,
    }


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

extends RefCounted

const MATH_PATH := "res://src/input/point_cloud_math.gd"
const RECOGNIZER_PATH := "res://src/input/dollar_one_recognizer.gd"
const FLOW_POSITIVE_PATH := "res://tests/fixtures/glyphs/flow-positive.json"
const FLOW_REVERSED_PATH := "res://tests/fixtures/glyphs/flow-reversed.json"
const INCOMPLETE_PATH := "res://tests/fixtures/glyphs/incomplete-line.json"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(MATH_PATH), "point_cloud_math.gd must exist")
    case.assert_true(FileAccess.file_exists(RECOGNIZER_PATH), "dollar_one_recognizer.gd must exist")
    if not FileAccess.file_exists(MATH_PATH) or not FileAccess.file_exists(RECOGNIZER_PATH):
        return

    var math_script = load(MATH_PATH)
    var recognizer_script = load(RECOGNIZER_PATH)
    case.assert_true(math_script != null and math_script.can_instantiate(), "PointCloudMath compiles")
    case.assert_true(recognizer_script != null and recognizer_script.can_instantiate(), "DollarOneRecognizer compiles")
    if math_script == null or recognizer_script == null:
        return

    var recognizer = recognizer_script.new()
    var template := _load_points(FLOW_POSITIVE_PATH)
    var reversed := _load_points(FLOW_REVERSED_PATH)
    case.assert_true(template.size() >= 5, "FLOW positive fixture loads")
    case.assert_equal(template.size(), reversed.size(), "FLOW reversed fixture preserves point count")

    var compiled: PackedVector2Array = recognizer.compile(template)
    case.assert_equal(64, compiled.size(), "compiled template is resampled to 64 points")
    case.assert_near(0.0, recognizer.distance(template, compiled), 0.05, "self distance is near zero")

    var translated := PackedVector2Array()
    var scaled := PackedVector2Array()
    for point in template:
        translated.append(point + Vector2(4.0, -3.0))
        scaled.append(point * 3.5)
    case.assert_near(
        recognizer.distance(template, compiled),
        recognizer.distance(translated, compiled),
        0.05,
        "translation is normalized"
    )
    case.assert_near(
        recognizer.distance(template, compiled),
        recognizer.distance(scaled, compiled),
        0.05,
        "uniform scale is normalized"
    )

    var line := PackedVector2Array([Vector2(0.0, 0.0), Vector2(3.0, 4.0)])
    case.assert_near(5.0, math_script.path_length(line), 0.0001, "path length is deterministic")
    case.assert_equal(8, math_script.resample(line, 8).size(), "resample emits requested count")
    case.assert_equal(64, math_script.translate_to_origin(compiled).size(), "translation preserves point count")
    case.assert_near(0.0, math_script.path_distance(compiled, compiled), 0.0001, "identical paths have zero distance")

    var incomplete := _load_points(INCOMPLETE_PATH)
    var incomplete_result: Dictionary = recognizer.compile_checked(incomplete)
    case.assert_equal(&"INSUFFICIENT_POINTS", incomplete_result.get("status", &""), "one-point input is rejected")

    var identical := PackedVector2Array([Vector2(0.4, 0.4), Vector2(0.4, 0.4), Vector2(0.4, 0.4)])
    var identical_result: Dictionary = recognizer.compile_checked(identical)
    case.assert_equal(&"INSUFFICIENT_POINTS", identical_result.get("status", &""), "zero-length input is rejected")

    var non_finite := PackedVector2Array([Vector2(0.0, 0.0), Vector2(NAN, 0.5)])
    var non_finite_result: Dictionary = recognizer.compile_checked(non_finite)
    case.assert_equal(&"NON_FINITE_POINT", non_finite_result.get("status", &""), "NaN coordinates are rejected")

    case.assert_true(recognizer.distance(reversed, compiled) >= 0.0, "reversed input produces a deterministic distance")


func _load_points(path: String) -> PackedVector2Array:
    var parser := JSON.new()
    if parser.parse(FileAccess.get_file_as_string(path)) != OK or typeof(parser.data) != TYPE_DICTIONARY:
        return PackedVector2Array()
    var points := PackedVector2Array()
    for raw_point in parser.data.get("points", []):
        if typeof(raw_point) == TYPE_ARRAY and raw_point.size() == 2:
            points.append(Vector2(float(raw_point[0]), float(raw_point[1])))
    return points

extends RefCounted

const RECOGNIZER_PATH := "res://src/input/dollar_n_recognizer.gd"
const HEAT_PATH := "res://tests/fixtures/glyphs/heat-positive.json"
const HEAT_SWAPPED_PATH := "res://tests/fixtures/glyphs/heat-stroke-order-swapped.json"
const BURST_PATH := "res://tests/fixtures/glyphs/burst-positive.json"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(RECOGNIZER_PATH), "dollar_n_recognizer.gd must exist")
    if not FileAccess.file_exists(RECOGNIZER_PATH):
        return

    var recognizer_script = load(RECOGNIZER_PATH)
    case.assert_true(recognizer_script != null, "DollarNRecognizer script loads")
    if recognizer_script == null:
        return
    case.assert_true(recognizer_script.can_instantiate(), "DollarNRecognizer compiles")
    if not recognizer_script.can_instantiate():
        return

    var recognizer = recognizer_script.new()
    var heat: Array[PackedVector2Array] = _load_strokes(HEAT_PATH)
    var swapped: Array[PackedVector2Array] = _load_strokes(HEAT_SWAPPED_PATH)
    var burst: Array[PackedVector2Array] = _load_strokes(BURST_PATH)

    case.assert_equal(2, heat.size(), "HEAT fixture has two strokes")
    case.assert_equal(2, swapped.size(), "swapped HEAT fixture has two strokes")
    case.assert_equal(3, burst.size(), "BURST fixture has three strokes")

    var compile_started := Time.get_ticks_usec()
    var heat_compiled: Dictionary = recognizer.compile_checked(heat)
    var compile_elapsed := Time.get_ticks_usec() - compile_started
    case.assert_equal(&"OK", heat_compiled.get("status", &""), "HEAT compiles")
    case.assert_equal(8, int(heat_compiled.get("raw_variant_count", 0)), "two strokes create 2! × 2^2 raw variants")
    case.assert_equal(8, heat_compiled.get("variants", []).size(), "HEAT variants remain distinct")
    case.assert_true(compile_elapsed >= 0, "compile elapsed microseconds are recorded without a product claim")

    var variants: Array = heat_compiled.get("variants", [])
    if not variants.is_empty():
        var match_started := Time.get_ticks_usec()
        var heat_distance := float(recognizer.best_distance(heat, variants))
        var swapped_distance := float(recognizer.best_distance(swapped, variants))
        var match_elapsed := Time.get_ticks_usec() - match_started
        case.assert_near(heat_distance, swapped_distance, 0.05, "allowed stroke order variants remain equivalent")
        case.assert_true(heat_distance >= 0.0 and is_finite(heat_distance), "HEAT best distance is finite")
        case.assert_true(match_elapsed >= 0, "match elapsed microseconds are recorded without a product claim")

    var burst_compiled: Dictionary = recognizer.compile_checked(burst)
    case.assert_equal(&"OK", burst_compiled.get("status", &""), "BURST compiles")
    case.assert_equal(48, int(burst_compiled.get("raw_variant_count", 0)), "three strokes create 3! × 2^3 raw variants")
    case.assert_true(burst_compiled.get("variants", []).size() <= 48, "compiled variants never exceed Slice cap")
    case.assert_true(burst_compiled.get("variants", []).size() > 0, "BURST retains at least one compiled variant")

    var one_stroke: Array[PackedVector2Array] = [PackedVector2Array([
        Vector2(0.1, 0.2), Vector2(0.5, 0.8), Vector2(0.9, 0.3)
    ])]
    var one_compiled: Dictionary = recognizer.compile_checked(one_stroke)
    case.assert_equal(&"OK", one_compiled.get("status", &""), "one stroke compiles")
    case.assert_equal(2, int(one_compiled.get("raw_variant_count", 0)), "one stroke creates two direction variants")
    case.assert_true(one_compiled.get("variants", []).size() <= 2, "one-stroke dedup stays bounded")

    var four_strokes: Array[PackedVector2Array] = [
        PackedVector2Array([Vector2(0.1, 0.1), Vector2(0.9, 0.1)]),
        PackedVector2Array([Vector2(0.1, 0.3), Vector2(0.9, 0.3)]),
        PackedVector2Array([Vector2(0.1, 0.5), Vector2(0.9, 0.5)]),
        PackedVector2Array([Vector2(0.1, 0.7), Vector2(0.9, 0.7)]),
    ]
    var denied: Dictionary = recognizer.compile_checked(four_strokes)
    case.assert_equal(&"STROKE_COUNT_OUT_OF_SLICE_SCOPE", denied.get("status", &""), "four strokes are denied")
    case.assert_equal(0, denied.get("variants", []).size(), "denied input creates no cached variants")

    var empty: Dictionary = recognizer.compile_checked([])
    case.assert_equal(&"STROKE_COUNT_OUT_OF_SLICE_SCOPE", empty.get("status", &""), "zero strokes are denied")


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

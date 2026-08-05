class_name DollarNRecognizer
extends RefCounted

const MAX_SLICE_STROKES := 3
const MAX_COMPILED_VARIANTS := 48
const DOLLAR_ONE_PATH := "res://src/input/dollar_one_recognizer.gd"
const MATH_PATH := "res://src/input/point_cloud_math.gd"


func compile(strokes: Array[PackedVector2Array]) -> Array[PackedVector2Array]:
    var result: Dictionary = compile_checked(strokes)
    if result.get("status", &"") != &"OK":
        return []
    var output: Array[PackedVector2Array] = []
    for variant in result.get("variants", []):
        output.append(variant)
    return output


func compile_checked(strokes: Array) -> Dictionary:
    if strokes.size() < 1 or strokes.size() > MAX_SLICE_STROKES:
        return _error(&"STROKE_COUNT_OUT_OF_SLICE_SCOPE")

    var math_script = load(MATH_PATH)
    var dollar_one_script = load(DOLLAR_ONE_PATH)
    if math_script == null or dollar_one_script == null or not dollar_one_script.can_instantiate():
        return _error(&"RECOGNIZER_DEPENDENCY_UNAVAILABLE")

    var validated: Array[PackedVector2Array] = []
    for stroke_variant in strokes:
        if not stroke_variant is PackedVector2Array:
            return _error(&"INVALID_STROKE")
        var stroke: PackedVector2Array = stroke_variant
        var validation: Dictionary = math_script.validate_points(stroke)
        if validation.get("status", &"") != &"OK":
            return _error(validation.get("status", &"INVALID_STROKE"))
        validated.append(stroke.duplicate())

    var orders: Array = _permutations(validated)
    var raw_variant_count := orders.size() * (1 << validated.size())
    if raw_variant_count > MAX_COMPILED_VARIANTS:
        return _error(&"VARIANT_COUNT_OUT_OF_SLICE_SCOPE")

    var dollar_one = dollar_one_script.new()
    var variants: Array[PackedVector2Array] = []
    var seen_hashes := {}
    for order_variant in orders:
        var order: Array = order_variant
        for direction_mask in range(1 << validated.size()):
            var unistroke := PackedVector2Array()
            for stroke_index in order.size():
                var source: PackedVector2Array = order[stroke_index]
                var oriented: PackedVector2Array = source.duplicate()
                if (direction_mask & (1 << stroke_index)) != 0:
                    oriented.reverse()
                for point in oriented:
                    unistroke.append(point)
            var compiled: PackedVector2Array = dollar_one.compile(unistroke)
            if compiled.is_empty():
                return _error(&"VARIANT_COMPILE_FAILED")
            var hash_key := _compiled_hash(compiled)
            if not seen_hashes.has(hash_key):
                seen_hashes[hash_key] = true
                variants.append(compiled)

    if variants.is_empty() or variants.size() > MAX_COMPILED_VARIANTS:
        return _error(&"INVALID_COMPILED_VARIANT_COUNT")
    return {
        "status": &"OK",
        "raw_variant_count": raw_variant_count,
        "variants": variants,
    }


func best_distance(input_strokes: Array, compiled_variants: Array) -> float:
    if input_strokes.size() < 1 or input_strokes.size() > MAX_SLICE_STROKES:
        return INF
    if compiled_variants.is_empty() or compiled_variants.size() > MAX_COMPILED_VARIANTS:
        return INF

    var math_script = load(MATH_PATH)
    var dollar_one_script = load(DOLLAR_ONE_PATH)
    if math_script == null or dollar_one_script == null or not dollar_one_script.can_instantiate():
        return INF

    var unistroke := PackedVector2Array()
    for stroke_variant in input_strokes:
        if not stroke_variant is PackedVector2Array:
            return INF
        var stroke: PackedVector2Array = stroke_variant
        var validation: Dictionary = math_script.validate_points(stroke)
        if validation.get("status", &"") != &"OK":
            return INF
        for point in stroke:
            unistroke.append(point)

    var dollar_one = dollar_one_script.new()
    var best := INF
    for compiled_variant in compiled_variants:
        if not compiled_variant is PackedVector2Array:
            return INF
        var distance: float = float(dollar_one.distance(unistroke, compiled_variant))
        best = minf(best, distance)
    return best


func _permutations(strokes: Array[PackedVector2Array]) -> Array:
    if strokes.size() <= 1:
        return [strokes.duplicate()]
    var output: Array = []
    for index in strokes.size():
        var remaining: Array[PackedVector2Array] = strokes.duplicate()
        var selected: PackedVector2Array = remaining[index]
        remaining.remove_at(index)
        for suffix_variant in _permutations(remaining):
            var permutation: Array[PackedVector2Array] = [selected]
            for suffix_stroke in suffix_variant:
                permutation.append(suffix_stroke)
            output.append(permutation)
    return output


func _compiled_hash(points: PackedVector2Array) -> String:
    var parts: PackedStringArray = []
    for point in points:
        parts.append("%.4f,%.4f" % [point.x, point.y])
    return "|".join(parts)


func _error(status: StringName) -> Dictionary:
    return {
        "status": status,
        "raw_variant_count": 0,
        "variants": [],
    }

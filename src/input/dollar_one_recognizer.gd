class_name DollarOneRecognizer
extends RefCounted

const SAMPLE_COUNT := 64
const SQUARE_SIZE := 250.0
const MATH_PATH := "res://src/input/point_cloud_math.gd"


func compile(points: PackedVector2Array) -> PackedVector2Array:
    var result: Dictionary = compile_checked(points)
    if result.get("status", &"") != &"OK":
        return PackedVector2Array()
    return result.get("points", PackedVector2Array())


func compile_checked(points: PackedVector2Array) -> Dictionary:
    var math_script = load(MATH_PATH)
    if math_script == null:
        return {"status": &"MATH_UNAVAILABLE", "points": PackedVector2Array()}
    var validation: Dictionary = math_script.validate_points(points)
    if validation.get("status", &"") != &"OK":
        return {"status": validation.get("status", &"INSUFFICIENT_POINTS"), "points": PackedVector2Array()}

    var resampled: PackedVector2Array = math_script.resample(points, SAMPLE_COUNT)
    if resampled.size() != SAMPLE_COUNT:
        return {"status": &"RESAMPLE_FAILED", "points": PackedVector2Array()}
    var angle: float = float(math_script.indicative_angle(resampled))
    var rotated: PackedVector2Array = math_script.rotate_by(resampled, -angle)
    var scaled: PackedVector2Array = math_script.scale_to_square(rotated, SQUARE_SIZE)
    var normalized: PackedVector2Array = math_script.translate_to_origin(scaled)
    if normalized.size() != SAMPLE_COUNT:
        return {"status": &"NORMALIZATION_FAILED", "points": PackedVector2Array()}
    return {"status": &"OK", "points": normalized}


func distance(input_points: PackedVector2Array, compiled_template: PackedVector2Array) -> float:
    if compiled_template.size() != SAMPLE_COUNT:
        return INF
    var input_result: Dictionary = compile_checked(input_points)
    if input_result.get("status", &"") != &"OK":
        return INF
    var math_script = load(MATH_PATH)
    if math_script == null:
        return INF
    return float(math_script.path_distance(input_result.get("points", PackedVector2Array()), compiled_template))

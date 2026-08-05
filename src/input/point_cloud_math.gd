class_name PointCloudMath
extends RefCounted

const EPSILON := 0.000001


static func validate_points(points: PackedVector2Array) -> Dictionary:
    if points.size() < 2:
        return {"status": &"INSUFFICIENT_POINTS"}
    var first := points[0]
    if not _is_finite_point(first):
        return {"status": &"NON_FINITE_POINT"}
    var has_distinct := false
    for point in points:
        if not _is_finite_point(point):
            return {"status": &"NON_FINITE_POINT"}
        if not point.is_equal_approx(first):
            has_distinct = true
    if not has_distinct or path_length(points) <= EPSILON:
        return {"status": &"INSUFFICIENT_POINTS"}
    return {"status": &"OK"}


static func path_length(points: PackedVector2Array) -> float:
    if points.size() < 2:
        return 0.0
    var total := 0.0
    for index in range(1, points.size()):
        var previous := points[index - 1]
        var current := points[index]
        if not _is_finite_point(previous) or not _is_finite_point(current):
            return INF
        total += previous.distance_to(current)
    return total


static func resample(points: PackedVector2Array, count: int) -> PackedVector2Array:
    if count < 2 or validate_points(points).get("status", &"") != &"OK":
        return PackedVector2Array()
    var total := path_length(points)
    if not is_finite(total) or total <= EPSILON:
        return PackedVector2Array()
    var interval := total / float(count - 1)
    var result := PackedVector2Array([points[0]])
    var accumulated := 0.0

    for index in range(1, points.size()):
        var segment_start := points[index - 1]
        var segment_end := points[index]
        var segment_length := segment_start.distance_to(segment_end)
        if segment_length <= EPSILON:
            continue
        while accumulated + segment_length >= interval and result.size() < count:
            var ratio := (interval - accumulated) / segment_length
            var sample := segment_start.lerp(segment_end, clampf(ratio, 0.0, 1.0))
            result.append(sample)
            segment_start = sample
            segment_length = segment_start.distance_to(segment_end)
            accumulated = 0.0
            if segment_length <= EPSILON:
                break
        accumulated += segment_length

    while result.size() < count:
        result.append(points[points.size() - 1])
    if result.size() > count:
        result.resize(count)
    return result


static func indicative_angle(points: PackedVector2Array) -> float:
    if points.is_empty():
        return 0.0
    var center := centroid(points)
    var vector := points[0] - center
    return atan2(vector.y, vector.x)


static func rotate_by(points: PackedVector2Array, radians: float) -> PackedVector2Array:
    if points.is_empty() or not is_finite(radians):
        return PackedVector2Array()
    var center := centroid(points)
    var cosine := cos(radians)
    var sine := sin(radians)
    var rotated := PackedVector2Array()
    for point in points:
        var offset := point - center
        rotated.append(Vector2(
            offset.x * cosine - offset.y * sine,
            offset.x * sine + offset.y * cosine
        ) + center)
    return rotated


static func scale_to_square(points: PackedVector2Array, size: float) -> PackedVector2Array:
    if points.is_empty() or size <= 0.0 or not is_finite(size):
        return PackedVector2Array()
    var minimum := points[0]
    var maximum := points[0]
    for point in points:
        if not _is_finite_point(point):
            return PackedVector2Array()
        minimum.x = minf(minimum.x, point.x)
        minimum.y = minf(minimum.y, point.y)
        maximum.x = maxf(maximum.x, point.x)
        maximum.y = maxf(maximum.y, point.y)
    var dimensions := maximum - minimum
    var dominant := maxf(dimensions.x, dimensions.y)
    if dominant <= EPSILON:
        return PackedVector2Array()
    var factor := size / dominant
    var scaled := PackedVector2Array()
    for point in points:
        scaled.append((point - minimum) * factor)
    return scaled


static func translate_to_origin(points: PackedVector2Array) -> PackedVector2Array:
    if points.is_empty():
        return PackedVector2Array()
    var center := centroid(points)
    var translated := PackedVector2Array()
    for point in points:
        translated.append(point - center)
    return translated


static func path_distance(a: PackedVector2Array, b: PackedVector2Array) -> float:
    if a.is_empty() or a.size() != b.size():
        return INF
    var total := 0.0
    for index in a.size():
        if not _is_finite_point(a[index]) or not _is_finite_point(b[index]):
            return INF
        total += a[index].distance_to(b[index])
    return total / float(a.size())


static func centroid(points: PackedVector2Array) -> Vector2:
    if points.is_empty():
        return Vector2.ZERO
    var total := Vector2.ZERO
    for point in points:
        total += point
    return total / float(points.size())


static func _is_finite_point(point: Vector2) -> bool:
    return is_finite(point.x) and is_finite(point.y)

class_name Stage2BridgeFixtureRepository
extends RefCounted

const SELF_PATH := "res://src/core/stage2/stage2_bridge_fixture_repository.gd"

var _runtime_glyph_ids: Array[StringName] = []
var _fixture_order: Array[StringName] = []
var _fixtures: Dictionary = {}


static func create(path: String):
    if path.is_empty() or not FileAccess.file_exists(path):
        return null
    var file := FileAccess.open(path, FileAccess.READ)
    if file == null:
        return null
    var parsed: Variant = JSON.parse_string(file.get_as_text())
    if typeof(parsed) != TYPE_DICTIONARY:
        return null
    var data: Dictionary = parsed
    if int(data.get("schema_version", -1)) != 1:
        return null

    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var repository = script.new()

    var runtime_raw: Variant = data.get("runtime_glyph_ids", null)
    var fixtures_raw: Variant = data.get("fixtures", null)
    if typeof(runtime_raw) != TYPE_ARRAY or typeof(fixtures_raw) != TYPE_ARRAY:
        return null
    if runtime_raw.size() != 6 or fixtures_raw.size() != 2:
        return null

    var seen_glyphs: Dictionary = {}
    for glyph_variant in runtime_raw:
        var glyph_id := StringName(glyph_variant)
        if glyph_id.is_empty() or seen_glyphs.has(glyph_id):
            return null
        seen_glyphs[glyph_id] = true
        repository._runtime_glyph_ids.append(glyph_id)

    for fixture_variant in fixtures_raw:
        if typeof(fixture_variant) != TYPE_DICTIONARY:
            return null
        var fixture: Dictionary = fixture_variant
        var fixture_id := StringName(fixture.get("fixture_id", ""))
        var targets: Variant = fixture.get("targets", null)
        var frames: Variant = fixture.get("solution_frames", null)
        var allowed: Variant = fixture.get("allowed_runtime_glyph_ids", null)
        if fixture_id.is_empty() or repository._fixtures.has(fixture_id):
            return null
        if typeof(targets) != TYPE_ARRAY or targets.is_empty() or targets.size() > 4:
            return null
        if typeof(frames) != TYPE_ARRAY or frames.size() < 2:
            return null
        if typeof(allowed) != TYPE_ARRAY or allowed.size() != 6:
            return null
        if fixture.has("best_glyph") or fixture.has("single_correct_solution"):
            return null

        var normalized := fixture.duplicate(true)
        normalized["fixture_id"] = fixture_id
        normalized["targets"] = _string_name_array(targets)
        normalized["allowed_runtime_glyph_ids"] = _string_name_array(allowed)
        repository._fixture_order.append(fixture_id)
        repository._fixtures[fixture_id] = normalized

    return repository


func fixture_ids() -> Array[StringName]:
    return _fixture_order.duplicate()


func runtime_glyph_ids() -> Array[StringName]:
    return _runtime_glyph_ids.duplicate()


func fixture(fixture_id: StringName) -> Dictionary:
    return Dictionary(_fixtures.get(fixture_id, {})).duplicate(true)


static func _string_name_array(values: Array) -> Array[StringName]:
    var normalized: Array[StringName] = []
    for value in values:
        normalized.append(StringName(value))
    return normalized

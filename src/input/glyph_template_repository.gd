class_name GlyphTemplateRepository
extends RefCounted

const DEFINITION_SCRIPT_PATH := "res://src/input/glyph_definition.gd"

var _definitions: Dictionary = {}
var _templates_by_glyph: Dictionary = {}
var _slice_ids: Array[StringName] = []


static func load_from_paths(vocabulary_path: String, template_directory: String) -> Dictionary:
    var vocabulary_result := _load_json_dictionary(vocabulary_path)
    if vocabulary_result.get("status", &"") != &"OK":
        return _invalid(vocabulary_path, vocabulary_result.get("reason", &"INVALID_VOCABULARY_JSON"))

    var definition_script = load(DEFINITION_SCRIPT_PATH)
    if definition_script == null or not definition_script.can_instantiate():
        return _invalid(DEFINITION_SCRIPT_PATH, &"DEFINITION_SCRIPT_UNAVAILABLE")

    var repository_script = load("res://src/input/glyph_template_repository.gd")
    if repository_script == null or not repository_script.can_instantiate():
        return _invalid("res://src/input/glyph_template_repository.gd", &"REPOSITORY_SCRIPT_UNAVAILABLE")
    var repository = repository_script.new()

    var vocabulary: Dictionary = vocabulary_result.get("value", {})
    var entries = vocabulary.get("entries", [])
    if typeof(entries) != TYPE_ARRAY:
        return _invalid(vocabulary_path, &"INVALID_VOCABULARY_ENTRIES")

    for entry_variant in entries:
        if typeof(entry_variant) != TYPE_DICTIONARY:
            return _invalid(vocabulary_path, &"INVALID_VOCABULARY_ENTRY")
        var parsed = definition_script.from_dict(entry_variant)
        if parsed.get("status", &"") != &"OK":
            return _invalid(vocabulary_path, &"INVALID_VOCABULARY_ENTRY")
        var definition = parsed.get("value")
        var glyph_id: StringName = definition.glyph_id()
        if repository._definitions.has(glyph_id):
            return _invalid(vocabulary_path, &"DUPLICATE_GLYPH_ID")
        repository._definitions[glyph_id] = definition
        if definition.is_slice_enabled():
            repository._slice_ids.append(glyph_id)
            repository._templates_by_glyph[glyph_id] = []

    repository._slice_ids.sort_custom(func(a: StringName, b: StringName) -> bool: return String(a) < String(b))

    var directory := DirAccess.open(template_directory)
    if directory == null:
        return _invalid(template_directory, &"TEMPLATE_DIRECTORY_UNAVAILABLE")
    var files := directory.get_files()
    files.sort()
    var seen_template_ids := {}

    for file_name in files:
        if not String(file_name).to_lower().ends_with(".json"):
            continue
        var file_path := template_directory.path_join(file_name)
        var template_result := _load_json_dictionary(file_path)
        if template_result.get("status", &"") != &"OK":
            return _invalid(file_path, template_result.get("reason", &"INVALID_TEMPLATE_JSON"))
        var parsed_template := _validate_template(
            template_result.get("value", {}),
            repository._definitions,
            repository._slice_ids,
            seen_template_ids
        )
        if parsed_template.get("status", &"") != &"OK":
            return _invalid(file_path, parsed_template.get("reason", &"INVALID_TEMPLATE"))
        var template: Dictionary = parsed_template.get("value", {})
        var template_id: StringName = template.get("template_id", &"")
        var glyph_id: StringName = template.get("glyph_id", &"")
        seen_template_ids[template_id] = true
        repository._templates_by_glyph[glyph_id].append(template)

    for glyph_id in repository._slice_ids:
        var glyph_templates: Array = repository._templates_by_glyph.get(glyph_id, [])
        if glyph_templates.is_empty():
            return _invalid(template_directory, &"MISSING_SLICE_TEMPLATE")
        glyph_templates.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
            return String(a.get("template_id", "")) < String(b.get("template_id", ""))
        )

    return {"status": &"OK", "value": repository}


func definition(glyph_id: StringName):
    return _definitions.get(glyph_id)


func templates(glyph_id: StringName) -> Array[Dictionary]:
    var source: Array = _templates_by_glyph.get(glyph_id, [])
    var copy: Array[Dictionary] = []
    for template_variant in source:
        copy.append((template_variant as Dictionary).duplicate(true))
    return copy


func slice_glyph_ids() -> Array[StringName]:
    return _slice_ids.duplicate()


static func _validate_template(
    data: Dictionary,
    definitions: Dictionary,
    slice_ids: Array[StringName],
    seen_template_ids: Dictionary
) -> Dictionary:
    if int(data.get("schema_version", 0)) != 1:
        return _template_invalid(&"INVALID_SCHEMA_VERSION")
    for key_variant in data.keys():
        var key := String(key_variant).to_lower()
        if key.contains("ornament"):
            return _template_invalid(&"ORNAMENT_FIELD_PROHIBITED")

    var template_id := StringName(data.get("template_id", ""))
    var glyph_id := StringName(data.get("glyph_id", ""))
    if String(template_id).strip_edges().is_empty():
        return _template_invalid(&"MISSING_TEMPLATE_ID")
    if seen_template_ids.has(template_id):
        return _template_invalid(&"DUPLICATE_TEMPLATE_ID")
    if not definitions.has(glyph_id):
        return _template_invalid(&"UNKNOWN_GLYPH_ID")
    if not slice_ids.has(glyph_id):
        return _template_invalid(&"NON_SLICE_TEMPLATE_PROHIBITED")
    if String(data.get("source", "")) != "DEVELOPER_REFERENCE":
        return _template_invalid(&"INVALID_TEMPLATE_SOURCE")

    var raw_strokes = data.get("strokes", null)
    if typeof(raw_strokes) != TYPE_ARRAY:
        return _template_invalid(&"INVALID_STROKES")
    if raw_strokes.size() > 3:
        return _template_invalid(&"TOO_MANY_STROKES")
    var definition = definitions.get(glyph_id)
    if raw_strokes.size() != definition.preferred_strokes():
        return _template_invalid(&"STROKE_COUNT_MISMATCH")

    var strokes: Array[PackedVector2Array] = []
    for raw_stroke_variant in raw_strokes:
        if typeof(raw_stroke_variant) != TYPE_ARRAY:
            return _template_invalid(&"INVALID_STROKE")
        var raw_stroke: Array = raw_stroke_variant
        if raw_stroke.size() < 2:
            return _template_invalid(&"INVALID_STROKE")
        var stroke := PackedVector2Array()
        var first_point := Vector2.ZERO
        var has_distinct_point := false
        for point_index in raw_stroke.size():
            var raw_point = raw_stroke[point_index]
            if typeof(raw_point) != TYPE_ARRAY or raw_point.size() != 2:
                return _template_invalid(&"INVALID_POINT")
            var x_value = raw_point[0]
            var y_value = raw_point[1]
            if not _is_number(x_value) or not _is_number(y_value):
                return _template_invalid(&"INVALID_POINT")
            var point := Vector2(float(x_value), float(y_value))
            if not is_finite(point.x) or not is_finite(point.y):
                return _template_invalid(&"NON_FINITE_POINT")
            if point.x < 0.0 or point.x > 1.0 or point.y < 0.0 or point.y > 1.0:
                return _template_invalid(&"POINT_OUTSIDE_NORMALIZED_SQUARE")
            if point_index == 0:
                first_point = point
            elif not point.is_equal_approx(first_point):
                has_distinct_point = true
            stroke.append(point)
        if not has_distinct_point:
            return _template_invalid(&"IDENTICAL_ONLY_STROKE")
        strokes.append(stroke)

    return {
        "status": &"OK",
        "value": {
            "schema_version": 1,
            "template_id": template_id,
            "glyph_id": glyph_id,
            "source": &"DEVELOPER_REFERENCE",
            "strokes": strokes,
        },
    }


static func _load_json_dictionary(path: String) -> Dictionary:
    if not FileAccess.file_exists(path):
        return {"status": &"ERROR", "reason": &"FILE_NOT_FOUND"}
    var parser := JSON.new()
    var parse_error := parser.parse(FileAccess.get_file_as_string(path))
    if parse_error != OK or typeof(parser.data) != TYPE_DICTIONARY:
        return {"status": &"ERROR", "reason": &"INVALID_JSON"}
    return {"status": &"OK", "value": parser.data}


static func _is_number(value: Variant) -> bool:
    return typeof(value) == TYPE_INT or typeof(value) == TYPE_FLOAT


static func _template_invalid(reason: StringName) -> Dictionary:
    return {"status": &"INVALID", "reason": reason}


static func _invalid(path: String, reason: StringName) -> Dictionary:
    return {
        "status": &"INVALID_GLYPH_TEMPLATE_REPOSITORY",
        "path": path,
        "reason": reason,
        "value": null,
    }

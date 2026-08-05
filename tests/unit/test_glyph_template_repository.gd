extends RefCounted

const REPOSITORY_PATH := "res://src/input/glyph_template_repository.gd"
const VOCABULARY_PATH := "res://data/glyphs/v1/glyph_vocabulary_v1.json"
const TEMPLATE_DIRECTORY := "res://data/glyphs/v1/slice_templates"
const TEMP_ROOT := "user://glyph_template_repository_tests"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(REPOSITORY_PATH), "glyph_template_repository.gd must exist")
    if not FileAccess.file_exists(REPOSITORY_PATH):
        return

    var repository_script = load(REPOSITORY_PATH)
    case.assert_true(repository_script != null, "GlyphTemplateRepository script loads")
    if repository_script == null:
        return
    case.assert_true(repository_script.can_instantiate(), "GlyphTemplateRepository compiles")
    if not repository_script.can_instantiate():
        return

    var loaded = repository_script.load_from_paths(VOCABULARY_PATH, TEMPLATE_DIRECTORY)
    case.assert_equal(&"OK", loaded.get("status", &""), "repository loads valid data")
    if loaded.get("status", &"") == &"OK":
        var repository = loaded.get("value")
        case.assert_equal(
            [&"BURST", &"DISPERSE", &"FLOW", &"FOCUS", &"HEAT", &"PROTECT"],
            repository.slice_glyph_ids(),
            "Slice IDs are stable and sorted"
        )
        for glyph_id in repository.slice_glyph_ids():
            case.assert_true(repository.definition(glyph_id) != null, "Slice definition exists: %s" % glyph_id)
            case.assert_true(repository.templates(glyph_id).size() >= 1, "Slice glyph has template: %s" % glyph_id)
        case.assert_equal(0, repository.templates(&"COLD").size(), "non-Slice glyph has no runtime template")
        var heat_templates: Array = repository.templates(&"HEAT")
        if not heat_templates.is_empty():
            case.assert_equal(&"heat-01", heat_templates[0].get("template_id", &""), "stable HEAT template id")
            case.assert_equal(2, heat_templates[0].get("strokes", []).size(), "HEAT stroke count matches definition")

    _reset_temp_root()
    _write_template("unknown", {
        "schema_version": 1,
        "template_id": "unknown-01",
        "glyph_id": "UNKNOWN",
        "source": "DEVELOPER_REFERENCE",
        "strokes": [[[0.1, 0.1], [0.9, 0.9]]],
    })
    _assert_invalid(case, repository_script, &"UNKNOWN_GLYPH_ID", "unknown glyph id is rejected")

    _reset_temp_root()
    var valid_flow := {
        "schema_version": 1,
        "template_id": "duplicate-01",
        "glyph_id": "FLOW",
        "source": "DEVELOPER_REFERENCE",
        "strokes": [[[0.2, 0.2], [0.8, 0.8]]],
    }
    _write_template("duplicate-a", valid_flow)
    _write_template("duplicate-b", valid_flow)
    _assert_invalid(case, repository_script, &"DUPLICATE_TEMPLATE_ID", "duplicate template ids are rejected")

    _reset_temp_root()
    _write_template("outside", {
        "schema_version": 1,
        "template_id": "outside-01",
        "glyph_id": "FLOW",
        "source": "DEVELOPER_REFERENCE",
        "strokes": [[[-0.1, 0.1], [0.8, 0.8]]],
    })
    _assert_invalid(case, repository_script, &"POINT_OUTSIDE_NORMALIZED_SQUARE", "outside points are rejected")

    _reset_temp_root()
    _write_template("empty", {
        "schema_version": 1,
        "template_id": "empty-01",
        "glyph_id": "FLOW",
        "source": "DEVELOPER_REFERENCE",
        "strokes": [[]],
    })
    _assert_invalid(case, repository_script, &"INVALID_STROKE", "empty stroke is rejected")

    _reset_temp_root()
    _write_template("identical", {
        "schema_version": 1,
        "template_id": "identical-01",
        "glyph_id": "FLOW",
        "source": "DEVELOPER_REFERENCE",
        "strokes": [[[0.5, 0.5], [0.5, 0.5], [0.5, 0.5]]],
    })
    _assert_invalid(case, repository_script, &"IDENTICAL_ONLY_STROKE", "identical-only stroke is rejected")

    _reset_temp_root()
    _write_template("ornament", {
        "schema_version": 1,
        "template_id": "ornament-01",
        "glyph_id": "FLOW",
        "source": "DEVELOPER_REFERENCE",
        "ornament": "outer_ring",
        "strokes": [[[0.2, 0.2], [0.8, 0.8]]],
    })
    _assert_invalid(case, repository_script, &"ORNAMENT_FIELD_PROHIBITED", "ornament fields are rejected")

    _reset_temp_root()
    _write_template("four-strokes", {
        "schema_version": 1,
        "template_id": "four-strokes-01",
        "glyph_id": "BURST",
        "source": "DEVELOPER_REFERENCE",
        "strokes": [
            [[0.1, 0.1], [0.9, 0.9]],
            [[0.9, 0.1], [0.1, 0.9]],
            [[0.5, 0.1], [0.5, 0.9]],
            [[0.1, 0.5], [0.9, 0.5]]
        ],
    })
    _assert_invalid(case, repository_script, &"TOO_MANY_STROKES", "more than three strokes are rejected")

    _reset_temp_root()


func _assert_invalid(case, repository_script, expected_reason: StringName, message: String) -> void:
    var loaded = repository_script.load_from_paths(VOCABULARY_PATH, TEMP_ROOT)
    case.assert_equal(&"INVALID_GLYPH_TEMPLATE_REPOSITORY", loaded.get("status", &""), message)
    case.assert_equal(expected_reason, loaded.get("reason", &""), "%s reason" % message)
    case.assert_true(String(loaded.get("path", "")).begins_with(TEMP_ROOT), "%s includes source path" % message)


func _write_template(file_stem: String, data: Dictionary) -> void:
    var global_root := ProjectSettings.globalize_path(TEMP_ROOT)
    DirAccess.make_dir_recursive_absolute(global_root)
    var file = FileAccess.open("%s/%s.json" % [TEMP_ROOT, file_stem], FileAccess.WRITE)
    file.store_string(JSON.stringify(data))
    file.close()


func _reset_temp_root() -> void:
    var global_root := ProjectSettings.globalize_path(TEMP_ROOT)
    if DirAccess.dir_exists_absolute(global_root):
        _remove_directory_contents(global_root)
    else:
        DirAccess.make_dir_recursive_absolute(global_root)


func _remove_directory_contents(global_path: String) -> void:
    var directory := DirAccess.open(global_path)
    if directory == null:
        return
    directory.list_dir_begin()
    var name := directory.get_next()
    while not name.is_empty():
        if name != "." and name != "..":
            var child := global_path.path_join(name)
            if directory.current_is_dir():
                _remove_directory_contents(child)
                DirAccess.remove_absolute(child)
            else:
                DirAccess.remove_absolute(child)
        name = directory.get_next()
    directory.list_dir_end()

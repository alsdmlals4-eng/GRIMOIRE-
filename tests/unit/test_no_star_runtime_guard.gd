extends RefCounted

const STAR_ONLY_DIRECTORIES := [
    "res://src/core/star",
    "res://src/core/spells",
    "res://src/core/workflow",
    "res://src/ui/spell_workflow",
]

const STAR_ONLY_FILES := [
    "res://src/input/focus_scribe_recognition_coordinator.gd",
    "res://src/ui/star_circuit_harness.gd",
    "res://src/ui/star_circuit_harness.tscn",
    "res://src/ui/star_circuit_layout_model.gd",
    "res://src/ui/components/five_point_star_composer.gd",
    "res://src/ui/components/five_point_star_composer.tscn",
    "res://src/ui/components/star_circuit_board.gd",
    "res://src/ui/components/star_circuit_board.tscn",
    "res://src/ui/component_sheets/component_sheet_b_spell_workflow.gd",
    "res://src/ui/component_sheets/component_sheet_b_spell_workflow.tscn",
]


func run(case) -> void:
    for directory_path in STAR_ONLY_DIRECTORIES:
        case.assert_false(
            DirAccess.dir_exists_absolute(ProjectSettings.globalize_path(directory_path)),
            "Circle/Clock runtime removes star-only directory: %s" % directory_path
        )
    for file_path in STAR_ONLY_FILES:
        case.assert_false(FileAccess.file_exists(file_path), "Circle/Clock runtime removes star-only file: %s" % file_path)

    var main_scene_path := str(ProjectSettings.get_setting("application/run/main_scene", ""))
    case.assert_equal("res://src/ui/front_door/story_front_door.tscn", main_scene_path, "Story front door remains the default runtime entry")

    var runner_text := FileAccess.get_file_as_string("res://tests/test_runner.gd")
    for forbidden_test_fragment in [
        "test_star_",
        "test_spell_workflow_",
        "test_spell_use_screen",
        "test_circuit_placement_workflow_screen",
        "test_glyph_drawing_workflow_screen",
        "test_glyph_source_loadout",
        "test_prepared_spell_inventory",
        "test_atomic_spell_",
        "test_focus_scribe_recognition",
        "test_glyph_visual_resolver",
    ]:
        case.assert_false(
            runner_text.contains(forbidden_test_fragment),
            "The current runner does not execute the retired star-flow suite: %s" % forbidden_test_fragment
        )

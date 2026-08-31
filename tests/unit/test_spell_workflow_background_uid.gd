extends RefCounted

const PRODUCT_ROOT_PATH := "res://src/ui/spell_workflow/spell_workflow_product_root.tscn"
const GREENHOUSE_BACKGROUND_PATH := "res://assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp"


func run(case) -> void:
    var expected_uid := ResourceUID.id_to_text(ResourceLoader.get_resource_uid(GREENHOUSE_BACKGROUND_PATH))
    case.assert_true(not expected_uid.is_empty(), "greenhouse background must have a Godot resource UID")
    if expected_uid.is_empty():
        return

    var scene_text := FileAccess.get_file_as_string(PRODUCT_ROOT_PATH)
    var expected_reference := 'uid="%s" path="%s"' % [expected_uid, GREENHOUSE_BACKGROUND_PATH]
    case.assert_true(
        scene_text.contains(expected_reference),
        "product root background reference must use the current greenhouse asset UID"
    )

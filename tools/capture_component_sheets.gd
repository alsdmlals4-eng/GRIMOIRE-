extends SceneTree

const SHEETS := {
    "a": "res://src/ui/component_sheets/component_sheet_a_foundations.tscn",
    "b": "res://src/ui/component_sheets/component_sheet_b_spell_workflow.tscn",
    "c": "res://src/ui/component_sheets/component_sheet_c_frostbloom_decision.tscn",
    "d": "res://src/ui/component_sheets/component_sheet_d_result_grimoire.tscn",
}
const SIZES := [Vector2i(1920, 1080), Vector2i(1280, 720)]
const EXPECTED_OUTPUTS := [
    "component-sheet-a-1920x1080.png",
    "component-sheet-a-1280x720.png",
    "component-sheet-b-1920x1080.png",
    "component-sheet-b-1280x720.png",
    "component-sheet-c-1920x1080.png",
    "component-sheet-c-1280x720.png",
    "component-sheet-d-1920x1080.png",
    "component-sheet-d-1280x720.png",
]
const MIN_BYTES := 10000
const CONTENT_PATH := NodePath("Frame/Margin/Content")
const CLIP_EPSILON := 0.5


func _initialize() -> void:
    call_deferred("_capture_all")


func _capture_all() -> void:
    var output_directory := ProjectSettings.globalize_path("res://build/visual")
    var directory_error := DirAccess.make_dir_recursive_absolute(output_directory)
    if directory_error != OK:
        push_error("Could not create component sheet capture directory: %s" % output_directory)
        quit(1)
        return

    var captured: Array[Dictionary] = []
    for sheet_id in ["a", "b", "c", "d"]:
        var packed := load(SHEETS[sheet_id]) as PackedScene
        if packed == null or not packed.can_instantiate():
            push_error("Could not load component sheet: %s" % SHEETS[sheet_id])
            quit(1)
            return
        for size in SIZES:
            var receipt := await _capture_one(sheet_id, packed, size)
            if receipt.is_empty():
                quit(1)
                return
            captured.append(receipt)

    if captured.size() != EXPECTED_OUTPUTS.size():
        push_error("Expected %d captures, got %d" % [EXPECTED_OUTPUTS.size(), captured.size()])
        quit(1)
        return

    print(JSON.stringify({
        "schema_version": 1,
        "capture_count": captured.size(),
        "captures": captured,
        "automated_visual_evidence": true,
        "human_visual_validation": "NOT_RUN",
        "physical_device_validation": "NOT_RUN",
        "final_art": false,
    }))
    quit(0)


func _capture_one(sheet_id: String, packed: PackedScene, size: Vector2i) -> Dictionary:
    var viewport := SubViewport.new()
    viewport.name = "ComponentSheetCapture_%s_%sx%s" % [sheet_id, size.x, size.y]
    viewport.size = size
    viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
    viewport.transparent_bg = false
    viewport.disable_3d = true
    root.add_child(viewport)

    var sheet = packed.instantiate()
    viewport.add_child(sheet)
    if sheet is Control:
        sheet.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    if sheet.has_method("initialize_demo"):
        sheet.call("initialize_demo")

    for _frame in range(5):
        await process_frame
        RenderingServer.force_draw(false, 0.0)

    if not _content_fits_viewport(sheet, size):
        viewport.queue_free()
        return {}

    var texture := viewport.get_texture()
    if texture == null:
        push_error("Component sheet viewport has no texture: %s" % sheet_id)
        viewport.queue_free()
        return {}
    var image := texture.get_image()
    if image == null or image.is_empty():
        push_error("Component sheet capture is empty: %s" % sheet_id)
        viewport.queue_free()
        return {}
    if image.get_width() != size.x or image.get_height() != size.y:
        push_error("Unexpected capture size for %s: %sx%s" % [sheet_id, image.get_width(), image.get_height()])
        viewport.queue_free()
        return {}

    var filename := "component-sheet-%s-%sx%s.png" % [sheet_id, size.x, size.y]
    var output_path := ProjectSettings.globalize_path("res://build/visual/%s" % filename)
    var save_error := image.save_png(output_path)
    if save_error != OK:
        push_error("Could not save component sheet capture %s: %s" % [filename, save_error])
        viewport.queue_free()
        return {}

    var file := FileAccess.open(output_path, FileAccess.READ)
    var byte_count := 0 if file == null else file.get_length()
    if byte_count < MIN_BYTES:
        push_error("Component sheet capture is suspiciously small: %s (%d bytes)" % [filename, byte_count])
        viewport.queue_free()
        return {}

    viewport.queue_free()
    return {
        "sheet": sheet_id,
        "path": "res://build/visual/%s" % filename,
        "width": size.x,
        "height": size.y,
        "bytes": byte_count,
    }


func _content_fits_viewport(sheet: Node, size: Vector2i) -> bool:
    var content := sheet.get_node_or_null(CONTENT_PATH) as Control
    if content == null:
        push_error("Component sheet is missing required content root: %s" % CONTENT_PATH)
        return false
    var rect := content.get_global_rect()
    var viewport_rect := Rect2(Vector2.ZERO, Vector2(size))
    var fits := (
        rect.position.x >= -CLIP_EPSILON
        and rect.position.y >= -CLIP_EPSILON
        and rect.end.x <= viewport_rect.end.x + CLIP_EPSILON
        and rect.end.y <= viewport_rect.end.y + CLIP_EPSILON
    )
    if not fits:
        push_error("CONTENT_BOUNDS clip: viewport=%sx%s content=%s" % [size.x, size.y, rect])
    return fits

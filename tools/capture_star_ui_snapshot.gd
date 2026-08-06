extends SceneTree

const HARNESS_SCENE := "res://src/ui/star_circuit_harness.tscn"
const DEFAULT_OUTPUT := "res://build/visual/star-ui-kit-v1.png"
const SNAPSHOT_SIZE := Vector2i(1280, 720)

var _output_path := DEFAULT_OUTPUT
var _capture_viewport: SubViewport


func _initialize() -> void:
    for argument in OS.get_cmdline_user_args():
        if argument.begins_with("--output="):
            _output_path = argument.trim_prefix("--output=")
    call_deferred("_capture")


func _capture() -> void:
    var packed := load(HARNESS_SCENE) as PackedScene
    if packed == null or not packed.can_instantiate():
        push_error("Could not load star UI harness for snapshot")
        quit(1)
        return

    _capture_viewport = SubViewport.new()
    _capture_viewport.name = "StarUiCaptureViewport"
    _capture_viewport.size = SNAPSHOT_SIZE
    _capture_viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
    _capture_viewport.transparent_bg = false
    _capture_viewport.disable_3d = true
    root.add_child(_capture_viewport)

    var harness := packed.instantiate()
    _capture_viewport.add_child(harness)
    if harness is Control:
        harness.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    if harness.has_method("initialize_demo"):
        harness.call("initialize_demo")

    for _frame in range(5):
        await process_frame
        RenderingServer.force_draw(false, 0.0)

    var viewport_texture := _capture_viewport.get_texture()
    if viewport_texture == null:
        push_error("Capture viewport has no render texture")
        quit(1)
        return
    var image := viewport_texture.get_image()
    if image == null or image.is_empty():
        push_error("Captured star UI image is empty")
        quit(1)
        return
    if image.get_width() != SNAPSHOT_SIZE.x or image.get_height() != SNAPSHOT_SIZE.y:
        push_error("Unexpected star UI snapshot size: %sx%s" % [image.get_width(), image.get_height()])
        quit(1)
        return

    var absolute_output := ProjectSettings.globalize_path(_output_path)
    var output_directory := absolute_output.get_base_dir()
    var directory_error := DirAccess.make_dir_recursive_absolute(output_directory)
    if directory_error != OK:
        push_error("Could not create snapshot directory: %s" % output_directory)
        quit(1)
        return
    var save_error := image.save_png(absolute_output)
    if save_error != OK:
        push_error("Could not save star UI snapshot: %s" % save_error)
        quit(1)
        return

    var file := FileAccess.open(absolute_output, FileAccess.READ)
    var byte_count := 0 if file == null else file.get_length()
    if byte_count < 10000:
        push_error("Star UI snapshot is suspiciously small: %s bytes" % byte_count)
        quit(1)
        return

    print(JSON.stringify({
        "schema_version": 1,
        "path": _output_path,
        "width": image.get_width(),
        "height": image.get_height(),
        "bytes": byte_count,
        "state": "EDIT",
        "renderer": RenderingServer.get_current_rendering_method(),
        "final_art": false,
    }))
    quit(0)

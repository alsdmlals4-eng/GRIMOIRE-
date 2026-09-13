@tool
extends EditorExportPlugin
## Only changes the export snapshot; project.godot is never saved here.
const KEY := "autoload/HeraGameInspector"
var original: Variant = null
var stripped := false
func _get_name() -> String:
    return "GrimoireStripEditorInspector"
func _export_begin(_features: PackedStringArray, _debug: bool, _path: String, _flags: int) -> void:
    if stripped or not ProjectSettings.has_setting(KEY): return
    original = ProjectSettings.get_setting(KEY)
    ProjectSettings.set_setting(KEY, null)
    stripped = true
func _export_end() -> void:
    restore()
func restore() -> void:
    if not stripped: return
    ProjectSettings.set_setting(KEY, original)
    ProjectSettings.set_initial_value(KEY, "")
    ProjectSettings.set_as_basic(KEY, true)
    original = null
    stripped = false

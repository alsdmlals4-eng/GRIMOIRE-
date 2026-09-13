@tool
extends EditorPlugin
var guard = preload("res://addons/grimoire_export_guard/strip_inspector.gd").new()
func _enter_tree() -> void:
    add_export_plugin(guard)
func _exit_tree() -> void:
    guard.restore()
    remove_export_plugin(guard)

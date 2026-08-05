class_name SaveRepository
extends RefCounted

var _path := "user://glyph_resource_poc.json"


func configure(value: String) -> void:
    _path = value


func save(data: Dictionary) -> Dictionary:
    var temp := _path + ".tmp"
    var backup := _path + ".bak"
    _remove_if_exists(temp)

    var file = FileAccess.open(temp, FileAccess.WRITE)
    if file == null:
        return {"ok": false, "error": &"TEMP_OPEN_FAILED"}
    file.store_string(JSON.stringify(data))
    file.close()

    var parsed = JSON.parse_string(FileAccess.get_file_as_string(temp))
    if typeof(parsed) != TYPE_DICTIONARY:
        _remove_if_exists(temp)
        return {"ok": false, "error": &"TEMP_VALIDATION_FAILED"}

    var global_main := ProjectSettings.globalize_path(_path)
    var global_temp := ProjectSettings.globalize_path(temp)
    var global_backup := ProjectSettings.globalize_path(backup)

    if FileAccess.file_exists(_path):
        _remove_if_exists(backup)
        var backup_error := DirAccess.rename_absolute(global_main, global_backup)
        if backup_error != OK:
            _remove_if_exists(temp)
            return {"ok": false, "error": &"BACKUP_RENAME_FAILED"}

    var rename_error := DirAccess.rename_absolute(global_temp, global_main)
    if rename_error != OK:
        if FileAccess.file_exists(backup) and not FileAccess.file_exists(_path):
            DirAccess.rename_absolute(global_backup, global_main)
        _remove_if_exists(temp)
        return {"ok": false, "error": &"ATOMIC_RENAME_FAILED"}

    return {"ok": true, "error": &""}


func load_latest() -> Dictionary:
    for candidate in [_path, _path + ".bak"]:
        if not FileAccess.file_exists(candidate):
            continue
        var parsed = JSON.parse_string(FileAccess.get_file_as_string(candidate))
        if typeof(parsed) == TYPE_DICTIONARY:
            return {"ok": true, "data": parsed, "source": candidate}
    return {"ok": false, "error": &"SAVE_CORRUPTION"}


func _remove_if_exists(path: String) -> void:
    if FileAccess.file_exists(path):
        DirAccess.remove_absolute(ProjectSettings.globalize_path(path))

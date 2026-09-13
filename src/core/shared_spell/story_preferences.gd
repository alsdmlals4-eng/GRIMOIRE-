extends "res://src/core/shared_spell/event_save.gd"
## Independent presentation settings, sharing the existing verified two-slot IO.
const SIZES := [24,28,32]

func _valid_payload(payload: Dictionary) -> bool:
    return payload.get("font_size") is int and payload.font_size in SIZES

func load_size(folder: String) -> int:
    var result := load_progress(ProjectSettings.globalize_path(folder).path_join("preferences"))
    return result.payload.font_size if result.status == "LOADED" else 24

func save_size(folder: String, size: int) -> bool:
    return save_progress(ProjectSettings.globalize_path(folder).path_join("preferences"),{"font_size":size}).status == "SAVED"

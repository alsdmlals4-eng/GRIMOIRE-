# 첫 세션 환경 PNG 후보를 원본 해상도 그대로 무손실 WebP 후보로 내보낸다.
extends SceneTree

const EXPORTS := [
	{
		"source": "res://assets/art/source_candidates/first_session_01/backgrounds/school/bg_school_common_candidate_01.png",
		"destination": "res://assets/art/backgrounds/school/bg_school_common.webp",
	},
	{
		"source": "res://assets/art/source_candidates/first_session_01/backgrounds/greenhouse/bg_greenhouse_field_base_candidate_01.png",
		"destination": "res://assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp",
	},
	{
		"source": "res://assets/art/source_candidates/first_session_01/backgrounds/greenhouse/bg_greenhouse_battle_arena_candidate_01.png",
		"destination": "res://assets/art/backgrounds/greenhouse/bg_greenhouse_battle_arena.webp",
	},
]


func _initialize() -> void:
	var receipts: Array[Dictionary] = []
	for export_spec in EXPORTS:
		var receipt := _export_one(export_spec)
		if receipt.is_empty():
			quit(1)
			return
		receipts.append(receipt)
	print(JSON.stringify({
		"export_count": receipts.size(),
		"format": "WEBP_LOSSLESS",
		"native_resolution_preserved": true,
		"exports": receipts,
		"runtime_validation": "NOT_RUN",
	}))
	quit(0)


func _export_one(export_spec: Dictionary) -> Dictionary:
	var source_path: String = export_spec.source
	var destination_path: String = export_spec.destination
	if not FileAccess.file_exists(source_path):
		push_error("missing source candidate: %s" % source_path)
		return {}
	var image := Image.load_from_file(source_path)
	if image.is_empty():
		push_error("unreadable source candidate: %s" % source_path)
		return {}
	if FileAccess.file_exists(destination_path):
		var existing := Image.load_from_file(destination_path)
		if existing.is_empty() or existing.get_size() != image.get_size():
			push_error("existing export cannot be safely reused: %s" % destination_path)
			return {}
		return {
			"source": source_path,
			"destination": destination_path,
			"width": existing.get_width(),
			"height": existing.get_height(),
			"reused": true,
		}
	var destination_directory := destination_path.get_base_dir()
	var directory_error := DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(destination_directory))
	if directory_error != OK:
		push_error("could not create export directory: %s" % destination_directory)
		return {}
	var save_error := image.save_webp(ProjectSettings.globalize_path(destination_path), true)
	if save_error != OK:
		push_error("could not export WebP: %s" % destination_path)
		return {}
	return {
		"source": source_path,
		"destination": destination_path,
		"width": image.get_width(),
		"height": image.get_height(),
		"reused": false,
	}

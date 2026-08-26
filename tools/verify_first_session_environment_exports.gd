# 첫 세션 환경 배경의 런타임 후보 형식과 원본 해상도를 확인한다.
extends SceneTree

const EXPECTED_EXPORTS := {
	"res://assets/art/backgrounds/school/bg_school_common.webp": Vector2i(1672, 941),
	"res://assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp": Vector2i(1672, 941),
	"res://assets/art/backgrounds/greenhouse/bg_greenhouse_battle_arena.webp": Vector2i(1672, 941),
}


func _initialize() -> void:
	var failures: Array[String] = []
	for export_path in EXPECTED_EXPORTS:
		if not FileAccess.file_exists(export_path):
			failures.append("missing export: %s" % export_path)
			continue
		var image := Image.load_from_file(export_path)
		if image.is_empty():
			failures.append("unreadable export: %s" % export_path)
			continue
		var expected_size: Vector2i = EXPECTED_EXPORTS[export_path]
		if image.get_size() != expected_size:
			failures.append("unexpected size: %s expected=%s actual=%s" % [export_path, expected_size, image.get_size()])
	if not failures.is_empty():
		for failure in failures:
			push_error(failure)
		quit(1)
		return
	print(JSON.stringify({
		"export_count": EXPECTED_EXPORTS.size(),
		"native_resolution_preserved": true,
		"runtime_validation": "NOT_RUN",
	}))
	quit(0)

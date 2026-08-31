# Task8 recovery evidence must stay outside Godot's active resource scan.
extends RefCounted

const RECOVERY_IGNORE_PATH := "res://artifacts/recovery/.gdignore"


func run(case) -> void:
    case.assert_true(
        FileAccess.file_exists(RECOVERY_IGNORE_PATH),
        "Task8 recovery evidence must be excluded from Godot resource scanning"
    )

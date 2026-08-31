# Rendered planning evidence must not be scanned as game resources.
extends RefCounted

const TMP_IGNORE_PATH := "res://tmp/.gdignore"


func run(case) -> void:
    case.assert_true(
        FileAccess.file_exists(TMP_IGNORE_PATH),
        "temporary planning renders must be excluded from Godot resource scanning"
    )

extends RefCounted

const PATH := "res://src/core/story/story_progress.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Story progress implementation must exist")

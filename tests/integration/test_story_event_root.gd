extends RefCounted

const PATH := "res://src/ui/story/story_event_root.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Story event root implementation must exist")

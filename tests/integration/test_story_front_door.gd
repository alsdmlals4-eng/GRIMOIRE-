extends RefCounted

const PATH := "res://src/ui/front_door/story_front_door.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Story front door implementation must exist")

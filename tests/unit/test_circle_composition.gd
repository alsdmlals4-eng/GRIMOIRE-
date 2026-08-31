extends RefCounted

const PATH := "res://src/core/circle/circle_composition.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Circle composition implementation must exist")

extends RefCounted

const PATH := "res://src/core/cards/card_ruleset.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Card ruleset implementation must exist")

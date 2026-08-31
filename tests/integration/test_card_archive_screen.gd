extends RefCounted

const PATH := "res://src/ui/cards/card_archive_screen.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Card archive screen implementation must exist")

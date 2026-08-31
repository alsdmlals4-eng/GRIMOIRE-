extends RefCounted

const PATH := "res://src/core/events/event_clock_resolver.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Event clock resolver implementation must exist")

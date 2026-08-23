extends Control

const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")
const FIXTURE_PATH := "res://data/testing/component_sheet_samples_v1.json"


func _ready() -> void:
    initialize_demo()


func initialize_demo() -> void:
    theme = ThemeFactory.create_theme()
    var data := _load_fixture()
    if data.is_empty():
        return

    var context: Dictionary = data.get("context", {})
    get_node("Frame/Margin/Content/Header").configure(
        str(context.get("location", "")),
        str(context.get("phase", "")),
        str(context.get("task", ""))
    )

    var targets: Array[Dictionary] = []
    for row in data.get("targets", []):
        if row is Dictionary:
            targets.append(row)
    get_node("Frame/Margin/Content/Body/TargetSelector").configure_targets(targets, &"root_layer")

    var composer = get_node("Frame/Margin/Content/Body/Composer")
    composer.set_visual_state(&"CONFIRM", 3, -1)

    var forecast: Dictionary = data.get("forecast", {})
    get_node("Frame/Margin/Content/CommitBar").configure(
        "Root Layer",
        int(forecast.get("MANA_COST", 0)),
        true,
        true
    )


func _load_fixture() -> Dictionary:
    var file := FileAccess.open(FIXTURE_PATH, FileAccess.READ)
    if file == null:
        return {}
    var parsed = JSON.parse_string(file.get_as_text())
    return parsed if parsed is Dictionary else {}

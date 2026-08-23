extends Control

const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")
const FIXTURE_PATH := "res://data/testing/component_sheet_samples_v1.json"
const AXIS_ORDER := [&"FACILITY", &"LIFE", &"SPIRIT", &"RELATIONSHIP", &"DISCOVERY"]
const AXIS_NODES := {
    &"FACILITY": "Frame/Margin/Content/ResultGrid/Facility",
    &"LIFE": "Frame/Margin/Content/ResultGrid/Life",
    &"SPIRIT": "Frame/Margin/Content/ResultGrid/Spirit",
    &"RELATIONSHIP": "Frame/Margin/Content/ResultGrid/Relationship",
    &"DISCOVERY": "Frame/Margin/Content/ResultGrid/Discovery",
}


func _ready() -> void:
    initialize_demo()


func initialize_demo() -> void:
    theme = ThemeFactory.create_theme()
    var data := _load_fixture()
    if data.is_empty():
        return

    var axes: Dictionary = data.get("result_axes", {})
    for axis_id in AXIS_ORDER:
        var card = get_node(str(AXIS_NODES[axis_id]))
        card.configure(axis_id, str(axes.get(str(axis_id), "")), "")

    get_node("Frame/Margin/Content/CausalThread").configure(_dictionary_array(data.get("causal_thread", [])))

    var discovery := str(axes.get("DISCOVERY", ""))
    get_node("Frame/Margin/Content/PortfolioReceipt/Margin/Rows/Value").text = discovery


func _load_fixture() -> Dictionary:
    if not FileAccess.file_exists(FIXTURE_PATH):
        return {}
    var file := FileAccess.open(FIXTURE_PATH, FileAccess.READ)
    if file == null:
        return {}
    var parsed = JSON.parse_string(file.get_as_text())
    return parsed if parsed is Dictionary else {}


func _dictionary_array(value: Variant) -> Array[Dictionary]:
    var rows: Array[Dictionary] = []
    if value is Array:
        for row in value:
            if row is Dictionary:
                rows.append(row)
    return rows

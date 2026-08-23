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

    var evidence: Dictionary = data.get("evidence_pin", {})
    get_node("Frame/Margin/Content/EvidencePin").configure(
        int(evidence.get("known", 0)),
        int(evidence.get("unknown", 0)),
        str(evidence.get("lens", "")),
        false
    )

    var forecast: Dictionary = data.get("forecast", {})
    var breakdown: Dictionary = forecast.get("FINAL_TARGET_SUCCESS_BREAKDOWN", {})
    get_node("Frame/Margin/Content/DecisionRow/ForecastCard").configure(
        str(forecast.get("KNOWN_IMPROVEMENT", "")),
        str(forecast.get("UNCERTAIN_CONSEQUENCE", "")),
        int(breakdown.get("percent", 0)),
        _dictionary_array(breakdown.get("rows", [])),
        int(forecast.get("MANA_COST", 0))
    )

    var delta: Dictionary = data.get("context_delta", {})
    get_node("Frame/Margin/Content/DecisionRow/ContextDeltaCard").configure(
        str(delta.get("STILL_TRUE", "")),
        str(delta.get("NEWLY_LEARNED", "")),
        str(delta.get("NEW_TENSION", ""))
    )

    var anchor_text := "W6 RESULT ANCHOR / ACCEPTED RESULT PERSISTS"
    for receipt in data.get("causal_thread", []):
        if receipt is Dictionary and str(receipt.get("kind", "")) == "W6_RESULT":
            anchor_text = "W6 RESULT ANCHOR / %s" % str(receipt.get("text", ""))
            break
    get_node("Frame/Margin/Content/W6ResultAnchor/Label").text = anchor_text


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

class_name StarCircuitHarness
extends Control

func test_contract_snapshot() -> Dictionary:
    return {
        "layout": &"FIVE_POINT_STAR",
        "vertex_count": 5,
        "minimum_touch_target": 48.0,
        "slot_order_effect": false,
        "target_after_circuit_preview": true,
        "numeric_success_preview": true,
        "auto_target": false,
        "auto_commit": false,
        "reduced_motion_ms": 0,
    }

func show_circuit_preview(text: String) -> void:
    var label := get_node_or_null("SafeArea/CircuitPreviewPanel/Label")
    if label != null:
        label.text = text

func show_target_keywords(keywords: Array) -> void:
    var label := get_node_or_null("SafeArea/TargetKeywordPanel/Label")
    if label != null:
        label.text = " / ".join(PackedStringArray(keywords))

func show_final_preview(success_percent: int, final_mana: int) -> void:
    var label := get_node_or_null("SafeArea/FinalPreviewPanel/Label")
    if label != null:
        label.text = "%s%% · Mana %s" % [success_percent, final_mana]

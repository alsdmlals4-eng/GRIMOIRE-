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
        "text_scale_130_percent": true,
        "color_not_sole_signal": true,
        "accessibility_input_alternative": true,
    }


func show_circuit_preview(text: String) -> void:
    _set_label("SafeArea/CircuitPreviewPanel/Label", text)


func show_target_keywords(keywords: Array) -> void:
    _set_label("SafeArea/TargetKeywordPanel/Label", " / ".join(PackedStringArray(keywords)))


func show_final_preview(success_percent: int, final_mana: int) -> void:
    _set_label(
        "SafeArea/FinalPreviewPanel/Label",
        "%s%% · Mana %s" % [success_percent, final_mana]
    )


func show_mastery_breakdown(
    glyph_masteries: Dictionary,
    success_reasons: Array,
    mana_reasons: Array
) -> void:
    var mastery_lines: Array[String] = []
    var glyph_ids: Array = glyph_masteries.keys()
    glyph_ids.sort()
    for glyph_id in glyph_ids:
        mastery_lines.append("%s %s" % [String(glyph_id), int(glyph_masteries[glyph_id])])
    _set_label("SafeArea/MasteryPanel/Label", "Mastery\n%s" % "\n".join(mastery_lines))
    _set_label(
        "SafeArea/BreakdownPanel/Label",
        "Success: %s\nMana: %s" % [
            " / ".join(PackedStringArray(success_reasons)),
            " / ".join(PackedStringArray(mana_reasons)),
        ]
    )


func show_warning(message: String, cause_glyph_id: StringName = &"") -> void:
    var prefix := "WARNING"
    if not cause_glyph_id.is_empty():
        prefix = "%s [%s]" % [prefix, String(cause_glyph_id)]
    _set_label("SafeArea/WarningPanel/Label", "%s: %s" % [prefix, message])


func show_insufficient_mana(required_mana: int, available_mana: int) -> void:
    _set_visible("SafeArea/InsufficientManaState", true)
    _set_label(
        "SafeArea/InsufficientManaState/Label",
        "INSUFFICIENT MANA · Required %s / Available %s" % [required_mana, available_mana]
    )


func show_unstable_circuit(cause_glyph_id: StringName, reason: String) -> void:
    _set_visible("SafeArea/UnstableCircuitState", true)
    _set_label(
        "SafeArea/UnstableCircuitState/Label",
        "UNSTABLE CIRCUIT [%s] · %s" % [String(cause_glyph_id), reason]
    )


func show_accessibility_input(mode: StringName) -> void:
    _set_visible("SafeArea/AccessibilityInputPanel", true)
    _set_label(
        "SafeArea/AccessibilityInputPanel/Label",
        "ACCESSIBLE INPUT · %s · Same spell meaning and cost" % String(mode)
    )


func clear_transient_states() -> void:
    for path in [
        "SafeArea/InsufficientManaState",
        "SafeArea/UnstableCircuitState",
    ]:
        _set_visible(path, false)


func _set_label(path: NodePath, text: String) -> void:
    var label := get_node_or_null(path)
    if label != null:
        label.text = text


func _set_visible(path: NodePath, value: bool) -> void:
    var node := get_node_or_null(path)
    if node != null:
        node.visible = value

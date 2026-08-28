class_name ContextTargetSelector
extends PanelContainer

signal target_selected(target_id: StringName)

var _targets: Array[Dictionary] = []
var _selected_id: StringName = &""


func configure_targets(targets: Array[Dictionary], selected_id: StringName = &"") -> void:
    _targets = []
    for target in targets:
        if not target.has("id") or not target.has("label") or not target.has("hint"):
            continue
        _targets.append(target.duplicate(true))
    _selected_id = selected_id
    _rebuild_buttons()


func visual_snapshot() -> Dictionary:
    return {
        "selected_id": _selected_id,
        "targets": _targets.duplicate(true),
        "recommendation_present": false,
    }


func _rebuild_buttons() -> void:
    var container := get_node("Margin/Rows/Targets") as VBoxContainer
    for child in container.get_children():
        child.free()
    for target in _targets:
        var button := Button.new()
        var target_id := StringName(str(target["id"]))
        var has_w6_semantics := target.has("protected_value") or target.has("forgone_or_remaining")
        button.custom_minimum_size = Vector2(48, 112 if has_w6_semantics else 64)
        button.theme_type_variation = &"AcademyButtonPrimary" if target_id == _selected_id else &"AcademyButton"
        var button_text := "%s\n%s" % [str(target["label"]), str(target["hint"])]
        if target.has("protected_value"):
            button_text += "\n지킬 것: %s" % str(target["protected_value"])
        if target.has("forgone_or_remaining"):
            button_text += "\n남는 위험: %s" % str(target["forgone_or_remaining"])
        button.text = button_text
        button.set_meta("target_id", target_id)
        button.pressed.connect(Callable(self, "_on_target_pressed").bind(target_id))
        container.add_child(button)


func _on_target_pressed(target_id: StringName) -> void:
    _selected_id = target_id
    _rebuild_buttons()
    target_selected.emit(target_id)

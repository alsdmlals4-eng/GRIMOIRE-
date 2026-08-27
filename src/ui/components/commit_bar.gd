class_name CommitBar
extends PanelContainer

signal edit_requested
signal commit_requested

var _target_label := ""
var _mana_cost := 0
var _can_commit := false
var _confirmation_required := false


func _ready() -> void:
    var edit_button := get_node("Margin/Row/EditButton") as Button
    var commit_button := get_node("Margin/Row/CommitButton") as Button
    if not edit_button.pressed.is_connected(_on_edit_pressed):
        edit_button.pressed.connect(_on_edit_pressed)
    if not commit_button.pressed.is_connected(_on_commit_pressed):
        commit_button.pressed.connect(_on_commit_pressed)


func configure(target_label: String, mana_cost: int, can_commit: bool, confirmation_required: bool) -> void:
    _target_label = target_label
    _mana_cost = maxi(0, mana_cost)
    _can_commit = can_commit
    _confirmation_required = confirmation_required
    get_node("Margin/Row/Target").text = "TARGET  %s" % target_label
    get_node("Margin/Row/Mana").text = "MANA  %s" % _mana_cost
    var commit_button := get_node("Margin/Row/CommitButton") as Button
    commit_button.disabled = not _can_commit
    commit_button.text = "CONFIRM COMMIT" if _confirmation_required else "COMMIT"


func visual_snapshot() -> Dictionary:
    return {
        "target_label": _target_label,
        "mana_cost": _mana_cost,
        "can_commit": _can_commit,
        "confirmation_required": _confirmation_required,
        "owns_transaction": false,
    }


func _on_edit_pressed() -> void:
    edit_requested.emit()


func _on_commit_pressed() -> void:
    if _can_commit:
        commit_requested.emit()

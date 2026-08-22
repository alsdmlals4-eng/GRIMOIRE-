extends Control

const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")


func _ready() -> void:
    initialize_demo()


func initialize_demo() -> void:
    theme = ThemeFactory.create_theme()
    var disabled_button := get_node_or_null("Frame/Margin/Content/ButtonsRow/DisabledButton") as Button
    if disabled_button != null:
        disabled_button.disabled = true
    var selected_button := get_node_or_null("Frame/Margin/Content/StateRow/SelectedButton") as Button
    if selected_button != null:
        selected_button.toggle_mode = true
        selected_button.button_pressed = true

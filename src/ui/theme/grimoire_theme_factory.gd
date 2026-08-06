class_name GrimoireThemeFactory
extends RefCounted

const SURFACE_CANVAS := Color("071524")
const SURFACE_PANEL := Color("0d2033")
const SURFACE_PANEL_EMPHASIS := Color("132d45")
const SURFACE_INSET := Color("081827")
const LINE_BRASS := Color("b58a43")
const LINE_GOLD_ACTIVE := Color("e2bd68")
const TEXT_PRIMARY := Color("f3ead4")
const TEXT_SECONDARY := Color("b8c7d6")
const TEXT_MUTED := Color("71879a")
const PLAYER_CYAN := Color("72d9e8")
const PLAYER_CYAN_BRIGHT := Color("b9f6ff")
const WARNING_AMBER := Color("e6a84b")
const DANGER_RED := Color("c95d58")
const SUCCESS_MINT := Color("8bd2b2")
const DISABLED_SURFACE := Color("17212b")
const DISABLED_TEXT := Color("66727b")

const PANEL_RADIUS := 8
const BUTTON_RADIUS := 7
const SLOT_RADIUS := 18


static func create_theme() -> Theme:
    var theme := Theme.new()
    _configure_base(theme)
    _configure_panels(theme)
    _configure_buttons(theme)
    _configure_badges(theme)
    _configure_glyph_slots(theme)
    _configure_status_banners(theme)
    _configure_progress(theme)
    return theme


static func _configure_base(theme: Theme) -> void:
    theme.default_base_scale = 1.0
    theme.set_color(&"font_color", &"Label", TEXT_PRIMARY)
    theme.set_color(&"font_shadow_color", &"Label", Color(0.0, 0.0, 0.0, 0.55))
    theme.set_constant(&"shadow_offset_x", &"Label", 1)
    theme.set_constant(&"shadow_offset_y", &"Label", 1)
    theme.set_font_size(&"font_size", &"Label", 17)

    theme.set_color(&"font_color", &"Button", TEXT_PRIMARY)
    theme.set_color(&"font_hover_color", &"Button", PLAYER_CYAN_BRIGHT)
    theme.set_color(&"font_pressed_color", &"Button", SURFACE_CANVAS)
    theme.set_color(&"font_focus_color", &"Button", TEXT_PRIMARY)
    theme.set_color(&"font_disabled_color", &"Button", DISABLED_TEXT)
    theme.set_font_size(&"font_size", &"Button", 17)
    theme.set_constant(&"outline_size", &"Button", 0)

    theme.set_constant(&"separation", &"VBoxContainer", 10)
    theme.set_constant(&"separation", &"HBoxContainer", 10)


static func _configure_panels(theme: Theme) -> void:
    theme.set_type_variation(&"AcademyPanel", &"PanelContainer")
    theme.set_stylebox(
        &"panel",
        &"AcademyPanel",
        _style_box(SURFACE_PANEL, LINE_BRASS.darkened(0.15), 1, PANEL_RADIUS, 14.0)
    )

    theme.set_type_variation(&"AcademyPanelEmphasis", &"PanelContainer")
    theme.set_stylebox(
        &"panel",
        &"AcademyPanelEmphasis",
        _style_box(SURFACE_PANEL_EMPHASIS, LINE_GOLD_ACTIVE, 2, PANEL_RADIUS, 16.0)
    )


static func _configure_buttons(theme: Theme) -> void:
    theme.set_type_variation(&"AcademyButton", &"Button")
    _set_button_set(
        theme,
        &"AcademyButton",
        SURFACE_PANEL,
        SURFACE_PANEL_EMPHASIS,
        LINE_BRASS,
        TEXT_PRIMARY,
        BUTTON_RADIUS
    )

    theme.set_type_variation(&"AcademyButtonPrimary", &"Button")
    _set_button_set(
        theme,
        &"AcademyButtonPrimary",
        SURFACE_PANEL_EMPHASIS,
        LINE_GOLD_ACTIVE,
        LINE_GOLD_ACTIVE,
        TEXT_PRIMARY,
        BUTTON_RADIUS,
        2
    )
    theme.set_color(&"font_hover_color", &"AcademyButtonPrimary", PLAYER_CYAN_BRIGHT)
    theme.set_color(&"font_pressed_color", &"AcademyButtonPrimary", SURFACE_CANVAS)
    theme.set_font_size(&"font_size", &"AcademyButtonPrimary", 19)


static func _configure_badges(theme: Theme) -> void:
    theme.set_type_variation(&"AcademyBadge", &"PanelContainer")
    theme.set_stylebox(
        &"panel",
        &"AcademyBadge",
        _style_box(SURFACE_INSET, LINE_BRASS, 1, 12, 10.0)
    )


static func _configure_glyph_slots(theme: Theme) -> void:
    theme.set_type_variation(&"GlyphSlot", &"Button")
    _set_button_set(
        theme,
        &"GlyphSlot",
        SURFACE_INSET,
        SURFACE_PANEL_EMPHASIS,
        LINE_BRASS,
        TEXT_PRIMARY,
        SLOT_RADIUS,
        2
    )
    theme.set_font_size(&"font_size", &"GlyphSlot", 16)

    theme.set_type_variation(&"GlyphSlotMain", &"Button")
    _set_button_set(
        theme,
        &"GlyphSlotMain",
        SURFACE_PANEL_EMPHASIS,
        SURFACE_PANEL_EMPHASIS.lightened(0.07),
        LINE_GOLD_ACTIVE,
        PLAYER_CYAN_BRIGHT,
        24,
        3
    )
    theme.set_font_size(&"font_size", &"GlyphSlotMain", 19)


static func _configure_status_banners(theme: Theme) -> void:
    theme.set_type_variation(&"StatusBanner", &"PanelContainer")
    theme.set_stylebox(
        &"panel",
        &"StatusBanner",
        _style_box(SURFACE_INSET, PLAYER_CYAN.darkened(0.1), 2, PANEL_RADIUS, 12.0)
    )

    theme.set_type_variation(&"StatusBannerWarning", &"PanelContainer")
    theme.set_stylebox(
        &"panel",
        &"StatusBannerWarning",
        _style_box(SURFACE_INSET, WARNING_AMBER, 2, PANEL_RADIUS, 12.0)
    )

    theme.set_type_variation(&"StatusBannerSuccess", &"PanelContainer")
    theme.set_stylebox(
        &"panel",
        &"StatusBannerSuccess",
        _style_box(SURFACE_INSET, SUCCESS_MINT, 2, PANEL_RADIUS, 12.0)
    )


static func _configure_progress(theme: Theme) -> void:
    theme.set_stylebox(
        &"background",
        &"ProgressBar",
        _style_box(SURFACE_INSET, LINE_BRASS.darkened(0.35), 1, 5, 1.0)
    )
    theme.set_stylebox(
        &"fill",
        &"ProgressBar",
        _style_box(PLAYER_CYAN.darkened(0.2), PLAYER_CYAN_BRIGHT, 1, 5, 1.0)
    )
    theme.set_color(&"font_color", &"ProgressBar", TEXT_PRIMARY)
    theme.set_font_size(&"font_size", &"ProgressBar", 15)


static func _set_button_set(
    theme: Theme,
    variation: StringName,
    base_color: Color,
    hover_color: Color,
    border_color: Color,
    font_color: Color,
    radius: int,
    border_width: int = 1
) -> void:
    theme.set_stylebox(
        &"normal",
        variation,
        _style_box(base_color, border_color, border_width, radius, 12.0)
    )
    theme.set_stylebox(
        &"hover",
        variation,
        _style_box(hover_color, PLAYER_CYAN, max(border_width, 2), radius, 12.0)
    )
    theme.set_stylebox(
        &"pressed",
        variation,
        _style_box(LINE_GOLD_ACTIVE, LINE_GOLD_ACTIVE, max(border_width, 2), radius, 12.0)
    )
    theme.set_stylebox(
        &"disabled",
        variation,
        _style_box(DISABLED_SURFACE, Color(DISABLED_TEXT, 0.55), 1, radius, 12.0)
    )
    theme.set_stylebox(&"focus", variation, _focus_box(radius))
    theme.set_color(&"font_color", variation, font_color)
    theme.set_color(&"font_hover_color", variation, PLAYER_CYAN_BRIGHT)
    theme.set_color(&"font_pressed_color", variation, SURFACE_CANVAS)
    theme.set_color(&"font_focus_color", variation, font_color)
    theme.set_color(&"font_disabled_color", variation, DISABLED_TEXT)


static func _style_box(
    background: Color,
    border: Color,
    border_width: int,
    radius: int,
    content_margin: float
) -> StyleBoxFlat:
    var box := StyleBoxFlat.new()
    box.bg_color = background
    box.border_color = border
    box.border_width_left = border_width
    box.border_width_top = border_width
    box.border_width_right = border_width
    box.border_width_bottom = border_width
    box.corner_radius_top_left = radius
    box.corner_radius_top_right = radius
    box.corner_radius_bottom_left = radius
    box.corner_radius_bottom_right = radius
    box.content_margin_left = content_margin
    box.content_margin_top = content_margin
    box.content_margin_right = content_margin
    box.content_margin_bottom = content_margin
    return box


static func _focus_box(radius: int) -> StyleBoxFlat:
    var focus := _style_box(Color(0.0, 0.0, 0.0, 0.0), PLAYER_CYAN_BRIGHT, 2, radius, 0.0)
    focus.expand_margin_left = 3.0
    focus.expand_margin_top = 3.0
    focus.expand_margin_right = 3.0
    focus.expand_margin_bottom = 3.0
    return focus

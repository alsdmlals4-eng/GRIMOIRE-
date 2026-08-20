extends RefCounted

const COMPONENTS := {
    "composer": "res://src/ui/components/five_point_star_composer.tscn",
    "header": "res://src/ui/components/context_header.tscn",
    "targets": "res://src/ui/components/context_target_selector.tscn",
    "commit": "res://src/ui/components/commit_bar.tscn",
    "evidence": "res://src/ui/components/evidence_pin.tscn",
    "forecast": "res://src/ui/components/forecast_card.tscn",
    "delta": "res://src/ui/components/context_delta_card.tscn",
    "result": "res://src/ui/components/result_axis_card.tscn",
    "causal": "res://src/ui/components/causal_thread.tscn",
}
const ACADEMY_PANEL_SCENE := "res://src/ui/components/academy_panel.tscn"
const SHEET_A_SCENE := "res://src/ui/component_sheets/component_sheet_a_foundations.tscn"


func run(case) -> void:
    for key in COMPONENTS:
        case.assert_true(FileAccess.file_exists(COMPONENTS[key]), "%s component scene exists" % key)
    case.assert_true(FileAccess.file_exists("res://src/ui/components/star_circuit_board.tscn"), "Existing StarCircuitBoard is preserved")

    var theme_factory = load("res://src/ui/theme/grimoire_theme_factory.gd")
    var theme: Theme = theme_factory.create_theme()
    for variation in [
        &"AcademyPanel", &"AcademyPanelEmphasis", &"AcademyPanelPinned", &"AcademyPanelModal",
        &"AcademyButton", &"AcademyButtonPrimary", &"AcademyButtonCaution", &"AcademyButtonQuiet",
        &"AcademyBadge", &"AcademyBadgeSelected", &"AcademyBadgeUnknown"
    ]:
        case.assert_true(theme.get_type_variation_base(variation) != &"", "%s theme variation exists" % variation)

    case.assert_true(FileAccess.file_exists(ACADEMY_PANEL_SCENE), "AcademyPanel base scene exists")
    if FileAccess.file_exists(ACADEMY_PANEL_SCENE):
        var panel_packed = load(ACADEMY_PANEL_SCENE)
        case.assert_true(panel_packed != null and panel_packed.can_instantiate(), "AcademyPanel base scene loads")
        if panel_packed != null and panel_packed.can_instantiate():
            var panel = panel_packed.instantiate()
            case.assert_equal(&"AcademyPanel", panel.theme_type_variation, "AcademyPanel base scene uses shared variation")
            case.assert_true(panel.get_node_or_null("MarginContainer/Content") != null, "AcademyPanel exposes one reusable content slot")
            panel.free()

    case.assert_true(FileAccess.file_exists(SHEET_A_SCENE), "Component Sheet A scene exists")
    if FileAccess.file_exists(SHEET_A_SCENE):
        var sheet_packed = load(SHEET_A_SCENE)
        case.assert_true(sheet_packed != null and sheet_packed.can_instantiate(), "Component Sheet A loads")
        if sheet_packed != null and sheet_packed.can_instantiate():
            var sheet = sheet_packed.instantiate()
            case.assert_true(sheet.has_method("initialize_demo"), "Component Sheet A exposes deterministic initialize_demo")
            if sheet.has_method("initialize_demo"):
                sheet.initialize_demo()
            case.assert_true(sheet.theme != null, "Component Sheet A applies the shared Theme")
            sheet.free()

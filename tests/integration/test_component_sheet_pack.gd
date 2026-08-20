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
const SHEET_B_SCENE := "res://src/ui/component_sheets/component_sheet_b_spell_workflow.tscn"


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

    _check_foundations(case)
    _check_spell_workflow_components(case)


func _check_foundations(case) -> void:
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


func _check_spell_workflow_components(case) -> void:
    var composer = _instantiate_if_available(COMPONENTS.composer, case, "FivePointStarComposer")
    if composer != null:
        case.assert_true(composer.has_signal("slot_requested"), "Composer exposes slot_requested")
        case.assert_true(composer.has_method("set_visual_state"), "Composer exposes visual state setter")
        case.assert_true(composer.has_method("visual_snapshot"), "Composer exposes visual snapshot")
        case.assert_true(composer.get_node_or_null("StarCircuitBoard") != null, "Composer instances existing StarCircuitBoard")
        if composer.has_method("set_visual_state") and composer.has_method("visual_snapshot"):
            composer.set_visual_state(&"FINAL", 3, -1)
            var snap: Dictionary = composer.visual_snapshot()
            case.assert_equal(&"FINAL", snap.get("state", &""), "Composer delegates FINAL state")
            case.assert_equal(3, snap.get("active_vertices", -1), "Composer delegates active vertex count")
            case.assert_equal(&"MAIN", snap.get("main_slot_role", &""), "Composer preserves one MAIN role")
            case.assert_equal(5, snap.get("aux_slot_count", -1), "Composer preserves five auxiliary slots")
        composer.free()

    var header = _instantiate_if_available(COMPONENTS.header, case, "ContextHeader")
    if header != null:
        case.assert_true(header.has_method("configure"), "ContextHeader exposes configure")
        case.assert_true(header.has_method("visual_snapshot"), "ContextHeader exposes visual_snapshot")
        if header.has_method("configure") and header.has_method("visual_snapshot"):
            header.configure("FROSTBLOOM GREENHOUSE", "FIELD PRACTICUM", "Read the live context.")
            var snap: Dictionary = header.visual_snapshot()
            case.assert_equal("FROSTBLOOM GREENHOUSE", snap.get("location", ""), "ContextHeader returns location")
            case.assert_equal("FIELD PRACTICUM", snap.get("phase", ""), "ContextHeader returns phase")
            case.assert_equal("Read the live context.", snap.get("task", ""), "ContextHeader returns task")
        header.free()

    var selector = _instantiate_if_available(COMPONENTS.targets, case, "ContextTargetSelector")
    if selector != null:
        case.assert_true(selector.has_signal("target_selected"), "Target selector exposes target_selected")
        case.assert_true(selector.has_method("configure_targets"), "Target selector exposes configure_targets")
        case.assert_true(selector.has_method("visual_snapshot"), "Target selector exposes visual_snapshot")
        if selector.has_method("configure_targets") and selector.has_method("visual_snapshot"):
            var targets: Array[Dictionary] = [
                {"id": "root_layer", "label": "Root Layer", "hint": "Living structure carrying the damage."},
                {"id": "spirit_channel", "label": "Spirit Channel", "hint": "Response remains partly unknown."},
            ]
            selector.configure_targets(targets, &"root_layer")
            var snap: Dictionary = selector.visual_snapshot()
            case.assert_equal(&"root_layer", snap.get("selected_id", &""), "Target selector preserves explicit selected target")
            case.assert_equal(2, snap.get("targets", []).size(), "Target selector renders supplied targets only")
        selector.free()

    var commit = _instantiate_if_available(COMPONENTS.commit, case, "CommitBar")
    if commit != null:
        case.assert_true(commit.has_signal("edit_requested"), "CommitBar exposes edit_requested")
        case.assert_true(commit.has_signal("commit_requested"), "CommitBar exposes commit_requested")
        case.assert_true(commit.has_method("configure"), "CommitBar exposes configure")
        case.assert_true(commit.has_method("visual_snapshot"), "CommitBar exposes visual_snapshot")
        if commit.has_method("configure") and commit.has_method("visual_snapshot"):
            commit.configure("Root Layer", 18, true, true)
            var snap: Dictionary = commit.visual_snapshot()
            case.assert_equal("Root Layer", snap.get("target_label", ""), "CommitBar shows selected target only")
            case.assert_equal(18, snap.get("mana_cost", -1), "CommitBar shows supplied Mana cost")
            case.assert_true(snap.get("can_commit", false), "CommitBar preserves supplied commit eligibility")
            case.assert_true(snap.get("confirmation_required", false), "CommitBar preserves explicit confirmation state")
        commit.free()

    case.assert_true(FileAccess.file_exists(SHEET_B_SCENE), "Component Sheet B scene exists")
    if FileAccess.file_exists(SHEET_B_SCENE):
        var sheet_packed = load(SHEET_B_SCENE)
        case.assert_true(sheet_packed != null and sheet_packed.can_instantiate(), "Component Sheet B loads")
        if sheet_packed != null and sheet_packed.can_instantiate():
            var sheet = sheet_packed.instantiate()
            case.assert_true(sheet.has_method("initialize_demo"), "Component Sheet B exposes deterministic initialize_demo")
            if sheet.has_method("initialize_demo"):
                sheet.initialize_demo()
            case.assert_true(sheet.theme != null, "Component Sheet B applies shared Theme")
            sheet.free()


func _instantiate_if_available(path: String, case, label: String):
    case.assert_true(FileAccess.file_exists(path), "%s scene exists" % label)
    if not FileAccess.file_exists(path):
        return null
    var packed = load(path)
    case.assert_true(packed != null and packed.can_instantiate(), "%s scene loads" % label)
    if packed == null or not packed.can_instantiate():
        return null
    return packed.instantiate()

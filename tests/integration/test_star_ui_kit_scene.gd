extends RefCounted

const BOARD_SCENE := "res://src/ui/components/star_circuit_board.tscn"
const HARNESS_SCENE := "res://src/ui/star_circuit_harness.tscn"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(BOARD_SCENE), "Reusable StarCircuitBoard scene exists")
    if FileAccess.file_exists(BOARD_SCENE):
        var board_packed = load(BOARD_SCENE)
        case.assert_true(board_packed != null and board_packed.can_instantiate(), "StarCircuitBoard loads")
        if board_packed != null and board_packed.can_instantiate():
            var board = board_packed.instantiate()
            case.assert_true(board.has_method("set_visual_state"), "StarCircuitBoard exposes read-only visual state setter")
            case.assert_true(board.has_method("visual_snapshot"), "StarCircuitBoard exposes visual snapshot")
            case.assert_true(board.has_method("set_glyph_visuals"), "StarCircuitBoard exposes display-only glyph visual binding")
            case.assert_true(board.has_method("glyph_visual_snapshot"), "StarCircuitBoard exposes a glyph visual snapshot")
            if board.has_method("set_visual_state") and board.has_method("visual_snapshot"):
                board.set_visual_state(&"VALID", 3)
                var valid: Dictionary = board.visual_snapshot()
                case.assert_equal(&"VALID", valid.state, "Board records valid state")
                case.assert_equal(3, valid.active_vertices, "Board records active vertex count")
                board.set_visual_state(&"INVALID", 4, 2)
                var invalid: Dictionary = board.visual_snapshot()
                case.assert_equal(&"INVALID", invalid.state, "Board records invalid state")
                case.assert_equal(2, invalid.cause_vertex, "Board records the cause vertex")
            if board.has_method("set_glyph_visuals") and board.has_method("glyph_visual_snapshot"):
                board.set_glyph_visuals(&"HEAT", {2: &"PROTECT"})
                var glyph_visuals: Dictionary = board.glyph_visual_snapshot()
                var center = board.get_node_or_null("GlyphVisuals/CenterGlyphTexture") as TextureRect
                var aux_two = board.get_node_or_null("GlyphVisuals/AuxGlyphTexture2") as TextureRect
                var aux_one = board.get_node_or_null("GlyphVisuals/AuxGlyphTexture1") as TextureRect
                case.assert_equal(&"HEAT", glyph_visuals.get("main_glyph_id", &""), "board records the visual Main glyph")
                case.assert_equal(&"PROTECT", Dictionary(glyph_visuals.get("auxiliary_by_slot", {})).get(2, &""), "board records sparse Aux glyph slots")
                case.assert_false(bool(glyph_visuals.get("owns_gameplay_state", true)), "glyph board binding remains display-only")
                case.assert_true(center != null and center.texture != null, "board renders the Main glyph texture")
                case.assert_true(aux_two != null and aux_two.texture != null, "board renders the bound sparse Aux texture")
                case.assert_true(aux_one != null and aux_one.texture == null, "board leaves unbound Aux slots empty")
            board.free()

    var harness_packed = load(HARNESS_SCENE)
    case.assert_true(harness_packed != null and harness_packed.can_instantiate(), "Styled star harness still loads")
    if harness_packed == null or not harness_packed.can_instantiate():
        return

    var harness = harness_packed.instantiate()
    case.assert_true(harness.get_node_or_null("VisualBackground") != null, "Harness has a reusable visual background")
    case.assert_true(harness.get_node_or_null("SafeArea/StarBoard") != null, "Harness has StarCircuitBoard behind glyph slots")
    case.assert_true(harness.get_node_or_null("SafeArea/PhaseBadge") != null, "Harness exposes explicit phase badge")

    var texture_paths := [
        "CornerTopLeft",
        "CornerTopRight",
        "SafeArea/PhaseBadge/Content/Icon",
        "SafeArea/ManaIcon",
        "SafeArea/StockIcon",
        "SafeArea/WarningIcon",
    ]
    for path in texture_paths:
        var texture_rect := harness.get_node_or_null(path) as TextureRect
        case.assert_true(texture_rect != null, "%s texture node exists" % path)
        if texture_rect != null:
            case.assert_true(texture_rect.texture != null, "%s imports a real vector texture" % path)

    harness.initialize_demo()
    case.assert_true(harness.theme != null, "Harness applies one shared Theme during deterministic initialization")

    var glyph_board = harness.get_node_or_null("SafeArea/StarBoard")
    case.assert_true(glyph_board != null, "Harness has a board for glyph previews")
    case.assert_true(glyph_board != null and glyph_board.has_method("glyph_visual_snapshot"), "Harness board exposes glyph visual snapshot")
    if glyph_board != null and glyph_board.has_method("glyph_visual_snapshot"):
        var harness_glyph_visuals: Dictionary = glyph_board.glyph_visual_snapshot()
        var center_texture := glyph_board.get_node_or_null("GlyphVisuals/CenterGlyphTexture") as TextureRect
        var aux_zero_texture := glyph_board.get_node_or_null("GlyphVisuals/AuxGlyphTexture0") as TextureRect
        var aux_one_texture := glyph_board.get_node_or_null("GlyphVisuals/AuxGlyphTexture1") as TextureRect
        var center_name := glyph_board.get_node_or_null("GlyphVisuals/CenterGlyphNameLabel") as Label
        var aux_zero_name := glyph_board.get_node_or_null("GlyphVisuals/AuxGlyphNameLabel0") as Label
        case.assert_equal(&"HEAT", harness_glyph_visuals.get("main_glyph_id", &""), "Harness binds the default HEAT Main glyph to the board")
        case.assert_equal(&"FLOW", Dictionary(harness_glyph_visuals.get("auxiliary_by_slot", {})).get(0, &""), "Harness binds the default FLOW Aux glyph to the board")
        case.assert_true(center_texture != null and center_texture.texture != null, "Harness renders the HEAT glyph texture")
        case.assert_true(aux_zero_texture != null and aux_zero_texture.texture != null, "Harness renders the FLOW glyph texture")
        case.assert_true(aux_one_texture != null and aux_one_texture.texture == null, "Harness leaves the empty A1 glyph slot unbound")
        case.assert_equal("열기", center_name.text if center_name != null else "", "Harness renders the Korean Main glyph label")
        case.assert_equal("흐름", aux_zero_name.text if aux_zero_name != null else "", "Harness renders the Korean Aux glyph label")

    var main_slot := harness.get_node_or_null("SafeArea/CenterGlyph") as Button
    case.assert_true(main_slot != null, "Main glyph slot remains available")
    if main_slot != null:
        case.assert_equal(&"GlyphSlotMain", main_slot.theme_type_variation, "Main glyph uses shared main slot variation")
        case.assert_true(main_slot.custom_minimum_size.x >= 48.0, "Main glyph touch width remains at least 48")
        case.assert_true(main_slot.custom_minimum_size.y >= 48.0, "Main glyph touch height remains at least 48")

    for index in range(5):
        var slot := harness.get_node_or_null("SafeArea/StarVertices/Vertex%s" % index) as Button
        case.assert_true(slot != null, "Auxiliary glyph slot %s remains available" % index)
        if slot != null:
            case.assert_equal(&"GlyphSlot", slot.theme_type_variation, "Auxiliary slot %s uses shared variation" % index)
            case.assert_true(slot.custom_minimum_size.x >= 48.0, "Auxiliary slot %s touch width remains at least 48" % index)
            case.assert_true(slot.custom_minimum_size.y >= 48.0, "Auxiliary slot %s touch height remains at least 48" % index)

    var board = harness.get_node_or_null("SafeArea/StarBoard")
    if board != null and board.has_method("visual_snapshot"):
        var edit: Dictionary = board.visual_snapshot()
        case.assert_equal(&"EDIT", edit.state, "Reset visual state is EDIT")
        harness.get_node("SafeArea/PreviewButton").pressed.emit()
        var target: Dictionary = board.visual_snapshot()
        case.assert_equal(&"TARGET", target.state, "Circuit preview advances board visual state")
        harness.get_node("SafeArea/TargetKeywordPanel/Content/TargetButtons/FlowerButton").pressed.emit()
        var final_state: Dictionary = board.visual_snapshot()
        case.assert_equal(&"FINAL", final_state.state, "Target selection advances board visual state")
        harness.get_node("SafeArea/CommitButton").pressed.emit()
        var confirm: Dictionary = board.visual_snapshot()
        case.assert_equal(&"CONFIRM", confirm.state, "First commit press advances board visual state")
        harness.get_node("SafeArea/CommitButton").pressed.emit()
        var committed: Dictionary = board.visual_snapshot()
        case.assert_equal(&"COMMITTED", committed.state, "Second commit press advances board visual state")
    harness.free()

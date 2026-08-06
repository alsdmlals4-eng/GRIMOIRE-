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
            if board.has_method("set_visual_state") and board.has_method("visual_snapshot"):
                board.set_visual_state(&"VALID", 3)
                var valid: Dictionary = board.visual_snapshot()
                case.assert_equal(&"VALID", valid.state, "Board records valid state")
                case.assert_equal(3, valid.active_vertices, "Board records active vertex count")
                board.set_visual_state(&"INVALID", 4, 2)
                var invalid: Dictionary = board.visual_snapshot()
                case.assert_equal(&"INVALID", invalid.state, "Board records invalid state")
                case.assert_equal(2, invalid.cause_vertex, "Board records the cause vertex")
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

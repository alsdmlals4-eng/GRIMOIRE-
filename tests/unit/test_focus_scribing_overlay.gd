extends RefCounted

const OVERLAY_PATH := "res://src/ui/focus_scribing_overlay.gd"
const SCENE_PATH := "res://src/ui/focus_scribing_overlay.tscn"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(OVERLAY_PATH), "focus_scribing_overlay.gd exists")
    case.assert_true(FileAccess.file_exists(SCENE_PATH), "focus_scribing_overlay.tscn exists")
    if not FileAccess.file_exists(OVERLAY_PATH):
        return
    var Overlay = load(OVERLAY_PATH)
    case.assert_true(Overlay != null and Overlay.can_instantiate(), "FocusScribingOverlay compiles")
    if Overlay == null or not Overlay.can_instantiate():
        return
    var overlay = Overlay.new()
    case.assert_true(overlay.configure(&"HEAT", 10.0, 1.0, 2, 8), "Overlay accepts valid focus state")
    var snapshot: Dictionary = overlay.contract_snapshot()
    case.assert_equal(&"HEAT", snapshot.selected_glyph_id, "Overlay names selected glyph")
    case.assert_equal(10.0, snapshot.remaining_seconds, "Overlay exposes remaining time")
    case.assert_equal(1.0, snapshot.mana_per_real_second, "Overlay exposes real-time mana drain")
    case.assert_equal(0.25, snapshot.active_pressure_scale, "Overlay exposes active pressure scale")
    case.assert_equal(1, snapshot.stock_gain, "Overlay promises same glyph stock plus one")
    case.assert_true(snapshot.cancel_no_refund, "Overlay exposes cancel no-refund rule")
    case.assert_false(snapshot.full_pause, "Overlay is not a full pause")
    var cancel: Dictionary = overlay.cancel_no_refund()
    case.assert_equal(0, cancel.stock_gain, "Cancel grants no stock")
    case.assert_true(cancel.cancel_no_refund, "Cancel preserves no-refund contract")
    overlay.free()

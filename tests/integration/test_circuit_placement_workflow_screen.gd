# Task 7 회로 배치 화면의 등수량 패널과 비대상 UI 계약을 검증한다.
extends RefCounted

const SCREEN_PATH := "res://src/ui/spell_workflow/circuit_placement_screen.tscn"
const SCREEN_SCRIPT_PATH := "res://src/ui/spell_workflow/circuit_placement_screen.gd"
const CARD_PATH := "res://src/ui/spell_workflow/components/glyph_card.gd"
const SOURCE_PANEL_PATH := "res://src/ui/spell_workflow/components/glyph_source_panel.gd"
const PREVIEW_PANEL_PATH := "res://src/ui/spell_workflow/components/spell_preview_panel.gd"
const REQUIRED_NODES := [
	"VaultSourcePanel",
	"StockSourcePanel",
	"StarCircuitBoard",
	"SpellPreviewPanel",
	"MainSlotButton",
	"AuxSlot0",
	"AuxSlot1",
	"AuxSlot2",
	"AuxSlot3",
	"AuxSlot4",
	"ResetButton",
	"CancelButton",
	"UndoButton",
	"PrepareButton",
]



class FakePlacementSession:
	extends RefCounted

	var reset_calls := 0
	var removed_nodes: Array[StringName] = []

	func reset() -> Dictionary:
		reset_calls += 1
		return {"status": &"OK"}

	func remove_node(node_key: StringName) -> Dictionary:
		removed_nodes.append(node_key)
		return {"status": &"OK"}


func run(case) -> void:
	for script_path in [SCREEN_SCRIPT_PATH, CARD_PATH, SOURCE_PANEL_PATH, PREVIEW_PANEL_PATH]:
		case.assert_true(FileAccess.file_exists(script_path), "Task 7 script must exist: %s" % script_path)
	case.assert_true(FileAccess.file_exists(SCREEN_PATH), "Task 7 circuit placement screen must exist")
	if not FileAccess.file_exists(SCREEN_PATH):
		return

	var packed_scene = load(SCREEN_PATH)
	case.assert_true(packed_scene != null and packed_scene.can_instantiate(), "circuit placement screen must load")
	if packed_scene == null or not packed_scene.can_instantiate():
		return

	var screen = packed_scene.instantiate()
	screen._ready()
	for node_name in REQUIRED_NODES:
		case.assert_true(screen.find_child(node_name, true, false) != null, "screen exposes required node: %s" % node_name)
	case.assert_true(screen.find_child("TargetSelectionPanel", true, false) == null, "circuit placement has no target selection panel")
	case.assert_true(screen.find_child("TargetButton", true, false) == null, "circuit placement has no target button")

	case.assert_true(screen.has_signal("place_main_requested"), "screen emits explicit main placement intent")
	case.assert_true(screen.has_signal("place_aux_requested"), "screen emits explicit auxiliary placement intent")
	case.assert_true(screen.has_signal("remove_requested"), "screen emits explicit removal intent")
	case.assert_true(screen.has_signal("preview_requested"), "screen emits explicit preview intent")
	case.assert_true(screen.has_signal("prepare_requested"), "screen emits explicit preparation intent")
	case.assert_true(screen.has_signal("reset_requested"), "screen emits explicit reset intent")
	case.assert_true(screen.has_signal("undo_requested"), "screen emits explicit undo intent")

	var loadout := {"vault_ids": [&"HEAT", &"FLOW"], "stock_ids": [&"PROTECT", &"FOCUS"], "count": 2, "maximum_each": 5}
	var snapshot := {
		"layout": &"FIVE_POINT_STAR",
		"main": {"glyph_id": &"HEAT", "source": 1, "is_learned": true},
		"auxiliaries": [{"glyph_id": &"PROTECT", "source": 0, "slot": 2, "is_learned": false}],
		"reservation_records": [],
	}
	screen.render(loadout, snapshot, {"estimated_mana": 7})

	var vault_panel = screen.find_child("VaultSourcePanel", true, false)
	var stock_panel = screen.find_child("StockSourcePanel", true, false)
	case.assert_equal(2, vault_panel.displayed_count(), "Vault panel shows the supplied equal count")
	case.assert_equal(2, stock_panel.displayed_count(), "Stock panel shows the supplied equal count")
	case.assert_equal(vault_panel.displayed_count(), stock_panel.displayed_count(), "both source panels display equal counts")
	case.assert_true(vault_panel.find_child("RoleLabel", true, false) != null, "Vault role is named, not colour-only")
	case.assert_true(stock_panel.find_child("RoleLabel", true, false) != null, "Stock role is named, not colour-only")
	var vault_cards = vault_panel.find_child("CardList", true, false)
	case.assert_equal(2, vault_cards.get_child_count(), "Vault panel renders one reusable card per supplied glyph")
	var first_card = vault_cards.get_child(0)
	case.assert_true(first_card.find_child("NameLabel", true, false) != null, "source panel instantiates the reusable glyph card scene")
	case.assert_true(first_card.find_child("RoleLabel", true, false) != null, "glyph card exposes a textual role cue")
	case.assert_true(first_card.find_child("RoleIconLabel", true, false) != null, "glyph card exposes an icon/shape role cue")
	case.assert_true(first_card.has_method("is_selectable"), "glyph card exposes an explicit non-button disabled state")
	if first_card.has_method("is_selectable"):
		case.assert_false(first_card.is_selectable(), "reserved card is readable but not selectable")

	var main_requests: Array = []
	var aux_requests: Array = []
	screen.place_main_requested.connect(func(glyph): main_requests.append(glyph))
	screen.place_aux_requested.connect(func(slot, glyph): aux_requests.append({"slot": slot, "glyph": glyph}))
	case.assert_true(screen.has_method("select_main_slot"), "screen exposes explicit Main slot selection")
	case.assert_true(screen.has_method("select_aux_slot"), "screen exposes explicit Aux slot selection")
	if screen.has_method("select_main_slot") and screen.has_method("select_aux_slot"):
		screen.select_main_slot()
		vault_panel.glyph_selected.emit({"glyph_id": &"FLOW"})
		screen.select_aux_slot(2)
		stock_panel.glyph_selected.emit({"glyph_id": &"FOCUS"})
		case.assert_equal(1, main_requests.size(), "selected card emits explicit Main placement intent")
		case.assert_equal(1, aux_requests.size(), "selected card emits explicit Aux placement intent")
		if aux_requests.size() == 1:
			case.assert_equal(2, aux_requests[0].get("slot", -1), "selected card emits the selected Aux slot")
			case.assert_equal(&"FOCUS", aux_requests[0].get("glyph", {}).get("glyph_id", &""), "selected card payload remains explicit")

	var preview_panel = screen.find_child("SpellPreviewPanel", true, false)
	case.assert_equal(1, preview_panel.estimated_mana_occurrences(), "estimated Mana appears exactly once in the preview panel")
	case.assert_equal(7, preview_panel.estimated_mana(), "preview shows the supplied estimated Mana")

	screen.render_state(&"CIRCUIT_EDIT")
	case.assert_equal(&"EDIT", screen.board_visual_state(), "circuit edit maps to board edit")
	screen.render_state(&"CIRCUIT_PREVIEW")
	case.assert_equal(&"FINAL", screen.board_visual_state(), "circuit preview maps to board final")
	screen.render_state(&"PREPARATION_CONFIRM")
	case.assert_equal(&"CONFIRM", screen.board_visual_state(), "preparation confirmation maps to board confirm")
	screen.render_state(&"PREPARED")
	case.assert_equal(&"COMMITTED", screen.board_visual_state(), "prepared maps to board committed")
	screen.render_state(&"VALIDATION_FAILURE")
	case.assert_equal(&"INVALID", screen.board_visual_state(), "validation failure maps to board invalid")
	var session = FakePlacementSession.new()
	screen.configure(session)
	screen.request_place_aux(3, {"glyph_id": &"FOCUS"})
	screen.request_undo()
	case.assert_equal([&"aux-3"], session.removed_nodes, "undo releases only the last changed node")
	screen.request_reset()
	case.assert_equal(1, session.reset_calls, "reset delegates to the placement session exactly once")
	case.assert_true(screen.has_method("request_cancel"), "screen exposes an explicit cancel action")
	if screen.has_method("request_cancel"):
		screen.request_cancel()
		case.assert_equal(2, session.reset_calls, "cancel delegates to the placement session exactly once")
	case.assert_true(screen.has_method("restore_incident_overlay_context"), "overlay close has an explicit non-resetting screen boundary")
	if screen.has_method("restore_incident_overlay_context"):
		screen.restore_incident_overlay_context({"current_state": &"CIRCUIT_EDIT"})
		case.assert_equal(2, session.reset_calls, "closing the incident overlay does not reset the placement session")
	screen.queue_free()

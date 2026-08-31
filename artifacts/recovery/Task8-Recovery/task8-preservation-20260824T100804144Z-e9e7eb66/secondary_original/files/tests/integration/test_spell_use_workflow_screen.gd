# Task 8 주문 사용 화면의 명시적 대상·2단계 확정·실패 복구 계약을 검증한다.
extends RefCounted

const SCREEN_PATH := "res://src/ui/spell_workflow/spell_use_screen.tscn"
const SCREEN_SCRIPT_PATH := "res://src/ui/spell_workflow/spell_use_screen.gd"
const TARGET_PANEL_PATH := "res://src/ui/spell_workflow/components/target_selection_panel.gd"
const RESULT_PANEL_PATH := "res://src/ui/spell_workflow/components/expected_result_panel.gd"
const REQUIRED_NODES := [
	"PreparedSpellList",
	"TargetSelectionPanel",
	"ExpectedResultPanel",
	"CurrentManaLabel",
	"PreviewButton",
	"UseButton",
	"ConfirmUseButton",
	"CancelButton",
]


func run(case) -> void:
	for script_path in [SCREEN_SCRIPT_PATH, TARGET_PANEL_PATH, RESULT_PANEL_PATH]:
		case.assert_true(FileAccess.file_exists(script_path), "Task 8 script must exist: %s" % script_path)
	case.assert_true(FileAccess.file_exists(SCREEN_PATH), "Task 8 spell use screen must exist")
	if not FileAccess.file_exists(SCREEN_PATH):
		return

	var packed_scene = load(SCREEN_PATH)
	case.assert_true(packed_scene != null and packed_scene.can_instantiate(), "spell use screen must load")
	if packed_scene == null or not packed_scene.can_instantiate():
		return

	var screen = packed_scene.instantiate()
	screen._ready()
	case.assert_false(screen.find_child("ConfirmUseButton", true, false).visible, "confirmation action is hidden before an explicit first use")
	for node_name in REQUIRED_NODES:
		case.assert_true(screen.find_child(node_name, true, false) != null, "screen exposes required node: %s" % node_name)
	for forbidden_name in ["GlyphDrawingCanvas", "VaultSourcePanel", "StockSourcePanel", "StarCircuitBoard"]:
		case.assert_true(screen.find_child(forbidden_name, true, false) == null, "spell use has no Stage 2 control: %s" % forbidden_name)

	for signal_name in ["spell_selected", "target_selected", "preview_requested", "use_requested", "cancel_requested"]:
		case.assert_true(screen.has_signal(signal_name), "screen emits explicit intent: %s" % signal_name)

	var prepared_spells := [
		{"spell_id": &"prepared-1", "status": &"READY", "main": {"glyph_id": &"HEAT"}, "auxiliaries": []},
		{"spell_id": &"used-1", "status": &"USED"},
	]
	var targets := [
		{"keyword": &"FACILITY_REPAIR", "label": "Facility repair", "target_valid": true},
		{"keyword": &"LIFE_RESCUE", "label": "Life rescue", "target_valid": true},
	]
	screen.render(prepared_spells, targets, {"success_percent": 73, "main_effect": "Repair", "risks": ["Heat"], "final_mana": 9, "target_keyword": &"FACILITY_REPAIR"}, 15)
	var target_panel = screen.find_child("TargetSelectionPanel", true, false)
	var result_panel = screen.find_child("ExpectedResultPanel", true, false)
	case.assert_true(target_panel.has_method("selected_keyword"), "target panel exposes explicit selected state")
	if target_panel.has_method("selected_keyword"):
		case.assert_equal(&"", target_panel.selected_keyword(), "targets start unselected")
	case.assert_true(screen.has_method("has_final_preview"), "screen exposes final-preview validity")
	if screen.has_method("has_final_preview"):
		case.assert_false(screen.has_final_preview(), "unselected target leaves final preview invalid")
	case.assert_false(screen.find_child("UseButton", true, false).disabled == false, "Use starts disabled before target preview")

	case.assert_true(screen.has_method("request_target"), "screen accepts explicit target choice")
	case.assert_true(screen.has_method("request_preview"), "screen requests preview explicitly")
	case.assert_true(screen.has_method("request_use"), "screen opens confirmation before use")
	case.assert_true(screen.has_method("confirm_use"), "screen confirms an explicit transaction once")
	case.assert_true(screen.has_method("render_use_result"), "screen retains context while rendering result")
	case.assert_true(screen.has_method("request_spell"), "screen accepts an explicit prepared-spell choice")
	if screen.has_method("request_spell"):
		case.assert_true(screen.request_spell(&"prepared-1"), "READY prepared spell must be selected explicitly")
	if screen.has_method("request_target"):
		screen.request_target(&"FACILITY_REPAIR")
		if screen.has_method("has_final_preview"):
			case.assert_false(screen.has_final_preview(), "target change invalidates prior preview")
	if screen.has_method("request_preview"):
		var preview_intents: Array = []
		screen.preview_requested.connect(func(): preview_intents.append(true))
		screen.find_child("PreviewButton", true, false).pressed.emit()
		case.assert_equal(1, preview_intents.size(), "Preview button emits an explicit coordinator preview intent")
		screen.render_final_preview({"success_percent": 73, "main_effect": "Repair", "risks": ["Heat"], "final_mana": 9, "target_keyword": &"LIFE_RESCUE"})
		if screen.has_method("has_final_preview"):
			case.assert_false(screen.has_final_preview(), "stale preview for another target never re-enables use")
		screen.render_final_preview({"success_percent": 73, "main_effect": "Repair", "risks": ["Heat"], "final_mana": 9, "target_keyword": &"FACILITY_REPAIR"})
		if screen.has_method("has_final_preview"):
			case.assert_true(screen.has_final_preview(), "coordinator final preview for selected target enables use")
		screen.request_target(StringName("LIFE_RESCUE"))
		case.assert_true(result_panel.preview().is_empty(), "changed target clears stale Expected Result data")
		case.assert_equal("Preview unavailable", result_panel.find_child("SuccessLabel", true, false).text, "invalidated preview uses an explicit non-result state")
		screen.request_target(StringName("FACILITY_REPAIR"))
		screen.render_final_preview({"success_percent": 73, "main_effect": "Repair", "risks": ["Heat"], "final_mana": 9, "target_keyword": StringName("FACILITY_REPAIR")})
	if screen.has_method("request_use"):
		case.assert_true(screen.request_use(), "first use enters confirmation without mutation")
		case.assert_true(screen.is_confirmation_pending(), "first use only opens confirmation")
		case.assert_true(screen.find_child("ConfirmUseButton", true, false).visible, "first use exposes a second explicit confirmation action")
	if screen.has_method("set_use_transaction_id"):
		screen.set_use_transaction_id(&"use-1")
	if screen.has_method("confirm_use"):
		var use_requests: Array = []
		screen.use_requested.connect(func(transaction_id): use_requests.append(transaction_id))
		screen.find_child("ConfirmUseButton", true, false).pressed.emit()
		screen.find_child("ConfirmUseButton", true, false).pressed.emit()
		case.assert_equal(1, use_requests.size(), "second explicit UI confirmation calls use exactly once")
		case.assert_false(screen.request_spell(&"prepared-1"), "in-flight use locks prepared-spell changes")
		case.assert_false(screen.request_target(&"LIFE_RESCUE"), "in-flight use locks target changes")
	if screen.has_method("render_use_result"):
		for failure_status in [&"INSUFFICIENT_MANA", &"INVALID_TARGET", &"SPELL_ALREADY_USED"]:
			screen.render_use_result({"status": failure_status})
			var failure_label = result_panel.find_child("FailureLabel", true, false)
			case.assert_true(failure_label != null and failure_label.text.contains(String(failure_status)), "failure status is visibly rendered: %s" % failure_status)
		screen.render_final_preview({"success_percent": 80, "main_effect": "Recovered", "risks": [], "final_mana": 8, "target_keyword": &"FACILITY_REPAIR"})
		case.assert_equal("", result_panel.find_child("FailureLabel", true, false).text, "new final preview clears a stale failure message")
		case.assert_equal(&"prepared-1", screen.selected_spell_id(), "failed use retains prepared spell context")
		case.assert_equal(&"FACILITY_REPAIR", target_panel.selected_keyword(), "failed use retains incident target context")

	case.assert_true(result_panel.has_method("mana_occurrences"), "expected result counts its Mana presentation")
	if result_panel.has_method("mana_occurrences"):
		case.assert_equal(1, result_panel.mana_occurrences(), "Expected Result shows final Mana exactly once")
	case.assert_true(screen.has_method("current_mana_occurrences"), "current character MP is separately labelled")
	if screen.has_method("current_mana_occurrences"):
		case.assert_equal(1, screen.current_mana_occurrences(), "current character MP appears exactly once")
	screen.render(prepared_spells, targets, {}, 12)
	case.assert_equal("Preview unavailable", result_panel.find_child("SuccessLabel", true, false).text, "new context render clears a prior final result")
	screen.queue_free()

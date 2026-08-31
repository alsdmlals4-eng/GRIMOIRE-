# v2 주문 흐름 상태 전이와 Incident Overlay 복귀 계약을 검증한다.
extends RefCounted

const STATE_PATH := "res://src/core/workflow/spell_workflow_state.gd"


func run(case) -> void:
	case.assert_true(FileAccess.file_exists(STATE_PATH), "Task 5 state machine must exist")
	if not FileAccess.file_exists(STATE_PATH):
		return

	var State = load(STATE_PATH)
	case.assert_true(State != null and State.can_instantiate(), "SpellWorkflowState must compile")
	if State == null or not State.can_instantiate():
		return

	var state = State.new()
	case.assert_equal(State.State.INCIDENT_BRIEF, state.current_state(), "workflow starts at incident brief")
	case.assert_false(state.select_target(&"WARD"), "target selection is rejected before a prepared spell is selected")
	case.assert_false(state.can_confirm_use(), "mana use is unavailable before explicit use confirmation")

	case.assert_true(state.begin_glyph_drawing(), "incident brief enters glyph drawing")
	case.assert_true(state.begin_circuit_edit(), "glyph drawing enters circuit editing")
	case.assert_false(state.select_target(&"WARD"), "target selection is rejected during circuit editing")
	case.assert_true(state.show_circuit_preview(), "circuit edit enters immutable circuit preview")
	case.assert_false(state.select_prepared_spell(&"spell-1"), "prepared spell selection cannot skip Stage 2 readiness")
	case.assert_false(state.select_target(&"WARD"), "circuit preview cannot jump directly to target selection")
	case.assert_true(state.mark_spell_ready(), "only Stage 2 completion enters spell readiness")
	case.assert_true(state.select_prepared_spell(&"spell-1"), "READY prepared spell enters Stage 3 target selection")
	case.assert_true(state.select_target(&"WARD"), "explicit Stage 3 target selection is accepted")
	case.assert_true(state.show_final_preview({"success_percent": 79, "final_mana": 7}), "target selection produces final preview")
	case.assert_true(state.select_target(&"FROSTBLOOM"), "a new target is accepted while its prior preview remains unconfirmed")
	case.assert_equal(&"FROSTBLOOM", state.target_keyword(), "retargeting replaces the selected keyword")
	case.assert_true(state.final_preview().is_empty(), "retargeting clears the stale final preview")
	case.assert_equal(State.State.SPELL_USE_TARGET, state.current_state(), "retargeting returns to target selection without confirmation or resolution")
	case.assert_false(state.can_confirm_use(), "retargeting cannot confirm or resolve a spell")
	case.assert_true(state.show_final_preview({"success_percent": 76, "final_mana": 8}), "the replacement target can produce a new final preview")
	case.assert_false(state.can_confirm_use(), "preview alone cannot spend mana")
	case.assert_true(state.request_use_confirmation(), "explicit confirmation state is required before use")
	case.assert_true(state.can_confirm_use(), "only explicit confirmation allows use")
	case.assert_true(state.begin_system_resolution(), "confirmed use enters system resolution")
	case.assert_false(state.open_incident_overlay(), "resolving state cannot be obscured by incident overlay")
	case.assert_true(state.show_result_explanation(), "resolution enters result explanation")

	var overlay_state = State.new()
	overlay_state.begin_glyph_drawing()
	overlay_state.begin_circuit_edit()
	var prior_state = overlay_state.current_state()
	case.assert_true(overlay_state.open_incident_overlay(), "overlay opens from a non-resolving state")
	case.assert_equal(State.State.INCIDENT_OVERLAY, overlay_state.current_state(), "overlay is explicit state")
	case.assert_true(overlay_state.close_incident_overlay(), "overlay closes")
	case.assert_equal(prior_state, overlay_state.current_state(), "overlay restores exact prior state")

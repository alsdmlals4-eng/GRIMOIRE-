extends RefCounted

const PATH := "res://src/core/star/star_circuit_state.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Star circuit state machine must exist")
    if not FileAccess.file_exists(PATH):
        return
    var script = load(PATH)
    case.assert_true(script != null and script.can_instantiate(), "Star state machine must load")
    if script == null or not script.can_instantiate():
        return
    var state = script.new()
    var fixture := {"fixture_id": &"frost", "objective": "Protect", "threat": "Cold", "situation": "Frostbloom", "target_keywords": [&"flower", &"ward"]}
    case.assert_true(state.configure_scenario(fixture), "Scenario accepts target keywords")
    case.assert_true(state.transition_to(state.State.CIRCUIT_EDIT), "Scenario enters circuit edit")
    case.assert_false(state.select_target(&"flower"), "Target cannot be selected before circuit preview")
    var main := {"glyph_id": &"PROTECT", "source": &"VAULT", "mastery": 70, "base_mana": 10, "base_success": 75}
    case.assert_true(state.set_circuit_draft(main, []), "Main-only star draft is accepted")
    case.assert_true(state.request_circuit_preview({"valid": true}), "Circuit preview comes before target selection")
    case.assert_true(state.select_target(&"flower"), "Only offered keyword can be selected after preview")
    case.assert_false(state.select_target(&"secret_answer"), "Unknown target is rejected")
    case.assert_true(state.request_final_preview({"success_percent": 80, "final_mana": 10}), "Final preview follows target selection")
    case.assert_true(state.request_commit_confirmation(), "Explicit confirmation is required")
    case.assert_true(state.can_commit(), "Commit is possible only in confirm state")
    case.assert_true(state.cancel_commit_confirmation(), "Cancel returns to final preview")
    case.assert_false(state.can_commit(), "Cancel performs no commit")

extends RefCounted

const STATE_PATH := "res://src/core/stage2/stage2_circuit_bridge_state.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(STATE_PATH), "Stage2 state machine must exist")
    if not FileAccess.file_exists(STATE_PATH):
        return
    var script = load(STATE_PATH)
    case.assert_true(script != null and script.can_instantiate(), "Stage2 state machine must load")
    if script == null or not script.can_instantiate():
        return

    var state = script.new()
    case.assert_equal(script.State.SCENARIO_BRIEF, state.current_state(), "Initial state is scenario brief")
    case.assert_true(state.configure_scenario({
        "fixture_id": &"SCENARIO_A_NONCOMBAT_PROTECT_CONTROL",
        "objective": "Protect the ward",
        "threat": "Cracks are spreading",
        "situation": "A classroom ward is failing",
        "targets": [&"ward"],
    }), "Scenario fixture is accepted")
    case.assert_true(
        state.transition_to(script.State.INTENT_AND_SOURCE_SELECT),
        "Brief advances to intent and source selection"
    )

    state.select_intent(&"PROTECT_CONTROL")
    state.set_glyph_source(&"main", &"PROTECT", &"VAULT")
    state.set_circuit_draft(
        [
            {"id": &"main", "kind": &"MAIN", "cell": Vector2i(1, 1), "glyph_id": &"PROTECT", "source": &"VAULT"},
            {"id": &"target", "kind": &"TARGET", "cell": Vector2i(1, 2), "target_id": &"ward"},
        ],
        [{"from": &"main", "to": &"target"}]
    )
    var before_retry: Dictionary = state.context_snapshot()
    case.assert_true(state.begin_writing(), "Writing focus can open from intent state")
    case.assert_true(state.active_stroke_owner_is_writing_canvas(), "Writing canvas owns active stroke")
    state.mark_recognition_retry(&"LOW_CONFIDENCE_REQUIRES_RETRY")
    var after_retry: Dictionary = state.context_snapshot()
    case.assert_equal(before_retry.scenario, after_retry.scenario, "Retry preserves scenario")
    case.assert_equal(before_retry.targets, after_retry.targets, "Retry preserves targets")
    case.assert_equal(before_retry.glyph_sources, after_retry.glyph_sources, "Retry preserves sources")
    case.assert_equal(before_retry.circuit_nodes, after_retry.circuit_nodes, "Retry preserves circuit draft")

    case.assert_false(state.can_commit(), "Commit is blocked before preview and confirmation")
    case.assert_true(state.end_writing(), "Writing focus returns to edit state")
    case.assert_true(state.request_preview({"valid": true}), "Valid circuit enters preview")
    case.assert_false(state.can_commit(), "Preview alone cannot commit")
    case.assert_true(state.request_commit_confirmation(), "Preview enters explicit confirmation")
    case.assert_true(state.can_commit(), "Commit becomes available only in confirmation")
    var snapshot_before_cancel: Dictionary = state.context_snapshot()
    case.assert_true(state.cancel_commit_confirmation(), "Cancel returns to preview")
    case.assert_equal(snapshot_before_cancel, state.context_snapshot(), "Cancel has zero context mutation")

    state.raise_hard_stop(&"ACCIDENTAL_COMMIT_ZERO_HARD_STOP")
    case.assert_false(state.transition_to(script.State.SYSTEM_RESOLVE), "Hard stop blocks progression")
    case.assert_equal(&"ACCIDENTAL_COMMIT_ZERO_HARD_STOP", state.hard_stop_reason(), "Hard stop reason is retained")

extends RefCounted

const VALIDATOR_PATH := "res://src/core/star/star_circuit_validator.gd"
const CALCULATOR_PATH := "res://src/core/star/star_circuit_calculator.gd"
const STATE_PATH := "res://src/core/star/star_circuit_state.gd"

func run(case) -> void:
    for path in [VALIDATOR_PATH, CALCULATOR_PATH, STATE_PATH]:
        case.assert_true(FileAccess.file_exists(path), "Required star runtime file exists: %s" % path)
    if not FileAccess.file_exists(VALIDATOR_PATH) or not FileAccess.file_exists(CALCULATOR_PATH) or not FileAccess.file_exists(STATE_PATH):
        return
    var validator = load(VALIDATOR_PATH).new()
    var calculator = load(CALCULATOR_PATH).new()
    var state = load(STATE_PATH).new()
    var fixture := {"fixture_id": &"frostbloom", "objective": "Protect bloom", "threat": "Cold surge", "situation": "A ward is failing", "target_keywords": [&"flower", &"ward"]}
    case.assert_true(state.configure_scenario(fixture), "Scenario is configured")
    case.assert_true(state.transition_to(state.State.CIRCUIT_EDIT), "Flow enters circuit edit")
    var main := {"glyph_id": &"PROTECT", "source": &"VAULT", "mastery": 70, "base_mana": 10, "base_success": 75}
    var auxiliaries := [{"slot": 0, "glyph_id": &"FLOW", "source": &"STOCK", "mastery": 70, "base_mana": 4, "special": &"NORMAL"}]
    var validation: Dictionary = validator.validate(main, auxiliaries)
    case.assert_equal(&"OK", validation.status, "Approved star grammar validates")
    case.assert_true(state.set_circuit_draft(main, auxiliaries), "Draft is stored")
    case.assert_true(state.request_circuit_preview(validation), "Circuit preview opens")
    case.assert_true(state.select_target(&"flower"), "Available target keyword is selected")
    var preview: Dictionary = calculator.preview(main, auxiliaries, {"difficulty": 5, "mana_cost": 0}, 0, 0, 0)
    case.assert_equal(70, preview.success_percent, "One auxiliary first-year example is 70 percent")
    case.assert_equal(16, preview.final_mana, "One auxiliary approved mana example is 16")
    case.assert_true(state.request_final_preview(preview), "Final preview opens after target")
    case.assert_true(state.request_commit_confirmation(), "Explicit commit confirmation opens")
    case.assert_true(state.can_commit(), "Flow is commit-ready only after both previews and target")
    var snapshot: Dictionary = state.context_snapshot()
    case.assert_equal(&"flower", snapshot.target_keyword, "Selected target remains explicit")
    case.assert_equal(70, snapshot.final_preview.success_percent, "Numeric success is preserved")

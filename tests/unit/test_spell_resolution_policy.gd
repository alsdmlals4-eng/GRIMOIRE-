extends RefCounted

const POLICY_PATH := "res://src/core/star/spell_resolution_policy.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(POLICY_PATH), "spell_resolution_policy.gd must exist")
    if not FileAccess.file_exists(POLICY_PATH):
        return
    var Policy = load(POLICY_PATH)
    case.assert_true(Policy != null and Policy.can_instantiate(), "SpellResolutionPolicy compiles")
    if Policy == null or not Policy.can_instantiate():
        return
    var policy = Policy.new()

    var full: Dictionary = policy.resolve(70, 70, &"HEAT")
    case.assert_equal(&"FULL_SUCCESS", full.status, "Roll at success threshold fully succeeds")
    var partial: Dictionary = policy.resolve(70, 80, &"FLOW")
    case.assert_equal(&"PARTIAL_SUCCESS", partial.status, "Miss margin 10 is partial success")
    var imperfect: Dictionary = policy.resolve(70, 95, &"PRECISION")
    case.assert_equal(&"IMPERFECT_EXECUTION", imperfect.status, "Miss margin 25 is imperfect execution")
    var failure: Dictionary = policy.resolve(50, 90, &"REDUCTION")
    case.assert_equal(&"FAILURE", failure.status, "Miss margin 40 is failure")
    var backlash: Dictionary = policy.resolve(50, 91, &"FLOW")
    case.assert_equal(&"BACKLASH", backlash.status, "Miss margin above 40 is backlash")

    for result in [full, partial, imperfect, failure, backlash]:
        case.assert_true(not String(result.cause_glyph_id).is_empty(), "Resolution names cause glyph")
        case.assert_true(not String(result.new_information).is_empty(), "Resolution leaves new information")
        case.assert_true(not String(result.next_opportunity).is_empty(), "Resolution leaves next opportunity")
        case.assert_false(result.wrong_target, "Resolution never chooses an unpreviewed wrong target")
        case.assert_equal(0, result.extra_hidden_mana, "Resolution adds no hidden mana")
        case.assert_equal(0, result.duplicate_stock_consumption, "Resolution adds no duplicate stock consumption")

    var collapse: Dictionary = policy.invalid_circuit(&"HEAT", &"MISSING_MAIN")
    case.assert_equal(&"CIRCUIT_COLLAPSE", collapse.status, "Invalid circuit uses collapse result")
    case.assert_false(collapse.resource_consumed, "Invalid circuit collapse consumes no resources")
    case.assert_equal(&"MISSING_MAIN", collapse.reason, "Collapse preserves explicit reason")

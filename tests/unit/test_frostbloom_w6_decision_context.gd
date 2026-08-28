# Frostbloom W6 Resource 계약과 안전한 대상 선택 payload를 검증한다.
extends RefCounted

const CONTEXT_PATH := "res://data/frostbloom/w6/w6_decision_context_01.tres"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(CONTEXT_PATH), "W6 context Resource must exist")
    if not FileAccess.file_exists(CONTEXT_PATH):
        return

    var context = load(CONTEXT_PATH)
    case.assert_true(context != null, "W6 context Resource must load")
    if context == null:
        return

    case.assert_true(context.has_method("validate"), "W6 context exposes validation")
    case.assert_true(context.has_method("target_choices"), "W6 context exposes target choices")
    case.assert_true(context.has_method("target_choice"), "W6 context exposes a target lookup")
    case.assert_true(context.has_method("summary"), "W6 context exposes its observation summary")
    if not context.has_method("validate") or not context.has_method("target_choices") or not context.has_method("target_choice") or not context.has_method("summary"):
        return

    case.assert_equal(&"OK", StringName(context.validate().get("status", &"")), "W6 context validates its exact shape")
    var choices: Array = context.target_choices()
    case.assert_equal(2, choices.size(), "W6 exposes exactly two preservation targets")
    if choices.size() != 2:
        return

    var seedlings: Dictionary = context.target_choice(&"FROST_SEEDLINGS")
    var structure: Dictionary = context.target_choice(&"GREENHOUSE_STRUCTURE")
    case.assert_false(seedlings.is_empty(), "seedlings target exists")
    case.assert_false(structure.is_empty(), "greenhouse structure target exists")
    case.assert_true(context.target_choice(&"WARD").is_empty(), "generic prototype targets never fall back into W6")
    var invalid_context = context.duplicate(true)
    var retained_target = invalid_context.targets[0]
    var invalid_target = invalid_context.targets[1].duplicate(true)
    invalid_target.id = &"UNRELATED_TARGET"
    invalid_context.targets.clear()
    invalid_context.targets.append(retained_target)
    invalid_context.targets.append(invalid_target)
    case.assert_equal(&"INVALID_W6_CONTEXT", StringName(invalid_context.validate().get("status", &"")), "missing a required W6 target ID invalidates the context")

    var seedlings_target: Dictionary = Dictionary(seedlings.get("target", {}))
    var structure_target: Dictionary = Dictionary(structure.get("target", {}))
    case.assert_equal(3, int(seedlings_target.get("difficulty", -1)), "seedlings starts at matched difficulty")
    case.assert_equal(3, int(structure_target.get("difficulty", -1)), "structure starts at matched difficulty")
    case.assert_equal(3, int(seedlings_target.get("mana_cost", -1)), "seedlings starts at matched Mana")
    case.assert_equal(3, int(structure_target.get("mana_cost", -1)), "structure starts at matched Mana")
    case.assert_equal("희귀 서리 묘목의 생장과 수집 기록", str(seedlings.get("protected_value", "")), "seedlings names the protected player value")
    case.assert_equal("온실 동쪽 통로와 관찰 환경", str(structure.get("protected_value", "")), "structure names the protected player value")
    case.assert_false(str(seedlings.get("known_improvement", "")).is_empty(), "seedlings exposes a known improvement")
    case.assert_false(str(seedlings.get("forgone_or_remaining", "")).is_empty(), "seedlings exposes the remaining risk")
    case.assert_false(str(seedlings.get("unknown", "")).is_empty(), "seedlings exposes an unknown")
    case.assert_false(str(structure.get("known_improvement", "")).is_empty(), "structure exposes a known improvement")
    case.assert_false(str(structure.get("forgone_or_remaining", "")).is_empty(), "structure exposes the remaining risk")
    case.assert_false(str(structure.get("unknown", "")).is_empty(), "structure exposes an unknown")

    var summary: Dictionary = context.summary()
    case.assert_equal(2, Array(summary.get("known_observations", [])).size(), "W6 has two known observations")
    case.assert_equal(2, Array(summary.get("unknown_categories", [])).size(), "W6 has two unknown categories")
    case.assert_false(str(summary.get("lens_label", "")).is_empty(), "W6 has one observation lens")

extends RefCounted

const PATH := "res://src/core/star/star_circuit_calculator.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Star circuit calculator must exist")
    if not FileAccess.file_exists(PATH):
        return
    var script = load(PATH)
    case.assert_true(script != null and script.can_instantiate(), "Star calculator must load")
    if script == null or not script.can_instantiate():
        return
    var calculator = script.new()
    case.assert_near(70.0, calculator.circuit_mastery(70, []), 0.001, "Main-only mastery equals main mastery")
    case.assert_near(62.5, calculator.circuit_mastery(70, [70, 50]), 0.001, "Mastery weights main, average and weakest auxiliary")
    var baseline: Dictionary = calculator.preview({"base_success": 75, "base_mana": 10, "mastery": 70}, [], {"difficulty": 5, "mana_cost": 0}, 0, 0, 0)
    case.assert_equal(80, baseline.success_percent, "Approved first-year main-only example is 80 percent")
    case.assert_equal(&"STABLE", baseline.success_label, "80 percent is stable")
    case.assert_equal(10, baseline.final_mana, "Main-only mana is unchanged")
    var auxiliaries := [
        {"glyph_id": &"PRECISION", "mastery": 60, "base_mana": 4, "special": &"PRECISION"},
        {"glyph_id": &"REDUCTION", "mastery": 60, "base_mana": 4, "special": &"REDUCTION"},
    ]
    var special: Dictionary = calculator.preview({"base_success": 75, "base_mana": 10, "mastery": 70}, auxiliaries, {"difficulty": 5, "mana_cost": 0}, 0, 0, 0)
    case.assert_equal(63, special.success_percent, "Two auxiliaries include complexity and precision bonus")
    case.assert_equal(24, special.final_mana, "Precision and reduction use additive approved mana rates")
    case.assert_equal(&"SAFE_RANGE", special.success_label, "63 percent is safe range")
    var clamp_low: Dictionary = calculator.preview({"base_success": 0, "base_mana": 1, "mastery": 0}, auxiliaries, {"difficulty": 100, "mana_cost": 0}, 0, 0, 0)
    case.assert_equal(5, clamp_low.success_percent, "Success is clamped to 5 percent")
    var clamp_high: Dictionary = calculator.preview({"base_success": 200, "base_mana": 1, "mastery": 100}, [], {"difficulty": 0, "mana_cost": 0}, 100, 0, 0)
    case.assert_equal(98, clamp_high.success_percent, "Success is clamped to 98 percent")

class_name StarCircuitCalculator
extends RefCounted

func circuit_mastery(main_mastery: float, auxiliary_masteries: Array) -> float:
    var normalized_main: float = clampf(main_mastery, 0.0, 100.0)
    if auxiliary_masteries.is_empty():
        return normalized_main
    var total: float = 0.0
    var weakest: float = 100.0
    for value in auxiliary_masteries:
        var mastery: float = clampf(float(value), 0.0, 100.0)
        total += mastery
        weakest = minf(weakest, mastery)
    var average: float = total / float(auxiliary_masteries.size())
    return normalized_main * 0.45 + average * 0.35 + weakest * 0.20

func preview(
    main: Dictionary,
    auxiliaries: Array,
    target: Dictionary,
    conflict_penalty: float = 0.0,
    situation_modifier: float = 0.0,
    other_mana_rate: float = 0.0
) -> Dictionary:
    var auxiliary_masteries: Array = []
    var auxiliary_base_mana: int = 0
    var precision_bonus: float = 0.0
    var reduction_rate: float = 0.0
    for item in auxiliaries:
        var auxiliary: Dictionary = item
        var mastery: float = clampf(float(auxiliary.get("mastery", 0.0)), 0.0, 100.0)
        auxiliary_masteries.append(mastery)
        auxiliary_base_mana += maxi(0, int(auxiliary.get("base_mana", 0)))
        match StringName(auxiliary.get("special", &"NORMAL")):
            &"PRECISION":
                precision_bonus += mastery / 10.0
            &"REDUCTION":
                reduction_rate += 0.10 + mastery / 1000.0

    var mastery: float = circuit_mastery(float(main.get("mastery", 0.0)), auxiliary_masteries)
    var mastery_modifier: float = clampf((mastery - 50.0) * 0.5, -25.0, 25.0)
    var success_raw: float = (
        float(main.get("base_success", 0.0))
        + mastery_modifier
        - float(auxiliaries.size()) * 10.0
        + precision_bonus
        - float(target.get("difficulty", 0.0))
        - conflict_penalty
        + situation_modifier
    )
    var success_percent: int = clampi(roundi(success_raw), 5, 98)

    var main_base_mana: int = maxi(0, int(main.get("base_mana", 0)))
    var base_mana: int = (
        main_base_mana
        + auxiliary_base_mana
        + maxi(0, int(target.get("mana_cost", 0)))
        + maxi(0, int(target.get("output_cost", 0)))
        + maxi(0, int(target.get("duration_cost", 0)))
    )
    var mana_rate: float = 1.0 + float(auxiliaries.size()) * 0.10 + other_mana_rate
    if precision_bonus > 0.0:
        mana_rate += 0.25
    mana_rate -= reduction_rate
    var final_mana: int = maxi(main_base_mana, ceili(float(base_mana) * maxf(0.0, mana_rate)))

    return {
        "status": &"OK",
        "layout": &"FIVE_POINT_STAR",
        "circuit_mastery": mastery,
        "mastery_success_modifier": mastery_modifier,
        "auxiliary_complexity_penalty": auxiliaries.size() * 10,
        "precision_success_bonus": precision_bonus,
        "success_percent": success_percent,
        "success_label": _success_label(success_percent),
        "base_mana": base_mana,
        "mana_rate": mana_rate,
        "final_mana": final_mana,
        "target_keyword": StringName(target.get("keyword", &"")),
        "ending_revealed": false,
        "auto_best_route": false,
    }

func _success_label(value: int) -> StringName:
    if value >= 80:
        return &"STABLE"
    if value >= 60:
        return &"SAFE_RANGE"
    if value >= 40:
        return &"RISKY"
    if value >= 20:
        return &"UNSTABLE"
    return &"COLLAPSE_RISK"

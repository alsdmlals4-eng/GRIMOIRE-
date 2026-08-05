class_name SpellResolutionPolicy
extends RefCounted

enum Outcome {
    FULL_SUCCESS,
    PARTIAL_SUCCESS,
    IMPERFECT_EXECUTION,
    FAILURE,
    BACKLASH,
    CIRCUIT_COLLAPSE,
}


func resolve(success_percent: int, roll_percent: int, cause_glyph_id: StringName) -> Dictionary:
    if success_percent < 1 or success_percent > 100:
        return {"status": &"INVALID_SUCCESS_PERCENT"}
    if roll_percent < 1 or roll_percent > 100:
        return {"status": &"INVALID_ROLL_PERCENT"}
    if cause_glyph_id.is_empty():
        return {"status": &"CAUSE_GLYPH_REQUIRED"}

    var miss_margin: int = roll_percent - success_percent
    if miss_margin <= 0:
        return _result(
            Outcome.FULL_SUCCESS,
            &"FULL_SUCCESS",
            cause_glyph_id,
            1.0,
            1.0,
            "The intended effect resolves as previewed.",
            "Review which glyph combination produced the stable result."
        )
    if miss_margin <= 10:
        return _result(
            Outcome.PARTIAL_SUCCESS,
            &"PARTIAL_SUCCESS",
            cause_glyph_id,
            0.75,
            0.75,
            "The primary intent succeeds with reduced scope or duration.",
            "The unresolved remainder stays actionable in the current situation."
        )
    if miss_margin <= 25:
        return _result(
            Outcome.IMPERFECT_EXECUTION,
            &"IMPERFECT_EXECUTION",
            cause_glyph_id,
            0.50,
            0.50,
            "A weaker or narrower effect exposes the unstable glyph contribution.",
            "The player can simplify, replace the cause glyph, or choose another target keyword."
        )
    if miss_margin <= 40:
        return _result(
            Outcome.FAILURE,
            &"FAILURE",
            cause_glyph_id,
            0.0,
            0.0,
            "The cast fails without hidden extra mana or a random wrong target.",
            "The failed glyph and environmental response reveal a new tactical option."
        )
    return _result(
        Outcome.BACKLASH,
        &"BACKLASH",
        cause_glyph_id,
        0.0,
        0.0,
        "A previewed backlash category affects the caster or environment, never an unpreviewed random target.",
        "The backlash changes the situation and opens a recoverable follow-up action."
    )


func invalid_circuit(cause_glyph_id: StringName, reason: StringName) -> Dictionary:
    if cause_glyph_id.is_empty() or reason.is_empty():
        return {"status": &"INVALID_CIRCUIT_COLLAPSE"}
    var result: Dictionary = _result(
        Outcome.CIRCUIT_COLLAPSE,
        &"CIRCUIT_COLLAPSE",
        cause_glyph_id,
        0.0,
        0.0,
        "The circuit becomes invalid before a valid result transaction can resolve.",
        "Repair the named circuit fault and rebuild the preview before committing again."
    )
    result["reason"] = reason
    result["resource_consumed"] = false
    return result


func _result(
    outcome: int,
    status: StringName,
    cause_glyph_id: StringName,
    effect_scale: float,
    duration_scale: float,
    new_information: String,
    next_opportunity: String
) -> Dictionary:
    return {
        "outcome": outcome,
        "status": status,
        "cause_glyph_id": cause_glyph_id,
        "effect_scale": effect_scale,
        "duration_scale": duration_scale,
        "resource_consumed": true,
        "extra_hidden_mana": 0,
        "duplicate_stock_consumption": 0,
        "wrong_target": false,
        "new_information": new_information,
        "next_opportunity": next_opportunity,
        "explanatory_result": true,
    }

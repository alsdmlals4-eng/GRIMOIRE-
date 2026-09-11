extends RefCounted
## Shared rules v0.4 sections 2, 3, 11. Pure, complete-state assessment.
## NOT a cast/transaction, discovery-filtered UI preview, or duel damage resolver.
## Cost/time are provisional quotes; this module never consumes resources.

const GLYPHS := ["EMBER", "WIND", "WARD", "GATHER"]
# Stable action IDs, not legacy duel attack values. Order normalized lexically.
const RECIPES := {
    "EMBER": ["불씨", "HEAT_POINT", ["heatable"]],
    "WIND": ["바람", "PUSH", ["path_open"]],
    "WARD": ["막기", "BLOCK", ["blockable_boundary"]],
    "GATHER": ["모으기", "GATHER_LOCAL", ["gatherable", "local_receiver_empty"]],
    "EMBER+WIND": ["온기 흐름", "HEAT_FLOW", ["airflow_movable", "heatable"]],
    "EMBER+WARD": ["온기 장막", "RETAIN_HEAT", ["boundary"]],
    "EMBER+GATHER": ["응축 불씨", "FOCUS_HEAT", ["small", "heatable"]],
    "WARD+WIND": ["흐름 전환", "REDIRECT", ["redirectable_flow", "exit_open"]],
    "GATHER+WIND": ["모으는 바람", "TRANSPORT", ["airborne_light", "capture_ready"]],
    "GATHER+WARD": ["봉합 장막", "SEAL", ["small_leak", "boundary_intact"]],
}

func compose(kinds: Array, learned: Array) -> Dictionary:
    if kinds.size() < 1 or kinds.size() > 2:
        return _invalid("INVALID_COUNT")
    var names := PackedStringArray()
    for kind in kinds:
        if kind not in GLYPHS:
            return _invalid("UNKNOWN_GLYPH")
        if kind not in learned:
            return _invalid("UNLEARNED_GLYPH")
        if kind in names:
            return _invalid("DUPLICATE_GLYPH")
        names.append(kind)
    names.sort()
    var key := "+".join(names)
    var row: Array = RECIPES[key]
    return {"status": "OK", "spell_id": key, "name": row[0],
        "action": row[1], "cost": names.size(), "time": 1}

func assess(kinds: Array, learned: Array, target: Dictionary) -> Dictionary:
    var result := compose(kinds, learned)
    if result.status != "OK":
        return result
    if str(target.get("id", "")).is_empty():
        return _invalid("MISSING_TARGET")
    var required: Array = RECIPES[result.spell_id][2]
    for property_key in required:
        if not _flag(target, property_key):
            return _invalid("TARGET_CONDITION:" + property_key)
    var action: String = result.action
    var temperature: String = str(target.get("temperature", "cold"))
    if action == "PUSH" and (_flag(target, "heavy") or not (
            _flag(target, "light") or _flag(target, "airflow_movable"))):
        return _invalid("NOT_MOVABLE")
    if action in ["PUSH", "REDIRECT", "TRANSPORT"]:
        if str(target.get("destination", "")).is_empty():
            return _invalid("MISSING_DESTINATION")
        if str(target.destination) == str(target.id):
            return _invalid("SAME_DESTINATION")
    if action == "RETAIN_HEAT" and temperature not in ["warm", "hot", "overheated"]:
        return _invalid("NO_HEAT_TO_RETAIN")
    if action == "TRANSPORT" and (_flag(target, "full") or _flag(target, "destination_blocked")):
        return _invalid("RECEIVER_UNAVAILABLE")
    if action == "FOCUS_HEAT" and _flag(target, "wide_area"):
        return _invalid("NOT_SMALL_POINT")
    if action == "GATHER_LOCAL" and _flag(target, "remote"):
        return _invalid("NOT_LOCAL")

    var unchanged := (action == "BLOCK" and _flag(target, "closed")) or (
        action in ["GATHER_LOCAL", "TRANSPORT"] and _flag(target, "empty"))
    result["status"] = "VALID_NO_CHANGE" if unchanged else "VALID_CHANGE"
    result["reason"] = "ALREADY_RESOLVED" if unchanged else "APPLICABLE"
    result["target_id"] = target.id
    result["warnings"] = []
    if unchanged:
        result.warnings.append("COST_WITHOUT_CHANGE")
    if action in ["HEAT_POINT", "HEAT_FLOW", "FOCUS_HEAT"]:
        if _flag(target, "heat_sensitive") or _flag(target, "dry") or _flag(target, "volatile"):
            result.warnings.append("DAMAGE_RISK")
        if temperature != "cold":
            result.warnings.append("OVERHEAT_RISK")
        if action == "HEAT_FLOW" and _flag(target, "volatile"):
            result.warnings.append("DISPERSION_RISK")
    if action == "RETAIN_HEAT" and temperature == "overheated":
        result.warnings.append("RETAINS_DANGEROUS_HEAT")
    if action in ["PUSH", "REDIRECT"] and _flag(target, "toward_audience"):
        result.warnings.append("AUDIENCE_RISK")
    if action == "TRANSPORT" and _flag(target, "receiver_open"):
        result.warnings.append("REDISPERSION_RISK")
    return result

func _flag(target: Dictionary, key: String) -> bool:
    # Missing/ill-typed flags fail closed, not truthy strings such as "false".
    return target.get(key, false) is bool and target.get(key, false) == true

func _invalid(reason: String) -> Dictionary:
    return {"status": "INVALID", "reason": reason, "cost": 0, "time": 0}

extends RefCounted

const KINDS: Array[StringName] = [&"EMBER", &"WIND", &"WARD", &"GATHER"]
# attack, guard, attack reduction, strip guard, reflection cap.
const EFFECTS := {
    "EMBER": [3, 0, 0, false, 0],
    "WIND": [1, 2, 0, false, 0],
    "WARD": [0, 4, 0, false, 0],
    "GATHER": [2, 0, 0, false, 0],
    "EMBER+WIND": [3, 0, 2, false, 0],
    "EMBER+WARD": [2, 3, 0, false, 0],
    "EMBER+GATHER": [5, 0, 0, false, 0],
    "WARD+WIND": [0, 3, 0, false, 2],
    "GATHER+WIND": [2, 0, 0, true, 0],
    "GATHER+WARD": [0, 6, 0, false, 0],
}

func effect(kinds: Array[StringName]) -> Dictionary:
    if kinds.size() < 1 or kinds.size() > 2:
        return {"status": &"INVALID_COUNT"}
    for kind in kinds:
        if kind not in KINDS:
            return {"status": &"UNKNOWN_KIND"}
    if kinds.size() == 2 and kinds[0] == kinds[1]:
        return {"status": &"DUPLICATE_KIND"}
    # StringName ordering is not lexical; normalize through strings.
    var sorted := PackedStringArray(kinds)
    sorted.sort()
    var row: Array = EFFECTS["+".join(sorted)]
    return {"status": &"OK", "attack": row[0], "guard": row[1],
        "attack_reduction": row[2], "strip_guard": row[3],
        "reflect_cap": row[4], "cost": kinds.size()}

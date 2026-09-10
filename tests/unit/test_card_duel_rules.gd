extends RefCounted

func run(case) -> void:
    var path := "res://src/core/card_duel/duel_rules.gd"
    case.assert_true(FileAccess.file_exists(path), "card duel rules exist")
    if not FileAccess.file_exists(path):
        return
    var rules = load(path).new()
    # Columns: kinds, attack, guard, reduction, strip, reflect.
    var rows := [
        [[&"EMBER"], 3, 0, 0, false, 0],
        [[&"WIND"], 1, 2, 0, false, 0],
        [[&"WARD"], 0, 4, 0, false, 0],
        [[&"GATHER"], 2, 0, 0, false, 0],
        [[&"EMBER", &"WIND"], 3, 0, 2, false, 0],
        [[&"EMBER", &"WARD"], 2, 3, 0, false, 0],
        [[&"EMBER", &"GATHER"], 5, 0, 0, false, 0],
        [[&"WIND", &"WARD"], 0, 3, 0, false, 2],
        [[&"WIND", &"GATHER"], 2, 0, 0, true, 0],
        [[&"WARD", &"GATHER"], 0, 6, 0, false, 0],
    ]
    for row in rows:
        var kinds: Array[StringName] = []
        kinds.assign(row[0])
        var expected := {"status": &"OK", "attack": row[1], "guard": row[2],
            "attack_reduction": row[3], "strip_guard": row[4],
            "reflect_cap": row[5], "cost": kinds.size()}
        case.assert_equal(expected, rules.effect(kinds), "declared effect %s" % [kinds])
        kinds.reverse()
        case.assert_equal(expected, rules.effect(kinds), "order independent")
        var detached: Dictionary = rules.effect(kinds)
        detached.attack = 999
        case.assert_equal(expected, rules.effect(kinds), "lookup returns detached data")
    case.assert_equal(&"INVALID_COUNT", _effect(rules, []).status, "empty rejected")
    case.assert_equal(&"INVALID_COUNT", _effect(rules, [&"EMBER", &"WIND", &"WARD"]).status, "three rejected")
    case.assert_equal(&"UNKNOWN_KIND", _effect(rules, [&"MAGE"]).status, "unknown rejected")
    for kind in [&"EMBER", &"WIND", &"WARD", &"GATHER"]:
        case.assert_equal(&"DUPLICATE_KIND", _effect(rules, [kind, kind]).status, "same kind rejected")

func _effect(rules, values: Array) -> Dictionary:
    var kinds: Array[StringName] = []
    kinds.assign(values)
    return rules.effect(kinds)

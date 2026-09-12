extends SceneTree

func _init() -> void:
    var check = preload("res://tests/test_case.gd").new()
    var path := "res://src/core/shared_spell/duel_spell_exchange.gd"
    check.assert_true(FileAccess.file_exists(path), "shared duel exchange must exist")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"failures": check.failure_count(), "messages": check.failures()}))
        quit(1)
        return
    var rules = load(path).new()
    var cases := [
        [["EMBER"], "flow", 4, 0, "none", 12, 13],
        [["WIND"], "heat", 3, 0, "none", 13, 14],
        [["WARD"], "fixed_pulse", 5, 0, "none", 15, 16],
        [["GATHER"], "flow", 4, 0, "none", 12, 16],
        [["EMBER", "WIND"], "flow", 4, 0, "none", 13, 13],
        [["EMBER", "WARD"], "heat", 6, 0, "none", 15, 16],
        [["EMBER", "GATHER"], "heat", 3, 3, "flow", 13, 14],
        [["WARD", "WIND"], "flow", 4, 0, "none", 15, 13],
        [["GATHER", "WIND"], "heat", 3, 3, "flow", 13, 16],
        [["GATHER", "WARD"], "fixed_pulse", 5, 0, "none", 11, 16],
    ]
    for row in cases:
        var state := _state()
        var foe := _foe(row[1], row[2], row[3], row[4])
        var before := state.duplicate(true)
        var result: Dictionary = rules.resolve(state, row[0], foe)
        check.assert_equal("OK", result.status, "spell accepted " + str(row[0]))
        check.assert_equal(row[5], result.state.player_barrier, "player effect " + str(row[0]))
        check.assert_equal(row[6], result.state.opponent_barrier, "foe effect " + str(row[0]))
        check.assert_equal(before, state, "pure exchange preserves input")
        var reversed: Array = row[0].duplicate()
        reversed.reverse()
        check.assert_equal(result, rules.resolve(state, reversed, foe), "pair order independent")
    var focused: Dictionary = rules.resolve(_state(), ["GATHER"], _foe("flow", 0)).state
    check.assert_equal(1, focused.focus, "new focus persists")
    var attack: Dictionary = rules.resolve(focused, ["EMBER"], _foe("heat", 0))
    check.assert_equal(12, attack.state.opponent_barrier, "focus boosts next direct attack")
    check.assert_equal(0, attack.state.focus, "focus consumed")
    check.assert_equal(0, rules.resolve(focused, ["WARD"], _foe("heat", 0)).state.focus, "unused focus expires next exchange")
    check.assert_equal(1, rules.resolve(focused, ["GATHER"], _foe("heat", 0)).state.focus, "gather refreshes not stacks")
    check.assert_equal(13, rules.resolve(focused, ["WIND", "WARD"], _foe("flow", 3)).state.opponent_barrier, "focus does not boost counter")
    var suppressed: Dictionary = rules.resolve(_state(), ["GATHER", "WIND"], _foe("flow", 0, 3, "flow")).state
    check.assert_equal(1, suppressed.suppression, "suppression survives generation")
    var stripped: Dictionary = rules.resolve(suppressed, ["EMBER"], _foe("heat", 0, 3, "flow"))
    check.assert_equal(13, stripped.state.opponent_barrier, "next flow shield suppressed")
    check.assert_equal(0, stripped.state.suppression, "suppression expires")
    var refreshed: Dictionary = rules.resolve(suppressed, ["GATHER", "WIND"], _foe("flow", 0, 6, "flow"))
    check.assert_equal(3, refreshed.receipt.shield_removed, "old suppression and recast never stack beyond three")
    check.assert_equal(1, refreshed.state.suppression, "recast refreshes next exchange")
    check.assert_equal(16, rules.resolve(suppressed, ["EMBER"], _foe("heat", 0, 3, "fixed")).state.opponent_barrier, "fixed shield unaffected")
    var hurt := _state()
    hurt.player_barrier = 14
    check.assert_equal(11, rules.resolve(hurt, ["GATHER", "WARD"], _foe("fixed_pulse", 5)).state.player_barrier, "repair caps before damage")
    var last := _state()
    last.player_barrier = 3
    last.opponent_barrier = 3
    check.assert_equal("DRAW", rules.resolve(last, ["EMBER"], _foe("heat", 3)).receipt.outcome, "damage simultaneous")
    check.assert_equal(15, rules.resolve(_state(), ["WIND", "WARD"], _foe("flow", 4, 2, "fixed")).state.opponent_barrier, "counter blocked by remaining shield")
    for pair in [["EMBER", "WARD"], ["WARD", "WIND"]]:
        check.assert_equal("REJECTED", rules.resolve(_state(), pair, _foe("fixed_pulse", 5)).status, "incompatible attack rejects")
    check.assert_equal("REJECTED", rules.resolve(_state(), ["GATHER", "WIND"], _foe("heat", 3, 3, "fixed")).status, "fixed shield not gatherable")
    for glyphs in [[], ["EMBER", "EMBER"], ["NOPE"]]:
        check.assert_equal("REJECTED", rules.resolve(_state(), glyphs, _foe("heat", 3)).status, "invalid recipe")
    for key in ["player_barrier", "opponent_barrier", "focus", "suppression"]:
        var invalid := _state()
        invalid[key] = -1
        check.assert_equal("REJECTED", rules.resolve(invalid, ["EMBER"], _foe("heat", 3)).status, "invalid state range")
    check.assert_equal("REJECTED", rules.resolve(_state(), ["EMBER"], _foe("heat", -1)).status, "negative attack rejected")
    print(JSON.stringify({"assertions": check.assertion_count(), "failures": check.failure_count(), "messages": check.failures()}))
    quit(1 if check.failure_count() else 0)

func _state() -> Dictionary:
    return {"player_barrier":16, "opponent_barrier":16, "focus":0, "suppression":0}

func _foe(nature: String, attack: int, guard: int = 0, kind: String = "none") -> Dictionary:
    return {"nature":nature, "attack":attack, "guard":guard, "guard_kind":kind}

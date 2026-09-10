extends RefCounted

func run(case) -> void:
    var path := "res://src/core/card_duel/duel_exchange.gd"
    case.assert_true(FileAccess.file_exists(path), "card duel exchange exists")
    if not FileAccess.file_exists(path):
        return
    var exchange = load(path).new()
    var rules = load("res://src/core/card_duel/duel_rules.gd").new()
    var effect: Dictionary = _effect(rules, [&"WIND", &"WARD"])
    var foe := {"attack": 4, "guard": 20}
    var before := JSON.stringify([effect, foe])
    var result: Dictionary = exchange.preview(effect, foe, 16, 16)
    case.assert_equal({"player_damage": 1, "opponent_damage": 2, "blocked": 3,
        "reflected": 2, "player_barrier": 15, "opponent_barrier": 14,
        "outcome": &"ONGOING"}, result, "reflection capped and bypasses guard")
    case.assert_equal(before, JSON.stringify([effect, foe]), "preview never mutates inputs")
    case.assert_equal(0, exchange.preview(effect, {"attack": 0, "guard": 0}, 16, 16).reflected, "nothing blocked means no reflection")
    case.assert_equal(1, exchange.preview(effect, {"attack": 1, "guard": 0}, 16, 16).reflected, "reflect only actual blocked")
    effect = _effect(rules, [&"WIND", &"GATHER"])
    case.assert_equal(2, exchange.preview(effect, foe, 16, 16).opponent_damage, "strip before damage")
    effect = _effect(rules, [&"EMBER", &"WIND"])
    case.assert_equal(0, exchange.preview(effect, {"attack": 1, "guard": 0}, 16, 16).player_damage, "reduction clamps at zero")
    effect = _effect(rules, [&"EMBER"])
    case.assert_equal(&"DRAW", exchange.preview(effect, {"attack": 4, "guard": 0}, 1, 1).outcome, "simultaneous lethal draw")
    case.assert_equal(&"WIN", exchange.preview(effect, {"attack": 4, "guard": 0}, 16, 1).outcome, "win")
    case.assert_equal(&"LOSS", exchange.preview(effect, {"attack": 4, "guard": 0}, 1, 16).outcome, "loss")
    case.assert_equal(0, exchange.preview(effect, foe, 1, 16).player_barrier, "barrier clamped")

func _effect(rules, values: Array) -> Dictionary:
    var kinds: Array[StringName] = []
    kinds.assign(values)
    return rules.effect(kinds)

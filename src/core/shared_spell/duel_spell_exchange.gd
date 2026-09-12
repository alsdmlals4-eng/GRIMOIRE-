extends RefCounted
## Shared rules section12. Pure exchange quote, NOT a hand/cost transaction.
## Legacy FIRST_DUEL_1 stays unchanged. Values are playtest baselines.

const Semantics = preload("res://src/core/shared_spell/spell_semantics.gd")

func resolve(state: Dictionary, glyphs: Array, opponent: Dictionary) -> Dictionary:
    for key in ["player_barrier", "opponent_barrier", "focus", "suppression"]:
        if not state.has(key) or typeof(state[key]) != TYPE_INT:
            return _reject("INVALID_STATE")
        var low := 1 if key.ends_with("barrier") else 0
        var high := 16 if key.ends_with("barrier") else 1
        if state[key] < low or state[key] > high:
            return _reject("INVALID_STATE")
    for key in ["attack", "guard"]:
        if not opponent.has(key) or typeof(opponent[key]) != TYPE_INT or opponent[key] < 0 or opponent[key] > 1000000:
            return _reject("INVALID_OPPONENT")
    if opponent.get("nature") not in ["heat", "flow", "fixed_pulse"] or opponent.get("guard_kind") not in ["none", "flow", "fixed"]:
        return _reject("INVALID_OPPONENT")
    if opponent.guard > 0 and opponent.guard_kind == "none":
        return _reject("INVALID_OPPONENT")
    var spell := Semantics.new().compose(glyphs, Semantics.GLYPHS)
    if spell.status != "OK":
        return _reject(spell.get("reason", "INVALID_SPELL"))
    var id: String = spell.spell_id
    if (id == "EMBER+WARD" and opponent.nature != "heat") or (id == "WARD+WIND" and opponent.nature != "flow"):
        return _reject("INCOMPATIBLE_ATTACK")
    if id == "GATHER+WIND" and opponent.guard_kind == "fixed":
        return _reject("FIXED_SHIELD")
    var next := state.duplicate(true)
    next.focus = 0
    next.suppression = 0
    var attack := 0
    var guard := 0
    var incoming: int = opponent.attack
    var shield: int = opponent.guard
    var redirected := 0
    var restored := 0
    var removed := 0
    var nature := "none"
    var warnings: Array[String] = []
    if opponent.guard_kind == "flow" and state.suppression == 1:
        removed = mini(3, shield)
        shield -= removed
    match id:
        "EMBER":
            attack = 3
            nature = "heat"
        "WIND":
            attack = 2
            nature = "flow"
        "WARD": guard = 4
        "GATHER": next.focus = 1
        "EMBER+WIND":
            attack = 3
            nature = "heat"
            if opponent.nature == "flow": incoming = maxi(0, incoming - 1)
        "EMBER+WARD": guard = 5
        "EMBER+GATHER":
            attack = 5
            nature = "heat"
        "WARD+WIND":
            redirected = mini(3, incoming)
            incoming -= redirected
        "GATHER+WIND":
            # Reapplication refreshes duration; it must not double the cap.
            var additional := mini(3 - removed, shield) if opponent.guard_kind == "flow" else 0
            removed += additional
            shield -= additional
            next.suppression = 1
        "GATHER+WARD":
            restored = mini(3, 16 - state.player_barrier)
            next.player_barrier += restored
            if restored == 0: warnings.append("COST_WITHOUT_REPAIR")
    var focus_used: int = state.focus if attack > 0 else 0
    attack += focus_used
    var blocked := mini(incoming, guard)
    var player_damage := incoming - blocked
    var direct_blocked := mini(attack, shield)
    shield -= direct_blocked
    var counter_blocked := mini(redirected, shield)
    var opponent_damage := attack - direct_blocked + redirected - counter_blocked
    next.player_barrier = maxi(0, next.player_barrier - player_damage)
    next.opponent_barrier = maxi(0, next.opponent_barrier - opponent_damage)
    var outcome := "ONGOING"
    if next.player_barrier == 0 and next.opponent_barrier == 0: outcome = "DRAW"
    elif next.opponent_barrier == 0: outcome = "WIN"
    elif next.player_barrier == 0: outcome = "LOSS"
    return {"status":"OK", "state":next, "receipt":{
        "spell_id":id, "name":spell.name, "cost":spell.cost,
        "attack":attack, "nature":nature, "focus_used":focus_used,
        "shield_removed":removed, "restored":restored, "redirected":redirected,
        "blocked":blocked, "direct_blocked":direct_blocked, "counter_blocked":counter_blocked,
        "player_damage":player_damage, "opponent_damage":opponent_damage,
        "outcome":outcome, "warnings":warnings}}

func _reject(reason: String) -> Dictionary:
    return {"status":"REJECTED", "reason":reason}

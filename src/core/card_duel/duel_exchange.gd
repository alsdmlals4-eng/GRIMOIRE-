extends RefCounted

# Inputs are validated domain effects and the announced opponent action.
# All damage is calculated before either outcome is inspected.
func preview(effect: Dictionary, opponent: Dictionary, player_barrier: int, opponent_barrier: int) -> Dictionary:
    var foe_guard: int = 0 if effect.strip_guard else opponent.guard
    var foe_attack := maxi(0, opponent.attack - effect.attack_reduction)
    var blocked := mini(foe_attack, effect.guard)
    var reflected := mini(blocked, effect.reflect_cap)
    var player_damage := maxi(0, foe_attack - effect.guard)
    var opponent_damage := maxi(0, effect.attack - foe_guard) + reflected
    var remaining_player := maxi(0, player_barrier - player_damage)
    var remaining_opponent := maxi(0, opponent_barrier - opponent_damage)
    var outcome: StringName = &"ONGOING"
    if remaining_player == 0 and remaining_opponent == 0:
        outcome = &"DRAW"
    elif remaining_opponent == 0:
        outcome = &"WIN"
    elif remaining_player == 0:
        outcome = &"LOSS"
    return {"player_damage": player_damage, "opponent_damage": opponent_damage,
        "blocked": blocked, "reflected": reflected, "player_barrier": remaining_player,
        "opponent_barrier": remaining_opponent, "outcome": outcome}

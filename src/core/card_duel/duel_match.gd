extends RefCounted

const Rules = preload("res://src/core/card_duel/duel_rules.gd")
const Exchange = preload("res://src/core/card_duel/duel_exchange.gd")
const SCHEMA := "GRIMOIRE_CARD_DUEL_1"
const VERSION := "FIRST_DUEL_1"
const PATTERNS := [{"attack":4, "guard":0}, {"attack":2, "guard":4}, {"attack":6, "guard":0}]

func create(seed_value: int) -> Dictionary:
    var rng := RandomNumberGenerator.new()
    rng.seed = seed_value
    var cards: Array = []
    for kind in Rules.KINDS:
        for index in range(2):
            cards.append({"instance_id":"%s-%d" % [kind, index], "kind":String(kind)})
    _shuffle(cards, rng)
    var state := {"schema_version":SCHEMA, "rules_version":VERSION, "revision":0,
        "exchange_index":1, "player_barrier":16, "opponent_barrier":16, "budget":2,
        "hand":[], "draw_pile":cards, "discard_pile":[], "rng_seed":str(seed_value),
        "rng_state":str(rng.state), "resolved_commands":{}, "outcome":"ONGOING"}
    _refill(state)
    return state

func opponent(state: Dictionary) -> Dictionary:
    return PATTERNS[(int(state.exchange_index) - 1) % PATTERNS.size()].duplicate(true)

func preview(state: Dictionary, instance_ids: Array[StringName]) -> Dictionary:
    var checked := restore(state)
    if checked.status != &"OK":
        return {"status":checked.status}
    state = checked.state
    if state.outcome != "ONGOING":
        return {"status":&"MATCH_ENDED"}
    return _preview_valid(state, instance_ids)

func _preview_valid(state: Dictionary, ids: Array[StringName]) -> Dictionary:
    var kinds: Array[StringName] = []
    var seen := {}
    for id in ids:
        if seen.has(id):
            return {"status":&"DUPLICATE_INSTANCE"}
        seen[id] = true
        var found := false
        for card in state.hand:
            if String(id) == card.instance_id:
                kinds.append(StringName(card.kind))
                found = true
                break
        if not found:
            return {"status":&"CARD_NOT_IN_HAND"}
    var effect := Rules.new().effect(kinds)
    if effect.status != &"OK":
        return effect
    if effect.cost > state.budget:
        return {"status":&"INSUFFICIENT_BUDGET"}
    return {"status":&"OK", "effect":effect, "result":Exchange.new().preview(
        effect, opponent(state), int(state.player_barrier), int(state.opponent_barrier))}

func apply(state: Dictionary, command: Dictionary) -> Dictionary:
    var checked := restore(state)
    if checked.status != &"OK":
        return _error(state, checked.status)
    state = checked.state
    var id = command.get("command_id")
    if not id is String or id.is_empty():
        return _error(state, &"INVALID_COMMAND")
    # A retry returns its receipt even after revision advance or match end.
    if state.resolved_commands.has(id):
        return {"status":&"OK", "state":state.duplicate(true),
            "result":state.resolved_commands[id].duplicate(true)}
    if not _integer(command.get("expected_revision")):
        return _error(state, &"INVALID_COMMAND")
    if command.expected_revision != state.revision:
        return _error(state, &"STALE_STATE")
    if state.outcome != "ONGOING":
        return _error(state, &"MATCH_ENDED")
    if command.get("kind") not in ["CAST", "WAIT"] or not command.get("instance_ids") is Array:
        return _error(state, &"INVALID_COMMAND")
    var ids: Array[StringName] = []
    for value in command.instance_ids:
        if not (value is String or value is StringName):
            return _error(state, &"INVALID_COMMAND")
        ids.append(StringName(value))
    var effect := {"attack":0, "guard":0, "attack_reduction":0,
        "strip_guard":false, "reflect_cap":0, "cost":0}
    var result: Dictionary
    if command.kind == "CAST":
        var prediction := _preview_valid(state, ids)
        if prediction.status != &"OK":
            return _error(state, prediction.status)
        effect = prediction.effect
        result = prediction.result
    else:
        result = Exchange.new().preview(effect, opponent(state), state.player_barrier, state.opponent_barrier)
    var next := state.duplicate(true)
    if command.kind == "CAST":
        for index in range(next.hand.size() - 1, -1, -1):
            if StringName(next.hand[index].instance_id) in ids:
                next.discard_pile.append(next.hand.pop_at(index))
    next.budget -= effect.cost
    next.player_barrier = result.player_barrier
    next.opponent_barrier = result.opponent_barrier
    next.outcome = String(result.outcome)
    next.revision += 1
    next.resolved_commands[id] = result.duplicate(true)
    if next.outcome == "ONGOING":
        next.exchange_index += 1
        next.budget = 2
        _refill(next)
    return {"status":&"OK", "state":next, "result":result.duplicate(true)}

func restore(snapshot: Dictionary) -> Dictionary:
    if not snapshot.has_all(["schema_version", "rules_version"]):
        return {"status":&"CORRUPT_SNAPSHOT"}
    if not snapshot.schema_version is String or not snapshot.rules_version is String:
        return {"status":&"UNSUPPORTED_VERSION"}
    if snapshot.schema_version != SCHEMA or snapshot.rules_version != VERSION:
        return {"status":&"UNSUPPORTED_VERSION"}
    for key in ["revision", "exchange_index", "player_barrier", "opponent_barrier", "budget"]:
        if not _integer(snapshot.get(key)) or snapshot[key] < 0 or snapshot[key] > 2147483647:
            return {"status":&"CORRUPT_SNAPSHOT"}
    if snapshot.exchange_index < 1 or snapshot.budget > 2 or snapshot.player_barrier > 16 or snapshot.opponent_barrier > 16:
        return {"status":&"CORRUPT_SNAPSHOT"}
    for key in ["rng_state", "rng_seed"]:
        var value = snapshot.get(key)
        if not value is String or not value.is_valid_int() or str(value.to_int()) != value:
            return {"status":&"CORRUPT_SNAPSHOT"}
    var expected_outcome := "ONGOING"
    if snapshot.player_barrier == 0 and snapshot.opponent_barrier == 0:
        expected_outcome = "DRAW"
    elif snapshot.opponent_barrier == 0:
        expected_outcome = "WIN"
    elif snapshot.player_barrier == 0:
        expected_outcome = "LOSS"
    if not snapshot.get("outcome") is String:
        return {"status":&"CORRUPT_SNAPSHOT"}
    if snapshot.outcome != expected_outcome or not snapshot.get("resolved_commands") is Dictionary:
        return {"status":&"CORRUPT_SNAPSHOT"}
    var expected_exchange: int = int(snapshot.revision) + (1 if expected_outcome == "ONGOING" else 0)
    if snapshot.exchange_index != expected_exchange:
        return {"status":&"CORRUPT_SNAPSHOT"}
    var seen := {}
    for pile in ["hand", "draw_pile", "discard_pile"]:
        if not snapshot.get(pile) is Array:
            return {"status":&"CORRUPT_SNAPSHOT"}
        for card in snapshot[pile]:
            if not card is Dictionary or not card.has_all(["instance_id", "kind"]):
                return {"status":&"CORRUPT_SNAPSHOT"}
            if not card.kind is String or StringName(card.kind) not in Rules.KINDS:
                return {"status":&"CORRUPT_SNAPSHOT"}
            if card.instance_id not in [card.kind + "-0", card.kind + "-1"] or seen.has(card.instance_id):
                return {"status":&"CORRUPT_SNAPSHOT"}
            seen[card.instance_id] = true
    if seen.size() != 8 or snapshot.hand.size() > 4:
        return {"status":&"CORRUPT_SNAPSHOT"}
    if expected_outcome == "ONGOING" and (snapshot.hand.size() != 4 or snapshot.budget != 2):
        return {"status":&"CORRUPT_SNAPSHOT"}
    for id in snapshot.resolved_commands:
        var receipt = snapshot.resolved_commands[id]
        if not id is String or id.is_empty() or not receipt is Dictionary:
            return {"status":&"CORRUPT_SNAPSHOT"}
        for key in ["player_damage", "opponent_damage", "blocked", "reflected", "player_barrier", "opponent_barrier"]:
            if not _integer(receipt.get(key)) or receipt[key] < 0:
                return {"status":&"CORRUPT_SNAPSHOT"}
        if receipt.get("outcome") not in ["ONGOING", "WIN", "LOSS", "DRAW"]:
            return {"status":&"CORRUPT_SNAPSHOT"}
    if snapshot.resolved_commands.size() != snapshot.revision:
        return {"status":&"CORRUPT_SNAPSHOT"}
    var normalized := snapshot.duplicate(true)
    for key in ["revision", "exchange_index", "player_barrier", "opponent_barrier", "budget"]:
        normalized[key] = int(normalized[key])
    for receipt in normalized.resolved_commands.values():
        for key in ["player_damage", "opponent_damage", "blocked", "reflected", "player_barrier", "opponent_barrier"]:
            receipt[key] = int(receipt[key])
        receipt.outcome = StringName(receipt.outcome)
    return {"status":&"OK", "state":normalized}

func _integer(value: Variant) -> bool:
    return value is int or (value is float and is_finite(value) and value == floor(value))

func _error(state: Dictionary, status: StringName) -> Dictionary:
    return {"status":status, "state":state.duplicate(true), "result":{}}

func _refill(state: Dictionary) -> void:
    var rng := RandomNumberGenerator.new()
    rng.seed = int(state.rng_seed)
    rng.state = int(state.rng_state)
    while state.hand.size() < 4:
        if state.draw_pile.is_empty():
            state.draw_pile = state.discard_pile
            state.discard_pile = []
            _shuffle(state.draw_pile, rng)
        state.hand.append(state.draw_pile.pop_back())
    # JSON numbers cannot preserve every 64-bit RNG value; keep decimal strings.
    state.rng_state = str(rng.state)

func _shuffle(cards: Array, rng: RandomNumberGenerator) -> void:
    for i in range(cards.size() - 1, 0, -1):
        var j := rng.randi_range(0, i)
        var temp = cards[i]
        cards[i] = cards[j]
        cards[j] = temp

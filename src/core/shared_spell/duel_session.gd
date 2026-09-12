extends RefCounted
## Versioned development match. Restore verifies deterministic command replay.
## Snapshot compatibility is pinned to this rules version and Godot4.7.1.
const Exchange = preload("res://src/core/shared_spell/duel_spell_exchange.gd")
const GLYPHS := ["EMBER", "WIND", "WARD", "GATHER"]
const SCHEMA := "SHARED_DUEL_1_GODOT_4_7_1"
const PATTERNS := [
    {"attack":4,"guard":0,"nature":"flow","guard_kind":"none"},
    {"attack":3,"guard":3,"nature":"heat","guard_kind":"flow"},
    {"attack":5,"guard":0,"nature":"fixed_pulse","guard_kind":"none"}]

func create(seed_value: int, tutorial: bool = true) -> Dictionary:
    var rng := RandomNumberGenerator.new()
    rng.seed = seed_value
    var cards: Array = range(8)
    _shuffle(cards, rng)
    var s := {"schema":SCHEMA,"seed":seed_value,"tutorial":tutorial,"revision":0,
        "player_barrier":16,"opponent_barrier":16,"focus":0,"suppression":0,
        "hand":[],"draw":cards,"discard":[],"rng_state":rng.state,
        "outcome":"ONGOING","commands":[],"receipts":{}}
    if tutorial:
        s.hand = [0,2,4,6]
        for card in s.hand: s.draw.erase(card)
    _refill(s)
    return s

func opponent(s: Dictionary) -> Dictionary:
    return PATTERNS[s.revision % PATTERNS.size()].duplicate(true)

func preview(s: Dictionary, command: Dictionary) -> Dictionary:
    # Same transition on a verified independent copy, no physical mutation.
    return apply(s, command)

func apply(s: Dictionary, command: Dictionary) -> Dictionary:
    var checked := restore(s)
    if checked.status != "OK": return checked
    return _step(checked.state, command)

func restore(snapshot: Dictionary) -> Dictionary:
    if snapshot.get("schema") != SCHEMA or not snapshot.get("seed") is int or not snapshot.get("tutorial") is bool or not snapshot.get("commands") is Array:
        return _reject("INVALID_SNAPSHOT")
    var expected := create(snapshot.seed, snapshot.tutorial)
    for command in snapshot.commands:
        if not command is Dictionary: return _reject("INVALID_SNAPSHOT")
        var result := _step(expected, command)
        if result.status != "APPLIED": return _reject("INVALID_SNAPSHOT")
        expected = result.state
    if expected != snapshot: return _reject("SNAPSHOT_MISMATCH")
    return {"status":"OK","state":expected}

func _step(s: Dictionary, command: Dictionary) -> Dictionary:
    if not command.get("id") is String or command.id.is_empty() or not command.get("revision") is int or not command.get("ids") is Array or command.get("kind") not in ["CAST","TIDY","WAIT","STOP"]:
        return _reject("INVALID_COMMAND")
    var ids: Array = command.ids.duplicate()
    for value in ids:
        if not value is int: return _reject("INVALID_CARD")
    ids.sort()
    var normalized := {"id":command.id,"revision":command.revision,"kind":command.kind,"ids":ids}
    if s.receipts.has(command.id):
        for prior in s.commands:
            if prior.id == command.id:
                if prior != normalized: return _reject("COMMAND_CONFLICT")
                return {"status":"REPLAY","state":s.duplicate(true),"receipt":s.receipts[command.id].duplicate(true)}
    if command.revision != s.revision: return _reject("STALE_REVISION")
    if s.outcome != "ONGOING": return _reject("MATCH_ENDED")
    if (command.kind == "CAST" and ids.size() not in [1,2]) or (command.kind == "TIDY" and ids.size() != 1) or (command.kind in ["WAIT","STOP"] and not ids.is_empty()):
        return _reject("INVALID_COUNT")
    var seen: Array = []
    for id in ids:
        if id not in s.hand or id in seen: return _reject("CARD_NOT_AVAILABLE")
        seen.append(id)
    var next := s.duplicate(true)
    var receipt: Dictionary
    if command.kind == "STOP":
        next.outcome = "STOPPED"
        receipt = {"outcome":"STOPPED","cost":0}
    elif command.kind == "CAST":
        var glyphs: Array = []
        for id in ids: glyphs.append(GLYPHS[id / 2])
        var resolved := Exchange.new().resolve(s, glyphs, opponent(s))
        if resolved.status != "OK": return resolved
        next = resolved.state
        receipt = resolved.receipt
        next.outcome = receipt.outcome
        for id in ids:
            next.hand.erase(id)
            next.discard.append(id)
    else:
        # No spell on WAIT/TIDY: take announced damage; durations expire.
        next.player_barrier = maxi(0, s.player_barrier - opponent(s).attack)
        next.focus = 0
        next.suppression = 0
        next.outcome = "LOSS" if next.player_barrier == 0 else "ONGOING"
        receipt = {"outcome":next.outcome,"cost":0,"player_damage":opponent(s).attack}
        if command.kind == "TIDY":
            if next.draw.is_empty(): _recycle(next)
            if next.draw.is_empty(): return _reject("NO_REPLACEMENT")
            var replacement = next.draw.pop_back()
            next.hand.erase(ids[0])
            next.hand.append(replacement)
            next.draw.push_front(ids[0])
    next.revision += 1
    next.commands.append(normalized)
    next.receipts[command.id] = receipt.duplicate(true)
    if next.outcome == "ONGOING": _refill(next)
    return {"status":"APPLIED","state":next,"receipt":receipt.duplicate(true)}

func _refill(s: Dictionary) -> void:
    while s.hand.size() < 4:
        if s.draw.is_empty(): _recycle(s)
        s.hand.append(s.draw.pop_back())

func _recycle(s: Dictionary) -> void:
    var rng := RandomNumberGenerator.new()
    rng.seed = s.seed
    rng.state = s.rng_state
    s.draw = s.discard
    s.discard = []
    _shuffle(s.draw, rng)
    s.rng_state = rng.state

func _shuffle(cards: Array, rng: RandomNumberGenerator) -> void:
    for i in range(cards.size() - 1, 0, -1):
        var j := rng.randi_range(0, i)
        var value = cards[i]
        cards[i] = cards[j]
        cards[j] = value

func _reject(reason: String) -> Dictionary:
    return {"status":"REJECTED","reason":reason}

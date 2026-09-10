extends RefCounted

func run(case) -> void:
    var path := "res://src/core/card_duel/duel_match.gd"
    case.assert_true(FileAccess.file_exists(path), "card duel match exists")
    if not FileAccess.file_exists(path):
        return
    var duel = load(path).new()
    var state: Dictionary = duel.create(42)
    case.assert_equal(state, duel.create(42), "seed reproducible")
    case.assert_equal(4, state.hand.size(), "initial hand four")
    case.assert_equal(4, state.draw_pile.size(), "initial draw four")
    var ids := {}
    for card in state.hand + state.draw_pile:
        ids[card.instance_id] = true
    case.assert_equal(8, ids.size(), "eight unique instances")
    case.assert_equal({"attack":4, "guard":0}, duel.opponent(state), "first announcement")
    var selected: Array[StringName] = [StringName(state.hand[0].instance_id)]
    var before := JSON.stringify(state)
    var prediction: Dictionary = duel.preview(state, selected)
    case.assert_equal(before, JSON.stringify(state), "preview immutable")
    var cmd := {"command_id":"cast-1", "expected_revision":0, "kind":"CAST", "instance_ids":selected}
    var first: Dictionary = duel.apply(state, cmd)
    case.assert_equal(&"OK", first.status, "cast accepted")
    case.assert_equal(prediction.result, first.result, "commit uses preview calculation")
    case.assert_equal(before, JSON.stringify(state), "apply detached from input")
    case.assert_equal(4, first.state.hand.size(), "only spent card refilled")
    case.assert_equal(1, first.state.discard_pile.size(), "spent exactly once")
    case.assert_equal({"attack":2, "guard":4}, duel.opponent(first.state), "second announcement")
    var repeated: Dictionary = duel.apply(first.state, cmd)
    case.assert_equal(first.state, repeated.state, "duplicate does not debit again")
    case.assert_equal(first.result, repeated.result, "duplicate returns original result")
    var stale := cmd.duplicate(true)
    stale.command_id = "stale"
    case.assert_equal(&"STALE_STATE", duel.apply(first.state, stale).status, "stale rejected")
    var wait_cmd := {"command_id":"wait-2", "expected_revision":1, "kind":"WAIT", "instance_ids":selected}
    var waited: Dictionary = duel.apply(first.state, wait_cmd)
    case.assert_equal(first.state.hand, waited.state.hand, "wait never casts selected cards")
    case.assert_equal(first.state.opponent_barrier, waited.state.opponent_barrier, "wait has zero player attack")
    case.assert_equal({"attack":6, "guard":0}, duel.opponent(waited.state), "third announcement")
    var restored: Dictionary = duel.restore(JSON.parse_string(JSON.stringify(first.state)))
    case.assert_equal(&"OK", restored.status, "JSON restore accepted")
    case.assert_equal(waited, duel.apply(restored.state, wait_cmd), "restored next action identical")
    var bad := state.duplicate(true)
    bad.schema_version = 999
    case.assert_equal(&"UNSUPPORTED_VERSION", duel.restore(bad).status, "unknown schema refused")
    bad = state.duplicate(true)
    bad.hand[0] = bad.hand[1].duplicate(true)
    case.assert_equal(&"CORRUPT_SNAPSHOT", duel.restore(bad).status, "duplicate cards refused")
    case.assert_equal(&"CORRUPT_SNAPSHOT", duel.restore({}).status, "missing snapshot refused")
    for field in ["outcome", "rng_state", "rng_seed", "hand", "resolved_commands"]:
        bad = state.duplicate(true)
        bad[field] = 17
        case.assert_equal(&"CORRUPT_SNAPSHOT", duel.restore(bad).status, "invalid field type %s" % field)
    bad = state.duplicate(true)
    bad.exchange_index = 99
    case.assert_equal(&"CORRUPT_SNAPSHOT", duel.restore(bad).status, "exchange must track resolved revisions")
    var invalid := cmd.duplicate(true)
    invalid.instance_ids = ["missing"]
    case.assert_equal(&"CARD_NOT_IN_HAND", duel.apply(state, invalid).status, "foreign instance refused")
    invalid.instance_ids = [state.hand[0].instance_id, state.hand[0].instance_id]
    case.assert_equal(&"DUPLICATE_INSTANCE", duel.apply(state, invalid).status, "same instance twice refused")
    invalid.instance_ids = 7
    case.assert_equal(&"INVALID_COMMAND", duel.apply(state, invalid).status, "malformed command refused")
    # Exercise repeated draws, a discard reshuffle, JSON resume and card conservation.
    state = duel.create(9)
    for i in range(12):
        if state.outcome != &"ONGOING":
            break
        var next_cmd := {"command_id":"cycle-%d" % i, "expected_revision":state.revision,
            "kind":"CAST", "instance_ids":[state.hand[0].instance_id]}
        var copy: Dictionary = duel.restore(JSON.parse_string(JSON.stringify(state)))
        var step: Dictionary = duel.apply(state, next_cmd)
        case.assert_equal(step, duel.apply(copy.state, next_cmd), "resume including reshuffle")
        state = step.state
        ids.clear()
        for card in state.hand + state.draw_pile + state.discard_pile:
            ids[card.instance_id] = true
        case.assert_equal(8, ids.size(), "card conservation")
    state = duel.create(1)
    state.player_barrier = 1
    var ended: Dictionary = duel.apply(state, {"command_id":"end", "expected_revision":0, "kind":"WAIT", "instance_ids":[]})
    case.assert_equal(&"LOSS", ended.state.outcome, "wait can end duel")
    case.assert_equal(1, ended.state.exchange_index, "no next exchange after defeat")
    case.assert_equal(state.hand, ended.state.hand, "no end refill")
    case.assert_equal(&"MATCH_ENDED", duel.apply(ended.state, {"command_id":"later", "expected_revision":1,"kind":"WAIT", "instance_ids":[]}).status, "ended rejects new commands")

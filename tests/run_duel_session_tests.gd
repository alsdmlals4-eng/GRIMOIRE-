extends SceneTree

func _init() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var path := "res://src/core/shared_spell/duel_session.gd"
    c.assert_true(FileAccess.file_exists(path), "versioned duel session exists")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"failures":c.failure_count()}))
        quit(1)
        return
    var rules = load(path).new()
    var s: Dictionary = rules.create(17)
    c.assert_equal([0,2,4,6], s.hand, "tutorial shows each glyph")
    c.assert_equal(s, rules.create(17), "seed deterministic")
    var cmd := _cmd(s, "CAST", [6])
    var quote: Dictionary = rules.preview(s, cmd)
    c.assert_equal(0, s.revision, "preview free")
    c.assert_equal(1, quote.state.focus, "gather persists focus")
    var cast: Dictionary = rules.apply(s, cmd)
    c.assert_equal(quote, cast, "preview exactly commit")
    c.assert_equal(4, cast.state.hand.size(), "refill hand")
    c.assert_equal(12, cast.state.player_barrier, "gather receives announced attack")
    c.assert_equal("REPLAY", rules.apply(cast.state, cmd).status, "retry recognized")
    var conflict := cmd.duplicate(true)
    conflict.ids = [0]
    c.assert_equal("REJECTED", rules.apply(cast.state, conflict).status, "same id different payload blocked")
    conflict.id = "other"
    c.assert_equal("REJECTED", rules.apply(cast.state, conflict).status, "stale revision blocked")
    var loaded: Dictionary = rules.restore(bytes_to_var(var_to_bytes(cast.state)))
    c.assert_equal("OK", loaded.status, "binary snapshot restorable")
    c.assert_equal(cast.state, loaded.state, "all state preserved")
    var next := _cmd(cast.state, "CAST", [0])
    var hit: Dictionary = rules.apply(loaded.state, next)
    c.assert_equal(15, hit.state.opponent_barrier, "focused heat4 vs flow shield3")
    c.assert_equal(0, hit.state.focus, "focus consumed after load")
    c.assert_equal(rules.apply(cast.state, next), hit, "resume same future")
    var tidy: Dictionary = rules.apply(s, _cmd(s, "TIDY", [0]))
    c.assert_equal("APPLIED", tidy.status, "tidy accepted")
    c.assert_true(0 not in tidy.state.hand, "returned card not immediately redrawn")
    c.assert_equal(0, tidy.state.draw[0], "returned card bottom")
    c.assert_equal(12, tidy.state.player_barrier, "tidy forfeits defense")
    c.assert_equal(1, tidy.state.revision, "tidy consumes exchange")
    var stopped: Dictionary = rules.apply(s, _cmd(s, "STOP", []))
    c.assert_equal("STOPPED", stopped.state.outcome, "safe stop")
    c.assert_equal(16, stopped.state.player_barrier, "stop has no combat damage")
    c.assert_equal("REJECTED", rules.apply(stopped.state, _cmd(stopped.state, "WAIT", [])).status, "terminal cannot continue")
    for ids in [[7], [0,0], [0,2,4]]:
        c.assert_equal("REJECTED", rules.apply(s, _cmd(s, "CAST", ids)).status, "illegal cards/count")
    var bad: Dictionary = hit.state.duplicate(true)
    bad.hand[0] = bad.hand[1]
    c.assert_equal("REJECTED", rules.restore(bad).status, "duplicate card save rejected")
    bad = hit.state.duplicate(true)
    bad.focus = 1
    c.assert_equal("REJECTED", rules.restore(bad).status, "impossible focus save rejected")
    for seed_value in range(12):
        var run: Dictionary = rules.create(seed_value, false)
        for turn in range(12):
            if run.outcome != "ONGOING": break
            var action := _cmd(run, "TIDY" if turn % 2 else "WAIT", [run.hand[0]] if turn % 2 else [])
            var result: Dictionary = rules.apply(run, action)
            c.assert_equal("APPLIED", result.status, "seeded progression")
            run = result.state
            c.assert_equal("OK", rules.restore(run).status, "seeded restore")
        c.assert_equal("LOSS", run.outcome, "waiting eventually resolves loss")
    var folder := ProjectSettings.globalize_path("res://artifacts/local-validation/duel-session-tests")
    DirAccess.make_dir_recursive_absolute(folder)
    var file := FileAccess.open(folder.path_join("snapshot.bin"), FileAccess.WRITE)
    file.store_buffer(var_to_bytes(hit.state))
    file.close()
    var saved = bytes_to_var(FileAccess.get_file_as_bytes(folder.path_join("snapshot.bin")))
    c.assert_equal(hit.state, rules.restore(saved).state, "actual file roundtrip")
    var wins := 0
    for seed_value in range(20):
        var run: Dictionary = rules.create(seed_value, false)
        for turn in range(40):
            if run.outcome != "ONGOING": break
            var best: Dictionary = {}
            var score := -100000
            for a in range(run.hand.size()):
                var choices: Array = [[run.hand[a]]]
                for b in range(a + 1, run.hand.size()): choices.append([run.hand[a],run.hand[b]])
                for choice in choices:
                    var candidate: Dictionary = rules.apply(run, _cmd(run,"CAST",choice))
                    if candidate.status != "APPLIED": continue
                    var value: int = candidate.state.player_barrier * 2 - candidate.state.opponent_barrier
                    if candidate.state.outcome == "WIN": value += 100
                    if value > score:
                        best = candidate
                        score = value
            if best.is_empty(): best = rules.apply(run, _cmd(run,"WAIT",[]))
            run = best.state
            var all_cards: Array = run.hand + run.draw + run.discard
            all_cards.sort()
            c.assert_equal([0,1,2,3,4,5,6,7],all_cards,"physical card conservation across casts/recycle")
            c.assert_equal("OK",rules.restore(run).status,"cast/recycle replay matches")
        if run.outcome == "WIN": wins += 1
        if run.outcome != "ONGOING":
            c.assert_equal("REJECTED",rules.apply(run,_cmd(run,"WAIT",[])).status,"terminal casts blocked")
    c.assert_true(wins > 0,"at least one tested legal policy completes a win; not balance proof")
    print(JSON.stringify({"assertions":c.assertion_count(), "failures":c.failure_count(), "messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

func _cmd(s: Dictionary, kind: String, ids: Array) -> Dictionary:
    return {"id":"action-" + str(s.revision), "revision":s.revision, "kind":kind, "ids":ids}

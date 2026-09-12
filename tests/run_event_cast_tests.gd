extends SceneTree

func _init() -> void:
    var check = preload("res://tests/test_case.gd").new()
    var path := "res://src/core/shared_spell/event_spell_cast.gd"
    check.assert_true(FileAccess.file_exists(path), "event cast must atomically return effects and cost")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"failures": check.failure_count(), "messages": check.failures()}))
        quit(1)
        return
    var engine = load(path).new()
    var state := _state()
    var original := state.duplicate(true)
    var command := _command("one", ["EMBER"])
    var result: Dictionary = engine.cast(state, command)
    check.assert_equal("CAST", result.status, "valid explicit cast")
    check.assert_equal("warm", result.state.objects.A.temperature, "heat changes actual target")
    check.assert_equal(5, result.state.mana, "one mana consumed")
    check.assert_equal(1, result.state.elapsed_actions, "one action elapsed")
    check.assert_equal(1, result.state.revision, "revision advances once")
    check.assert_equal(original, state, "input snapshot is never mutated")
    var replay: Dictionary = engine.cast(result.state, command)
    check.assert_equal("REPLAY", replay.status, "duplicate returns receipt")
    check.assert_equal(result.receipt, replay.receipt, "same receipt on retry")
    check.assert_equal(result.state, replay.state, "retry does not charge or advance")
    var collision := command.duplicate(true)
    collision.glyphs = ["WIND"]
    check.assert_equal("COMMAND_ID_CONFLICT", engine.cast(result.state, collision).reason, "reused id cannot change intent")
    var stale := _command("two", ["EMBER"])
    check.assert_equal("STALE_REVISION", engine.cast(result.state, stale).reason, "old preview cannot commit")
    var low := state.duplicate(true)
    low.mana = 0
    check.assert_equal("INSUFFICIENT_MANA", engine.cast(low, command).reason, "no negative mana")
    check.assert_equal(0, low.mana, "rejection cannot mutate")
    var rows := [
        [["EMBER", "WIND"], {"airflow_movable": true}, "temperature", "warm", ""],
        [["EMBER", "GATHER"], {"small": true}, "temperature", "hot", ""],
        [["WIND"], {"light": true}, "location_id", "B", "B"],
        [["WARD", "WIND"], {"redirectable_flow": true}, "redirected_to", "B", "B"],
        [["GATHER"], {"gatherable": true}, "empty", true, "B"],
        [["GATHER", "WIND"], {"airborne_light": true}, "empty", true, "B"],
    ]
    for row in rows:
        var sample := _state()
        sample.objects.A.merge(row[1], true)
        var cmd := _command("row", row[0])
        cmd.destination_id = row[4]
        var casted: Dictionary = engine.cast(sample, cmd)
        check.assert_equal("CAST", casted.status, "supported event effect")
        check.assert_equal(row[3], casted.state.objects.A[row[2]], "effect changes intended property")
        check.assert_equal(6 - row[0].size(), casted.state.mana, "recipe cost")
        if row[2] == "empty":
            check.assert_equal(1, casted.state.objects.B.capture_load, "collection consumes one capacity unit")
    for row in [[["WARD"], "blocked", {"blockable_boundary": true}],
            [["EMBER", "WARD"], "heat_retained", {"boundary": true, "temperature": "warm"}],
            [["GATHER", "WARD"], "leak_suppressed", {"small_leak": true, "boundary_intact": true}]]:
        var sample := _state()
        sample.objects.A.merge(row[2], true)
        var casted: Dictionary = engine.cast(sample, _command("temporary", row[0]))
        check.assert_equal(2, casted.state.objects.A.effects[row[1]], "expires after creation and next action")
        check.assert_equal(1, casted.state.elapsed_actions, "duration does not add extra time")
    var empty := _state()
    empty.objects.A.merge({"empty": true, "airborne_light": true}, true)
    var collect := _command("empty", ["GATHER", "WIND"])
    collect.destination_id = "B"
    var unchanged: Dictionary = engine.cast(empty, collect)
    check.assert_equal(0, unchanged.state.objects.B.capture_load, "no phantom material from empty source")
    check.assert_equal(4, unchanged.state.mana, "valid unchanged cast still costs mana")
    check.assert_equal("VALID_NO_CHANGE", unchanged.receipt.assessment.status, "no change preserved in receipt")
    var fragile := _state()
    fragile.objects.A.heat_sensitive = true
    var damaged: Dictionary = engine.cast(fragile, command)
    check.assert_true(damaged.state.objects.A.damaged, "valid unsafe heating retains consequence")
    check.assert_true("DAMAGE_RISK" in damaged.receipt.assessment.warnings, "damage warning accompanies result")
    var malformed := _state()
    malformed.objects.A.temperature = "unknown"
    check.assert_equal("INVALID_TEMPERATURE", engine.cast(malformed, command).reason, "malformed effect input cannot consume mana")
    for bad in ["6", -1, true]:
        var invalid := _state()
        invalid.mana = bad
        check.assert_equal("INVALID_STATE", engine.cast(invalid, command).reason, "state types fail closed")
    var ward_state := _state()
    ward_state.objects.A.blockable_boundary = true
    var warded: Dictionary = engine.cast(ward_state, _command("ward", ["WARD"]))
    check.assert_true(engine.effect_active(warded.state, "A", "blocked"), "ward covers next paid action")
    var next_command := _command("heat-after-ward", ["EMBER"])
    next_command.expected_revision = 1
    var later: Dictionary = engine.cast(warded.state, next_command)
    check.assert_false(engine.effect_active(later.state, "A", "blocked"), "ward expires after second paid action")
    var retry_old: Dictionary = engine.cast(later.state, _command("ward", ["WARD"]))
    check.assert_equal(later.state, retry_old.state, "retry earlier receipt does not roll back later action")
    var refresh := _command("refresh", ["WARD"])
    refresh.expected_revision = 1
    var refreshed: Dictionary = engine.cast(warded.state, refresh)
    check.assert_equal(3, refreshed.state.objects.A.effects.blocked, "refresh uses current action plus two, no stacking")
    var ordered := _state()
    ordered.objects.A.airflow_movable = true
    var pair := _command("pair", ["WIND", "EMBER"])
    var combined: Dictionary = engine.cast(ordered, pair)
    pair.glyphs.reverse()
    check.assert_equal("REPLAY", engine.cast(combined.state, pair).status, "glyph order does not change intent")
    combined.receipt.assessment.warnings.append("EXTERNAL_MUTATION")
    check.assert_false("EXTERNAL_MUTATION" in combined.state.receipts.pair.assessment.warnings, "receipt is detached from ledger")
    var obstructed := _state()
    obstructed.objects.A.light = true
    obstructed.objects.A.routes.B = false
    var move := _command("move", ["WIND"])
    move.destination_id = "B"
    check.assert_equal("ROUTE_UNAVAILABLE", engine.cast(obstructed, move).reason, "cast reassesses actual route")
    check.assert_equal(6, obstructed.mana, "blocked route cannot charge")
    var full := _state()
    full.objects.A.airborne_light = true
    full.objects.B.capture_load = 3
    check.assert_equal("RECEIVER_UNAVAILABLE", engine.cast(full, collect).reason, "full receiver rejects atomically")
    check.assert_false(full.objects.A.has("empty"), "full receiver does not remove source")
    for key in ["id", "glyphs", "expected_revision", "target_id", "destination_id"]:
        var broken := command.duplicate(true)
        broken.erase(key)
        check.assert_equal("INVALID_COMMAND", engine.cast(state, broken).reason, "missing command field rejects safely")
    var invalid_effects := _state()
    invalid_effects.objects.A.effects = "blocked"
    check.assert_equal("INVALID_STATE", engine.cast(invalid_effects, command).reason, "malformed duration map rejects safely")
    var closed := _state()
    closed.objects.A.merge({"closed": true, "blockable_boundary": true}, true)
    var unnecessary: Dictionary = engine.cast(closed, _command("closed", ["WARD"]))
    check.assert_equal(5, unnecessary.state.mana, "unnecessary valid ward still costs")
    check.assert_false(unnecessary.state.objects.A.has("effects"), "closed boundary needs no new ward")
    var hot := _state()
    hot.objects.A.temperature = "hot"
    check.assert_equal("overheated", engine.cast(hot, command).state.objects.A.temperature, "reheating preserves overheat consequence")
    hot.objects.A.temperature = "overheated"
    var saturated: Dictionary = engine.cast(hot, command)
    check.assert_equal("VALID_NO_CHANGE", saturated.receipt.assessment.status, "saturated heating cannot claim a state change")
    check.assert_equal(5, saturated.state.mana, "saturated but valid heating still costs")
    print(JSON.stringify({"assertions": check.assertion_count(), "failures": check.failure_count(), "messages": check.failures()}))
    quit(0 if check.failure_count() == 0 else 1)

func _state() -> Dictionary:
    return {"schema": "GRIMOIRE_EVENT_CAST_1", "attempt_id": "lesson-attempt", "revision": 0,
        "mana": 6, "elapsed_actions": 0, "receipts": {}, "learned": ["EMBER", "WIND", "WARD", "GATHER"],
        "objects": {"A": {"id": "A", "heatable": true, "temperature": "cold", "zone": "bench", "routes": {"B": true}},
        "B": {"id": "B", "zone": "bench", "capture_ready": true, "blocked": false, "audience": false,
            "capture_load": 0, "capture_capacity": 3, "receiver_open": false}}}

func _command(id: String, glyphs: Array) -> Dictionary:
    return {"id": id, "expected_revision": 0, "glyphs": glyphs, "target_id": "A", "destination_id": ""}

extends SceneTree

var check = preload("res://tests/test_case.gd").new()
var engine

func _init() -> void:
    var path := "res://src/core/shared_spell/event_session.gd"
    check.assert_true(FileAccess.file_exists(path), "events must resolve goals and time after common spell effects")
    if not FileAccess.file_exists(path):
        _finish()
        return
    engine = load(path).new()
    _greenhouse()
    _lesson_and_festival()
    _commands()
    _finish()

func _greenhouse() -> void:
    var initial: Dictionary = engine.start("GREENHOUSE_LEAK_01", "test")
    var copy := initial.duplicate(true)
    var closed: Dictionary = engine.act(initial, _cmd(initial, "CLOSE_LEAK"))
    check.assert_equal("APPLIED", closed.status, "manual close applied")
    check.assert_equal(2, closed.state.hazard, "closing stops same-action leak")
    check.assert_equal("ONGOING", closed.state.outcome, "source closed is not cloud removed")
    var done: Dictionary = _cast(closed.state, ["GATHER", "WIND"], "cloud", "receiver")
    check.assert_equal("SOLVED", done.state.outcome, "closed source plus clear cloud solves")
    check.assert_equal(0, done.state.hazard, "collection removes two hazard")
    check.assert_equal(4, done.state.spell_state.mana, "manual action costs no mana")
    check.assert_equal(2, done.state.spell_state.elapsed_actions, "two paid actions")
    check.assert_equal(copy, initial, "event reducer never changes input")
    var early: Dictionary = _cast(initial, ["GATHER", "WIND"], "cloud", "receiver")
    check.assert_equal(1, early.state.hazard, "collection minus two then leak plus one")
    check.assert_false(early.state.spell_state.objects.cloud.empty, "open source replenishes cloud")
    check.assert_equal(1, early.state.spell_state.objects.receiver.capture_load, "reappearance does not undo collection")
    check.assert_equal("ONGOING", early.state.outcome, "hazard decrease alone is not solved")
    for glyphs in [["WARD"], ["GATHER", "WARD"]]:
        var ward: Dictionary = _cast(initial, glyphs, "leak")
        check.assert_equal(2, ward.state.hazard, "ward protects creation action")
        var wait_one: Dictionary = engine.act(ward.state, _cmd(ward.state, "WAIT"))
        check.assert_equal(2, wait_one.state.hazard, "ward protects next action")
        var wait_two: Dictionary = engine.act(wait_one.state, _cmd(wait_one.state, "WAIT"))
        check.assert_equal(3, wait_two.state.hazard, "third action leaks after expiry")
        check.assert_false(wait_two.state.spell_state.objects.leak.closed, "ward never closes physical source")
    var no_mana := initial.duplicate(true)
    no_mana.spell_state.mana = 0
    var manual: Dictionary = engine.act(no_mana, _cmd(no_mana, "CLOSE_LEAK"))
    manual = engine.act(manual.state, _cmd(manual.state, "CLEAN"))
    check.assert_equal("ONGOING", manual.state.outcome, "first cleanup is not instant solve")
    check.assert_equal(1, manual.state.hazard, "first cleanup reduces one")
    manual = engine.act(manual.state, _cmd(manual.state, "CLEAN"))
    check.assert_equal("SOLVED", manual.state.outcome, "zero-mana manual route solves")
    check.assert_equal(0, manual.state.hazard, "second cleanup reaches zero")
    var unsafe: Dictionary = _cast(initial, ["EMBER"], "leak")
    check.assert_equal(5, unsafe.state.hazard, "heat consequence two plus leak time one")
    check.assert_equal("ONGOING", unsafe.state.outcome, "five is not six")
    unsafe = engine.act(unsafe.state, _cmd(unsafe.state, "WAIT"))
    check.assert_equal("ASSISTED", unsafe.state.outcome, "six invokes professor")
    check.assert_true("AREA_CLOSED" in unsafe.state.consequences, "closure recorded")
    var simultaneous := initial.duplicate(true)
    simultaneous.spell_state.objects.leak.closed = true
    simultaneous.spell_state.objects.cloud.empty = true
    simultaneous.hazard = 4
    var both: Dictionary = _cast(simultaneous, ["EMBER"], "leak")
    check.assert_equal("SOLVED", both.state.outcome, "success survives simultaneous consequence")
    check.assert_true("AREA_CLOSED" in both.state.consequences, "simultaneous danger still applies")

func _lesson_and_festival() -> void:
    var lesson: Dictionary = engine.start("LESSON_HEAT_01", "lesson")
    var focus: Dictionary = _cast(lesson, ["EMBER", "GATHER"], "vessel")
    check.assert_equal("ONGOING", focus.state.outcome, "too hot does not meet warm goal")
    var cooled: Dictionary = engine.act(focus.state, _cmd(focus.state, "COOL"))
    check.assert_equal("SOLVED", cooled.state.outcome, "manual cooling recovers overshoot")
    var damage: Dictionary = _cast(lesson, ["EMBER"], "sample")
    var solved: Dictionary = _cast(damage.state, ["EMBER"], "vessel")
    check.assert_equal("SOLVED", solved.state.outcome, "sample damage does not erase vessel success")
    check.assert_true("SAMPLE_DAMAGED" in solved.state.consequences, "sample damage persists")
    var festival: Dictionary = engine.start("FESTIVAL_LIGHTS_01", "festival")
    var light: Dictionary = _cast(festival, ["EMBER"], "lamp")
    var placed: Dictionary = _cast(light.state, ["WIND"], "decorations", "stage")
    check.assert_equal("ONGOING", placed.state.outcome, "placement without latch incomplete")
    var locked: Dictionary = engine.act(placed.state, _cmd(placed.state, "LOCK"))
    check.assert_equal("SOLVED", locked.state.outcome, "festival warm placed and latched")
    check.assert_equal(4, locked.state.spell_state.mana, "festival solo route costs two")
    check.assert_equal(3, locked.state.spell_state.elapsed_actions, "festival solo route takes three actions")
    var audience: Dictionary = _cast(festival, ["WIND"], "decorations", "audience")
    check.assert_equal("ASSISTED", audience.state.outcome, "audience risk invokes help")
    check.assert_true("AUDIENCE_UNSAFE" in audience.state.consequences, "audience consequence explicit")
    var paper: Dictionary = _cast(festival, ["EMBER"], "decorations")
    check.assert_equal("ASSISTED", paper.state.outcome, "heating paper invokes help")

func _commands() -> void:
    var state: Dictionary = engine.start("GREENHOUSE_LEAK_01", "commands")
    var command := _cmd(state, "CLOSE_LEAK")
    var preview: Dictionary = engine.preview(state, command)
    check.assert_equal(0, state.spell_state.elapsed_actions, "preview is free")
    var actual: Dictionary = engine.act(state, command)
    check.assert_equal(preview.state, actual.state, "preview matches exact full action including clocks")
    var replay: Dictionary = engine.act(actual.state, command)
    check.assert_equal("REPLAY", replay.status, "whole event action idempotent")
    check.assert_equal(actual.state, replay.state, "replay does not retick clock")
    var changed := command.duplicate(true)
    changed.kind = "WAIT"
    check.assert_equal("COMMAND_ID_CONFLICT", engine.act(actual.state, changed).reason, "manual kind is part of intent")
    changed.id = "stale"
    check.assert_equal("STALE_REVISION", engine.act(actual.state, changed).reason, "stale manual command rejects")
    check.assert_equal("LEAK_STILL_OPEN", engine.act(state, _cmd(state, "CLEAN")).reason, "cleanup requires closed source")
    for kind in ["HELP", "STOP"]:
        var exit_result: Dictionary = engine.act(state, _cmd(state, kind))
        check.assert_equal("ASSISTED" if kind == "HELP" else "STOPPED", exit_result.state.outcome, "safe exit outcome")
        check.assert_equal(0, exit_result.state.spell_state.elapsed_actions, "exit does not punish with tick")
        check.assert_equal(6, exit_result.state.spell_state.mana, "exit does not charge")
        check.assert_equal("EVENT_FINISHED", engine.act(exit_result.state, _cmd(exit_result.state, "WAIT")).reason, "terminal event cannot continue consuming")
    check.assert_equal({}, engine.start("UNKNOWN", "bad"), "unknown event does not silently substitute")
    var invalid := state.duplicate(true)
    invalid.spell_state.objects.receiver.capture_load = -1
    check.assert_false(engine.valid_state(invalid), "negative capacity load must not survive save validation")
    invalid = state.duplicate(true)
    invalid.receipts.bad = {"identity": {}}
    check.assert_false(engine.valid_state(invalid), "incomplete receipt cannot masquerade as replay")

func _cmd(state: Dictionary, kind: String) -> Dictionary:
    var revision: int = state.spell_state.revision
    return {"id": "action-" + str(revision), "expected_revision": revision, "kind": kind}

func _cast(state: Dictionary, glyphs: Array, target: String, destination: String = "") -> Dictionary:
    var command := _cmd(state, "CAST")
    command.merge({"glyphs": glyphs, "target_id": target, "destination_id": destination})
    return engine.act(state, command)

func _finish() -> void:
    print(JSON.stringify({"assertions": check.assertion_count(), "failures": check.failure_count(), "messages": check.failures()}))
    quit(0 if check.failure_count() == 0 else 1)

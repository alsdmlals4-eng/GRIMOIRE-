extends SceneTree

func _initialize() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var path := "res://src/core/shared_spell/story_codex.gd"
    c.assert_true(FileAccess.file_exists(path),"story codex derives actual use records")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count()}))
        quit(1)
        return
    var codex = load(path).new()
    var flow = preload("res://src/core/shared_spell/story_flow.gd").new()
    var events = preload("res://src/core/shared_spell/event_session.gd").new()
    var s: Dictionary = flow.create()
    c.assert_equal(0,codex.build(s).glyphs.filter(func(row): return row.learned).size(),"prelesson glyphs locked")
    s = flow.advance(flow.advance(s,0).state,1).state
    c.assert_equal(4,codex.build(s).glyphs.filter(func(row): return row.learned).size(),"lesson learned glyphs visible")
    c.assert_equal(0,codex.build(s).spells.size(),"learning does not falsely discover recipes")
    var command := {"id":"codex-cast","kind":"CAST","expected_revision":0,"glyphs":["EMBER","WIND"],"target_id":"vessel","destination_id":""}
    events.preview(s.activity,command)
    c.assert_equal(0,codex.build(s).spells.size(),"preview does not discover spell")
    var result: Dictionary = events.act(s.activity,command)
    c.assert_equal("APPLIED",result.status,"real cast fixture")
    s = flow.checkpoint(s,result.state).state
    var model: Dictionary = codex.build(s)
    c.assert_equal("EMBER+WIND",model.spells[0].id,"actual combination discovered")
    c.assert_equal("내열 용기",model.spells[0].uses[0].target,"actual target not generic best route")
    c.assert_equal("LESSON_HEAT_01",model.spells[0].uses[0].context_id,"lesson context retained")
    var malformed: Dictionary = s.duplicate(true)
    malformed.activity.receipts["codex-cast"].assessment.spell_id = "GATHER+WARD"
    c.assert_equal(0,codex.build(malformed).spells.size(),"mismatched assessment cannot invent discovered spell")
    var before: Dictionary = s.duplicate(true)
    for i in range(100): codex.build(s)
    c.assert_equal(before,s,"reading never changes story time mana or records")
    s = flow.advance(s,2).state
    c.assert_equal(1,codex.build(s).spells.size(),"archived event still available")
    var duel = preload("res://src/core/shared_spell/duel_session.gd").new()
    var cast: Dictionary = duel.apply(s.activity,{"id":"duel-cast","revision":0,"ids":[0],"kind":"CAST"})
    c.assert_equal("APPLIED",cast.status,"duel actual cast fixture")
    s = flow.checkpoint(s,cast.state).state
    c.assert_equal(2,codex.build(s).spells.size(),"duel cast adds actual use")
    c.assert_equal(0,codex.build({"stage":8}).spells.size(),"invalid story cannot expose discoveries")
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

extends SceneTree

func _initialize() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var path := "res://src/core/shared_spell/story_flow.gd"
    c.assert_true(FileAccess.file_exists(path),"story coordinator exists")
    if not FileAccess.file_exists(path):
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count()}))
        quit(1)
        return
    var flow = load(path).new()
    var s: Dictionary = flow.create()
    c.assert_true(flow.valid(s),"fresh story valid")
    s = flow.advance(s,0).state
    c.assert_equal("REJECTED",flow.advance(s,0).status,"stale dialogue click rejected")
    s = flow.advance(s,1).state
    c.assert_equal("LESSON_HEAT_01",s.activity.event_id,"lesson before duel")
    c.assert_equal("REJECTED",flow.advance(s,2).status,"unfinished lesson blocks advance")
    var events = preload("res://src/core/shared_spell/event_session.gd").new()
    var result: Dictionary = events.act(s.activity,{"id":"a","expected_revision":0,"kind":"CAST","glyphs":["EMBER"],"target_id":"vessel","destination_id":""})
    s = flow.checkpoint(s,result.state).state
    s = flow.advance(s,2).state
    c.assert_equal(3,s.stage,"duel follows lesson")
    c.assert_equal("SOLVED",s.results["2"].outcome,"lesson result retained")
    var duel = preload("res://src/core/shared_spell/duel_session.gd").new()
    result = duel.apply(s.activity,{"id":"stop","revision":0,"kind":"STOP","ids":[]})
    s = flow.checkpoint(s,result.state).state
    s = flow.advance(s,3).state
    c.assert_equal("GREENHOUSE_LEAK_01",s.activity.event_id,"greenhouse follows duel")
    c.assert_equal("STOPPED",s.results["3"].outcome,"stopped practice is not victory")
    result = events.act(s.activity,{"id":"help","expected_revision":0,"kind":"HELP"})
    s = flow.checkpoint(s,result.state).state
    s = flow.advance(s,4).state
    c.assert_equal("ASSISTED",s.results["4"].outcome,"help fact preserved")
    c.assert_equal("REJECTED",flow.advance(s,5).status,"unfinished later content not skipped")
    c.assert_true(flow.valid(s),"review checkpoint valid")
    c.assert_true(flow.has_method("reflect"),"review records player's explanation")
    if not flow.has_method("reflect"):
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    c.assert_equal("REJECTED",flow.reflect(flow.create(),"CAUSE").status,"reflection unavailable before review")
    c.assert_equal("REJECTED",flow.reflect(s,"unknown").status,"unknown reflection rejected")
    s = flow.reflect(s,"RISK").state
    c.assert_equal("RISK",s.reflection,"explicit explanation recorded")
    var bad := s.duplicate(true)
    bad.results["4"] = bad.results["2"]
    c.assert_true(not flow.valid(bad),"wrong event in completed record rejected")
    bad = s.duplicate(true)
    bad.results.erase("3")
    c.assert_true(not flow.valid(bad),"missing prior stage rejected")
    var store = load("res://src/core/shared_spell/story_save.gd").new()
    var folder := ProjectSettings.globalize_path("res://artifacts/local-validation/story-flow-tests")
    c.assert_equal("SAVED",store.save_progress(folder,{"story":s}).status,"story saves")
    c.assert_equal(s,store.load_progress(folder).payload.story,"story roundtrip")
    c.assert_equal("REJECTED",store.save_progress(folder,{"story":bad}).status,"invalid progress cannot save")
    var continued: Dictionary = flow.advance(s,5)
    c.assert_equal("OK",continued.status,"chosen reflection continues to lab")
    if continued.status != "OK":
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
        quit(1)
        return
    s = continued.state
    c.assert_equal("LAB_SAMPLE_02",s.activity.event_id,"lab before festival")
    result = events.act(s.activity,{"id":"safe","expected_revision":0,"kind":"STOP_DEVICE"})
    s = flow.advance(flow.checkpoint(s,result.state).state,6).state
    c.assert_equal("FESTIVAL_LIGHTS_01",s.activity.event_id,"festival follows lab")
    result = events.act(s.activity,{"id":"help","expected_revision":0,"kind":"HELP"})
    s = flow.advance(flow.checkpoint(s,result.state).state,7).state
    c.assert_equal(8,s.stage,"final record reached")
    c.assert_true(flow.valid(s),"final record validates completed prefix")
    c.assert_equal("SAVED",store.save_progress(folder,{"story":s}).status,"final record saves")
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

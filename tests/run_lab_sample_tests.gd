extends SceneTree
var rules = preload("res://src/core/shared_spell/event_session.gd").new()

func act(s: Dictionary,kind: String) -> Dictionary:
    return rules.act(s,{"id":"lab-"+str(s.spell_state.revision),"expected_revision":s.spell_state.revision,"kind":kind})

func _initialize() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var s: Dictionary = rules.start("LAB_SAMPLE_02","test")
    c.assert_true(not s.is_empty(),"lab task has executable definition")
    if s.is_empty():
        print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count()}))
        quit(1)
        return
    var result := act(s,"STOP_DEVICE")
    c.assert_equal("SOLVED",result.state.outcome,"immediate stop secures safety")
    c.assert_equal("device",result.state.spell_state.objects.sample.location_id,"immediate stop not specimen preservation")
    c.assert_equal(2,result.state.hazard,"stop adds no time hazard")
    result = rules.act(s,{"id":"ward","expected_revision":0,"kind":"CAST","glyphs":["WARD"],"target_id":"device","destination_id":""})
    c.assert_equal(2,result.state.hazard,"ward protects its casting action")
    result = act(result.state,"MOVE_SAMPLE")
    c.assert_equal(2,result.state.hazard,"ward protects transfer action")
    c.assert_equal("safe",result.state.spell_state.objects.sample.location_id,"specimen preserved")
    result = act(result.state,"STOP_DEVICE")
    c.assert_equal("SOLVED",result.state.outcome,"preserved specimen safety branch")
    c.assert_equal(1,result.state.spell_state.mana,"only ward spends mana")
    s.hazard = 5
    s.spell_state.mana = 0
    result = act(s,"MOVE_SAMPLE")
    c.assert_equal("ASSISTED",result.state.outcome,"risky transfer triggers intervention")
    c.assert_equal(6,result.state.hazard,"hazard capped")
    c.assert_equal("safe",result.state.spell_state.objects.sample.location_id,"intervention does not erase achieved transfer")
    c.assert_true(result.state.spell_state.objects.device.closed,"intervention shuts device")
    var replay: Dictionary = rules.act(result.state,result.receipt.identity)
    c.assert_equal("REPLAY",replay.status,"duplicate transfer is replay")
    c.assert_equal(result.state,replay.state,"duplicate no time or state changes")
    c.assert_equal("SOLVED",act(s,"STOP_DEVICE").state.outcome,"high risk immediate stop remains possible")
    c.assert_true(act(s,"HELP").state.spell_state.objects.device.closed,"help stops device")
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

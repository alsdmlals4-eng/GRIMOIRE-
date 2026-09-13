extends SceneTree

func _init() -> void:
    var c = preload("res://tests/test_case.gd").new()
    var dialogue = preload("res://src/ui/story/story_dialogue.gd").new()
    c.assert_true(dialogue.has_method("lines"), "dialogue needs presentation resources independent of names")
    if dialogue.has_method("lines"):
        var ids := {}
        for stage in [0,1,5,8]:
            var state := {"stage":stage,"results":{"7":{"outcome":"SOLVED"}}}
            var before := state.duplicate(true)
            var lines: Array = dialogue.lines(state)
            var legacy: Array = dialogue.turns(state)
            for i in range(lines.size()):
                var line = lines[i]
                c.assert_true(line is Resource, "line is an editor-native resource")
                c.assert_true(not ids.has(line.line_id), "line identity is globally unique")
                ids[line.line_id] = true
                c.assert_true(line.speaker_id in ["PLAYER","PEER","TUTOR","NARRATOR"], "speaker is stable ID")
                c.assert_equal(legacy[i].text, dialogue.text(line.text_key, state), "text has one owner")
                c.assert_equal(legacy[i].speaker, dialogue.speaker_name(line.speaker_id), "compatibility display is unchanged")
            c.assert_equal(before,state,"reading resources never mutates story")
        var cause: Array = dialogue.lines({"stage":5,"reflection":"CAUSE"})
        var risk: Array = dialogue.lines({"stage":5,"reflection":"RISK"})
        c.assert_true(cause[0].line_id != risk[0].line_id, "different reflection answers have distinct identity")
        c.assert_equal("",dialogue.speaker_name("UNKNOWN"),"unknown actor cannot impersonate a character")
        var first: Array = dialogue.lines({"stage":0})
        first[0].actor_slots["RIGHT"] = "UNKNOWN"
        c.assert_equal("PEER",dialogue.lines({"stage":0})[0].actor_slots.RIGHT,"presentation metadata cannot contaminate later reads")
        c.assert_equal("",dialogue.text("UNKNOWN",{"stage":0}),"unknown text key is not another line")
    print(JSON.stringify({"assertions":c.assertion_count(),"failures":c.failure_count(),"messages":c.failures()}))
    quit(1 if c.failure_count() else 0)

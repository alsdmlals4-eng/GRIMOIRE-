extends RefCounted
## Fixed first-chapter adapter; no numeric rewards or legacy migration.
const Events = preload("res://src/core/shared_spell/event_session.gd")
const Duel = preload("res://src/core/shared_spell/duel_session.gd")
const EVENT_IDS := {2:"LESSON_HEAT_01",4:"GREENHOUSE_LEAK_01",6:"LAB_SAMPLE_02",7:"FESTIVAL_LIGHTS_01"}
const ACTIVITIES := [2,3,4,6,7]

func create() -> Dictionary:
    return {"schema":"GRIMOIRE_STORY_BRIDGE_1","stage":0,"activity":{},"results":{}}

func valid(s: Dictionary) -> bool:
    if s.get("schema") != "GRIMOIRE_STORY_BRIDGE_1" or not s.get("stage") is int or s.stage < 0 or s.stage > 8:
        return false
    if not s.get("activity") is Dictionary or not s.get("results") is Dictionary:
        return false
    if s.get("reflection","") not in ["","CAUSE","RISK"] or (s.stage < 5 and s.get("reflection","") != ""): return false
    if s.stage > 5 and s.get("reflection","") == "": return false
    var required: Array = []
    for stage in ACTIVITIES:
        if stage < s.stage:
            required.append(str(stage))
            if not s.results.get(str(stage)) is Dictionary or not _valid_activity(stage,s.results[str(stage)]): return false
            if s.results[str(stage)].outcome == "ONGOING": return false
    if s.results.size() != required.size(): return false
    if s.stage in ACTIVITIES: return _valid_activity(s.stage,s.activity)
    return s.activity.is_empty()

func checkpoint(s: Dictionary, activity: Dictionary) -> Dictionary:
    if not valid(s) or s.stage not in ACTIVITIES or not _valid_activity(s.stage,activity): return _reject()
    if s.activity.outcome != "ONGOING" and s.activity != activity: return _reject()
    if s.stage == 3:
        if activity.seed != s.activity.seed or activity.tutorial != s.activity.tutorial or activity.revision < s.activity.revision: return _reject()
        if activity.commands.slice(0,s.activity.commands.size()) != s.activity.commands: return _reject()
    else:
        if activity.spell_state.attempt_id != s.activity.spell_state.attempt_id or activity.spell_state.revision < s.activity.spell_state.revision: return _reject()
        for key in s.activity.receipts:
            if activity.receipts.get(key) != s.activity.receipts[key]: return _reject()
    var next := s.duplicate(true)
    next.activity = activity.duplicate(true)
    return {"status":"OK","state":next}

func advance(s: Dictionary, expected_stage: int) -> Dictionary:
    if not valid(s) or s.stage != expected_stage or s.stage == 8: return _reject()
    if s.stage == 5 and s.get("reflection","") == "": return _reject()
    if s.stage in ACTIVITIES and s.activity.outcome == "ONGOING": return _reject()
    var next := s.duplicate(true)
    if s.stage in ACTIVITIES: next.results[str(s.stage)] = s.activity.duplicate(true)
    next.stage += 1
    next.activity = {}
    if next.stage == 3: next.activity = Duel.new().create(17)
    elif next.stage in EVENT_IDS: next.activity = Events.new().start(EVENT_IDS[next.stage],"story-s"+str(next.stage))
    return {"status":"OK","state":next}

func _valid_activity(stage: int, activity: Dictionary) -> bool:
    if stage == 3: return Duel.new().restore(activity).status == "OK"
    return stage in EVENT_IDS and activity.get("event_id") == EVENT_IDS[stage] and Events.new().valid_state(activity)

func reflect(s: Dictionary, choice: String) -> Dictionary:
    if not valid(s) or s.stage != 5 or choice not in ["CAUSE","RISK"]: return _reject()
    var next := s.duplicate(true)
    next.reflection = choice
    return {"status":"OK","state":next}

func _reject() -> Dictionary:
    return {"status":"REJECTED","reason":"INVALID_STORY_TRANSITION"}

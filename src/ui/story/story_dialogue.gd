extends RefCounted
## Presentation only. Stable IDs are independent of translated display names.
const Line = preload("res://src/ui/story/dialogue_line.gd")
const SPEAKERS := {"PLAYER":"나","PEER":"동료 학생","TUTOR":"지도교수","NARRATOR":""}
const LINE_IDS := {
    "0":["GATE_GREETING","GATE_WORRY","GATE_INVITATION","GATE_AGREE"],
    "1":["LESSON_CONTEXT","LESSON_QUESTION","LESSON_GLYPHS","LESSON_PEER","LESSON_TARGET"],
    "5":["REVIEW_INVITATION","REVIEW_SURPRISE","REVIEW_RECORD","REVIEW_QUESTION"],
    "5_CAUSE":["REVIEW_CAUSE_ANSWER","REVIEW_CAUSE_REPLY","REVIEW_CAUSE_NEXT"],
    "5_RISK":["REVIEW_RISK_ANSWER","REVIEW_RISK_REPLY","REVIEW_RISK_NEXT"],
    "8":["CLOSING_OUTCOME","CLOSING_RECORD","CLOSING_FAREWELL"]}

static func speaker_name(identity: String) -> String:
    return SPEAKERS.get(identity, "")

static func _ids(story: Dictionary) -> Array:
    var key := str(int(story.stage))
    if int(story.stage) == 5 and story.get("reflection","") in ["CAUSE","RISK"]:
        key += "_" + story.reflection
    return LINE_IDS.get(key, [])

static func lines(story: Dictionary) -> Array:
    var result: Array = []
    var rows := _rows(story)
    var ids := _ids(story)
    var partner := ""
    for row in rows:
        if row.speaker_id in ["PEER","TUTOR"]:
            partner = row.speaker_id
            break
    for i in range(rows.size()):
        var line = Line.new()
        line.line_id = ids[i]
        line.text_key = ids[i]
        line.speaker_id = rows[i].speaker_id
        line.actor_slots = {"LEFT":"PLAYER"}
        if line.speaker_id in ["PEER","TUTOR"]: partner = line.speaker_id
        if partner != "": line.actor_slots["RIGHT"] = partner
        result.append(line)
    return result

static func text(key: String, story: Dictionary) -> String:
    var index := _ids(story).find(key)
    return _rows(story)[index].text if index >= 0 else ""

static func turns(story: Dictionary) -> Array:
    var result: Array = []
    var rows := _rows(story)
    var resources := lines(story)
    for i in range(rows.size()):
        result.append({"speaker":speaker_name(resources[i].speaker_id),
            "speaker_id":resources[i].speaker_id, "line_id":resources[i].line_id,
            "line":resources[i], "text":rows[i].text})
    return result

static func _rows(story: Dictionary) -> Array:
    match int(story.stage):
        0:
            return [
                {"speaker_id":"PEER","text":"너도 신입생이지? 아까부터 같은 안내장만 보고 있길래."},
                {"speaker_id":"PLAYER","text":"응. 글자를 이어서 주문을 만든다는데… 막상 교문 앞에 오니까 조금 떨려."},
                {"speaker_id":"PEER","text":"나도 그래. 같이 들어갈래? 첫 수업에서는 안전하게 연습할 수 있대."},
                {"speaker_id":"PLAYER","text":"좋아. 안내부터 천천히 읽고 가자."}]
        1:
            return [
                {"speaker_id":"TUTOR","text":"같은 글자라도 어디에 쓰느냐에 따라 해야 할 일이 달라집니다."},
                {"speaker_id":"PLAYER","text":"같은 주문이어도, 대상을 바꾸면 결과가 달라진다는 말씀이세요?"},
                {"speaker_id":"TUTOR","text":"맞아요. 불씨는 작은 열, 바람은 움직임. 막기는 경계를 세우고, 모으기는 흩어진 것을 한곳으로 모으지요."},
                {"speaker_id":"PEER","text":"그러면 용기만 데우고, 옆의 표본은 건드리지 않는 것도 가능하겠네요?"},
                {"speaker_id":"TUTOR","text":"그걸 살펴보는 게 오늘의 수업입니다. 먼저 대상을 확인하세요. 어렵다면 도움을 청해도 좋습니다."}]
        5:
            var choice: String = story.get("reflection","")
            if choice != "":
                var answer := "원인부터 생각했어요." if choice == "CAUSE" else "위험부터 줄이려 했어요."
                var reply := "원인을 짚으려 했군요. 다음에는 그 원인을 바꾸면서 무엇을 지킬지도 함께 살펴보세요." if choice == "CAUSE" else "위험을 줄이려 했군요. 다음에는 확보한 틈에 무엇을 보존할지도 생각해 보세요."
                return [{"speaker_id":"PLAYER","text":answer},{"speaker_id":"TUTOR","text":reply},{"speaker_id":"PEER","text":"후속 실습에는 시료가 있지? 이번에는 나도 옆에서 같이 살펴볼게."}]
            return [
                {"speaker_id":"TUTOR","text":"실습 기록을 함께 볼까요? 무엇이 바뀌었고, 무엇이 남았나요?"},
                {"speaker_id":"PLAYER","text":"생각했던 것과 실제 결과가 꼭 같지는 않았어요."},
                {"speaker_id":"TUTOR","text":"그래서 기록이 필요하지요. 잘된 일도, 도움을 받은 일도 그대로 읽어 봅시다."},
                {"speaker_id":"PEER","text":"네가 뭘 먼저 해결하려고 했는지도 궁금해."}]
        8:
            var ending: String = {"SOLVED":"축제 준비를 마쳤네. 바뀐 것과 지켜 둔 것을 기록해 두자.","ASSISTED":"담당자에게 맡긴 부분도 기록해 두자. 다음에는 같이 살펴보자.","STOPPED":"이번에는 준비를 멈췄구나. 남은 일을 기록해 두자."}[story.results["7"].outcome]
            return [{"speaker_id":"PEER","text":ending},{"speaker_id":"PLAYER","text":"응. 내가 해낸 일만 적으면, 다음에 같은 상황에서 또 망설일 것 같아."},{"speaker_id":"PEER","text":"그럼 오늘은 여기까지. 책은 잘 챙겨. 우리, 다음에도 같이 읽자."}]
    return []

extends RefCounted
## Read-only projection of validated story receipts. No discovery/reward writes.
const Flow = preload("res://src/core/shared_spell/story_flow.gd")
const Semantics = preload("res://src/core/shared_spell/spell_semantics.gd")
const MEANINGS := {
    "EMBER":"작은 지점에 열을 더하는 글자. 열에 약한 대상은 손상될 수 있습니다.",
    "WIND":"가벼운 것을 움직이는 글자. 이동할 길과 목적지가 필요합니다.",
    "WARD":"경계를 잠시 막는 글자. 장치를 영구히 닫는 일반 행동과 다릅니다.",
    "GATHER":"같은 구역의 흩어진 것을 모으는 글자. 받을 곳의 여유를 확인하세요."}

func build(story: Dictionary) -> Dictionary:
    var learned: Array = []
    var spells: Dictionary = {}
    if Flow.new().valid(story):
        for stage in Flow.ACTIVITIES:
            var activity: Dictionary = story.activity if stage == story.stage else story.results.get(str(stage),{})
            if activity.is_empty(): continue
            if stage == 3:
                for record in activity.receipts.values():
                    if not record.has("spell_id"): continue
                    _use(spells,record.spell_id,{"context_id":"FIRST_GUIDED_DUEL","context":"안내 결투","target":"상대와의 교환",
                        "fact":"명시 시전 · 마력 %d 사용" % record.cost})
            else:
                for glyph in activity.spell_state.learned:
                    if glyph in Semantics.GLYPHS and glyph not in learned: learned.append(glyph)
                for record in activity.receipts.values():
                    var assessment: Dictionary = record.assessment
                    if record.identity.kind != "CAST": continue
                    var quote: Dictionary = Semantics.new().compose(record.identity.glyphs,activity.spell_state.learned)
                    if quote.status != "OK" or assessment.get("spell_id") != quote.spell_id: continue
                    if not assessment.get("target_id") is String or assessment.target_id != record.identity.target_id: continue
                    if not activity.spell_state.objects.has(assessment.target_id): continue
                    var target: Dictionary = activity.spell_state.objects.get(assessment.target_id,{})
                    _use(spells,assessment.spell_id,{"context_id":activity.event_id,"context":activity.title,
                        "target":target.get("label",assessment.target_id),
                        "fact":"명시 시전 · 마력 %d 사용 · 위험 %d → %d / 6" % [record.mana_before-record.mana_after,record.hazard_before,record.hazard_after]})
    var glyphs: Array = []
    for id in Semantics.GLYPHS:
        glyphs.append({"id":id,"learned":id in learned,"name":Semantics.RECIPES[id][0],"meaning":MEANINGS[id]})
    return {"glyphs":glyphs,"spells":spells.values()}

func _use(spells: Dictionary, id: String, record: Dictionary) -> void:
    if not Semantics.RECIPES.has(id): return
    if not spells.has(id): spells[id] = {"id":id,"name":Semantics.RECIPES[id][0],"uses":[]}
    # Keep one latest representative use per context+target; no usage leaderboard.
    var uses: Array = spells[id].uses
    for i in range(uses.size()):
        if uses[i].context_id == record.context_id and uses[i].target == record.target:
            uses[i] = record.duplicate(true)
            return
    uses.append(record.duplicate(true))

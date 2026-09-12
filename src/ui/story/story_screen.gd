extends Control
## Functional S00-S05 story bridge, not final admission art or full chapter.
const Flow = preload("res://src/core/shared_spell/story_flow.gd")
const Store = preload("res://src/core/shared_spell/story_save.gd")
const EventScreen = preload("res://src/ui/event_session/event_session_screen.tscn")
const DuelScreen = preload("res://src/ui/shared_duel/shared_duel_screen.tscn")
const OUTCOMES := {"SOLVED":"독립 해결","ASSISTED":"도움 요청/개입","STOPPED":"중단","WIN":"승리","LOSS":"패배","DRAW":"무승부"}
var flow = Flow.new()
var story: Dictionary = {}
var save_folder := "res://artifacts/local-validation/story-progress"
var activity_view: Control
var story_copy: Label
var save_message := "이야기 연결 구현판 · S00~S05 · 후속 과제/최종 연출 미완료"

func _ready() -> void:
    story = flow.create()
    _render()

func advance_story(expected_stage: int) -> void:
    var result: Dictionary = flow.advance(story,expected_stage)
    if result.status != "OK": return
    story = result.state
    save_story()

    _render()

func _checkpoint(snapshot: Dictionary) -> void:
    var result: Dictionary = flow.checkpoint(story,snapshot)
    if result.status != "OK":
        save_message = "진행 기록 검증 실패 · 기존 저장은 보존했습니다."
        _notice()
        return
    story = result.state
    save_story()
    # Child's confirm callback may replace its notice after signal emission.
    _notice.call_deferred()

func save_story() -> void:
    var result: Dictionary = Store.new().save_progress(ProjectSettings.globalize_path(save_folder),{"story":story})
    save_message = "이야기 자동 저장 완료 · 장면과 실제 결과를 함께 보존했습니다." if result.status == "SAVED" else "저장 실패 · 현재 진행은 유지됩니다. 저장을 다시 시도하세요."
    _notice()

func load_story() -> void:
    var result: Dictionary = Store.new().load_progress(ProjectSettings.globalize_path(save_folder))
    if result.status != "LOADED":
        save_message = "정상 이야기 저장이 없습니다. 현재 진행을 유지합니다."
        _notice()
        return
    story = result.payload.story
    save_message = "이야기 이어하기 완료 · 현재 장면과 결과를 복원했습니다."
    _render()

func _notice() -> void:
    if not is_instance_valid(activity_view): return
    if activity_view.get_meta("duel",false): activity_view.notice.text = save_message
    else: activity_view.save_notice.text = save_message

func _render() -> void:
    for child in get_children():
        remove_child(child)
        child.queue_free()
    activity_view = null
    if story.stage in [2,3,4]:
        activity_view = DuelScreen.instantiate() if story.stage == 3 else EventScreen.instantiate()
        activity_view.set_meta("duel",story.stage == 3)
        activity_view.story_mode = true
        activity_view.session = story.activity.duplicate(true)
        if story.stage != 3:
            activity_view.story_index = 0 if story.stage == 2 else 1
            if not story.activity.receipts.is_empty(): activity_view.last_receipt = story.activity.receipts.values().back().duplicate(true)
        activity_view.story_checkpoint.connect(_checkpoint)
        activity_view.story_finished.connect(advance_story.bind(story.stage))
        activity_view.story_save_requested.connect(save_story)
        activity_view.story_load_requested.connect(load_story)
        add_child(activity_view)
        _notice()
        return
    var margin := MarginContainer.new()
    margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    for side in ["left","right","top","bottom"]: margin.add_theme_constant_override("margin_"+side,48)
    add_child(margin)
    var box := VBoxContainer.new()
    box.add_theme_constant_override("separation",24)
    margin.add_child(box)
    var title := Label.new()
    title.text = {0:"교문 앞 · 입학 안내",1:"입학식 · 같은 글자, 다른 쓰임",5:"첫 실습 뒤 · 기록을 함께 읽다"}[story.stage]
    title.add_theme_font_size_override("font_size",30)
    box.add_child(title)
    var scroll := ScrollContainer.new()
    scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
    scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
    box.add_child(scroll)
    story_copy = Label.new()
    story_copy.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    story_copy.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    story_copy.add_theme_font_size_override("font_size",24)
    story_copy.text = _copy()
    scroll.add_child(story_copy)
    var status := Label.new()
    status.text = save_message
    status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    box.add_child(status)
    if story.stage < 5:
        _button(box,"입학 안내 확인" if story.stage == 0 else "첫 수업으로",advance_story.bind(story.stage))
    else:
        _button(box,"원인부터 생각했어요",choose_reflection.bind("CAUSE"))
        _button(box,"위험부터 줄이려 했어요",choose_reflection.bind("RISK"))
    _button(box,"이야기 이어하기",load_story)

func choose_reflection(choice: String) -> void:
    var result: Dictionary = flow.reflect(story,choice)
    if result.status != "OK": return
    story = result.state
    save_story()
    _render()

func _copy() -> String:
    if story.stage == 0:
        return "나\n교문을 지나기 전에 안내를 읽었다. 이 학교에서는 글자를 배우고, 그 뜻을 연결해 주문을 만든다.\n\n안내\n먼저 안전한 수업, 동료와의 안내 결투, 온실 실습으로 이어집니다. 선택과 읽기는 시간을 소비하지 않습니다.\n\n현재는 기본 호칭 ‘나’를 사용합니다. 이름/설정 편집과 입학 장면의 최종 아트는 아직 연결되지 않았습니다."
    if story.stage == 1:
        return "지도교수\n“같은 글자라도 어디에 쓰느냐에 따라 해야 할 일이 달라집니다.”\n\n불씨는 작은 열, 바람은 움직임, 막기는 경계, 모으기는 한곳으로 모으는 작용입니다.\n\n“용기는 따뜻하게, 옆의 표본은 그대로. 먼저 무엇을 살펴보겠어요?”\n\n수업 뒤에는 동료와 연습합니다. 승리뿐 아니라 도움이나 중단도 사실대로 기록하고 다음 이야기로 이어집니다."
    var lesson: Dictionary = story.results["2"]
    var duel: Dictionary = story.results["3"]
    var greenhouse: Dictionary = story.results["4"]
    var sample: String = "손상" if lesson.spell_state.objects.sample.get("damaged",false) else "보존"
    var explanation: String = {"":"내 접근을 설명해 보세요. 아직 선택하지 않았습니다.","CAUSE":"내 설명: 원인부터 생각했다.","RISK":"내 설명: 위험부터 줄이려 했다."}[story.get("reflection","")]
    return "지도교수\n“결과를 먼저 읽어 봅시다. 무엇이 바뀌었고, 무엇이 남았나요?”\n\n수업: %s · 표본 %s\n연습 결투: %s · 내 결계 %d / 상대 결계 %d\n온실: %s · 남은 위험 %d / 6\n\n%s\n설명 선택은 실제 행동 기록이나 보상을 바꾸지 않습니다.\n\n동료 학생\n“다음엔 같이 살펴보자.”\n\n후속 시료 보존 과제와 축제 연결은 아직 미완료입니다. 첫 장 완료나 보상 지급으로 처리하지 않습니다." % [OUTCOMES[lesson.outcome],sample,OUTCOMES[duel.outcome],duel.player_barrier,duel.opponent_barrier,OUTCOMES[greenhouse.outcome],greenhouse.hazard,explanation]

func _button(parent: Node, caption: String, callback: Callable) -> void:
    var button := Button.new()
    button.text = caption
    button.custom_minimum_size.y = 52
    button.pressed.connect(callback)
    parent.add_child(button)

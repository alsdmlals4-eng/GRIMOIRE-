extends Control
signal main_requested
signal pause_requested
## Functional first-chapter story sequence; final presentation remains separate.
const Flow = preload("res://src/core/shared_spell/story_flow.gd")
const Store = preload("res://src/core/shared_spell/story_save.gd")
const Preferences = preload("res://src/core/shared_spell/story_preferences.gd")
const AcademyTheme = preload("res://src/ui/theme/grimoire_theme_factory.gd")
const EventScreen = preload("res://src/ui/event_session/event_session_screen.tscn")
const DuelScreen = preload("res://src/ui/shared_duel/shared_duel_screen.tscn")
const OUTCOMES := {"SOLVED":"독립 해결","ASSISTED":"도움 요청/개입","STOPPED":"중단","WIN":"승리","LOSS":"패배","DRAW":"무승부"}
var flow = Flow.new()
var story: Dictionary = {}
var save_folder := "res://artifacts/local-validation/story-progress"
var activity_view: Control
var story_copy: Label
var dialogue_notice: Label
var save_message := ""

func _ready() -> void:
    theme = AcademyTheme.create_theme()
    if story.is_empty(): story = flow.create()
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

func save_story() -> bool:
    var result: Dictionary = Store.new().save_progress(ProjectSettings.globalize_path(save_folder),{"story":story})
    save_message = "이야기 자동 저장 완료 · 장면과 실제 결과를 함께 보존했습니다." if result.status == "SAVED" else "저장 실패 · 현재 진행은 유지됩니다. 저장을 다시 시도하세요."
    _notice()

    return result.status == "SAVED"

func refresh_preferences() -> void:
    if not is_instance_valid(activity_view) and is_instance_valid(story_copy):
        story_copy.add_theme_font_size_override("font_size",Preferences.new().load_size(save_folder))

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
    if is_instance_valid(dialogue_notice): dialogue_notice.text = save_message
    if not is_instance_valid(activity_view): return
    if activity_view.get_meta("duel",false): activity_view.notice.text = save_message
    else: activity_view.save_notice.text = save_message

func _render() -> void:
    for child in get_children():
        remove_child(child)
        child.queue_free()
    activity_view = null
    dialogue_notice = null
    if story.stage in Flow.ACTIVITIES:
        activity_view = DuelScreen.instantiate() if story.stage == 3 else EventScreen.instantiate()
        activity_view.set_meta("duel",story.stage == 3)
        activity_view.story_mode = true
        activity_view.session = story.activity.duplicate(true)
        if story.stage != 3:
            activity_view.story_index = {2:0,4:1,6:3,7:2}[story.stage]
            if not story.activity.receipts.is_empty(): activity_view.last_receipt = story.activity.receipts.values().back().duplicate(true)
        activity_view.story_checkpoint.connect(_checkpoint)
        activity_view.story_finished.connect(advance_story.bind(story.stage))
        activity_view.story_save_requested.connect(save_story)
        activity_view.story_load_requested.connect(load_story)
        activity_view.story_menu_requested.connect(func(): pause_requested.emit())
        add_child(activity_view)
        _notice()
        return
    var page := PanelContainer.new()
    page.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    page.theme_type_variation = "AcademyPanel"
    add_child(page)
    var margin := MarginContainer.new()
    margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    for side in ["left","right","top","bottom"]: margin.add_theme_constant_override("margin_"+side,48)
    page.add_child(margin)
    var box := VBoxContainer.new()
    box.add_theme_constant_override("separation",24)
    margin.add_child(box)
    var title_row := HBoxContainer.new()
    box.add_child(title_row)
    var title := Label.new()
    title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    title.text = {0:"교문 앞 · 입학 안내",1:"입학식 · 같은 글자, 다른 쓰임",5:"첫 실습 뒤 · 기록을 함께 읽다",8:"축제 뒤 · 첫 학교생활 기록"}[story.stage]
    title.add_theme_font_size_override("font_size",30)
    title_row.add_child(title)
    if pause_requested.has_connections(): _button(title_row,"메뉴",func(): pause_requested.emit())
    var narration := Label.new()
    narration.name = "Narration"
    narration.text = {0:"교문 너머에서 종소리가 들린다. 나는 품에 안은 책을 고쳐 쥐었다.",1:"교수가 빈 용기와 작은 표본을 나란히 놓았다. 강의실이 조용해졌다.",5:"교수는 실습 기록을 펼치고, 내가 말을 꺼내기를 기다렸다.",8:"축제 준비를 마친 교정. 동료가 내 옆에 앉아 오늘의 기록을 들여다본다."}[story.stage]
    narration.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    narration.add_theme_font_size_override("font_size",24)
    narration.add_theme_color_override("font_color",AcademyTheme.TEXT_SECONDARY)
    box.add_child(narration)
    var dialogue_panel := PanelContainer.new()
    dialogue_panel.theme_type_variation = "AcademyPanel"
    dialogue_panel.size_flags_vertical = Control.SIZE_EXPAND_FILL
    box.add_child(dialogue_panel)
    var dialogue := VBoxContainer.new()
    dialogue.add_theme_constant_override("separation",16)
    dialogue_panel.add_child(dialogue)
    var speaker := Label.new()
    speaker.name = "Speaker"
    speaker.text = {0:"나",1:"지도교수",5:"지도교수",8:"동료 학생"}[story.stage]
    speaker.add_theme_font_size_override("font_size",24)
    speaker.add_theme_color_override("font_color",AcademyTheme.LINE_GOLD_ACTIVE)
    dialogue.add_child(speaker)
    var scroll := ScrollContainer.new()
    scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
    scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
    dialogue.add_child(scroll)
    story_copy = Label.new()
    story_copy.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    story_copy.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    story_copy.add_theme_font_size_override("font_size",Preferences.new().load_size(save_folder))
    story_copy.text = _copy()
    scroll.add_child(story_copy)
    dialogue_notice = Label.new()
    dialogue_notice.text = save_message
    dialogue_notice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    box.add_child(dialogue_notice)
    if story.stage < 5:
        _button(box,"입학 안내 확인" if story.stage == 0 else "첫 수업으로",advance_story.bind(story.stage))
    elif story.stage == 5:
        _button(box,"원인부터 생각했어요",choose_reflection.bind("CAUSE"))
        _button(box,"위험부터 줄이려 했어요",choose_reflection.bind("RISK"))
        if story.get("reflection","") != "": _button(box,"후속 실습으로",advance_story.bind(5))
    elif story.stage == 8 and main_requested.has_connections():
        _button(box,"메인으로",func(): main_requested.emit())
    if not pause_requested.has_connections(): _button(box,"이야기 이어하기",load_story)

func choose_reflection(choice: String) -> void:
    var result: Dictionary = flow.reflect(story,choice)
    if result.status != "OK": return
    story = result.state
    save_story()
    _render()

func _copy() -> String:
    if story.stage == 8:
        var lab: Dictionary = story.results["6"]
        var festival: Dictionary = story.results["7"]
        var sample_result := "시료 보존" if lab.spell_state.objects.sample.location_id == "safe" else "시료 처리 중단"
        var closing: String = {"SOLVED":"축제 준비를 마쳤네. 바뀐 것과 지켜 둔 것을 기록해 두자.","ASSISTED":"담당자에게 맡긴 부분도 기록해 두자. 다음에는 같이 살펴보자.","STOPPED":"이번에는 준비를 멈췄구나. 남은 일을 기록해 두자."}[festival.outcome]
        return "“%s”\n\n나는 오늘의 일을 책에 적었다.\n수업: %s\n안내 결투: %s\n온실: %s\n후속 실습: %s · %s\n축제 준비: %s\n\n책장을 덮어도, 오늘의 기록은 남는다." % [closing,OUTCOMES[story.results["2"].outcome],OUTCOMES[story.results["3"].outcome],OUTCOMES[story.results["4"].outcome],OUTCOMES[lab.outcome],sample_result,OUTCOMES[festival.outcome]]
    if story.stage == 0:
        return "글자를 배우고, 그 뜻을 이어 주문을 만드는 학교.\n내가 정말 이곳의 학생이 되는 걸까.\n\n입학 안내를 펼쳤다. 첫 수업과 동료와의 연습, 그리고 온실 실습이 기다리고 있었다.\n\n서두를 필요는 없다. 안내를 읽고 선택을 고민하는 동안에는 시간이 흐르지 않는다."
    if story.stage == 1:
        return "“같은 글자라도 어디에 쓰느냐에 따라 해야 할 일이 달라집니다.”\n\n“불씨는 작은 열, 바람은 움직임. 막기는 경계를 세우고, 모으기는 흩어진 것을 한곳으로 모으지요.”\n\n“용기는 따뜻하게, 옆의 표본은 그대로. 먼저 무엇을 살펴보겠어요?”\n\n“혼자 어렵다면 도움을 청해도 됩니다. 멈춰야 할 때를 아는 것도 배움이니까요.”"
    var lesson: Dictionary = story.results["2"]
    var duel: Dictionary = story.results["3"]
    var greenhouse: Dictionary = story.results["4"]
    var sample: String = "손상" if lesson.spell_state.objects.sample.get("damaged",false) else "보존"
    var explanation: String = {"":"나는 잠시 생각했다. 무엇을 먼저 해결하려고 했던 걸까?","CAUSE":"내 설명: 원인부터 생각했다.","RISK":"내 설명: 위험부터 줄이려 했다."}[story.get("reflection","")]
    return "“무엇이 바뀌었고, 무엇이 남았나요? 결과를 함께 읽어 봅시다.”\n\n펼쳐진 실습 기록\n수업: %s · 표본 %s\n연습 결투: %s · 내 결계 %d / 상대 결계 %d\n온실: %s · 남은 위험 %d / 6\n\n%s\n\n“이미 일어난 일을 바꾸려는 질문은 아니에요. 다음에 무엇을 살필지 생각해 보자는 거지요.”\n\n후속 실습에는 지켜야 할 시료가 있다. 먼저 안전을 확보할지, 시간을 벌어 시료를 보존할지 고민해 보기로 했다." % [OUTCOMES[lesson.outcome],sample,OUTCOMES[duel.outcome],duel.player_barrier,duel.opponent_barrier,OUTCOMES[greenhouse.outcome],greenhouse.hazard,explanation]

func _button(parent: Node, caption: String, callback: Callable) -> void:
    var button := Button.new()
    button.text = caption
    button.custom_minimum_size.y = 52
    button.add_theme_font_size_override("font_size",24)
    button.pressed.connect(callback)
    parent.add_child(button)

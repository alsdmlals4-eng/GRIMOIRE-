extends Control
signal story_checkpoint(snapshot: Dictionary)
signal story_finished
signal story_save_requested
signal story_load_requested
var story_mode := false
## Playable event implementation preview. Not final art or the full story root.

const SessionRules = preload("res://src/core/shared_spell/event_session.gd")
const Definitions = preload("res://src/core/shared_spell/event_definitions.gd")
const SaveStore = preload("res://src/core/shared_spell/event_save.gd")
const GLYPH_NAMES := {"EMBER": "불씨", "WIND": "바람", "WARD": "막기", "GATHER": "모으기"}
const OUTCOMES := {"ONGOING": "진행 중", "SOLVED": "독립 해결", "ASSISTED": "도움으로 마무리", "STOPPED": "안전하게 중단"}
const MANUAL := {"COOL": "안전하게 식히기", "CLOSE_LEAK": "덮개 닫기", "CLEAN": "수동 청소",
    "LOCK": "작업 구역 잠금", "PLACE": "장식 수동 배치", "WAIT": "한 행동 기다리기", "HELP": "도움 요청", "STOP": "안전 중단", "STOP_DEVICE":"장치 즉시 정지", "MOVE_SAMPLE":"시료 안전 용기로 옮기기"}
const CAUSES := {"CLOUD_COLLECTED": "꽃가루 수집", "LEAK_TIME": "열린 장치에서 재누출", "HEAT_DAMAGE": "가열에 의한 손상",
    "MANUAL_CLEANUP": "수동 청소", "ALREADY_CLOSED": "이미 닫힌 덮개", "UNPROTECTED_TRANSFER":"보호 없는 시료 이동", "LAB_LEAK_TIME":"가동 장치의 누출 시간"}
const CONSEQUENCES := {"SAMPLE_DAMAGED": "표본 손상 기록", "DEVICE_DAMAGED": "장치 손상 기록", "AREA_CLOSED": "온실 구역 잠정 폐쇄", "AUDIENCE_UNSAFE": "관객 안전 문제로 담당자 개입", "SAMPLE_PROCESS_INTERRUPTED":"교체 가능한 시료의 처리를 중단했습니다.", "LAB_INTERVENTION":"교수가 장치를 정지했습니다. 이미 보존한 시료는 유지됩니다."}
const REASONS := {"UNKNOWN_TARGET": "대상을 선택하세요.", "UNKNOWN_DESTINATION": "목적지를 선택하세요.",
    "INVALID_COUNT": "글자를 한 장 또는 두 장 선택하세요.", "INSUFFICIENT_MANA": "마력이 부족합니다. 일반 행동이나 도움을 이용하세요.",
    "LEAK_STILL_OPEN": "누출 덮개를 닫아야 수동 청소할 수 있습니다.", "NOT_TOO_HOT": "지금은 식힐 필요가 없습니다.",
    "NO_HEAT_TO_RETAIN": "가둘 온기가 없는 대상입니다.", "UNEXPECTED_DESTINATION": "이 주문은 목적지가 필요 없습니다.",
    "RECEIVER_UNAVAILABLE": "수집함에 여유가 없습니다.", "STALE_REVISION": "상태가 바뀌었습니다. 다시 선택하세요.",
    "EVENT_FINISHED": "결과를 확인하고 다음 장면으로 진행하세요."}

class SpellButton extends Button:
    signal pair_requested(first: String, second: String)
    var glyph: String
    func _get_drag_data(_position: Vector2) -> Variant:
        var label := Label.new()
        label.text = text
        set_drag_preview(label)
        return {"spell_glyph": glyph}
    func _can_drop_data(_position: Vector2, data: Variant) -> bool:
        return data is Dictionary and data.get("spell_glyph") is String and data.spell_glyph != glyph
    func _drop_data(_position: Vector2, data: Variant) -> void:
        pair_requested.emit(glyph, data.spell_glyph)

var engine = SessionRules.new()
var session: Dictionary = {}
var quote: Dictionary = {}
var selected: Array = []
var target_id := ""
var destination_id := ""
var action_kind := "CAST"
var story_index := 0
var last_receipt: Dictionary = {}
var save_folder := "res://artifacts/local-validation/event-session-progress"
var save_notice: Label
var header: Label
var facts: Label
var preview_text: Label
var selected_text: Label
var target_buttons: VBoxContainer
var manual_buttons: HBoxContainer
var confirm: Button
var next_button: Button
var glyph_buttons: Array[Button] = []

func _ready() -> void:
    if session.is_empty():
        session = engine.start(Definitions.IDS[0], "preview-" + str(Time.get_ticks_usec()))
    _build()
    _render()

func _build() -> void:
    var background := ColorRect.new()
    background.color = Color("101a28")
    background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    background.mouse_filter = Control.MOUSE_FILTER_IGNORE
    add_child(background)
    var margin := MarginContainer.new()
    margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    for side in ["left", "right", "top", "bottom"]:
        margin.add_theme_constant_override("margin_" + side, 24)
    add_child(margin)
    var layout := VBoxContainer.new()
    layout.add_theme_constant_override("separation", 10)
    margin.add_child(layout)
    theme = Theme.new()
    theme.default_font_size = 20
    header = _label(layout, "", 26)
    save_notice = _label(layout, "사건 플레이 검증판 · 최종 아트/전체 이야기 미적용 · 선택과 읽기는 무료입니다.", 16)
    var body := HBoxContainer.new()
    body.size_flags_vertical = Control.SIZE_EXPAND_FILL
    body.add_theme_constant_override("separation", 20)
    layout.add_child(body)
    var left := VBoxContainer.new()
    left.custom_minimum_size.x = 270
    body.add_child(left)
    _label(left, "1. 대상과 목적지", 22)
    target_buttons = VBoxContainer.new()
    target_buttons.add_theme_constant_override("separation", 8)
    left.add_child(target_buttons)
    var detail_scroll := ScrollContainer.new()
    detail_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
    detail_scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    detail_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
    body.add_child(detail_scroll)
    var center := VBoxContainer.new()
    center.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    center.add_theme_constant_override("separation", 10)
    detail_scroll.add_child(center)
    _label(center, "2. 글자를 선택하거나 서로 겹치세요", 22)
    var hand := HBoxContainer.new()
    hand.add_theme_constant_override("separation", 8)
    center.add_child(hand)
    for glyph in GLYPH_NAMES:
        var button := SpellButton.new()
        button.glyph = glyph
        button.text = GLYPH_NAMES[glyph] + "\n글자"
        button.custom_minimum_size = Vector2(104, 76)
        button.toggle_mode = true
        button.pressed.connect(select_glyph.bind(glyph))
        button.pair_requested.connect(select_pair)
        hand.add_child(button)
        glyph_buttons.append(button)
    selected_text = _label(center, "", 20)
    facts = _label(center, "", 18)
    facts.size_flags_vertical = Control.SIZE_EXPAND_FILL
    preview_text = _label(center, "", 18)
    preview_text.custom_minimum_size.y = 96
    _label(layout, "또는 일반 행동 선택 → 결과 미리보기 → 시전 / 실행", 17)
    manual_buttons = HBoxContainer.new()
    manual_buttons.add_theme_constant_override("separation", 8)
    layout.add_child(manual_buttons)
    var footer := HBoxContainer.new()
    footer.add_theme_constant_override("separation", 12)
    layout.add_child(footer)
    confirm = _button(footer, "시전 / 실행", confirm_action)
    confirm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    _button(footer, "선택 취소", cancel_selection)
    _button(footer, "진행 저장", save_progress)
    _button(footer, "이어하기", load_progress)
    next_button = _button(footer, "결과 확인 후 다음 장면", continue_story)

func select_glyph(glyph: String) -> void:
    if glyph not in GLYPH_NAMES or session.outcome != "ONGOING":
        return
    action_kind = "CAST"
    if glyph in selected:
        selected.erase(glyph)
    elif selected.size() < 2:
        selected.append(glyph)
    _render()

func select_pair(first: String, second: String) -> void:
    if first not in GLYPH_NAMES or second not in GLYPH_NAMES or first == second or session.outcome != "ONGOING":
        return
    action_kind = "CAST"
    selected = [first, second]
    _render()

func select_target(id: String) -> void:
    target_id = id
    _render()

func select_destination(id: String) -> void:
    destination_id = id
    _render()

func select_manual(kind: String) -> void:
    action_kind = kind
    _render()

func cancel_selection() -> void:
    selected.clear()
    target_id = ""
    destination_id = ""
    action_kind = "CAST"
    _render()

func confirm_action() -> void:
    if session.outcome != "ONGOING":
        return
    var result: Dictionary = engine.act(session, _command())
    if result.status == "APPLIED":
        session = result.state
        last_receipt = result.receipt
        selected.clear()
        action_kind = "CAST"
        destination_id = ""
        if story_mode: story_checkpoint.emit(session.duplicate(true))
    _render()

func continue_story() -> void:
    if story_mode:
        if session.outcome != "ONGOING": story_finished.emit()
        return
    if session.outcome == "ONGOING" or story_index >= Definitions.IDS.size() - 1:
        return
    story_index += 1
    session = engine.start(Definitions.IDS[story_index], "preview-" + str(Time.get_ticks_usec()))
    last_receipt = {}
    cancel_selection()

func save_progress() -> void:
    if story_mode:
        story_save_requested.emit()
        return
    var saved: Dictionary = SaveStore.new().save_progress(save_folder,
        {"story_index": story_index, "session": session, "last_receipt": last_receipt})
    save_notice.text = "진행 저장 완료 · 프로젝트 내부의 두 복구 슬롯을 사용합니다." if saved.status == "SAVED" else "저장 실패 · 현재 플레이 상태는 유지됩니다: " + saved.reason

func load_progress() -> void:
    if story_mode:
        story_load_requested.emit()
        return
    var loaded: Dictionary = SaveStore.new().load_progress(save_folder)
    if loaded.status != "LOADED":
        save_notice.text = "사용 가능한 저장이 없습니다. 현재 플레이 상태는 유지합니다."
        return
    session = loaded.payload.session
    story_index = loaded.payload.story_index
    last_receipt = loaded.payload.last_receipt
    cancel_selection()
    save_notice.text = "이어하기 완료 · 저장된 마력, 시계, 행동과 결과를 복원했습니다."

func _command() -> Dictionary:
    var command := {"id": "ui-" + str(session.spell_state.revision), "expected_revision": session.spell_state.revision, "kind": action_kind}
    if action_kind == "CAST":
        command.merge({"glyphs": selected.duplicate(), "target_id": target_id, "destination_id": destination_id})
    return command

func _render() -> void:
    if not is_instance_valid(header):
        return
    header.text = "%d / 3  %s    |    마력 %d    행동 %d    %s" % [story_index + 1, session.title, session.spell_state.mana, session.spell_state.elapsed_actions, OUTCOMES[session.outcome]]
    if story_mode:
        header.text = "이야기 · %s    |    마력 %d    행동 %d    %s" % [session.title,session.spell_state.mana,session.spell_state.elapsed_actions,OUTCOMES[session.outcome]]
    for button in glyph_buttons:
        button.set_pressed_no_signal(button.glyph in selected)
        button.disabled = session.outcome != "ONGOING"
    _clear(target_buttons)
    for id in session.spell_state.objects:
        var object: Dictionary = session.spell_state.objects[id]
        if object.has("capture_capacity"):
            var destination := _button(target_buttons, ("→ " if destination_id == id else "목적지 · ") + object.label, select_destination.bind(id))
            destination.disabled = session.outcome != "ONGOING"
        else:
            var target := _button(target_buttons, ("✓ " if target_id == id else "대상 · ") + object.label, select_target.bind(id))
            target.disabled = session.outcome != "ONGOING"
    if destination_id != "":
        _button(target_buttons, "목적지 선택 해제", select_destination.bind(""))
    _clear(manual_buttons)
    var kinds: Array = ["COOL"] if story_index == 0 else (["CLOSE_LEAK", "CLEAN", "WAIT"] if story_index == 1 else ["COOL", "LOCK", "PLACE"])
    if session.event_id == "LAB_SAMPLE_02": kinds = ["STOP_DEVICE","MOVE_SAMPLE","WAIT"]
    kinds.append_array(["HELP", "STOP"])
    for kind in kinds:
        var button := _button(manual_buttons, ("✓ " if action_kind == kind else "") + MANUAL[kind], select_manual.bind(kind))
        button.disabled = session.outcome != "ONGOING"
    var names: Array = []
    for glyph in selected:
        names.append(GLYPH_NAMES[glyph])
    selected_text.text = "선택: " + (" + ".join(names) if action_kind == "CAST" else MANUAL.get(action_kind, action_kind))
    facts.text = _facts(session)
    quote = engine.preview(session, _command())
    confirm.disabled = quote.status != "APPLIED"
    next_button.disabled = session.outcome == "ONGOING" or story_index >= 2
    next_button.text = "첫 세 사건 검증 종료" if story_index == 2 and session.outcome != "ONGOING" else "결과 확인 후 다음 장면"
    if story_mode:
        next_button.disabled = session.outcome == "ONGOING"
        next_button.text = "결과 확인 후 다음 장면"
    if quote.status == "APPLIED":
        preview_text.text = "실행 전 미리보기\n" + _receipt_text(quote.receipt)
    else:
        var reason: String = quote.get("reason", "")
        preview_text.text = REASONS.get(reason, "이 조합은 선택한 대상에 사용할 수 없습니다. (" + reason + ")")
        if session.outcome == "ONGOING" and action_kind == "CAST":
            if selected.is_empty():
                preview_text.text = "사용할 글자를 선택하세요. 한 장만 쓰거나 두 장을 겹칠 수 있습니다."
            elif target_id.is_empty():
                preview_text.text = "주문을 사용할 대상을 선택하세요."
        if not last_receipt.is_empty():
            preview_text.text += "\n\n직전 결과\n" + _receipt_text(last_receipt)

func _facts(state: Dictionary) -> String:
    var objects: Dictionary = state.spell_state.objects
    var temperatures := {"cold": "차가움", "warm": "따뜻함", "hot": "뜨거움", "overheated": "과열"}
    match state.event_id:
        "LAB_SAMPLE_02":
            var remaining: int = maxi(0,objects.device.get("effects",{}).get("blocked",0)-state.spell_state.elapsed_actions)
            return "목표: 장치를 안전하게 정지하기\n위험 %d / 6 · 임시 보호 남은 %d행동\n장치: %s · 시료: %s\n즉시 정지는 안전하지만 내부 시료 처리가 중단됩니다.\n보호 없이 옮기면 위험+2, 가동 중 보호 없는 행동은 추가+1.\n위험6이면 교수 개입. 이미 보존한 시료는 유지됩니다." % [state.hazard,remaining,"정지" if objects.device.closed else "가동", "보존" if objects.sample.location_id == "safe" else "장치 내부"]
        "LESSON_HEAT_01":
            return "목표: 용기를 따뜻하게 만들기\n용기: %s  ·  표본: %s\n너무 뜨거우면 안전 받침에서 식힐 수 있습니다." % [temperatures[objects.vessel.temperature], "손상" if objects.sample.get("damaged", false) else "온전함"]
        "GREENHOUSE_LEAK_01":
            var clock := ""
            for index in range(6):
                clock += "● " if index < state.hazard else "○ "
            var effects: Dictionary = objects.leak.get("effects", {})
            var remaining: int = maxi(effects.get("blocked", 0), effects.get("leak_suppressed", 0)) - state.spell_state.elapsed_actions
            var suppression := "누출 억제: 다음 %d행동까지" % remaining if remaining > 0 else "임시 누출 억제 없음"
            return "목표: 누출을 닫고 남은 꽃가루 제거\n위험 %d / 6  %s\n덮개: %s  ·  꽃가루: %s\n수집함 %d / 3  ·  수동 청소 %d / 2\n%s" % [state.hazard, clock, "닫힘" if objects.leak.closed else "열림", "없음" if objects.cloud.empty else "있음", objects.receiver.capture_load, state.cleanup_step, suppression]
        _:
            return "목표: 따뜻한 조명 + 장식 배치 + 영구 잠금\n조명: %s  ·  장식: %s\n잠금: %s  ·  수동 배치 %d / 2\n관객 방향이나 종이 가열은 안전 문제가 됩니다." % [temperatures[objects.lamp.temperature], "배치됨" if objects.decorations.location_id == "stage" else "흩어짐", "완료" if objects.latch.closed else "열림", state.placement_step]

func _receipt_text(receipt: Dictionary) -> String:
    var text := "마력 %d → %d  ·  행동 %d → %d  ·  %s" % [receipt.mana_before, receipt.mana_after, receipt.actions_before, receipt.actions_after, OUTCOMES[receipt.outcome]]
    if session.event_id in ["GREENHOUSE_LEAK_01","LAB_SAMPLE_02"]:
        text += "\n위험 %d → %d" % [receipt.hazard_before, receipt.hazard_after]
    for change in receipt.changes:
        text += "  /  %s %+d" % [CAUSES.get(change.cause, change.cause), change.delta]
    var properties := {"temperature": "온도", "closed": "닫힘", "empty": "잔여물 제거", "damaged": "손상", "location_id": "위치", "redirected_to": "흐름 목적지", "capture_load": "수집량"}
    for change in receipt.get("object_changes", []):
        if change.property.begins_with("effects."):
            text += "\n%s · 임시 장막: 이번 행동 적용, 다음 %d행동까지 유지" % [change.label, maxi(0, change.after - receipt.actions_after)]
        else:
            text += "\n%s %s: %s → %s" % [change.label, properties.get(change.property, change.property), _value_text(change.before), _value_text(change.after)]
    for consequence in receipt.consequences:
        text += "\n" + CONSEQUENCES.get(consequence, consequence)
    if receipt.assessment.get("status") == "VALID_NO_CHANGE":
        text += "\n대상 변화 없음 · 비용과 행동은 소비됩니다."
    return text

func _value_text(value: Variant) -> String:
    if value == null:
        return "없음"
    if value is bool:
        return "예" if value else "아니요"
    var values := {"cold": "차가움", "warm": "따뜻함", "hot": "뜨거움", "overheated": "과열", "stage": "무대", "floor": "바닥", "audience": "관객 방향", "device":"장치 내부", "safe":"안전 용기"}
    return str(values.get(value, value))

func _label(parent: Node, value: String, font_size: int) -> Label:
    var label := Label.new()
    label.text = value
    label.add_theme_font_size_override("font_size", font_size)
    label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    parent.add_child(label)
    return label

func _button(parent: Node, text: String, callback: Callable) -> Button:
    var button := Button.new()
    button.text = text
    button.custom_minimum_size.y = 46
    button.pressed.connect(callback)
    parent.add_child(button)
    return button

func _clear(parent: Node) -> void:
    for child in parent.get_children():
        parent.remove_child(child)
        child.queue_free()

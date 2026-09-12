extends Control
## Functional practice entry. Approved environment, provisional text cards.
const Duel = preload("res://src/core/shared_spell/duel_session.gd")
const Save = preload("res://src/core/shared_spell/duel_save.gd")
const NAMES := ["불씨","바람","막기","모으기"]
const DESCRIPTIONS := ["작은 열로\n결계 압박","기류로\n결계 압박","이번 공격\n통과 차단","다음 공격\n집중 강화"]
const NATURES := {"heat":"열","flow":"흐름","fixed_pulse":"고정파동"}
const OUTCOMES := {"ONGOING":"진행 중","WIN":"연습 승리","LOSS":"연습 패배","DRAW":"무승부","STOPPED":"연습 중단"}

class Card extends Button:
    signal paired(a: int,b: int)
    var card_id: int
    func _get_drag_data(_at: Vector2) -> Variant:
        if disabled: return null
        var preview := Label.new()
        preview.text = text
        set_drag_preview(preview)
        return {"duel_card":card_id}
    func _can_drop_data(_at: Vector2, data: Variant) -> bool:
        return not disabled and data is Dictionary and data.get("duel_card") is int and data.duel_card != card_id
    func _drop_data(_at: Vector2, data: Variant) -> void:
        paired.emit(card_id,data.duel_card)

var rules = Duel.new()
var session: Dictionary
var quote: Dictionary = {}
var selection: Array = []
var action_kind := "CAST"
var save_folder := "res://artifacts/local-validation/shared-duel-progress"
var header: Label
var announced: Label
var details: Label
var notice: Label
var hand: HBoxContainer
var confirm: Button
var retry: Button

func _ready() -> void:
    session = rules.create(17)
    theme = Theme.new()
    theme.default_font_size = 20
    var bg := TextureRect.new()
    bg.name = "Background"
    bg.texture = load("res://output/imagegen/card-duel/duel-background-candidate-01.png")
    bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
    bg.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
    bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
    bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(bg)
    var margin := MarginContainer.new()
    margin.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    for side in ["left","right","top","bottom"]: margin.add_theme_constant_override("margin_"+side,24)
    add_child(margin)
    var layout := VBoxContainer.new()
    layout.add_theme_constant_override("separation",12)
    margin.add_child(layout)
    header = _label(layout,28)
    notice = _label(layout,16)
    notice.text = "연습 결투 구현판 · 카드 일러스트/초상 미적용 · 학습용 손패"
    announced = _label(layout,24)
    var spacer := Control.new()
    spacer.size_flags_vertical = Control.SIZE_EXPAND_FILL
    layout.add_child(spacer)
    details = _label(layout,22)
    details.custom_minimum_size.y = 104
    hand = HBoxContainer.new()
    hand.alignment = BoxContainer.ALIGNMENT_CENTER
    hand.add_theme_constant_override("separation",16)
    layout.add_child(hand)
    var actions := HBoxContainer.new()
    actions.add_theme_constant_override("separation",8)
    layout.add_child(actions)
    confirm = _button(actions,"시전 / 실행",confirm_action)
    _button(actions,"선택 취소",cancel_selection)
    _button(actions,"한 장 정돈",choose_action.bind("TIDY"))
    _button(actions,"대기",choose_action.bind("WAIT"))
    _button(actions,"중단",choose_action.bind("STOP"))
    _button(actions,"저장",save_progress)
    _button(actions,"이어하기",load_progress)
    retry = _button(actions,"다시 연습",restart)
    _render()

func select_card(id: int) -> void:
    if session.outcome != "ONGOING" or id not in session.hand: return
    action_kind = "CAST"
    if id in selection: selection.erase(id)
    elif selection.size() < 2: selection.append(id)
    _render()

func select_pair(a: int,b: int) -> void:
    if a == b or a not in session.hand or b not in session.hand or session.outcome != "ONGOING": return
    selection = [a,b]
    action_kind = "CAST"
    _render()

func choose_action(kind: String) -> void:
    action_kind = kind
    if kind in ["WAIT","STOP"]: selection.clear()
    _render()

func cancel_selection() -> void:
    selection.clear()
    action_kind = "CAST"
    _render()

func _command() -> Dictionary:
    return {"id":"ui-"+str(session.revision),"revision":session.revision,"kind":action_kind,"ids":selection.duplicate()}

func confirm_action() -> void:
    if quote.get("status") != "APPLIED": return
    var result: Dictionary = rules.apply(session,_command())
    if result.status != "APPLIED": return
    session = result.state
    notice.text = "실행 완료 · " + OUTCOMES[session.outcome]
    cancel_selection()

func save_progress() -> void:
    var result: Dictionary = Save.new().save_progress(ProjectSettings.globalize_path(save_folder),{"session":session})
    notice.text = "저장 완료" if result.status == "SAVED" else "저장 실패 · 현재 진행은 유지됩니다."

func load_progress() -> void:
    var result: Dictionary = Save.new().load_progress(ProjectSettings.globalize_path(save_folder))
    if result.status != "LOADED":
        notice.text = "불러올 정상 저장이 없습니다. 현재 진행은 유지됩니다."
        return
    session = result.payload.session
    notice.text = "이어하기 완료 · 손패와 결투 상태를 복원했습니다."
    cancel_selection()

func restart() -> void:
    if session.outcome == "ONGOING": return
    session = rules.create(int(Time.get_unix_time_from_system()),false)
    notice.text = "재연습 · 일반 추첨 손패 · 저장은 직접 선택할 때만 변경됩니다."
    cancel_selection()

func _render() -> void:
    header.text = "연습 결투   내 결계 %d / 16     교환 %d     상대 결계 %d / 16" % [session.player_barrier,session.revision+1,session.opponent_barrier]
    var foe: Dictionary = rules.opponent(session)
    announced.text = "상대 예고: %s 공격 %d · 방어 %d    |    집중 %d · 방패 억제 %d" % [NATURES[foe.nature],foe.attack,foe.guard,session.focus,session.suppression]
    quote = rules.preview(session,_command())
    confirm.disabled = quote.get("status") != "APPLIED"
    retry.disabled = session.outcome == "ONGOING"
    if session.outcome != "ONGOING":
        details.text = OUTCOMES[session.outcome] + "\n연습 결과를 확인했습니다. 다시 연습하거나 저장할 수 있습니다."
    elif quote.get("status") == "APPLIED":
        var r: Dictionary = quote.receipt
        var title: String = r.get("name",{"TIDY":"정돈 — 이번 교환을 사용합니다","WAIT":"대기 — 상대 공격을 받습니다","STOP":"연습 중단"}.get(action_kind,""))
        details.text = "%s  · 비용 %d\n내 결계 %d → %d  /  상대 결계 %d → %d\n예상: %s · 집중 %d → %d · 억제 %d → %d" % [title,r.cost,session.player_barrier,quote.state.player_barrier,session.opponent_barrier,quote.state.opponent_barrier,OUTCOMES[quote.state.outcome],session.focus,quote.state.focus,session.suppression,quote.state.suppression]
    else:
        var reason: String = quote.get("reason","")
        details.text = {"INVALID_COUNT":"글자를 한 장 또는 서로 다른 두 종류로 선택하세요.\n정돈은 한 장을 선택한 뒤 누르세요.","INCOMPATIBLE_ATTACK":"상대 공격 성질에 맞지 않는 주문입니다.\n온기 장막은 열, 흐름 전환은 흐름 공격에 사용합니다.","INVALID_SPELL":"같은 종류의 글자는 조합할 수 없습니다.","DUPLICATE_GLYPH":"같은 종류의 글자는 조합할 수 없습니다."}.get(reason,"선택을 확인하세요: "+reason)
    for child in hand.get_children():
        hand.remove_child(child)
        child.queue_free()
    for id in session.hand:
        var card := Card.new()
        card.card_id = id
        card.custom_minimum_size = Vector2(190,166)
        card.text = ("✓ " if id in selection else "") + NAMES[id/2] + "\n\n" + DESCRIPTIONS[id/2] + "\n\n비용 1"
        card.disabled = session.outcome != "ONGOING"
        card.pressed.connect(select_card.bind(id))
        card.paired.connect(select_pair)
        hand.add_child(card)

func _label(parent: Node, size_px: int) -> Label:
    var label := Label.new()
    label.add_theme_font_size_override("font_size",size_px)
    label.add_theme_color_override("font_shadow_color",Color.BLACK)
    label.add_theme_constant_override("shadow_offset_x",2)
    label.add_theme_constant_override("shadow_offset_y",2)
    var backing := StyleBoxFlat.new()
    backing.bg_color = Color(0.035,0.055,0.09,0.86)
    backing.content_margin_left = 10
    backing.content_margin_right = 10
    backing.content_margin_top = 4
    backing.content_margin_bottom = 4
    label.add_theme_stylebox_override("normal",backing)
    parent.add_child(label)
    return label

func _button(parent: Node, text_value: String, callback: Callable) -> Button:
    var b := Button.new()
    b.text = text_value
    b.custom_minimum_size.y = 48
    b.pressed.connect(callback)
    parent.add_child(b)
    return b

extends Control
signal story_checkpoint(snapshot: Dictionary)
signal story_finished
signal story_save_requested
signal story_load_requested
signal story_menu_requested
var story_mode := false
var persistence_blocked := false

func set_persistence_blocked(blocked: bool) -> void:
    persistence_blocked = blocked
    if is_instance_valid(header): _render()
## TCG-like hand presentation over the existing shared spell rules.
const Duel = preload("res://src/core/shared_spell/duel_session.gd")
const Save = preload("res://src/core/shared_spell/duel_save.gd")
const Card = preload("res://src/ui/shared_duel/duel_card_view.gd")
const SpellPresentation = preload("res://src/ui/shared_duel/spell_cast_presentation.gd")
const Semantics = preload("res://src/core/shared_spell/spell_semantics.gd")
const NAMES := ["불씨","바람","막기","모으기"]
const NATURES := {"heat":"열","flow":"흐름","fixed_pulse":"고정파동"}
const OUTCOMES := {"ONGOING":"진행 중","WIN":"연습 승리","LOSS":"연습 패배","DRAW":"무승부","STOPPED":"연습 중단"}

var rules = Duel.new()
var session: Dictionary = {}
var quote: Dictionary = {}
var selection: Array = []
var action_kind := "CAST"
var save_folder := preload("res://src/core/shared_spell/story_storage_paths.gd").folder("shared-duel-progress", OS.has_feature("editor"))
var header: Label
var announced: Label
var details: Label
var notice: Label
var hand: HBoxContainer
var confirm: Button
var retry: Button
var review: Label
var story_next: Button
var input_epoch := 0
var prepared: Label
var hand_summary: Label
var spell_visual: Control

func _ready() -> void:
    if session.is_empty(): session = rules.create(17)
    theme = preload("res://src/ui/theme/grimoire_theme_factory.gd").create_theme()
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
    for side in ["left","right","top","bottom"]: margin.add_theme_constant_override("margin_"+side,16)
    add_child(margin)
    var layout := VBoxContainer.new()
    layout.add_theme_constant_override("separation",6)
    margin.add_child(layout)
    var information_scroll := ScrollContainer.new()
    information_scroll.name = "DuelInformation"
    information_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
    information_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
    layout.add_child(information_scroll)
    var information := VBoxContainer.new()
    information.add_theme_constant_override("separation",6)
    information.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    information_scroll.add_child(information)
    var title_row := HBoxContainer.new()
    information.add_child(title_row)
    header = _label(title_row,24)
    header.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    if story_mode: _button(title_row,"메뉴",func(): story_menu_requested.emit())
    notice = _label(information,14)
    notice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    notice.text = "마법을 고르고 겹쳐 주문 준비 → 시전으로 발동 · 삽화·써클은 개발용 후보입니다."
    var opponent_row := HBoxContainer.new()
    information.add_child(opponent_row)
    announced = _label(opponent_row,22)
    announced.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    announced.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    var prepared_row := HBoxContainer.new()
    information.add_child(prepared_row)
    spell_visual = SpellPresentation.new()
    spell_visual.name = "SpellManifestation"
    prepared_row.add_child(spell_visual)
    prepared = _label(prepared_row,20)
    prepared.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    prepared.name = "PreparedSpell"
    prepared.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
    prepared.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    var review_toggle := _button(opponent_row,"직전 교환 복기",func():
        var panel = information.get_node("ReviewScroll")
        panel.visible = not panel.visible)
    review_toggle.name = "ReviewToggle"
    review_toggle.custom_minimum_size.y = 32
    var review_scroll := ScrollContainer.new()
    review_scroll.name = "ReviewScroll"
    review_scroll.visible = false
    review_scroll.custom_minimum_size.y = 62
    review_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
    information.add_child(review_scroll)
    review = _label(review_scroll,18)
    review.name = "ExchangeReview"
    review.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    review.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    details = _label(information,18)
    details.custom_minimum_size.y = 84
    details.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    hand_summary = _label(layout,16)
    hand = HBoxContainer.new()
    hand.alignment = BoxContainer.ALIGNMENT_CENTER
    hand.add_theme_constant_override("separation",16)
    layout.add_child(hand)
    var actions := HFlowContainer.new()
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
    retry.visible = not story_mode
    var reduced := CheckButton.new()
    reduced.name = "ReducedSpellMotion"
    reduced.text = "연출 간소화"
    reduced.tooltip_text = "이번 화면의 주문 연출만 정적으로 표시합니다. 규칙과 결과는 같습니다."
    reduced.toggled.connect(spell_visual.set_reduced_motion)
    actions.add_child(reduced)
    if story_mode: story_next = _button(actions,"결과 확인 후 다음 장면",continue_story)
    _render()

func select_card(id: int) -> void:
    if persistence_blocked or session.outcome != "ONGOING" or id not in session.hand: return
    if id not in selection:
        if selection.size() >= 2:
            _render()
            return
        if not selection.is_empty() and int(selection[0] / 2) == int(id / 2):
            notice.text = "같은 글자 두 장은 조합할 수 없습니다. 다른 글자를 선택하세요."
            _render()
            return
    action_kind = "CAST"
    if id in selection: selection.erase(id)
    elif selection.size() < 2: selection.append(id)
    _render()

func select_pair(a: int,b: int) -> void:
    if persistence_blocked or a == b or a not in session.hand or b not in session.hand or session.outcome != "ONGOING": return
    if int(a / 2) == int(b / 2): return
    selection = [a,b]
    action_kind = "CAST"
    _render()

func choose_action(kind: String) -> void:
    if persistence_blocked or session.outcome != "ONGOING" or kind not in ["CAST","TIDY","WAIT","STOP"]: return
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
    if persistence_blocked: return
    if quote.get("status") != "APPLIED": return
    var result: Dictionary = rules.apply(session,_command())
    if result.status != "APPLIED": return
    var cast_glyphs: Array = []
    if action_kind == "CAST":
        for id in selection: cast_glyphs.append(Duel.GLYPHS[id / 2])
    session = result.state
    if story_mode: story_checkpoint.emit(session.duplicate(true))
    notice.text = "실행 완료 · " + OUTCOMES[session.outcome]
    cancel_selection()
    if not cast_glyphs.is_empty():
        spell_visual.play_cast(cast_glyphs,str(result.receipt.get("name","주문")))

func save_progress() -> void:
    if story_mode:
        story_save_requested.emit()
        return
    var result: Dictionary = Save.new().save_progress(ProjectSettings.globalize_path(save_folder),{"session":session})
    notice.text = "저장 완료" if result.status == "SAVED" else "저장 실패 · 현재 진행은 유지됩니다."

func load_progress() -> void:
    if story_mode:
        story_load_requested.emit()
        return
    var result: Dictionary = Save.new().load_progress(ProjectSettings.globalize_path(save_folder))
    if result.status != "LOADED":
        notice.text = "불러올 정상 저장이 없습니다. 현재 진행은 유지됩니다."
        return
    session = result.payload.session
    input_epoch += 1
    notice.text = "이어하기 완료 · 손패와 결투 상태를 복원했습니다."
    if result.get("recovery", false):
        notice.text = "일부 기록을 읽지 못해 정상 보관된 기록을 펼쳤습니다. 마지막 행동은 포함되지 않을 수 있습니다."
    cancel_selection()

func restart() -> void:
    if persistence_blocked: return
    if story_mode: return
    if session.outcome == "ONGOING": return
    session = rules.create(int(Time.get_unix_time_from_system()),false)
    input_epoch += 1
    notice.text = "재연습 · 일반 추첨 손패 · 저장은 직접 선택할 때만 변경됩니다."
    cancel_selection()

func _render() -> void:
    _render_review()
    header.text = "연습 결투   내 결계 %d / 16     교환 %d     상대 결계 %d / 16" % [session.player_barrier,session.revision+1,session.opponent_barrier]
    var foe: Dictionary = rules.opponent(session)
    announced.text = "상대 예고: %s 공격 %d · 방어 %d    |    집중 %d · 방패 억제 %d" % [NATURES[foe.nature],foe.attack,foe.guard,session.focus,session.suppression]
    quote = rules.preview(session,_command())
    confirm.disabled = persistence_blocked or quote.get("status") != "APPLIED"
    retry.disabled = session.outcome == "ONGOING"
    if story_next != null: story_next.disabled = persistence_blocked or session.outcome == "ONGOING"
    if session.outcome != "ONGOING":
        details.text = OUTCOMES[session.outcome] + "\n연습 결과를 확인했습니다. 다시 연습하거나 저장할 수 있습니다."
    elif quote.get("status") == "APPLIED":
        var r: Dictionary = quote.receipt
        var title: String = r.get("name",{"TIDY":"정돈 — 이번 교환을 사용합니다","WAIT":"대기 — 상대 공격을 받습니다","STOP":"연습 중단"}.get(action_kind,""))
        details.text = "%s  · 비용 %d\n내 결계 %d → %d  /  상대 결계 %d → %d\n예상: %s · 집중 %d → %d · 억제 %d → %d" % [title,r.cost,session.player_barrier,quote.state.player_barrier,session.opponent_barrier,quote.state.opponent_barrier,OUTCOMES[quote.state.outcome],session.focus,quote.state.focus,session.suppression,quote.state.suppression]
    else:
        var reason: String = quote.get("reason","")
        details.text = {"INVALID_COUNT":"글자를 한 장 또는 서로 다른 두 종류로 선택하세요.\n정돈은 한 장을 선택한 뒤 누르세요.","INCOMPATIBLE_ATTACK":"상대 공격 성질에 맞지 않는 주문입니다.\n온기 장막은 열, 흐름 전환은 흐름 공격에 사용합니다.","INVALID_SPELL":"같은 종류의 글자는 조합할 수 없습니다.","DUPLICATE_GLYPH":"같은 종류의 글자는 조합할 수 없습니다."}.get(reason,"선택을 확인하세요: "+reason)
    _render_hand()

func _drag_context() -> Dictionary:
    return {"screen":get_instance_id(),"epoch":input_epoch,"revision":session.revision,"seed":session.seed}

func accepts_card_drop(target: int, data: Variant) -> bool:
    if persistence_blocked or session.outcome != "ONGOING" or not data is Dictionary: return false
    if data.get("context") != _drag_context() or not data.get("duel_card") is int: return false
    var source: int = data.duel_card
    return target in session.hand and source in session.hand and target != source and int(target / 2) != int(source / 2)

func _render_hand() -> void:
    var focused = get_viewport().gui_get_focus_owner()
    var focus_removed := false
    for child in hand.get_children():
        if child.card_id not in session.hand:
            focus_removed = focus_removed or child == focused
            child.disabled = true
            hand.remove_child(child)
            child.queue_free()
    for id in session.hand:
        var card = null
        for child in hand.get_children():
            if child.card_id == id: card = child
        if card == null:
            card = Card.new()
            card.name = "HandCard" + str(id)
            card.card_requested.connect(select_card)
            card.pair_requested.connect(select_pair)
            card.accepts_pair = accepts_card_drop
            hand.add_child(card)
        hand.move_child(card,session.hand.find(id))
        card.drag_context = _drag_context()
        card.bind_card(id,Duel.GLYPHS[id / 2],id in selection,not persistence_blocked and session.outcome == "ONGOING")
    if focus_removed and session.outcome == "ONGOING" and not persistence_blocked and hand.get_child_count() > 0:
        hand.get_child(0).grab_focus()
    hand_summary.text = "손패 %d  ·  남은 덱 %d  ·  버린 카드 %d  |  선택·취소는 무료 · 시전 후 사용한 패만 교체" % [session.hand.size(),session.draw.size(),session.discard.size()]
    var glyphs: Array = []
    var names := PackedStringArray()
    for id in selection:
        glyphs.append(Duel.GLYPHS[id / 2])
        names.append(NAMES[id / 2])
    var spell: Dictionary = Semantics.new().compose(glyphs,Duel.GLYPHS)
    spell_visual.prepare(glyphs if action_kind == "CAST" else [])
    if action_kind != "CAST":
        prepared.text = "주문 대신 행동 준비 · " + {"TIDY":"한 장 정돈","WAIT":"대기","STOP":"중단"}.get(action_kind,action_kind)
    elif spell.status == "OK":
        prepared.text = "%s  →  %s\n대상: 이번 결투의 상대 또는 내 결계 · 교환 마력 %d / 2 · 아직 시전하지 않았습니다." % [" + ".join(names),spell.name,spell.cost]
    else:
        prepared.text = "상대의 예고를 읽고 손패에서 글자를 고르세요.\n한 장은 단독 주문, 서로 다른 두 장은 조합 주문입니다."

func continue_story() -> void:
    if persistence_blocked: return
    if story_mode and session.outcome != "ONGOING": story_finished.emit()

func _render_review() -> void:
    if session.commands.is_empty():
        review.text = "직전 실행 복기\n아직 실행한 주문이 없습니다. 선택과 미리보기는 실행 기록을 바꾸지 않습니다."
        return
    var command: Dictionary = session.commands.back()
    var receipt: Dictionary = session.receipts[command.id]
    var title: String = receipt.get("name",{"WAIT":"대기","TIDY":"한 장 정돈","STOP":"연습 중단"}.get(command.kind,"실행"))
    review.text = "직전 실행 복기 · %d번째 · %s\n" % [session.revision,title]
    if command.kind == "STOP":
        review.text += "공격을 주고받지 않고 연습을 중단했습니다."
        return
    review.text += "받는 피해 %d · 상대에게 주는 피해 %d (남은 결계를 넘는 피해 포함)\n" % [receipt.player_damage,receipt.get("opponent_damage",0)]
    if command.kind != "CAST":
        review.text += "주문 없이 이번 교환을 사용했습니다. 집중과 방패 억제는 만료됩니다."
        return
    review.text += "막음 %d · 되돌림 %d · 결계 복구 %d · 집중 사용 %d\n" % [receipt.blocked,receipt.redirected,receipt.restored,receipt.focus_used]
    review.text += "상대 방패 제거 %d · 상대가 막은 직접 공격 %d / 반격 %d · 비용 %d" % [receipt.shield_removed,receipt.direct_blocked,receipt.counter_blocked,receipt.cost]
    if "COST_WITHOUT_REPAIR" in receipt.warnings:
        review.text += "\n주의: 결계가 이미 가득 차서 비용을 썼지만 복구량은 0입니다."

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

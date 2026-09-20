extends Button
## A hand instance, not a rules owner. Art remains a separately approved asset.
signal card_requested(instance_id: int)
signal pair_requested(first_id: int, second_id: int)

const NAMES := {"EMBER":"불씨", "WIND":"바람", "WARD":"막기", "GATHER":"모으기"}
const MEANINGS := {"EMBER":"작은 열을 준다", "WIND":"기류를 밀어낸다", "WARD":"통과를 차단한다", "GATHER":"흩어진 힘을 모은다"}
const Art = preload("res://src/ui/shared_duel/spell_art.gd")
var card_id := -1
var glyph_id := ""
var drag_context: Dictionary = {}
var accepts_pair: Callable

func _init() -> void:
    toggle_mode = true
    custom_minimum_size = Vector2(204,232)
    expand_icon = true
    icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
    vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
    add_theme_constant_override("icon_max_width",126)
    add_theme_font_size_override("font_size",18)
    var selected_style := StyleBoxFlat.new()
    selected_style.bg_color = Color("132d45")
    selected_style.border_color = Color("e2bd68")
    selected_style.set_border_width_all(3)
    selected_style.set_content_margin_all(8)
    add_theme_stylebox_override("pressed",selected_style)
    add_theme_stylebox_override("hover_pressed",selected_style)
    add_theme_color_override("font_pressed_color",Color("f3ead4"))
    add_theme_color_override("font_hover_pressed_color",Color("f3ead4"))
    pressed.connect(func(): card_requested.emit(card_id))

func bind_card(instance_id: int, glyph: String, selected: bool, enabled: bool) -> void:
    card_id = instance_id
    if glyph_id != glyph:
        icon = Art.texture_for(glyph)
    glyph_id = glyph
    disabled = not enabled
    set_pressed_no_signal(selected)
    text = "%s\n%s\n%s" % [NAMES.get(glyph,"알 수 없는 글자"),MEANINGS.get(glyph,""),"선택됨 · 다시 눌러 해제" if selected else "단독 / 두 글자 조합"]
    tooltip_text = "%s · 손패의 %d번 카드\n겹치기는 주문 준비입니다. 시전 버튼으로 발동합니다." % [NAMES.get(glyph,glyph),instance_id+1]

func _get_drag_data(_position: Vector2) -> Variant:
    if disabled: return null
    var preview := Label.new()
    preview.text = NAMES.get(glyph_id,glyph_id)
    set_drag_preview(preview)
    return {"duel_card":card_id,"context":drag_context.duplicate(true)}

func _can_drop_data(_position: Vector2, data: Variant) -> bool:
    return not disabled and accepts_pair.is_valid() and accepts_pair.call(card_id,data)

func _drop_data(position: Vector2, data: Variant) -> void:
    if _can_drop_data(position,data): pair_requested.emit(card_id,data.duel_card)

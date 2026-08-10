# Vault와 Typed Stock 문양을 동일한 수량 규칙으로 보여 주는 출처 패널이다.
class_name GlyphSourcePanel
extends PanelContainer

signal glyph_selected(glyph: Dictionary)

var _data: Dictionary = {}


func bind(data: Dictionary) -> void:
    _data = data.duplicate(true)
    var count := int(_data.get("count", Array(_data.get("glyph_ids", [])).size()))
    _data["count"] = count
    _set_label("RoleLabel", String(_data.get("role_label", _data.get("role", "출처"))))
    _set_label("CountLabel", "준비 문양: %s / %s" % [count, int(_data.get("maximum_each", 5))])
    _rebuild_cards()


func displayed_count() -> int:
    return int(_data.get("count", 0))


func source_data() -> Dictionary:
    return _data.duplicate(true)


func _rebuild_cards() -> void:
    var list = find_child("CardList", true, false)
    if list == null:
        return
    for child in list.get_children():
        child.queue_free()
    var glyph_ids: Array = Array(_data.get("glyph_ids", []))
    var reserved_ids: Array = Array(_data.get("reserved_ids", []))
    var card_scene = load("res://src/ui/spell_workflow/components/glyph_card.tscn")
    if card_scene == null:
        return
    for glyph_id in glyph_ids:
        var card = card_scene.instantiate()
        card.name = "%sCard" % String(glyph_id)
        list.add_child(card)
        card.bind({
            "glyph_id": glyph_id,
            "glyph_name": String(glyph_id),
            "role": String(_data.get("card_role", "보조")),
            "role_icon": String(_data.get("role_icon", "○")),
            "source": _data.get("source", 0),
            "source_name": String(_data.get("role_label", _data.get("role", "출처"))),
            "remaining_count": 0 if glyph_id in reserved_ids else 1,
            "mastery_quality": String(_data.get("mastery_quality", "기본")),
            "reserved": glyph_id in reserved_ids,
            "slot_name": String(_data.get("slot_name", "회로 슬롯")),
        })
        card.gui_input.connect(_on_card_input.bind(card))


func _on_card_input(event: InputEvent, card: GlyphCard) -> void:
    var activated: bool = event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT
    activated = activated or (event is InputEventScreenTouch and event.pressed)
    if activated and card.is_selectable():
        glyph_selected.emit(card.data())


func _set_label(path: String, value: String) -> void:
    var label = find_child(path, true, false)
    if label != null:
        label.text = value

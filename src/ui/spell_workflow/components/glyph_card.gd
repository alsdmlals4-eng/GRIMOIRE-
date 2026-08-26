# 회로 배치에서 문양의 출처와 Main/Aux 역할 및 예약 상태를 읽기 쉽게 표시하는 재사용 카드다.
class_name GlyphCard
extends PanelContainer

const GlyphVisualResolver = preload("res://src/ui/spell_workflow/glyph_visual_resolver.gd")

var _data: Dictionary = {}
var _selectable := true


func bind(data: Dictionary) -> void:
    _data = data.duplicate(true)
    _bind_visual(StringName(_data.get("glyph_id", &"")))
    _set_label("NameLabel", String(_data.get("glyph_name", _data.get("glyph_id", "알 수 없는 문양"))))
    _set_label("RoleLabel", String(_data.get("role", "보조")))
    _set_label("RoleIconLabel", String(_data.get("role_icon", "○")))
    _set_label("SourceLabel", "출처: %s" % String(_data.get("source_name", _data.get("source", "미확인"))))
    _set_label("CountLabel", "남음: %s" % str(_data.get("remaining_count", 0)))
    _set_label("QualityLabel", "숙련/품질: %s" % String(_data.get("mastery_quality", "기본")))
    var reserved := bool(_data.get("reserved", false))
    var reservation_text := "예약 없음"
    if reserved:
        reservation_text = "예약됨 · %s" % String(_data.get("slot_name", "슬롯"))
    _set_label("ReservationLabel", reservation_text)
    _selectable = int(_data.get("remaining_count", 0)) > 0 and not reserved
    mouse_filter = Control.MOUSE_FILTER_STOP if _selectable else Control.MOUSE_FILTER_IGNORE
    tooltip_text = reservation_text if _selectable else "예약 또는 소진됨 · 읽기 전용"
    modulate = Color.WHITE if _selectable else Color(0.72, 0.72, 0.72, 1.0)


func is_selectable() -> bool:
    return _selectable


func data() -> Dictionary:
    return _data.duplicate(true)


func _set_label(path: String, value: String) -> void:
    var label = find_child(path, true, false)
    if label != null:
        label.text = value


func _bind_visual(glyph_id: StringName) -> void:
    var glyph_texture = find_child("GlyphTexture", true, false) as TextureRect
    var glyph_name = find_child("GlyphNameLabel", true, false) as Label
    if glyph_texture != null:
        glyph_texture.texture = GlyphVisualResolver.texture_for(glyph_id)
    if glyph_name != null:
        glyph_name.text = GlyphVisualResolver.korean_name_for(glyph_id)
        glyph_name.visible = not glyph_name.text.is_empty()

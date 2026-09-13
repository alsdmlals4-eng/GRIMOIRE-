extends RefCounted
## Approved opaque originals in frames; not alpha-cutout or expression variants.
const ART := {
    "나":preload("res://output/imagegen/character-style-comparison/student-anime-reference-01.png"),
    "동료 학생":preload("res://output/imagegen/character-style-comparison/peer-personality-01.png"),
    "지도교수":preload("res://output/imagegen/character-style-comparison/tutor-personality-01.png")}

static func partner(turns: Array, index: int) -> String:
    for i in range(index,-1,-1):
        if turns[i].speaker != "나": return turns[i].speaker
    for row in turns:
        if row.speaker != "나": return row.speaker
    return "동료 학생"

static func add_portrait(parent: Node, identity: String, active: bool, node_name: String, reading_record: bool) -> void:
    var frame := PanelContainer.new()
    frame.custom_minimum_size.x = 280
    frame.theme_type_variation = "AcademyPanelEmphasis" if active else "AcademyPanel"
    parent.add_child(frame)
    var column := VBoxContainer.new()
    frame.add_child(column)
    var portrait := TextureRect.new()
    portrait.name = node_name
    portrait.texture = ART[identity]
    portrait.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
    portrait.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
    portrait.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
    portrait.size_flags_vertical = Control.SIZE_EXPAND_FILL
    portrait.mouse_filter = Control.MOUSE_FILTER_IGNORE
    portrait.modulate = Color.WHITE if active or reading_record else Color(0.68,0.68,0.74,1)
    column.add_child(portrait)
    var label := Label.new()
    label.text = identity + (" · 말하는 중" if active else "")
    label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    label.add_theme_font_size_override("font_size",20)
    column.add_child(label)

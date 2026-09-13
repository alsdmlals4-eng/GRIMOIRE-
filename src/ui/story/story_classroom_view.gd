extends RefCounted
## Temporary approved classroom composite, never a scene-independent background.
const PLATE = preload("res://output/imagegen/dialogue-stage-20260913/classroom-composition-candidate-01.png")
static func build(screen: Control, turns: Array) -> void:
    var art := TextureRect.new()
    art.name = "FullSceneIllustration"
    art.texture = PLATE
    art.texture_filter = CanvasItem.TEXTURE_FILTER_LINEAR
    art.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
    art.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
    art.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    art.mouse_filter = Control.MOUSE_FILTER_IGNORE
    screen.add_child(art)
    var menu := HBoxContainer.new()
    menu.set_anchors_and_offsets_preset(Control.PRESET_TOP_RIGHT)
    menu.position = Vector2(-150,16)
    screen.add_child(menu)
    if screen.pause_requested.has_connections(): screen._button(menu,"메뉴",func(): screen.pause_requested.emit())
    var overlay := MarginContainer.new()
    overlay.name = "BottomDialogue"
    overlay.anchor_left = 0.04
    overlay.anchor_right = 0.96
    overlay.anchor_top = 0.74 if not screen.records_open else 0.36
    overlay.anchor_bottom = 0.95
    screen.add_child(overlay)
    var body_parent: Node = overlay
    if screen.records_open:
        var panel := PanelContainer.new()
        panel.theme_type_variation = "AcademyPanelModal"
        overlay.add_child(panel)
        body_parent = panel
    var box := VBoxContainer.new()
    box.add_theme_constant_override("separation",4)
    body_parent.add_child(box)
    var speaker := Label.new()
    speaker.name = "Speaker"
    speaker.text = "수업 안내" if screen.records_open else turns[screen.dialogue_index].speaker
    speaker.add_theme_color_override("font_color",Color("e2bd68"))
    speaker.add_theme_font_size_override("font_size",24)
    box.add_child(speaker)
    var scroll := ScrollContainer.new()
    scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
    scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
    box.add_child(scroll)
    screen.story_copy = Label.new()
    screen.story_copy.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    screen.story_copy.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    screen.story_copy.text = screen._copy() if screen.records_open else turns[screen.dialogue_index].text
    screen.story_copy.add_theme_font_size_override("font_size",screen.Preferences.new().load_size(screen.save_folder))
    scroll.add_child(screen.story_copy)
    var buttons := HBoxContainer.new()
    box.add_child(buttons)
    if screen.records_open:
        screen._button(buttons,"대화로 돌아가기",screen.toggle_records)
    else:
        if screen.dialogue_index > 0: screen._button(buttons,"이전 대사",screen.previous_dialogue)
        screen._button(buttons,"안내 다시 읽기",screen.toggle_records)
        if screen.dialogue_index < turns.size()-1:
            screen._button(buttons,"다음 대사",screen.next_dialogue)
        else:
            screen._button(buttons,"첫 수업으로",screen.advance_story.bind(1))
    screen.dialogue_notice = Label.new()
    screen.dialogue_notice.text = screen.save_message
    screen.dialogue_notice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    # Save errors must remain visible without covering dialogue or character faces.
    screen.dialogue_notice.position = Vector2(24,16)
    screen.dialogue_notice.size.x = 980
    screen.add_child(screen.dialogue_notice)

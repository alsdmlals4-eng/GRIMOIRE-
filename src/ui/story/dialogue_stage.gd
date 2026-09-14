extends Control
## Presentation-only stage: no Flow, Store, resource costs or random state.
signal next_requested
signal previous_requested
signal records_requested
signal pause_requested
signal choice_requested(choice_id: String)
const Portraits = preload("res://src/ui/story/story_portraits.gd")
var body: Label
var speaker: Label
var notice: Label
var navigation: HFlowContainer
var choices: HFlowContainer
var scroll: ScrollContainer
var resolved_text := ""
var actors: HBoxContainer
var reading_records := false

func configure(options: Dictionary) -> void:
    resolved_text = options.get("text", "")
    reading_records = options.get("records", false)
    set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    mouse_filter = Control.MOUSE_FILTER_IGNORE
    var composite: Texture2D = options.get("composite")
    if composite != null:
        var background := TextureRect.new()
        background.name = "FullSceneIllustration"
        background.texture = composite
        background.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
        background.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
        background.mouse_filter = Control.MOUSE_FILTER_IGNORE
        background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
        add_child(background)
    else:
        var backdrop := Panel.new()
        backdrop.name = "UnillustratedBackdrop"
        backdrop.theme_type_variation = "AcademyPanel"
        backdrop.mouse_filter = Control.MOUSE_FILTER_IGNORE
        backdrop.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
        add_child(backdrop)
        var cast := HBoxContainer.new()
        actors = cast
        cast.name = "Actors"
        cast.anchor_left = 0.08
        cast.anchor_right = 0.92
        cast.anchor_top = 0.14
        cast.anchor_bottom = 0.69
        add_child(cast)
    var header := HBoxContainer.new()
    header.anchor_left = 0.04
    header.anchor_right = 0.96
    header.offset_top = 12
    add_child(header)
    var place := Label.new()
    place.text = options.get("title", "")
    place.add_theme_font_size_override("font_size",24)
    place.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    header.add_child(place)
    if options.get("menu", false):
        _button(header,"메뉴",func(): pause_requested.emit(),"MENU")
    var narration := Label.new()
    narration.name = "Narration"
    narration.text = options.get("narration", "")
    narration.anchor_left = 0.04
    narration.anchor_right = 0.96
    narration.offset_top = 64
    narration.add_theme_font_size_override("font_size",24)
    narration.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    add_child(narration)
    var panel := PanelContainer.new()
    panel.name = "BottomDialogue"
    panel.theme_type_variation = "AcademyPanelModal"
    panel.anchor_left = 0.04
    panel.anchor_right = 0.96
    panel.anchor_top = 0.36 if options.records else (0.72 if composite != null else 0.68)
    if not options.records and not options.choices.is_empty(): panel.anchor_top = 0.52
    if get_viewport_rect().size.y < 650:
        panel.anchor_top = 0.24 if options.records else (0.40 if not options.choices.is_empty() else 0.58)
    panel.anchor_bottom = 0.98
    add_child(panel)
    var column := VBoxContainer.new()
    column.add_theme_constant_override("separation",4)
    panel.add_child(column)
    speaker = Label.new()
    speaker.name = "Speaker"
    speaker.add_theme_color_override("font_color",Color("e2bd68"))
    speaker.add_theme_font_size_override("font_size",24)
    column.add_child(speaker)
    scroll = ScrollContainer.new()
    scroll.name = "BodyScroll"
    scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
    scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
    scroll.follow_focus = true
    column.add_child(scroll)
    body = Label.new()
    body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    scroll.add_child(body)
    navigation = HFlowContainer.new()
    navigation.name = "Navigation"
    column.add_child(navigation)
    choices = HFlowContainer.new()
    choices.name = "Choices"
    column.add_child(choices)
    if options.records:
        _button(navigation,"대화로 돌아가기",func(): records_requested.emit(),"RECORDS")
    else:
        if options.previous: _button(navigation,"이전 대사",func(): previous_requested.emit(),"PREVIOUS")
        _button(navigation,options.records_label,func(): records_requested.emit(),"RECORDS")
        if options.next: _button(navigation,"다음 대사",func(): next_requested.emit(),"NEXT")
        for choice in options.choices:
            var id: String = choice.id
            var button := _button(choices,choice.text,func(): choice_requested.emit(id),id)
            button.set_meta("story_mutation",choice.get("mutates",true))
            button.disabled = options.blocked and choice.get("mutates",true)
    notice = Label.new()
    notice.name = "DialogueNotice"
    notice.anchor_left = 0.04
    notice.anchor_right = 0.96
    notice.offset_top = 105
    notice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    add_child(notice)

func present(line: Resource, font_size: int) -> void:
    speaker.text = preload("res://src/ui/story/story_dialogue.gd").speaker_name(line.speaker_id)
    body.text = resolved_text
    body.add_theme_font_size_override("font_size",clampi(font_size,24,32))
    _present_actors(line)

func _present_actors(line: Resource) -> void:
    # Composite scenes remain intact until independent art is approved.
    if actors == null: return
    for child in actors.get_children():
        actors.remove_child(child)
        child.queue_free()
    var names := {"LEFT":"PlayerIllustration","CENTER":"CenterIllustration","RIGHT":"PartnerIllustration"}
    for slot in ["LEFT","CENTER","RIGHT"]:
        var identity: String = line.actor_slots.get(slot, "")
        if Portraits.ART.has(identity):
            # Only neutral originals are approved; absent expressions fall back here.
            Portraits.add_portrait(actors,identity,identity == line.speaker_id,names[slot],reading_records)
        if slot != "RIGHT":
            var gap := Control.new()
            gap.size_flags_horizontal = Control.SIZE_EXPAND_FILL
            actors.add_child(gap)

func show_records(text: String, caption: String) -> void:
    speaker.text = caption
    body.text = text

func set_notice(message: String) -> void:
    notice.text = message

func restore_focus(action_id: String) -> void:
    if action_id == "" or not is_inside_tree() or is_queued_for_deletion(): return
    var candidates := find_children("*","Button",true,false)
    for button in candidates:
        if not button.disabled and button.get_meta("dialogue_action","") == action_id:
            button.grab_focus()
            return
    for button in candidates:
        if not button.disabled:
            button.grab_focus()
            return

func _button(parent: Node, caption: String, callback: Callable, action_id: String) -> Button:
    var button := Button.new()
    button.text = caption
    button.set_meta("dialogue_action",action_id)
    button.custom_minimum_size.y = 52
    button.add_theme_font_size_override("font_size",24)
    button.pressed.connect(callback)
    parent.add_child(button)
    return button

extends Control
## Receives display snapshots only. No rules, save, cost or outcome callbacks.
const Art = preload("res://src/ui/shared_duel/spell_art.gd")
var manifestation: TextureRect
var circles: Array[TextureRect] = []
var caption: Label
var layer_count := 0
var spell_key := ""
var last_cast_key := ""
var cast_count := 0
var phase := "IDLE"
var reduced_motion := false
var motion: Tween

func _ready() -> void:
    custom_minimum_size = Vector2(250,116)
    mouse_filter = Control.MOUSE_FILTER_IGNORE
    clip_contents = true
    for i in range(2):
        var circle := _image(Art.CIRCLE,Vector2(55,17-i*16),Vector2(148,108))
        circle.name = "Circle" + str(i+1)
        circle.pivot_offset = circle.size / 2.0
        circle.modulate = Color(0.6,0.85,1.0,0.55) if i else Color(1,0.85,0.5,0.7)
        circles.append(circle)
    manifestation = _image(null,Vector2(83,0),Vector2(92,94))
    manifestation.name = "Manifestation"
    manifestation.pivot_offset = manifestation.size / 2.0
    caption = Label.new()
    caption.position = Vector2(0,92)
    caption.size = Vector2(250,24)
    caption.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    caption.add_theme_font_size_override("font_size",16)
    caption.mouse_filter = Control.MOUSE_FILTER_IGNORE
    add_child(caption)
    _hide_visuals()

func _image(texture: Texture2D, at: Vector2, dimensions: Vector2) -> TextureRect:
    var image := TextureRect.new()
    image.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
    image.texture = texture
    image.position = at
    image.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
    image.size = dimensions
    image.mouse_filter = Control.MOUSE_FILTER_IGNORE
    add_child(image)
    return image

func _key(glyphs: Array) -> String:
    var sorted := PackedStringArray(glyphs)
    sorted.sort()
    return "+".join(sorted)

func prepare(glyphs: Array) -> void:
    var key := _key(glyphs)
    if key == spell_key and phase in ["PREPARED","IDLE"]: return
    _stop_motion()
    spell_key = key
    layer_count = glyphs.size() if Art.texture_for(key) != null else 0
    if layer_count == 0:
        phase = "RELEASING"
        caption.text = ""
        if reduced_motion:
            _hide_visuals()
        else:
            motion = create_tween().set_parallel(true)
            motion.tween_property(manifestation,"modulate:a",0.0,0.2)
            for ring in circles:
                motion.tween_property(ring,"modulate:a",0.0,0.2)
            motion.chain().tween_callback(_hide_visuals)
        return
    phase = "PREPARED"
    _show_spell(key,layer_count)
    caption.text = "써클 %d겹 · 주문 준비" % layer_count
    if not reduced_motion:
        manifestation.scale = Vector2(0.65,0.65)
        manifestation.modulate.a = 0.25
        motion = create_tween().set_parallel(true)
        motion.tween_property(manifestation,"scale",Vector2.ONE,0.3).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
        motion.tween_property(manifestation,"modulate:a",1.0,0.28)
        for i in range(layer_count):
            var ring := circles[i]
            ring.rotation = -0.28 if i == 0 else 0.42
            ring.scale = Vector2(0.78,0.35)
            ring.modulate.a = 0.0
            motion.tween_property(ring,"rotation",0.0 if i == 0 else 0.26,0.42).set_delay(i * 0.12)
            motion.tween_property(ring,"scale",Vector2(1.0,0.68),0.42).set_delay(i * 0.12)
            motion.tween_property(ring,"modulate:a",0.65,0.32).set_delay(i * 0.12)

func _show_spell(key: String, count: int) -> void:
    manifestation.texture = Art.texture_for(key)
    manifestation.visible = true
    manifestation.modulate = Color.WHITE
    manifestation.scale = Vector2.ONE
    manifestation.position = Vector2(83,0)
    for i in range(2):
        circles[i].visible = i < count
        circles[i].scale = Vector2(1.0,0.68)
        circles[i].rotation = 0.0 if i == 0 else 0.26
        circles[i].modulate.a = 0.65

func play_cast(glyphs: Array, spell_name: String) -> void:
    var key := _key(glyphs)
    if Art.texture_for(key) == null: return
    _stop_motion()
    cast_count += 1
    last_cast_key = key
    spell_key = ""
    layer_count = 0
    phase = "CASTING"
    _show_spell(key,glyphs.size())
    caption.text = spell_name + " · 시전됨"
    if reduced_motion:
        # Keep a static receipt until next preparation, never schedule game work.
        phase = "RECEIPT"
        return
    motion = create_tween()
    motion.tween_property(manifestation,"scale",Vector2(0.8,0.8),0.1)
    motion.tween_property(manifestation,"scale",Vector2(1.35,1.35),0.22).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
    motion.parallel().tween_property(manifestation,"position",Vector2(119,-6),0.22)
    for ring in circles:
        motion.parallel().tween_property(ring,"scale",Vector2(1.35,0.8),0.22)
        motion.parallel().tween_property(ring,"modulate:a",0.0,0.3)
    motion.tween_property(manifestation,"modulate:a",0.0,0.25)
    motion.tween_callback(_hide_visuals)

func set_reduced_motion(enabled: bool) -> void:
    reduced_motion = enabled
    _stop_motion()
    if phase == "PREPARED":
        _show_spell(spell_key,layer_count)
    elif phase != "IDLE":
        _hide_visuals()

func _stop_motion() -> void:
    if motion != null: motion.kill()
    motion = null

func _hide_visuals() -> void:
    manifestation.visible = false
    for ring in circles: ring.visible = false
    caption.text = ""
    phase = "IDLE"

func _exit_tree() -> void:
    _stop_motion()

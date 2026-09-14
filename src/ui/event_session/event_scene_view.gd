extends HFlowContainer
## Object inspection/selection only. No rules, preview application or save writes.
signal target_requested(target_id: String)
signal destination_requested(destination_id: String)
var buttons: Dictionary = {}

func _init() -> void:
    name = "EventSceneView"
    size_flags_horizontal = Control.SIZE_EXPAND_FILL
    add_theme_constant_override("h_separation",8)
    add_theme_constant_override("v_separation",8)

func present(session: Dictionary, target_id: String = "", destination_id: String = "") -> void:
    var objects: Dictionary = session.spell_state.objects
    for id in buttons.keys():
        if not objects.has(id):
            var obsolete: Button = buttons[id]
            remove_child(obsolete)
            obsolete.queue_free()
            buttons.erase(id)
    for id in objects:
        var object: Dictionary = objects[id]
        if not buttons.has(id):
            var button := Button.new()
            button.name = "Object_" + id
            button.custom_minimum_size = Vector2(210,110)
            button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
            button.toggle_mode = true
            button.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
            button.add_theme_font_size_override("font_size",20)
            button.pressed.connect(_request.bind(id))
            add_child(button)
            buttons[id] = button
        var button: Button = buttons[id]
        var destination: bool = object.has("capture_capacity")
        button.set_meta("destination",destination)
        button.set_meta("object_id",id)
        var chosen: bool = id == (destination_id if destination else target_id)
        button.set_pressed_no_signal(chosen)
        button.disabled = session.outcome != "ONGOING"
        var role := "목적지" if destination else "대상"
        button.text = ("✓ " if chosen else "") + role + " · " + object.label
        button.text += "\n" + _state_text(object,session.spell_state.elapsed_actions)

func _request(id: String) -> void:
    if not buttons.has(id) or buttons[id].disabled: return
    if buttons[id].get_meta("destination"):
        destination_requested.emit(id)
    else:
        target_requested.emit(id)

func _state_text(object: Dictionary, actions: int) -> String:
    var parts: Array[String] = []
    var temperatures := {"cold":"차가움","warm":"따뜻함","hot":"뜨거움","overheated":"과열"}
    if object.has("temperature"): parts.append(temperatures.get(object.temperature,"온도 미확인"))
    if object.has("closed"):
        if object.id == "device": parts.append("정지" if object.closed else "가동")
        else: parts.append("닫힘" if object.closed else "열림")
    if object.has("empty"): parts.append("잔여물 없음" if object.empty else "잔여물 있음")
    if object.has("damaged") or object.get("heat_sensitive",false):
        parts.append("손상됨" if object.get("damaged",false) else "온전함")
    if object.has("location_id"):
        var places := {"device":"장치 내부","safe":"안전 용기","floor":"바닥","stage":"무대","audience":"관객 방향"}
        parts.append(places.get(object.location_id,"위치 미확인"))
    if object.has("capture_capacity"):
        parts.append("수용 %d / %d" % [object.capture_load,object.capture_capacity])
    var effects: Dictionary = object.get("effects",{})
    var remaining := maxi(int(effects.get("blocked",0)),int(effects.get("leak_suppressed",0))) - actions
    if remaining > 0: parts.append("임시 보호 %d행동" % remaining)
    return " · ".join(parts)

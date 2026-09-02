class_name DuelPracticumRoot
extends StoryEventRoot

func _ready() -> void:
    theme = ThemeFactory.create_theme()
    if _story_progress == null and is_inside_tree() and get_tree() != null:
        configure(StoryProgress.consume_duel_practicum_handoff(get_tree().root))
    _ensure_runtime()
    _render_clock_state()
    _connect_controls()
    _render_flow_state()


func continue_to_duel_practicum() -> Dictionary:
    if not _has_first_event_progress():
        return {"status": &"DUEL_PRACTICUM_PROGRESS_REQUIRED"}
    if not _prepared_action_consumed:
        return {"status": &"DUEL_PRACTICUM_UNRESOLVED"}
    return _story_progress.advance_from_duel_practicum()


func handoff_festival_canopy(handoff_owner: Node) -> Dictionary:
    var continuation := continue_to_duel_practicum()
    if StringName(continuation.get("status", &"")) != &"FESTIVAL_CANOPY_ROUTE":
        return continuation
    return StoryProgress.stage_festival_canopy_handoff(continuation.get("progress", null), handoff_owner)


func _on_continue_to_duel_pressed() -> void:
    var handoff_owner: Node = get_tree().root if get_tree() != null else null
    var continuation := handoff_festival_canopy(handoff_owner)
    if StringName(continuation.get("status", &"")) != &"FESTIVAL_CANOPY_HANDOFF_READY":
        return
    var route_path := String(continuation.get("route_path", ""))
    duel_practicum_route_requested.emit(_story_progress, route_path)
    if ResourceLoader.exists(route_path) and get_tree() != null:
        get_tree().change_scene_to_file(route_path)


func _is_first_event_progress(progress) -> bool:
    return progress != null and progress.has_method("current_beat") and progress.call("current_beat") == StoryProgress.DUEL_PRACTICUM


func _event_resource_path() -> String:
    return "res://data/events/duel/duel_practicum_event_01.tres"


func _allowed_glyph_ids() -> Array[StringName]:
    return [&"PROTECT", &"FLOW"]


func _event_target_id() -> StringName:
    return &"DUEL_WARD"


func _prepared_action_prefix() -> String:
    return "duel-action"


func _writing_hint() -> String:
    return "동료의 수호 결계를 다룰 글자를 허공에 새기세요. 인식 뒤에도 직접 사용을 확정해야 합니다."

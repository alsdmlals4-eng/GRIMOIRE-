# 사건 맥락을 유지하며 인식된 문양만 기존 예약 경로로 저장하는 작성 화면이다.
class_name GlyphDrawingScreen
extends Control

const GlyphVisualResolver = preload("res://src/ui/spell_workflow/glyph_visual_resolver.gd")

signal glyph_saved(glyph_id: StringName)
signal open_incident_requested
signal continue_requested

var _incident: Dictionary = {}
var _recognition_service = null
var _scribe_coordinator = null
var _view_model = null
var _workflow_context: Dictionary = {}
var _workflow_state = null
var _input_revision := 0
var _accepted_candidate = null
var _terminal_save_result: Dictionary = {}


func _ready() -> void:
    _connect_button("RetryButton", retry_recognition)
    _connect_button("SaveButton", save_accepted_candidate)
    _connect_button("IncidentButton", open_incident)
    _connect_button("ContinueButton", continue_workflow)
    var incident_status_card = get_node_or_null(NodePath("IncidentStatusCard"))
    if incident_status_card != null and not incident_status_card.gui_input.is_connected(_on_incident_status_input):
        incident_status_card.gui_input.connect(_on_incident_status_input)
    var overlay = get_node_or_null(NodePath("IncidentExplanationOverlay"))
    if overlay != null:
        overlay.visible = false
        if overlay.has_signal("closed") and not overlay.closed.is_connected(_restore_overlay_context):
            overlay.closed.connect(_restore_overlay_context)


func configure(
    incident: Dictionary,
    recognition_service,
    scribe_coordinator,
    view_model,
    workflow_context: Dictionary = {},
    input_revision: int = 0
) -> void:
    _incident = incident.duplicate(true)
    _recognition_service = recognition_service
    _scribe_coordinator = scribe_coordinator
    _view_model = view_model
    _workflow_state = workflow_context.get("workflow_state", null)
    _workflow_context = workflow_context.duplicate(true)
    _workflow_context.erase("workflow_state")
    _input_revision = maxi(input_revision, 0)
    var status_card = get_node_or_null(NodePath("IncidentStatusCard"))
    if status_card != null and status_card.has_method("bind_incident"):
        status_card.bind_incident(_incident)


func submit_strokes(strokes: Array) -> Dictionary:
    _accepted_candidate = null
    if _recognition_service == null or not _recognition_service.has_method("recognize"):
        return _show_recognition({"status": &"NO_VALID_INPUT", "candidates": []}, strokes.size())
    var result: Dictionary = _recognition_service.recognize(strokes, _input_revision)
    return _show_recognition(result, strokes.size())


func set_input_revision(input_revision: int) -> void:
    _input_revision = maxi(input_revision, 0)
    _accepted_candidate = null


func select_candidate(candidate) -> Dictionary:
    if candidate == null:
        return {"status": &"NO_VALID_INPUT"}
    _accepted_candidate = candidate
    return {"status": &"CANDIDATE_SELECTED", "input_revision": _input_revision}


func save_accepted_candidate() -> Dictionary:
    if not _terminal_save_result.is_empty():
        return _terminal_save_result.duplicate(true)
    if _scribe_coordinator == null or not _scribe_coordinator.has_method("accept_candidate"):
        return {"status": &"INVALID_SCRIBE_RESERVATION"}
    if _accepted_candidate == null:
        return {"status": &"NO_VALID_INPUT"}

    var result: Dictionary = _scribe_coordinator.accept_candidate(_accepted_candidate, _input_revision)
    if result.get("status", &"") == &"VAULT_GLYPH_CREATED":
        _terminal_save_result = result.duplicate(true)
        glyph_saved.emit(StringName(_terminal_save_result.get("glyph_id", &"")))
    return result.duplicate(true)


func retry_recognition() -> void:
    _accepted_candidate = null
    _set_recognition_text("다시 그려 주세요. 아직 보관함에는 저장되지 않았습니다.")


func cancel_scribing() -> Dictionary:
    if _scribe_coordinator == null or not _scribe_coordinator.has_method("interrupt"):
        return {"status": &"INVALID_SCRIBE_RESERVATION"}
    return Dictionary(_scribe_coordinator.interrupt(&"CANCELLED")).duplicate(true)


func open_incident() -> void:
    var overlay = get_node_or_null(NodePath("IncidentExplanationOverlay"))
    if overlay != null and overlay.has_method("present"):
        overlay.present(_incident, _capture_overlay_context())
    open_incident_requested.emit()


func continue_workflow() -> void:
    continue_requested.emit()


func _on_incident_status_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        open_incident()
    elif event is InputEventScreenTouch and event.pressed:
        open_incident()


func _capture_overlay_context() -> Dictionary:
    var snapshot = _workflow_context.duplicate(true)
    snapshot["selected_glyph_id"] = _selected_glyph_id()
    snapshot["stroke_revision"] = _input_revision
    if _workflow_state != null and _workflow_state.has_method("current_state"):
        snapshot["current_state"] = _workflow_state.current_state()
    if not snapshot.has("active_reservations"):
        snapshot["active_reservations"] = []
    var focus_owner = get_viewport().gui_get_focus_owner()
    if focus_owner != null and is_ancestor_of(focus_owner):
        snapshot["focus_owner_path"] = String(get_path_to(focus_owner))
    return snapshot


func _restore_overlay_context(return_context: Dictionary) -> void:
    _workflow_context = return_context.duplicate(true)
    _input_revision = maxi(int(return_context.get("stroke_revision", _input_revision)), 0)
    var focus_path := NodePath(String(return_context.get("focus_owner_path", "")))
    var focus_owner = get_node_or_null(focus_path)
    if focus_owner != null and focus_owner.has_method("grab_focus"):
        focus_owner.grab_focus()


func _show_recognition(result: Dictionary, stroke_count: int) -> Dictionary:
    var view = result.duplicate(true)
    if _view_model != null and _view_model.has_method("from_result"):
        view = _view_model.from_result(result, _selected_glyph_id(), stroke_count)
    _set_recognition_text(String(view.get("primary_text", result.get("status", "NO_VALID_INPUT"))))
    _bind_recognition_glyph(_selected_glyph_id())
    return result.duplicate(true)


func _selected_glyph_id() -> StringName:
    if _scribe_coordinator != null and _scribe_coordinator.has_method("selected_glyph_id"):
        return StringName(_scribe_coordinator.selected_glyph_id())
    return &""


func _set_recognition_text(message: String) -> void:
    var label = get_node_or_null(NodePath("RecognitionPanel/Content/Message"))
    if label != null:
        label.text = message


func _bind_recognition_glyph(glyph_id: StringName) -> void:
    var preview = get_node_or_null(NodePath("RecognitionPanel/Content/GlyphPreview")) as TextureRect
    var name_label = get_node_or_null(NodePath("RecognitionPanel/Content/GlyphNameLabel")) as Label
    if preview != null:
        preview.texture = GlyphVisualResolver.texture_for(glyph_id)
    if name_label != null:
        name_label.text = GlyphVisualResolver.korean_name_for(glyph_id)
        name_label.visible = not name_label.text.is_empty()


func _connect_button(path: String, callback: Callable) -> void:
    var button = get_node_or_null(NodePath(path))
    if button != null and not button.pressed.is_connected(callback):
        button.pressed.connect(callback)

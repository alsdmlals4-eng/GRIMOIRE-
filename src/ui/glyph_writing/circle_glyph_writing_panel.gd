# 새 서클 주문과 사건 장면에서 쓰는 역할 없는 직접 글자 작성 입력이다.
class_name CircleGlyphWritingPanel
extends VBoxContainer

const GlyphCatalog = preload("res://src/core/glyphs/glyph_catalog.gd")
const GlyphRecognitionService = preload("res://src/input/glyph_recognition_service.gd")
const GlyphTemplateRepository = preload("res://src/input/glyph_template_repository.gd")

const VOCABULARY_PATH := "res://data/glyphs/v1/glyph_vocabulary_v1.json"
const TEMPLATE_DIRECTORY := "res://data/glyphs/v1/slice_templates"
const MAX_CANDIDATE_BUTTONS := 3

signal glyph_accepted(glyph_id: StringName)

var _allowed_glyph_ids: Array[StringName] = []
var _reference_glyph_ids: Array[StringName] = []
var _template_repository = null
var _recognition_service = null
var _input_revision := 0
var _latest_candidates: Array = []
var _selected_candidate = null
var _accepted_current_input := false


func _ready() -> void:
    _connect_button(&"WritingActions/RecognizeButton", _submit_canvas_strokes)
    _connect_button(&"WritingActions/ClearCanvasButton", clear_strokes)
    _connect_button(&"CandidateActions/UseCandidateButton", accept_selected_candidate)
    for index in MAX_CANDIDATE_BUTTONS:
        var button := get_node_or_null(NodePath("CandidateActions/Candidate%dButton" % index)) as Button
        if button != null:
            button.pressed.connect(_select_option_from_button.bind(index))
    _render_state(&"획을 직접 그린 뒤 인식해 보세요.")


func configure_allowed_glyphs(glyph_ids: Array) -> void:
    _allowed_glyph_ids.clear()
    for glyph_id in glyph_ids:
        var normalized_id := GlyphCatalog.normalize_id(glyph_id)
        if GlyphCatalog.metadata(normalized_id).is_empty() or _allowed_glyph_ids.has(normalized_id):
            continue
        _allowed_glyph_ids.append(normalized_id)
    _latest_candidates.clear()
    _selected_candidate = null
    _accepted_current_input = false
    _refresh_reference_glyphs()
    if _reference_glyph_ids.is_empty():
        _render_state(&"학습한 글자를 직접 새기세요.")
    else:
        _select_reference_glyph(0)


func configure_context_hint(hint: String) -> void:
    var hint_label := get_node_or_null(NodePath("Hint")) as Label
    if hint_label != null and not hint.is_empty():
        hint_label.text = hint


func submit_strokes(strokes: Array) -> Dictionary:
    _input_revision += 1
    _latest_candidates.clear()
    _selected_candidate = null
    _accepted_current_input = false
    if _allowed_glyph_ids.is_empty():
        _render_state(&"이 사건에서 쓸 수 있는 글자가 아직 없습니다.")
        return {"status": &"NO_EVENT_GLYPHS"}
    if strokes.is_empty():
        _render_state(&"획이 아직 없습니다. 아래 도안을 보고 화면에 직접 그려 주세요.")
        return {"status": &"NO_STROKES_CAPTURED"}
    if not _ensure_recognition_service():
        _render_state(&"글자 인식 준비에 실패했습니다.")
        return {"status": &"RECOGNITION_UNAVAILABLE"}

    var recognition: Dictionary = _recognition_service.recognize(strokes, _input_revision)
    var recognition_status := StringName(recognition.get("status", &""))
    if recognition_status == &"NO_VALID_INPUT":
        _render_state(&"획의 시작과 끝을 읽지 못했습니다. 도안을 보고 한 획씩 다시 그려 주세요.")
        return _recovery_result(recognition, recognition_status)
    if recognition_status == &"LOW_CONFIDENCE_REQUIRES_RETRY":
        _render_state(&"도안과 획 모양이 충분히 닿지 않았습니다. 획을 지운 뒤 안내선을 따라 다시 그려 주세요.")
        return _recovery_result(recognition, recognition_status)
    var allowed_candidates: Array = []
    for candidate in Array(recognition.get("candidates", [])):
        var glyph_id := _candidate_glyph_id(candidate)
        if not glyph_id.is_empty() and _allowed_glyph_ids.has(glyph_id):
            allowed_candidates.append(candidate)
    _latest_candidates = allowed_candidates
    if _latest_candidates.is_empty():
        _render_state(&"인식한 글자가 이 사건에서 아직 허용되지 않습니다. 도안 버튼을 고른 뒤 다시 그려 주세요.")
        return {
            "status": &"GLYPH_NOT_AVAILABLE_IN_EVENT",
            "candidates": [],
            "input_revision": _input_revision,
        }

    var result := recognition.duplicate(true)
    result["candidates"] = _latest_candidates.duplicate()
    if recognition_status == &"AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION":
        _render_state(&"후보 중 하나를 선택한 뒤 글자로 사용하세요.")
    else:
        _render_state(&"인식 후보를 확인하고 글자로 사용하세요.")
    return result


func select_candidate(index: int) -> Dictionary:
    if index < 0 or index >= _latest_candidates.size():
        return {"status": &"CANDIDATE_UNAVAILABLE"}
    _selected_candidate = _latest_candidates[index]
    _render_state("%s 글자를 선택했습니다. 사용을 눌러 서클에 넣으세요." % _glyph_name(_candidate_glyph_id(_selected_candidate)))
    return {
        "status": &"CANDIDATE_SELECTED",
        "glyph_id": _candidate_glyph_id(_selected_candidate),
        "input_revision": _input_revision,
    }


func accept_selected_candidate() -> Dictionary:
    if _accepted_current_input:
        return {"status": &"GLYPH_ALREADY_ACCEPTED"}
    if _selected_candidate == null:
        return {"status": &"CANDIDATE_SELECTION_REQUIRED"}
    if not _ensure_recognition_service():
        return {"status": &"RECOGNITION_UNAVAILABLE"}
    var acceptance: Dictionary = _recognition_service.accept(_selected_candidate, _input_revision)
    if StringName(acceptance.get("status", &"")) != &"ACCEPTED":
        return acceptance
    var glyph_id := GlyphCatalog.normalize_id(StringName(acceptance.get("glyph_id", &"")))
    if glyph_id.is_empty() or not _allowed_glyph_ids.has(glyph_id):
        return {"status": &"GLYPH_NOT_AVAILABLE_IN_EVENT"}
    _accepted_current_input = true
    glyph_accepted.emit(glyph_id)
    _render_state("%s 글자를 서클에 넣었습니다. 필요하면 다음 글자를 직접 쓰세요." % _glyph_name(glyph_id))
    return {
        "status": &"GLYPH_ACCEPTED",
        "glyph_id": glyph_id,
        "input_revision": _input_revision,
    }


func clear_strokes() -> void:
    _input_revision += 1
    _latest_candidates.clear()
    _selected_candidate = null
    _accepted_current_input = false
    var canvas = get_node_or_null(NodePath("WritingSurface/StrokeCanvas"))
    if canvas != null and canvas.has_method("clear_strokes"):
        canvas.clear_strokes()
    _render_state(&"획을 지웠습니다. 새 글자를 직접 그려 주세요.")


func _submit_canvas_strokes() -> void:
    var canvas = get_node_or_null(NodePath("WritingSurface/StrokeCanvas"))
    if canvas == null or not canvas.has_method("submit_collected_strokes"):
        return
    var strokes: Array = canvas.submit_collected_strokes()
    submit_strokes(strokes)


func _select_option_from_button(index: int) -> void:
    if _latest_candidates.is_empty():
        _select_reference_glyph(index)
    else:
        select_candidate(index)


func _ensure_recognition_service() -> bool:
    if _recognition_service != null:
        return true
    if not _ensure_template_repository():
        return false
    _recognition_service = GlyphRecognitionService.new(_template_repository, 0.80, 0.10)
    return _recognition_service.configuration_status() == &"OK"


func _ensure_template_repository() -> bool:
    if _template_repository != null:
        return true
    var repository_result: Dictionary = GlyphTemplateRepository.load_from_paths(VOCABULARY_PATH, TEMPLATE_DIRECTORY)
    if StringName(repository_result.get("status", &"")) != &"OK":
        return false
    _template_repository = repository_result.get("value")
    return _template_repository != null


func _refresh_reference_glyphs() -> void:
    _reference_glyph_ids.clear()
    var canvas = get_node_or_null(NodePath("WritingSurface/StrokeCanvas"))
    if not _ensure_template_repository():
        if canvas != null and canvas.has_method("clear_reference"):
            canvas.clear_reference()
        return
    for glyph_id in _allowed_glyph_ids:
        if not _template_repository.templates(glyph_id).is_empty():
            _reference_glyph_ids.append(glyph_id)
    if canvas != null and canvas.has_method("clear_reference"):
        canvas.clear_reference()


func _select_reference_glyph(index: int) -> void:
    if index < 0 or index >= _reference_glyph_ids.size() or not _ensure_template_repository():
        return
    var glyph_id := _reference_glyph_ids[index]
    var templates: Array = _template_repository.templates(glyph_id)
    if templates.is_empty():
        return
    var canvas = get_node_or_null(NodePath("WritingSurface/StrokeCanvas"))
    if canvas == null or not canvas.has_method("configure_reference"):
        return
    canvas.configure_reference(glyph_id, Array((templates[0] as Dictionary).get("strokes", [])))
    _render_state("%s 도안을 보고, 빛나는 안내선을 따라 직접 그려 보세요." % _glyph_name(glyph_id))


func _recovery_result(recognition: Dictionary, status: StringName) -> Dictionary:
    var result := recognition.duplicate(true)
    result["status"] = status
    result["candidates"] = []
    return result


func _render_state(message: String) -> void:
    var message_label := get_node_or_null(NodePath("RecognitionMessage")) as Label
    if message_label != null:
        message_label.text = message
    var show_candidates := not _latest_candidates.is_empty()
    for index in MAX_CANDIDATE_BUTTONS:
        var button := get_node_or_null(NodePath("CandidateActions/Candidate%dButton" % index)) as Button
        if button == null:
            continue
        button.visible = index < (_latest_candidates.size() if show_candidates else _reference_glyph_ids.size())
        if button.visible:
            if show_candidates:
                button.text = "%s 후보" % _glyph_name(_candidate_glyph_id(_latest_candidates[index]))
            else:
                button.text = "도안: %s" % _glyph_name(_reference_glyph_ids[index])
    var use_button := get_node_or_null(NodePath("CandidateActions/UseCandidateButton")) as Button
    if use_button != null:
        use_button.visible = show_candidates
        use_button.disabled = _selected_candidate == null or _accepted_current_input


func _candidate_glyph_id(candidate) -> StringName:
    if candidate == null or not candidate.has_method("glyph_id"):
        return &""
    return GlyphCatalog.normalize_id(StringName(candidate.glyph_id()))


func _glyph_name(glyph_id: StringName) -> String:
    return String(GlyphCatalog.metadata(glyph_id).get("name", glyph_id))


func _connect_button(node_path: StringName, callback: Callable) -> void:
    var button := get_node_or_null(NodePath(node_path)) as Button
    if button != null and not button.pressed.is_connected(callback):
        button.pressed.connect(callback)

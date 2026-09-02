class_name GlyphWritingViewModel
extends RefCounted

const GlyphCatalog = preload("res://src/core/glyphs/glyph_catalog.gd")

const METHOD_LABELS := {
    &"INTENSIFY": "강화",
    &"REDIRECT": "전환",
    &"WARD": "보호막",
    &"TEMPER": "온도 조절",
    &"REPAIR": "수복",
    &"FOCUS": "집중",
    &"SCATTER": "분산",
    &"ANCHOR": "고정",
    &"SUSTAIN": "지속",
    &"AMPLIFY": "증폭",
}


static func from_result(result: Dictionary, selected_glyph_id: StringName, stroke_count: int) -> Dictionary:
    var normalized_selected_id := GlyphCatalog.normalize_id(selected_glyph_id)
    var selected_meta := _metadata(normalized_selected_id)
    var model := {
        "title": "입력 상태를 확인하세요",
        "detail": "문양 입력을 다시 확인합니다",
        "primary_action_label": "다시 그리기",
        "primary_action": &"RETRY",
        "secondary_action_label": "취소",
        "secondary_action": &"CANCEL",
        "status_icon_key": &"STATUS_RETRY",
        "selected_glyph_label": "선택: %s" % selected_meta.get("name", ""),
        "selected_glyph_id": normalized_selected_id,
        "selected_shape_key": selected_meta.get("shape_key", &"GLYPH_UNKNOWN"),
        "stroke_count_label": "획 %d/3" % clampi(stroke_count, 0, 3),
        "candidate_buttons": [],
        "input_revision": int(result.get("input_revision", -1)),
    }

    var status := StringName(result.get("status", &""))
    match status:
        &"LOW_CONFIDENCE_REQUIRES_RETRY", &"NO_VALID_INPUT":
            model.title = "문양을 확인하지 못했습니다"
            model.detail = "선을 지우거나 다시 그려 주세요"
            model.status_icon_key = &"STATUS_RETRY"
        &"AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION":
            model.title = "비슷한 글자가 있습니다"
            model.detail = "의도한 글자를 직접 선택하세요"
            model.primary_action_label = "후보 선택"
            model.primary_action = &"SELECT_CANDIDATE"
            model.status_icon_key = &"STATUS_AMBIGUOUS"
            model.candidate_buttons = _candidate_buttons(result.get("candidates", []))
        &"STALE_RECOGNITION_RESULT":
            model.title = "입력이 변경되었습니다"
            model.detail = "현재 선으로 다시 확인합니다"
            model.status_icon_key = &"STATUS_STALE"
        &"RECOGNIZED_GLYPH_DOES_NOT_MATCH_SELECTED":
            model.title = "선택한 글자와 다릅니다"
            model.detail = "선택한 글자를 다시 그려 주세요"
            model.status_icon_key = &"STATUS_MISMATCH"
        &"CANDIDATE_READY", &"ACCEPTED":
            model.title = "%s 글자를 확인했습니다" % selected_meta.get("name", "")
            model.detail = "확정하기 전 선택을 확인하세요"
            model.primary_action_label = "확정"
            model.primary_action = &"CONFIRM"
            model.status_icon_key = &"STATUS_CANDIDATE"
            model.candidate_buttons = _candidate_buttons(result.get("candidates", []))
        &"VAULT_GLYPH_CREATED":
            model.title = "보관함에 %s 글자를 저장했습니다" % selected_meta.get("name", "")
            model.detail = "정확한 글자 슬롯에 저장되었습니다"
            model.primary_action_label = "확인"
            model.primary_action = &"CONFIRM"
            model.status_icon_key = &"STATUS_SUCCESS"
        &"SCRIBE_INTERRUPTED":
            model.title = "필사가 중단되었습니다"
            model.detail = "안전한 상태에서 다시 시도하세요"
            model.status_icon_key = &"STATUS_INTERRUPTED"
        _:
            pass

    return model.duplicate(true)


static func _candidate_buttons(candidates: Array) -> Array[Dictionary]:
    var buttons: Array[Dictionary] = []
    for candidate in candidates:
        if candidate == null or not candidate.has_method("glyph_id"):
            continue
        var glyph_id := GlyphCatalog.normalize_id(candidate.glyph_id())
        var meta := _metadata(glyph_id)
        var meaning_tags: Array = Array(meta.get("meaning_tags", [])).duplicate()
        var method_tags: Array = Array(meta.get("method_tags", [])).duplicate()
        buttons.append({
            "glyph_id": glyph_id,
            "label": "%s · %s" % [meta.get("name", ""), _method_label(method_tags)],
            "shape_key": meta.get("shape_key", &"GLYPH_UNKNOWN"),
            "meaning_tags": meaning_tags,
            "method_tags": method_tags,
            "input_revision": int(candidate.input_revision()),
        })
    return buttons


static func _metadata(glyph_id: StringName) -> Dictionary:
    var meta := GlyphCatalog.metadata(glyph_id)
    if not meta.is_empty():
        return meta
    return {
        "name": String(glyph_id),
        "meaning_tags": [],
        "method_tags": [],
        "shape_key": &"GLYPH_UNKNOWN",
    }


static func _method_label(method_tags: Array) -> String:
    if method_tags.is_empty():
        return "방법 확인"
    return String(METHOD_LABELS.get(StringName(method_tags[0]), "방법 확인"))

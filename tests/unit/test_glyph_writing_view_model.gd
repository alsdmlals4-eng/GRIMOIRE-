extends RefCounted

const VIEW_MODEL_PATH := "res://src/ui/glyph_writing_view_model.gd"
const CANDIDATE_PATH := "res://src/input/recognition_candidate.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(VIEW_MODEL_PATH), "glyph_writing_view_model.gd must exist")
    if not FileAccess.file_exists(VIEW_MODEL_PATH):
        return
    var view_model_script = load(VIEW_MODEL_PATH)
    case.assert_true(view_model_script != null and view_model_script.can_instantiate(), "GlyphWritingViewModel compiles")
    if view_model_script == null or not view_model_script.can_instantiate():
        return

    var low: Dictionary = view_model_script.from_result({
        "status": &"LOW_CONFIDENCE_REQUIRES_RETRY",
        "candidates": [],
        "input_revision": 5,
    }, &"HEAT", 2)
    case.assert_equal("문양을 확인하지 못했습니다", low.title, "failure is explained")
    case.assert_equal("다시 그리기", low.primary_action_label, "retry path is explicit")
    case.assert_equal(&"RETRY", low.primary_action, "retry action is semantic")
    case.assert_true(low.has("status_icon_key"), "status is not color-only")
    case.assert_equal("선택: 열", low.selected_glyph_label, "selected exact glyph remains visible")
    case.assert_equal("획 2/3", low.stroke_count_label, "stroke count is textual")

    var candidate_script = load(CANDIDATE_PATH)
    var heat = candidate_script.create(&"HEAT", 0.91, 0.1, &"heat-01", 6).value
    var flow = candidate_script.create(&"FLOW", 0.87, 0.2, &"flow-01", 6).value
    var ambiguous: Dictionary = view_model_script.from_result({
        "status": &"AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION",
        "candidates": [heat, flow],
        "input_revision": 6,
    }, &"HEAT", 2)
    case.assert_equal(&"SELECT_CANDIDATE", ambiguous.primary_action, "ambiguous state requires explicit selection")
    case.assert_equal(2, ambiguous.candidate_buttons.size(), "ambiguous state exposes candidate buttons")
    for button in ambiguous.candidate_buttons:
        case.assert_true(not String(button.label).is_empty(), "candidate label is non-empty")
        case.assert_true(String(button.label).contains("·"), "candidate label includes Korean name and role")
        case.assert_true(button.has("shape_key"), "candidate button is not color-only")
        case.assert_true(button.has("glyph_id"), "candidate button carries semantic glyph id")
        case.assert_false(String(button.label).contains("%"), "numeric success probability is not shown")

    var stale: Dictionary = view_model_script.from_result({
        "status": &"STALE_RECOGNITION_RESULT",
        "candidates": [heat],
        "input_revision": 6,
    }, &"HEAT", 2)
    case.assert_equal("입력이 변경되었습니다", stale.title, "stale state is explained")
    case.assert_equal(&"RETRY", stale.primary_action, "stale state retries")

    var mismatch: Dictionary = view_model_script.from_result({
        "status": &"RECOGNIZED_GLYPH_DOES_NOT_MATCH_SELECTED",
        "recognized_glyph_id": &"FLOW",
        "selected_glyph_id": &"HEAT",
        "candidates": [flow],
    }, &"HEAT", 2)
    case.assert_equal("선택한 글자와 다릅니다", mismatch.title, "mismatch is explained")
    case.assert_equal(&"RETRY", mismatch.primary_action, "mismatch does not auto-confirm")

    var accepted: Dictionary = view_model_script.from_result({
        "status": &"VAULT_GLYPH_CREATED",
        "glyph_id": &"HEAT",
        "input_revision": 7,
        "candidates": [heat],
    }, &"HEAT", 2)
    case.assert_equal("보관함에 열 글자를 저장했습니다", accepted.title, "success names exact stored glyph")
    case.assert_equal(&"CONFIRM", accepted.primary_action, "success requires explicit confirm")

    for model in [low, ambiguous, stale, mismatch, accepted]:
        case.assert_true(String(model.title).length() <= 32, "title fits registered copy budget")
        case.assert_true(String(model.primary_action_label).length() <= 16, "primary action fits registered copy budget")
        case.assert_true(String(model.secondary_action_label).length() <= 16, "secondary action fits registered copy budget")
        case.assert_false(_contains_callable(model), "view model contains no mutation callback")


func _contains_callable(value: Variant) -> bool:
    if typeof(value) == TYPE_CALLABLE:
        return true
    if typeof(value) == TYPE_DICTIONARY:
        for nested in value.values():
            if _contains_callable(nested):
                return true
    elif typeof(value) == TYPE_ARRAY:
        for nested in value:
            if _contains_callable(nested):
                return true
    return false

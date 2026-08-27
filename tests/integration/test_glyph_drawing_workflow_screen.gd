# Task 6 Glyph Drawing Screen의 장면 계약과 안전한 저장 진입점을 검증한다.
extends RefCounted


class FakeScribeCoordinator:
    extends RefCounted

    var accept_calls := 0
    var interrupt_calls := 0

    func selected_glyph_id() -> StringName:
        return &"HEAT"

    func accept_candidate(_candidate, input_revision: int) -> Dictionary:
        accept_calls += 1
        return {
            "status": &"VAULT_GLYPH_CREATED",
            "glyph_id": &"HEAT",
            "input_revision": input_revision,
            "reservation_id": &"scribe-test",
        }

    func interrupt(_reason: StringName) -> Dictionary:
        interrupt_calls += 1
        return {"status": &"SCRIBE_INTERRUPTED"}


const SCREEN_PATH := "res://src/ui/spell_workflow/glyph_drawing_screen.tscn"
const SCREEN_SCRIPT_PATH := "res://src/ui/spell_workflow/glyph_drawing_screen.gd"
const STATUS_CARD_PATH := "res://src/ui/spell_workflow/components/incident_status_card.gd"
const OVERLAY_PATH := "res://src/ui/spell_workflow/components/incident_explanation_overlay.gd"
const REQUIRED_NODES := [
    "CharacterPanel",
    "IncidentStatusCard",
    "GlyphProgressPanel",
    "WritingCanvas",
    "GlyphInfoPanel",
    "RecognitionPanel",
    "RecognitionPanel/Content/GlyphPreview",
    "RecognitionPanel/Content/GlyphNameLabel",
    "RetryButton",
    "SaveButton",
]


func run(case) -> void:
    for script_path in [SCREEN_SCRIPT_PATH, STATUS_CARD_PATH, OVERLAY_PATH]:
        case.assert_true(FileAccess.file_exists(script_path), "Task 6 script must exist: %s" % script_path)
    case.assert_true(FileAccess.file_exists(SCREEN_PATH), "Task 6 glyph drawing screen must exist")
    if not FileAccess.file_exists(SCREEN_PATH):
        return

    var packed_scene = load(SCREEN_PATH)
    case.assert_true(packed_scene != null and packed_scene.can_instantiate(), "glyph drawing screen must load")
    if packed_scene == null or not packed_scene.can_instantiate():
        return

    var screen = packed_scene.instantiate()
    case.assert_true(screen.has_method("configure"), "screen accepts incident and recognition context")
    case.assert_true(screen.has_method("save_accepted_candidate"), "screen exposes explicit accepted-save boundary")
    case.assert_true(screen.has_method("cancel_scribing"), "screen releases an interrupted reservation explicitly")
    case.assert_true(screen.has_method("_on_incident_status_input"), "incident status card has an explicit touch path to its explanation")
    for node_name in REQUIRED_NODES:
        case.assert_true(screen.has_node(NodePath(node_name)), "screen exposes required node: %s" % node_name)
    for action_name in ["RetryButton", "SaveButton"]:
        var action = screen.get_node_or_null(NodePath(action_name))
        case.assert_true(action != null, "%s exists" % action_name)
        if action != null:
            case.assert_true(action.custom_minimum_size.x >= 48.0, "%s width is touch safe" % action_name)
            case.assert_true(action.custom_minimum_size.y >= 48.0, "%s height is touch safe" % action_name)
    case.assert_true(screen.has_node(NodePath("IncidentStatusCard/Content/Urgency")), "status card exposes urgency")
    case.assert_true(screen.has_node(NodePath("IncidentStatusCard/Content/TouchHint")), "status card explains its touch affordance")
    var canvas_hint = screen.get_node_or_null(NodePath("WritingCanvas/WritingContent/CanvasHint")) as Label
    case.assert_true(canvas_hint != null and canvas_hint.text.contains("드래그") and canvas_hint.text.contains("터치"), "writing canvas tells players to use mouse drag or touch")
    case.assert_true(FileAccess.file_exists("res://src/ui/spell_workflow/components/incident_explanation_overlay.tscn"), "incident overlay scene exists")
    _assert_recognition_glyph_visual(case, screen)
    _assert_explicit_save_replays_once(case, screen)
    _assert_incident_overlay_preserves_context(case)
    screen.queue_free()


func _assert_recognition_glyph_visual(case, screen) -> void:
    var coordinator = FakeScribeCoordinator.new()
    screen.configure({}, null, coordinator, null, {"selected_glyph_id": &"HEAT"}, 0)
    screen.submit_strokes([])
    var preview = screen.get_node_or_null(NodePath("RecognitionPanel/Content/GlyphPreview")) as TextureRect
    var name_label = screen.get_node_or_null(NodePath("RecognitionPanel/Content/GlyphNameLabel")) as Label
    case.assert_true(preview != null and preview.texture != null, "recognition result previews the selected approved glyph")
    case.assert_equal("열기", name_label.text if name_label != null else "", "recognition result uses the live Korean glyph name")


func _assert_explicit_save_replays_once(case, screen) -> void:
    var coordinator = FakeScribeCoordinator.new()
    screen.configure({}, null, coordinator, null, {"selected_glyph_id": &"HEAT"}, 3)
    screen.select_candidate(RefCounted.new())
    var first: Dictionary = screen.save_accepted_candidate()
    var replay: Dictionary = screen.save_accepted_candidate()
    case.assert_equal(&"VAULT_GLYPH_CREATED", first.get("status", &""), "accepted save reaches the existing coordinator")
    case.assert_equal(first, replay, "same save request replays its terminal result")
    case.assert_equal(1, coordinator.accept_calls, "screen does not create a second Vault write")
    var interrupted: Dictionary = screen.cancel_scribing()
    case.assert_equal(&"SCRIBE_INTERRUPTED", interrupted.get("status", &""), "cancel is an explicit coordinator interruption")
    case.assert_equal(1, coordinator.interrupt_calls, "cancel does not write a glyph")


func _assert_incident_overlay_preserves_context(case) -> void:
    var overlay_scene = load("res://src/ui/spell_workflow/components/incident_explanation_overlay.tscn")
    var overlay = overlay_scene.instantiate()
    var context := {"current_state": &"DRAWING", "stroke_revision": 3}
    overlay.present({"problem": "불안정한 열기", "observed_keywords": ["열기", "흐름"]}, context)
    case.assert_true(overlay.has_node(NodePath("Content/Keywords")), "overlay renders observed keywords without a solution list")
    overlay.close()
    case.assert_equal(context, overlay.return_context(), "incident overlay returns the supplied workflow context unchanged")
    overlay.queue_free()

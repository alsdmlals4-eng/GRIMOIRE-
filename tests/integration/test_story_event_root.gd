extends RefCounted

const ROOT_SCENE_PATH := "res://src/ui/story/story_event_root.tscn"
const ADMISSION_SCENE_PATH := "res://src/ui/story/admission_prologue.tscn"
const STORY_PROGRESS_PATH := "res://src/core/story/story_progress.gd"
const PRACTICUM_BACKGROUND_PATH := "res://assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp"
const HEAT_FIXTURE_PATH := "res://tests/fixtures/glyphs/heat-positive.json"
const PROTECT_FIXTURE_PATH := "res://tests/fixtures/glyphs/protect-positive.json"


func run(case) -> void:
    case.assert_true(ResourceLoader.exists(ROOT_SCENE_PATH), "Story event root scene exists")
    case.assert_true(ResourceLoader.exists(ADMISSION_SCENE_PATH), "Admission scene exists for the transient handoff")
    case.assert_true(ResourceLoader.exists(PRACTICUM_BACKGROUND_PATH), "Guided practicum environment asset exists")
    if not ResourceLoader.exists(ROOT_SCENE_PATH) or not ResourceLoader.exists(ADMISSION_SCENE_PATH) or not ResourceLoader.exists(PRACTICUM_BACKGROUND_PATH):
        return

    var root_scene = load(ROOT_SCENE_PATH)
    var admission_scene = load(ADMISSION_SCENE_PATH)
    var story_progress_script = load(STORY_PROGRESS_PATH)
    case.assert_true(root_scene is PackedScene, "Story event root scene loads")
    case.assert_true(admission_scene is PackedScene, "Admission scene loads")
    case.assert_true(story_progress_script != null, "Story progress loads")
    if not root_scene is PackedScene or not admission_scene is PackedScene or story_progress_script == null:
        return

    var root = root_scene.instantiate()
    root._ready()
    _assert_live_controls(case, root)
    var environment_background := root.get_node_or_null(NodePath("EnvironmentBackground")) as TextureRect
    case.assert_true(environment_background != null, "First practicum owns the approved greenhouse environment as a live texture layer")
    if environment_background != null:
        case.assert_true(environment_background.texture != null, "First practicum environment texture is bound")
        if environment_background.texture != null:
            case.assert_equal(PRACTICUM_BACKGROUND_PATH, environment_background.texture.resource_path, "First practicum reuses the field-practicum environment asset")
        case.assert_equal(Control.MOUSE_FILTER_IGNORE, environment_background.mouse_filter, "First practicum environment does not intercept writing or action input")
        case.assert_equal(TextureRect.STRETCH_KEEP_ASPECT_COVERED, environment_background.stretch_mode, "First practicum environment covers the landscape viewport without a blank frame")

    # Breaks if preview or commit can happen without the one transient FIRST_EVENT handoff.
    case.assert_equal(&"FIRST_EVENT_PROGRESS_REQUIRED", root.select_glyph(&"HEAT").get("status", &""), "Glyph selection rejects absent progress")
    case.assert_equal(&"FIRST_EVENT_PROGRESS_REQUIRED", root.request_circle_preview().get("status", &""), "Preview rejects absent progress")
    case.assert_equal(&"FIRST_EVENT_PROGRESS_REQUIRED", root.request_commit().get("status", &""), "Commit rejects absent progress")

    var wrong_progress = story_progress_script.create_new()
    root.configure(wrong_progress)
    case.assert_equal(&"FIRST_EVENT_PROGRESS_REQUIRED", root.select_glyph(&"HEAT").get("status", &""), "Admission beat cannot operate the first event")

    # Breaks if admission can bypass first class before handing valid progress to the event root.
    var admission = admission_scene.instantiate()
    admission._ready()
    admission.configure(story_progress_script.create_new())
    var handoff_owner := Node.new()
    var class_continuation: Dictionary = admission.continue_narrative()
    case.assert_equal(&"FIRST_CLASS_ROUTE", class_continuation.get("status", &""), "Admission first hands control to the class route")
    var event_continuation: Dictionary = class_continuation.get("progress", null).advance_from_class()
    case.assert_equal(&"FIRST_EVENT_ROUTE", event_continuation.get("status", &""), "Only the first class can unlock the practicum route")
    var handoff: Dictionary = story_progress_script.stage_first_event_handoff(event_continuation.get("progress", null), handoff_owner)
    case.assert_equal(&"FIRST_EVENT_HANDOFF_READY", handoff.get("status", &""), "First class creates one explicit transient practicum handoff")
    var event_progress = story_progress_script.consume_first_event_handoff(handoff_owner)
    case.assert_true(event_progress != null and event_progress.current_beat() == &"FIRST_EVENT", "Handoff yields only valid FIRST_EVENT progress")
    root.configure(event_progress)
    admission.free()
    handoff_owner.free()

    var writing_panel = root.get_node_or_null(NodePath("Content/Body/GlyphWritingPanel"))
    var preview_button := root.get_node_or_null(NodePath("Content/Body/ActionPanel/PreviewButton")) as Button
    var target_button := root.get_node_or_null(NodePath("Content/Body/ActionPanel/TargetButton")) as Button
    var commit_button := root.get_node_or_null(NodePath("Content/Body/ActionPanel/CommitButton")) as Button
    case.assert_true(commit_button.disabled, "Commit is disabled before a preview and target selection")
    case.assert_true(preview_button.disabled, "Preview is disabled before selecting glyphs")

    # Breaks if the story event reverts to button-picked glyphs instead of direct writing.
    case.assert_true(writing_panel != null, "Story event presents a direct glyph-writing panel")
    if writing_panel == null:
        root.free()
        return
    var heat_recognition: Dictionary = writing_panel.submit_strokes(_load_strokes(HEAT_FIXTURE_PATH))
    case.assert_equal(&"CANDIDATE_READY", heat_recognition.get("status", &""), "First written glyph is recognized")
    case.assert_equal(&"CANDIDATE_SELECTED", writing_panel.select_candidate(0).get("status", &""), "First written glyph waits for player confirmation")
    case.assert_equal(&"GLYPH_ACCEPTED", writing_panel.accept_selected_candidate().get("status", &""), "First written glyph enters the circle only after explicit confirmation")
    var protect_recognition: Dictionary = writing_panel.submit_strokes(_load_strokes(PROTECT_FIXTURE_PATH))
    case.assert_equal(&"CANDIDATE_READY", protect_recognition.get("status", &""), "Second written glyph is recognized")
    case.assert_equal(&"CANDIDATE_SELECTED", writing_panel.select_candidate(0).get("status", &""), "Second written glyph waits for player confirmation")
    case.assert_equal(&"GLYPH_ACCEPTED", writing_panel.accept_selected_candidate().get("status", &""), "Second written glyph enters the circle only after explicit confirmation")
    case.assert_false(preview_button.disabled, "One to three selected glyphs enables explicit preview")
    case.assert_true(target_button.disabled, "Target selection waits for the requested preview")
    preview_button.pressed.emit()
    var preview: Dictionary = root.current_circle_preview()
    case.assert_equal(&"PREVIEW_READY", preview.get("status", &""), "Explicit preview is ready before resolution")
    case.assert_equal([&"INTENSIFY", &"WARD"], preview.get("method_tags", []), "Preview exposes semantic method tags")
    case.assert_true(root.get_node("Content/Body/ActionPanel/PreviewStatus").visible, "Preview is visibly presented before commit")
    case.assert_equal(0, root.goal_clock_segments(), "Preview alone does not resolve the event")
    case.assert_false(target_button.disabled, "Preview unlocks explicit target selection")
    target_button.pressed.emit()
    case.assert_false(commit_button.disabled, "Commit unlocks only after target selection")
    commit_button.pressed.emit()
    var result: Dictionary = root.last_result_receipt()
    case.assert_equal(&"RESOLVED", result.get("status", &""), "Explicit commit resolves exactly once")
    case.assert_equal([&"INTENSIFY", &"WARD"], result.get("resolver_method_tags", []), "Root passes preview method tags, never raw glyph ids, to the clock resolver")
    case.assert_equal(1, root.goal_clock_segments(), "Matching semantic method advances the goal")
    case.assert_equal(1, root.threat_clock_segments(), "Matching method retains the threat consequence")
    case.assert_true(commit_button.disabled, "Resolved preparation locks the live Commit button")
    var continue_button := root.get_node_or_null(NodePath("Content/Body/ActionPanel/ContinueToDuelButton")) as Button
    case.assert_true(continue_button != null, "Resolved practicum exposes one narrative continuation to the supervised duel")
    if continue_button != null:
        case.assert_false(continue_button.disabled, "Duel continuation is enabled only after the first practicum resolves")
    var clock_view = root.get_node_or_null(NodePath("Content/Body/ActionPanel/EventClockView"))
    case.assert_equal("1/6", clock_view.goal_count_text(), "Goal clock exposes an accessible live count")
    case.assert_equal("1/4", clock_view.threat_count_text(), "Threat clock exposes an accessible live count")
    case.assert_equal("1/6", clock_view.get_node("ClockRows/GoalClock/GoalCount").text, "Live goal count label is built from resolution state")
    case.assert_equal("1/4", clock_view.get_node("ClockRows/ThreatClock/ThreatCount").text, "Live threat count label is built from resolution state")
    var goal_segments = clock_view.get_node("ClockRows/GoalClock/GoalSegments")
    var threat_segments = clock_view.get_node("ClockRows/ThreatClock/ThreatSegments")
    case.assert_equal(6, goal_segments.get_child_count(), "Goal clock builds all six live segment Controls")
    case.assert_equal(4, threat_segments.get_child_count(), "Threat clock builds all four live segment Controls")
    case.assert_true(goal_segments.get_child(0).accessibility_name.ends_with("완료"), "Filled goal segment exposes live accessible completion text")
    case.assert_true(goal_segments.get_child(1).accessibility_name.ends_with("미완료"), "Unfilled goal segment exposes live accessible completion text")

    # Breaks if a second real CommitButton press mints a new id and moves the clocks again.
    commit_button.pressed.emit()
    var repeated: Dictionary = root.last_result_receipt()
    case.assert_equal(&"ALREADY_RESOLVED", repeated.get("status", &""), "Second CommitButton press cannot move the clocks twice")
    case.assert_true(root.result_receipt_text().contains("FROST_STABILIZED"), "Repeat notice preserves the successful result")
    case.assert_true(root.result_receipt_text().contains("FRACTURES_SPREAD"), "Repeat notice preserves the remaining risk")
    case.assert_true(root.result_receipt_text().contains("이미 처리"), "Repeat shows a separate no-change notice")
    case.assert_equal(1, root.goal_clock_segments(), "Repeated receipt leaves goal unchanged")
    case.assert_equal(1, root.threat_clock_segments(), "Repeated receipt leaves threat unchanged")
    case.assert_true(commit_button.disabled, "Repeated commit attempt keeps the live Commit button locked")

    var duel_owner := Node.new()
    var duel_handoff: Dictionary = root.handoff_duel_practicum(duel_owner)
    case.assert_equal(&"DUEL_PRACTICUM_HANDOFF_READY", duel_handoff.get("status", &""), "Resolved practicum stages an explicit supervised-duel handoff")
    var duel_progress = story_progress_script.consume_duel_practicum_handoff(duel_owner)
    case.assert_true(duel_progress != null and duel_progress.current_beat() == &"DUEL_PRACTICUM", "Only the resolved practicum yields duel progress")
    duel_owner.free()
    root.free()


func _assert_live_controls(case, root) -> void:
    for node_path in [
        "Content/Body/GlyphWritingPanel",
        "Content/Body/ActionPanel/GlyphCompositionStatus",
        "Content/Body/ActionPanel/PreviewButton",
        "Content/Body/ActionPanel/PreviewStatus",
        "Content/Body/ActionPanel/TargetButton",
        "Content/Body/ActionPanel/CommitButton",
        "Content/Body/ActionPanel/EventClockView",
        "Content/Body/ActionPanel/ResultReceipt",
    ]:
        case.assert_true(root.get_node_or_null(NodePath(node_path)) != null, "Story event has live control: %s" % node_path)


func _load_strokes(path: String) -> Array[PackedVector2Array]:
    var output: Array[PackedVector2Array] = []
    var parser := JSON.new()
    if parser.parse(FileAccess.get_file_as_string(path)) != OK or typeof(parser.data) != TYPE_DICTIONARY:
        return output
    for raw_stroke in parser.data.get("strokes", []):
        if typeof(raw_stroke) != TYPE_ARRAY:
            continue
        var stroke := PackedVector2Array()
        for raw_point in raw_stroke:
            if typeof(raw_point) == TYPE_ARRAY and raw_point.size() == 2:
                stroke.append(Vector2(float(raw_point[0]), float(raw_point[1])))
        output.append(stroke)
    return output

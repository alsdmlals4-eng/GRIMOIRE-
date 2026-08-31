extends RefCounted

const ROOT_SCENE_PATH := "res://src/ui/story/story_event_root.tscn"
const ADMISSION_SCENE_PATH := "res://src/ui/story/admission_prologue.tscn"
const STORY_PROGRESS_PATH := "res://src/core/story/story_progress.gd"


func run(case) -> void:
    case.assert_true(ResourceLoader.exists(ROOT_SCENE_PATH), "Story event root scene exists")
    case.assert_true(ResourceLoader.exists(ADMISSION_SCENE_PATH), "Admission scene exists for the transient handoff")
    if not ResourceLoader.exists(ROOT_SCENE_PATH) or not ResourceLoader.exists(ADMISSION_SCENE_PATH):
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

    # Breaks if preview or commit can happen without the one transient FIRST_EVENT handoff.
    case.assert_equal(&"FIRST_EVENT_PROGRESS_REQUIRED", root.select_glyph(&"HEAT").get("status", &""), "Glyph selection rejects absent progress")
    case.assert_equal(&"FIRST_EVENT_PROGRESS_REQUIRED", root.request_circle_preview().get("status", &""), "Preview rejects absent progress")
    case.assert_equal(&"FIRST_EVENT_PROGRESS_REQUIRED", root.request_commit().get("status", &""), "Commit rejects absent progress")

    var wrong_progress = story_progress_script.create_new()
    root.configure(wrong_progress)
    case.assert_equal(&"FIRST_EVENT_PROGRESS_REQUIRED", root.select_glyph(&"HEAT").get("status", &""), "Admission beat cannot operate the first event")

    # Breaks if admission advances without handing the valid progress object to the event root.
    var admission = admission_scene.instantiate()
    admission._ready()
    admission.configure(story_progress_script.create_new())
    var handoff_owner := Node.new()
    var handoff: Dictionary = admission.handoff_first_event(handoff_owner)
    case.assert_equal(&"FIRST_EVENT_HANDOFF_READY", handoff.get("status", &""), "Admission creates one explicit transient handoff")
    var event_progress = story_progress_script.consume_first_event_handoff(handoff_owner)
    case.assert_true(event_progress != null and event_progress.current_beat() == &"FIRST_EVENT", "Handoff yields only valid FIRST_EVENT progress")
    root.configure(event_progress)
    admission.free()
    handoff_owner.free()

    var heat_button := root.get_node_or_null(NodePath("Content/GlyphSelection/GlyphButtons/HeatGlyphButton")) as Button
    var stabilize_button := root.get_node_or_null(NodePath("Content/GlyphSelection/GlyphButtons/StabilizeGlyphButton")) as Button
    var preview_button := root.get_node_or_null(NodePath("Content/PreviewButton")) as Button
    var target_button := root.get_node_or_null(NodePath("Content/TargetButton")) as Button
    var commit_button := root.get_node_or_null(NodePath("Content/CommitButton")) as Button
    case.assert_true(commit_button.disabled, "Commit is disabled before a preview and target selection")
    case.assert_true(preview_button.disabled, "Preview is disabled before selecting glyphs")

    # Breaks if live controls skip the required player order or use raw glyph IDs as method tags.
    heat_button.pressed.emit()
    stabilize_button.pressed.emit()
    case.assert_false(preview_button.disabled, "One to three selected glyphs enables explicit preview")
    case.assert_true(target_button.disabled, "Target selection waits for the requested preview")
    preview_button.pressed.emit()
    var preview: Dictionary = root.current_circle_preview()
    case.assert_equal(&"PREVIEW_READY", preview.get("status", &""), "Explicit preview is ready before resolution")
    case.assert_equal([&"INTENSIFY", &"ANCHOR"], preview.get("method_tags", []), "Preview exposes semantic method tags")
    case.assert_true(root.get_node("Content/PreviewStatus").visible, "Preview is visibly presented before commit")
    case.assert_equal(0, root.goal_clock_segments(), "Preview alone does not resolve the event")
    case.assert_false(target_button.disabled, "Preview unlocks explicit target selection")
    target_button.pressed.emit()
    case.assert_false(commit_button.disabled, "Commit unlocks only after target selection")
    commit_button.pressed.emit()
    var result: Dictionary = root.last_result_receipt()
    case.assert_equal(&"RESOLVED", result.get("status", &""), "Explicit commit resolves exactly once")
    case.assert_equal([&"INTENSIFY", &"ANCHOR"], result.get("resolver_method_tags", []), "Root passes preview method tags, never raw glyph ids, to the clock resolver")
    case.assert_equal(1, root.goal_clock_segments(), "Matching semantic method advances the goal")
    case.assert_equal(1, root.threat_clock_segments(), "Matching method retains the threat consequence")
    case.assert_true(commit_button.disabled, "Resolved preparation locks the live Commit button")

    var clock_view = root.get_node_or_null(NodePath("Content/EventClockView"))
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
    root.free()


func _assert_live_controls(case, root) -> void:
    for node_path in [
        "Content/GlyphSelection/GlyphButtons/HeatGlyphButton",
        "Content/GlyphSelection/GlyphButtons/StabilizeGlyphButton",
        "Content/PreviewButton",
        "Content/PreviewStatus",
        "Content/TargetButton",
        "Content/CommitButton",
        "Content/EventClockView",
        "Content/ResultReceipt",
    ]:
        case.assert_true(root.get_node_or_null(NodePath(node_path)) != null, "Story event has live control: %s" % node_path)

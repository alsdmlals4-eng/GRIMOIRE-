extends RefCounted

const PATH := "res://src/ui/story/story_event_root.gd"
const SCENE_PATH := "res://src/ui/story/story_event_root.tscn"
const CLOCK_VIEW_PATH := "res://src/ui/components/event_clock_view.gd"
const EVENT_RESOURCE_PATH := "res://data/events/frostbloom/frostbloom_event_01.tres"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Story event root implementation must exist")
    case.assert_true(ResourceLoader.exists(SCENE_PATH), "Story event root scene exists")
    case.assert_true(FileAccess.file_exists(CLOCK_VIEW_PATH), "Event clock view implementation must exist")
    case.assert_true(ResourceLoader.exists(EVENT_RESOURCE_PATH), "Frostbloom event resource exists")
    if not ResourceLoader.exists(SCENE_PATH):
        return

    var packed_scene = load(SCENE_PATH)
    case.assert_true(packed_scene is PackedScene, "Story event root scene loads")
    if not packed_scene is PackedScene:
        return

    var root = packed_scene.instantiate()
    case.assert_true(root is Control, "Story event root is a live Control")
    case.assert_true(root.has_method("resolve_event_action"), "Story event root exposes explicit action resolution")
    case.assert_true(root.has_method("goal_clock_segments"), "Story event root exposes live goal state")
    case.assert_true(root.has_method("threat_clock_segments"), "Story event root exposes live threat state")
    case.assert_true(root.get_node_or_null(NodePath("Content/EventClockView")) != null, "Story event root contains the live clock view")
    if not root.has_method("resolve_event_action"):
        root.free()
        return

    # Breaks if the scene treats the first practicum as a menu or auto-selects its target.
    var missing_target: Dictionary = root.resolve_event_action(&"frost-action-missing-target", [&"HEAT", &"STABILIZE"], &"")
    case.assert_equal(&"TARGET_REQUIRED", missing_target.get("status", &""), "Story action requires an explicit target")
    var missing_action: Dictionary = root.resolve_event_action(&"", [&"HEAT", &"STABILIZE"], &"FROST_SEEDLINGS")
    case.assert_equal(&"ACTION_ID_REQUIRED", missing_action.get("status", &""), "Story action requires an explicit action id")

    # Breaks if a matching explicit action fails to advance the declared Frostbloom goal clock.
    var result: Dictionary = root.resolve_event_action(&"frost-action-01", [&"HEAT", &"STABILIZE"], &"FROST_SEEDLINGS")
    case.assert_equal(&"RESOLVED", result.get("status", &""), "Explicit story action resolves once")
    case.assert_equal(1, root.goal_clock_segments(), "Matching method advances the goal clock")
    case.assert_equal(1, root.threat_clock_segments(), "Matching action retains the declared threat consequence")
    case.assert_true(result.get("visible_consequence_tags", []).has(&"FRACTURES_SPREAD"), "Result receipt retains the remaining risk")
    case.assert_true(result.has("preview"), "Result receipt includes the role-free circle preview")

    # Breaks if the same UI action can move a story clock twice.
    var repeated: Dictionary = root.resolve_event_action(&"frost-action-01", [&"HEAT", &"STABILIZE"], &"FROST_SEEDLINGS")
    case.assert_equal(&"ALREADY_RESOLVED", repeated.get("status", &""), "Repeated UI input cannot resolve the event twice")
    case.assert_equal(1, root.goal_clock_segments(), "Repeated action leaves goal progress unchanged")
    case.assert_equal(1, root.threat_clock_segments(), "Repeated action leaves threat progress unchanged")

    # Breaks if clock labels or segment counts are baked into the scene instead of built from returned state.
    var clock_view = root.get_node_or_null(NodePath("Content/EventClockView"))
    case.assert_true(clock_view != null, "Live event clock view is available")
    if clock_view != null:
        case.assert_equal("서리 안정화", clock_view.goal_label_text(), "Goal label is read from the event definition")
        case.assert_equal("온실 균열 확산", clock_view.threat_label_text(), "Threat label is read from the event definition")
        case.assert_equal(6, clock_view.goal_segment_count(), "Goal clock creates all six live segments")
        case.assert_equal(4, clock_view.threat_segment_count(), "Threat clock creates all four live segments")
        case.assert_equal(1, clock_view.goal_filled_segments(), "Goal view renders the returned resolution state")
        case.assert_equal(1, clock_view.threat_filled_segments(), "Threat view renders the returned resolution state")
        var goal_segments = clock_view.get_node_or_null(NodePath("ClockRows/GoalClock/GoalSegments"))
        var threat_segments = clock_view.get_node_or_null(NodePath("ClockRows/ThreatClock/ThreatSegments"))
        case.assert_equal(6, goal_segments.get_child_count() if goal_segments != null else 0, "Goal segments are live Controls built from the definition")
        case.assert_equal(4, threat_segments.get_child_count() if threat_segments != null else 0, "Threat segments are live Controls built from the definition")
    root.free()

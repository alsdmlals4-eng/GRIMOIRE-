extends RefCounted

const DEFINITION_PATH := "res://src/core/events/event_clock_definition.gd"
const STATE_PATH := "res://src/core/events/event_clock_state.gd"
const RESOLVER_PATH := "res://src/core/events/event_clock_resolver.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(DEFINITION_PATH), "Event clock definition implementation must exist")
    case.assert_true(FileAccess.file_exists(STATE_PATH), "Event clock state implementation must exist")
    case.assert_true(FileAccess.file_exists(RESOLVER_PATH), "Event clock resolver implementation must exist")
    if not FileAccess.file_exists(DEFINITION_PATH) or not FileAccess.file_exists(STATE_PATH) or not FileAccess.file_exists(RESOLVER_PATH):
        return

    var definition_script = load(DEFINITION_PATH)
    var state_script = load(STATE_PATH)
    var resolver_script = load(RESOLVER_PATH)
    case.assert_true(definition_script != null, "Event clock definition script loads")
    case.assert_true(state_script != null, "Event clock state script loads")
    case.assert_true(resolver_script != null, "Event clock resolver script loads")
    if definition_script == null or state_script == null or resolver_script == null:
        return

    var definition = definition_script.new()
    definition.event_id = &"FROSTBLOOM_EVENT_01"
    definition.goal_clock_id = &"FROST_STABILIZATION"
    definition.threat_clock_id = &"GREENHOUSE_FRACTURES"
    definition.goal_segment_count = 6
    definition.threat_segment_count = 4
    definition.action_resolutions = [{
        "target_id": &"FROST_SEEDLINGS",
        "method_tags": [&"HEAT", &"STABILIZE"],
        "goal_delta": 1,
        "threat_delta": 1,
        "visible_consequence_tags": [&"FROST_STABILIZED", &"FRACTURES_SPREAD"],
    }, {
        "target_id": &"FROST_SEEDLINGS",
        "method_tags": [&"COOL", &"STABILIZE"],
        "goal_delta": 1,
        "threat_delta": -1,
        "visible_consequence_tags": [&"FROST_STABILIZED", &"FRACTURES_CONTAINED"],
    }]
    var resolver = resolver_script.new(definition)
    var state = state_script.new()

    # Breaks if declared resolutions do not preserve a goal advance when the same action raises threat.
    var first: Dictionary = resolver.resolve(state, {
        "action_id": &"frost-1",
        "method_tags": [&"HEAT", &"STABILIZE"],
        "target_id": &"FROST_SEEDLINGS",
    })
    case.assert_equal(&"RESOLVED", first.get("status", &""), "Declared action resolves clocks")
    case.assert_equal(1, first.get("goal_delta", 0), "Declared action advances the goal clock")
    case.assert_equal(1, first.get("threat_delta", 0), "Declared action can advance the threat clock too")
    case.assert_equal([&"FROST_STABILIZED", &"FRACTURES_SPREAD"], first.get("visible_consequence_tags", []), "Resolution exposes declared visible consequences")
    var first_snapshot: Dictionary = first.get("state_snapshot", {})
    case.assert_equal(1, first_snapshot.get("goal_segments", 0), "Threat advancement never removes a successful goal advance")
    case.assert_equal(1, first_snapshot.get("threat_segments", 0), "Threat state records the declared consequence")

    # Breaks if duplicate delivery reapplies the action's state transition.
    var second: Dictionary = resolver.resolve(first.get("state"), {
        "action_id": &"frost-1",
        "method_tags": [&"HEAT", &"STABILIZE"],
        "target_id": &"FROST_SEEDLINGS",
    })
    case.assert_equal(&"ALREADY_RESOLVED", second.get("status", &""), "One action cannot move clocks twice")
    var second_snapshot: Dictionary = second.get("state_snapshot", {})
    case.assert_equal(1, second_snapshot.get("goal_segments", 0), "Duplicate action leaves the goal clock unchanged")
    case.assert_equal(1, second_snapshot.get("threat_segments", 0), "Duplicate action leaves the threat clock unchanged")

    # Breaks if containing a threat erases prior successful goal progress.
    var containment: Dictionary = resolver.resolve(first.get("state"), {
        "action_id": &"frost-2",
        "method_tags": [&"COOL", &"STABILIZE"],
        "target_id": &"FROST_SEEDLINGS",
    })
    case.assert_equal(&"RESOLVED", containment.get("status", &""), "A declared containment action resolves clocks")
    var containment_snapshot: Dictionary = containment.get("state_snapshot", {})
    case.assert_equal(2, containment_snapshot.get("goal_segments", 0), "Threat containment retains and adds to goal progress")
    case.assert_equal(0, containment_snapshot.get("threat_segments", 0), "Declared containment can lower threat progress")

    # Breaks if UI navigation is treated as story time.
    var menu: Dictionary = resolver.resolve(containment.get("state"), {"action_id": &"menu-open", "kind": &"MENU_OPEN"})
    case.assert_equal(&"NO_CLOCK_CHANGE", menu.get("status", &""), "Opening a menu never moves an event clock")
    var menu_snapshot: Dictionary = menu.get("state_snapshot", {})
    case.assert_equal(2, menu_snapshot.get("goal_segments", 0), "Menu navigation leaves the goal clock unchanged")
    case.assert_equal(0, menu_snapshot.get("threat_segments", 0), "Menu navigation leaves the threat clock unchanged")

    var dialogue: Dictionary = resolver.resolve(first.get("state"), {"action_id": &"dialogue-read", "kind": &"DIALOGUE_READ"})
    case.assert_equal(&"NO_CLOCK_CHANGE", dialogue.get("status", &""), "Reading dialogue never moves an event clock")

    var missing_id: Dictionary = resolver.resolve(first.get("state"), {"target_id": &"FROST_SEEDLINGS", "method_tags": [&"HEAT", &"STABILIZE"]})
    case.assert_equal(&"ACTION_ID_REQUIRED", missing_id.get("status", &""), "Every clock action requires an action id")

    var boundary_state = state_script.new()
    boundary_state.goal_segments = 3
    boundary_state.threat_segments = 2
    boundary_state.mark_resolved(&"seed-z")
    boundary_state.mark_resolved(&"seed-a")
    boundary_state.visible_scene_state = {"nested": {"surface": &"BASELINE"}}

    # Breaks if an undeclared target, method, or action changes a clock or consumes its id.
    var wrong_target: Dictionary = resolver.resolve(boundary_state, {
        "action_id": &"wrong-target",
        "target_id": &"OTHER_SEEDLINGS",
        "method_tags": [&"HEAT", &"STABILIZE"],
    })
    case.assert_equal(&"NO_CLOCK_CHANGE", wrong_target.get("status", &""), "Wrong target does not resolve an event clock")
    var wrong_target_snapshot: Dictionary = wrong_target.get("state_snapshot", {})
    case.assert_equal(3, wrong_target_snapshot.get("goal_segments", 0), "Wrong target leaves goal segments unchanged")
    case.assert_equal(2, wrong_target_snapshot.get("threat_segments", 0), "Wrong target leaves threat segments unchanged")
    case.assert_equal([&"seed-a", &"seed-z"], wrong_target_snapshot.get("resolved_action_ids", []), "Wrong target does not consume an action id and snapshots sorted ids")

    var missing_method: Dictionary = resolver.resolve(boundary_state, {
        "action_id": &"missing-method",
        "target_id": &"FROST_SEEDLINGS",
        "method_tags": [&"HEAT"],
    })
    case.assert_equal(&"NO_CLOCK_CHANGE", missing_method.get("status", &""), "Missing a required method tag does not resolve clocks")
    case.assert_equal([&"seed-a", &"seed-z"], missing_method.get("state_snapshot", {}).get("resolved_action_ids", []), "Missing method tag does not consume an action id")

    var undeclared: Dictionary = resolver.resolve(boundary_state, {
        "action_id": &"undeclared-method",
        "target_id": &"FROST_SEEDLINGS",
        "method_tags": [&"FLOW"],
    })
    case.assert_equal(&"NO_CLOCK_CHANGE", undeclared.get("status", &""), "Undeclared action does not resolve clocks")
    case.assert_equal([&"seed-a", &"seed-z"], undeclared.get("state_snapshot", {}).get("resolved_action_ids", []), "Undeclared action does not consume an action id")

    # Breaks if a no-change result aliases the input state or its nested visible payload.
    var wrong_target_state = wrong_target.get("state")
    wrong_target_state.goal_segments = 99
    wrong_target_state.mark_resolved(&"clone-only")
    var copied_nested: Dictionary = wrong_target_state.visible_scene_state.get("nested", {})
    copied_nested["surface"] = &"MUTATED"
    var original_snapshot: Dictionary = boundary_state.to_snapshot()
    case.assert_equal(3, original_snapshot.get("goal_segments", 0), "Resolver never mutates the input state")
    case.assert_equal([&"seed-a", &"seed-z"], original_snapshot.get("resolved_action_ids", []), "Resolver result ledger is isolated from input state")
    case.assert_equal(&"BASELINE", original_snapshot.get("visible_scene_state", {}).get("nested", {}).get("surface", &""), "Resolver result deep-copies nested visible state")

    # Breaks if UI, dialogue, wall-clock, or paused signals require or consume an action id.
    var non_clock_kinds: Array[StringName] = [&"MENU_OPEN", &"DIALOGUE_READ", &"UI_SIGNAL", &"WALL_CLOCK", &"ELAPSED_TIME", &"PAUSED"]
    for kind in non_clock_kinds:
        var no_clock: Dictionary = resolver.resolve(boundary_state, {"kind": kind})
        case.assert_equal(&"NO_CLOCK_CHANGE", no_clock.get("status", &""), "%s without an action id never moves a clock" % kind)
        var no_clock_snapshot: Dictionary = no_clock.get("state_snapshot", {})
        case.assert_equal(3, no_clock_snapshot.get("goal_segments", 0), "%s leaves goal segments unchanged" % kind)
        case.assert_equal(2, no_clock_snapshot.get("threat_segments", 0), "%s leaves threat segments unchanged" % kind)
        case.assert_equal([&"seed-a", &"seed-z"], no_clock_snapshot.get("resolved_action_ids", []), "%s never records an action id" % kind)

    # Breaks if any non-clock kind consults a pre-resolved id before returning no change.
    for kind in non_clock_kinds:
        var pre_resolved_non_clock: Dictionary = resolver.resolve(boundary_state, {"action_id": &"seed-a", "kind": kind})
        case.assert_equal(&"NO_CLOCK_CHANGE", pre_resolved_non_clock.get("status", &""), "%s ignores a pre-resolved action id" % kind)
        var pre_resolved_snapshot: Dictionary = pre_resolved_non_clock.get("state_snapshot", {})
        case.assert_equal(3, pre_resolved_snapshot.get("goal_segments", 0), "%s with a pre-resolved id leaves goal segments unchanged" % kind)
        case.assert_equal(2, pre_resolved_snapshot.get("threat_segments", 0), "%s with a pre-resolved id leaves threat segments unchanged" % kind)
        case.assert_equal([&"seed-a", &"seed-z"], pre_resolved_snapshot.get("resolved_action_ids", []), "%s leaves the existing ledger unchanged" % kind)

    var no_clock_id: Dictionary = resolver.resolve(boundary_state, {"action_id": &"story-after-menu", "kind": &"MENU_OPEN"})
    case.assert_equal(&"NO_CLOCK_CHANGE", no_clock_id.get("status", &""), "Menu action id is not consumed")
    case.assert_equal([&"seed-a", &"seed-z"], no_clock_id.get("state_snapshot", {}).get("resolved_action_ids", []), "Menu action id is absent from the ledger")
    var reused_as_story: Dictionary = resolver.resolve(no_clock_id.get("state"), {
        "action_id": &"story-after-menu",
        "target_id": &"FROST_SEEDLINGS",
        "method_tags": [&"HEAT", &"STABILIZE"],
    })
    case.assert_equal(&"RESOLVED", reused_as_story.get("status", &""), "A menu action id remains available to a declared story action")
    var reused_snapshot: Dictionary = reused_as_story.get("state_snapshot", {})
    case.assert_equal(4, reused_snapshot.get("goal_segments", 0), "Reused story action advances goal from preserved state")
    case.assert_equal(3, reused_snapshot.get("threat_segments", 0), "Reused story action advances threat from preserved state")
    case.assert_equal([&"seed-a", &"seed-z", &"story-after-menu"], reused_snapshot.get("resolved_action_ids", []), "Story resolution snapshot keeps action ids sorted deterministically")

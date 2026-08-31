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

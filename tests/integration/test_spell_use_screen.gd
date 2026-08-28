# Task8 주문 쓰기 화면의 명시적 대상 선택과 시전 경계를 검증한다.
extends RefCounted

const SCREEN_SCENE_PATH := "res://src/ui/spell_workflow/spell_use_screen.tscn"

class FakeCoordinator:
    extends RefCounted
    var preview_calls: Array[Dictionary] = []
    var confirmation_requests := 0
    var confirmed_ids: Array[StringName] = []

    func prepare_target_preview(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> Dictionary:
        preview_calls.append({"target_keyword": target_keyword, "target": target.duplicate(true), "payload": payload.duplicate(true)})
        if not bool(target.get("target_valid", false)):
            return {"status": &"INVALID_TARGET"}
        return {"status": &"FINAL_PREVIEW_READY", "preview": {"estimated_mana": 7, "target_keyword": target_keyword}}

    func request_use_confirmation() -> bool:
        confirmation_requests += 1
        return true

    func confirm_use(use_transaction_id: StringName) -> Dictionary:
        confirmed_ids.append(use_transaction_id)
        return {"status": &"USED", "use_transaction_id": use_transaction_id}

func run(case) -> void:
    var screen_source := FileAccess.get_file_as_string(SCREEN_SCENE_PATH)
    var selector_source := FileAccess.get_file_as_string("res://src/ui/components/context_target_selector.tscn")
    var commit_bar_source := FileAccess.get_file_as_string("res://src/ui/components/commit_bar.tscn")
    case.assert_false(screen_source.contains("COMPLETED SPELL"), "W6 spell-use screen has no stale English completed-spell label")
    case.assert_false(selector_source.contains("CONTEXT TARGET"), "W6 selector has no stale English target title")
    case.assert_false(selector_source.contains("Choose a concrete world target. No route recommendation."), "W6 selector has no stale English target hint")
    case.assert_false(screen_source.contains("SELECT A TARGET"), "W6 spell-use screen has no stale English preview prompt")
    case.assert_false(screen_source.contains("CANCEL"), "W6 spell-use screen has no stale English cancel label")
    case.assert_false(commit_bar_source.contains("COMMIT"), "W6 commit bar has no stale English cast label")
    var packed_scene = load(SCREEN_SCENE_PATH)
    case.assert_true(packed_scene != null and packed_scene.can_instantiate(), "Task8 Spell Use scene must instantiate")
    if packed_scene == null or not packed_scene.can_instantiate():
        return
    var screen = packed_scene.instantiate()
    for node_name in ["PreparedSpellSummary", "TargetSelector", "FinalPreview", "KnownImprovement", "RemainingRisk", "Unknown", "Forecast", "CommitBar", "CancelButton"]:
        case.assert_true(screen.find_child(node_name, true, false) != null, "screen exposes player flow node: %s" % node_name)
    var coordinator = FakeCoordinator.new()
    screen.configure(coordinator, &"use-opaque-1")
    var resolved_results: Array = []
    screen.cast_resolved.connect(func(result: Dictionary) -> void: resolved_results.append(result.duplicate(true)))
    screen._ready()
    var preview: Dictionary = screen.select_target(&"incident.root", {"target_valid": true}, {"known_improvement": "stabilize"})
    case.assert_equal(&"FINAL_PREVIEW_READY", preview.get("status", &""), "a valid explicit target receives the Coordinator preview")
    case.assert_equal(1, coordinator.preview_calls.size(), "screen delegates target preview exactly once")
    var commit_bar = screen.find_child("CommitBar", true, false)
    case.assert_true(bool(commit_bar.visual_snapshot().get("can_commit", false)), "valid preview enables intent-level commit only")
    var invalid_preview: Dictionary = screen.select_target(&"incident.invalid", {"target_valid": false}, {})
    case.assert_equal(&"INVALID_TARGET", invalid_preview.get("status", &""), "invalid selection reports authority status")
    case.assert_false(screen.current_preview().is_empty(), "invalid target preserves the last valid preview while disabling cast")
    screen.select_target(&"incident.root", {"target_valid": true}, {})
    case.assert_true(screen.request_confirmation(), "first explicit use action requests confirmation")
    case.assert_equal(1, coordinator.confirmation_requests, "screen delegates confirmation request once")
    commit_bar.edit_requested.emit()
    case.assert_false(bool(commit_bar.visual_snapshot().get("confirmation_required", true)), "edit cancels confirmation before a new target decision")
    case.assert_equal(&"USE_CONFIRMATION_REQUIRED", screen.confirm(&"use-opaque-1").get("status", &""), "edit prevents a stale confirmation from casting")
    case.assert_true(screen.request_confirmation(), "cast requires a new explicit confirmation after edit")
    case.assert_equal(&"USE_CONFIRMATION_REQUIRED", screen.confirm(&"wrong-id").get("status", &""), "mismatched caller ID fails closed")
    case.assert_equal(0, coordinator.confirmed_ids.size(), "mismatched ID never reaches authority")
    case.assert_equal(&"USED", screen.confirm(&"use-opaque-1").get("status", &""), "second explicit action invokes existing use authority")
    case.assert_equal(1, resolved_results.size(), "used authority result is emitted to the Product Root once")
    case.assert_equal(&"USED", Dictionary(resolved_results[0]).get("status", &""), "emitted result keeps the authoritative status")
    case.assert_equal([&"use-opaque-1"], coordinator.confirmed_ids, "opaque caller ID reaches authority once")
    case.assert_equal(&"USE_CONFIRMATION_REQUIRED", screen.confirm(&"use-opaque-1").get("status", &""), "duplicate confirmation fails closed")
    screen.queue_free()

    var selection_screen = packed_scene.instantiate()
    var selection_coordinator = FakeCoordinator.new()
    case.assert_true(selection_screen.has_method("set_target_choices"), "screen accepts caller-supplied explicit target choices")
    selection_screen.configure(selection_coordinator, &"use-opaque-2")
    selection_screen._ready()
    selection_screen.set_target_choices([{
        "id": &"root-choice",
        "label": "Root",
        "hint": "Stabilize the incident",
        "protected_value": "Root value",
        "known_improvement": "The incident can be stabilized now.",
        "forgone_or_remaining": "The remaining route still needs attention.",
        "unknown": "The root cause is still unknown.",
        "target_keyword": &"incident.root",
        "target": {"target_valid": true},
        "payload": {"known_improvement": "stabilize"},
    }])
    var selector = selection_screen.find_child("TargetSelector", true, false)
    var selector_snapshot: Dictionary = selector.visual_snapshot()
    case.assert_equal(1, selector_snapshot.get("targets", []).size(), "shared selector displays caller-supplied choices")
    case.assert_false(bool(selector_snapshot.get("recommendation_present", true)), "shared selector never presents a route recommendation")
    var rendered_choice: Dictionary = Dictionary(Array(selector_snapshot.get("targets", []))[0])
    case.assert_equal("Root value", rendered_choice.get("protected_value", ""), "selector preserves the protected player value")
    case.assert_equal("The remaining route still needs attention.", rendered_choice.get("forgone_or_remaining", ""), "selector preserves the remaining risk")
    selector.target_selected.emit(&"root-choice")
    case.assert_equal(&"FINAL_PREVIEW_READY", selection_screen.current_preview().get("status", &""), "selector emits only explicit caller choice to Coordinator preview")
    case.assert_equal(1, selection_coordinator.preview_calls.size(), "selector does not infer or auto-select a target")
    var selection_commit_bar = selection_screen.find_child("CommitBar", true, false)
    selection_commit_bar.commit_requested.emit()
    case.assert_equal(1, selection_coordinator.confirmation_requests, "first shared commit action asks existing authority for confirmation")
    selection_commit_bar.commit_requested.emit()
    case.assert_equal([&"use-opaque-2"], selection_coordinator.confirmed_ids, "second shared commit action forwards the configured opaque ID once")
    var cancel_counts: Array[int] = [0]
    selection_screen.cancel_requested.connect(func(): cancel_counts[0] += 1)
    selection_screen.cancel()
    case.assert_equal(1, cancel_counts[0], "explicit cancel emits player intent without gameplay mutation")
    selection_screen.queue_free()

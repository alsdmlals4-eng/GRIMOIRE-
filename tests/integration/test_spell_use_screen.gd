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
        return {
            "status": &"FINAL_PREVIEW_READY",
            "preview": {"estimated_mana": 7, "success_percent": 82, "target_keyword": target_keyword},
        }

    func request_use_confirmation() -> bool:
        confirmation_requests += 1
        return true

    func confirm_use(use_transaction_id: StringName) -> Dictionary:
        confirmed_ids.append(use_transaction_id)
        return {"status": &"USED", "use_transaction_id": use_transaction_id}


func run(case) -> void:
    var packed_scene = load(SCREEN_SCENE_PATH)
    case.assert_true(packed_scene != null and packed_scene.can_instantiate(), "Task8 Spell Use scene must instantiate")
    if packed_scene == null or not packed_scene.can_instantiate():
        return
    var screen = packed_scene.instantiate()
    for node_name in ["PreparedSpellSummary", "TargetSelector", "FinalPreview", "CommitBar", "CancelButton"]:
        case.assert_true(screen.find_child(node_name, true, false) != null, "screen exposes player flow node: %s" % node_name)
    var coordinator = FakeCoordinator.new()
    case.assert_true(screen.has_method("configure"), "screen accepts the caller-owned coordinator and opaque ID")
    case.assert_true(screen.has_method("select_target"), "screen exposes explicit target intent")
    case.assert_true(screen.has_method("current_preview"), "screen exposes only its rendered preview state")
    case.assert_true(screen.has_method("request_confirmation"), "screen exposes a confirmation request before any use")
    case.assert_true(screen.has_method("confirm"), "screen exposes explicit caller-ID confirmation")
    if not screen.has_method("configure") or not screen.has_method("select_target") or not screen.has_method("current_preview") or not screen.has_method("request_confirmation") or not screen.has_method("confirm"):
        screen.queue_free()
        return
    screen.configure(coordinator, &"use-opaque-1")
    screen._ready()
    var preview: Dictionary = screen.select_target(
        &"incident.root",
        {"target_valid": true, "label": "Root"},
        {"known_improvement": "stabilize"}
    )
    case.assert_equal(&"FINAL_PREVIEW_READY", preview.get("status", &""), "a valid explicit target receives the Coordinator preview")
    var status_label = screen.find_child("Status", true, false) as Label
    var main_commit_bar = screen.find_child("CommitBar", true, false)
    case.assert_equal("FINAL_PREVIEW_READY", status_label.text if status_label != null else "", "authoritative preview state is visible as text")
    case.assert_true(bool(main_commit_bar.visual_snapshot().get("can_commit", false)), "valid preview enables only the intent-level commit control")
    case.assert_equal(1, coordinator.preview_calls.size(), "screen delegates target preview exactly once")
    var invalid_preview: Dictionary = screen.select_target(
        &"incident.invalid",
        {"target_valid": false, "label": "Invalid"},
        {}
    )
    case.assert_equal(&"INVALID_TARGET", invalid_preview.get("status", &""), "invalid selection reports the authority status")
    case.assert_true(screen.current_preview().is_empty(), "invalid target clears stale preview truth")
    case.assert_equal(2, coordinator.preview_calls.size(), "invalid target still delegates validation to the Coordinator once")
    screen.select_target(&"incident.root", {"target_valid": true, "label": "Root"}, {})
    case.assert_true(screen.request_confirmation(), "first explicit use action requests confirmation")
    case.assert_true(bool(main_commit_bar.visual_snapshot().get("confirmation_required", false)), "confirmation state becomes textually distinct before final use")
    case.assert_equal(1, coordinator.confirmation_requests, "screen delegates confirmation request exactly once")
    main_commit_bar.edit_requested.emit()
    case.assert_false(bool(main_commit_bar.visual_snapshot().get("confirmation_required", true)), "edit cancels confirmation before a new target decision")
    case.assert_equal(&"USE_CONFIRMATION_REQUIRED", screen.confirm(&"use-opaque-1").get("status", &""), "edit prevents a stale confirmation from casting")
    case.assert_true(screen.request_confirmation(), "cast requires a new explicit confirmation after edit")
    case.assert_equal(&"USE_CONFIRMATION_REQUIRED", screen.confirm(&"wrong-id").get("status", &""), "mismatched caller ID fails closed")
    case.assert_equal(0, coordinator.confirmed_ids.size(), "mismatched ID never reaches gameplay authority")
    case.assert_equal(&"USED", screen.confirm(&"use-opaque-1").get("status", &""), "second explicit action invokes existing use authority")
    case.assert_equal([&"use-opaque-1"], coordinator.confirmed_ids, "opaque caller ID reaches existing authority once")
    case.assert_equal(&"USE_CONFIRMATION_REQUIRED", screen.confirm(&"use-opaque-1").get("status", &""), "duplicate confirmation fails closed")
    case.assert_equal(1, coordinator.confirmed_ids.size(), "duplicate confirmation never calls authority twice")
    screen.queue_free()

    var selection_screen = packed_scene.instantiate()
    var selection_coordinator = FakeCoordinator.new()
    case.assert_true(selection_screen.has_method("set_target_choices"), "screen accepts caller-supplied explicit target choices")
    if selection_screen.has_method("set_target_choices"):
        selection_screen.configure(selection_coordinator, &"use-opaque-2")
        selection_screen._ready()
        selection_screen.set_target_choices([{
            "id": &"root-choice",
            "label": "Root",
            "hint": "Stabilize the incident",
            "target_keyword": &"incident.root",
            "target": {"target_valid": true},
            "payload": {"known_improvement": "stabilize"},
        }])
        var selector = selection_screen.find_child("TargetSelector", true, false)
        case.assert_equal(1, selector.visual_snapshot().get("targets", []).size(), "shared selector displays caller-supplied choices")
        selector.target_selected.emit(&"root-choice")
        case.assert_equal(&"FINAL_PREVIEW_READY", selection_screen.current_preview().get("status", &""), "selector emits only explicit caller choice to Coordinator preview")
        case.assert_equal(1, selection_coordinator.preview_calls.size(), "selector does not infer or auto-select a target")
        var commit_bar = selection_screen.find_child("CommitBar", true, false)
        case.assert_true(selection_screen.has_signal("cancel_requested"), "screen exposes a non-mutating cancel intent")
        case.assert_true(selection_screen.has_method("cancel"), "screen exposes an explicit cancellation method")
        commit_bar.commit_requested.emit()
        case.assert_equal(1, selection_coordinator.confirmation_requests, "first shared commit action asks existing authority for confirmation")
        commit_bar.commit_requested.emit()
        case.assert_equal([&"use-opaque-2"], selection_coordinator.confirmed_ids, "second shared commit action forwards the configured opaque ID once")
        var cancel_counts: Array[int] = [0]
        selection_screen.cancel_requested.connect(func(): cancel_counts[0] += 1)
        selection_screen.cancel()
        case.assert_equal(1, cancel_counts[0], "explicit cancel emits player intent without gameplay mutation")
    selection_screen.queue_free()

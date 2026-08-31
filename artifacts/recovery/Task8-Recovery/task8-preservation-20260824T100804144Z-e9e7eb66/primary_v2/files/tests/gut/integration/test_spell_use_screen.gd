extends GutTest

const SCREEN_PATH := "res://src/ui/spell_workflow/spell_use_screen.tscn"


class PreviewCoordinator:
    var preview_calls: Array[Dictionary] = []
    var confirmation_requests := 0
    var confirm_calls: Array[StringName] = []

    func request_use_confirmation() -> bool:
        confirmation_requests += 1
        return true

    func confirm_use(transaction_id: StringName) -> Dictionary:
        confirm_calls.append(transaction_id)
        return {"status": &"USED"}

    func prepare_target_preview(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> Dictionary:
        preview_calls.append({
            "target_keyword": target_keyword,
            "target": target.duplicate(true),
            "payload": payload.duplicate(true),
        })
        if not bool(target.get("target_valid", false)):
            return {"status": &"INVALID_TARGET", "reason": &"TARGET_STALE"}
        return {
            "status": &"FINAL_PREVIEW_READY",
            "preview": {"target_keyword": target_keyword, "final_mana": 7, "success_percent": 80, "expected_result": "동결"},
        }


func test_confirm_is_disabled_until_valid_target_is_selected() -> void:
    assert_true(
        FileAccess.file_exists(SCREEN_PATH),
        "Spell Use screen must exist to enforce explicit target confirmation",
    )
    if not FileAccess.file_exists(SCREEN_PATH):
        return

    var packed_scene := load(SCREEN_PATH) as PackedScene
    assert_not_null(packed_scene, "Spell Use screen must load")
    if packed_scene == null:
        return

    var screen := packed_scene.instantiate()
    var confirm_button := screen.find_child("ConfirmButton", true, false) as Button
    assert_not_null(confirm_button, "Spell Use screen exposes an explicit confirm action")
    if confirm_button != null:
        assert_true(confirm_button.disabled, "confirm stays disabled until a valid target is selected")
    screen.queue_free()


func test_valid_target_routes_through_stage3_preview_authority() -> void:
    var packed_scene := load(SCREEN_PATH) as PackedScene
    assert_not_null(packed_scene, "Spell Use screen must load")
    if packed_scene == null:
        return

    var screen := packed_scene.instantiate()
    assert_true(screen.has_method("configure"), "Spell Use screen accepts the existing coordinator")
    assert_true(screen.has_method("select_target"), "Spell Use screen exposes explicit target intent")
    if not screen.has_method("configure") or not screen.has_method("select_target"):
        screen.queue_free()
        return

    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator)
    var result: Dictionary = screen.select_target(
        &"frostbloom",
        {"target_valid": true, "name": "서리꽃"},
        {"effect": "freeze"},
    )

    assert_eq(result.get("status", &""), &"FINAL_PREVIEW_READY")
    assert_eq(coordinator.preview_calls.size(), 1)
    assert_eq(coordinator.preview_calls[0].get("target_keyword", &""), &"frostbloom")
    screen.queue_free()


func test_changing_target_refreshes_the_stage3_preview_without_committing() -> void:
    var packed_scene := load(SCREEN_PATH) as PackedScene
    assert_not_null(packed_scene, "Spell Use screen must load")
    if packed_scene == null:
        return

    var screen := packed_scene.instantiate()
    assert_true(screen.has_method("current_preview"), "Spell Use screen exposes the currently rendered Stage 3 preview")
    if not screen.has_method("current_preview"):
        screen.queue_free()
        return

    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator)
    screen.select_target(&"ward", {"target_valid": true, "name": "보호 결계"}, {"effect": "protect"})
    var replacement: Dictionary = screen.select_target(
        &"frostbloom",
        {"target_valid": true, "name": "서리꽃"},
        {"effect": "freeze"},
    )

    assert_eq(replacement.get("status", &""), &"FINAL_PREVIEW_READY")
    assert_eq(coordinator.preview_calls.size(), 2, "target change requests a replacement preview")
    assert_eq(coordinator.preview_calls[1].get("target_keyword", &""), &"frostbloom")
    assert_eq(Dictionary(screen.current_preview()).get("target_keyword", &""), &"frostbloom", "screen renders the replacement Stage 3 preview")
    screen.queue_free()


func test_final_mana_and_expected_result_display_use_stage3_preview_values() -> void:
    var packed_scene := load(SCREEN_PATH) as PackedScene
    assert_not_null(packed_scene, "Spell Use screen must load")
    if packed_scene == null:
        return

    var screen := packed_scene.instantiate()
    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator)
    screen.select_target(&"frostbloom", {"target_valid": true, "name": "서리꽃"}, {"effect": "freeze"})

    var mana_label := screen.find_child("FinalManaLabel", true, false) as Label
    var result_label := screen.find_child("ExpectedResultLabel", true, false) as Label
    assert_not_null(mana_label, "final Mana has a dedicated display")
    assert_not_null(result_label, "expected result has a dedicated display")
    if mana_label != null:
        assert_string_contains(mana_label.text, "7", "final Mana display uses the Stage 3 preview value")
    if result_label != null:
        assert_string_contains(result_label.text, "동결", "expected result display uses the Stage 3 preview value")
    screen.queue_free()


func test_request_use_confirmation_precedes_any_commit() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator)
    screen.select_target(&"frostbloom", {"target_valid": true}, {"effect": "freeze"})
    assert_true(screen.has_method("request_confirmation"), "screen exposes an explicit confirmation request")
    if screen.has_method("request_confirmation"):
        assert_true(screen.request_confirmation())
        assert_eq(coordinator.confirmation_requests, 1)
        assert_eq(coordinator.confirm_calls.size(), 0, "confirmation request does not commit")
    screen.queue_free()


func test_explicit_confirmation_calls_stage3_confirm_once() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator)
    screen.select_target(&"frostbloom", {"target_valid": true}, {"effect": "freeze"})
    screen.request_confirmation()
    assert_true(screen.has_method("confirm"), "screen exposes explicit confirm activation")
    if screen.has_method("confirm"):
        var result: Dictionary = screen.confirm(&"use-frostbloom")
        assert_eq(result.get("status", &""), &"USED")
        assert_eq(coordinator.confirm_calls, [&"use-frostbloom"])
    screen.queue_free()


func test_stale_target_cancel_and_semantic_confirm_fail_closed_and_remain_accessible() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator)
    screen.select_target(&"frostbloom", {"target_valid": true, "name": "아주 긴 서리꽃 대상 이름"}, {"effect": "freeze"})
    screen.request_confirmation()
    screen.select_target(&"forged", {"target_valid": false}, {"effect": "forged"})
    assert_true(screen.has_method("cancel"), "cancel/back has an explicit semantic path")
    assert_true(screen.has_method("activate_confirm"), "keyboard, gamepad, and touch share semantic confirm activation")
    if screen.has_method("cancel"):
        assert_eq(Dictionary(screen.cancel()).get("status", &""), &"CANCELLED")
    if screen.has_method("activate_confirm"):
        assert_eq(Dictionary(screen.activate_confirm(&"stale-use")).get("status", &""), &"USE_CONFIRMATION_REQUIRED")
    assert_eq(coordinator.confirm_calls.size(), 0, "invalid/stale target cannot commit")
    var cancel_button := screen.find_child("CancelButton", true, false) as Button
    var target_label := screen.find_child("SelectedTargetLabel", true, false) as Label
    assert_not_null(cancel_button, "cancel remains a distinct reachable control")
    assert_not_null(target_label, "selected target state has text, not color-only meaning")
    if target_label != null:
        assert_string_contains(target_label.text, "선택 대상", "long Korean target state remains structurally labeled")
    screen.queue_free()


func test_confirm_button_uses_the_configured_opaque_transaction_id_in_two_stages() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()
    var supplied_transaction_id: StringName = &"task8-test-use-opaque-id"

    screen.configure(coordinator, supplied_transaction_id)
    screen.select_target(&"frostbloom", {"target_valid": true}, {"effect": "freeze"})
    var confirm_button := screen.find_child("ConfirmButton", true, false) as Button
    assert_not_null(confirm_button, "the explicit confirm button exists")
    if confirm_button == null:
        screen.queue_free()
        return

    confirm_button.pressed.emit()
    assert_eq(coordinator.confirmation_requests, 1, "the first actual ConfirmButton press requests confirmation")
    assert_eq(coordinator.confirm_calls.size(), 0, "the first actual ConfirmButton press does not commit")

    confirm_button.pressed.emit()
    assert_eq(coordinator.confirm_calls, [supplied_transaction_id], "the second actual ConfirmButton press commits with the exact caller-supplied opaque transaction ID")

    confirm_button.pressed.emit()
    assert_eq(coordinator.confirm_calls.size(), 1, "activation after a successful commit cannot commit a second time")
    screen.queue_free()


func test_target_choice_button_routes_supplied_data_to_stage3_preview_authority() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator)
    assert_true(screen.has_method("set_target_choices"), "the screen exposes caller-supplied player-operable target choices")
    if not screen.has_method("set_target_choices"):
        screen.queue_free()
        return

    var target := {"target_valid": true, "name": "서리꽃"}
    var payload := {"effect": "freeze", "source": "task8-test"}
    screen.set_target_choices([{"target_keyword": &"frostbloom", "target": target, "payload": payload}])
    var target_button := screen.find_child("TargetChoice_frostbloom", true, false) as Button
    assert_not_null(target_button, "an explicit target Button exists for the supplied target")
    if target_button != null:
        target_button.pressed.emit()

    assert_eq(coordinator.preview_calls.size(), 1, "player Button activation requests one Stage 3 preview")
    if coordinator.preview_calls.size() == 1:
        assert_eq(coordinator.preview_calls[0].get("target_keyword", &""), &"frostbloom")
        assert_eq(coordinator.preview_calls[0].get("target", {}), target)
        assert_eq(coordinator.preview_calls[0].get("payload", {}), payload)
    assert_eq(Dictionary(screen.current_preview()).get("target_keyword", &""), &"frostbloom", "player activation renders the returned preview")
    assert_eq(coordinator.confirmation_requests, 0, "target choice does not request confirmation")
    assert_eq(coordinator.confirm_calls.size(), 0, "target choice does not commit")
    screen.queue_free()


func test_prepared_spell_summary_renders_only_caller_supplied_identity_and_context() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()
    assert_true(screen.has_method("render_prepared_spell_summary"), "the screen renders a prepared spell summary supplied by its caller")
    if not screen.has_method("render_prepared_spell_summary"):
        screen.queue_free()
        return

    screen.configure(coordinator)
    screen.render_prepared_spell_summary({"identity": "열기의 오망성", "context": "보관함 · 준비 완료"})
    var summary_label := screen.find_child("PreparedSpellSummaryLabel", true, false) as Label
    assert_not_null(summary_label, "prepared spell identity has a dedicated visible summary")
    if summary_label != null:
        assert_string_contains(summary_label.text, "열기의 오망성")
        assert_string_contains(summary_label.text, "보관함 · 준비 완료")
    assert_eq(coordinator.preview_calls.size(), 0, "rendering the caller-supplied summary does not request a preview")
    assert_eq(coordinator.confirm_calls.size(), 0, "rendering the caller-supplied summary does not commit")
    screen.queue_free()


func test_invalid_target_clears_stale_visual_truth_and_blocks_confirm_button_commit() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator, &"stale-opaque-id")
    screen.select_target(&"frostbloom", {"target_valid": true, "name": "서리꽃"}, {"effect": "freeze"})
    var confirm_button := screen.find_child("ConfirmButton", true, false) as Button
    assert_not_null(confirm_button)
    if confirm_button == null:
        screen.queue_free()
        return
    assert_false(confirm_button.disabled, "a valid preview makes confirmation available")
    confirm_button.pressed.emit()
    assert_eq(coordinator.confirmation_requests, 1, "the valid preview can request confirmation once")

    var invalid: Dictionary = screen.select_target(&"forged", {"target_valid": false}, {"effect": "forged"})
    assert_eq(invalid.get("status", &""), &"INVALID_TARGET")
    assert_eq(screen.current_preview(), {}, "an invalid target clears the stale preview")
    assert_true(confirm_button.disabled, "an invalid target makes confirmation unavailable")
    var selected_target := screen.find_child("SelectedTargetLabel", true, false) as Label
    var mana_label := screen.find_child("FinalManaLabel", true, false) as Label
    var result_label := screen.find_child("ExpectedResultLabel", true, false) as Label
    var status_label := screen.find_child("StatusLabel", true, false) as Label
    assert_string_contains(selected_target.text, "없음", "selected target no longer presents stale truth")
    assert_string_contains(mana_label.text, "-", "final Mana no longer presents stale truth")
    assert_string_contains(result_label.text, "-", "expected result no longer presents stale truth")
    assert_string_contains(status_label.text, "INVALID_TARGET", "the failure status is visible to the player")

    confirm_button.pressed.emit()
    confirm_button.pressed.emit()
    assert_eq(coordinator.confirm_calls.size(), 0, "stale confirmation cannot reach Stage 3 commit")
    screen.queue_free()


func test_cancel_button_emits_one_cancellation_intent_without_commit_or_rollback() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator, &"cancel-opaque-id")
    screen.select_target(&"frostbloom", {"target_valid": true}, {"effect": "freeze"})
    assert_true(screen.has_signal("cancel_requested"), "the screen exposes one cancellation intent for the existing navigation owner")
    if not screen.has_signal("cancel_requested"):
        screen.queue_free()
        return
    var cancellation_events: Array[bool] = []
    screen.cancel_requested.connect(func() -> void: cancellation_events.append(true))
    var preview_before: Dictionary = Dictionary(screen.current_preview())
    var cancel_button := screen.find_child("CancelButton", true, false) as Button
    assert_not_null(cancel_button, "the actual CancelButton is reachable")
    if cancel_button != null:
        cancel_button.pressed.emit()

    assert_eq(cancellation_events.size(), 1, "CancelButton activation emits one cancellation intent")
    assert_eq(screen.current_preview(), preview_before, "cancel does not invent local rollback or restore policy")
    assert_eq(coordinator.confirm_calls.size(), 0, "cancel never commits Stage 3 use")
    screen.queue_free()


func test_target_confirm_cancel_have_explicit_focus_order_and_non_color_text_semantics() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()
    screen.configure(coordinator)
    screen.set_target_choices([{"target_keyword": &"frostbloom", "target": {"target_valid": true, "name": "아주 긴 서리꽃 대상 이름"}, "payload": {"effect": "freeze"}}])
    var target_button := screen.find_child("TargetChoice_frostbloom", true, false) as Button
    var confirm_button := screen.find_child("ConfirmButton", true, false) as Button
    var cancel_button := screen.find_child("CancelButton", true, false) as Button
    var selected_target := screen.find_child("SelectedTargetLabel", true, false) as Label
    var status_label := screen.find_child("StatusLabel", true, false) as Label
    assert_not_null(target_button)
    assert_not_null(confirm_button)
    assert_not_null(cancel_button)
    if target_button != null and confirm_button != null and cancel_button != null:
        assert_eq(target_button.focus_mode, Control.FOCUS_ALL, "target uses standard Button focus semantics")
        assert_eq(confirm_button.focus_mode, Control.FOCUS_ALL, "confirm uses standard Button focus semantics")
        assert_eq(cancel_button.focus_mode, Control.FOCUS_ALL, "cancel uses standard Button focus semantics")
        assert_false(target_button.focus_next.is_empty(), "target exposes an explicit next-focus route")
        if not target_button.focus_next.is_empty():
            assert_eq(target_button.get_node(target_button.focus_next), confirm_button, "target focus advances deterministically to confirm")
        assert_false(confirm_button.focus_next.is_empty(), "confirm exposes an explicit next-focus route")
        if not confirm_button.focus_next.is_empty():
            assert_eq(confirm_button.get_node(confirm_button.focus_next), cancel_button, "confirm focus advances deterministically to cancel")
    assert_string_contains(target_button.text, "대상 선택", "long Korean target labels retain an explicit action prefix")
    assert_string_contains(selected_target.text, "선택 대상", "selected state has text meaning beyond color")
    assert_string_contains(status_label.text, "대상", "disabled confirmation reason is visible as text")
    screen.queue_free()


func test_information_hierarchy_orders_summary_choices_preview_confirm_and_cancel() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var content := screen.find_child("Content", true, false) as VBoxContainer
    assert_not_null(content, "spell use information has one explicit vertical hierarchy")
    if content != null:
        var child_names: Array[String] = []
        for child in content.get_children():
            child_names.append(child.name)
        assert_eq(
            child_names,
            ["PreparedSpellSummaryLabel", "TargetPrompt", "TargetChoices", "PreviewDetails", "ConfirmButton", "CancelButton"],
            "prepared summary leads to choices, current preview, confirm, then cancel/back",
        )
    screen.queue_free()


func test_confirm_button_fails_closed_when_configuration_has_no_transaction_id() -> void:
    var screen := (load(SCREEN_PATH) as PackedScene).instantiate()
    var coordinator := PreviewCoordinator.new()

    screen.configure(coordinator, &"")
    screen.select_target(&"frostbloom", {"target_valid": true}, {"effect": "freeze"})
    var confirm_button := screen.find_child("ConfirmButton", true, false) as Button
    assert_not_null(confirm_button, "the explicit confirm button exists")
    if confirm_button == null:
        screen.queue_free()
        return

    confirm_button.pressed.emit()
    confirm_button.pressed.emit()

    assert_eq(coordinator.confirmation_requests, 1, "a prepared target still requires a distinct first confirmation press")
    assert_eq(coordinator.confirm_calls.size(), 0, "an empty or missing transaction ID fails closed without calling Stage 3 commit")
    screen.queue_free()

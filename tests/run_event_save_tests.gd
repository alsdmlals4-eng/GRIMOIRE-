extends SceneTree

func _init() -> void:
    var check = preload("res://tests/test_case.gd").new()
    var path := "res://src/core/shared_spell/event_save.gd"
    check.assert_true(FileAccess.file_exists(path), "event progress needs verified recovery without touching old saves")
    if FileAccess.file_exists(path):
        var store = load(path).new()
        var engine = preload("res://src/core/shared_spell/event_session.gd").new()
        var folder := "res://artifacts/local-validation/event-save-tests"
        var initial: Dictionary = engine.start("GREENHOUSE_LEAK_01", "save-test")
        var packet := {"story_index": 1, "session": initial, "last_receipt": {}}
        var first: Dictionary = store.save_progress(folder, packet)
        check.assert_equal("SAVED", first.status, "valid snapshot persists")
        var loaded: Dictionary = store.load_progress(folder)
        check.assert_equal(packet, loaded.payload, "types and state survive persistence")
        var command := {"id": "close", "expected_revision": 0, "kind": "CLOSE_LEAK"}
        var changed: Dictionary = engine.act(initial, command)
        packet.session = changed.state
        packet.last_receipt = changed.receipt
        var second: Dictionary = store.save_progress(folder, packet)
        check.assert_equal("SAVED", second.status, "second slot saves newer state")
        loaded = store.load_progress(folder)
        check.assert_equal(packet, loaded.payload, "newest valid generation wins")
        check.assert_equal("REPLAY", engine.act(loaded.payload.session, command).status, "reload does not repeat action")
        # Corrupt only the exact slot created by this test; older valid slot must survive.
        var file := FileAccess.open(second.path, FileAccess.WRITE)
        file.store_buffer(PackedByteArray([0, 1, 2]))
        file.close()
        var recovered: Dictionary = store.load_progress(folder)
        check.assert_equal("LOADED", recovered.status, "corrupt latest slot falls back")
        check.assert_equal(0, recovered.payload.session.spell_state.elapsed_actions, "fallback is previous complete generation")
        var bad := packet.duplicate(true)
        bad.session.spell_state.mana = -1
        check.assert_equal("INVALID_PROGRESS", store.save_progress(folder, bad).reason, "invalid state cannot overwrite good slot")
        bad = packet.duplicate(true)
        bad.story_index = 0
        check.assert_equal("INVALID_PROGRESS", store.save_progress(folder, bad).reason, "story identity must match event")
        bad = packet.duplicate(true)
        bad.last_receipt = {"unexpected": true}
        check.assert_equal("INVALID_PROGRESS", store.save_progress(folder, bad).get("reason"), "invalid presentation receipt cannot crash resumed UI")
        bad = packet.duplicate(true)
        bad.session.consequences = [{}]
        check.assert_equal("INVALID_PROGRESS", store.save_progress(folder, bad).get("reason"), "session consequences must contain strings before persistence")
    print(JSON.stringify({"assertions": check.assertion_count(), "failures": check.failure_count(), "messages": check.failures()}))
    quit(0 if check.failure_count() == 0 else 1)

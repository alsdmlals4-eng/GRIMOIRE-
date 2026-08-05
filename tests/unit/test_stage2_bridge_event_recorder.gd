extends RefCounted

const RECORDER_PATH := "res://src/core/stage2/stage2_bridge_event_recorder.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(RECORDER_PATH), "Stage2 event recorder must exist")
    if not FileAccess.file_exists(RECORDER_PATH):
        return
    var script = load(RECORDER_PATH)
    case.assert_true(script != null and script.can_instantiate(), "Event recorder must load")
    if script == null or not script.can_instantiate():
        return
    var recorder = script.create({
        "participant_id": &"P-ANON-001",
        "artifact_sha": "redacted-test-sha",
        "fixture_id": &"SCENARIO_A_NONCOMBAT_PROTECT_CONTROL",
        "hand": &"DOMINANT",
        "device_class": &"PHONE_WIDE",
    })
    case.assert_true(recorder != null, "Anonymous metadata creates recorder")
    if recorder == null:
        return

    case.assert_true(recorder.record(&"RECOGNITION_EVENT_STREAM", &"evt-1", {
        "attempt_phase": &"FIRST_ATTEMPT",
        "status": &"LOW_CONFIDENCE_REQUIRES_RETRY",
    }), "First recognition event records")
    case.assert_false(recorder.record(&"RECOGNITION_EVENT_STREAM", &"evt-1", {
        "attempt_phase": &"POST_FEEDBACK",
    }), "Duplicate event ID is rejected")
    case.assert_true(recorder.record(&"CORE_LOOP_EVENT_STREAM", &"evt-2", {
        "state": &"PREVIEW_READY",
    }), "Core-loop event records separately")
    case.assert_true(recorder.record(&"MODERATOR_INTERVENTION_EVENT", &"evt-3", {
        "intervention_type": &"REPEAT_PROMPT",
    }), "Moderator intervention records separately")
    case.assert_false(recorder.record(&"CORE_LOOP_EVENT_STREAM", &"evt-pii", {
        "email": "not-allowed@example.com",
    }), "Raw personal identifiers are rejected")

    var exported: Dictionary = recorder.export_data()
    case.assert_equal(1, exported.streams.RECOGNITION_EVENT_STREAM.size(), "Recognition stream is separate")
    case.assert_equal(1, exported.streams.CORE_LOOP_EVENT_STREAM.size(), "Core loop stream is separate")
    case.assert_equal(1, exported.streams.MODERATOR_INTERVENTION_EVENT.size(), "Moderator stream is separate")
    case.assert_false(exported.session.has("name"), "No raw name is stored")
    case.assert_false(exported.session.has("email"), "No raw email is stored")

class_name Stage2BridgeEventRecorder
extends RefCounted

const SELF_PATH := "res://src/core/stage2/stage2_bridge_event_recorder.gd"
const STREAMS := [
    &"RECOGNITION_EVENT_STREAM",
    &"CORE_LOOP_EVENT_STREAM",
    &"MODERATOR_INTERVENTION_EVENT",
]
const REQUIRED_SESSION_KEYS := [
    &"participant_id",
    &"artifact_sha",
    &"fixture_id",
    &"hand",
    &"device_class",
]
const FORBIDDEN_PII_KEYS := [
    &"name",
    &"email",
    &"phone",
    &"contact",
    &"account",
    &"address",
    &"real_name",
]

var _session: Dictionary = {}
var _streams: Dictionary = {}
var _seen_event_ids: Dictionary = {}


static func create(session: Dictionary):
    if _contains_forbidden_key(session):
        return null
    for key in REQUIRED_SESSION_KEYS:
        var value: Variant = session.get(key, null)
        if value == null or String(value).strip_edges().is_empty():
            return null
    if not String(session.get("participant_id", "")).begins_with("P-ANON-"):
        return null

    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var recorder = script.new()
    recorder._session = session.duplicate(true)
    for stream in STREAMS:
        recorder._streams[stream] = []
    return recorder


func record(stream: StringName, event_id: StringName, payload: Dictionary) -> bool:
    if stream not in STREAMS or event_id.is_empty() or _seen_event_ids.has(event_id):
        return false
    if _contains_forbidden_key(payload):
        return false
    var event := payload.duplicate(true)
    event["event_id"] = event_id
    event["stream"] = stream
    _streams[stream].append(event)
    _seen_event_ids[event_id] = true
    return true


func export_data() -> Dictionary:
    var exported_streams: Dictionary = {}
    for stream in STREAMS:
        exported_streams[stream] = Array(_streams.get(stream, [])).duplicate(true)
    return {
        "schema_version": 1,
        "session": _session.duplicate(true),
        "streams": exported_streams,
    }


static func _contains_forbidden_key(value: Variant) -> bool:
    if typeof(value) == TYPE_DICTIONARY:
        var dictionary: Dictionary = value
        for key_variant in dictionary.keys():
            var normalized := StringName(String(key_variant).to_lower())
            if normalized in FORBIDDEN_PII_KEYS:
                return true
            if _contains_forbidden_key(dictionary[key_variant]):
                return true
    elif typeof(value) == TYPE_ARRAY:
        for item in value:
            if _contains_forbidden_key(item):
                return true
    return false

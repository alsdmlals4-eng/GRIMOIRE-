extends RefCounted
## Two bounded local slots. Corrupt/incomplete newest write falls back to prior.
## Checksum detects corruption, not malicious tampering. No legacy migration.

const SessionRules = preload("res://src/core/shared_spell/event_session.gd")
const Definitions = preload("res://src/core/shared_spell/event_definitions.gd")
const MAGIC := "GRIMOIRE_EVENT_SAVE_1\n"
const MAX_BYTES := 2097152

func save_progress(folder: String, payload: Dictionary) -> Dictionary:
    if not _valid_payload(payload):
        return {"status": "REJECTED", "reason": "INVALID_PROGRESS"}
    if DirAccess.make_dir_recursive_absolute(folder) != OK:
        return {"status": "REJECTED", "reason": "DIRECTORY_UNWRITABLE"}
    var prior := load_progress(folder)
    var generation: int = prior.get("generation", 0) + 1
    var index: int = 1 - prior.get("slot", 1)
    var path := folder.path_join("event-" + str(index) + ".save")
    var bytes := var_to_bytes({"generation": generation, "payload": payload})
    if bytes.size() > MAX_BYTES:
        return {"status": "REJECTED", "reason": "SAVE_TOO_LARGE"}
    var file := FileAccess.open(path, FileAccess.WRITE)
    if file == null:
        return {"status": "REJECTED", "reason": "SAVE_UNWRITABLE"}
    file.store_buffer(MAGIC.to_utf8_buffer())
    file.store_buffer(_digest(bytes))
    file.store_buffer(bytes)
    file.flush()
    var write_error := file.get_error()
    file.close()
    var verified := _read(path)
    if write_error != OK or verified.get("payload") != payload or verified.get("generation") != generation:
        return {"status": "REJECTED", "reason": "SAVE_VERIFY_FAILED"}
    return {"status": "SAVED", "path": path, "generation": generation}

func load_progress(folder: String) -> Dictionary:
    var best: Dictionary = {}
    for slot in range(2):
        var candidate := _read(folder.path_join("event-" + str(slot) + ".save"))
        if not candidate.is_empty() and candidate.generation > best.get("generation", -1):
            best = candidate
            best.slot = slot
    if best.is_empty():
        return {"status": "REJECTED", "reason": "NO_VALID_SAVE"}
    best.status = "LOADED"
    return best

func _read(path: String) -> Dictionary:
    if not FileAccess.file_exists(path):
        return {}
    var file := FileAccess.open(path, FileAccess.READ)
    if file == null or file.get_length() > MAX_BYTES + 128:
        return {}
    var header := MAGIC.to_utf8_buffer()
    if file.get_length() <= header.size() + 32 or file.get_buffer(header.size()) != header:
        return {}
    var digest := file.get_buffer(32)
    var bytes := file.get_buffer(file.get_length() - file.get_position())
    if _digest(bytes) != digest:
        return {}
    var decoded = bytes_to_var(bytes) # Object deserialization intentionally disabled.
    if not decoded is Dictionary or not decoded.get("generation") is int or decoded.generation < 1:
        return {}
    if not decoded.get("payload") is Dictionary or not _valid_payload(decoded.payload):
        return {}
    return decoded

func _valid_payload(payload: Dictionary) -> bool:
    if not payload.get("story_index") is int or payload.story_index < 0 or payload.story_index >= Definitions.IDS.size():
        return false
    if not payload.get("session") is Dictionary or not payload.get("last_receipt") is Dictionary:
        return false
    var rules = SessionRules.new()
    if not rules.valid_state(payload.session) or payload.session.event_id != Definitions.IDS[payload.story_index]:
        return false
    if not payload.last_receipt.is_empty():
        if not rules.valid_receipt(payload.last_receipt) or payload.last_receipt not in payload.session.receipts.values():
            return false
    return true

func _digest(bytes: PackedByteArray) -> PackedByteArray:
    var hashing := HashingContext.new()
    hashing.start(HashingContext.HASH_SHA256)
    hashing.update(bytes)
    return hashing.finish()

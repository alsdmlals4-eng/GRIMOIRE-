extends "res://src/core/shared_spell/event_save.gd"
## Reuses checked two-slot envelope, not event payload semantics.
## Caller MUST use a dedicated duel directory; no old event save migration.
const Duel = preload("res://src/core/shared_spell/duel_session.gd")

func _valid_payload(payload: Dictionary) -> bool:
    return payload.get("session") is Dictionary and Duel.new().restore(payload.session).status == "OK"

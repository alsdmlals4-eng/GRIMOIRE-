extends RefCounted

const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(VAULT_PATH), "vault_inventory.gd must exist")
    if not FileAccess.file_exists(VAULT_PATH):
        return

    var Vault = load(VAULT_PATH)
    case.assert_true(Vault != null, "VaultInventory must load")
    if Vault == null:
        return

    var vault = Vault.create(2)
    case.assert_true(vault != null, "positive slot capacity creates Vault")
    case.assert_equal(2, vault.empty_slot_count(), "new Vault starts empty")

    var scribe = vault.reserve_for_scribe(&"HEAT", &"scribe-tx")
    case.assert_equal(&"OK", scribe.status, "empty slot is reserved for scribing")
    case.assert_equal(1, vault.empty_slot_count(), "scribe reservation occupies one slot")
    case.assert_false(vault.consume(scribe.reservation_id), "circuit consume cannot consume scribe reservation")
    case.assert_true(vault.complete_scribe(scribe.reservation_id), "successful scribe fills exact glyph")
    case.assert_false(vault.complete_scribe(scribe.reservation_id), "duplicate scribe completion is rejected")
    case.assert_equal(1, vault.matching_available_count(&"HEAT"), "HEAT exists")
    case.assert_equal(0, vault.matching_available_count(&"FLOW"), "Vault does not convert glyphs")

    var wrong = vault.reserve_matching(&"FLOW", &"node-flow", &"tx-flow")
    case.assert_equal(&"NO_MATCHING_VAULT_GLYPH", wrong.status, "exact glyph rule is enforced")

    var heat = vault.reserve_matching(&"HEAT", &"node-heat", &"tx-heat")
    case.assert_equal(&"OK", heat.status, "matching exact glyph can be reserved")
    case.assert_equal(0, vault.matching_available_count(&"HEAT"), "reserved glyph is unavailable")
    case.assert_true(vault.release(heat.reservation_id), "cancel restores the same slot")
    case.assert_equal(1, vault.matching_available_count(&"HEAT"), "released glyph is available")

    var pending = vault.reserve_for_scribe(&"FLOW", &"scribe-cancel")
    case.assert_equal(&"OK", pending.status, "second slot can be reserved for scribe")
    case.assert_true(vault.release(pending.reservation_id), "interrupted scribe releases slot")
    case.assert_equal(1, vault.empty_slot_count(), "released scribe slot is empty")

    var state = vault.to_dict()
    case.assert_equal(1, state.schema_version, "Vault schema is versioned")
    case.assert_equal(2, state.slot_capacity, "slot capacity is serialized")
    case.assert_equal(2, state.slots.size(), "all slots are serialized")
    var restored = Vault.from_dict(state)
    case.assert_equal(&"OK", restored.status, "valid Vault state restores")
    case.assert_equal(1, restored.vault.matching_available_count(&"HEAT"), "restored exact glyph remains available")

    var duplicate_slot = state.duplicate(true)
    duplicate_slot.slots[1].slot_id = duplicate_slot.slots[0].slot_id
    case.assert_equal(&"CORRUPT_VAULT", Vault.from_dict(duplicate_slot).status, "duplicate slot IDs are rejected")

    var missing_glyph = state.duplicate(true)
    missing_glyph.slots[0].glyph_id = &""
    case.assert_equal(&"CORRUPT_VAULT", Vault.from_dict(missing_glyph).status, "available slot without glyph is rejected")

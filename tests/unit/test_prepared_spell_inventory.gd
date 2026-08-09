# 준비 마법 주문 보관함 불변성과 정확히 한 번 수명주기를 검증한다.
extends RefCounted

const PREPARED_SPELL_PATH := "res://src/core/spells/prepared_spell.gd"
const INVENTORY_PATH := "res://src/core/spells/prepared_spell_inventory.gd"


func _make_spell(PreparedSpell, spell_id: StringName, main_value := &"MAIN"):
    return PreparedSpell.create(
        spell_id,
        {
            "glyph_id": main_value,
            "nested": {"value": 1},
        },
        [
            {
                "glyph_id": &"AUXILIARY",
                "nested": {"value": 2},
            },
        ],
        {
            "success_percent": 75,
            "final_mana": 12,
            "nested": {"value": 3},
        },
        [
            {
                "record_id": &"source-1",
                "nested": {"value": 4},
            },
        ]
    )


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PREPARED_SPELL_PATH), "PreparedSpell implementation must exist")
    case.assert_true(FileAccess.file_exists(INVENTORY_PATH), "PreparedSpellInventory implementation must exist")
    if not FileAccess.file_exists(PREPARED_SPELL_PATH) or not FileAccess.file_exists(INVENTORY_PATH):
        return

    var PreparedSpell = load(PREPARED_SPELL_PATH)
    var PreparedSpellInventory = load(INVENTORY_PATH)
    case.assert_true(PreparedSpell != null and PreparedSpell.can_instantiate(), "PreparedSpell must compile")
    case.assert_true(PreparedSpellInventory != null and PreparedSpellInventory.can_instantiate(), "PreparedSpellInventory must compile")
    if PreparedSpell == null or PreparedSpellInventory == null:
        return
    if not PreparedSpell.can_instantiate() or not PreparedSpellInventory.can_instantiate():
        return

    var main := {"glyph_id": &"MAIN", "nested": {"value": 1}}
    var auxiliaries := [{"glyph_id": &"AUXILIARY", "nested": {"value": 2}}]
    var preview := {"success_percent": 75, "final_mana": 12, "nested": {"value": 3}}
    var sources := [{"record_id": &"source-1", "nested": {"value": 4}}]
    var immutable_spell = PreparedSpell.create(&"spell-immutable", main, auxiliaries, preview, sources)
    case.assert_true(immutable_spell != null, "valid immutable prepared spell is created")
    if immutable_spell == null:
        return
    main.nested.value = 99
    auxiliaries[0].nested.value = 99
    preview.nested.value = 99
    sources[0].nested.value = 99
    var immutable_payload = immutable_spell.serialize()
    case.assert_equal(1, immutable_payload.main.nested.value, "main is deep copied at creation")
    case.assert_equal(2, immutable_payload.auxiliaries[0].nested.value, "auxiliaries are deep copied at creation")
    case.assert_equal(3, immutable_payload.base_preview.nested.value, "preview is deep copied at creation")
    case.assert_equal(4, immutable_payload.source_records[0].nested.value, "source records are deep copied at creation")
    case.assert_true(PreparedSpell.create(&"", {}, [], {"success_percent": 1, "final_mana": 1}, []) == null, "empty spell ID is rejected")
    case.assert_true(PreparedSpell.create(&"missing-main", {}, [], {"success_percent": 1, "final_mana": 1}, []) == null, "missing main is rejected")
    case.assert_true(PreparedSpell.create(&"too-many", {"glyph_id": &"MAIN"}, [{}, {}, {}, {}, {}, {}], {"success_percent": 1, "final_mana": 1}, []) == null, "more than five auxiliaries is rejected")
    case.assert_true(PreparedSpell.create(&"missing-preview-key", {"glyph_id": &"MAIN"}, [], {"success_percent": 1}, []) == null, "incomplete preview is rejected")

    var inventory = PreparedSpellInventory.new()
    var add_first = inventory.add_once(&"prepare-1", immutable_spell)
    case.assert_true(add_first.ok, "first preparation is stored")
    var changed_candidate = _make_spell(PreparedSpell, &"spell-different", &"OTHER")
    var add_replay = inventory.add_once(&"prepare-1", changed_candidate)
    case.assert_true(add_replay.ok, "same preparation transaction is idempotent")
    case.assert_equal(&"spell-immutable", add_replay.spell.spell_id, "same preparation transaction returns the original stored spell")
    case.assert_false(inventory.add_once(&"", changed_candidate).ok, "empty preparation transaction is rejected without mutation")
    case.assert_false(inventory.add_once(&"prepare-2", immutable_spell).ok, "a different preparation transaction cannot reuse a spell ID")

    var public_spell = inventory.spell(&"spell-immutable")
    public_spell.main.nested.value = 777
    case.assert_equal(1, inventory.spell(&"spell-immutable").main.nested.value, "public spell reads are deep copies")
    case.assert_equal(&"READY", inventory.spell(&"spell-immutable").status, "unconsumed public spell is READY")

    var use_first = inventory.mark_used_once(&"spell-immutable", &"use-1")
    case.assert_true(use_first.ok, "prepared spell can be marked used once")
    var use_replay = inventory.mark_used_once(&"spell-immutable", &"use-1")
    case.assert_true(use_replay.ok, "same use transaction returns its original idempotent outcome")
    case.assert_equal(use_first, use_replay, "same use transaction returns the original result")
    case.assert_false(inventory.mark_used_once(&"spell-immutable", &"use-2").ok, "different use transaction after consumption is rejected")
    case.assert_equal(&"SPELL_ALREADY_USED", inventory.mark_used_once(&"spell-immutable", &"use-2").code, "post-consumption rejection is explicit")
    case.assert_false(inventory.mark_used_once(&"spell-immutable", &"").ok, "empty use transaction is rejected without mutation")
    case.assert_equal(&"USED", inventory.spell(&"spell-immutable").status, "public lifecycle status is derived from use ownership")

    var second_spell = _make_spell(PreparedSpell, &"spell-second")
    case.assert_true(inventory.add_once(&"prepare-3", second_spell).ok, "second spell is stored")
    var use_collision = inventory.mark_used_once(&"spell-second", &"use-1")
    case.assert_false(use_collision.ok, "one use transaction cannot belong to two spells")
    case.assert_equal(&"USE_TRANSACTION_CONFLICT", use_collision.code, "cross-spell use transaction collision fails closed")
    case.assert_equal(&"READY", inventory.spell(&"spell-second").status, "collision leaves second spell READY")

    var saved = inventory.serialize()
    case.assert_equal(&"READY", saved.spells[0].payload.status, "serialized immutable payload remains READY")
    var restored = PreparedSpellInventory.new()
    case.assert_true(restored.restore(saved), "valid serialized state restores")
    case.assert_equal(&"USED", restored.spell(&"spell-immutable").status, "restore derives USED from use index")
    case.assert_equal(&"READY", restored.serialize().spells[0].payload.status, "restore does not rewrite immutable payload status")
    case.assert_equal(saved, restored.serialize(), "serialize is deterministic after round trip")

    var before_bad_restore = restored.serialize()
    var malformed = restored.serialize()
    malformed.use_transactions.append({"spell_id": &"spell-second", "use_transaction_id": &"use-1"})
    case.assert_false(restored.restore(malformed), "conflicting restore is rejected")
    case.assert_equal(before_bad_restore, restored.serialize(), "failed restore is atomic")
    var non_ready = restored.serialize()
    non_ready.spells[0].payload.status = &"USED"
    case.assert_false(restored.restore(non_ready), "non-READY immutable payload is rejected")
    case.assert_equal(before_bad_restore, restored.serialize(), "non-READY restore failure is atomic")

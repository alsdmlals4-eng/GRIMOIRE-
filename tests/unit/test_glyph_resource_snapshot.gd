extends RefCounted

const SNAPSHOT_PATH := "res://src/persistence/glyph_resource_snapshot.gd"
const SAVE_PATH := "res://src/persistence/save_repository.gd"
const STOCK_PATH := "res://src/core/resources/universal_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const CHARGE_PATH := "res://src/core/resources/universal_stock_charge.gd"
const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const MANA_PATH := "res://src/core/resources/mana_pool.gd"
const TYPES_PATH := "res://src/core/resources/glyph_resource_types.gd"
const SAVE_FILE := "user://glyph_resource_snapshot_test.json"

func run(case) -> void:
    _cleanup_save()
    var required_paths := [SNAPSHOT_PATH, SAVE_PATH]
    var all_exist := true
    for path in required_paths:
        var exists: bool = bool(FileAccess.file_exists(path))
        case.assert_true(exists, "Task 7 file must exist: %s" % path)
        all_exist = all_exist and exists
    if not all_exist:
        return

    var Snapshot = load(SNAPSHOT_PATH)
    var SaveRepository = load(SAVE_PATH)
    var Stock = load(STOCK_PATH)
    var Vault = load(VAULT_PATH)
    var Charge = load(CHARGE_PATH)
    var Ledger = load(LEDGER_PATH)
    var Mana = load(MANA_PATH)
    var Types = load(TYPES_PATH)
    case.assert_true(Snapshot != null and Snapshot.can_instantiate(), "GlyphResourceSnapshot compiles")
    case.assert_true(SaveRepository != null and SaveRepository.can_instantiate(), "SaveRepository compiles")
    if Snapshot == null or SaveRepository == null:
        return

    var fixture = _make_fixture(Stock, Vault, Charge, Ledger, Mana, Types)
    var snapshot = Snapshot.capture(
        fixture.stock,
        fixture.vault,
        fixture.charge,
        fixture.ledger,
        fixture.mana
    )
    var keys: Array = snapshot.keys()
    keys.sort()
    var expected_keys := [
        "charge",
        "mana",
        "reservations",
        "schema_version",
        "universal_stock",
        "vault",
    ]
    expected_keys.sort()
    case.assert_equal(expected_keys, keys, "resource snapshot top-level fields are exact")

    var restored = Snapshot.restore(snapshot)
    case.assert_equal(&"OK", restored.status, "valid snapshot restores")
    var round_trip = Snapshot.capture(
        restored.stock,
        restored.vault,
        restored.charge,
        restored.ledger,
        restored.mana
    )
    case.assert_equal(snapshot, round_trip, "resource snapshot round trip is deterministic")

    var over_capacity = snapshot.duplicate(true)
    over_capacity.universal_stock.current_total = over_capacity.universal_stock.capacity + 1
    case.assert_equal(&"CORRUPT_RESOURCE_SNAPSHOT", Snapshot.restore(over_capacity).status, "Stock over capacity is rejected")

    var duplicate_slot = snapshot.duplicate(true)
    duplicate_slot.vault.slots[1].slot_id = duplicate_slot.vault.slots[0].slot_id
    case.assert_equal(&"CORRUPT_RESOURCE_SNAPSHOT", Snapshot.restore(duplicate_slot).status, "duplicate Vault slot ID is rejected")

    var missing_owner = snapshot.duplicate(true)
    missing_owner.reservations.erase(&"support")
    case.assert_equal(&"CORRUPT_RESOURCE_SNAPSHOT", Snapshot.restore(missing_owner).status, "orphan resource reservation is rejected")

    var empty_reference = snapshot.duplicate(true)
    for slot in empty_reference.vault.slots:
        if int(slot.state) == 2:
            slot.state = 0
            slot.glyph_id = ""
            slot.reservation_id = ""
            slot.node_id = ""
            slot.transaction_id = ""
            break
    case.assert_equal(&"CORRUPT_RESOURCE_SNAPSHOT", Snapshot.restore(empty_reference).status, "reservation referencing EMPTY slot is rejected")

    var negative_mana = snapshot.duplicate(true)
    negative_mana.mana.current = -1
    case.assert_equal(&"CORRUPT_RESOURCE_SNAPSHOT", Snapshot.restore(negative_mana).status, "negative mana is rejected")

    var repo = SaveRepository.new()
    repo.configure(SAVE_FILE)
    var envelope_v1 := {"revision": 1, "resource_snapshot": snapshot, "result_ledger": {}}
    case.assert_true(repo.save(envelope_v1).ok, "first atomic save succeeds")
    case.assert_equal(1.0, float(repo.load_latest().data.revision), "main save round trips")

    var envelope_v2 := {"revision": 2, "resource_snapshot": snapshot, "result_ledger": {}}
    case.assert_true(repo.save(envelope_v2).ok, "second save creates backup")
    var corrupt_file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
    corrupt_file.store_string("{not valid json")
    corrupt_file.close()
    var fallback = repo.load_latest()
    case.assert_true(fallback.ok, "corrupt main falls back to backup")
    case.assert_equal(1.0, float(fallback.data.revision), "backup preserves prior valid state")
    case.assert_equal(SAVE_FILE + ".bak", fallback.source, "fallback source is explicit")
    _cleanup_save()


func _make_fixture(Stock, Vault, Charge, Ledger, Mana, Types) -> Dictionary:
    var stock = Stock.create(2)
    stock.add_one()
    var vault = Vault.create(2)
    var scribe = vault.reserve_for_scribe(&"HEAT", &"seed-vault")
    vault.complete_scribe(scribe.reservation_id)
    var charge = Charge.create(10.0)
    charge.advance_active_pressure(4.0, stock)
    var ledger = Ledger.create(stock, vault)
    ledger.reserve_node(&"main", &"HEAT", Types.Source.VAULT, &"spell-save", true)
    ledger.reserve_node(&"support", &"FLOW", Types.Source.UNIVERSAL_STOCK, &"spell-save", true)
    var mana = Mana.create(5)
    return {
        "stock": stock,
        "vault": vault,
        "charge": charge,
        "ledger": ledger,
        "mana": mana,
    }


func _cleanup_save() -> void:
    for path in [SAVE_FILE, SAVE_FILE + ".bak", SAVE_FILE + ".tmp"]:
        if FileAccess.file_exists(path):
            DirAccess.remove_absolute(ProjectSettings.globalize_path(path))

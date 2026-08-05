extends RefCounted

const SNAPSHOT_PATH := "res://src/persistence/glyph_resource_snapshot.gd"
const SAVE_PATH := "res://src/persistence/save_repository.gd"
const STOCK_PATH := "res://src/core/resources/universal_stock_pool.gd"
const VAULT_PATH := "res://src/core/resources/vault_inventory.gd"
const CHARGE_PATH := "res://src/core/resources/universal_stock_charge.gd"
const LEDGER_PATH := "res://src/core/resources/resource_reservation_ledger.gd"
const MANA_PATH := "res://src/core/resources/mana_pool.gd"
const TYPES_PATH := "res://src/core/resources/glyph_resource_types.gd"
const REQUEST_PATH := "res://src/core/spells/spell_commit_request.gd"
const SERVICE_PATH := "res://src/core/spells/atomic_spell_commit_service.gd"
const RESULT_LEDGER_PATH := "res://src/core/atomic_result_ledger.gd"
const SAVE_FILE := "user://glyph_resource_lifecycle_test.json"

func run(case) -> void:
    _cleanup_save()
    if not FileAccess.file_exists(SNAPSHOT_PATH) or not FileAccess.file_exists(SAVE_PATH):
        case.fail("Task 7 persistence files must exist before lifecycle integration")
        return

    var Snapshot = load(SNAPSHOT_PATH)
    var SaveRepository = load(SAVE_PATH)
    var Stock = load(STOCK_PATH)
    var Vault = load(VAULT_PATH)
    var Charge = load(CHARGE_PATH)
    var Ledger = load(LEDGER_PATH)
    var Mana = load(MANA_PATH)
    var Types = load(TYPES_PATH)
    var Request = load(REQUEST_PATH)
    var Service = load(SERVICE_PATH)
    var ResultLedger = load(RESULT_LEDGER_PATH)

    var stock = Stock.create(1)
    stock.add_one()
    var vault = Vault.create(1)
    var seed = vault.reserve_for_scribe(&"HEAT", &"seed")
    vault.complete_scribe(seed.reservation_id)
    var charge = Charge.create(10.0)
    var ledger = Ledger.create(stock, vault)
    var mana = Mana.create(5)
    var results = ResultLedger.new()
    ledger.reserve_node(&"main", &"HEAT", Types.Source.VAULT, &"spell-life", true)
    ledger.reserve_node(&"support", &"FLOW", Types.Source.UNIVERSAL_STOCK, &"spell-life", true)

    var repo = SaveRepository.new()
    repo.configure(SAVE_FILE)
    var pre_commit_envelope := {
        "resource_snapshot": Snapshot.capture(stock, vault, charge, ledger, mana),
        "result_ledger": results.serialize(),
    }
    case.assert_true(repo.save(pre_commit_envelope).ok, "reserved transaction saves")

    var loaded = repo.load_latest()
    var restored = Snapshot.restore(loaded.data.resource_snapshot)
    case.assert_equal(&"OK", restored.status, "reserved transaction restores")
    var restored_results = ResultLedger.new()
    restored_results.restore(loaded.data.result_ledger)

    case.assert_true(restored.ledger.release_node(&"support"), "restored FLOW reservation cancels")
    case.assert_equal(1, restored.stock.available_count(), "cancel returns Stock")
    var flow_again = restored.ledger.reserve_node(
        &"support", &"FLOW", Types.Source.UNIVERSAL_STOCK, &"spell-life", true
    )
    case.assert_equal(&"OK", flow_again.status, "FLOW can reserve again")

    var service = Service.create(restored_results)
    var request = Request.create(&"spell-life", 3, {"effect": &"HEAT_FLOW", "target_valid": true})
    var first = service.commit(request, restored.ledger, restored.mana)
    case.assert_equal("COMMITTED", String(first.status), "restored transaction commits")
    case.assert_equal(0, restored.stock.current_total(), "Stock is consumed once")
    case.assert_equal(2, restored.mana.current(), "mana is consumed once")

    var post_commit_envelope := {
        "resource_snapshot": Snapshot.capture(
            restored.stock,
            restored.vault,
            restored.charge,
            restored.ledger,
            restored.mana
        ),
        "result_ledger": restored_results.serialize(),
    }
    case.assert_true(repo.save(post_commit_envelope).ok, "post-Commit state saves")

    var post_loaded = repo.load_latest()
    var post_restored = Snapshot.restore(post_loaded.data.resource_snapshot)
    var post_results = ResultLedger.new()
    post_results.restore(post_loaded.data.result_ledger)
    var duplicate_service = Service.create(post_results)
    var before_duplicate := {
        "stock": post_restored.stock.to_dict(),
        "vault": post_restored.vault.to_dict(),
        "mana": post_restored.mana.to_dict(),
    }
    var duplicate = duplicate_service.commit(request, post_restored.ledger, post_restored.mana)
    case.assert_equal("COMMITTED", String(duplicate.status), "duplicate returns original committed result")
    var after_duplicate := {
        "stock": post_restored.stock.to_dict(),
        "vault": post_restored.vault.to_dict(),
        "mana": post_restored.mana.to_dict(),
    }
    case.assert_equal(before_duplicate, after_duplicate, "duplicate consumes nothing after resume")
    _cleanup_save()


func _cleanup_save() -> void:
    for path in [SAVE_FILE, SAVE_FILE + ".bak", SAVE_FILE + ".tmp"]:
        if FileAccess.file_exists(path):
            DirAccess.remove_absolute(ProjectSettings.globalize_path(path))

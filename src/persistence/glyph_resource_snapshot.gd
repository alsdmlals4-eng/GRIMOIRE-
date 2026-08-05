class_name GlyphResourceSnapshot
extends RefCounted

const UniversalStockPoolScript = preload("res://src/core/resources/universal_stock_pool.gd")
const VaultInventoryScript = preload("res://src/core/resources/vault_inventory.gd")
const UniversalStockChargeScript = preload("res://src/core/resources/universal_stock_charge.gd")
const ResourceReservationLedgerScript = preload("res://src/core/resources/resource_reservation_ledger.gd")
const ManaPoolScript = preload("res://src/core/resources/mana_pool.gd")

const SCHEMA_VERSION := 1
const REQUIRED_KEYS := [
    "schema_version",
    "universal_stock",
    "vault",
    "charge",
    "reservations",
    "mana",
]


static func capture(stock, vault, charge, ledger, mana) -> Dictionary:
    var ledger_state: Dictionary = ledger.snapshot_state()
    return {
        "schema_version": SCHEMA_VERSION,
        "universal_stock": stock.to_dict(),
        "vault": vault.to_dict(),
        "charge": charge.to_dict(),
        "reservations": Dictionary(ledger_state.get("reservations_by_node", {})).duplicate(true),
        "mana": mana.to_dict(),
    }


static func restore(data: Dictionary) -> Dictionary:
    if not _has_exact_keys(data):
        return _corrupt_result()
    if int(data.get("schema_version", -1)) != SCHEMA_VERSION:
        return _corrupt_result()

    for key in ["universal_stock", "vault", "charge", "reservations", "mana"]:
        if typeof(data.get(key, null)) != TYPE_DICTIONARY:
            return _corrupt_result()

    var stock_result = UniversalStockPoolScript.from_dict(data.universal_stock)
    var vault_result = VaultInventoryScript.from_dict(data.vault)
    var charge_result = UniversalStockChargeScript.from_dict(data.charge)
    var mana_result = ManaPoolScript.from_dict(data.mana)
    if stock_result.get("status", &"") != &"OK":
        return _corrupt_result()
    if vault_result.get("status", &"") != &"OK":
        return _corrupt_result()
    if charge_result.get("status", &"") != &"OK":
        return _corrupt_result()
    if mana_result.get("status", &"") != &"OK":
        return _corrupt_result()

    var stock = stock_result.pool
    var vault = vault_result.vault
    var charge = charge_result.charge
    var mana = mana_result.mana
    var ledger = ResourceReservationLedgerScript.create(stock, vault)
    if ledger == null:
        return _corrupt_result()
    var ledger_state := {
        "universal_stock": data.universal_stock,
        "vault": data.vault,
        "reservations_by_node": data.reservations,
    }
    if not ledger.restore_state(ledger_state):
        return _corrupt_result()

    return {
        "status": &"OK",
        "stock": stock,
        "vault": vault,
        "charge": charge,
        "ledger": ledger,
        "mana": mana,
    }


static func _has_exact_keys(data: Dictionary) -> bool:
    if data.size() != REQUIRED_KEYS.size():
        return false
    for key in REQUIRED_KEYS:
        if not data.has(key):
            return false
    return true


static func _corrupt_result() -> Dictionary:
    return {"status": &"CORRUPT_RESOURCE_SNAPSHOT"}

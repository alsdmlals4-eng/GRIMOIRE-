class_name GlyphResourceViewModel
extends RefCounted

const GLYPH_NAMES := {
    &"HEAT": "열",
    &"PROTECT": "보호",
    &"FLOW": "흐름",
    &"FOCUS": "집중",
    &"DISPERSE": "분산",
    &"BURST": "폭발",
}


static func build(
    glyph_id: StringName,
    is_learned: bool,
    stock,
    vault,
    charge
) -> Dictionary:
    if stock == null or vault == null or charge == null:
        return {
            "glyph_id": glyph_id,
            "stock": _empty_stock_model(),
            "vault": _empty_vault_model(),
            "charge": _empty_charge_model(),
            "selection_state": &"NO_SOURCE_AVAILABLE",
        }

    var stock_current := int(stock.current_total())
    var stock_capacity := int(stock.capacity())
    var matching_count := int(vault.matching_available_count(glyph_id))
    var slot_capacity := int(vault.slot_capacity())
    var stock_enabled := is_learned and stock.available_count() > 0
    var vault_enabled := is_learned and matching_count > 0
    var display_name := String(GLYPH_NAMES.get(glyph_id, String(glyph_id)))

    var required_seconds := float(charge.required_seconds())
    var progress_ratio := 0.0
    if required_seconds > 0.0:
        progress_ratio = clampf(float(charge.progress_seconds()) / required_seconds, 0.0, 1.0)
    var waiting := bool(charge.waiting_for_capacity())
    var charge_label := "충전 완료 대기" if waiting else "충전 %d%%" % int(round(progress_ratio * 100.0))

    var selection_state := &"NO_SOURCE_AVAILABLE"
    if stock_enabled or vault_enabled:
        selection_state = &"SOURCE_SELECTION_REQUIRED"

    return {
        "glyph_id": glyph_id,
        "stock": {
            "label": "Stock %d/%d" % [stock_current, stock_capacity],
            "enabled": stock_enabled,
            "current": stock_current,
            "capacity": stock_capacity,
            "shape_key": &"UNIVERSAL_STOCK",
            "role_icon_key": &"FUNGIBLE_GLYPH_RESOURCE",
        },
        "vault": {
            "label": "보관함: %s %d" % [display_name, matching_count],
            "enabled": vault_enabled,
            "matching_count": matching_count,
            "slot_capacity": slot_capacity,
            "shape_key": &"EXACT_GLYPH_SLOT",
            "role_icon_key": &"EXACT_GLYPH_VAULT",
        },
        "charge": {
            "label": charge_label,
            "progress_ratio": progress_ratio,
            "waiting_for_capacity": waiting,
        },
        "selection_state": selection_state,
    }


static func _empty_stock_model() -> Dictionary:
    return {
        "label": "Stock 0/0",
        "enabled": false,
        "current": 0,
        "capacity": 0,
        "shape_key": &"UNIVERSAL_STOCK",
        "role_icon_key": &"FUNGIBLE_GLYPH_RESOURCE",
    }


static func _empty_vault_model() -> Dictionary:
    return {
        "label": "보관함: 없음 0",
        "enabled": false,
        "matching_count": 0,
        "slot_capacity": 0,
        "shape_key": &"EXACT_GLYPH_SLOT",
        "role_icon_key": &"EXACT_GLYPH_VAULT",
    }


static func _empty_charge_model() -> Dictionary:
    return {
        "label": "충전 정보 없음",
        "progress_ratio": 0.0,
        "waiting_for_capacity": false,
    }

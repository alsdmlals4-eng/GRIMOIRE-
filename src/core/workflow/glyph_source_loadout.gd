# Vault와 Stock의 동수 준비 계약을 보존하는 로드아웃 값 객체.
class_name GlyphSourceLoadout
extends RefCounted

const GlyphCatalog = preload("res://src/core/glyphs/glyph_catalog.gd")
const SELF_PATH := "res://src/core/workflow/glyph_source_loadout.gd"

var _vault_ids: Array[StringName] = []
var _stock_ids: Array[StringName] = []


static func create(vault_ids: Array[StringName], stock_ids: Array[StringName]):
    if vault_ids.size() != stock_ids.size():
        return null
    if vault_ids.is_empty() or vault_ids.size() > 5:
        return null
    if not _all_catalog_ids(vault_ids) or not _all_catalog_ids(stock_ids):
        return null
    var script = load(SELF_PATH)
    if script == null or not script.can_instantiate():
        return null
    var loadout = script.new()
    loadout._vault_ids = vault_ids.duplicate()
    loadout._stock_ids = stock_ids.duplicate()
    return loadout


func to_dict() -> Dictionary:
    return {
        "vault_ids": _vault_ids.duplicate(),
        "stock_ids": _stock_ids.duplicate(),
        "count": _vault_ids.size(),
        "maximum_each": 5,
    }


static func _all_catalog_ids(ids: Array[StringName]) -> bool:
    for glyph_id in ids:
        if GlyphCatalog.metadata(glyph_id).is_empty():
            return false
    return true

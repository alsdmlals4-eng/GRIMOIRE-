extends RefCounted

const TYPES_PATH := "res://src/core/resources/glyph_resource_types.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(TYPES_PATH), "glyph_resource_types.gd must exist")
    if not FileAccess.file_exists(TYPES_PATH):
        return

    var types_script = load(TYPES_PATH)
    case.assert_true(types_script != null, "glyph_resource_types.gd must load")
    if types_script == null:
        return

    case.assert_equal(0, types_script.Source.UNIVERSAL_STOCK, "Stock source is stable")
    case.assert_equal(1, types_script.Source.VAULT, "Vault source is stable")
    case.assert_equal(
        &"tx-1:node-2:1",
        types_script.reservation_id(&"tx-1", &"node-2", types_script.Source.VAULT),
        "reservation IDs are deterministic"
    )

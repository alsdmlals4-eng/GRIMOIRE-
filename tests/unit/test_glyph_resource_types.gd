extends RefCounted

const Types = preload("res://src/core/resources/glyph_resource_types.gd")

func run(case) -> void:
    case.assert_equal(0, Types.Source.UNIVERSAL_STOCK, "Stock source is stable")
    case.assert_equal(1, Types.Source.VAULT, "Vault source is stable")
    case.assert_equal(
        &"tx-1:node-2:1",
        Types.reservation_id(&"tx-1", &"node-2", Types.Source.VAULT),
        "reservation IDs are deterministic"
    )

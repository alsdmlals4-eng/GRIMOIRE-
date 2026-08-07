extends GutTest

const StarCircuitLayoutModel = preload("res://src/ui/star_circuit_layout_model.gd")


func test_five_point_star_layout_is_real_product_contract() -> void:
    var model = StarCircuitLayoutModel.new()
    var layout = model.layout_for(
        Vector2(1280.0, 720.0),
        Rect2(Vector2.ZERO, Vector2(1280.0, 720.0)),
        1.0,
        false,
    )

    assert_eq(layout["layout"], &"FIVE_POINT_STAR")
    assert_eq(layout["vertices"].size(), 5)
    assert_false(layout["slot_order_effect"])
    assert_false(layout["hidden_vertex_bonus"])
    assert_true(layout["target_after_circuit_preview"])

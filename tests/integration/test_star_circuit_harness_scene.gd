extends RefCounted

const SCENE_PATH := "res://src/ui/star_circuit_harness.tscn"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(SCENE_PATH), "Star circuit harness scene must exist")
    if not FileAccess.file_exists(SCENE_PATH):
        return
    var packed = load(SCENE_PATH)
    case.assert_true(packed != null and packed.can_instantiate(), "Star harness scene must load")
    if packed == null or not packed.can_instantiate():
        return
    var scene = packed.instantiate()
    case.assert_true(scene.get_node_or_null("SafeArea/CenterGlyph") != null, "Center glyph control exists")
    for index in range(5):
        case.assert_true(scene.get_node_or_null("SafeArea/StarVertices/Vertex%s" % index) != null, "Vertex %s exists" % index)
    case.assert_true(scene.get_node_or_null("SafeArea/CircuitPreviewPanel") != null, "Circuit preview exists")
    case.assert_true(scene.get_node_or_null("SafeArea/TargetKeywordPanel") != null, "Target keyword panel exists")
    case.assert_true(scene.get_node_or_null("SafeArea/FinalPreviewPanel") != null, "Final preview exists")
    case.assert_true(scene.get_node_or_null("SafeArea/CommitButton") != null, "Explicit commit button exists")
    case.assert_true(scene.has_method("test_contract_snapshot"), "Harness exposes read-only test contract snapshot")
    if scene.has_method("test_contract_snapshot"):
        var snapshot: Dictionary = scene.test_contract_snapshot()
        case.assert_equal(5, snapshot.vertex_count, "Harness has five vertices")
        case.assert_true(float(snapshot.minimum_touch_target) >= 48.0, "Harness touch target is at least 48dp")
        case.assert_false(bool(snapshot.slot_order_effect), "Vertex order has no hidden effect")
        case.assert_true(bool(snapshot.target_after_circuit_preview), "Target follows circuit preview")
        case.assert_true(bool(snapshot.numeric_success_preview), "Numeric success preview is exposed")
    scene.free()

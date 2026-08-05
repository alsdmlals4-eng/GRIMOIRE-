extends RefCounted

const VALIDATOR_PATH := "res://src/core/stage2/stage2_circuit_validator.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(VALIDATOR_PATH), "Stage2 circuit validator must exist")
    if not FileAccess.file_exists(VALIDATOR_PATH):
        return
    var script = load(VALIDATOR_PATH)
    case.assert_true(script != null and script.can_instantiate(), "Stage2 validator must load")
    if script == null or not script.can_instantiate():
        return
    var validator = script.new()

    var valid_nodes := [
        {"id": &"main", "kind": &"MAIN", "cell": Vector2i(1, 1), "glyph_id": &"PROTECT", "source": &"VAULT"},
        {"id": &"support", "kind": &"SUPPORT", "cell": Vector2i(0, 1), "glyph_id": &"FLOW", "source": &"STOCK"},
        {"id": &"target", "kind": &"TARGET", "cell": Vector2i(1, 2), "target_id": &"ward"},
    ]
    var valid_edges := [
        {"from": &"main", "to": &"support"},
        {"from": &"main", "to": &"target"},
    ]
    var valid: Dictionary = validator.validate(valid_nodes, valid_edges)
    case.assert_equal(&"OK", valid.status, "Adjacent reachable circuit is valid")
    case.assert_false(bool(valid.get("auto_corrected", true)), "Validator never auto-corrects")

    var missing_source_nodes: Array = valid_nodes.duplicate(true)
    missing_source_nodes[1].erase("source")
    var missing_source: Dictionary = validator.validate(missing_source_nodes, valid_edges)
    case.assert_equal(&"MISSING_GLYPH_SOURCE", missing_source.status, "Every glyph needs explicit source")

    var skipped_edges := [{"from": &"support", "to": &"target"}]
    var skipped_nodes := [
        {"id": &"main", "kind": &"MAIN", "cell": Vector2i(0, 0), "glyph_id": &"HEAT", "source": &"STOCK"},
        {"id": &"support", "kind": &"SUPPORT", "cell": Vector2i(0, 1), "glyph_id": &"FLOW", "source": &"STOCK"},
        {"id": &"target", "kind": &"TARGET", "cell": Vector2i(2, 2), "target_id": &"door"},
    ]
    var skipped: Dictionary = validator.validate(skipped_nodes, skipped_edges)
    case.assert_equal(&"EDGE_NOT_ADJACENT", skipped.status, "Skip connections are rejected")

    var target_branch_edges := valid_edges.duplicate(true)
    target_branch_edges.append({"from": &"target", "to": &"support"})
    var target_branch: Dictionary = validator.validate(valid_nodes, target_branch_edges)
    case.assert_equal(&"TARGET_MUST_BE_TERMINAL_LEAF", target_branch.status, "Targets are terminal leaves")

    var crossing_nodes := [
        {"id": &"main", "kind": &"MAIN", "cell": Vector2i(0, 0), "glyph_id": &"PROTECT", "source": &"VAULT"},
        {"id": &"support_a", "kind": &"SUPPORT", "cell": Vector2i(1, 1), "glyph_id": &"FLOW", "source": &"STOCK"},
        {"id": &"support_b", "kind": &"SUPPORT", "cell": Vector2i(1, 0), "glyph_id": &"FOCUS", "source": &"STOCK"},
        {"id": &"target", "kind": &"TARGET", "cell": Vector2i(0, 1), "target_id": &"ward"},
    ]
    var crossing_edges := [
        {"from": &"main", "to": &"support_a"},
        {"from": &"main", "to": &"support_b"},
        {"from": &"support_b", "to": &"target"},
    ]
    var crossing: Dictionary = validator.validate(crossing_nodes, crossing_edges)
    case.assert_equal(&"CROSSING_EDGES_PROHIBITED", crossing.status, "Diagonal edges cannot cross")

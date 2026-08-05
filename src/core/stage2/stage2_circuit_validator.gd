class_name Stage2CircuitValidator
extends RefCounted


const GLYPH_KINDS := [&"MAIN", &"SUPPORT"]
const VALID_SOURCES := [&"VAULT", &"STOCK"]


func validate(nodes: Array, edges: Array) -> Dictionary:
    if nodes.is_empty() or nodes.size() > 7:
        return _invalid(&"INVALID_NODE_COUNT")

    var by_id: Dictionary = {}
    var cell_owner: Dictionary = {}
    var main_ids: Array[StringName] = []
    var support_count := 0
    var target_count := 0

    for node_variant in nodes:
        if typeof(node_variant) != TYPE_DICTIONARY:
            return _invalid(&"INVALID_NODE")
        var node: Dictionary = node_variant
        var node_id := StringName(node.get("id", ""))
        var kind := StringName(node.get("kind", ""))
        var cell_variant: Variant = node.get("cell", null)
        if node_id.is_empty() or by_id.has(node_id) or typeof(cell_variant) != TYPE_VECTOR2I:
            return _invalid(&"INVALID_NODE")
        var cell: Vector2i = cell_variant
        if cell.x < 0 or cell.x > 2 or cell.y < 0 or cell.y > 2:
            return _invalid(&"CELL_OUT_OF_BOUNDS")
        if cell_owner.has(cell):
            return _invalid(&"DUPLICATE_CELL")

        if kind == &"MAIN":
            main_ids.append(node_id)
        elif kind == &"SUPPORT":
            support_count += 1
        elif kind == &"TARGET":
            target_count += 1
        else:
            return _invalid(&"INVALID_NODE_KIND")

        if kind in GLYPH_KINDS:
            var glyph_id := StringName(node.get("glyph_id", ""))
            var source := StringName(node.get("source", ""))
            if glyph_id.is_empty():
                return _invalid(&"MISSING_GLYPH_ID")
            if source not in VALID_SOURCES:
                return _invalid(&"MISSING_GLYPH_SOURCE")
        elif StringName(node.get("target_id", "")).is_empty():
            return _invalid(&"MISSING_TARGET_ID")

        by_id[node_id] = node.duplicate(true)
        cell_owner[cell] = node_id

    if main_ids.size() != 1:
        return _invalid(&"MAIN_GLYPH_COUNT_MUST_BE_ONE")
    if support_count > 2:
        return _invalid(&"SUPPORT_GLYPH_COUNT_EXCEEDED")
    if target_count < 1 or target_count > 4:
        return _invalid(&"TARGET_COUNT_OUT_OF_RANGE")

    var adjacency: Dictionary = {}
    var out_degree: Dictionary = {}
    var seen_edges: Dictionary = {}
    for node_id in by_id.keys():
        adjacency[node_id] = []
        out_degree[node_id] = 0

    for edge_variant in edges:
        if typeof(edge_variant) != TYPE_DICTIONARY:
            return _invalid(&"INVALID_EDGE")
        var edge: Dictionary = edge_variant
        var from_id := StringName(edge.get("from", ""))
        var to_id := StringName(edge.get("to", ""))
        if from_id.is_empty() or to_id.is_empty() or from_id == to_id:
            return _invalid(&"INVALID_EDGE")
        if not by_id.has(from_id) or not by_id.has(to_id):
            return _invalid(&"EDGE_NODE_MISSING")
        var edge_key := "%s>%s" % [String(from_id), String(to_id)]
        if seen_edges.has(edge_key):
            return _invalid(&"DUPLICATE_EDGE")
        seen_edges[edge_key] = true

        var from_node: Dictionary = by_id[from_id]
        var to_node: Dictionary = by_id[to_id]
        if StringName(from_node.get("kind", "")) == &"TARGET":
            return _invalid(&"TARGET_MUST_BE_TERMINAL_LEAF")
        if not _adjacent(from_node.get("cell"), to_node.get("cell")):
            return _invalid(&"EDGE_NOT_ADJACENT")
        adjacency[from_id].append(to_id)
        out_degree[from_id] = int(out_degree[from_id]) + 1

    var branch_nodes := 0
    for degree_variant in out_degree.values():
        if int(degree_variant) > 1:
            branch_nodes += 1
    if branch_nodes > 1:
        return _invalid(&"BRANCH_LIMIT_EXCEEDED")

    var visited: Dictionary = {}
    var queue: Array[StringName] = [main_ids[0]]
    while not queue.is_empty():
        var current: StringName = queue.pop_front()
        if visited.has(current):
            continue
        visited[current] = true
        for next_id_variant in adjacency[current]:
            var next_id := StringName(next_id_variant)
            if not visited.has(next_id):
                queue.append(next_id)
    if visited.size() != nodes.size():
        return _invalid(&"ALL_NODES_MUST_BE_REACHABLE")

    for node_id_variant in by_id.keys():
        var node_id := StringName(node_id_variant)
        var node: Dictionary = by_id[node_id]
        if StringName(node.get("kind", "")) == &"TARGET" and int(out_degree[node_id]) != 0:
            return _invalid(&"TARGET_MUST_BE_TERMINAL_LEAF")

    return {
        "status": &"OK",
        "valid": true,
        "auto_corrected": false,
        "node_count": nodes.size(),
        "edge_count": edges.size(),
    }


func _adjacent(a_variant: Variant, b_variant: Variant) -> bool:
    if typeof(a_variant) != TYPE_VECTOR2I or typeof(b_variant) != TYPE_VECTOR2I:
        return false
    var a: Vector2i = a_variant
    var b: Vector2i = b_variant
    var delta := (a - b).abs()
    return delta.x <= 1 and delta.y <= 1 and delta != Vector2i.ZERO


func _invalid(status: StringName) -> Dictionary:
    return {
        "status": status,
        "valid": false,
        "auto_corrected": false,
    }

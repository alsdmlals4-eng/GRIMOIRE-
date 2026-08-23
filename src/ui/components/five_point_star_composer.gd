class_name FivePointStarComposer
extends Control

signal slot_requested(role: StringName, index: int)


func _ready() -> void:
    _connect_slot("MainSlot", &"MAIN", -1)
    for index in range(5):
        _connect_slot("Aux%s" % index, &"AUX", index)


func set_visual_state(state: StringName, active_vertices: int, cause_vertex: int = -1) -> void:
    var board = get_node("StarCircuitBoard")
    board.set_visual_state(state, active_vertices, cause_vertex)


func visual_snapshot() -> Dictionary:
    var board = get_node("StarCircuitBoard")
    var board_snapshot: Dictionary = board.visual_snapshot()
    return {
        "state": board_snapshot.get("state", &"EDIT"),
        "active_vertices": board_snapshot.get("active_vertices", 0),
        "cause_vertex": board_snapshot.get("cause_vertex", -1),
        "main_slot_role": &"MAIN",
        "aux_slot_count": 5,
        "owns_gameplay_state": false,
    }


func _connect_slot(node_name: String, role: StringName, index: int) -> void:
    var button := get_node_or_null(node_name) as Button
    if button == null:
        return
    var callback := Callable(self, "_on_slot_pressed").bind(role, index)
    if not button.pressed.is_connected(callback):
        button.pressed.connect(callback)


func _on_slot_pressed(role: StringName, index: int) -> void:
    slot_requested.emit(role, index)

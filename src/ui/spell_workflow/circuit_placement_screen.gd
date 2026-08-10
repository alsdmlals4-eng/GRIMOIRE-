# 별형 회로의 명시적 Main/Aux 배치 의도와 Preview를 기존 예약 세션에 전달하는 화면이다.
class_name CircuitPlacementScreen
extends Control

signal place_main_requested(glyph: Dictionary)
signal place_aux_requested(slot: int, glyph: Dictionary)
signal remove_requested(node_key: StringName)
signal preview_requested
signal prepare_requested
signal reset_requested
signal undo_requested

var _placement_session = null
var _placement_snapshot: Dictionary = {}
var _loadout: Dictionary = {}
var _last_changed_node: StringName = &""
var _selected_node: StringName = &"main"


func _ready() -> void:
    _connect_button("MainSlotButton", select_main_slot)
    for slot in range(5):
        _connect_button("AuxSlot%s" % slot, select_aux_slot.bind(slot))
    _connect_button("ResetButton", request_reset)
    _connect_button("CancelButton", request_cancel)
    _connect_button("UndoButton", request_undo)
    _connect_button("PreviewButton", request_preview)
    _connect_button("PrepareButton", request_prepare)
    _connect_source_panel("VaultSourcePanel")
    _connect_source_panel("StockSourcePanel")


func configure(placement_session = null) -> void:
    _placement_session = placement_session


func restore_incident_overlay_context(_return_context: Dictionary) -> void:
    # Overlay close intentionally restores only caller context; reservations remain untouched.
    return


func render(loadout: Dictionary, placement_snapshot: Dictionary, base_preview: Dictionary) -> void:
    _loadout = loadout.duplicate(true)
    _placement_snapshot = placement_snapshot.duplicate(true)
    _render_sources()
    var preview_panel = _named("SpellPreviewPanel")
    if preview_panel != null and preview_panel.has_method("bind"):
        preview_panel.bind(base_preview)
    _render_board(&"EDIT")


func render_state(workflow_state: StringName) -> void:
    match workflow_state:
        &"CIRCUIT_PREVIEW":
            _render_board(&"FINAL")
        &"PREPARATION_CONFIRM":
            _render_board(&"CONFIRM")
        &"PREPARED":
            _render_board(&"COMMITTED")
        &"VALIDATION_FAILURE":
            _render_board(&"INVALID")
        _:
            _render_board(&"EDIT")


func board_visual_state() -> StringName:
    var board = _named("StarCircuitBoard")
    if board != null and board.has_method("visual_snapshot"):
        return StringName(board.visual_snapshot().get("state", &"EDIT"))
    return &"EDIT"


func select_main_slot() -> void:
    _selected_node = &"main"
    _render_sources()


func select_aux_slot(slot: int) -> void:
    if slot < 0 or slot > 4:
        return
    _selected_node = StringName("aux-%s" % slot)
    _render_sources()


func request_place_main(glyph: Dictionary) -> void:
    _last_changed_node = &"main"
    place_main_requested.emit(glyph.duplicate(true))


func request_place_aux(slot: int, glyph: Dictionary) -> void:
    if slot < 0 or slot > 4:
        return
    _last_changed_node = StringName("aux-%s" % slot)
    place_aux_requested.emit(slot, glyph.duplicate(true))


func request_remove(node_key: StringName) -> void:
    if node_key.is_empty():
        return
    _last_changed_node = node_key
    remove_requested.emit(node_key)


func request_preview() -> void:
    preview_requested.emit()


func request_prepare() -> void:
    prepare_requested.emit()


func request_reset() -> void:
    if _placement_session != null and _placement_session.has_method("reset"):
        _placement_session.reset()
    _placement_snapshot.clear()
    _last_changed_node = &""
    reset_requested.emit()


func request_cancel() -> void:
    request_reset()


func request_undo() -> void:
    if not _last_changed_node.is_empty():
        if _placement_session != null and _placement_session.has_method("remove_node"):
            _placement_session.remove_node(_last_changed_node)
        remove_requested.emit(_last_changed_node)
        _last_changed_node = &""
    undo_requested.emit()


func _on_glyph_selected(glyph: Dictionary) -> void:
    if _selected_node == &"main":
        request_place_main(glyph)
        return
    var slot_text := String(_selected_node).trim_prefix("aux-")
    if slot_text.is_valid_int():
        request_place_aux(slot_text.to_int(), glyph)


func _render_sources() -> void:
    var is_main := _selected_node == &"main"
    var card_role := "Main · 중심" if is_main else "Aux · 보조"
    var role_icon := "◆" if is_main else "○"
    _bind_source_panel("VaultSourcePanel", {
        "role": &"VAULT",
        "role_label": "Vault · 보관함",
        "glyph_ids": Array(_loadout.get("vault_ids", [])),
        "count": int(_loadout.get("count", 0)),
        "maximum_each": int(_loadout.get("maximum_each", 5)),
        "source": 1,
        "card_role": card_role,
        "role_icon": role_icon,
        "reserved_ids": _reserved_ids_for_source(1),
        "slot_name": _selected_node,
    })
    _bind_source_panel("StockSourcePanel", {
        "role": &"STOCK",
        "role_label": "Typed Stock · 재고",
        "glyph_ids": Array(_loadout.get("stock_ids", [])),
        "count": int(_loadout.get("count", 0)),
        "maximum_each": int(_loadout.get("maximum_each", 5)),
        "source": 0,
        "card_role": card_role,
        "role_icon": role_icon,
        "reserved_ids": _reserved_ids_for_source(0),
        "slot_name": _selected_node,
    })


func _reserved_ids_for_source(source: int) -> Array:
    var ids: Array = []
    var main: Dictionary = Dictionary(_placement_snapshot.get("main", {}))
    if int(main.get("source", -1)) == source:
        ids.append(main.get("glyph_id", &""))
    for auxiliary in Array(_placement_snapshot.get("auxiliaries", [])):
        var glyph: Dictionary = Dictionary(auxiliary)
        if int(glyph.get("source", -1)) == source:
            ids.append(glyph.get("glyph_id", &""))
    return ids


func _render_board(visual_state: StringName) -> void:
    var board = _named("StarCircuitBoard")
    if board == null or not board.has_method("set_visual_state"):
        return
    var slots: Array[int] = []
    for auxiliary in Array(_placement_snapshot.get("auxiliaries", [])):
        slots.append(int(Dictionary(auxiliary).get("slot", -1)))
    board.set_visual_state(visual_state, slots.size(), -1, slots)


func _bind_source_panel(name: String, data: Dictionary) -> void:
    var panel = _named(name)
    if panel != null and panel.has_method("bind"):
        panel.bind(data)


func _connect_source_panel(name: String) -> void:
    var panel = _named(name)
    if panel != null and panel.has_signal("glyph_selected") and not panel.glyph_selected.is_connected(_on_glyph_selected):
        panel.glyph_selected.connect(_on_glyph_selected)


func _connect_button(name: String, callback: Callable) -> void:
    var button = _named(name)
    if button != null and not button.pressed.is_connected(callback):
        button.pressed.connect(callback)


func _named(name: String):
    return find_child(name, true, false)

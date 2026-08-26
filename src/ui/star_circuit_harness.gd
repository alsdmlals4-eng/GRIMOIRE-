class_name StarCircuitHarness
extends Control

const ValidatorScript = preload("res://src/core/star/star_circuit_validator.gd")
const CalculatorScript = preload("res://src/core/star/star_circuit_calculator.gd")
const StateScript = preload("res://src/core/star/star_circuit_state.gd")
const CoordinatorScript = preload("res://src/core/star/star_circuit_commit_coordinator.gd")
const TypedStockScript = preload("res://src/core/resources/typed_glyph_stock_pool.gd")
const VaultScript = preload("res://src/core/resources/vault_inventory.gd")
const ReservationLedgerScript = preload("res://src/core/resources/resource_reservation_ledger.gd")
const ManaScript = preload("res://src/core/resources/mana_pool.gd")
const CommitRequestScript = preload("res://src/core/spells/spell_commit_request.gd")
const CommitServiceScript = preload("res://src/core/spells/atomic_spell_commit_service.gd")
const ResultLedgerScript = preload("res://src/core/atomic_result_ledger.gd")
const GrimoireThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")

const GLYPH_IDS: Array[StringName] = [
    &"HEAT", &"PROTECT", &"FLOW", &"FOCUS", &"DISPERSE", &"BURST",
]
const PHASE_EDIT := &"EDIT"
const PHASE_TARGET := &"TARGET"
const PHASE_FINAL := &"FINAL"
const PHASE_CONFIRM := &"CONFIRM"
const PHASE_COMMITTED := &"COMMITTED"
const VISUAL_INVALID := &"INVALID"

var _signals_connected := false
var _phase: StringName = PHASE_EDIT
var _main_index := 0
var _auxiliary_indices: Array[int] = [2, -1, -1, -1, -1]
var _transaction_counter := 0
var _selected_target: StringName = &""
var _last_preview: Dictionary = {}
var _last_status: StringName = &"READY"

var _state
var _validator
var _calculator
var _coordinator
var _stock
var _vault
var _reservation_ledger
var _mana
var _commit_service


func _ready() -> void:
    initialize_demo()


func initialize_demo() -> void:
    if theme == null:
        theme = GrimoireThemeFactory.create_theme()
    _connect_signals_once()
    _reset_demo()


func test_contract_snapshot() -> Dictionary:
    return {
        "layout": &"FIVE_POINT_STAR",
        "vertex_count": 5,
        "minimum_touch_target": 48.0,
        "slot_order_effect": false,
        "target_after_circuit_preview": true,
        "numeric_success_preview": true,
        "auto_target": false,
        "auto_commit": false,
        "reduced_motion_ms": 0,
        "text_scale_130_percent": true,
        "color_not_sole_signal": true,
        "accessibility_input_alternative": true,
        "interactive_demo": true,
        "core_runtime_connected": true,
        "shared_theme": theme != null,
        "visual_component": &"STAR_CIRCUIT_BOARD",
    }


func test_interaction_snapshot() -> Dictionary:
    var auxiliary_glyphs: Array[StringName] = []
    for glyph_index in _auxiliary_indices:
        auxiliary_glyphs.append(&"EMPTY" if glyph_index < 0 else GLYPH_IDS[glyph_index])
    var stock_counts: Dictionary = {}
    if _stock != null:
        stock_counts = Dictionary(_stock.to_dict().get("counts", {})).duplicate(true)
    return {
        "phase": _phase,
        "main_glyph": GLYPH_IDS[_main_index],
        "auxiliary_glyphs": auxiliary_glyphs,
        "target_keyword": _selected_target,
        "target_enabled": _target_buttons_enabled(),
        "commit_enabled": not _button_disabled("SafeArea/CommitButton"),
        "success_percent": int(_last_preview.get("success_percent", 0)),
        "final_mana": int(_last_preview.get("final_mana", 0)),
        "mana": 0 if _mana == null else int(_mana.current()),
        "stock_counts": stock_counts,
        "last_status": _last_status,
    }


func show_circuit_preview(text: String) -> void:
    _set_label("SafeArea/CircuitPreviewPanel/Label", text)


func show_target_keywords(keywords: Array) -> void:
    _set_label(
        "SafeArea/TargetKeywordPanel/Content/Label",
        "Target Keywords · %s" % " / ".join(PackedStringArray(keywords))
    )


func show_final_preview(success_percent: int, final_mana: int) -> void:
    _set_label(
        "SafeArea/FinalPreviewPanel/Label",
        "Success %s%% · Mana %s" % [success_percent, final_mana]
    )


func show_mastery_breakdown(
    glyph_masteries: Dictionary,
    success_reasons: Array,
    mana_reasons: Array
) -> void:
    var mastery_lines: Array[String] = []
    var glyph_ids: Array = glyph_masteries.keys()
    glyph_ids.sort()
    for glyph_id in glyph_ids:
        mastery_lines.append("%s %s" % [String(glyph_id), int(glyph_masteries[glyph_id])])
    _set_label("SafeArea/MasteryPanel/Label", "Mastery\n%s" % "\n".join(mastery_lines))
    _set_label(
        "SafeArea/BreakdownPanel/Label",
        "Success: %s\nMana: %s" % [
            " / ".join(PackedStringArray(success_reasons)),
            " / ".join(PackedStringArray(mana_reasons)),
        ]
    )


func show_warning(message: String, cause_glyph_id: StringName = &"") -> void:
    var prefix := "STATUS"
    if not cause_glyph_id.is_empty():
        prefix = "%s [%s]" % [prefix, String(cause_glyph_id)]
    _set_label("SafeArea/WarningPanel/Label", "%s: %s" % [prefix, message])


func show_insufficient_mana(required_mana: int, available_mana: int) -> void:
    _set_visible("SafeArea/InsufficientManaState", true)
    _set_label(
        "SafeArea/InsufficientManaState/Label",
        "INSUFFICIENT MANA · Required %s / Available %s" % [required_mana, available_mana]
    )
    _update_visual_state(VISUAL_INVALID)


func show_unstable_circuit(cause_glyph_id: StringName, reason: String) -> void:
    _set_visible("SafeArea/UnstableCircuitState", true)
    _set_label(
        "SafeArea/UnstableCircuitState/Label",
        "UNSTABLE CIRCUIT [%s] · %s" % [String(cause_glyph_id), reason]
    )


func show_accessibility_input(mode: StringName) -> void:
    _set_visible("SafeArea/AccessibilityInputPanel", true)
    _set_label(
        "SafeArea/AccessibilityInputPanel/Label",
        "ACCESSIBLE INPUT · %s · Same spell meaning and cost" % String(mode)
    )


func clear_transient_states() -> void:
    for path in [
        "SafeArea/InsufficientManaState",
        "SafeArea/UnstableCircuitState",
    ]:
        _set_visible(path, false)
    _set_visible("SafeArea/WarningIcon", false)


func _connect_signals_once() -> void:
    if _signals_connected:
        return
    _connect_button("SafeArea/CenterGlyph", Callable(self, "_on_main_pressed"))
    for index in range(5):
        _connect_button(
            "SafeArea/StarVertices/Vertex%s" % index,
            Callable(self, "_on_auxiliary_pressed").bind(index)
        )
    _connect_button("SafeArea/PreviewButton", Callable(self, "_on_preview_pressed"))
    _connect_button(
        "SafeArea/TargetKeywordPanel/Content/TargetButtons/FlowerButton",
        Callable(self, "_on_target_pressed").bind(&"flower")
    )
    _connect_button(
        "SafeArea/TargetKeywordPanel/Content/TargetButtons/WardButton",
        Callable(self, "_on_target_pressed").bind(&"ward")
    )
    _connect_button("SafeArea/CommitButton", Callable(self, "_on_commit_pressed"))
    _connect_button("SafeArea/CancelButton", Callable(self, "_on_cancel_pressed"))
    _signals_connected = true


func _connect_button(path: NodePath, callable: Callable) -> void:
    var button := get_node_or_null(path) as Button
    if button != null and not button.pressed.is_connected(callable):
        button.pressed.connect(callable)


func _reset_demo() -> void:
    clear_transient_states()
    _state = StateScript.new()
    _validator = ValidatorScript.new()
    _calculator = CalculatorScript.new()
    _stock = TypedStockScript.create(18)
    for glyph_id in GLYPH_IDS:
        _stock.add_one(glyph_id)
        _stock.add_one(glyph_id)
    _vault = VaultScript.create(GLYPH_IDS.size())
    for glyph_id in GLYPH_IDS:
        var scribe: Dictionary = _vault.reserve_for_scribe(
            glyph_id,
            StringName("demo-scribe-%s" % String(glyph_id))
        )
        if StringName(scribe.get("status", &"")) == &"OK":
            _vault.complete_scribe(StringName(scribe.get("reservation_id", &"")))
    _reservation_ledger = ReservationLedgerScript.create(_stock, _vault)
    _mana = ManaScript.create(100)
    _commit_service = CommitServiceScript.create(ResultLedgerScript.new())
    _state.configure_scenario({
        "fixture_id": &"frostbloom-interactive-demo",
        "objective": "Protect Frostbloom",
        "threat": "Cold surge",
        "situation": "The flower and ward are both valid explicit targets",
        "target_keywords": [&"flower", &"ward"],
    })
    _state.transition_to(_state.State.CIRCUIT_EDIT)
    _coordinator = CoordinatorScript.create(
        _state,
        _validator,
        _calculator,
        _reservation_ledger,
        _mana,
        _commit_service,
        CommitRequestScript
    )
    _phase = PHASE_EDIT
    _main_index = 0
    _auxiliary_indices = [2, -1, -1, -1, -1]
    _selected_target = &""
    _last_preview.clear()
    _last_status = &"READY"
    _set_edit_enabled(true)
    _set_target_buttons_enabled(false)
    _set_button_disabled("SafeArea/PreviewButton", false)
    _set_button_disabled("SafeArea/CommitButton", true)
    _set_button_text("SafeArea/CommitButton", "COMMIT")
    _set_button_text("SafeArea/CancelButton", "CANCEL")
    _refresh_selection_ui()
    show_circuit_preview("Circuit Preview\n1. Click Main/Aux glyphs\n2. Press PREVIEW CIRCUIT")
    show_target_keywords(["locked until preview"])
    _set_label("SafeArea/FinalPreviewPanel/Label", "Success --% · Mana --\nTarget --")
    show_warning("Ready · default HEAT + FLOW example loaded")
    _render_breakdown({})
    _update_visual_state(PHASE_EDIT)


func _on_main_pressed() -> void:
    if _phase != PHASE_EDIT:
        return
    _main_index = (_main_index + 1) % GLYPH_IDS.size()
    _last_status = &"EDITED"
    _refresh_selection_ui()
    show_warning("Main glyph changed · preview again when ready")
    _update_visual_state(PHASE_EDIT)


func _on_auxiliary_pressed(slot: int) -> void:
    if _phase != PHASE_EDIT or slot < 0 or slot >= _auxiliary_indices.size():
        return
    var next_index := _auxiliary_indices[slot] + 1
    _auxiliary_indices[slot] = -1 if next_index >= GLYPH_IDS.size() else next_index
    _last_status = &"EDITED"
    _refresh_selection_ui()
    show_warning("Auxiliary slot A%s changed · empty slots are allowed" % slot)
    _update_visual_state(PHASE_EDIT)


func _on_preview_pressed() -> void:
    if _phase != PHASE_EDIT or _coordinator == null:
        return
    clear_transient_states()
    _transaction_counter += 1
    var main := _build_main_glyph()
    var auxiliaries := _build_auxiliaries()
    var result: Dictionary = _coordinator.prepare_circuit_preview(
        StringName("interactive-star-%s" % _transaction_counter),
        main,
        auxiliaries
    )
    _last_status = StringName(result.get("status", &"UNKNOWN"))
    if _last_status != &"CIRCUIT_PREVIEW_READY":
        var cause_vertex := _validation_cause_vertex(auxiliaries)
        show_unstable_circuit(_validation_cause(main, auxiliaries), String(_last_status))
        show_warning("Circuit rejected · change duplicate or invalid auxiliary glyphs")
        _update_visual_state(VISUAL_INVALID, cause_vertex)
        return
    _last_preview = Dictionary(result.get("preview", {})).duplicate(true)
    _phase = PHASE_TARGET
    _set_edit_enabled(false)
    _set_button_disabled("SafeArea/PreviewButton", true)
    _set_target_buttons_enabled(true)
    _set_button_disabled("SafeArea/CommitButton", true)
    var aux_names := _auxiliary_names(auxiliaries)
    show_circuit_preview(
        "Circuit Preview READY\nMain %s · Aux %s\nTarget not selected" % [
            String(main.glyph_id),
            "none" if aux_names.is_empty() else ", ".join(aux_names),
        ]
    )
    show_target_keywords(["FLOWER", "WARD"])
    show_warning("Circuit valid · select an explicit target keyword")
    _render_breakdown(_last_preview)
    _update_visual_state(PHASE_TARGET)


func _on_target_pressed(keyword: StringName) -> void:
    if _phase != PHASE_TARGET or _coordinator == null:
        return
    var target := _target_data(keyword)
    var result: Dictionary = _coordinator.select_target_and_prepare_final_preview(
        keyword,
        target,
        {"effect": &"FROSTBLOOM_DEMO", "cause_glyph": GLYPH_IDS[_main_index]}
    )
    _last_status = StringName(result.get("status", &"UNKNOWN"))
    if _last_status != &"FINAL_PREVIEW_READY":
        show_warning("Target rejected · %s" % String(_last_status))
        _update_visual_state(PHASE_TARGET)
        return
    _selected_target = keyword
    _last_preview = Dictionary(result.get("preview", {})).duplicate(true)
    _phase = PHASE_FINAL
    _set_target_buttons_enabled(false)
    _set_button_disabled("SafeArea/CommitButton", false)
    _set_label(
        "SafeArea/FinalPreviewPanel/Label",
        "Success %s%% · Mana %s\nTarget %s" % [
            int(_last_preview.get("success_percent", 0)),
            int(_last_preview.get("final_mana", 0)),
            String(keyword).to_upper(),
        ]
    )
    show_warning("Final preview ready · COMMIT requires a second confirmation press")
    _render_breakdown(_last_preview)
    _update_visual_state(PHASE_FINAL)


func _on_commit_pressed() -> void:
    if _coordinator == null:
        return
    if _phase == PHASE_FINAL:
        if not _coordinator.request_confirmation():
            _last_status = &"CONFIRMATION_REJECTED"
            show_warning("Commit confirmation could not be opened")
            _update_visual_state(PHASE_FINAL)
            return
        _phase = PHASE_CONFIRM
        _last_status = &"CONFIRMATION_REQUIRED"
        _set_button_text("SafeArea/CommitButton", "CONFIRM COMMIT")
        show_warning("Press CONFIRM COMMIT again · resources are still unchanged")
        _update_visual_state(PHASE_CONFIRM)
        return
    if _phase != PHASE_CONFIRM:
        return
    var result: Dictionary = _coordinator.confirm_commit()
    _last_status = StringName(result.get("status", &"UNKNOWN"))
    if _last_status != &"COMMITTED":
        if _last_status == &"INSUFFICIENT_MANA":
            show_insufficient_mana(
                int(_last_preview.get("final_mana", 0)),
                int(_mana.current())
            )
        show_warning("Commit failed safely · %s" % String(_last_status))
        _update_visual_state(VISUAL_INVALID)
        return
    _phase = PHASE_COMMITTED
    _set_button_disabled("SafeArea/CommitButton", true)
    _set_button_text("SafeArea/CommitButton", "COMMITTED")
    _set_button_text("SafeArea/CancelButton", "RESET")
    show_warning(
        "COMMITTED · %s target · Mana remaining %s · press RESET to try again" % [
            String(_selected_target).to_upper(),
            int(_mana.current()),
        ]
    )
    _render_breakdown(_last_preview)
    _update_visual_state(PHASE_COMMITTED)


func _on_cancel_pressed() -> void:
    if _phase == PHASE_CONFIRM and _coordinator != null:
        _coordinator.cancel_confirmation()
    _reset_demo()


func _build_main_glyph() -> Dictionary:
    var glyph_id := GLYPH_IDS[_main_index]
    return {
        "glyph_id": glyph_id,
        "source": &"VAULT",
        "mastery": 70,
        "base_mana": _main_base_mana(glyph_id),
        "base_success": 75,
    }


func _build_auxiliaries() -> Array:
    var auxiliaries: Array = []
    for slot in range(_auxiliary_indices.size()):
        var glyph_index := _auxiliary_indices[slot]
        if glyph_index < 0:
            continue
        var glyph_id := GLYPH_IDS[glyph_index]
        auxiliaries.append({
            "slot": slot,
            "glyph_id": glyph_id,
            "source": &"STOCK",
            "mastery": 70,
            "base_mana": 4,
            "special": _auxiliary_special(glyph_id),
        })
    return auxiliaries


func _target_data(keyword: StringName) -> Dictionary:
    if keyword == &"ward":
        return {"difficulty": 10, "mana_cost": 2, "output_cost": 0, "duration_cost": 0}
    return {"difficulty": 5, "mana_cost": 0, "output_cost": 0, "duration_cost": 0}


func _main_base_mana(glyph_id: StringName) -> int:
    match glyph_id:
        &"BURST":
            return 14
        &"PROTECT":
            return 12
        &"FOCUS":
            return 11
        _:
            return 10


func _auxiliary_special(glyph_id: StringName) -> StringName:
    if glyph_id == &"FOCUS":
        return &"PRECISION"
    if glyph_id == &"DISPERSE":
        return &"REDUCTION"
    return &"NORMAL"


func _refresh_selection_ui() -> void:
    _set_button_text("SafeArea/CenterGlyph", "")
    var masteries: Dictionary = {GLYPH_IDS[_main_index]: 70}
    for slot in range(_auxiliary_indices.size()):
        var glyph_index := _auxiliary_indices[slot]
        var text := "A%s\nEMPTY" % slot
        if glyph_index >= 0:
            var glyph_id := GLYPH_IDS[glyph_index]
            text = ""
            masteries[glyph_id] = 70
        _set_button_text("SafeArea/StarVertices/Vertex%s" % slot, text)
    var lines: Array[String] = ["Mastery"]
    for glyph_id in masteries.keys():
        lines.append("%s · %s" % [String(glyph_id), int(masteries[glyph_id])])
    _set_label("SafeArea/MasteryPanel/Label", "\n".join(lines))


func _render_breakdown(preview: Dictionary) -> void:
    var success_text := "preview required"
    var mana_text := "preview required"
    if not preview.is_empty():
        success_text = "%s%% · %s" % [
            int(preview.get("success_percent", 0)),
            String(preview.get("success_label", &"")),
        ]
        mana_text = "%s · pool %s" % [
            int(preview.get("final_mana", 0)),
            int(_mana.current()),
        ]
    _set_label(
        "SafeArea/BreakdownPanel/Label",
        "Success: %s\nMana: %s\nTyped Stock:\n%s" % [
            success_text,
            mana_text,
            _stock_summary(),
        ]
    )


func _stock_summary() -> String:
    if _stock == null:
        return "--"
    var parts: Array[String] = []
    for glyph_id in GLYPH_IDS:
        parts.append("%s:%s" % [String(glyph_id), int(_stock.matching_count(glyph_id))])
    return "%s\n%s" % [
        " · ".join(parts.slice(0, 3)),
        " · ".join(parts.slice(3, 6)),
    ]


func _auxiliary_names(auxiliaries: Array) -> Array[String]:
    var names: Array[String] = []
    for item in auxiliaries:
        names.append(String(Dictionary(item).get("glyph_id", &"")))
    return names


func _validation_cause(main: Dictionary, auxiliaries: Array) -> StringName:
    var seen: Dictionary = {}
    for item in auxiliaries:
        var glyph_id := StringName(Dictionary(item).get("glyph_id", &""))
        if seen.has(glyph_id):
            return glyph_id
        seen[glyph_id] = true
    return StringName(main.get("glyph_id", &""))


func _validation_cause_vertex(auxiliaries: Array) -> int:
    var seen: Dictionary = {}
    for item in auxiliaries:
        var auxiliary := Dictionary(item)
        var glyph_id := StringName(auxiliary.get("glyph_id", &""))
        var slot := int(auxiliary.get("slot", -1))
        if seen.has(glyph_id):
            return slot
        seen[glyph_id] = slot
    return -1


func _active_auxiliary_slots() -> Array[int]:
    var slots: Array[int] = []
    for index in range(_auxiliary_indices.size()):
        if _auxiliary_indices[index] >= 0:
            slots.append(index)
    return slots


func _update_visual_state(state: StringName, cause_vertex: int = -1) -> void:
    var active_slots := _active_auxiliary_slots()
    var board := get_node_or_null("SafeArea/StarBoard")
    var auxiliary_glyphs: Dictionary = {}
    for slot in range(_auxiliary_indices.size()):
        var glyph_index := _auxiliary_indices[slot]
        if glyph_index >= 0:
            auxiliary_glyphs[slot] = GLYPH_IDS[glyph_index]
    if board != null and board.has_method("set_glyph_visuals"):
        board.call("set_glyph_visuals", GLYPH_IDS[_main_index], auxiliary_glyphs)
    if board != null and board.has_method("set_visual_state"):
        board.call("set_visual_state", state, active_slots.size(), cause_vertex, active_slots)
    _set_label("SafeArea/PhaseBadge/Content/Label", _phase_label(state))

    var warning_variation := &"StatusBanner"
    var warning_icon_visible := false
    if state == VISUAL_INVALID:
        warning_variation = &"StatusBannerWarning"
        warning_icon_visible = true
    elif state == PHASE_COMMITTED:
        warning_variation = &"StatusBannerSuccess"
    elif state == PHASE_CONFIRM:
        warning_variation = &"StatusBannerWarning"
        warning_icon_visible = true
    _set_panel_variation("SafeArea/WarningPanel", warning_variation)
    _set_visible("SafeArea/WarningIcon", warning_icon_visible)


func _phase_label(state: StringName) -> String:
    match state:
        PHASE_TARGET:
            return "TARGET SELECT"
        PHASE_FINAL:
            return "FINAL PREVIEW"
        PHASE_CONFIRM:
            return "COMMIT CONFIRM"
        PHASE_COMMITTED:
            return "COMMITTED"
        VISUAL_INVALID:
            return "CIRCUIT INVALID"
        &"VALID":
            return "CIRCUIT VALID"
        _:
            return "CIRCUIT EDIT"


func _set_edit_enabled(value: bool) -> void:
    _set_button_disabled("SafeArea/CenterGlyph", not value)
    for index in range(5):
        _set_button_disabled("SafeArea/StarVertices/Vertex%s" % index, not value)


func _set_target_buttons_enabled(value: bool) -> void:
    _set_button_disabled(
        "SafeArea/TargetKeywordPanel/Content/TargetButtons/FlowerButton",
        not value
    )
    _set_button_disabled(
        "SafeArea/TargetKeywordPanel/Content/TargetButtons/WardButton",
        not value
    )


func _target_buttons_enabled() -> bool:
    return not _button_disabled(
        "SafeArea/TargetKeywordPanel/Content/TargetButtons/FlowerButton"
    )


func _button_disabled(path: NodePath) -> bool:
    var button := get_node_or_null(path) as Button
    return true if button == null else button.disabled


func _set_button_disabled(path: NodePath, value: bool) -> void:
    var button := get_node_or_null(path) as Button
    if button != null:
        button.disabled = value


func _set_button_text(path: NodePath, value: String) -> void:
    var button := get_node_or_null(path) as Button
    if button != null:
        button.text = value


func _set_label(path: NodePath, text: String) -> void:
    var label := get_node_or_null(path) as Label
    if label != null:
        label.text = text


func _set_panel_variation(path: NodePath, variation: StringName) -> void:
    var control := get_node_or_null(path) as Control
    if control != null:
        control.theme_type_variation = variation


func _set_visible(path: NodePath, value: bool) -> void:
    var node := get_node_or_null(path)
    if node != null:
        node.visible = value

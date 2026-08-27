# 승인된 주문 화면을 실제 도메인 권한으로 연결하는 최소 제품 루트다.
class_name SpellWorkflowProductRoot
extends Control

const Coordinator = preload("res://src/core/workflow/spell_workflow_coordinator.gd")
const WorkflowState = preload("res://src/core/workflow/spell_workflow_state.gd")
const Validator = preload("res://src/core/star/star_circuit_validator.gd")
const Calculator = preload("res://src/core/star/star_circuit_calculator.gd")
const PlacementSession = preload("res://src/core/workflow/circuit_placement_session.gd")
const PreparationRequest = preload("res://src/core/spells/spell_preparation_request.gd")
const PreparationService = preload("res://src/core/spells/atomic_spell_preparation_service.gd")
const UseRequest = preload("res://src/core/spells/spell_use_request.gd")
const UseService = preload("res://src/core/spells/atomic_spell_use_service.gd")
const Inventory = preload("res://src/core/spells/prepared_spell_inventory.gd")
const Ledger = preload("res://src/core/resources/resource_reservation_ledger.gd")
const StockPool = preload("res://src/core/resources/typed_glyph_stock_pool.gd")
const Vault = preload("res://src/core/resources/vault_inventory.gd")
const ManaPool = preload("res://src/core/resources/mana_pool.gd")
const ResultLedger = preload("res://src/core/atomic_result_ledger.gd")
const GlyphTypes = preload("res://src/core/resources/glyph_resource_types.gd")
const GlyphTemplateRepository = preload("res://src/input/glyph_template_repository.gd")
const GlyphRecognitionService = preload("res://src/input/glyph_recognition_service.gd")
const FocusScribeRecognitionCoordinator = preload("res://src/input/focus_scribe_recognition_coordinator.gd")
const GlyphWritingViewModel = preload("res://src/ui/glyph_writing_view_model.gd")

const PREPARATION_TRANSACTION_ID: StringName = &"task9-preparation"
const SPELL_ID: StringName = &"task9-guided-spell"
const USE_TRANSACTION_ID: StringName = &"task9-guided-use"

var _state = null
var _ledger = null
var _stock = null
var _vault = null
var _template_repository = null
var _recognition_service = null
var _scribe_coordinator = null
var _view_model = null
var _coordinator = null
var _placement_session = null
var _step: StringName = &""
var _saved_glyph_id: StringName = &""
var _preparation_configured := false
var _cast_committed := false
var _last_result: Dictionary = {}


@onready var _glyph_host = get_node_or_null(NodePath("GlyphScreen"))
@onready var _circuit_host = get_node_or_null(NodePath("CircuitScreen"))
@onready var _spell_use_host = get_node_or_null(NodePath("SpellUseScreen"))
@onready var _glyph_screen = get_node_or_null(NodePath("GlyphScreen/GlyphContent"))
@onready var _circuit_screen = get_node_or_null(NodePath("CircuitScreen/CircuitContent"))
@onready var _spell_use_screen = get_node_or_null(NodePath("SpellUseScreen/SpellUseContent"))
@onready var _result_panel = get_node_or_null(NodePath("ResultPanel"))


func _ready() -> void:
    theme = GrimoireThemeFactory.create_theme()
    start_slice()
    _connect_player_surfaces()
    _configure_player_surfaces()
    _show_step()


func start_slice() -> Dictionary:
    _stock = StockPool.create(3)
    _stock.add_one(&"FLOW")
    _vault = Vault.create(1)
    var scribe: Dictionary = _vault.reserve_for_scribe(&"HEAT", &"task9-heat")
    if StringName(scribe.get("status", &"")) != &"OK":
        return {"status": &"SLICE_SETUP_FAILED"}

    var repository_result: Dictionary = GlyphTemplateRepository.load_from_paths(
        "res://data/glyphs/v1/glyph_vocabulary_v1.json",
        "res://data/glyphs/v1/slice_templates"
    )
    if StringName(repository_result.get("status", &"")) != &"OK":
        return {"status": &"SLICE_SETUP_FAILED"}
    _template_repository = repository_result.get("value", null)
    _recognition_service = GlyphRecognitionService.new(_template_repository, 0.80, 0.10)
    if _recognition_service == null or _recognition_service.configuration_status() != &"OK":
        return {"status": &"SLICE_SETUP_FAILED"}
    _scribe_coordinator = FocusScribeRecognitionCoordinator.new(
        _recognition_service,
        _vault,
        _stock,
        &"HEAT",
        StringName(scribe.get("reservation_id", &""))
    )
    _view_model = GlyphWritingViewModel.new()

    _ledger = Ledger.create(_stock, _vault)
    _state = WorkflowState.new()
    _coordinator = Coordinator.create(
        _state,
        Validator.new(),
        Calculator.new(),
        PreparationService,
        PreparationRequest,
        UseService,
        UseRequest,
        _ledger,
        Inventory.new(),
        ManaPool.create(50, 50),
        ResultLedger.new()
    )
    _placement_session = PlacementSession.create(PREPARATION_TRANSACTION_ID, _ledger)
    _saved_glyph_id = &""
    _preparation_configured = false
    _cast_committed = false
    _last_result.clear()
    _step = &"GLYPH"
    return {"status": &"SLICE_READY"}


func visible_step() -> StringName:
    return _step


func last_result() -> Dictionary:
    return _last_result.duplicate(true)


func glyph_drawing_context() -> Dictionary:
    return {
        "template_repository": _template_repository,
        "recognition_service": _recognition_service,
        "scribe_coordinator": _scribe_coordinator,
        "view_model": _view_model,
    }


func accept_saved_glyph(glyph_id: StringName) -> Dictionary:
    if _step != &"GLYPH" or glyph_id != &"HEAT":
        return {"status": &"GLYPH_SAVE_REQUIRED"}
    _saved_glyph_id = glyph_id
    _step = &"CIRCUIT"
    return {"status": &"VAULT_GLYPH_CREATED", "glyph_id": glyph_id}


func place_saved_glyph_as_main() -> Dictionary:
    if _step != &"CIRCUIT" or _saved_glyph_id.is_empty() or _placement_session == null:
        return {"status": &"GLYPH_SAVE_REQUIRED"}
    var placement: Dictionary = _placement_session.place_main(_main_glyph(_saved_glyph_id))
    if StringName(placement.get("status", &"")) != &"OK":
        return placement.duplicate(true)
    return {"status": &"PLACED", "node_id": placement.get("node_id", &"")}


func preview_spell() -> Dictionary:
    if _step != &"CIRCUIT" or _placement_session == null or _coordinator == null:
        return {"status": &"PREPARATION_REQUIRED"}
    if not _preparation_configured:
        if not _coordinator.configure_preparation(PREPARATION_TRANSACTION_ID, _placement_session.draft()):
            return {"status": &"PREPARATION_REQUIRED"}
        _preparation_configured = true
    return _coordinator.prepare_preview()


func confirm_preparation() -> Dictionary:
    if _step != &"CIRCUIT" or _coordinator == null:
        return {"status": &"PREPARATION_PREVIEW_REQUIRED"}
    var prepared: Dictionary = _coordinator.confirm_preparation(SPELL_ID)
    if StringName(prepared.get("status", &"")) != &"PREPARED":
        return prepared.duplicate(true)
    if not _coordinator.select_prepared_spell(SPELL_ID):
        return {"status": &"SPELL_SELECTION_REQUIRED"}
    _step = &"TARGET"
    _show_step()
    return prepared.duplicate(true)


func choose_target(target_id: StringName) -> Dictionary:
    if _step != &"TARGET" or _coordinator == null:
        return {"status": &"SPELL_SELECTION_REQUIRED"}
    var choice := _target_choice(target_id)
    if choice.is_empty():
        return {"status": &"INVALID_TARGET"}
    return _coordinator.prepare_target_preview(
        StringName(choice.get("target_keyword", &"")),
        Dictionary(choice.get("target", {})),
        Dictionary(choice.get("payload", {}))
    )


func target_choices() -> Array:
    return [
        {
            "id": &"WARD",
            "label": "흔들리는 보호막",
            "hint": "안정화를 우선합니다.",
            "target_keyword": &"WARD",
            "target": {"difficulty": 4, "mana_cost": 3, "target_valid": true},
            "payload": {"effect": &"PROTECT_WARD", "receipt": "보호막의 흔들림이 가라앉았습니다."},
        },
        {
            "id": &"FLOWER",
            "label": "시든 온실 꽃",
            "hint": "회복을 우선합니다.",
            "target_keyword": &"FLOWER",
            "target": {"difficulty": 2, "mana_cost": 2, "target_valid": true},
            "payload": {"effect": &"REVIVE_FLOWER", "receipt": "꽃의 빛이 되돌아왔습니다."},
        },
    ]


func request_cast_confirmation() -> bool:
    if _step != &"TARGET" or _cast_committed or _coordinator == null:
        return false
    return _coordinator.request_use_confirmation()


func confirm_cast() -> Dictionary:
    if _step != &"TARGET" or _cast_committed or _coordinator == null:
        return {"status": &"USE_CONFIRMATION_REQUIRED"}
    var used: Dictionary = _coordinator.confirm_use(USE_TRANSACTION_ID)
    if StringName(used.get("status", &"")) == &"USED":
        _on_cast_resolved(used)
    return used.duplicate(true)


func _main_glyph(glyph_id: StringName) -> Dictionary:
    return {
        "glyph_id": glyph_id,
        "source": GlyphTypes.Source.VAULT,
        "mastery": 70,
        "base_mana": 8,
        "base_success": 74,
        "is_learned": true,
    }


func _target_choice(target_id: StringName) -> Dictionary:
    match target_id:
        &"WARD":
            return {
                "target_keyword": &"WARD",
                "target": {"difficulty": 4, "mana_cost": 3, "target_valid": true},
                "payload": {"effect": &"PROTECT_WARD", "receipt": "보호막의 흔들림이 가라앉았습니다."},
            }
        &"FLOWER":
            return {
                "target_keyword": &"FLOWER",
                "target": {"difficulty": 2, "mana_cost": 2, "target_valid": true},
                "payload": {"effect": &"REVIVE_FLOWER", "receipt": "꽃의 빛이 되돌아왔습니다."},
            }
    return {}


func _connect_player_surfaces() -> void:
    if _glyph_screen != null and _glyph_screen.has_signal("glyph_saved") and not _glyph_screen.glyph_saved.is_connected(_on_glyph_saved):
        _glyph_screen.glyph_saved.connect(_on_glyph_saved)
    if _circuit_screen != null:
        _connect_intent(_circuit_screen, "place_main_requested", _on_place_main_requested)
        _connect_intent(_circuit_screen, "preview_requested", _on_preview_requested)
        _connect_intent(_circuit_screen, "prepare_requested", _on_prepare_requested)
        _connect_intent(_circuit_screen, "reset_requested", _on_circuit_reset_requested)
    if _spell_use_screen != null and _spell_use_screen.has_signal("cast_resolved") and not _spell_use_screen.cast_resolved.is_connected(_on_cast_resolved):
        _spell_use_screen.cast_resolved.connect(_on_cast_resolved)
    var restart = get_node_or_null(NodePath("ResultPanel/RestartButton"))
    if restart != null and not restart.pressed.is_connected(_restart_slice):
        restart.pressed.connect(_restart_slice)


func _configure_player_surfaces() -> void:
    if _glyph_screen != null and _glyph_screen.has_method("configure"):
        _glyph_screen.configure(
            {"title": "온실 실습", "problem": "불안정한 열기", "observed_keywords": ["열기"]},
            _recognition_service,
            _scribe_coordinator,
            _view_model,
            {"workflow_state": _state},
            0
        )
    if _circuit_screen != null and _circuit_screen.has_method("configure"):
        _circuit_screen.configure(_placement_session)
        _render_circuit({"status": &"글자를 Main에 놓아 주문을 만드세요."})
    if _spell_use_screen != null and _spell_use_screen.has_method("configure"):
        _spell_use_screen.configure(_coordinator, USE_TRANSACTION_ID)
        _spell_use_screen.set_target_choices(target_choices())


func _connect_intent(surface, signal_name: StringName, callback: Callable) -> void:
    if surface.has_signal(signal_name) and not surface.is_connected(signal_name, callback):
        surface.connect(signal_name, callback)


func _on_glyph_saved(glyph_id: StringName) -> void:
    if StringName(accept_saved_glyph(glyph_id).get("status", &"")) == &"VAULT_GLYPH_CREATED":
        _render_circuit({"status": &"글자를 Main에 놓아 주문을 만드세요."})
        _show_step()


func _on_place_main_requested(_glyph: Dictionary) -> void:
    if _step != &"CIRCUIT" or _placement_session == null or _saved_glyph_id.is_empty():
        return
    _placement_session.place_main(_main_glyph(_saved_glyph_id))
    _render_circuit({"status": &"Main 배치를 확인했습니다. Preview를 눌러 보세요."})


func _on_preview_requested() -> void:
    var preview: Dictionary = preview_spell()
    _render_circuit(preview)
    if _circuit_screen != null and _circuit_screen.has_method("render_state"):
        _circuit_screen.render_state(&"CIRCUIT_PREVIEW" if StringName(preview.get("status", &"")) == &"CIRCUIT_PREVIEW_READY" else &"VALIDATION_FAILURE")


func _on_prepare_requested() -> void:
    var prepared: Dictionary = confirm_preparation()
    if StringName(prepared.get("status", &"")) != &"PREPARED":
        return
    if _spell_use_screen != null:
        _spell_use_screen.configure(_coordinator, USE_TRANSACTION_ID)
        _spell_use_screen.set_target_choices(target_choices())
    _show_step()


func _on_circuit_reset_requested() -> void:
    _preparation_configured = false
    _render_circuit({"status": &"회로를 다시 구성하세요."})


func _on_cast_resolved(result: Dictionary) -> void:
    if StringName(result.get("status", &"")) != &"USED":
        return
    _cast_committed = true
    _last_result = result.duplicate(true)
    _step = &"RESULT"
    var receipt = get_node_or_null(NodePath("ResultPanel/Receipt")) as Label
    if receipt != null:
        var resolved: Dictionary = Dictionary(result.get("result", {}))
        var outcome := String(resolved.get("receipt", "주문 결과를 기록했습니다."))
        var target_name := _target_display_name(StringName(resolved.get("target_keyword", &"")))
        var mana_spent := int(result.get("mana_spent", 0))
        receipt.text = "%s\n대상: %s · 사용 마력: %d" % [outcome, target_name, mana_spent]
    _show_step()


func _target_display_name(target_keyword: StringName) -> String:
    for target_choice_variant in target_choices():
        var target_choice: Dictionary = Dictionary(target_choice_variant)
        if StringName(target_choice.get("target_keyword", &"")) == target_keyword:
            return String(target_choice.get("label", target_keyword))
    return String(target_keyword)


func _restart_slice() -> void:
    start_slice()
    _configure_player_surfaces()
    _show_step()


func _render_circuit(preview: Dictionary) -> void:
    if _circuit_screen == null or not _circuit_screen.has_method("render") or _placement_session == null:
        return
    _circuit_screen.render(
        {"vault_ids": [&"HEAT"] if not _saved_glyph_id.is_empty() else [], "stock_ids": [], "count": 1 if not _saved_glyph_id.is_empty() else 0, "maximum_each": 5},
        _placement_session.draft(),
        preview
    )


func _show_step() -> void:
    if _glyph_host != null:
        _glyph_host.visible = _step == &"GLYPH"
    if _circuit_host != null:
        _circuit_host.visible = _step == &"CIRCUIT"
    if _spell_use_host != null:
        _spell_use_host.visible = _step == &"TARGET"
    if _result_panel != null:
        _result_panel.visible = _step == &"RESULT"

# Product Root의 명시적 주문 흐름을 실제 authority로 검증한다.
extends RefCounted

const ROOT_PATH := "res://src/ui/spell_workflow/spell_workflow_product_root.gd"
const ROOT_SCENE_PATH := "res://src/ui/spell_workflow/spell_workflow_product_root.tscn"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(ROOT_PATH), "Task9 Product Root must exist")
    if not FileAccess.file_exists(ROOT_PATH):
        return

    var root_source := FileAccess.get_file_as_string(ROOT_PATH)
    var product_scene_source := FileAccess.get_file_as_string(ROOT_SCENE_PATH)
    case.assert_true(product_scene_source.contains("bg_greenhouse_field_base.webp"), "Product Root consumes the persisted greenhouse background asset")
    case.assert_true(root_source.contains("theme = GrimoireThemeFactory.create_theme()"), "Product Root applies the shared Academy live theme")

    var Root = load(ROOT_PATH)
    case.assert_true(Root != null and Root.can_instantiate(), "Task9 Product Root must compile")
    if Root == null or not Root.can_instantiate():
        return
    case.assert_true(FileAccess.file_exists(ROOT_SCENE_PATH), "Product Root scene must exist")
    var configured_main_scene = load(str(ProjectSettings.get_setting("application/run/main_scene", "")))
    case.assert_true(configured_main_scene != null, "Project main scene must load")
    if configured_main_scene != null:
        case.assert_equal(ROOT_SCENE_PATH, configured_main_scene.resource_path, "Product Root is the project main scene")
    var packed_scene = load(ROOT_SCENE_PATH)
    case.assert_true(packed_scene != null and packed_scene.can_instantiate(), "Product Root scene must instantiate")
    if packed_scene != null and packed_scene.can_instantiate():
        var scene_root := packed_scene.instantiate() as Control
        var tree := Engine.get_main_loop() as SceneTree
        case.assert_true(tree != null, "Product Root visual contract has an active SceneTree")
        if tree != null:
            tree.root.add_child(scene_root)

        case.assert_true(scene_root.theme != null, "Product Root applies the shared Academy Theme at runtime")
        if scene_root.theme != null:
            case.assert_true(scene_root.theme.get_stylebox(&"normal", &"Button") != null, "Academy Theme styles generic primary actions")
            case.assert_true(scene_root.theme.get_stylebox(&"panel", &"PanelContainer") != null, "Academy Theme styles generic content panels")

        var environment_background := scene_root.get_node_or_null("EnvironmentBackground") as TextureRect
        var readability_veil := scene_root.get_node_or_null("EnvironmentReadabilityVeil") as ColorRect
        case.assert_true(environment_background != null, "Product Root owns the persisted greenhouse backdrop node")
        case.assert_true(readability_veil != null, "Product Root owns the readability veil above the backdrop")
        if environment_background != null:
            case.assert_true(environment_background.texture != null, "Product Root loads the persisted greenhouse texture at runtime")
            case.assert_equal(Control.MOUSE_FILTER_IGNORE, environment_background.mouse_filter, "Greenhouse backdrop does not intercept player input")
        if readability_veil != null:
            case.assert_equal(Control.MOUSE_FILTER_IGNORE, readability_veil.mouse_filter, "Readability veil does not intercept player input")

        for required_node in ["GlyphScreen", "CircuitScreen", "SpellUseScreen", "ResultPanel"]:
            case.assert_true(scene_root.has_node(NodePath(required_node)), "Product Root exposes player surface: %s" % required_node)

        case.assert_false(product_scene_source.contains('parent="GlyphScreen/GlyphContent"'), "product root does not duplicate glyph-scene descendants")
        case.assert_false(product_scene_source.contains('parent="CircuitScreen/CircuitContent"'), "product root does not duplicate circuit-scene descendants")
        case.assert_false(product_scene_source.contains('parent="SpellUseScreen/SpellUseContent"'), "product root does not duplicate spell-use descendants")

        var writing_canvas: Control = scene_root.get_node(NodePath("GlyphScreen/GlyphContent/WritingCanvas"))
        case.assert_true(writing_canvas.custom_minimum_size.y >= 300.0, "glyph writing area reserves a meaningful first-screen height")
        var recognize_button: Button = scene_root.get_node(NodePath("GlyphScreen/GlyphContent/WritingCanvas/WritingContent/WritingActions/RecognizeButton"))
        case.assert_true(recognize_button.custom_minimum_size.y >= 48.0, "glyph recognition remains a touch-sized primary action")
        case.assert_equal(3, recognize_button.size_flags_horizontal, "glyph recognition shares the writing action row as an expanding action")

        var vault_source: Control = scene_root.get_node(NodePath("CircuitScreen/CircuitContent/Content/Layout/MainRow/VaultSourcePanel"))
        var stock_source: Control = scene_root.get_node(NodePath("CircuitScreen/CircuitContent/Content/Layout/MainRow/StockSourcePanel"))
        case.assert_true(vault_source.custom_minimum_size.x >= 180.0, "vault source panel has a readable minimum width")
        case.assert_true(stock_source.custom_minimum_size.x >= 180.0, "stock source panel has a readable minimum width")

        var scene_context: Dictionary = scene_root.glyph_drawing_context()
        var scene_templates: Array = scene_context.get("template_repository").templates(&"HEAT")
        var scene_recognition: Dictionary = scene_context.get("recognition_service").recognize(Array(scene_templates[0].get("strokes", [])), 0)
        var scene_candidate = Array(scene_recognition.get("candidates", []))[0]
        var scene_saved: Dictionary = scene_context.get("scribe_coordinator").accept_candidate(scene_candidate, 0)
        case.assert_equal(&"VAULT_GLYPH_CREATED", scene_saved.get("status", &""), "scene flow begins from an accepted glyph candidate")
        case.assert_equal(&"VAULT_GLYPH_CREATED", scene_root.accept_saved_glyph(&"HEAT").get("status", &""), "scene flow explicitly saves the accepted glyph")
        case.assert_equal(&"PLACED", scene_root.place_saved_glyph_as_main().get("status", &""), "scene flow explicitly places its glyph")
        case.assert_equal(&"CIRCUIT_PREVIEW_READY", scene_root.preview_spell().get("status", &""), "scene flow previews before preparation")
        case.assert_equal(&"PREPARED", scene_root.confirm_preparation().get("status", &""), "scene flow explicitly prepares the spell")
        case.assert_equal(&"FINAL_PREVIEW_READY", scene_root.choose_target(&"WARD").get("status", &""), "scene flow explicitly selects the ward")
        case.assert_true(scene_root.request_cast_confirmation(), "scene flow requests a separate cast confirmation")
        case.assert_equal(&"USED", scene_root.confirm_cast().get("status", &""), "scene flow resolves one confirmed cast")
        var scene_receipt: Label = scene_root.get_node(NodePath("ResultPanel/Receipt"))
        case.assert_true(scene_receipt.text.contains("보호막의 흔들림이 가라앉았습니다."), "result receipt renders the resolved outcome copy")
        case.assert_true(scene_receipt.text.contains("흔들리는 보호막"), "result receipt renders the player-facing target name")
        case.assert_true(scene_receipt.text.contains("사용 마력: 11"), "result receipt renders the actual spent mana")
        scene_root.queue_free()

    var root = Root.new()
    var started: Dictionary = root.start_slice()
    case.assert_equal(&"SLICE_READY", started.get("status", &""), "root starts a bounded explicit spell slice")
    case.assert_equal(&"GLYPH", root.visible_step(), "player begins at glyph writing")

    var drawing_context: Dictionary = root.glyph_drawing_context()
    var repository = drawing_context.get("template_repository")
    var service = drawing_context.get("recognition_service")
    var scribe = drawing_context.get("scribe_coordinator")
    var templates: Array = repository.templates(&"HEAT")
    var recognition: Dictionary = service.recognize(Array(templates[0].get("strokes", [])), 0)
    var candidate = Array(recognition.get("candidates", []))[0]
    var saved: Dictionary = scribe.accept_candidate(candidate, 0)
    case.assert_equal(&"VAULT_GLYPH_CREATED", saved.get("status", &""), "glyph storage is created only by accepted recognition and active reservation")
    var accepted: Dictionary = root.accept_saved_glyph(&"HEAT")
    case.assert_equal(&"VAULT_GLYPH_CREATED", accepted.get("status", &""), "root advances only after glyph screen reports explicit save")
    case.assert_equal(&"CIRCUIT", root.visible_step(), "successful glyph save opens circuit step")

    var placed: Dictionary = root.place_saved_glyph_as_main()
    case.assert_equal(&"PLACED", placed.get("status", &""), "saved glyph can be explicitly placed at Main")
    var preview: Dictionary = root.preview_spell()
    case.assert_equal(&"CIRCUIT_PREVIEW_READY", preview.get("status", &""), "circuit preview stays target-free")
    var prepared: Dictionary = root.confirm_preparation()
    case.assert_equal(&"PREPARED", prepared.get("status", &""), "spell preparation needs explicit confirmation")
    case.assert_equal(&"TARGET", root.visible_step(), "only prepared spell opens target step")
    var targets: Array = root.target_choices()
    case.assert_equal(2, targets.size(), "target step exposes exactly two valid alternatives")
    case.assert_equal(&"WARD", StringName(Dictionary(targets[0]).get("id", &"")), "first alternative is identified without automatic selection")
    case.assert_equal(&"FLOWER", StringName(Dictionary(targets[1]).get("id", &"")), "second alternative is identified without automatic selection")

    var final_preview: Dictionary = root.choose_target(&"WARD")
    case.assert_equal(&"FINAL_PREVIEW_READY", final_preview.get("status", &""), "player-selected ward creates final preview")
    case.assert_true(root.request_cast_confirmation(), "cast requires a separate explicit confirmation")
    var used: Dictionary = root.confirm_cast()
    case.assert_equal(&"USED", used.get("status", &""), "one confirmed cast resolves atomically")
    case.assert_equal(&"RESULT", root.visible_step(), "used result opens receipt")
    case.assert_equal(&"USE_CONFIRMATION_REQUIRED", root.confirm_cast().get("status", &""), "replayed cast fails closed")
    root.free()

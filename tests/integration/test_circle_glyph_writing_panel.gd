extends RefCounted

const PANEL_SCENE_PATH := "res://src/ui/glyph_writing/circle_glyph_writing_panel.tscn"
const HEAT_FIXTURE_PATH := "res://tests/fixtures/glyphs/heat-positive.json"
const PROTECT_FIXTURE_PATH := "res://tests/fixtures/glyphs/protect-positive.json"


func run(case) -> void:
    case.assert_true(ResourceLoader.exists(PANEL_SCENE_PATH), "Circle glyph writing panel exists outside the retired spell-workflow path")
    if not ResourceLoader.exists(PANEL_SCENE_PATH):
        return

    var scene = load(PANEL_SCENE_PATH)
    case.assert_true(scene is PackedScene, "Circle glyph writing panel scene loads")
    if not scene is PackedScene:
        return

    var panel = scene.instantiate()
    panel.configure_allowed_glyphs([&"HEAT", &"PROTECT"])
    var accepted_ids: Array[StringName] = []
    panel.glyph_accepted.connect(func(glyph_id: StringName): accepted_ids.append(glyph_id))

    var heat_result: Dictionary = panel.submit_strokes(_load_strokes(HEAT_FIXTURE_PATH))
    case.assert_equal(&"CANDIDATE_READY", heat_result.get("status", &""), "Directly written heat glyph is recognized before use")
    case.assert_equal(&"CANDIDATE_SELECTED", panel.select_candidate(0).get("status", &""), "Player explicitly selects the recognized glyph")
    var heat_accepted: Dictionary = panel.accept_selected_candidate()
    case.assert_equal(&"GLYPH_ACCEPTED", heat_accepted.get("status", &""), "Recognized glyph is accepted only by explicit action")
    case.assert_equal(&"HEAT", heat_accepted.get("glyph_id", &""), "Accepted glyph keeps its exact semantic id")
    case.assert_equal([&"HEAT"], accepted_ids, "The panel emits the accepted glyph exactly once")

    var protect_result: Dictionary = panel.submit_strokes(_load_strokes(PROTECT_FIXTURE_PATH))
    case.assert_equal(&"CANDIDATE_READY", protect_result.get("status", &""), "Directly written protect glyph is recognized from the same generic path")
    case.assert_equal(&"CANDIDATE_SELECTED", panel.select_candidate(0).get("status", &""), "Second glyph still requires explicit candidate selection")
    var protect_accepted: Dictionary = panel.accept_selected_candidate()
    case.assert_equal(&"GLYPH_ACCEPTED", protect_accepted.get("status", &""), "Second glyph needs its own explicit acceptance")
    case.assert_equal(&"PROTECT", protect_accepted.get("glyph_id", &""), "Second glyph accepts PROTECT without Main or Auxiliary roles")
    case.assert_equal([&"HEAT", &"PROTECT"], accepted_ids, "Two separately accepted direct writings remain ordered player inputs")
    panel.free()


func _load_strokes(path: String) -> Array[PackedVector2Array]:
    var output: Array[PackedVector2Array] = []
    var parser := JSON.new()
    if parser.parse(FileAccess.get_file_as_string(path)) != OK or typeof(parser.data) != TYPE_DICTIONARY:
        return output
    for raw_stroke in parser.data.get("strokes", []):
        if typeof(raw_stroke) != TYPE_ARRAY:
            continue
        var stroke := PackedVector2Array()
        for raw_point in raw_stroke:
            if typeof(raw_point) == TYPE_ARRAY and raw_point.size() == 2:
                stroke.append(Vector2(float(raw_point[0]), float(raw_point[1])))
        output.append(stroke)
    return output

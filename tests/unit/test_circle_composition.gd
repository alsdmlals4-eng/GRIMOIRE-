extends RefCounted

const COMPOSITION_PATH := "res://src/core/circle/circle_composition.gd"
const RESOLVER_PATH := "res://src/core/circle/circle_composition_resolver.gd"


func run(case) -> void:
    case.assert_true(FileAccess.file_exists(COMPOSITION_PATH), "Circle composition implementation must exist")
    if not FileAccess.file_exists(COMPOSITION_PATH):
        return

    case.assert_true(FileAccess.file_exists(RESOLVER_PATH), "Circle composition resolver implementation must exist")
    if not FileAccess.file_exists(RESOLVER_PATH):
        return

    var composition_script = load(COMPOSITION_PATH)
    var resolver_script = load(RESOLVER_PATH)
    case.assert_true(composition_script != null, "Circle composition script loads")
    case.assert_true(resolver_script != null, "Circle composition resolver script loads")
    if composition_script == null or resolver_script == null:
        return

    var glyph_ids: Array[StringName] = [&"HEAT", &"SUMMON"]
    var visual_layers: Array[StringName] = [&"SUMMON", &"HEAT"]
    var composition = composition_script.create(glyph_ids, visual_layers)
    case.assert_equal(&"OK", composition.validation().get("status", &""), "Two glyphs form a valid layered circle")

    var single_ids: Array[StringName] = [&"HEAT"]
    var single = composition_script.create(single_ids, single_ids)
    case.assert_equal(&"OK", single.validation().get("status", &""), "One glyph forms a valid layered circle")

    var three_ids: Array[StringName] = [&"HEAT", &"FLOW", &"PROTECT"]
    var three = composition_script.create(three_ids, three_ids)
    case.assert_equal(&"OK", three.validation().get("status", &""), "Three glyphs form a valid layered circle")

    var empty_ids: Array[StringName] = []
    var empty = composition_script.create(empty_ids, empty_ids)
    case.assert_equal(&"GLYPH_COUNT_REQUIRED", empty.validation().get("status", &""), "A layered circle requires at least one glyph")

    var reversed_ids: Array[StringName] = [&"SUMMON", &"HEAT"]
    var reversed_layers: Array[StringName] = [&"HEAT", &"SUMMON"]
    var reversed = composition_script.create(reversed_ids, reversed_layers)
    case.assert_equal(composition.logical_signature(), reversed.logical_signature(), "Logical meaning ignores visual layer order")

    var overflow_ids: Array[StringName] = [&"HEAT", &"FLOW", &"PROTECT", &"SUMMON"]
    var no_layers: Array[StringName] = []
    var overflow = composition_script.create(overflow_ids, no_layers)
    case.assert_equal(&"GLYPH_COUNT_EXCEEDED", overflow.validation().get("status", &""), "Four glyphs exceed the three-circle cap")
    var snapshot: Dictionary = composition.to_snapshot()
    case.assert_false(snapshot.has("main_glyph"), "Layered circles expose no Main glyph")
    case.assert_false(snapshot.has("auxiliary"), "Layered circles expose no Auxiliary glyph collection")
    case.assert_false(snapshot.has("center"), "Layered circles expose no center slot")
    case.assert_false(snapshot.has("vertex"), "Layered circles expose no vertex slot")
    case.assert_false(snapshot.has("slot"), "Layered circles expose no slot semantics")

    glyph_ids[0] = &"PROTECT"
    visual_layers[0] = &"HEAT"
    var mutable_snapshot: Dictionary = composition.to_snapshot()
    var mutable_snapshot_ids: Array = mutable_snapshot.get("glyph_instance_ids", [])
    var mutable_snapshot_layers: Array = mutable_snapshot.get("visual_layer_order", [])
    mutable_snapshot_ids[0] = &"PROTECT"
    mutable_snapshot_layers[0] = &"HEAT"
    composition._glyph_ids_json = JSON.stringify(["PROTECT"])
    composition._visual_layers_json = JSON.stringify(["HEAT"])
    case.assert_equal(&"HEAT+SUMMON", composition.logical_signature(), "Input and snapshot mutations cannot change the composition")
    case.assert_equal(&"HEAT", composition.to_snapshot().get("glyph_instance_ids", [])[0], "Composition retains its original glyph instance")
    case.assert_equal(&"SUMMON", composition.to_snapshot().get("visual_layer_order", [])[0], "Composition retains its original visual layer")

    var resolver = resolver_script.new()
    var preview: Dictionary = resolver.preview(composition, {"risk_tags": [&"CONTEXT_RISK"]})
    case.assert_equal(composition.logical_signature(), preview.get("composition_signature", &""), "Preview identifies the role-free composition")
    case.assert_true(preview.has("meaning_tags"), "Preview exposes semantic meaning tags")
    case.assert_true(preview.has("method_tags"), "Preview exposes available method tags")
    case.assert_true(preview.has("risk_tags"), "Preview exposes target-independent risk tags")
    var preview_keys: Array = preview.keys()
    preview_keys.sort()
    case.assert_equal(["composition_signature", "meaning_tags", "method_tags", "risk_tags"], preview_keys, "Preview exposes exactly the four role-free semantic fields")
    case.assert_false(preview.has("main_glyph"), "Preview exposes no Main glyph label")
    case.assert_false(preview.has("auxiliary"), "Preview exposes no Auxiliary label")
    case.assert_false(preview.has("center"), "Preview exposes no center slot")
    case.assert_false(preview.has("vertex"), "Preview exposes no vertex slot")
    case.assert_false(preview.has("slot"), "Preview exposes no slot semantics")

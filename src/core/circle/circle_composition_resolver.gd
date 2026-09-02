class_name CircleCompositionResolver
extends RefCounted

const GlyphCatalog = preload("res://src/core/glyphs/glyph_catalog.gd")


func preview(composition, context_tags: Dictionary) -> Dictionary:
    var meaning_tags: Array[StringName] = []
    var method_tags: Array[StringName] = []
    var risk_tags: Array[StringName] = []
    for glyph_id in composition.glyph_instance_ids():
        var metadata: Dictionary = GlyphCatalog.metadata(glyph_id)
        _append_unique_tags(meaning_tags, Array(metadata.get("meaning_tags", [])))
        _append_unique_tags(method_tags, Array(metadata.get("method_tags", [])))
    _append_unique_tags(risk_tags, Array(context_tags.get("risk_tags", [])))

    var validation: Dictionary = composition.validation()
    if validation.get("status", &"") != &"OK":
        _append_unique_tags(risk_tags, [StringName(validation.get("status", &""))])

    return {
        "composition_signature": composition.logical_signature(),
        "meaning_tags": meaning_tags,
        "method_tags": method_tags,
        "risk_tags": risk_tags,
    }


func _append_unique_tags(destination: Array[StringName], values: Array) -> void:
    for value in values:
        var tag := StringName(value)
        if not tag.is_empty() and not destination.has(tag):
            destination.append(tag)

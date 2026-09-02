class_name GlyphCatalog
extends RefCounted

const ORDER: Array[StringName] = [
    &"HEAT", &"FLOW", &"PROTECT", &"COOL", &"MEND",
    &"FOCUS", &"DISPERSE", &"STABILIZE", &"SUSTAIN", &"AMPLIFY",
]

const META := {
    &"HEAT": {"name": "열", "meaning_tags": [&"HEAT"], "method_tags": [&"INTENSIFY"], "shape_key": &"GLYPH_HEAT"},
    &"FLOW": {"name": "흐름", "meaning_tags": [&"FLOW"], "method_tags": [&"REDIRECT"], "shape_key": &"GLYPH_FLOW"},
    &"PROTECT": {"name": "보호", "meaning_tags": [&"PROTECTION"], "method_tags": [&"WARD"], "shape_key": &"GLYPH_PROTECT"},
    &"COOL": {"name": "냉각", "meaning_tags": [&"COOLING"], "method_tags": [&"TEMPER"], "shape_key": &"GLYPH_COOL"},
    &"MEND": {"name": "수복", "meaning_tags": [&"RESTORATION"], "method_tags": [&"REPAIR"], "shape_key": &"GLYPH_MEND"},
    &"FOCUS": {"name": "집중", "meaning_tags": [&"PRECISION"], "method_tags": [&"FOCUS"], "shape_key": &"GLYPH_FOCUS"},
    &"DISPERSE": {"name": "분산", "meaning_tags": [&"DISPERSAL"], "method_tags": [&"SCATTER"], "shape_key": &"GLYPH_DISPERSE"},
    &"STABILIZE": {"name": "안정", "meaning_tags": [&"STABILITY"], "method_tags": [&"ANCHOR"], "shape_key": &"GLYPH_STABILIZE"},
    &"SUSTAIN": {"name": "지속", "meaning_tags": [&"DURATION"], "method_tags": [&"SUSTAIN"], "shape_key": &"GLYPH_SUSTAIN"},
    &"AMPLIFY": {"name": "증폭", "meaning_tags": [&"AMPLIFICATION"], "method_tags": [&"AMPLIFY"], "shape_key": &"GLYPH_AMPLIFY"},
}


static func normalize_id(glyph_id: StringName) -> StringName:
    return &"AMPLIFY" if glyph_id == &"BURST" else glyph_id


static func metadata(glyph_id: StringName) -> Dictionary:
    return Dictionary(META.get(normalize_id(glyph_id), {})).duplicate(true)


static func all_ids() -> Array[StringName]:
    return ORDER.duplicate()


static func drawable_vault_ids() -> Array[StringName]:
    return [&"HEAT", &"FLOW", &"PROTECT", &"FOCUS", &"DISPERSE"]

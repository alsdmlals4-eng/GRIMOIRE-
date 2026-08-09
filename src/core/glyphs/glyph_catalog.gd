class_name GlyphCatalog
extends RefCounted

const ORDER: Array[StringName] = [
    &"HEAT", &"FLOW", &"PROTECT", &"COOL", &"MEND",
    &"FOCUS", &"DISPERSE", &"STABILIZE", &"SUSTAIN", &"AMPLIFY",
]

const META := {
    &"HEAT": {"name": "열", "role": &"MAIN", "shape_key": &"GLYPH_HEAT"},
    &"FLOW": {"name": "흐름", "role": &"MAIN", "shape_key": &"GLYPH_FLOW"},
    &"PROTECT": {"name": "보호", "role": &"MAIN", "shape_key": &"GLYPH_PROTECT"},
    &"COOL": {"name": "냉각", "role": &"MAIN", "shape_key": &"GLYPH_COOL"},
    &"MEND": {"name": "수복", "role": &"MAIN", "shape_key": &"GLYPH_MEND"},
    &"FOCUS": {"name": "집중", "role": &"AUX", "shape_key": &"GLYPH_FOCUS"},
    &"DISPERSE": {"name": "분산", "role": &"AUX", "shape_key": &"GLYPH_DISPERSE"},
    &"STABILIZE": {"name": "안정", "role": &"AUX", "shape_key": &"GLYPH_STABILIZE"},
    &"SUSTAIN": {"name": "지속", "role": &"AUX", "shape_key": &"GLYPH_SUSTAIN"},
    &"AMPLIFY": {"name": "증폭", "role": &"AUX", "shape_key": &"GLYPH_AMPLIFY"},
}


static func normalize_id(glyph_id: StringName) -> StringName:
    return &"AMPLIFY" if glyph_id == &"BURST" else glyph_id


static func metadata(glyph_id: StringName) -> Dictionary:
    return Dictionary(META.get(normalize_id(glyph_id), {})).duplicate(true)


static func all_ids() -> Array[StringName]:
    return ORDER.duplicate()


static func drawable_vault_ids() -> Array[StringName]:
    return [&"HEAT", &"FLOW", &"PROTECT", &"FOCUS", &"DISPERSE"]


static func is_main(glyph_id: StringName) -> bool:
    return StringName(metadata(glyph_id).get("role", &"")) == &"MAIN"

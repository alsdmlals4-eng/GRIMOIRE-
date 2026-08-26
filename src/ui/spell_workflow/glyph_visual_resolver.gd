# 승인된 문양 ID를 런타임 시각 자산과 한국어 표시명으로 해석하는 UI 전용 resolver다.
class_name GlyphVisualResolver
extends RefCounted

const VISUALS: Dictionary = {
    &"HEAT": {
        "texture_path": "res://assets/art/ui/glyphs/glyph_heat.png",
        "korean_name": "열기",
    },
    &"PROTECT": {
        "texture_path": "res://assets/art/ui/glyphs/glyph_protect.png",
        "korean_name": "보호",
    },
    &"FLOW": {
        "texture_path": "res://assets/art/ui/glyphs/glyph_flow.png",
        "korean_name": "흐름",
    },
    &"FOCUS": {
        "texture_path": "res://assets/art/ui/glyphs/glyph_focus.png",
        "korean_name": "집중",
    },
    &"DISPERSE": {
        "texture_path": "res://assets/art/ui/glyphs/glyph_disperse.png",
        "korean_name": "분산",
    },
    &"BURST": {
        "texture_path": "res://assets/art/ui/glyphs/glyph_burst.png",
        "korean_name": "폭발",
    },
}

const VISUAL_COMPATIBILITY: Dictionary = {
    &"AMPLIFY": &"BURST",
}


static func asset_id_for(glyph_id: StringName) -> StringName:
    if VISUALS.has(glyph_id):
        return glyph_id
    return StringName(VISUAL_COMPATIBILITY.get(glyph_id, &""))


static func texture_path_for(glyph_id: StringName) -> String:
    var visual: Dictionary = Dictionary(VISUALS.get(asset_id_for(glyph_id), {}))
    return String(visual.get("texture_path", ""))


static func texture_for(glyph_id: StringName) -> Texture2D:
    var texture_path := texture_path_for(glyph_id)
    if texture_path.is_empty():
        return null
    return load(texture_path) as Texture2D


static func korean_name_for(glyph_id: StringName) -> String:
    var visual: Dictionary = Dictionary(VISUALS.get(asset_id_for(glyph_id), {}))
    return String(visual.get("korean_name", ""))

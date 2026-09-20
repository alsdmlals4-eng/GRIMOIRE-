extends RefCounted
## Presentation-only atlas map. Stable recipe IDs remain owned by spell_semantics.
const ELEMENTS = preload("res://output/imagegen/spell-manifestation-20260920/elements-alpha.png")
const COMBINATIONS = preload("res://output/imagegen/spell-manifestation-20260920/combinations-alpha.png")
const CIRCLE = preload("res://output/imagegen/spell-manifestation-20260920/circle-alpha.png")
const REGIONS := {
    "EMBER": Rect2(0,64,375,896),
    "WIND": Rect2(375,96,343,864),
    "WARD": Rect2(718,280,470,480),
    "GATHER": Rect2(1188,96,348,864),
}
const PAIRS := ["EMBER+WIND","EMBER+WARD","EMBER+GATHER","WARD+WIND","GATHER+WIND","GATHER+WARD"]

static func texture_for(key: String) -> Texture2D:
    var result := AtlasTexture.new()
    result.filter_clip = true
    if key in REGIONS:
        result.atlas = ELEMENTS
        result.region = REGIONS[key]
        # Square virtual canvas keeps card sizing consistent, without editing pixels.
        var side: float = maxf(result.region.size.x,result.region.size.y)
        var padding := Vector2(side,side) - result.region.size
        result.margin = Rect2(padding / 2.0,padding)
    elif key in PAIRS:
        var index: int = PAIRS.find(key)
        result.atlas = COMBINATIONS
        result.region = Rect2((index % 3) * 512,(index / 3) * 512,512,512)
    else:
        return null
    return result

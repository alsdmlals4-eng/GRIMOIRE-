@tool
class_name CardDefinition
extends Resource

const APPROVED_TYPES: Array[StringName] = [
    &"WIZARD",
    &"ATTACK_SPELL",
    &"DEFENSE_SPELL",
    &"SUMMON",
]

const ARTWORK_STATES: Array[StringName] = [
    &"NEEDED",
    &"GENERATED_CANDIDATE",
    &"USER_APPROVED",
    &"IMPLEMENTED",
]

@export var card_id: StringName = &""
@export var type: StringName = &""
@export var story_unlock: StringName = &""
@export var artwork_state: StringName = &"NEEDED"

# A card may later reference a role-free CircleComposition. It remains runtime-only
# until a concrete story card is approved and authored.
var composition = null


func validate() -> StringName:
    if card_id.is_empty():
        return &"CARD_ID_REQUIRED"
    if not APPROVED_TYPES.has(type):
        return &"CARD_TYPE_INVALID"
    if story_unlock.is_empty():
        return &"STORY_UNLOCK_REQUIRED"
    if not ARTWORK_STATES.has(artwork_state):
        return &"ARTWORK_STATE_INVALID"
    return &"OK"

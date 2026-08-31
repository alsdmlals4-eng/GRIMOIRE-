@tool
class_name CardDefinition
extends Resource

const CircleComposition = preload("res://src/core/circle/circle_composition.gd")

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

const FORBIDDEN_ROLE_SEMANTICS: Array[StringName] = [
    &"MAIN",
    &"AUX",
    &"AUXILIARY",
    &"CENTER",
    &"CENTRE",
    &"VERTEX",
    &"SLOT",
    &"STAR",
]

var _composition = null
var _composition_status: StringName = &"COMPOSITION_NONE"

# Some narrative record cards can have no glyph formula. Formula cards must use
# this safe property so a featured archive example always has a role-free circle.
var composition:
    set(value):
        _assign_composition(value)
    get:
        return _composition


func set_composition(next_composition) -> StringName:
    composition = next_composition
    return _composition_status


func composition_status() -> StringName:
    return _composition_status


func composition_signature() -> StringName:
    if _composition == null:
        return &""
    return _composition.logical_signature()


func validate() -> StringName:
    if card_id.is_empty():
        return &"CARD_ID_REQUIRED"
    if not APPROVED_TYPES.has(type):
        return &"CARD_TYPE_INVALID"
    if story_unlock.is_empty():
        return &"STORY_UNLOCK_REQUIRED"
    if not ARTWORK_STATES.has(artwork_state):
        return &"ARTWORK_STATE_INVALID"
    if _composition != null and _composition_status != &"COMPOSITION_ASSIGNED":
        return _composition_status
    return &"OK"


func _assign_composition(next_composition) -> void:
    if next_composition == null:
        _composition = null
        _composition_status = &"COMPOSITION_REQUIRED"
        return
    if not next_composition is CircleComposition:
        _composition = null
        _composition_status = &"COMPOSITION_TYPE_INVALID"
        return

    var validation: Dictionary = next_composition.validation()
    var validation_status := StringName(validation.get("status", &""))
    if validation_status != &"OK":
        _composition = null
        _composition_status = StringName("COMPOSITION_INVALID_%s" % String(validation_status))
        return
    if _contains_forbidden_role_semantics(next_composition.to_snapshot()):
        _composition = null
        _composition_status = &"COMPOSITION_ROLE_SEMANTICS_FORBIDDEN"
        return

    _composition = next_composition
    _composition_status = &"COMPOSITION_ASSIGNED"


func _contains_forbidden_role_semantics(snapshot: Dictionary) -> bool:
    for forbidden_key in [&"main_glyph", &"auxiliary", &"center", &"centre", &"vertex", &"slot", &"star"]:
        if snapshot.has(forbidden_key):
            return true
    for collection_key in [&"glyph_instance_ids", &"visual_layer_order"]:
        for value in Array(snapshot.get(collection_key, [])):
            var semantic_token := StringName(String(value).to_upper())
            if FORBIDDEN_ROLE_SEMANTICS.has(semantic_token):
                return true
    return false

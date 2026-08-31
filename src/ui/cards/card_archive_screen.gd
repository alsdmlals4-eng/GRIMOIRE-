class_name CardArchiveScreen
extends Control

const CardDefinition = preload("res://src/core/cards/card_definition.gd")
const StoryProgress = preload("res://src/core/story/story_progress.gd")
const ThemeFactory = preload("res://src/ui/theme/grimoire_theme_factory.gd")

const RULESET_RESOURCE_PATH := "res://data/cards/card_ruleset_01.tres"

var _ruleset = null
var _story_progress = null
var _story_unlocked_cards: Array = []


func _ready() -> void:
    theme = ThemeFactory.create_theme()
    _ensure_ruleset()
    _render()


func configure_story_cards(progress, candidate_cards: Array) -> void:
    _story_progress = null
    if progress is StoryProgress and progress.is_valid():
        _story_progress = progress
    _story_unlocked_cards = _validated_story_cards(candidate_cards)
    _ensure_ruleset()
    _render()


func visible_card_ids() -> Array[StringName]:
    var card_ids: Array[StringName] = []
    for card in _story_unlocked_cards:
        card_ids.append(card.card_id)
    return card_ids


func ruleset_status_text() -> String:
    var status_label := get_node_or_null(NodePath("Content/RulesetStatus")) as Label
    return "" if status_label == null else status_label.text


func request_start_duel() -> Dictionary:
    return {
        "status": &"RULESET_PENDING",
        "reason": &"DETAILED_DUEL_RULES_PENDING",
    }


func _ensure_ruleset() -> void:
    if _ruleset == null:
        _ruleset = load(RULESET_RESOURCE_PATH)


func _validated_story_cards(cards: Array) -> Array:
    var validated: Array = []
    var authorized_unlocks := _authoritative_card_unlocks()
    for card in cards:
        if not card is CardDefinition or card.validate() != &"OK":
            continue
        var authorized_story_unlock := StringName(authorized_unlocks.get(card.card_id, &""))
        if authorized_story_unlock.is_empty() or card.story_unlock != authorized_story_unlock:
            continue
        validated.append(card)
    return validated


func _authoritative_card_unlocks() -> Dictionary:
    if _story_progress == null:
        return {}
    return _story_progress.card_unlocks()


func _render() -> void:
    var status_label := get_node_or_null(NodePath("Content/RulesetStatus")) as Label
    if status_label != null:
        var distribution_status: StringName = &"RULESET_PENDING"
        if _ruleset != null:
            distribution_status = StringName(_ruleset.mana_distribution_status)
        status_label.text = "카드 결투 상세 규칙: %s" % String(distribution_status)

    var cards_container := get_node_or_null(NodePath("Content/UnlockedCards")) as VBoxContainer
    if cards_container == null:
        return
    for child in cards_container.get_children():
        child.queue_free()
    for card in _story_unlocked_cards:
        var card_label := Label.new()
        card_label.name = String(card.card_id)
        var composition_text := "글자 조합 없음"
        if not card.composition_signature().is_empty():
            composition_text = "글자 조합: %s" % String(card.composition_signature())
        card_label.text = "%s · %s · %s" % [String(card.card_id), String(card.type), composition_text]
        cards_container.add_child(card_label)

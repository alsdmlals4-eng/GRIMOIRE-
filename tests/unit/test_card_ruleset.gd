extends RefCounted

const CARD_DEFINITION_PATH := "res://src/core/cards/card_definition.gd"
const CARD_RULESET_PATH := "res://src/core/cards/card_ruleset.gd"
const CARD_ROUND_STATE_PATH := "res://src/core/cards/card_round_state.gd"
const CARD_RULESET_RESOURCE_PATH := "res://data/cards/card_ruleset_01.tres"


func run(case) -> void:
    # Breaks if the narrative card shell is absent rather than silently treating card rules as implemented.
    case.assert_true(FileAccess.file_exists(CARD_DEFINITION_PATH), "Card definition implementation must exist")
    case.assert_true(FileAccess.file_exists(CARD_RULESET_PATH), "Card ruleset implementation must exist")
    case.assert_true(FileAccess.file_exists(CARD_ROUND_STATE_PATH), "Card round-state implementation must exist")
    case.assert_true(ResourceLoader.exists(CARD_RULESET_RESOURCE_PATH), "Card ruleset resource must exist")
    if not FileAccess.file_exists(CARD_DEFINITION_PATH) or not FileAccess.file_exists(CARD_RULESET_PATH) or not FileAccess.file_exists(CARD_ROUND_STATE_PATH) or not ResourceLoader.exists(CARD_RULESET_RESOURCE_PATH):
        return

    var card_definition_script = load(CARD_DEFINITION_PATH)
    var card_ruleset_script = load(CARD_RULESET_PATH)
    var card_round_state_script = load(CARD_ROUND_STATE_PATH)
    var ruleset = load(CARD_RULESET_RESOURCE_PATH)
    case.assert_true(card_definition_script != null and card_definition_script.can_instantiate(), "Card definition script loads")
    case.assert_true(card_ruleset_script != null and card_ruleset_script.can_instantiate(), "Card ruleset script loads")
    case.assert_true(card_round_state_script != null and card_round_state_script.can_instantiate(), "Card round-state script loads")
    case.assert_true(ruleset != null, "Card ruleset resource loads")
    if card_definition_script == null or card_ruleset_script == null or card_round_state_script == null or ruleset == null:
        return

    _assert_card_types(case, card_definition_script)
    _assert_fixed_structure(case, card_ruleset_script, ruleset)
    _assert_illustrative_mana_boundary(case, ruleset)
    _assert_exactly_once_round_end(case, card_round_state_script)


func _assert_card_types(case, card_definition_script) -> void:
    for card_type in [&"WIZARD", &"ATTACK_SPELL", &"DEFENSE_SPELL", &"SUMMON"]:
        var card = card_definition_script.new()
        card.card_id = StringName("CARD_%s" % card_type)
        card.type = card_type
        card.story_unlock = &"FIRST_DUEL_CLASS"
        case.assert_equal(&"OK", card.validate(), "%s is one approved card type" % card_type)

    var invalid_card = card_definition_script.new()
    invalid_card.card_id = &"CARD_INVALID"
    invalid_card.type = &"TREASURE"
    invalid_card.story_unlock = &"FIRST_DUEL_CLASS"
    case.assert_equal(&"CARD_TYPE_INVALID", invalid_card.validate(), "Card definition rejects a fifth unapproved type")


func _assert_fixed_structure(case, card_ruleset_script, ruleset) -> void:
    case.assert_equal(3, ruleset.max_circle_count, "Card ruleset keeps the shared three-circle structural cap")
    case.assert_equal(3, ruleset.rounds, "Card ruleset keeps the approved three-round structure")
    case.assert_equal(&"FIRST_TO_2_ROUNDS", ruleset.match_win_condition, "Card ruleset keeps first-to-two match structure")
    case.assert_equal(&"RESOLVE_ONCE_AT_ROUND_END", ruleset.unspent_prepared_spell_rule, "Unspent prepared spell uses only the approved round-end shell")
    case.assert_equal(&"OK", ruleset.validate(), "Card ruleset accepts its approved structural values")

    var invalid_circle_cap = card_ruleset_script.new()
    invalid_circle_cap.max_circle_count = 2
    case.assert_equal(&"CIRCLE_CAP_MISMATCH", invalid_circle_cap.validate(), "Card ruleset rejects a circle cap other than three")

    var invalid_round_count = card_ruleset_script.new()
    invalid_round_count.rounds = 2
    case.assert_equal(&"ROUND_COUNT_MISMATCH", invalid_round_count.validate(), "Card ruleset rejects a round count other than three")


func _assert_illustrative_mana_boundary(case, ruleset) -> void:
    # Breaks if the 20-mana / [7, 7, 6] illustration becomes a fixed budget, validator, allocation, or payment rule.
    case.assert_equal(&"RULESET_PENDING", ruleset.mana_distribution_status, "Mana distribution remains unapproved")
    var mana_example: Dictionary = ruleset.mana_example()
    case.assert_equal(20, mana_example.get("remaining_mana", -1), "The supplied 20-mana scenario is preserved as an example")
    case.assert_equal([7, 7, 6], mana_example.get("illustrative_round_split", []), "The supplied split is illustrative only")
    case.assert_false(mana_example.get("is_balance_rule", true), "Illustrative mana data never becomes a balance rule")
    case.assert_equal(&"ROUND_JUDGMENT_INPUT", ruleset.player_remaining_mana, "Runtime remaining mana is input, not a fixed distribution")
    case.assert_equal(&"OK", ruleset.validate(0), "Zero remaining mana does not invalidate the pending ruleset shell")
    case.assert_equal(&"OK", ruleset.validate(13), "Different runtime mana does not invalidate the pending ruleset shell")
    case.assert_equal(&"OK", ruleset.validate(20), "The example state does not receive special validation")
    case.assert_equal(&"OK", ruleset.validate(99), "Higher runtime mana does not create an unapproved cap")
    case.assert_false(_has_property(ruleset, &"round_mana_budget"), "Ruleset exposes no fixed per-round mana budget")
    case.assert_false(_has_property(ruleset, &"total_mana_budget"), "Ruleset exposes no fixed total mana budget")


func _assert_exactly_once_round_end(case, card_round_state_script) -> void:
    # Breaks if the round-end shell can resolve one prepared spell more than once.
    var state = card_round_state_script.new(&"PREPARED_FROST_SPELL")
    var first: Dictionary = state.resolve_round_end(&"round-01")
    case.assert_equal(&"ROUND_END_RESOLVED", first.get("status", &""), "Unspent prepared card resolves once at round end")
    case.assert_equal(&"PREPARED_FROST_SPELL", first.get("prepared_spell_id", &""), "Round receipt identifies the one resolved prepared spell")
    case.assert_equal(&"", state.pending_prepared_spell_id, "Round end clears the pending prepared spell record")
    var repeated: Dictionary = state.resolve_round_end(&"round-01")
    case.assert_equal(&"ALREADY_RESOLVED", repeated.get("status", &""), "Round end cannot resolve twice")
    case.assert_equal(&"PREPARED_FROST_SPELL", repeated.get("prepared_spell_id", &""), "Repeat receipt preserves the original resolved prepared spell")


func _has_property(value, property_name: StringName) -> bool:
    for property in value.get_property_list():
        if StringName(property.get("name", &"")) == property_name:
            return true
    return false

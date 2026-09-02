@tool
class_name CardRuleset
extends Resource

const REQUIRED_CIRCLE_COUNT := 3
const REQUIRED_ROUND_COUNT := 3
const MANA_DISTRIBUTION_STATUS := &"RULESET_PENDING"
const MATCH_WIN_CONDITION := &"FIRST_TO_2_ROUNDS"
const UNSPENT_PREPARED_SPELL_RULE := &"RESOLVE_ONCE_AT_ROUND_END"
const PLAYER_REMAINING_MANA := &"ROUND_JUDGMENT_INPUT"

@export var max_circle_count := REQUIRED_CIRCLE_COUNT
@export var rounds := REQUIRED_ROUND_COUNT
@export var match_win_condition: StringName = MATCH_WIN_CONDITION
@export var unspent_prepared_spell_rule: StringName = UNSPENT_PREPARED_SPELL_RULE
@export var mana_distribution_status: StringName = MANA_DISTRIBUTION_STATUS
@export var player_remaining_mana: StringName = PLAYER_REMAINING_MANA
@export var unresolved_rules: StringName = &"RULESET_PENDING"


func mana_example() -> Dictionary:
    return {
        "remaining_mana": 20,
        "illustrative_round_split": [7, 7, 6],
        "is_balance_rule": false,
    }


func validate(_runtime_remaining_mana: Variant = null) -> StringName:
    if max_circle_count != REQUIRED_CIRCLE_COUNT:
        return &"CIRCLE_CAP_MISMATCH"
    if rounds != REQUIRED_ROUND_COUNT:
        return &"ROUND_COUNT_MISMATCH"
    if match_win_condition != MATCH_WIN_CONDITION:
        return &"MATCH_WIN_CONDITION_MISMATCH"
    if unspent_prepared_spell_rule != UNSPENT_PREPARED_SPELL_RULE:
        return &"ROUND_END_RULE_MISMATCH"
    if mana_distribution_status != MANA_DISTRIBUTION_STATUS:
        return &"MANA_DISTRIBUTION_STATUS_MISMATCH"
    if player_remaining_mana != PLAYER_REMAINING_MANA:
        return &"PLAYER_REMAINING_MANA_MODE_MISMATCH"
    if unresolved_rules != &"RULESET_PENDING":
        return &"UNRESOLVED_RULES_STATUS_MISMATCH"
    return &"OK"

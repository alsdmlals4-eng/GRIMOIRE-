# Frostbloom Internal Graybox — 03 Investigation 2-of-4 Matrix

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
investigation_nodes: 4
required_unique_nodes: 2
unordered_pairs_audited: 6
```

This matrix verifies that every permitted two-node investigation path can support a coherent W6 attempt without becoming an answer lookup. Equal information value is not required; forward progress plus materially different residual uncertainty is required.

| Pair | Nodes | Useful context | Remaining uncertainty | W6 forward progress | Verdict |
|---|---|---|---|---|---|
| INV_PAIR_01 | IRRIGATION_PRESSURE + ROOT_LAYER | PRESSURE_OSCILLATION; ROOT_MAT_WATERLOGGING | SPIRIT_RESPONSE; OLD_REPAIR_COUPLING | true | PASS |
| INV_PAIR_02 | IRRIGATION_PRESSURE + SPIRIT_TRACE | PRESSURE_OSCILLATION; SPIRIT_STATE_SHOCK | ROOT_CONDITION; OLD_REPAIR_COUPLING | true | PASS |
| INV_PAIR_03 | IRRIGATION_PRESSURE + OLD_REPAIR_RECORD | PRESSURE_OSCILLATION; OLD_REPAIR_COUPLING | ROOT_CONDITION; SPIRIT_RESPONSE | true | PASS |
| INV_PAIR_04 | ROOT_LAYER + SPIRIT_TRACE | ROOT_MAT_WATERLOGGING; SPIRIT_STATE_SHOCK | PRESSURE_SOURCE; OLD_REPAIR_COUPLING | true | PASS |
| INV_PAIR_05 | ROOT_LAYER + OLD_REPAIR_RECORD | ROOT_MAT_WATERLOGGING; OLD_REPAIR_COUPLING | PRESSURE_SOURCE; SPIRIT_RESPONSE | true | PASS |
| INV_PAIR_06 | SPIRIT_TRACE + OLD_REPAIR_RECORD | SPIRIT_STATE_SHOCK; OLD_REPAIR_COUPLING | PRESSURE_SOURCE; ROOT_CONDITION | true | PASS |

## Answer-leak guard

```text
FORBIDDEN: correct_route_id
FORBIDDEN: required_spell
FORBIDDEN: best_intent
FORBIDDEN: mandatory_hidden_third_clue
```

None of the pair fixtures contains those fields. Context tags describe observed conditions only. They do not choose a FIVE_POINT_STAR layout, spell, target, intent, or ending.

## Pair-specific interpretation

- **INV_PAIR_01** strongly frames mechanical pressure + root condition, while spirit behavior and historical coupling remain unknown.
- **INV_PAIR_02** exposes mechanical pressure + spirit shock, while the physical root state and old repair coupling remain unknown.
- **INV_PAIR_03** links pressure with historical repair context, while root condition and spirit response remain uncertain.
- **INV_PAIR_04** exposes living/root condition + spirit shock, while pressure source and repair coupling remain uncertain.
- **INV_PAIR_05** links physical root state + repair history, while pressure source and spirit response remain uncertain.
- **INV_PAIR_06** links spirit shock + repair history, while pressure source and root condition remain uncertain.

## Adversarial rule

A pair is downgraded to `RISK` or `FAIL` if later walkthrough evidence shows any of the following:

1. the omitted clues secretly make W6 completion impossible;
2. another pair gives a direct answer while this pair only gives ambiguity;
3. a hidden third clue is mechanically required despite the 2-of-4 contract;
4. the pair produces fewer than two useful context facts or no meaningful uncertainty;
5. the facilitator/UI must inject a correct spell, circuit, target, or route to rescue progress.

Current internal structural verdict: all six pairs `PASS`. Human comprehension and actual solution quality remain outside this internal-only matrix.

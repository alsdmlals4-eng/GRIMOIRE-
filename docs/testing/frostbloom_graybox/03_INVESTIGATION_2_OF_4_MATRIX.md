# Frostbloom Internal Graybox — 03 Investigation 2-of-4 Matrix

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
active_refinement: GM-FROSTBLOOM-10-23-LENS-INVESTIGATION-01
investigation_nodes: 4
required_unique_nodes: 2
selection_mode: SEQUENTIAL_PICK_2_OF_4
all_nodes_remain_accessible: true
w6_entry_summary: KNOWN_2_UNKNOWN_2
unordered_pairs_audited: 6
```

This matrix verifies that every permitted two-node investigation path can support a coherent W6 attempt without becoming an answer lookup. Equal information value is not required; forward progress plus materially different residual uncertainty is required.

The six unordered pairs remain the structural coverage set, but the player does **not** preselect a pair. All four question categories remain visible, the player selects one node, reads its result, then chooses a second node from the remaining three.

## Question preview layer

| Node | Question shown before selection |
|---|---|
| IRRIGATION_PRESSURE | 흐름은 어디서 어긋나고 있는가? |
| ROOT_LAYER | 무엇이 피해를 받고 있으며 무엇을 지탱하고 있는가? |
| SPIRIT_TRACE | 정령은 무엇에 반응하고 있는가? |
| OLD_REPAIR_RECORD | 과거에는 무엇을 바꿨고 지금도 그 전제가 맞는가? |

Question previews reveal the **kind of uncertainty**, not the answer. They do not preview a route, spell, circuit, target, intent, outcome grade, or hidden required third clue.

## Sequential selection contract

```text
ALL_FOUR_INVESTIGATION_NODES_REMAIN_ACCESSIBLE
→ first node selected by player
→ first result observed
→ W5_FIRST_INVESTIGATION_NONCOMBAT_APPLICATION
→ second node selected by player from remaining three
→ second result observed
→ KNOWN_2_UNKNOWN_2
→ W6
```

The first result may change why the player values the remaining questions, but the system does not auto-recommend or auto-lock the second node.

| Pair | Nodes | Useful context | Remaining uncertainty | W6 forward progress | Verdict |
|---|---|---|---|---|---|
| INV_PAIR_01 | IRRIGATION_PRESSURE + ROOT_LAYER | PRESSURE_OSCILLATION; ROOT_MAT_WATERLOGGING | SPIRIT_RESPONSE; OLD_REPAIR_COUPLING | true | PASS |
| INV_PAIR_02 | IRRIGATION_PRESSURE + SPIRIT_TRACE | PRESSURE_OSCILLATION; SPIRIT_STATE_SHOCK | ROOT_CONDITION; OLD_REPAIR_COUPLING | true | PASS |
| INV_PAIR_03 | IRRIGATION_PRESSURE + OLD_REPAIR_RECORD | PRESSURE_OSCILLATION; OLD_REPAIR_COUPLING | ROOT_CONDITION; SPIRIT_RESPONSE | true | PASS |
| INV_PAIR_04 | ROOT_LAYER + SPIRIT_TRACE | ROOT_MAT_WATERLOGGING; SPIRIT_STATE_SHOCK | PRESSURE_SOURCE; OLD_REPAIR_COUPLING | true | PASS |
| INV_PAIR_05 | ROOT_LAYER + OLD_REPAIR_RECORD | ROOT_MAT_WATERLOGGING; OLD_REPAIR_COUPLING | PRESSURE_SOURCE; SPIRIT_RESPONSE | true | PASS |
| INV_PAIR_06 | SPIRIT_TRACE + OLD_REPAIR_RECORD | SPIRIT_STATE_SHOCK; OLD_REPAIR_COUPLING | PRESSURE_SOURCE; ROOT_CONDITION | true | PASS |

## W6 entry summary

Before W6 the UI may summarize only:

```text
KNOWN: two facts actually observed
UNKNOWN: two unvisited question categories / residual uncertainties
ACTIVE LENS: one free-schedule affordance
```

`UNKNOWN` is not a penalty, failure warning, or answer checklist. It makes the decision boundary legible.

## Answer-leak guard

```text
FORBIDDEN: correct_route_id
FORBIDDEN: required_spell
FORBIDDEN: best_intent
FORBIDDEN: mandatory_hidden_third_clue
FORBIDDEN: second_node_recommendation_as_best_route
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

A pair or sequential flow is downgraded to `RISK` or `FAIL` if later walkthrough evidence shows any of the following:

1. the omitted clues secretly make W6 completion impossible;
2. another pair gives a direct answer while this pair only gives ambiguity;
3. a hidden third clue is mechanically required despite the 2-of-4 contract;
4. the pair produces fewer than two useful context facts or no meaningful uncertainty;
5. the facilitator/UI must inject a correct spell, circuit, target, or route to rescue progress;
6. the first result mechanically forces or recommends one best second node;
7. Known/Unknown is presented as a completion checklist rather than decision uncertainty.

Current internal structural verdict: all six pairs `PASS`, and the sequential selection overlay is `STRUCTURAL_PASS`. Human comprehension and actual solution quality remain outside this internal-only matrix.

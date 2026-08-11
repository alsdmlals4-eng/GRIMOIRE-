# Frostbloom Internal Graybox — 07 Adversarial Walkthrough

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
attack_count: 14
allowed_verdicts: [PASS, RISK, FAIL, NOT_TESTABLE_YET]
internal_rollup: INTERNAL_PACK_PASS
```

| ID | Attack | Expected guard | Internal result | Verdict |
|---|---|---|---|---|
| ADV_01_ONE_NODE_W6 | W6 after one clue | exactly two unique investigation nodes before W6 | no one-node promotion path in walkthrough | PASS |
| ADV_02_PAIR_EQUIVALENCE | pairs collapse to same answer | distinct context + residual uncertainty; no lookup | all six pair profiles differ | PASS |
| ADV_03_FREE_CHOICE_DOMINANCE | one schedule choice owns progress | five anti-dominance guards | no option owns required progress/material/answer | PASS |
| ADV_04_HELPER_ANSWER_LEAK | helper states correct solution | MUST_REMAIN_UNKNOWN | no canonical spell/circuit/target disclosed | PASS |
| ADV_05_W6_INVALIDATED | reveal erases W6 | preserved W6 fact hard invariant | all three cases preserve positive W6 outcome | PASS |
| ADV_06_W7_REPEAT | W7 repeats W6 | changed-judgment field required | three cases change meaningful judgment | PASS |
| ADV_07_WRITING_REDUNDANCY | W1–W7 duplicate roles | distinct judgment audit | all seven internally DISTINCT | PASS |
| ADV_08_RESULT_COLLAPSE | one global success grade | exact five axes; scalar replacement forbidden | mixed RESULT_CASE_A proves independence | PASS |
| ADV_09_GRIMOIRE_UNOBSERVED_CAUSE | explanation invents unseen clue | causal record limited to listed evidence | all result cases trace to observations/reveal/result | PASS |
| ADV_10_EXPOSITION_OVERWEIGHT | school consumes more real time than investigation+redesign | 6m paper allocation vs 18m investigation+redesign | actual elapsed/comprehension requires player evidence | NOT_TESTABLE_YET |
| ADV_11_HISTORICAL_3X3_REAPPEARS | 3×3 returns as current authority | FIVE_POINT_STAR current only | no current 3×3 fixture/use | PASS |
| ADV_12_EXAM_FESTIVAL_SCOPE_CREEP | exam/festival becomes mandatory | exam forbidden; festival PREVIEW_ONLY | BEAT_08 is preview only | PASS |
| ADV_13_MOB_WAVE_REPLACEMENT | wave/HP sponge replaces pressure source | one strong pressure source | BEAT_06 forbids wave/HP-sponge structure | PASS |
| ADV_14_ROUTE_LOOKUP_FIXTURE | fixture maps to correct route/spell | lookup keys forbidden | pair/consequence fixtures omit route/spell answer keys | PASS |

## Stop/rework rules

- `FAIL` on a hard invariant → `BLOCKED`; fix before Task8 handoff.
- Zero FAIL + one or more in-scope design `RISK` → `READY_WITH_RISKS`, with bounded follow-up notes.
- Zero FAIL, with `NOT_TESTABLE_YET` only for human/runtime/device/performance questions → `INTERNAL_PACK_PASS`.
- `NOT_TESTABLE_YET` is not treated as PASS evidence for the external question.

Current internal rollup: **INTERNAL_PACK_PASS**. `ADV_10` intentionally remains `NOT_TESTABLE_YET` for actual elapsed/comprehension; the internal pack only verifies the paper allocation is not structurally inverted.

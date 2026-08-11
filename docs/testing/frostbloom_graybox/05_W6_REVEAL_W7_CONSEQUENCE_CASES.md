# Frostbloom Internal Graybox — 05 W6 → Reveal → W7 Consequence Cases

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
case_count: 3
hard_invariant: FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE
```

These are bounded internal examples, not canonical routes. They prove that the design can preserve a first real improvement while later context changes what the player should care about next.

| Case | W6_OBSERVED_CONTEXT | W6_MEANING_AND_CIRCUIT | W6_TARGET | W6_ACTUAL_IMPROVEMENT | W6_COST_OR_FORGONE_VALUE | OLD_REVISION_NEW_CONTEXT | PRESERVED_W6_FACT | NEW_TENSION | W7_CHANGED_JUDGMENT | W7_ACTUAL_RESULT |
|---|---|---|---|---|---|---|---|---|---|---|
| CASE_W6_A | pressure oscillation + waterlogged root mat | FLOW + FOCUS / FIVE_POINT_STAR | irrigation interface | FACILITY +2, LIFE +1 | spirit uncertainty remains | old repair coupling + spirit state shock | pressure reduction/root stability remain true | restored flow aggravates spirit shock | intent emphasis + contextual use | reduce state shock while preserving repaired flow |
| CASE_W6_B | spirit state shock + pressure oscillation | DISPERSE + FOCUS / FIVE_POINT_STAR | pressure vent field | FACILITY +1, SPIRIT +2 | root saturation uncertain | old repair coupling + waterlogged root mat | spirit shock/pressure reduction remain true | dispersal pushes water toward weak root mat | target + tradeoff | redirect pressure away from roots while keeping spirit stable |
| CASE_W6_C | waterlogged root mat + old repair coupling | PROTECT + FLOW / FIVE_POINT_STAR | root barrier edge | LIFE +2, RELATIONSHIP +1 | pressure source unresolved | pressure oscillation + spirit state shock | protected root zone/evacuation time remain true | barrier concentrates pressure near spirit trace | meaning/circuit + intent emphasis | vent pressure without erasing barrier; lower spirit pressure |

## Preservation test

For every case:

1. W6 improves at least one real result dimension.
2. Reveal adds facts the player did not previously have.
3. `PRESERVED_W6_FACT` must still be asserted after Reveal and after W7.
4. W7 changes a meaningful judgment field, not merely numerical magnitude.
5. A cost or forgone value remains legible; redesign does not retroactively make W6 fake.

Automatic `FAIL`: any mechanical equivalent of **“the first solution was meaningless/wrong and is erased.”**

## Route-button guard

`FACILITY_REPAIR`, `LIFE_RESCUE`, `SPIRIT_STABILIZATION`, `CONTAIN_AND_EVACUATE`, `SUPPRESS_AND_BUY_TIME`, and `UNREGISTERED_COHERENT` may be derived interpretations after consequences. They are never input `route_id` values, required-spell tables, or ending buttons.

Current internal verdict: all three cases `PASS` the preservation/distinctness contract. Actual player strategy quality remains a later runtime/human question.

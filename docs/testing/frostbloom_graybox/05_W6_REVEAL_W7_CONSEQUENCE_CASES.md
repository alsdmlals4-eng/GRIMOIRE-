# Frostbloom Internal Graybox — 05 W6 → Reveal → W7 Consequence Cases

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
w6_forecast_decision_id: GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01
case_count: 3
forecast_contract: BOUNDED_CONSEQUENCE_FORECAST
hard_invariant: FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE
human_validation: NOT_RUN
```

These are bounded internal examples, not canonical routes. They prove two things together:

1. the W6 Preview can expose what the player is justified in expecting **without inventing unobserved facts**;
2. the first accepted W6 result can remain a real improvement while later context changes what the player should care about next.

## W6 bounded forecast cases

| Case | Observed Evidence | Circuit + Target | KNOWN_IMPROVEMENT shown before Commit | UNCERTAIN_CONSEQUENCE shown before Commit | Hidden fact forbidden before Commit |
|---|---|---|---|---|---|
| CASE_W6_A | pressure oscillation + waterlogged root mat | FLOW + FOCUS / FIVE_POINT_STAR → irrigation interface | pressure reduction / root stability direction | spirit response and old-repair coupling remain unverified | exact spirit shock / old-repair coupling |
| CASE_W6_B | spirit state shock + pressure oscillation | DISPERSE + FOCUS / FIVE_POINT_STAR → pressure vent field | spirit shock / pressure reduction direction | root saturation and old-repair coupling remain unverified | exact weak-root interaction / old-repair coupling |
| CASE_W6_C | waterlogged root mat + old repair coupling | PROTECT + FLOW / FIVE_POINT_STAR → root barrier edge | root protection / evacuation-time direction | pressure source and spirit response remain unverified | exact pressure oscillation / spirit shock |

Every case also shows `FINAL_TARGET_SUCCESS_BREAKDOWN` and `MANA_COST` using only currently available Stage 3 inputs. The matrix does not pin final balance numbers. An unvisited-node fact cannot be smuggled into a displayed modifier as if the player had observed it.

## Actual consequence / Reveal / W7 cases

| Case | W6_OBSERVED_CONTEXT | W6_MEANING_AND_CIRCUIT | W6_TARGET | W6_ACTUAL_IMPROVEMENT | W6_COST_OR_FORGONE_VALUE | OLD_REVISION_NEW_CONTEXT | PRESERVED_W6_FACT | NEW_TENSION | W7_CHANGED_JUDGMENT | W7_ACTUAL_RESULT |
|---|---|---|---|---|---|---|---|---|---|---|
| CASE_W6_A | pressure oscillation + waterlogged root mat | FLOW + FOCUS / FIVE_POINT_STAR | irrigation interface | FACILITY +2, LIFE +1 | spirit uncertainty remains | old repair coupling + spirit state shock | pressure reduction/root stability remain true | restored flow aggravates spirit shock | intent emphasis + contextual use | reduce state shock while preserving repaired flow |
| CASE_W6_B | spirit state shock + pressure oscillation | DISPERSE + FOCUS / FIVE_POINT_STAR | pressure vent field | FACILITY +1, SPIRIT +2 | root saturation uncertain | old repair coupling + waterlogged root mat | spirit shock/pressure reduction remain true | dispersal pushes water toward weak root mat | target + tradeoff | redirect pressure away from roots while keeping spirit stable |
| CASE_W6_C | waterlogged root mat + old repair coupling | PROTECT + FLOW / FIVE_POINT_STAR | root barrier edge | LIFE +2, RELATIONSHIP +1 | pressure source unresolved | pressure oscillation + spirit state shock | protected root zone/evacuation time remain true | barrier concentrates pressure near spirit trace | meaning/circuit + intent emphasis | vent pressure without erasing barrier; lower spirit pressure |

## Forecast truth-boundary test

For every case before Commit:

1. `KNOWN_IMPROVEMENT` is traceable to observed evidence + chosen circuit + selected Target.
2. `UNCERTAIN_CONSEQUENCE` names only the category of uncertainty, not the hidden answer.
3. `FINAL_TARGET_SUCCESS_BREAKDOWN` may use observed target difficulty/current state/resistance but not an unobserved fact disguised as known input.
4. `MANA_COST` is the exact expected Stage 3 cost; there is no hidden post-use surcharge.
5. UI exposes no `best_target`, `best_circuit`, `best_intent`, `route_id`, or named solution button.

Automatic `FAIL` examples:

```text
"정령 반응은 안전합니다" while SPIRIT_TRACE was not observed
"성공률 -20%: old repair coupling" while OLD_REPAIR_RECORD was not observed
"추천: 시설복구" as an input route button
```

## Preservation test

For every accepted W6 case:

1. W6 improves at least one real result dimension.
2. Reveal adds facts the player did not previously have.
3. `PRESERVED_W6_FACT` must still be asserted after Reveal and after W7.
4. W7 changes a meaningful judgment field, not merely numerical magnitude.
5. A cost or forgone value remains legible; redesign does not retroactively make W6 fake.

Automatic `FAIL`: any mechanical equivalent of **“the first solution was meaningless/wrong and is erased.”**

## Route-button guard

`FACILITY_REPAIR`, `LIFE_RESCUE`, `SPIRIT_STABILIZATION`, `CONTAIN_AND_EVACUATE`, `SUPPRESS_AND_BUY_TIME`, and `UNREGISTERED_COHERENT` may be derived interpretations after consequences. They are never input `route_id` values, required-spell tables, intent selectors, or ending buttons.

Current internal verdict: all three cases structurally satisfy bounded-forecast + preservation/distinctness contracts. Actual player strategy quality, perceived fairness, forecast comprehension, and mobile readability remain later Human/Device questions.

# Frostbloom Internal Graybox — 05 W6 → Reveal → W7 Consequence Cases

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
w6_forecast_decision_id: GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01
w7_context_delta_decision_id: GM-FROSTBLOOM-W7-PRESERVED-FACT-CONTEXT-DELTA-01
case_count: 3
forecast_contract: BOUNDED_CONSEQUENCE_FORECAST
w7_contract: PRESERVED_FACT_CONTEXT_DELTA
hard_invariant: FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE
human_validation: NOT_RUN
```

These are bounded internal examples, not canonical routes. They prove three things together:

1. the W6 Preview can expose what the player is justified in expecting **without inventing unobserved facts**;
2. the first accepted W6 result remains a real improvement;
3. W7 can respond to one newly revealed post-W6 coupling by changing a meaningful judgment dimension rather than only increasing output.

## W6 bounded forecast cases

| Case | Observed Evidence | Circuit + Target | KNOWN_IMPROVEMENT shown before Commit | UNCERTAIN_CONSEQUENCE shown before Commit | Hidden fact forbidden before Commit |
|---|---|---|---|---|---|
| CASE_W6_A | pressure oscillation + waterlogged root mat | FLOW + FOCUS / FIVE_POINT_STAR → irrigation interface | pressure reduction / root stability direction | spirit response and old-repair coupling remain unverified | exact spirit shock / deeper repair coupling |
| CASE_W6_B | spirit state shock + pressure oscillation | DISPERSE + FOCUS / FIVE_POINT_STAR → pressure vent field | spirit shock / pressure reduction direction | root saturation and repair coupling remain unverified | exact weak-root interaction / deeper repair coupling |
| CASE_W6_C | waterlogged root mat + old repair coupling | PROTECT + FLOW / FIVE_POINT_STAR → root barrier edge | root protection / evacuation-time direction | pressure source and spirit response remain unverified | exact pressure oscillation / spirit shock coupling |

Every case also shows `FINAL_TARGET_SUCCESS_BREAKDOWN` and `MANA_COST` using only currently available Stage 3 inputs. The matrix does not pin final balance numbers. An unvisited-node fact cannot be smuggled into a displayed modifier as if the player had observed it.

## W6 Result Anchor → Context Delta → W7 cases

| Case | STILL_TRUE · W6_RESULT_ANCHOR | NEWLY_LEARNED · POST_W6_DEEPER_REVISION_COUPLING | NEW_TENSION | Required W7 judgment change | Example W7 result |
|---|---|---|---|---|---|
| CASE_W6_A | pressure reduction/root stability remain true | restored flow now makes a deeper spirit-shock coupling observable | continuing the same flow behavior aggravates spirit state | `contextual_use` plus derived intent emphasis | reduce state shock while preserving repaired flow |
| CASE_W6_B | spirit shock/pressure reduction remain true | post-W6 dispersal reveals coupling to a weak root layer | unchanged dispersal pushes water toward vulnerable roots | `target` + `tradeoff` | redirect pressure away from roots while keeping spirit stable |
| CASE_W6_C | protected root zone/evacuation time remain true | post-W6 barrier state reveals pressure concentration near spirit trace | unchanged barrier use concentrates spirit pressure | `meaning_and_circuit` or `contextual_use` | vent pressure without erasing barrier; lower spirit pressure |

The `NEWLY_LEARNED` field is **not** a replay of the optional `OLD_REPAIR_RECORD` investigation node. It is a deeper coupling that becomes observable only after W6 changes the live state. Therefore it remains new whether the earlier node was visited or omitted.

## W7 context-delta truth boundary

For every accepted case:

1. `STILL_TRUE` must come from the actual W6 consequence receipt.
2. `NEWLY_LEARNED` must be a post-W6 deeper coupling, not a hidden earlier clue retroactively required for success.
3. `NEW_TENSION` describes the changed condition but does not name a correct circuit, Target, route, or priority.
4. the reveal may change what should be considered next but cannot change the accepted W6 success verdict or erase the actual W6 improvement.
5. W7 must change at least one of `meaning_and_circuit / target / tradeoff / contextual_use`.
6. `intent_emphasis` may be derived from the redesign/result but is not a named input selector.
7. same design + same Target + same tradeoff + larger number only is `FAIL`.

## OLD_REPAIR_RECORD independence test

Both paths must remain valid:

```text
OLD_REPAIR_RECORD visited in 2-of-4
→ player knows the bounded historical record
→ W6 changes live state
→ deeper post-W6 coupling becomes newly observable

OLD_REPAIR_RECORD omitted in 2-of-4
→ history remains part of uncertainty
→ W6 still resolves according to observed evidence
→ same deeper post-W6 coupling becomes newly observable
```

Neither path receives a hidden success bonus/penalty or different W7 access.

## Escalation limit

```text
new coupling: 1
strong pressure source: 1
new mandatory clue chain: 0
mob wave: 0
HP sponge: 0
```

The W7 tension must come from one strong changed relationship, not content-volume escalation.

## Route-button guard

`FACILITY_REPAIR`, `LIFE_RESCUE`, `SPIRIT_STABILIZATION`, `CONTAIN_AND_EVACUATE`, `SUPPRESS_AND_BUY_TIME`, and `UNREGISTERED_COHERENT` may be derived interpretations after consequences. They are never input `route_id` values, required-spell tables, intent selectors, priority selectors, or ending buttons.

## Preservation test

For every case:

1. W6 improves at least one real result dimension.
2. W7 reveal begins by asserting the preserved W6 fact.
3. new context changes a meaningful judgment field, not merely numerical magnitude.
4. W7 addresses the new tension without needing to erase every tradeoff.
5. the W6 preserved fact remains asserted after W7.

Automatic `FAIL` examples:

```text
"W6 was actually wrong" after a previously accepted real improvement
replaying OLD_REPAIR_RECORD as the mandatory W7 reveal
same W6 circuit + same Target + same tradeoff, only +30% stronger
"recommended route: spirit stabilization"
adding waves/HP as the primary escalation
```

Current internal verdict: all three cases structurally satisfy bounded W6 forecast + preserved-fact/context-delta W7 redesign. Actual player strategy quality, perceived fairness, comprehension, emotional acceptance, nine-minute pacing, and mobile readability remain later Human/Device questions.

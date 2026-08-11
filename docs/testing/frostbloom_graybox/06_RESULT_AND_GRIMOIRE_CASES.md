# Frostbloom Internal Graybox — 06 Five-Axis Result and Grimoire Cases

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
result_dimensions: [FACILITY, LIFE, SPIRIT, RELATIONSHIP, DISCOVERY]
case_count: 3
```

The result layer preserves independent consequences. It does not replace them with a global success grade.

| Case | FACILITY | LIFE | SPIRIT | RELATIONSHIP | DISCOVERY | Mixed? |
|---|---:|---:|---:|---:|---:|---|
| RESULT_CASE_A | +2 | +1 | -1 | 0 | +2 | yes |
| RESULT_CASE_B | +2 | +1 | +2 | 0 | +1 | yes, relationship neutral |
| RESULT_CASE_C | +1 | +2 | +1 | +1 | +2 | all positive but not collapsed |

`RESULT_CASE_A` is the required explicit mixed-outcome proof: facility/life/discovery improve while spirit remains worse than baseline. The pack therefore cannot represent the incident as one scalar `SUCCESS_GRADE`.

## Grimoire causal record contract

Every case contains exactly these fields:

```text
observations
meaning_and_circuit
selected_target
intent_tags
actual_result
side_effects_and_forgone_values
discoveries
player_naming
```

### RESULT_CASE_A

- **observations:** pressure oscillation; waterlogged root mat; old repair coupling; spirit state shock.
- **meaning_and_circuit:** FLOW + FOCUS using FIVE_POINT_STAR, then redesign emphasis to reduce state shock.
- **selected_target:** irrigation interface.
- **intent_tags:** restore flow; limit state shock.
- **actual_result:** W6 pressure/root improvement remains true; spirit stress is reduced later but not erased from the consequence record.
- **side_effects_and_forgone_values:** conservative flow rate remains.
- **discoveries:** old repair coupling changes spirit response.
- **player_naming:** “Stable flow needs spirit margin.”

### RESULT_CASE_B

- **observations:** pressure oscillation; spirit state shock; old repair coupling; waterlogged root mat.
- **meaning_and_circuit:** DISPERSE + FOCUS using FIVE_POINT_STAR, then redesign target away from weak roots.
- **selected_target:** pressure vent field.
- **intent_tags:** lower pressure; keep spirit stable; protect root mat.
- **actual_result:** W6 pressure/spirit improvement remains true; pressure is redirected away from weak root material.
- **side_effects_and_forgone_values:** slower facility recovery.
- **discoveries:** dispersal direction matters around the old repair coupling.
- **player_naming:** “Disperse with a safe destination.”

### RESULT_CASE_C

- **observations:** waterlogged root mat; old repair coupling; pressure oscillation; spirit state shock.
- **meaning_and_circuit:** PROTECT + FLOW using FIVE_POINT_STAR, then vent without erasing the barrier.
- **selected_target:** root barrier edge.
- **intent_tags:** protect root zone; buy evacuation time; vent pressure.
- **actual_result:** W6 root protection/evacuation time remains true; later pressure venting preserves the local barrier.
- **side_effects_and_forgone_values:** barrier coverage stays local.
- **discoveries:** barrier position can concentrate spirit pressure.
- **player_naming:** “Protection needs an exit path.”

## Causality guard

A Grimoire statement may use only evidence listed in that case’s observations/reveal/result chain. An omitted clue may appear only as uncertainty, never as a factual explanation. If the record needs a fact the player never observed, the case is `FAIL` for causal traceability.

Current internal structural verdict: `PASS`. Prose quality, emotional resonance, and player comprehension remain `NOT_TESTABLE_YET`.

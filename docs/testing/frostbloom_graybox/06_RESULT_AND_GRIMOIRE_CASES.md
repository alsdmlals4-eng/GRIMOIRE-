# Frostbloom Internal Graybox — 06 Five-Axis Result and Grimoire Cases

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
result_debrief_decision_id: GM-FROSTBLOOM-RESULT-GRIMOIRE-CAUSAL-DEBRIEF-01
result_dimensions: [FACILITY, LIFE, SPIRIT, RELATIONSHIP, DISCOVERY]
result_contract: FIVE_AXIS_RESULT_SNAPSHOT
causal_thread_contract: CAUSAL_THREAD_ACTUAL_RECEIPTS_ONLY
player_principle_contract: SHORT_PLAYER_PRINCIPLE_NAMING
case_count: 3
human_validation: NOT_RUN
```

The result layer preserves independent consequences. It does not replace them with a global success grade, total score, star rating, or hidden moral grade.

## 39–44 minute layered debrief

```text
39–40  FIVE_AXIS_RESULT_SNAPSHOT
40–42  CAUSAL_THREAD_ACTUAL_RECEIPTS_ONLY
42–43  COST / FORGONE VALUE / DISCOVERY
43–44  SHORT_PLAYER_PRINCIPLE_NAMING
```

The system may organize recorded facts. It may not invent an explanation, write a correct-principle answer, or grade the player's principle wording.

## Five-axis result cases

| Case | FACILITY | LIFE | SPIRIT | RELATIONSHIP | DISCOVERY | Mixed? |
|---|---:|---:|---:|---:|---:|---|
| RESULT_CASE_A | +2 | +1 | -1 | 0 | +2 | yes |
| RESULT_CASE_B | +2 | +1 | +2 | 0 | +1 | yes, relationship neutral |
| RESULT_CASE_C | +1 | +2 | +1 | +1 | +2 | all positive but not collapsed |

`RESULT_CASE_A` is the required explicit mixed-outcome proof: facility/life/discovery improve while spirit remains worse than baseline. The pack therefore cannot represent the incident as one scalar `SUCCESS_GRADE`.

`RESULT_CASE_C` proves the inverse guard: even when every axis is positive, the result still remains five independent dimensions instead of becoming a total score or perfect grade.

## Existing Grimoire record fields

Every case preserves these existing fields:

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

The 39–44 refinement changes **presentation order**, not the underlying record authority.

## Layered causal-thread projection

For the first-session debrief, existing fields are shown through the following ordered causal thread:

```text
observations
→ W6 meaning_and_circuit
→ W6 selected_target
→ W6 actual_result
→ post-W6 context delta
→ W7 changed judgment
→ W7 actual_result
```

Hard guard: `UNOBSERVED_CAUSE_FORBIDDEN`.

Only actual investigation observations, W6 receipts, post-W6 context-delta receipts, W7 redesign receipts, and actual results may appear as factual causes. An omitted clue may appear only as uncertainty, never as a factual explanation.

## RESULT_CASE_A

### Five-axis snapshot

- FACILITY +2
- LIFE +1
- SPIRIT -1
- RELATIONSHIP 0
- DISCOVERY +2

### Causal thread

- **observations:** pressure oscillation; waterlogged root mat.
- **W6 meaning/circuit:** FLOW + FOCUS using FIVE_POINT_STAR.
- **W6 target:** irrigation interface.
- **W6 actual result:** pressure reduction/root stability improve and remain true.
- **post-W6 context delta:** deeper repair coupling exposes spirit-state interaction.
- **W7 changed judgment:** contextual use changes to reduce state shock while preserving repaired flow.
- **W7 actual result:** spirit stress is reduced later but not erased from the consequence record.

### Cost / forgone / discovery

- **side_effects_and_forgone_values:** conservative flow rate remains.
- **discoveries:** restored flow needs margin for spirit response around the deeper coupling.
- **remaining uncertainty:** any never-observed optional node remains omitted rather than invented.

### Player principle sample

`player_naming`: “Stable flow needs spirit margin.”

This sentence is an **internal simulated player-authored sample**, never a prewritten UI answer card.

## RESULT_CASE_B

### Five-axis snapshot

- FACILITY +2
- LIFE +1
- SPIRIT +2
- RELATIONSHIP 0
- DISCOVERY +1

### Causal thread

- **observations:** spirit state shock; pressure oscillation.
- **W6 meaning/circuit:** DISPERSE + FOCUS using FIVE_POINT_STAR.
- **W6 target:** pressure vent field.
- **W6 actual result:** spirit shock and pressure improve and remain true.
- **post-W6 context delta:** deeper coupling exposes a weak-root interaction under redirected flow.
- **W7 changed judgment:** target/tradeoff changes to redirect pressure away from weak roots.
- **W7 actual result:** pressure moves away from the weak root material while spirit stability remains preserved.

### Cost / forgone / discovery

- **side_effects_and_forgone_values:** slower facility recovery.
- **discoveries:** dispersal direction needs a safe destination when the deeper coupling changes the flow path.
- **remaining uncertainty:** optional unobserved facts are not added to the cause chain.

### Player principle sample

`player_naming`: “Disperse with a safe destination.”

This is an internal simulated player-authored sample, not a correctness target.

## RESULT_CASE_C

### Five-axis snapshot

- FACILITY +1
- LIFE +2
- SPIRIT +1
- RELATIONSHIP +1
- DISCOVERY +2

### Causal thread

- **observations:** waterlogged root mat; old repair coupling.
- **W6 meaning/circuit:** PROTECT + FLOW using FIVE_POINT_STAR.
- **W6 target:** root barrier edge.
- **W6 actual result:** root protection/evacuation time improve and remain true.
- **post-W6 context delta:** post-W6 pressure/spirit interaction becomes observable around the active barrier.
- **W7 changed judgment:** meaning/circuit/contextual use changes to add a pressure exit without erasing the barrier.
- **W7 actual result:** local barrier remains while pressure is vented and spirit pressure is reduced.

### Cost / forgone / discovery

- **side_effects_and_forgone_values:** barrier coverage stays local.
- **discoveries:** protection needs a controlled exit path under the revealed coupling.
- **remaining uncertainty:** no unobserved clue is promoted to a factual cause.

### Player principle sample

`player_naming`: “Protection needs an exit path.”

This is an internal simulated player-authored sample, not a prewritten solution.

## Intent-tag guard

`intent_tags` are `INTENT_TAGS_DERIVED_NEUTRAL`.

They may summarize what the actual circuit/Target/result did, but they are never:

```text
route_id
input priority selector
moral score
correctness grade
ending button
```

## Player-principle guard

```text
SHORT_PLAYER_PRINCIPLE_NAMING
SYSTEM_DOES_NOT_AUTHOR_PRINCIPLE
PRINCIPLE_NOT_GRADED
NO_IMMEDIATE_STAT_BONUS_FROM_PRINCIPLE
NO_HIDDEN_MORAL_SCORE
NO_CORRECT_WORDING_REWARD
```

The system organizes facts and receipts. The player authors the short principle wording. The wording is saved as the player's current reflection, not certified as objective truth.

## Causality guard

A Grimoire statement may use only evidence listed in that case's actual observations/reveal/result chain. An omitted clue may appear only as uncertainty, never as a factual explanation. If the record needs a fact the player never observed, the case is `FAIL` for causal traceability.

## Progressive-disclosure guard

Do not display all five axes plus all eight Grimoire fields as one first-session information wall.

```text
RESULT
→ WHY
→ COST / FORGONE / DISCOVERY
→ PRINCIPLE
```

This ordering hides no data. It changes only when each question is foregrounded.

Current internal structural verdict: `PASS`. Five-minute completion, prose quality, emotional resonance, principle-entry burden, causal comprehension, and mobile readability remain `NOT_TESTABLE_YET` / `NOT_RUN`.

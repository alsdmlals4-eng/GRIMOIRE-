# Frostbloom Internal Graybox — 04 Free-Schedule Four-Choice Audit

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
active_refinement: GM-FROSTBLOOM-10-23-LENS-INVESTIGATION-01
actual_free_schedule_windows: 1
contract: FREE_SCHEDULE_LENS_ONLY
choices: [REST, PREPARE, SOCIAL, PRACTICUM]
```

The single free-schedule choice changes **how the player reads or handles the incident**, not which investigation facts they are allowed to obtain. All four investigation nodes remain accessible after every choice.

| Choice | Lens / affordance | Clue unlock | Blocks main progress | Required resource | Required answer | Permanent dominant reward | Verdict |
|---|---|---:|---:|---:|---:|---:|---|
| REST | SPIRIT_STATE_READING_LENS | false | false | false | false | false | PASS |
| PREPARE | TOOL_HANDLING_LENS | false | false | false | false | false | PASS |
| SOCIAL | PEOPLE_FACILITY_VALUE_LENS | false | false | false | false | false | PASS |
| PRACTICUM | FIELD_HANDLING_COMPARISON_LENS | false | false | false | false | false | PASS |

## Interpretation

- `REST` makes spirit discomfort/calm signals easier to notice or discuss; it does not create a new spirit fact.
- `PREPARE` changes how an already-owned bounded tool can be handled or interpreted; it does not grant a mandatory material or hidden clue.
- `SOCIAL` changes which people/facility protection values are foregrounded in dialogue; it does not own mechanical truth.
- `PRACTICUM` adds a field-handling comparison lens; it does **not** grant a frost/pressure clue. The mandatory 05–10 guided practicum is already complete, so this optional choice must not become the obvious superior information route.

## Required invariant

```text
FREE_SCHEDULE_LENS_ONLY
NO_CLUE_UNLOCK_OWNERSHIP
NO_REQUIRED_RESOURCE_OWNERSHIP
ALL_FOUR_INVESTIGATION_NODES_REMAIN_ACCESSIBLE
```

Every choice must produce at least one observable presentation/interaction difference during the incident, otherwise it becomes cosmetic. But that difference cannot contain a fact that another free-schedule choice is permanently unable to access through the normal 2-of-4 investigation.

## Dominance attack

Compare each choice on five questions:

1. **uncertainty_removed** — does it remove so much uncertainty that it effectively solves W6?
2. **clue_unlock_owned** — does it unlock a fact unavailable to peers?
3. **required_resource_owned** — does it own any item/resource without which W6 cannot proceed?
4. **route_bias** — does its naming/presentation imply this is the intended Frostbloom route?
5. **tradeoff_cost** — does it provide broad benefit with no meaningful opportunity cost while peers are narrower?

Hard rule: if one option owns required progress, clue access, or predictably dominates peers without a tradeoff, mark that option/pack `RISK` or `FAIL`; do not buff the other choices merely to hide the imbalance.

## 5-loop adversarial result

1. **Cosmetic-choice attack:** require one observable Lens/affordance difference during the incident.
2. **PRACTICUM dominance attack:** remove direct frost/pressure clue ownership; keep only handling comparison.
3. **PREPARE inventory attack:** no mandatory material, no exclusive tool truth.
4. **SOCIAL truth attack:** perspective/value framing cannot become privileged mechanical evidence.
5. **REST hidden-clue attack:** spirit-state presentation can change salience, not create facts.

Current internal structural verdict: all four remain `PASS` under the Lens-only refinement. Player-perceived desirability is `NOT_TESTABLE_YET` without human evidence.

# Frostbloom Internal Graybox — 04 Free-Schedule Four-Choice Audit

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
actual_free_schedule_windows: 1
choices: [REST, PREPARE, SOCIAL, PRACTICUM]
```

The single free-schedule choice changes context, not permission to finish the incident. No option owns required progress, a required material, or the required answer.

| Choice | Distinct affordance | Blocks main progress | Required material | Required answer | Permanent dominant reward | Invalidates later choice | Verdict |
|---|---|---:|---:|---:|---:|---:|---|
| REST | SPIRIT_DISCOMFORT_CONTEXT | false | false | false | false | false | PASS |
| PREPARE | TOOL_CONTEXT_CONDITION | false | false | false | false | false | PASS |
| SOCIAL | PEOPLE_FACILITY_PERSPECTIVE | false | false | false | false | false | PASS |
| PRACTICUM | FROST_PRESSURE_BEHAVIOR_CLUE | false | false | false | false | false | PASS |

## Interpretation

- `REST` gives a subtle spirit-discomfort/calm-interaction signal; it does not reveal a required spell.
- `PREPARE` adds one bounded contextual condition to a tool; it does not grant a mandatory material.
- `SOCIAL` gives a people/facility perspective; it does not grant privileged mechanical truth.
- `PRACTICUM` gives one frost/pressure behavior clue; it does not make the other choices traps.

## Dominance attack

Compare each choice on three questions:

1. **uncertainty_removed** — does it remove so much uncertainty that it effectively solves W6?
2. **required_resource_owned** — does it own any item/resource without which W6 cannot proceed?
3. **tradeoff_cost** — does it provide broad benefit with no meaningful opportunity cost while peers are narrower?

Hard rule: if one option owns required progress or predictably dominates all three peers without a tradeoff, mark that option/pack `RISK` or `FAIL`; do not buff the other choices merely to hide the imbalance.

Current internal structural verdict: all four `PASS`. Player-perceived desirability is `NOT_TESTABLE_YET` without human evidence.

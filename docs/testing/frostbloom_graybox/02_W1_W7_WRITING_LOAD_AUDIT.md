# Frostbloom Internal Graybox — 02 W1–W7 Writing Load Audit

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
successful_direct_writing_events: 7
RECOVERY_INCLUSIVE_CAP: 10
human_fatigue_validation: NOT_TESTABLE_YET
```

Audit question for every event:

> Does this writing event require a decision that the immediately previous writing event did not require?

Allowed audit values: `DISTINCT / PARTIALLY_DUPLICATE / DUPLICATE / NOT_TESTABLE_YET`.

| Event | Required new judgment | Difference from previous event | Main design risk | Internal verdict |
|---|---|---|---|---|
| W1 | Interpret FLOW in a safe precedent | Baseline meaning/application decision | becomes pure tracing tutorial | DISTINCT |
| W2 | Interpret FOCUS under a different controlled need | requires selecting what should be concentrated, unlike W1 flow direction | repeats W1 with a renamed glyph | DISTINCT |
| W3 | Interpret DISPERSE and accept a different consequence shape | changes desired distribution rather than concentration | tutorial repetition without changed consequence | DISTINCT |
| W4 | Bind one glyph meaning to a contextual craft/tool purpose | moves from precedent response to tool-context marking | removable with no effect on later understanding | DISTINCT |
| W5 | Apply a meaning noncombat in live field observation | uses observed Frostbloom condition rather than a prepared craft context | duplicates W4 or leaks W6 answer | DISTINCT |
| W6 | Build the first major contextual solution with FIVE_POINT_STAR + explicit target/use | integrates clues, circuit, target, cost and intent into an irreversible first solution | preselected route or no real dimension improvement | DISTINCT |
| W7 | Redesign after old-revision context while preserving W6 | must change at least one meaningful judgment dimension because new context exists | repeats W6 for bigger number only | DISTINCT |

## Recovery accounting

- Successful direct events are exactly W1–W7.
- Recognition/input retries are recovery attempts, not new design events.
- Recovery attempts may not push the total above `RECOVERY_INCLUSIVE_CAP: 10`.
- Internal paper review can verify count and role separation only.
- Actual player fatigue, motor burden, handwriting frustration, and pacing impact remain `NOT_TESTABLE_YET` until human/device evidence exists.

## Adversarial distinctness checks

1. Remove W4. If later understanding is unchanged, W4 becomes `PARTIALLY_DUPLICATE` or `DUPLICATE`.
2. Replace W5 with a second craft mark. If field reasoning is unchanged, W5 fails.
3. Compare W6 and W7 judgment fields. If only numerical magnitude changes, W7 is `DUPLICATE` and the pack hard invariant fails.
4. Compare W1/W2/W3 prompts. If the player could answer all three by tracing without a meaning choice, at least two are duplicate.

Current internal design verdict: all seven are `DISTINCT`; human fatigue remains `NOT_TESTABLE_YET`.

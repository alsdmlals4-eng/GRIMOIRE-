# Frostbloom Internal Graybox — 08 First-Session Handoff Buffer Overlay

```yaml
decision_id: GM-FROSTBLOOM-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER-01
contract: PERSISTENT_HANDOFF_ELASTIC_BUFFER
status: CURRENT_CHILD_OVERLAY
human_validation: NOT_RUN
device_validation: NOT_RUN
```

This overlay supersedes only the duplicated transition presentation in the base 46-minute walkthrough. It does not replace W6/W7 causal or gameplay authority.

## Investigation → W6

```text
22~23 Known 2 / Unknown 2 / Lens 1
→ persist the same summary into W6
→ optional 0~60s ELASTIC_HANDOFF_WINDOW
→ W6 Stage 2
```

Hard guards:

```text
INVESTIGATION_SUMMARY_PERSISTS_INTO_W6
NO_DUPLICATE_W6_DECISION_BRIEF
ELASTIC_BUFFER_NOT_CONTENT
```

The summary remains visible/available as the entry state. No second recap modal/page/mentor explanation is required.

## W6 → W7

```text
29~30 W6 Actual Consequence Receipt
→ pin the same receipt as W6_RESULT_ANCHOR
→ optional 0~60s ELASTIC_W6_TO_W7_HANDOFF
→ post-W6 deeper revision coupling
```

Hard guards:

```text
W6_RECEIPT_PINS_AS_W7_ANCHOR
NO_DUPLICATE_W7_RESULT_ANCHOR_SCREEN
FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE
```

The anchor semantic remains mandatory. Only the duplicated re-reading screen is removed.

## Buffer behavior

```text
ELASTIC_BUFFER_NOT_CONTENT
NO_NEW_CONTENT_FROM_RECOVERED_TIME
TARGET_46_UNCHANGED
```

Unused buffer may collapse to zero. It can absorb transition/input/reading/accessibility variance, but cannot become new tutorial, lore, reward, gameplay choice, second incident, or mandatory dialogue.

## Adversarial result

1. Information deletion — PASS; summary persists.
2. W6 rollback — PASS; actual receipt remains anchor.
3. Content creep — PASS; buffer is not fill space.
4. Forced waiting — PASS; buffer may collapse to zero.
5. Target drift — PASS; 46-minute target remains a Human-test hypothesis.

Actual pacing and device readability remain NOT_RUN.

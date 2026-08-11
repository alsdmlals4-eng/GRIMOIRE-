# Frostbloom Internal Graybox Test Pack

```text
PACK_ID: FROSTBLOOM_INTERNAL_GRAYBOX_PACK_V1
DECISION_ID: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
SCOPE: INTERNAL_DESIGN_VALIDATION_ONLY
EXECUTION_ORDER: 01 -> 02 -> 03 -> 04 -> 05 -> 06 -> 07
HUMAN_VALIDATION: NOT_RUN
DEVICE_VALIDATION: NOT_RUN
PERFORMANCE_VALIDATION: NOT_RUN
FULL_SLICE_VALIDATION: NOT_RUN
46_MINUTE_TARGET_NOT_VALIDATED_BY_INTERNAL_WALKTHROUGH
PERSISTENT_GODOT_SOURCE_MUTATION: NONE
TASK8: NEXT_NEW_WORK_UNIT_AFTER_PACK_COMPLETE
```

## Purpose

This pack attacks the approved Frostbloom Single-Incident Spiral before runtime implementation resumes. It checks chronology, information leakage, writing-event distinctness, all six 2-of-4 investigation pairs, four free-schedule choices, W6 consequence preservation, W7 redesign distinctness, five-axis results, Grimoire causality, and fourteen adversarial regressions.

It does **not** prove fun, human comprehension, real 46-minute completion, accessibility, device behavior, performance, export quality, or Task8 runtime behavior.

## Pack surfaces

1. `01_46_MINUTE_WALKTHROUGH.md`
2. `02_W1_W7_WRITING_LOAD_AUDIT.md`
3. `03_INVESTIGATION_2_OF_4_MATRIX.md`
4. `04_FREE_SCHEDULE_4_CHOICE_AUDIT.md`
5. `05_W6_REVEAL_W7_CONSEQUENCE_CASES.md`
6. `06_RESULT_AND_GRIMOIRE_CASES.md`
7. `07_ADVERSARIAL_WALKTHROUGH.md`

Machine-readable authority: `data/testing/frostbloom_internal_graybox_pack_v1.json`.
Automated structure contract: `tests/test_frostbloom_internal_graybox_pack_contract.py`.

## Rollup

```text
BLOCKED = any hard-invariant FAIL
READY_WITH_RISKS = zero FAIL and one-or-more in-scope design RISK
INTERNAL_PACK_PASS = zero FAIL; NOT_TESTABLE_YET may remain only on out-of-scope human/runtime/device/performance questions
```

Current internal rollup is `INTERNAL_PACK_PASS`: all design-structural hard invariants pass; actual elapsed time/comprehension remains `NOT_TESTABLE_YET` and does not receive PASS promotion.

## Ownership boundary

This pack validates approved D content assumptions. It does not own glyph recognition, FIVE_POINT_STAR math, mana, prepared-spell inventory, atomic spell use, result-ledger semantics, generic save I/O, or Task8 Spell Use Screen UI. Task8 begins only as a fresh new work unit after this pack is exact-head validated and synchronized.

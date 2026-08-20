# Frostbloom Internal Graybox Test Pack

```text
PACK_ID: FROSTBLOOM_INTERNAL_GRAYBOX_PACK_V1
DECISION_ID: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
ACTIVE_REFINEMENT_1: GM-FROSTBLOOM-FIRST-10MIN-CLASS-PRACTICUM-01
ACTIVE_REFINEMENT_2: GM-FROSTBLOOM-10-23-LENS-INVESTIGATION-01
ACTIVE_REFINEMENT_3: GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01
SCOPE: INTERNAL_DESIGN_VALIDATION_ONLY
EXECUTION_ORDER: 01 -> 02 -> 03 -> 04 -> 05 -> 06 -> 07
HUMAN_VALIDATION: NOT_RUN
DEVICE_VALIDATION: NOT_RUN
PERFORMANCE_VALIDATION: NOT_RUN
FULL_SLICE_VALIDATION: NOT_RUN
46_MINUTE_TARGET_NOT_VALIDATED_BY_INTERNAL_WALKTHROUGH
PERSISTENT_GODOT_SOURCE_MUTATION: NONE
TASK8: SEPARATE_PRODUCT_WORKSTREAM_UNCHANGED_BY_PLANNING_OVERLAYS
```

## Purpose

This pack attacks the approved Frostbloom Single-Incident Spiral before release-near runtime integration. It checks chronology, information leakage, writing-event distinctness, all six 2-of-4 investigation pairs, four free-schedule choices, W6 bounded forecast/consequence preservation, W7 redesign distinctness, five-axis results, Grimoire causality, and fourteen parent-pack adversarial regressions.

Active child refinements additionally require:

- first 10 minutes: class → guided field practicum → Micro FIVE_POINT_STAR consequence;
- minutes 10–14: `FREE_SCHEDULE_LENS_ONLY`;
- minutes 14–23: all four investigation questions accessible, `SEQUENTIAL_PICK_2_OF_4`;
- W6 entry: `KNOWN_2_UNKNOWN_2`, with omitted nodes treated as uncertainty rather than failure;
- minutes 23–30: `BOUNDED_CONSEQUENCE_FORECAST` with `OBSERVED_EVIDENCE_ONLY` → `KNOWN_IMPROVEMENT` / `UNCERTAIN_CONSEQUENCE` / `FINAL_TARGET_SUCCESS_BREAKDOWN` / `MANA_COST` → `EXPLICIT_COMMIT_REQUIRED`;
- accepted W6 result: `FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE` through later Reveal/W7.

It does **not** prove fun, human comprehension, real 10/23/30/46-minute completion, forecast fairness, accessibility, device behavior, performance, export quality, or Task8 runtime behavior.

## Pack surfaces

1. `01_46_MINUTE_WALKTHROUGH.md`
2. `02_W1_W7_WRITING_LOAD_AUDIT.md`
3. `03_INVESTIGATION_2_OF_4_MATRIX.md`
4. `04_FREE_SCHEDULE_4_CHOICE_AUDIT.md`
5. `05_W6_REVEAL_W7_CONSEQUENCE_CASES.md`
6. `06_RESULT_AND_GRIMOIRE_CASES.md`
7. `07_ADVERSARIAL_WALKTHROUGH.md`

Machine-readable parent authority: `data/testing/frostbloom_internal_graybox_pack_v1.json`.
Machine-readable 10–23 child overlay: `data/testing/frostbloom_10_23_lens_v1.json`.
Machine-readable W6 child overlay: `data/testing/frostbloom_w6_bounded_forecast_v1.json`.
Automated structure contracts: `tests/test_frostbloom_internal_vertical_slice_contract.py` and `tests/test_frostbloom_internal_graybox_pack_contract.py`.

## Rollup

```text
BLOCKED = any hard-invariant FAIL
READY_WITH_RISKS = zero FAIL and one-or-more in-scope design RISK
INTERNAL_PACK_PASS = zero FAIL; NOT_TESTABLE_YET may remain only on out-of-scope human/runtime/device/performance questions
```

Current internal rollup is `INTERNAL_PACK_PASS`: parent design-structural hard invariants pass and active child overlays add no structural FAIL. Actual elapsed time, comprehension, Lens desirability, investigation-choice reasoning, W6 forecast fairness/readability, handwriting fatigue, and device behavior remain `NOT_TESTABLE_YET` or `NOT_RUN`.

## Ownership boundary

This pack validates approved Frostbloom content assumptions. It does not own glyph recognition, FIVE_POINT_STAR math, mana, prepared-spell inventory, atomic spell use, result-ledger semantics, generic save I/O, or Task8 Spell Use Screen UI. Planning refinements may alter chronology, information framing, and content contracts only; product implementation remains a later separate work unit.

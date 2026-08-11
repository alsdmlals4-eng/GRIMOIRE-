# Frostbloom Internal Graybox Test Pack 01 — Design Approval

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
sync_id: GR-SYNC-20260811-14-FROSTBLOOM-GRAYBOX-TEST-PACK-DESIGN
approval: USER_APPROVED_DESIGN
status: USER_APPROVED_DESIGN_SPEC_REVIEW_PENDING
scope: INTERNAL_DESIGN_VALIDATION_ONLY
selected_approach: HYBRID_INTERNAL_GRAYBOX_PACK
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
persistent_godot_source_mutation: none
```

## Approved intent

Before resuming Task8, create an internal-only Frostbloom graybox validation pack that makes the approved 46-minute Single-Incident Spiral inspectable without pretending that internal review is human playtest evidence.

The pack must combine:

1. chronological beat walkthrough;
2. exhaustive combination matrices;
3. adversarial attack cases.

## Approved validation blocks

- `01_46_MINUTE_WALKTHROUGH`
- `02_W1_W7_WRITING_LOAD_AUDIT`
- `03_INVESTIGATION_2_OF_4_MATRIX`
- `04_FREE_SCHEDULE_4_CHOICE_AUDIT`
- `05_W6_REVEAL_W7_CONSEQUENCE_CASES`
- `06_RESULT_AND_GRIMOIRE_CASES`
- `07_ADVERSARIAL_WALKTHROUGH`

## Hard guards

- W1–W7 must not be treated as seven equivalent redraws.
- All six unordered investigation pairs must support coherent forward progress.
- No pair may reveal `correct_route_id`, `required_spell`, or `best_intent`.
- No free-schedule choice may own a required answer/material or become the permanent dominant reward.
- W6 must improve real state and remain true after the old-revision reveal.
- W7 must change judgment under new context, not merely repeat W6.
- Five result dimensions remain independent.
- Grimoire evidence must be causally traceable to information the player had.
- Historical 3×3 language must not return as current circuit authority.
- Separate exam/festival required content remains forbidden.
- One strong pressure source must not become mob-wave/HP-sponge content.
- Human/fun/usability/device/performance/full-slice claims remain `NOT_RUN` or `NOT_TESTABLE_YET` until actual evidence exists.

## Task8 sequencing

The user reports the execution path is available. The approved sequence is still:

```text
GRAYBOX_TEST_PACK
→ complete internal design validation
→ fresh Task8 work unit
→ resume Task8 Spell Use Screen
```

This approval does not itself mutate Task8 code or flip the repository's operational hold state mid-work-unit.

## Written spec

The user-approved design has been expanded into:

`docs/superpowers/specs/2026-08-11-frostbloom-internal-graybox-test-pack-design.md`

That written spec remains subject to the separate user written-spec review gate before implementation planning.

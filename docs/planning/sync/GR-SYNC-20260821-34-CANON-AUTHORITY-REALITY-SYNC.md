# GR-SYNC-20260821-34 — Canon Authority Reality Sync

```yaml
status: GREEN_CANDIDATE_FINAL_EVIDENCE_REVERIFY_PENDING
source_main: bdf964629b08204666905996c587e5e99ad0b32c
base_live_observation: aa9a0d823db9c7373751d35d341489f64c62f7b9
base_project_pin: v9.4.3
pull_request: 152
open_pr_151: DO_NOT_TOUCH
change_class: OPERATING_CANON_CORRECTION
product_paths_changed: false
notion_write_state: PENDING_AFTER_GITHUB_MERGED_MAIN
initial_red_run: 32487126357
green_candidate_head_before_evidence_docs: 56e91df58bc85e14ce5d8dde984d5199aae034ea
review_threads_at_green_candidate: 0
```

## Purpose

Correct active routing that still described GRIMOIRE as `PLANNING_ONLY_PROFILE`, Godot-not-created, implementation-not-started, and Google-Sheet-first even though the repository already contains a Godot project, Star Runtime component, Spell Workflow Tasks 3–7, and completed Frostbloom first-session planning.

This sync changes operating canon, generated compatibility views, and focused regressions only. It does not change gameplay, product scripts, scenes, data, assets, addons, `project.godot`, Task8 product source, or PR #151.

## TDD evidence

Initial RED run `32487126357` preserved the pre-existing Base v9.4.3 regression and failed the new current-reality contract on the intended stale facts:

- Adapter `godot_project_status: NOT_CREATED`;
- `PLANNING_ONLY_PROFILE` / `NOT_STARTED` routing;
- Registry PC/current-gate drift;
- Google Sheet active GDD authority;
- generated views hard-coded to old maturity/runtime state.

The correction then changed the canonical Adapter/Registry, generator, generated views, active cold-start documents, Sheet migration contract, and only the regressions that were themselves freezing superseded current-state assumptions.

## Green candidate verification

Head `56e91df58bc85e14ce5d8dde984d5199aae034ea` completed the following PR workflows successfully:

```yaml
validate_grimoire_planning_and_base_v9_4_3: SUCCESS
validate_base_v9_4_2_planning_first_adoption: SUCCESS
validate_base_v9_4_3_first_prompt_adapter: SUCCESS
validate_base_shared_external_ai_adapter: SUCCESS
validate_spell_workflow_current_state_sync: SUCCESS
validate_godot_authoring_and_gut_authority_gate: SUCCESS
validate_godot_4_7_1_toolchain: SUCCESS
validate_star_circuit_runtime_poc: SUCCESS
validate_star_physical_validation_pack: SUCCESS
validate_visual_and_platform_gates: SUCCESS
validate_platform_release_and_asset_rights: SUCCESS
gut_formal_adoption_validation: SKIPPED_NON_APPLICABLE_PR85_SCOPED
```

`GUT Formal Adoption Validation` is a dedicated historical adoption workflow and is not counted as PASS for this correction.

## Resulting authority model

```text
Notion
→ NOTION_HUMAN_FACING_CANON

GitHub repository
→ REPOSITORY_STRUCTURED_AND_RUNTIME_CANON

Google Sheets
→ MIGRATION_ONLY_UNTIL_REMOVAL
→ NO_NEW_CANON_WRITES
→ BLOCKED_UNVERIFIED_UNIQUE_MATERIAL until unique-material absorption is verified
```

Historical Sheet write/readback receipts remain provenance and are not rewritten or deleted.

## Current product reality after correction

```yaml
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
godot_project: CREATED
main_scene: res://src/ui/star_circuit_harness.tscn
main_scene_role: DEVELOPMENT_RUNTIME_POC_ENTRY
star_runtime_component: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
full_vertical_slice: NOT_RUN
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
```

Task8 historical local acceptance remains provenance, not remote/merged authority. Compatibility locators `TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING` and `TASK8_RECEIPT_HERA_REVIEW_PR` remain for existing consumers.

## Parallel-work boundary

PR #151 stays Draft/open at its independent head and is not modified, rebased, merged, closed, or used as a product-completion claim. PR #152 has no `src/**`, `data/**`, `assets/**`, `addons/**`, `project.godot`, Scene, or Resource change.

## Remaining finalization gate

```text
FIVE-PASS ADVERSARIAL REVIEW RECEIPT
→ evidence-doc-inclusive exact-head CI revalidation
→ mergeability / main-stability / review-thread recheck
→ merge
→ merged-main readback
→ bounded Notion update
→ Notion destination readback
```

Evidence ceiling remains `HUMAN_NOT_RUN / DEVICE_NOT_RUN / PERFORMANCE_NOT_RUN / FULL_VERTICAL_SLICE_NOT_RUN`.

# GR-SYNC-20260821-34 — Canon Authority Reality Sync

```yaml
status: SYNCED_TO_MAIN_AND_NOTION_READBACK
source_main: bdf964629b08204666905996c587e5e99ad0b32c
base_live_observation: aa9a0d823db9c7373751d35d341489f64c62f7b9
base_project_pin: v9.4.3
pull_request: 152
final_exact_head: 0c1dbb553d8de3d4913c292cb01f80baa5421833
merged_main: 026230d3a91687cd4c6df0bb629eabaeb17c767c
open_pr_151: DO_NOT_TOUCH
change_class: OPERATING_CANON_CORRECTION
product_paths_changed: false
initial_red_run: 32487126357
project_home_readback: PASS
visual_work_master_readback: PASS
notion_write_state: COMPLETE_READBACK_PASS
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
```

## Purpose

Correct active routing that still described GRIMOIRE as `PLANNING_ONLY_PROFILE`, Godot-not-created, implementation-not-started, and Google-Sheet-first even though the repository already contains a Godot project, Star Runtime component, Spell Workflow Tasks 3–7, and completed Frostbloom first-session planning.

This sync changed operating canon, generated compatibility views, and focused regressions only. It did not change gameplay, product scripts, scenes, data, assets, addons, `project.godot`, Task8 product source, or PR #151.

## TDD evidence

Initial RED run `32487126357` preserved the pre-existing Base v9.4.3 regression and failed the new current-reality contract on the intended stale facts:

- Adapter `godot_project_status: NOT_CREATED`;
- `PLANNING_ONLY_PROFILE` / `NOT_STARTED` routing;
- Registry PC/current-gate drift;
- Google Sheet active GDD authority;
- generated views hard-coded to old maturity/runtime state.

The correction then changed the canonical Adapter/Registry, generator, generated views, active cold-start documents, Sheet migration contract, and only regressions that were themselves freezing superseded current-state assumptions.

## Final exact-head verification

Final exact head `0c1dbb553d8de3d4913c292cb01f80baa5421833` completed the following PR workflows:

```yaml
validate_grimoire_planning_and_base_v9_4_3: SUCCESS_32490464282
validate_base_v9_4_2_planning_first_adoption: SUCCESS_32490464271
validate_base_v9_4_3_first_prompt_adapter: SUCCESS_32490464264
validate_base_shared_external_ai_adapter: SUCCESS_32490464284
validate_spell_workflow_current_state_sync: SUCCESS_32490464302
validate_godot_authoring_and_gut_authority_gate: SUCCESS_32490464295
validate_godot_4_7_1_toolchain: SUCCESS_32490464314
validate_star_circuit_runtime_poc: SUCCESS_32490464290
validate_star_physical_validation_pack: SUCCESS_32490464292
validate_visual_and_platform_gates: SUCCESS_32490464277
validate_platform_release_and_asset_rights: SUCCESS_32490464291
gut_formal_adoption_validation: SKIPPED_NON_APPLICABLE_PR85_SCOPED_32490464322
```

The planning workflow `ci-gate` and `adversarial-gate` both completed SUCCESS. The dedicated historical GUT Formal Adoption workflow is non-applicable to this PR and is not counted as a PASS.

Five-pass adversarial review:

`docs/planning/CANON_AUTHORITY_REALITY_SYNC_ADVERSARIAL_REVIEW_2026-08-21.md`

```yaml
omission: PASS
current_state_contradiction: PASS
legacy_leakage: PASS
evidence_inflation: PASS
parallel_pr_overlap: PASS
p0_open: 0
p1_open: 0
```

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

Historical Sheet write/readback receipts remain provenance and were not rewritten or deleted.

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

PR #151 remained Draft/open and was not modified, rebased, merged, closed, or used as a product-completion claim. PR #152 had no `src/**`, `data/**`, `assets/**`, `addons/**`, `project.godot`, Scene, or Resource change and zero changed-path intersection with PR #151.

## Merged-main readback

PR #152 was squash-merged with expected head protection. Fresh branch readback confirmed:

```yaml
main: 026230d3a91687cd4c6df0bb629eabaeb17c767c
sync34_files_present: true
product_path_delta: NONE
```

## Notion readback

After merged-main readback, bounded updates were made to the GRIMOIRE Project Home and the Component Sheet work record.

Project Home readback confirmed:

```yaml
repo_main_sha: 026230d3a91687cd4c6df0bb629eabaeb17c767c
sync_state: SYNCED
platform: MOBILE_FIRST_PC_FOLLOWUP
workspace_authority: NOTION_PLUS_REPOSITORY_DOMAIN_SPLIT
sheet_authority: MIGRATION_ONLY_UNTIL_REMOVAL
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
```

Visual Work Master readback confirmed:

```yaml
component_sheet_work: IN_PROGRESS
pr151: DRAFT_UNMERGED
pr151_head_at_readback: c4ea5ca792f2b25f9759ac95756676338f6d8a67
partial_implementation: RECORDED
completion_claim: NONE
human_device_performance_full_slice: NOT_RUN
```

No Notion write promoted PR #151, Task8, Human, Device, Performance, export, or Full Vertical Slice completion.

## Follow-up clarification

Fresh Task8 remote/local revalidation after Sync34 identified that `8c611f...` is the Git baseline HEAD from PR #131 and not a Task8 product commit. The unmerged Task8 product implementation was an uncommitted local worktree delta. Current follow-up owner:

`docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md`

The parent gate remains `TASK8_PR_PREP_REVERIFY_PENDING`; the first concrete execution subgate is `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`.

Evidence ceiling remains `HUMAN_NOT_RUN / DEVICE_NOT_RUN / PERFORMANCE_NOT_RUN / FULL_VERTICAL_SLICE_NOT_RUN`.

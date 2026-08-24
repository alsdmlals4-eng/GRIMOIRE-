# GRIMOIRE Task8 Local Recovery Observation — 2026-08-24

```yaml
status: OBSERVED_USER_MACHINE_RECOVERY_EVIDENCE
probe_interpretation: LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED
local_dirty_delta: OBSERVED_PRESENT
primary_candidate_branch: feat/task8-spell-use-screen-v2
primary_candidate_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
primary_candidate_historical_branch_match: true
primary_candidate_historical_baseline_match: true
secondary_candidate_branch: task8/spell-use-screen
secondary_candidate_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
candidate_path_alias_duplication_observed: true
git_diff_usage_noise_observed: true
next_gate: PRESERVE_BOTH_TASK8_CANDIDATES_BEFORE_SYNC
persistent_godot_authority: HIGODOT_ONLY
product_merge_state: UNMERGED
human_device_performance_export_full_slice: NOT_RUN
```

## Observation scope

This receipt records the user-machine output of the existing read-only Task8 recovery probe. It is evidence that recoverable Task8 product work exists locally; it is **not** proof that the local code is current-main compatible, freshly tested, HiGodot-validated, committed, pushed, merged, or runtime/human/device/performance/export validated.

The user-machine root checkout was intentionally not synchronized before the probe. Its local `main` therefore appeared older than the current remote project main. That is expected under the recovery rule: inventory first, synchronization only after the surviving Task8 work is preserved.

## Primary recovery candidate — v2

The strongest current candidate is the historical v2 worktree because both its branch identity and HEAD match the recovery contract:

```yaml
branch: feat/task8-spell-use-screen-v2
head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
historical_branch_match: true
historical_baseline_match: true
preferred_spell_use_script_exists: true
preferred_spell_use_scene_exists: true
delta_evidence_present: true
```

Observed Task8-relevant v2 source/test evidence includes:

- modified `src/core/workflow/spell_workflow_coordinator.gd`;
- modified `src/core/workflow/spell_workflow_state.gd`;
- modified workflow coordinator/state unit coverage;
- untracked `src/ui/spell_workflow/spell_use_screen.gd` + `.tscn` + generated `.uid`;
- untracked `tests/gut/integration/test_spell_use_screen.gd` + generated `.uid`;
- `artifacts/task8-red/manifest.json`.

This is the **primary recovery source**, but no persistent product write may be derived from it until fresh exact-project HiGodot readback is available.

## Secondary recovery candidate — original Task8 worktree

A second surviving Task8 worktree was also observed:

```yaml
branch: task8/spell-use-screen
head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
preferred_spell_use_script_exists: true
preferred_spell_use_scene_exists: true
delta_evidence_present: true
```

It contains a broader earlier UI shape, including:

- `spell_use_screen.gd/.tscn`;
- `target_selection_panel.gd/.tscn`;
- `expected_result_panel.gd/.tscn`;
- `tests/integration/test_spell_use_workflow_screen.gd`;
- workflow coordinator/state and runner deltas.

It also carries many unrelated/vendor/generated changes. Therefore it is **secondary recovery/reference evidence**, not a branch to merge or normalize wholesale. Preserve it until parity review proves which Task8-specific behaviors are still needed.

## Probe-quality findings

The user-machine transcript also exposed two probe-quality defects that do not invalidate the Task8 evidence:

1. `git diff` usage text was emitted repeatedly. The current script interpolates the baseline range in a form that PowerShell can misparse on the real Windows host.
2. The same v2 worktree was counted twice because Git's forward-slash worktree path and the `Join-Path` backslash spelling were treated as different candidate strings.

The reported `historical_candidate_count: 3` therefore represents **two unique Task8 worktrees plus one path alias**, not three independent Task8 implementations.

These defects belong to the recovery probe/tooling layer. They must be fixed without modifying either surviving product worktree.

## Fail-closed preservation decision

Before any `fetch`, `pull`, branch switch, rebase, reset, restore, clean, stash, or Task8 product rewrite on the user's ordinary checkout:

```text
PRESERVE_BOTH_TASK8_CANDIDATES_BEFORE_SYNC
→ primary v2 snapshot
→ secondary original Task8 snapshot
→ verify snapshot receipts
→ only then fresh remote-main synchronization in a separate clean/reconciliation worktree
→ fresh HiGodot readback of primary + targeted secondary parity evidence
→ current-main reconciliation
→ fresh Task8 tests / full runner / Hera / adversarial review
→ Task8 product PR
```

Do not merge either historical worktree directly into current `main`. Do not restore historical `tests/test_runner.gd` over the current runner. Do not reconstruct `.gd/.tscn` product files through GitHub text writes.

## Evidence ceiling after this observation

```yaml
local_probe_execution: OBSERVED_EVIDENCE_FOUND_REVIEW_REQUIRED
local_dirty_delta_existence: OBSERVED_PRESENT
primary_candidate_identity: VERIFIED_BY_PROBE_OUTPUT
secondary_candidate_identity: VERIFIED_BY_PROBE_OUTPUT
candidate_preservation: NOT_RUN
fresh_HiGodot_readback: NOT_RUN
current_main_compatibility: NOT_VERIFIED
fresh_Task8_tests: NOT_RUN
fresh_full_runner: NOT_RUN
Hera_source_delta: NOT_RUN
Task8_product_PR: NONE
Task8_product_merge: UNMERGED
Human: NOT_RUN
Device: NOT_RUN
Performance: NOT_RUN
Export: NOT_RUN
Full_Vertical_Slice: NOT_RUN
```

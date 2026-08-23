# GRIMOIRE Task8 Remote / Local Reverify — 2026-08-21

```yaml
status: CURRENT_REMOTE_READBACK_COMPLETE_LOCAL_DELTA_RECOVERY_REQUIRED
project_main: 026230d3a91687cd4c6df0bb629eabaeb17c767c
parent_gate: TASK8_PR_PREP_REVERIFY_PENDING
current_execution_subgate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
historical_handoff: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
task8_local_branch_historical: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_local_head_role: LOCAL_GIT_HEAD_BASELINE_NOT_PRODUCT_COMMIT
task8_product_commit: TASK8_PRODUCT_COMMIT_NONE
task8_remote_product_branch: TASK8_REMOTE_PRODUCT_BRANCH_NOT_PRESENT
task8_remote_product_pr: TASK8_REMOTE_PRODUCT_PR_NONE
historical_product_state: UNMERGED_LOCAL_WORKTREE_DELTA
handoff_git_write: NO_STAGE_COMMIT_PUSH_DURING_HANDOFF
remote_scan: REMOTE_TASK8_BRANCH_SCAN_NO_SPELL_USE_SCREEN_PRODUCT_FILE
parallel_pr_151: DO_NOT_TOUCH
human_validation: HUMAN_NOT_RUN
device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
```

## Why this reverify exists

Sync21 correctly preserved Task8 as local, unmerged work and prohibited stage/commit/push during handoff. A later cold-start shorthand could nevertheless be misread as if `8c611f...` were a commit containing the Task8 product implementation.

Fresh remote readback on 2026-08-21 closes that ambiguity.

## Commit identity readback

`8c611f601aa98397ed1558e92ab207e0e8347a9b` is the merged-main commit for PR #131:

> `chore: reconcile tracked HiGodot v3.1.4 authority state (#131)`

Its commit message explicitly states that it contains **no protected Task8 product source changes**. Therefore:

```text
8c611f...
= local branch Git HEAD / baseline at handoff
!= Task8 Spell Use Screen product commit
```

The historical Task8 acceptance evidence applied to an uncommitted working-tree delta layered on that Git baseline.

## Sync21 provenance preserved

`docs/planning/sync/GR-SYNC-20260812-21-TASK8-HANDOFF-BCP.md` remains historical authority and is not rewritten by this reverify. It records:

```yaml
local_product_branch: feat/task8-spell-use-screen-v2
local_product_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
remote_product_branch_at_handoff: NOT_PRESENT
product_pr_at_handoff: NONE
product_merge_state: UNMERGED_LOCAL_WORK
continuation_status: TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
handoff_mutation_boundary: NO_STAGE_COMMIT_PUSH_DURING_HANDOFF
```

It also states that the reviewed nine-path Task8 delta was not copied, staged, committed, pushed, reset, restored, cleaned, or rewritten during the handoff.

## Fresh remote branch scan

Current remote Task8/handoff branch inventory found:

```text
task8/resume-v314-preflight
task8/spell-use-screen-entry
task8/sync17-current-consumer
task8/sync17-v314-alignment-input
task8/sync17-v314-alignment-input-repaired-base
chore/task8-live-entry-local-47-variance
handoff/task8-bcp-continuation-20260812
handoff/task8-bcp-continuation-closure-20260812
```

Fresh exact-path reads for `src/ui/spell_workflow/spell_use_screen.gd` on every branch above returned `Not Found`.

Fresh exact-branch search for `feat/task8-spell-use-screen-v2` returned no remote branch.

No current remote Task8 product PR exists. Commit search found Task8 planning/tooling/handoff lineage but no Task8 Spell Use Screen product commit.

Final remote classification:

```yaml
feat_task8_spell_use_screen_v2_remote: NOT_PRESENT
spell_use_screen_product_file_on_scanned_task8_branches: NOT_PRESENT
remote_task8_product_commit: NONE_FOUND
remote_task8_product_pr: NONE
remote_recovery_path: NOT_AVAILABLE_FROM_GITHUB_HISTORY
```

## What remains authoritative

The approved Task8 implementation plan remains:

`docs/superpowers/plans/2026-08-11-task8-spell-use-screen.md`

Architecture remains:

```text
prepared spell UI
→ explicit target choice
→ existing SpellWorkflowCoordinator.prepare_target_preview(...)
→ supplied final Mana / expected result
→ existing request_use_confirmation()
→ explicit confirmation
→ existing confirm_use(transaction_id)
→ existing AtomicSpellUseService
```

Task8 owns presentation and user intent only. It must not create a second target/use/Mana/inventory/result/rollback authority.

## Historical local acceptance ceiling

Sync21 recorded the then-observed local acceptance checkpoint:

```yaml
accepted_higodot_checkpoint: task8-spell-use-screen-v2@b680
accepted_focused_gut: 15 tests / 90 assertions / 0 failures
accepted_predecessor_regression: 42 suites / 1,588 assertions / 0 failures
accepted_hera_delta: HERA_SOURCE_DELTA_NONE_OBSERVED
```

This remains valid as historical evidence of that observed worktree state. It does **not** prove that the uncommitted delta still exists on the user's machine today, that its current contents are unchanged, or that a current HiGodot session is attached.

## Current exact blocker

The parent compatibility gate remains:

`TASK8_PR_PREP_REVERIFY_PENDING`

Its concrete first subgate is now:

`TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`

This means the next local execution must first determine whether the historical uncommitted Task8 delta still exists in the user's local checkout/worktree.

### If the local delta still exists

Do not reset/restore/clean it. Record:

```text
exact repository/worktree path
current branch
current HEAD
staged/cached state
git status --short
Task8 changed-path inventory
```

Then recover exact-project HiGodot 3.1.4 readiness, rerun fresh focused Task8 and predecessor regressions, `git diff --check`, and the exact-path adversarial review before any stage/commit/push.

### If the local delta no longer exists

Do not reconstruct `.gd/.tscn` through GitHub text writes. Re-author the approved Task8 implementation through the project-authorized HiGodot route using fresh TDD RED → minimum GREEN → protected-delta receipt/readback → regressions → Hera → exact-head CI/review.

## Parallel work protection

PR #151 is a separate Component Sheet workstream. It remains `DO_NOT_TOUCH` in this Task8 recovery work. Task8 recovery must re-read latest main and PR #151 overlap before any future product authoring.

## Evidence ceiling

No change in this reverify promotes:

```text
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
```

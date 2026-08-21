# GRIMOIRE Task8 Local Recovery Executor Packet — 2026-08-21

```yaml
purpose: RECOVER_OR_REVALIDATE_EXISTING_LOCAL_TASK8_WORK_WITHOUT_OVERWRITE
parent_gate: TASK8_PR_PREP_REVERIFY_PENDING
entry_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
project: GRIMOIRE
expected_local_project: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-
historical_branch: feat/task8-spell-use-screen-v2
historical_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
historical_head_role: LOCAL_GIT_HEAD_BASELINE_NOT_PRODUCT_COMMIT
historical_product_commit: NONE
remote_product_branch: NOT_PRESENT
remote_product_pr: NONE
persistent_godot_authority: HIGODOT_ONLY
parallel_pr_151: DO_NOT_TOUCH
```

## Non-negotiable safety rules

Do **not** run any of the following before the local Task8 state is fully inventoried and copied into evidence:

```text
git reset
git restore
git clean
git checkout -- <path>
git stash
git add
git commit
git merge
git rebase
git cherry-pick
```

Do not kill unrelated Godot/HiGodot/Hera processes. Do not replace or normalize line endings in the recovered delta. Do not use GitHub text-file writes to recreate `*.gd`, `*.tscn`, `*.tres`, `*.res`, or `project.godot`.

PR #151 is a separate visual/component workstream. Do not edit, rebase, merge, close, or absorb any PR #151 file while recovering Task8.

## Step 1 — Read-only local identity inventory

Run from a fresh PowerShell only if the prior exact dedicated session is no longer known-good. Otherwise the already-established exact dedicated Codex session may be reused within its proven capability boundary.

Use read-only Git commands first:

```powershell
$Repo = 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-'
Set-Location $Repo

git rev-parse --show-toplevel
git branch --show-current
git rev-parse HEAD
git status --short --branch
git diff --name-status
git diff --cached --name-status
git ls-files --others --exclude-standard
```

Expected historical identity is **not** a completion condition. `8c611f...` was only the Git baseline at the old handoff. If current HEAD/branch differs, record the actual state; do not force it back.

## Step 2 — Recover the actual Task8 changed-path set

The remote repository preserves the phrase `EXACT_NINE_PATH_TASK8_ADVERSARIAL_REVIEW`, but the authoritative nine-path filename list itself is not stored in current remote evidence. **Do not invent those paths.**

Build the candidate path inventory only from current local evidence:

```powershell
$Working = git diff --name-only
$Cached = git diff --cached --name-only
$Untracked = git ls-files --others --exclude-standard

'--- working ---'
$Working
'--- cached ---'
$Cached
'--- untracked ---'
$Untracked
```

Then classify every discovered path as:

```text
TASK8_EXPECTED_PRODUCT_OR_TEST
TASK8_GENERATED_UID_OR_RECEIPT
UNRELATED_USER_WORK
PR151_OR_OTHER_PARALLEL_WORK
UNKNOWN_STOP_AND_REVIEW
```

A path count of nine is **not sufficient evidence** by itself. If exactly nine Task8 paths are recovered, record them explicitly and compare them to the approved Task8 plan and historical acceptance semantics. If the count differs, stop and explain the difference rather than deleting or adding files to force nine.

## Step 3 — Approved Task8 semantic comparison

Current implementation plan:

`docs/superpowers/plans/2026-08-11-task8-spell-use-screen.md`

Preferred UI paths from that plan are:

```text
src/ui/spell_workflow/spell_use_screen.gd
src/ui/spell_workflow/spell_use_screen.tscn
```

These are preferred names, not permission to recreate them through GitHub. The recovered delta must remain a thin UI consumer of existing Stage 3 authority:

```text
select_prepared_spell(...)
→ prepare_target_preview(...)
→ request_use_confirmation()
→ confirm_use(transaction_id)
→ existing AtomicSpellUseService
```

Reject any recovered implementation that introduces a second owner for:

```text
Mana spend
PreparedSpell lifecycle
inventory consumption
result commit
rollback
save semantics
target/use business rules
```

## Step 4 — Dedicated HiGodot revalidation

Before any new persistent product mutation, confirm the exact GRIMOIRE project/worktree and project-scoped HiGodot environment. Required observed state:

```yaml
godot: 4.7.1
higodot_server: 3.1.4
higodot_plugin: 3.1.4
readiness: ready
project_identity: exact GRIMOIRE worktree
```

Do not invent an `expected_version` field if the tool does not surface one. Hera remains `LIVE_QA_AND_OBSERVABILITY_ONLY` and may not persistently mutate source.

If the local Task8 delta is absent, this is the point where the approved plan returns to fresh TDD RED and HiGodot re-authoring. Do not reconstruct product files through GitHub.

## Step 5 — Fresh deterministic verification

Historical counts are targets for regression continuity, not permission to reuse old PASS status.

Re-run the project-authorized focused suites using the repository's existing GUT/current runner route and record the actual fresh commands/results.

Historical acceptance reference:

```yaml
task8_focused: 15 tests / 90 assertions / 0 failures
predecessor_regression: 42 suites / 1,588 assertions / 0 failures
hera_source_delta: NONE
```

Also run:

```powershell
git diff --check
```

The new receipt must distinguish:

```text
fresh PASS
historical PASS only
NOT_RUN
BLOCKED
```

## Step 6 — Exact-path adversarial review

Attack the recovered Task8 delta for at least:

```text
second target/use authority in UI
preview mutation
silent first/nearest target selection
local final-Mana/result recomputation
confirm double-fire
stale-target partial transaction
cancel/back competing restore semantics
input-family semantic divergence
missing/ambiguous focus
one-aspect hardcoding that blocks Task9
HiGodot receipt omissions including generated .gd.uid
Hera persistent mutation
PR151 path overlap
unrelated user-work inclusion
Human/Device/Performance evidence inflation
```

Required result before Git write:

```yaml
P0: 0
P1: 0
recovered_task8_paths: EXPLICIT_LIST_REQUIRED
unrelated_user_paths_in_stage_set: 0
pr151_overlap: 0
higodot_receipt_readback: PASS
fresh_task8_tests: PASS
fresh_predecessor_regression: PASS
hera_source_delta: NONE
git_diff_check: PASS
```

## Step 7 — Git write boundary

Only after Steps 1–6 pass may the exact recovered Task8 path set be staged and committed.

Before staging, print the exact intended list. Stage only those files. Never use `git add .` or `git add -A` in this recovery.

Then:

```text
stage exact Task8 files only
→ show cached path list
→ compare cached list to reviewed path list
→ commit
→ push a dedicated Task8 product branch
→ open PR to latest main
→ exact-head CI/review
→ merge only if all gates remain green
→ merged-main readback
```

If the current executor cannot perform the necessary Git write, classify it as `EXECUTOR_CAPABILITY_BLOCKER` and use the already-approved local PowerShell Git boundary. Do not reinterpret a Git capability failure as a product failure.

## Completion report required from local executor

```yaml
repo_path:
branch_before:
head_before:
recovered_delta_present: true|false
recovered_task8_paths:
- <exact path>
unrelated_paths_preserved:
- <exact path or NONE>
higodot_exact_project_ready:
focused_task8_result:
predecessor_regression_result:
hera_source_delta:
git_diff_check:
adversarial_p0:
adversarial_p1:
commit_sha_if_created:
remote_branch_if_pushed:
pr_if_opened:
not_run:
- human
- device
- performance
- full_vertical_slice
```

This packet completes only the recovery/revalidation handoff. It does not claim the local delta exists, does not claim Task8 is merged, and does not authorize Task9 or Human PASS before the appropriate merged-main/runtime evidence exists.

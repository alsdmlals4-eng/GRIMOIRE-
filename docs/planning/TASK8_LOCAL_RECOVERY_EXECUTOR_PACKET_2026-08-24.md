# GRIMOIRE Task8 Local Recovery Executor Packet — 2026-08-24

```yaml
status: CURRENT_V48_LOCAL_RECOVERY_OVERLAY
parent_gate: TASK8_PR_PREP_REVERIFY_PENDING
entry_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
previous_packet: TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-22.md
historical_packet: TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-21.md
observation_receipt: TASK8_LOCAL_RECOVERY_OBSERVATION_2026-08-24.md
probe: tools/task8_local_recovery_probe.ps1
probe_historical_verified_merge: 15139d80ab7112ea93e5090eece9cc145ae80f6b
probe_current_commit: 6d432f4626388d537f9281a15d407910c657ac1a
bootstrap_policy: TEMP_BOOTSTRAP_PREFERRED_WHEN_LOCAL_MAIN_NOT_SYNCED
historical_branch: feat/task8-spell-use-screen-v2
historical_git_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
persistent_godot_authority: HIGODOT_ONLY
component_sheet_pr151: MERGED_MAIN_VERIFIED
local_probe_transport: DIRECT_USER_MACHINE_PROBE_REQUIRED
loop_a2_relation: LOOP_A2_MANAGED_WORKTREE_NOT_LOCAL_DIRTY_RECOVERY
local_probe_execution: OBSERVED_EVIDENCE_FOUND_REVIEW_REQUIRED
local_dirty_delta_existence: OBSERVED_PRESENT
next_gate: TASK8_LOCAL_CANDIDATE_PRESERVATION_REQUIRED
```

This file is the current v4.8 recovery overlay. The 2026-08-21 and 2026-08-22 packets remain historical provenance and are not rewritten.

## Current observed recovery state

The direct user-machine read-only probe has now been observed. Its result is `LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED`: two unique Task8 worktrees survive locally, and the historical v2 branch/HEAD exactly matches the expected recovery identity.

The bounded receipt is `TASK8_LOCAL_RECOVERY_OBSERVATION_2026-08-24.md`.

Current decision:

```yaml
primary_recovery_candidate: feat/task8-spell-use-screen-v2@8c611f601aa98397ed1558e92ab207e0e8347a9b
secondary_recovery_candidate: task8/spell-use-screen@fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
candidate_preservation: REQUIRED_BEFORE_LOCAL_SYNC
current_main_compatibility: NOT_VERIFIED
```

Do not fetch/pull/rebase/clean either historical worktree before both candidates are preserved. Do not merge either historical worktree directly into current `main`.

## Why this overlay exists

The 2026-08-22 packet correctly preserved the read-only Task8 probe and TEMP bootstrap, but it also recorded PR #151 as a separate Draft/`DO_NOT_TOUCH` workstream. That statement is historical now. PR #151 has been merged into project `main` and its shared semantic UI components are current-main inputs for Task8 reconciliation.

Current rule:

```yaml
PR #151: MERGED_MAIN_VERIFIED
ContextTargetSelector: CURRENT_SHARED_PRESENTATION_PRIMITIVE
CommitBar: CURRENT_SHARED_PRESENTATION_PRIMITIVE
ForecastCard: CONDITIONAL_FORECAST_SEMANTICS_SOURCE_REQUIRED
Task8_gameplay_authority: SPELL_WORKFLOW_COORDINATOR_AND_ATOMIC_USE_ONLY
```

Do not treat merged Component Sheet paths as unrelated local contamination merely because the historical Task8 worktree predates them. Reconcile the recovered Task8 delta against current `main` only after the local state is safely preserved.

## Why Loop A2 does not replace local dirty-state recovery

Current Base Loop A2 Local Executor is a valid subscription-native automation path, but its v1 contract is deliberately isolated:

```text
bounded Base issue job
→ user's Windows local executor
→ exact authority SHAs
→ executor-owned managed repository clones
→ executor-owned detached worktrees
→ ChatGPT-authenticated Codex
→ bounded receipt
```

Its queue job accepts canonical repository identity, exact SHAs, a repository-relative Capsule, run id, and provider. It does not accept an arbitrary local checkout path. Its managed repository store creates and removes detached worktrees under the executor state root instead of adopting the user's ordinary GRIMOIRE checkout.

Therefore:

```yaml
loop_a2_capability: VALID_FOR_MANAGED_A2_EXECUTION
loop_a2_task8_dirty_recovery: LOOP_A2_MANAGED_WORKTREE_NOT_LOCAL_DIRTY_RECOVERY
first_observation: OBSERVED_COMPLETE
next_gate: TASK8_LOCAL_CANDIDATE_PRESERVATION_REQUIRED
```

Do not create an unrelated A2 diagnostic run merely to test daemon liveness, and do not broaden Base's local executor security/path contract inside this GRIMOIRE task. A future Base enhancement for bounded read-only ordinary-checkout inspection would be a separate Base design/approval surface, not an implicit Task8 fallback.

## Probe bootstrap — retained for bounded rerun only

The first probe was already observed. The following bootstrap remains a recovery/rerun route only; it is not the current next gate.

Do not fetch, pull, checkout, switch, reset, restore, clean, or stash before this probe. The same prohibition remains in effect until candidate preservation is verified.

**Do not fetch, pull, checkout, switch, reset, restore, clean, or stash before a recovery probe or before candidate preservation.**

The 2026-08-21/22 packet keeps the historical `15139d80...` probe pin as provenance. Current reruns use the repaired read-only probe commit `6d432f4626388d537f9281a15d407910c657ac1a`, which fixes Windows baseline-range parsing and path-alias deduplication without broadening write authority.

If the local checkout is not already known to contain the repaired probe, use the commit-pinned TEMP bootstrap. It writes the probe only under the operating-system TEMP directory and does not change repository refs or files:

```powershell
$Probe = Join-Path $env:TEMP 'grimoire-task8-local-recovery-probe-6d432f46.ps1'
$Uri = 'https://raw.githubusercontent.com/alsdmlals4-eng/GRIMOIRE-/6d432f4626388d537f9281a15d407910c657ac1a/tools/task8_local_recovery_probe.ps1'
Invoke-WebRequest -Uri $Uri -OutFile $Probe -ErrorAction Stop
& $Probe -Repo 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-'
```

If `Invoke-WebRequest` fails, stop at that boundary. Do not fetch or pull the repository just to obtain the probe.

For a checkout already confirmed to contain the repaired probe, the equivalent direct invocation is:

```powershell
& 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-\tools\task8_local_recovery_probe.ps1'
```

The probe remains read-only by contract. It inventories registered worktrees, historical branch/HEAD, working/cached/untracked paths, baseline-to-HEAD local commit evidence, and preferred Spell Use Screen path existence while setting `GIT_OPTIONAL_LOCKS=0` for its own process.

## Interpretation retained

### `LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED`

This branch is now the observed path.

1. Preserve **both** discovered Task8 worktrees exactly as found before synchronization.
2. Treat `feat/task8-spell-use-screen-v2` at the historical baseline as the primary recovery source.
3. Treat `task8/spell-use-screen` as secondary/reference evidence because it contains a broader earlier UI shape plus unrelated/vendor/generated dirt.
4. Do not normalize, stage, clean, restore, rebase, or overwrite either worktree.
5. After verified preservation, create/use a separate clean reconciliation worktree from fresh current `main`.
6. Fresh-read the explicit Task8 product artifacts through the exact-project HiGodot 3.1.4 session before persistent Godot mutation.
7. Reconcile the recovered UI against current merged shared primitives:
   - prefer `ContextTargetSelector` for explicit target choice when parity tests pass;
   - prefer `CommitBar` for player intent only; it never owns the spell-use request or gameplay transaction;
   - use `ForecastCard` only when an authoritative semantic source supplies its text fields;
   - preserve historical Task8-specific focus/failure/stale-preview behavior until parity is tested.
8. Fresh-read the current test runner and preserve every existing suite before registering Task8.
9. Run focused Task8 tests, predecessor workflow/atomic-use regressions, full current runner, Hera source-delta check, `git diff --check`, and exact-path adversarial review before Git integration.

### `NO_LOCAL_TASK8_EVIDENCE_FOUND_BY_INITIAL_PROBE`

This branch is no longer the current observed result. It remains documented only for future bounded reruns.

Do not reconstruct product files through GitHub. Do not manufacture a historical dirty delta from transcripts, GitHub comments, or guessed file lists. Persistent `.gd/.tscn/.tres/.res/project.godot` authoring remains `HIGODOT_ONLY`.

## Current execution router

```text
TASK8_LOCAL_CANDIDATE_PRESERVATION_REQUIRED
→ preserve primary v2 candidate
→ preserve secondary original Task8 candidate
→ verify preservation receipts
→ only then fresh remote-main synchronization in a separate clean reconciliation worktree
→ fresh HiGodot readback of primary candidate
→ targeted secondary parity comparison
→ reconcile current main / merged shared UI / current runner
→ fresh tests + receipt + Hera + adversarial review
→ Task8 product PR
→ exact-head CI / review threads 0 / P0=P1=0
→ merge
→ merged-main readback
→ bounded Repository + Notion sync
→ Task9
```

## Evidence ceiling

The local probe is now observed and surviving Task8 work is confirmed. Nothing beyond that boundary is promoted.

```yaml
Task8_product: UNMERGED
Issue_111: OPEN
local_dirty_delta_existence: OBSERVED_PRESENT
local_probe_execution: OBSERVED_EVIDENCE_FOUND_REVIEW_REQUIRED
candidate_preservation: NOT_RUN
HiGodot_current_readiness: NOT_RUN
current_main_compatibility: NOT_VERIFIED
fresh_Task8_tests: NOT_RUN
fresh_full_runner: NOT_RUN
Hera_source_delta: NOT_RUN
Human: NOT_RUN
Device: NOT_RUN
Performance: NOT_RUN
Export: NOT_RUN
Full_Vertical_Slice: NOT_RUN
```

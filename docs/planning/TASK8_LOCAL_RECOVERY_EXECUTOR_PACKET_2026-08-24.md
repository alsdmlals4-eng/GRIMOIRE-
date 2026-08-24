# GRIMOIRE Task8 Local Recovery Executor Packet — 2026-08-24

```yaml
status: CURRENT_V48_LOCAL_RECOVERY_OVERLAY
parent_gate: TASK8_PR_PREP_REVERIFY_PENDING
entry_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
previous_packet: TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-22.md
historical_packet: TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-21.md
probe: tools/task8_local_recovery_probe.ps1
probe_verified_merge: 15139d80ab7112ea93e5090eece9cc145ae80f6b
bootstrap_policy: TEMP_BOOTSTRAP_PREFERRED_WHEN_LOCAL_MAIN_NOT_SYNCED
historical_branch: feat/task8-spell-use-screen-v2
historical_git_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
persistent_godot_authority: HIGODOT_ONLY
component_sheet_pr151: MERGED_MAIN_VERIFIED
local_probe_transport: DIRECT_USER_MACHINE_PROBE_REQUIRED
loop_a2_relation: LOOP_A2_MANAGED_WORKTREE_NOT_LOCAL_DIRTY_RECOVERY
local_probe_execution: NOT_RUN
```

This file is the current v4.8 recovery overlay. The 2026-08-21 and 2026-08-22 packets remain historical provenance and are not rewritten.

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

Do not treat merged Component Sheet paths as unrelated local contamination merely because the historical Task8 worktree predates them. Reconcile the recovered Task8 delta against current `main` after the local state is safely inventoried.

## Why Loop A2 does not replace the first recovery probe

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

Therefore the current Task8 gate is:

```yaml
loop_a2_capability: VALID_FOR_MANAGED_A2_EXECUTION
loop_a2_task8_dirty_recovery: LOOP_A2_MANAGED_WORKTREE_NOT_LOCAL_DIRTY_RECOVERY
required_first_observation: DIRECT_USER_MACHINE_PROBE_REQUIRED
```

Do not create an unrelated A2 diagnostic run merely to test daemon liveness, and do not broaden Base's local executor security/path contract inside this GRIMOIRE task. A future Base enhancement for bounded read-only ordinary-checkout inspection would be a separate Base design/approval surface, not an implicit Task8 fallback.

## First action — preserve local Git state before obtaining the probe

**Do not fetch, pull, checkout, switch, reset, restore, clean, or stash before this probe.** The ordinary checkout or a registered historical worktree may contain the only surviving Task8 product delta.

If the local checkout is not already known to contain the exact verified probe, use the commit-pinned TEMP bootstrap. It writes the probe only under the operating-system TEMP directory and does not change repository refs or files:

```powershell
$Probe = Join-Path $env:TEMP 'grimoire-task8-local-recovery-probe-15139d80.ps1'
$Uri = 'https://raw.githubusercontent.com/alsdmlals4-eng/GRIMOIRE-/15139d80ab7112ea93e5090eece9cc145ae80f6b/tools/task8_local_recovery_probe.ps1'
Invoke-WebRequest -Uri $Uri -OutFile $Probe -ErrorAction Stop
& $Probe -Repo 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-'
```

If `Invoke-WebRequest` fails, stop at that boundary. Do not fetch or pull the repository just to obtain the probe.

For a checkout already confirmed to contain the probe-bearing merge, the equivalent direct invocation is:

```powershell
& 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-\tools\task8_local_recovery_probe.ps1'
```

The probe remains read-only by contract. It inventories registered worktrees, historical branch/HEAD, working/cached/untracked paths, baseline-to-HEAD local commit evidence, and preferred Spell Use Screen path existence while setting `GIT_OPTIONAL_LOCKS=0` for its own process.

## Interpretation

### `LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED`

1. Preserve the discovered worktree exactly as found.
2. Do not normalize, stage, clean, restore, or overwrite it.
3. Fresh-read the explicit discovered Task8 paths through the exact-project HiGodot 3.1.4 session before persistent Godot mutation.
4. Reconcile the recovered UI against current merged shared primitives:
   - prefer `ContextTargetSelector` for explicit target choice when parity tests pass;
   - prefer `CommitBar` for player intent only; it never owns the spell-use request or gameplay transaction;
   - use `ForecastCard` only when an authoritative semantic source supplies its text fields;
   - preserve historical Task8-specific focus/failure/stale-preview behavior until parity is tested.
5. Fresh-read the current test runner and preserve every existing suite before registering Task8.
6. Run focused Task8 tests, predecessor workflow/atomic-use regressions, full current runner, Hera source-delta check, `git diff --check`, and exact-path adversarial review before Git integration.

### `NO_LOCAL_TASK8_EVIDENCE_FOUND_BY_INITIAL_PROBE`

This is not permission to manufacture the historical dirty delta from transcripts, GitHub comments, or guessed file lists. Perform only a bounded second recovery investigation if new evidence justifies it; otherwise return to the approved Task8 HiGodot TDD RED → minimum GREEN path on fresh current authority.

**Do not reconstruct product files through GitHub.** Persistent `.gd/.tscn/.tres/.res/project.godot` authoring remains `HIGODOT_ONLY`.

## Current execution router

```text
DIRECT_USER_MACHINE_PROBE_REQUIRED
→ read-only Task8 recovery probe on ordinary GRIMOIRE checkout
→ evidence found?
   ├─ yes: preserve exact dirty state
   │       → fresh HiGodot readback
   │       → reconcile current main / merged shared UI / current runner
   │       → fresh tests + receipt + Hera + adversarial review
   └─ no: bounded second recovery investigation only if evidence warrants
           → otherwise fresh HiGodot TDD re-authoring
→ Task8 product PR
→ exact-head CI / review threads 0 / P0=P1=0
→ merge
→ merged-main readback
→ bounded Repository + Notion sync
→ Task9
```

## Evidence ceiling

This overlay does not claim that the user-machine probe has run or that Task8 product code is current, committed, pushed, PR'd, merged, or human/device/performance/export validated.

```yaml
Task8_product: UNMERGED
Issue_111: OPEN
local_dirty_delta_existence: BLOCKED_UNVERIFIED
local_probe_execution: NOT_RUN
HiGodot_current_readiness: NOT_RUN
Human: NOT_RUN
Device: NOT_RUN
Performance: NOT_RUN
Export: NOT_RUN
Full_Vertical_Slice: NOT_RUN
```

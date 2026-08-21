# GRIMOIRE Task8 Local Recovery Executor Packet — 2026-08-22

```yaml
status: CURRENT_LOCAL_PROBE_OVERLAY
parent_gate: TASK8_PR_PREP_REVERIFY_PENDING
entry_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
historical_packet: TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-21.md
probe: tools/task8_local_recovery_probe.ps1
probe_verified_merge: 15139d80ab7112ea93e5090eece9cc145ae80f6b
bootstrap_policy: TEMP_BOOTSTRAP_PREFERRED_WHEN_LOCAL_MAIN_NOT_SYNCED
historical_branch: feat/task8-spell-use-screen-v2
historical_git_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
persistent_godot_authority: HIGODOT_ONLY
parallel_pr_151: DO_NOT_TOUCH
```

This is a narrow current overlay. It does not rewrite the historical 2026-08-21 handoff packet or claim that the local Task8 delta still exists.

## First action — preserve local Git state before obtaining the probe

Do not fetch, pull, checkout, switch, reset, restore, clean, or stash before this probe. The local checkout may contain the only surviving Task8 worktree delta, so repository synchronization must not precede inventory.

If the local checkout is already known to contain the exact merged probe, the repository-owned script may be run directly. Otherwise the preferred bootstrap downloads the **exact verified merge commit** copy to `$env:TEMP` and executes it from there without changing repository files or Git refs:

```powershell
$Probe = Join-Path $env:TEMP 'grimoire-task8-local-recovery-probe-15139d80.ps1'
$Uri = 'https://raw.githubusercontent.com/alsdmlals4-eng/GRIMOIRE-/15139d80ab7112ea93e5090eece9cc145ae80f6b/tools/task8_local_recovery_probe.ps1'
Invoke-WebRequest -Uri $Uri -OutFile $Probe -ErrorAction Stop
& $Probe -Repo 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-'
```

If `Invoke-WebRequest` fails, stop at that boundary. Do not fetch/pull the repository merely to obtain the probe. The bootstrap writes only the commit-specific script copy under the operating-system TEMP directory.

For a checkout already confirmed at the probe-bearing merge, the equivalent direct invocation is:

```powershell
& 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-\tools\task8_local_recovery_probe.ps1'
```

The probe reads registered worktrees, the historical worktree path, branch/HEAD, working/cached/untracked path inventories, baseline-to-HEAD local commit evidence, and preferred Spell Use Screen path existence. It emits JSON to stdout and does not create a report file in the repository. Its own process disables optional Git locks/index refresh with `GIT_OPTIONAL_LOCKS=0`.

## Interpretation

### `LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED`

Preserve the discovered worktree exactly as found. Do not normalize, delete, stage, or rewrite it. Compare the explicit discovered paths against the approved Task8 plan and then continue with exact-project HiGodot 3.1.4 readiness, fresh Task8 GUT, predecessor regression, Hera source-delta NONE, `git diff --check`, and exact-path adversarial review before any Git write.

### `NO_LOCAL_TASK8_EVIDENCE_FOUND_BY_INITIAL_PROBE`

This is not permission to manufacture a nine-path delta. The old remote evidence stores the historical count but not the authoritative filename list. Perform a second, explicitly approved recovery investigation only if useful; otherwise return to fresh Task8 TDD RED and HiGodot authoring from the approved plan.

Do not reconstruct product files through GitHub. Persistent `.gd/.tscn/.tres/.res/project.godot` authoring remains `HIGODOT_ONLY`.

## Parallel work protection

PR #151 remains a separate Draft visual/component workstream and is `DO_NOT_TOUCH`. Probe results from its files, unrelated user files, or other worktrees must not be adopted into Task8 merely because they are modified locally.

## Evidence ceiling

This probe does not verify or promote Task8 implementation, merge, Human, Device, Performance, export, or Full Vertical Slice status. The output is local recovery evidence only. Actual user-machine probe execution remains `NOT_RUN` until output from the user's GRIMOIRE machine is observed.

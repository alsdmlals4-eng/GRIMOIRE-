# GRIMOIRE Task8 Local Recovery Executor Packet — 2026-08-22

```yaml
status: CURRENT_LOCAL_PROBE_OVERLAY
parent_gate: TASK8_PR_PREP_REVERIFY_PENDING
entry_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
historical_packet: TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-21.md
probe: tools/task8_local_recovery_probe.ps1
historical_branch: feat/task8-spell-use-screen-v2
historical_git_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
persistent_godot_authority: HIGODOT_ONLY
parallel_pr_151: DO_NOT_TOUCH
```

This is a narrow current overlay. It does not rewrite the historical 2026-08-21 handoff packet or claim that the local Task8 delta still exists.

## First action

Run the repository-owned read-only probe from a PowerShell process that can see the user's GRIMOIRE checkout:

```powershell
& 'C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-\tools\task8_local_recovery_probe.ps1'
```

The probe reads registered worktrees, the historical worktree path, branch/HEAD, working/cached/untracked path inventories, baseline-to-HEAD local commit evidence, and preferred Spell Use Screen path existence. It emits JSON to stdout and does not create a report file.

## Interpretation

### `LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED`

Preserve the discovered worktree exactly as found. Do not normalize, delete, stage, or rewrite it. Compare the explicit discovered paths against the approved Task8 plan and then continue with exact-project HiGodot 3.1.4 readiness, fresh Task8 GUT, predecessor regression, Hera source-delta NONE, `git diff --check`, and exact-path adversarial review before any Git write.

### `NO_LOCAL_TASK8_EVIDENCE_FOUND_BY_INITIAL_PROBE`

This is not permission to manufacture a nine-path delta. The old remote evidence stores the historical count but not the authoritative filename list. Perform a second, explicitly approved recovery investigation only if useful; otherwise return to fresh Task8 TDD RED and HiGodot authoring from the approved plan.

Do not reconstruct product files through GitHub. Persistent `.gd/.tscn/.tres/.res/project.godot` authoring remains `HIGODOT_ONLY`.

## Parallel work protection

PR #151 remains a separate Draft visual/component workstream and is `DO_NOT_TOUCH`. Probe results from its files, unrelated user files, or other worktrees must not be adopted into Task8 merely because they are modified locally.

## Evidence ceiling

This probe does not verify or promote Task8 implementation, merge, Human, Device, Performance, export, or Full Vertical Slice status. The output is local recovery evidence only.

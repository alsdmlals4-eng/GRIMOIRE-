# Task8 Local Recovery Probe Implementation Plan

**Goal:** Add one read-only PowerShell probe that can discover whether the historical uncommitted Task8 work still exists on the user's GRIMOIRE machine without mutating Git state, product files, or PR #151.

**Authority:**
- project main at plan start: `935da4afe89478d9aff07a85325ef006059e1575`
- Base live main observed: `aadd7aea74cb609d012fc70cc976d4bbcb794e39`
- parent gate: `TASK8_PR_PREP_REVERIFY_PENDING`
- execution subgate: `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`
- historical branch: `feat/task8-spell-use-screen-v2`
- historical Git baseline: `8c611f601aa98397ed1558e92ab207e0e8347a9b`
- historical worktree: `C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-/.worktrees/task8-spell-use-screen-v2/`
- persistent Godot authoring authority: HiGodot only
- PR #151: `DO_NOT_TOUCH`

## TDD

1. Add fail-first `tests/test_task8_local_recovery_probe_contract.py` and wire it to current-state CI.
2. Confirm RED because the probe and packet routing do not exist yet.
3. Add `tools/task8_local_recovery_probe.ps1` with read-only commands only.
4. Update the existing Task8 Local Recovery Executor Packet to route to the probe first.
5. Verify focused current-state CI and all applicable repository CI at exact head.
6. Run five-pass adversarial review for mutation risk, false-negative recovery, evidence inflation, parallel PR overlap, and completion/readback semantics.
7. Merge only after exact-head CI, zero unresolved review threads, stable main, and PR #151 overlap=0.

## Probe contract

The probe may read:

```text
registered worktrees
historical worktree path existence
current branch / HEAD
working diff paths
cached diff paths
untracked paths
baseline..HEAD local-only commit log and path delta
preferred Spell Use Screen file existence
```

It may not execute:

```text
fetch
reset
restore
clean
stash
add
commit
merge
rebase
cherry-pick
checkout
switch
file deletion or report-file writes inside the repository
```

The probe emits JSON to stdout only. It does not decide that Task8 is valid or merged; it only produces the local evidence needed for the next recovery decision.

## Completion boundary

This work unit can complete as an operations/tooling improvement after GitHub merged-main readback and Notion Project Home readback. It cannot close the Task8 product gate because actual local probe execution remains a separate local-machine requirement.

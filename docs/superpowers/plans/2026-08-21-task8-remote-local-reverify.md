# GRIMOIRE Task8 Remote/Local Reverify Plan

> **For agentic workers:** Use the existing project continuation contracts and execute this plan as a docs/test current-state correction. Persistent Task8 Godot authoring remains HiGodot-only.

**Goal:** Close Sync34 post-merge bookkeeping and make the Task8 continuation state unambiguous: `8c611f...` is the Git baseline HEAD under which the accepted Task8 worktree delta existed, not a product commit; the product delta was never staged/committed/pushed and is not present in current remote Task8 branches.

**Architecture:** Preserve Sync21 as historical evidence. Add one current reverify receipt and focused regression, clarify active current-state consumers, and keep the existing parent gate `TASK8_PR_PREP_REVERIFY_PENDING`. Do not reconstruct product `.gd/.tscn` via GitHub.

**Current main:** `026230d3a91687cd4c6df0bb629eabaeb17c767c`

## Constraints

- PR #151 remains `DO_NOT_TOUCH`.
- No `src/**`, `data/**`, `assets/**`, `addons/**`, `project.godot`, Scene or Resource write.
- `feat/task8-spell-use-screen-v2` is not present as a current remote branch.
- All currently discoverable Task8/handoff remote branches have no `src/ui/spell_workflow/spell_use_screen.gd`.
- Commit `8c611f601aa98397ed1558e92ab207e0e8347a9b` is PR #131 HiGodot v3.1.4 authority reconciliation and explicitly contains no protected Task8 product source change.
- Sync21 owns the historical fact that Task8 was `UNMERGED_LOCAL_WORK`, with `NO_STAGE_COMMIT_PUSH_DURING_HANDOFF`.
- Historical local acceptance evidence remains evidence of the then-observed worktree only; it is not proof the delta still exists locally now.

## Task 1 — Focused RED contract

- Create `tests/test_task8_remote_local_reverify.py`.
- Register it in `.github/workflows/validate-current-state-sync.yml`.
- Require the new receipt and active consumer markers.
- Observe RED because the new receipt/current subgate does not exist yet.

## Task 2 — Current reverify receipt and consumer clarification

- Create `docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md`.
- Update Sync34 receipt to merged-main + Notion readback closure.
- Clarify `START_HERE.md`, `docs/ACTIVE_CONTEXT.md`, `docs/DEVELOPMENT_GATES.md`, and `docs/planning/CURRENT_UNRESOLVED_GATES.md` with:
  - `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`
  - `task8_local_git_head_baseline: 8c611f...`
  - `task8_product_commit: NONE`
  - `task8_remote_product_branch: NOT_PRESENT`
  - `task8_remote_product_pr: NONE`
- Preserve `TASK8_PR_PREP_REVERIFY_PENDING` as the parent compatibility gate.

## Task 3 — Exact-head review and merge

- Require current-state workflow and all applicable repository workflows terminal/success.
- Require no product paths changed and no PR #151 overlap.
- Re-read current main and PR #151 before merge.
- Merge with expected-head protection.
- Read back merged main.

## Task 4 — Notion readback

- Update Project Home only after merged main to say local worktree delta recovery is the concrete Task8 blocker.
- Keep visual Work Master unchanged unless its factual state changes.
- Read back destination fields/content.

## Local executor handoff after this plan

A future local executor must recover/inspect, not overwrite:

```text
exact GRIMOIRE local checkout/worktree
→ inspect whether feat/task8-spell-use-screen-v2 or its working-tree delta still exists
→ record HEAD/status/staged/cached/untracked state without reset/restore/clean
→ protect any recovered Task8 nine-path delta
→ exact-project HiGodot 3.1.4 readiness
→ focused Task8 GUT 15/90/0 (fresh)
→ predecessor regression 42/1588/0 (fresh)
→ git diff --check
→ exact-path adversarial review
→ only then stage/commit/push through an allowed local Git boundary
```

If the local delta no longer exists, Task8 must be re-authored from the approved plan through HiGodot with fresh TDD RED/receipt; GitHub text writes must not reconstruct it as a shortcut.

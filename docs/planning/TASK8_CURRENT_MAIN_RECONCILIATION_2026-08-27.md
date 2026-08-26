# Task8 Current-Main Reconciliation Receipt — 2026-08-27

## Scope

- GitHub Issue: #111
- Approved player flow: `글자 → 주문 → 대상 → 시전`
- Commit: `68211069eb3b778fb43e68f3fbd049c8a0ac2733`
- Branch: `codex/task8-spell-use-reconcile-v320-20260827`
- Base: `origin/main@1e8662217e13dbfce6a41749f850db66b000d64b`
- Pull request: #190

The user explicitly authorized product implementation after the preserved historical Task8 candidates had been verified. The historical worktrees remain untouched. This reconciliation was authored in a separate clean worktree through a live Godot AI v3.2.0 editor session.

## Implemented boundary

`SpellUseScreen` is a thin UI consumer of the existing `SpellWorkflowCoordinator` authority.

- Explicit target choice only calls `prepare_target_preview`.
- An invalid target clears the rendered preview and disables commit.
- First commit action calls `request_use_confirmation`.
- Second explicit action forwards the caller-owned opaque use ID to `confirm_use` exactly once.
- Stale, missing, mismatched, or duplicate confirmation fails closed.
- Edit cancels a pending confirmation; cancel emits intent only.
- The screen does not calculate Mana, mutate inventory/results, create use IDs, or auto-select/cast.

## Fresh evidence

| Check | Result |
| --- | --- |
| Live Godot AI v3.2.0 session | ready; current Task8 scene opened and authored |
| Runtime scene | started without task-related errors; all five player-flow nodes visible |
| Custom runner | 45 suites, 1,934 assertions, 0 failures |
| GUT integration | 2 scripts, 2 tests, 9 asserts, all passed |
| Python authority contracts | 13 tests passed |
| Hera exact-worktree diagnostics | clean; 0 errors, 0 warnings; expected 19-node scene tree |
| `git diff --check` for staged Task8 source | passed |

The GUI Godot binary does not expose custom-runner stdout to the shell; the same Godot 4.7.2 console binary produced the recorded runner and GUT results above.

## Still pending

- Exact-head remote CI, PR review, merge, and merged-main readback.
- Human usability, device, performance, export, and full vertical-slice validation remain `NOT_RUN`.

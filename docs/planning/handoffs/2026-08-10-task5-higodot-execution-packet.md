# Task 5 HiGodot Execution Packet — 2026-08-10

## Authority and start readback

```yaml
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
plan: docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md
plan_unit: "Task 5: Stage 3 Atomic Spell Use and v2 Workflow Coordinator"
base_main_observed: 97942d0be7404d52316dec0143041e2971c365f1
task_branch: task5/stage3-atomic-use-coordinator
task_worktree: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-/.worktrees/task5-stage3-atomic-use-coordinator/
required_persistent_authority: HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE
hera_persistent_source_mutation: FORBIDDEN
```

## Scope and boundary

Task 5 adds the sole Stage 3 authority to spend the final Mana and commit one result, plus the v2 state/coordinator boundary. Persistent `.gd` files are authored only through HiGodot. The intended production/test paths are the seven files named by Task 5 in the approved plan and `tests/test_runner.gd` registration; this packet and its final receipt are explicit evidence-only files.

Stage 2 remains immutable: `CircuitPlacementSession`, `SpellPreparationRequest`, and `AtomicSpellPreparationService` must not spend Mana, commit a result, or select a target. Do not modify Hera sources, Task 3 `PreparedSpell` public behavior, legacy `StarCircuitCommitCoordinator`, scenes, or UI.

## Required tests and invariants

- RED first: invalid target and insufficient mana leave a READY spell and all snapshots unchanged; successful use spends only `final_mana`, marks one spell USED, and commits one result; same transaction is idempotent; another transaction cannot reuse the spell; result failure rolls all snapshots back.
- The request and service bind use transaction, READY spell, target keyword, final preview, and result payload without automatic target or commit.
- The state machine accepts only the documented path through `SPELL_USE_CONFIRM`; direct Stage 2→target, target during circuit edit, and pre-confirm mana spend are rejected. Incident overlay restores the exact prior non-resolving state.
- The coordinator uses `StarCircuitCalculator.preview(main, auxiliaries, {})` for the immutable Stage 2 base preview, and only a selected target for Stage 3 final preview.
- Final gates: HiGodot fresh readback/receipt, Task 5 and legacy SceneTree regressions, GUT, exact-head CI, adversarial review, P0/P1 0, and review threads 0 before merge.

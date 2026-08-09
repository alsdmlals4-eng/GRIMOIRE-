# Task 4 HiGodot Execution Packet — 2026-08-10

## Authority and start readback

```yaml
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
plan: docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md
plan_unit: "Task 4: Stage 2 Placement Session and Atomic Glyph Preparation"
base_main_observed: 3a79c8d1aab67813ef6d1c6662f1e460a711613c
base_shared_main_observed: 2a6ced23f6d6de1fb6e0a281c7138beb03f1a13b
task_branch: task4/stage2-placement-atomic-glyph
task_worktree: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-/.worktrees/task4-stage2-placement-atomic-glyph/
higodot_session: task4-stage2-placement-atomic-glyph@e1fc
higodot_version: 3.1.3
required_persistent_authority: HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE
hera_persistent_source_mutation: FORBIDDEN
conflicting_open_implementation_prs: 0
```

Fresh GitHub readback found no open pull request. Open Issue #66 concerns the Base thin-adapter contract and is outside Task 4. The project Google Sheet was re-read: its `GR-S-SPELL-UI-V2` record preserves the three-stage workflow, `FIVE_POINT_STAR`, explicit source choice, Stage 2 base preview, and the separation of glyph consumption from Stage 3 mana/result consumption.

## Scope and non-goals

Task 4 begins after the merged Task 3 immutable `PreparedSpell` / `PreparedSpellInventory` boundary. It must not recreate or change Task 3 behavior except by consuming its public API.

Persistent `.gd` authoring is HiGodot-only. The planned protected delta is limited to:

- `src/core/workflow/circuit_placement_session.gd`
- `src/core/spells/spell_preparation_request.gd`
- `src/core/spells/atomic_spell_preparation_service.gd`
- `tests/unit/test_circuit_placement_session.gd`
- `tests/unit/test_atomic_spell_preparation_service.gd`
- generated `.gd.uid` companions
- `tests/test_runner.gd` suite registration only

Do not modify Hera sources, `project.godot`, scenes, UI, ManaPool, `AtomicResultLedger`, Stage 3 spell-use services, target selection, or unrelated runtime code.

## Preserved rules

- The layout is exactly `FIVE_POINT_STAR`: one Main and zero to five indexed Aux nodes.
- Placement reserves a specific Vault or Typed Stock source immediately. Source selection is explicit; no universal-stock substitution or auto-selection is permitted.
- Replacing a node releases its old reservation before attempting the new one. A failed replacement keeps the original reservation through ledger rollback.
- Reset releases only this session's transaction reservations.
- Stage 2 prepares once: it validates reservations, snapshots ledger and prepared-spell inventory, consumes glyph reservations, writes one immutable READY spell, and rolls both snapshots back on any failure.
- Stage 2 accepts no ManaPool or AtomicResultLedger and must not spend mana or apply any result.
- Retrying the same preparation transaction returns the original preparation result; a conflict or consume failure cannot leave a partial glyph/inventory mutation.

## Mandatory TDD and receipt sequence

1. HiGodot authors the two Task 4 test suites and registers them before any Task 4 production script exists.
2. Record a RED run caused by missing Task 4 production classes, not syntax or unrelated failures.
3. HiGodot authors the minimal three production scripts, each with the required Korean first-line role comment, then reads every artifact back from the active worktree session.
4. Run Task 4 tests plus the legacy custom runner and adopted GUT regression lanes. If the sandbox headless process remains unavailable, record the reproducible signal-11 limitation and retain only evidence actually obtained through the editor/CI.
5. Capture a new receipt containing session/version/path, every artifact including `.uid`, before/after SHA-256, operation/readback evidence, allowed-delta reconciliation, and `HERA_SOURCE_DELTA: NONE`.
6. Require adversarial review, exact-head CI, zero unresolved review threads, and zero P0/P1 blockers before merge. Those conditions authorize merge without a further approval.

## Completion gate

```yaml
TASK4_TDD_RED: RECORDED
TASK4_GREEN: PASS
TASK4_HIGODOT_RECEIPT_READBACK: PASS
LEGACY_REGRESSION: PASS_OR_LIMITATION_RECORDED
GUT_DETERMINISTIC_TASK4_TESTING: PASS_OR_LIMITATION_RECORDED
HERA_SOURCE_DELTA: NONE
EXACT_HEAD_APPLICABLE_CI: PASS
UNRESOLVED_REVIEW_THREADS: 0
P0_P1_BLOCKERS: 0
```

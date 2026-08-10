# Task 7 HiGodot Execution Packet — 2026-08-10

## Authority and start readback

```yaml
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
issue: 109
plan: docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md
plan_unit: "Task 7: Circuit Placement Screen and Equal-count Source Panels"
base_main_observed: 4a9daf0ed8de7bb39173a71e6ada9324d5a462b7
task_branch: task7/circuit-placement-screen
task_worktree: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-/.worktrees/task7-circuit-placement-screen/
required_persistent_authority: HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE
hera_persistent_source_mutation: FORBIDDEN
```

## Scope and boundary

Task 7 adds only the circuit placement presentation layer: reusable glyph cards, equal-count Vault/Stock source panels, one estimated-Mana preview, and the five-point circuit board screen. The screen maps existing placement session data and forwards named user intents without adding transaction authority.

Do not add a target selection control, target keyword control, automatic target or commit, Mana spend, result commit, or pre-commit consumption. Do not rewrite Task 5/6, `CircuitPlacementSession`, `StarCircuitCommitCoordinator`, Hera files, or unrelated canon/environment files.

## Required tests and invariants

- RED first: source panels expose matching 1–5 counts; Main/Aux roles have non-colour cues; `StarCircuitBoard` exists; `TargetSelectionPanel` is absent; estimated Mana occurs exactly once in `SpellPreviewPanel`.
- Board states: `CIRCUIT_EDIT -> EDIT`, `CIRCUIT_PREVIEW -> FINAL`, preparation confirmation -> `CONFIRM`, prepared -> `COMMITTED`, validation failure -> `INVALID`.
- Reset/cancel call `CircuitPlacementSession.reset()`; undo changes only the last changed node; closing the incident overlay never resets the placement session.
- Final gates: fresh HiGodot readback and receipt, Task 7 and relevant legacy Editor regressions, headless/GUT evidence only when actually obtained, protected delta, `HERA_SOURCE_DELTA: NONE`, adversarial review P0/P1 zero, exact-head CI, and zero unresolved review threads before merge.

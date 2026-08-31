# Task 8 HiGodot Execution Packet — 2026-08-10

## Authority and fresh start readback

```yaml
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
issue: 111
plan: docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md
plan_unit: "Task 8: Spell Use Screen, Target Selection, and Expected Result"
base_main_observed: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task_branch: task8/spell-use-screen
task_worktree: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-/.worktrees/task8-spell-use-screen/
required_persistent_authority: HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE
hera_persistent_source_mutation: FORBIDDEN
```

## Player intent and scope

Task 8 is the separate Stage 3 screen: a player chooses a READY prepared spell and an incident target deliberately, views the target-applied final outcome, then makes a second explicit confirmation to use the spell. Target or spell changes invalidate an old preview. The screen is presentation and intent routing only; the existing workflow coordinator remains the transaction authority.

Create only `TargetSelectionPanel`, `ExpectedResultPanel`, `SpellUseScreen`, their scenes, the Task 8 integration test, and test-runner registration. Consume READY spells, incident target nodes, final preview, and current Mana. Emit `spell_selected`, `target_selected`, `preview_requested`, `use_requested`, and `cancel_requested`.

## Invariants and exclusions

- RED scene-contract evidence precedes GREEN implementation.
- Targets start unselected; a changed target invalidates final preview and disables Use until a new coordinator preview exists.
- Expected result shows `success_percent`, `main_effect`, `risks`, `final_mana`, and `target_keyword`.
- Mana appears once in Expected Result and once as distinct current-character MP.
- First Use only opens confirmation; second explicit action calls `confirm_use(use_transaction_id)` once and disables duplicates until a result is rendered.
- `INSUFFICIENT_MANA`, `INVALID_TARGET`, and `SPELL_ALREADY_USED` retain the incident and prepared-spell context, without silent re-selection.
- Do not add a drawing canvas, Vault/Stock placement UI, automatic target/commit, Stage 3 Mana logic, Task 5–7 rewrites, legacy coordinator changes, Hera mutation, or unrelated canon/environment edits.

## Required evidence before merge

Fresh HiGodot session/version/project-path readback; Editor Task 8 and relevant regression evidence; headless/GUT only when actually obtained; an adversarial review with P0/P1 zero; protected-delta verification; `HERA_SOURCE_DELTA: NONE`; fresh authoring receipt; exact-head CI; and zero unresolved GitHub review threads.

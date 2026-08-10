# GR-SYNC-20260811-03 — Task 8 HiGodot Executor Handoff

```yaml
sync_id: GR-SYNC-20260811-03-TASK8-HIGODOT-EXECUTOR-HANDOFF
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
status: DEFERRED_EXTERNAL_EXECUTOR_READY
work_mode: PLAN_TO_BUILD_HANDOFF
contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_decision: GM-CONTRACT-V4-5-BINDING-01
product_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
persistent_godot_authoring: NOT_RUN_IN_CURRENT_CHATGPT_SESSION
current_session_higodot_callable: false
global_terminal_blocker: false
```

## Why this handoff exists

The approved continuous-work contract requires Task 8 to continue without inventing a new user decision. However the current ChatGPT execution environment does not expose the project-authorized HiGodot/Godot AI authoring executor. Because HiGodot is the sole authority for persistent `.gd/.tscn/.tres/.res/project.godot` mutation, GitHub text writes MUST NOT be used as a bypass.

This is a `RECOVERABLE_EXECUTION_ROUTE_BLOCKER` localized to persistent Task 8 authoring. The product task is therefore `DEFERRED_EXTERNAL_EXECUTOR_READY`; independent planning, benchmark, adversarial, and handoff preparation continues.

## Authority to consume

```yaml
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
stage3_authority_source: TASK5_MERGED_MAIN
stage3_merge: 275ba48eb9c07ce24d4b17b2c57de66c98923e1a
task7_latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
circuit_topology: FIVE_POINT_STAR
inventory_semantics: TYPED_GLYPH_STOCK_EXACTLY_ONCE
higodot:
  release: v3.1.3
  authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
gut:
  release: v9.7.1
  authority: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY
hera:
  release: v1.0.0
  authority: LIVE_QA_AND_OBSERVABILITY_ONLY
  persistent_source_mutation: FORBIDDEN
```

## Executor entry sequence

```text
re-read Base current main
→ re-read GRIMOIRE current main/open PR/Sheet
→ re-read Task5 Stage3 code + tests
→ re-read Task6/7 screen implementation + tests
→ derive exact existing interface names
→ HiGodot writes focused GUT RED tests
→ verify intended RED
→ HiGodot authors minimum Task8 screen
→ focused GREEN
→ Spell Workflow regressions
→ fresh HiGodot receipt/readback
→ Hera acceptance with source delta NONE
→ exact-head CI
→ adversarial review
→ merge gate
→ merged-main + Sheet current-state sync
```

## Required player-visible outcome

Task 8 provides the third screen of the already-approved workflow:

```text
prepared spell summary
→ explicit target selection
→ selected target state
→ final cost visibility
→ expected-result preview
→ explicit user confirmation
```

The screen must make the consequence legible before commitment while keeping preview/selection mutation-free.

## Fail-closed boundaries

```text
NO hidden final auto-target
NO Mana spend during preview
NO inventory/result/world mutation during preview
NO duplicated Stage3 transaction code
NO double-confirm/double-spend
NO local rollback policy competing with Task5
NO touch-only semantic action path
NO persistent source mutation by Hera
NO GitHub text-write bypass of HiGodot
NO human/device/performance/export PASS without new evidence
```

## Fresh receipt requirement

The executor must create a fresh Task 8 authoring receipt under the project `artifacts/higodot/` convention. It must cover the exact protected persistent delta and generated `.gd.uid` files when produced. Receipt status must remain UNVERIFIED until exact-head readback compares receipt entries against the actual changed protected files.

## Acceptance design

Minimum deterministic tests are defined in:

`docs/superpowers/plans/2026-08-11-task8-spell-use-screen.md`

They cover no-target fail-closed behavior, mutation-free preview, target changes, explicit confirm, exactly-once/double-confirm protection, stale target failure, cancel/back preservation of existing restore semantics, and shared touch/desktop semantic actions.

## External research absorbed

- Godot `Control` / `Button`: prefer shared GUI focus/action semantics instead of a separate touch-only architecture.
- Godot multiple-resolution guidance: do not hardcode Task 8 in a way that prevents Task 9 from validating approved phone/foldable/tablet aspect classes.
- Android accessibility guidance: interactive controls need physically usable touch targets; map the platform guidance through verified project scaling rather than assuming dp == px.
- Existing project benchmark audit for Noita / Potion Craft / Opus Magnum: preserve player authorship and causal preview; do not add a new crafting mechanic in Task 8.

## Current disposition

```yaml
planning_package: READY
benchmark_pack: READY
adversarial_preflight: READY
persistent_product_authoring: DEFERRED_EXTERNAL_EXECUTOR
new_user_decision_required: false
next_authorized_executor_action: TASK8_TDD_RED_THROUGH_HIGODOT
```

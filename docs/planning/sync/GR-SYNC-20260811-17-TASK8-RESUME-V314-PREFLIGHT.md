# GR-SYNC-20260811-17 — Task 8 Resume / HiGodot v3.1.4 Preflight

```yaml
sync_id: GR-SYNC-20260811-17-TASK8-RESUME-V314-PREFLIGHT
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
status: TASK8_RESUMED_PREFLIGHT_ACTIVE
scope: PRODUCT_EXECUTION_PREFLIGHT_ONLY
product_decision_changed: false
base_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
project_main_observed: 8b3a82576bce2961fe104dc430c2d9c9e0831e06
frostbloom_graybox_dependency: INTERNAL_PACK_PASS
next_product_task: TASK8_SPELL_USE_SCREEN
historical_task8_pr: 116
historical_task8_hold: SUPERSEDED_BY_USER_RESUME_IN_THIS_SYNC
tracked_higodot_before_sync: v3.1.3
user_reported_live_higodot: v3.1.4
official_higodot_v3_1_4_release: VERIFIED
tracked_higodot_v3_1_4: NOT_YET_VERIFIED
persistent_godot_authoring_this_sync: NONE
```

## Resume reason

The user instructed the project to continue and reported that Godot AI is now v3.1.4. This resumes Task 8 at the work-unit/process level. It does not by itself prove that the repository-tracked HiGodot vendor subtree has been reconciled to v3.1.4.

PR #116 remains valuable historical evidence of the paused executor package, but it is based on an older main and v3.1.3 assumptions and must not be merged as-is.

## Fresh prework gate completed

This work unit completed the project-required fresh start gate:

```text
fresh Base current main/structure
→ fresh GRIMOIRE current main/open PR/latest
→ fresh Google Sheet current/work-order/tool rows
→ define Task 8 resume question
→ fresh benchmark + professional/platform research
→ source role/freshness/applicability
→ Existing Solution First
→ disposition
→ adversarial preflight
```

Research receipt:

`docs/planning/research/2026-08-11-task8-resume-v314-research-receipt.md`

Updated execution plan:

`docs/superpowers/plans/2026-08-11-task8-spell-use-screen.md`

## Current authority and conflicts

### No product-authority conflict

Task 8 still implements the approved third screen:

```text
글자 그리기 → 회로 배치 → 주문 사용
```

It remains a consumer of the current Stage 3 authority. No new product decision is introduced.

### Operational/tool-state conflict to reconcile

Current tracked project/Sheet evidence still says:

```yaml
task8: ON_HOLD_USER_REQUEST_COST_DEPENDENCY
higodot: v3.1.3
```

Current user/live information says:

```yaml
task8: RESUME
higodot: v3.1.4
```

Official upstream v3.1.4 is independently verified. The correct disposition is not to overwrite historical v3.1.3 evidence, but to add a new current resume checkpoint and require exact v3.1.4 live/tracked alignment before persistent Task 8 authoring.

## Existing Solution First result

Current main already provides the authority chain Task 8 needs:

```text
SpellWorkflowCoordinator.select_prepared_spell
→ prepare_target_preview
→ request_use_confirmation
→ confirm_use
→ AtomicSpellUseService.use
```

Therefore Task 8 MUST remain a thin UI adapter. New local transaction, Mana, inventory, result, rollback, or save authority is forbidden.

## Research dispositions

```yaml
ADOPT:
  - existing Stage3 coordinator/service authority
  - Godot Control/Button/InputMap semantic input/focus model
  - Base UI intent-only/domain-separation rule
ADAPT:
  - Android minimum touch-target principle through verified project scaling
  - Xbox accessibility focus/navigation/context guidance to GRIMOIRE Windows+Android UI
TEST:
  - actual device/touch ergonomics
  - full aspect/cutout/foldable/tablet matrix under Task9
AVOID:
  - touch-only semantic branch
  - hidden auto-target
  - preview mutation
  - duplicated transaction authority
  - fixed one-aspect layout assumptions
  - unsupported tracked-v3.1.4 PASS claim
REFERENCE_ONLY:
  - competitor presentation/expression
```

## Execution gate

Persistent Task 8 authoring may begin only after a fresh authorized HiGodot readback establishes a trustworthy v3.1.4 authoring state and the vendor/tool-state delta is reconciled or explicitly isolated.

Then execute:

```text
HiGodot v3.1.4 alignment readback
→ focused GUT RED
→ minimum Task8 screen authoring via HiGodot
→ focused GREEN
→ Task5/6/7 + Spell Workflow regressions
→ fresh HiGodot receipt exact-delta readback
→ Hera live acceptance with HERA_SOURCE_DELTA: NONE
→ exact-head CI
→ adversarial review
→ merge gate
→ merged-main + same-ID Sheet synchronization
```

## Evidence boundary

```yaml
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice_runtime: NOT_RUN
export_validation: NOT_RUN
hera_source_mutation: FORBIDDEN
persistent_godot_source_mutation_via_github: FORBIDDEN
```

## Current disposition

```yaml
research_gate: PASS
existing_solution_first: PASS
product_plan: READY_REFRESHED_FOR_V3_1_4
persistent_authoring: BLOCKED_IN_THIS_CHATGPT_SESSION_NO_HIGODOT_EXECUTOR
next_authorized_external_action: HIGODOT_V3_1_4_ALIGNMENT_THEN_TASK8_TDD_RED
```
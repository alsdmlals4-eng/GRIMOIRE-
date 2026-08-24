# Task 8 Spell Use Screen Implementation Plan

> Persistent Godot authoring MUST use the project-authorized HiGodot/Godot AI route. GitHub text writes are not an authoring fallback.

**Decision:** `GM-SPELL-WORKFLOW-UI-V2-01`  
**Historical resume sync:** `GR-SYNC-20260811-17-TASK8-RESUME-V314-PREFLIGHT`  
**Current execution contract:** `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8`  
**Current recovery owner:** `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`  
**Local execution state authority:** `FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED`

The historical preflight project/Base SHAs in older Task 8 receipts remain provenance only. Every resumed work unit must fresh-read current completed Base `main`, current project `main`, live open PRs, and the local executor/worktree before mutation.

**Goal:** Complete `TASK8_SPELL_USE_SCREEN` as the third screen of the approved spell workflow while consuming the existing Stage 3 preview/confirmation/atomic-use authority exactly as-is.

**Architecture:**

```text
prepared spell UI
→ explicit target choice
→ SpellWorkflowCoordinator.prepare_target_preview(...)
→ mutation-free expected result + final Mana display
→ SpellWorkflowCoordinator.request_use_confirmation()
→ explicit confirm
→ SpellWorkflowCoordinator.confirm_use(transaction_id)
→ existing AtomicSpellUseService
```

Task 8 owns presentation and user intent only. It does not own spell-use business rules, Mana spend, inventory consumption, result mutation, rollback, save semantics, or responsive root coordination.

## 0. Current recovery gate and tool alignment

Repository authority currently tracks HiGodot/Godot AI `v3.1.4`, but historical live-readiness receipts do **not** prove that a current local session is attached. Before any protected persistent Task 8 mutation:

1. fresh-read the exact local repository/worktree path, branch, HEAD, staged/cached state, untracked files, and `git status --short`;
2. run the existing read-only Task 8 recovery probe without `reset`, `restore`, `clean`, destructive branch operations, or unrelated process kills;
3. decide from local evidence whether the historical uncommitted Task 8 delta still exists;
4. obtain fresh exact-project HiGodot v3.1.4 readiness before reading or mutating protected `.gd/.tscn` product files;
5. preserve GUT 9.7.1 as deterministic GDScript test authority;
6. preserve Hera 1.0.0 as live QA/observability only with persistent source mutation forbidden;
7. create a fresh Task 8 HiGodot authoring receipt for the exact protected product delta actually used in the current session.

Current gate:

```yaml
current_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
historical_local_branch: feat/task8-spell-use-screen-v2
historical_local_git_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
historical_product_commit: NONE
historical_remote_product_pr: NONE
historical_focused_acceptance: 15_tests_90_assertions_0_failures
historical_predecessor_regression: 42_suites_1588_assertions_0_failures
historical_hera: HERA_SOURCE_DELTA_NONE_OBSERVED
```

Those historical passes prove only the old observed dirty worktree. They are not current completion evidence.

### Recovery fork

**If the local dirty delta still exists:**

- preserve it exactly first;
- fresh-read every Task 8 protected artifact through the current HiGodot session before mutation;
- reconcile it against current `main` rather than replacing it from historical transcript text;
- run fresh current acceptance and only then stage/commit/push.

**If the local dirty delta is gone:**

- do not reconstruct `.gd/.tscn` from GitHub comments, ChatGPT Library transcripts, or general text writes;
- use the approved Task 8 plan and historical transcript only as recovery reference;
- re-author through fresh HiGodot TDD RED → minimum GREEN → receipt/readback → regressions/Hera/CI/adversarial review.

## 1. Exact interfaces and current-main compatibility

### `SpellWorkflowCoordinator`

Use these exact existing Stage 3 entry points:

- `select_prepared_spell(spell_id: StringName) -> bool`
- `prepare_target_preview(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> Dictionary`
- `request_use_confirmation() -> bool`
- `confirm_use(use_transaction_id: StringName) -> Dictionary`

`prepare_target_preview()` owns target validation + preview-plan construction but performs no use commit. `confirm_use()` creates the existing use request and delegates to the existing use service.

### `AtomicSpellUseService`

Existing authority owns:

- validation of prepared spell / target / final Mana;
- Mana spend;
- `mark_used_once`;
- result `commit_once`;
- snapshots and rollback on partial failure;
- prior-result/idempotency handling.

Task 8 MUST NOT duplicate any of these behaviors locally.

### Current-main compatibility receipt

Fresh remote comparison after the v4.8 authority merge found that the core Task 8 Stage 3 owners did not drift from the Task 7 baseline:

```yaml
spell_workflow_coordinator_blob: 4774ff7751d48cabe58619afcb0d82512c05d9d0
spell_workflow_state_blob: 0af9b1b3fc48307ac5990f1b990835c93e2c2ed4
test_spell_workflow_state_blob: 7a76707a9839338c54e8e5b58e67373b2937ac3e
verdict: UNCHANGED_FROM_TASK7_BASELINE
```

`tests/test_runner.gd` did advance because PR #151 added the Component Sheet regression suite. Therefore the historical Task 8 runner copy must **not** replace the current runner.

```yaml
historical_task7_runner_blob: 9fe4006d05983934107f390e4bca476f624580c5
current_runner_blob_at_recovery_preflight: 0c9c4d03a3970700a12d6219708859e1c98a4d33
current_main_headless_baseline: 43_suites_1840_assertions_0_failures
runner_recovery_rule: PRESERVE_CURRENT_COMPONENT_SHEET_SUITE_AND_ADD_TASK8_SUITE
post_task8_suite_count_floor: 44
```

Do not require an old exact assertion count after recovery; require fresh failures `0` and preserve all current suites.

### Task 6/7 UI conventions

Follow the existing `src/ui/spell_workflow/` family:

- `Control` root;
- explicit intent signals / Button semantics;
- reusable component/panel binding;
- supplied state rendered without domain recomputation;
- focus/context restoration where overlays are involved;
- existing test layout under `tests/integration/`.

Task 7 explicitly has no target-selection UI, so target selection remains a Task 8 interaction responsibility.

## 2. Current semantic UI reuse after PR #151

PR #151 added reusable semantic components after the historical Task 8 dirty delta was written. They are presentation primitives, not gameplay authorities.

### ADOPT — current shared primitives

Prefer these current components when recovering/re-authoring the Task 8 screen, provided fresh local readback confirms no behavior regression:

- `ContextTargetSelector`
  - receives supplied target dictionaries;
  - exposes `target_selected(target_id)`;
  - records explicit selected target;
  - does not recommend or auto-pick a target.
- `ForecastCard`
  - receives supplied known improvement, uncertain consequence, success breakdown, and Mana cost;
  - displays the values without calculating Stage 3 outcomes.
- `CommitBar`
  - receives supplied target label, Mana cost, commit eligibility, and confirmation state;
  - emits edit/commit intent only;
  - explicitly reports `owns_transaction: false`.

Component Sheet B already demonstrates the current composition pattern:

```text
ContextTargetSelector
+ spell/circuit presentation
+ CommitBar
```

Task 8 may additionally use `ForecastCard` for the supplied expected-result/Mana preview. The screen remains responsible only for adapting Coordinator output into these presentation contracts.

### ADAPT — historical Task 8 custom panels

If the recovered dirty delta contains historical `TargetSelectionPanel` / `ExpectedResultPanel` scenes/scripts:

1. do **not** delete or rewrite them before fresh HiGodot readback and focused tests;
2. identify whether they contain Task 8-specific focus restoration, error/failure display, accessibility, or stale-preview behavior not provided by the shared primitives;
3. migrate only presentation behavior that has parity coverage;
4. prefer direct shared components or thin Task 8 wrappers after parity is proven;
5. avoid keeping two independent visual-state authorities for the same target/forecast/commit semantics.

### REJECT — shared UI as gameplay authority

Do not let `ContextTargetSelector`, `ForecastCard`, `CommitBar`, or any Task 8 wrapper:

- validate target domain rules;
- recalculate final Mana/success/result;
- spend Mana or consume inventory;
- create/own use transactions;
- implement rollback;
- auto-select the first/nearest/best target.

The existing Coordinator/AtomicUse chain remains the sole business authority.

## 3. Fresh acceptance: recovered delta vs re-authoring RED

Use the current Task 6/7 integration-test conventions. Do not create a replacement framework.

### If recovering an existing dirty delta

Do not manufacture a new “missing screen” RED simply to satisfy ceremony. The old implementation already existed. Instead:

- preserve the recovered state;
- run focused tests against current main and current shared components;
- if a compatibility or semantic-reuse test fails, treat that focused failure as the RED for the required reconciliation;
- use the historical `15 tests / 90 assertions / 0 failures` only as a comparison ceiling, never as current PASS.

### If re-authoring because the delta is gone

Start through HiGodot with focused RED behaviors:

- [ ] opening the Spell Use screen causes zero Mana/inventory/result/world mutation;
- [ ] no selected valid target => confirm unavailable/fail-closed and zero mutation;
- [ ] selecting a valid target calls existing preview authority and updates expected result with zero mutation;
- [ ] changing target deterministically refreshes preview and does not consume the prepared spell;
- [ ] final Mana/cost shown to the player is the supplied Stage 3 final preview value, not locally recalculated;
- [ ] explicit confirmation routes to existing `confirm_use()` exactly once;
- [ ] repeated/double activation cannot spend Mana, consume the spell, or apply a result twice;
- [ ] stale/invalid target at commit fails closed with no partial local transaction;
- [ ] cancel/back before commit preserves current PreparedSpell/workflow semantics and defines no new restore policy;
- [ ] keyboard/gamepad focus activation and touch activation resolve to the same semantic confirm action;
- [ ] visible selected/focused/disabled states do not rely on color alone;
- [ ] long Korean labels and minimum supported layout do not make confirm/cancel/target state ambiguous in the automated structural baseline.

Run the smallest focused GUT command and verify a failure for the intended missing behavior before GREEN implementation.

## 4. Minimum Spell Use Screen through HiGodot

Preferred screen path remains:

```text
src/ui/spell_workflow/spell_use_screen.gd
src/ui/spell_workflow/spell_use_screen.tscn
```

Remote current `main` has no file at those paths, so a recovered local copy is not a partially merged GitHub implementation. Fresh local readback still outranks this remote observation.

Required information hierarchy:

```text
prepared spell summary
→ explicit target choices
→ clearly selected target
→ final Mana / cost
→ expected result / consequence preview
→ explicit confirm
→ cancel / back
```

Required boundaries:

- no hidden final auto-targeting;
- no mutation on open, hover, focus, target browsing, or preview;
- confirm remains unavailable until the existing coordinator reports a confirmable selection;
- target UI passes target keyword/data/payload to the coordinator rather than computing spell outcome itself;
- final confirm delegates to `confirm_use()`; no duplicate use service or UI transaction state machine;
- after successful commit, repeated UI activation is disabled/rejected while navigation/result handling proceeds;
- failure displays the existing status/reason without a local rollback implementation;
- no Task 9 root coordinator or full responsive system is pulled into Task 8.

## 5. Input, focus, accessibility, and layout contract

- **ADOPT — Godot Control/Button/InputMap:** use one semantic action path shared by mouse/touch/keyboard/gamepad instead of a touch-only branch.
- **ADOPT — visible focus:** keyboard/gamepad focus must remain clearly visible and deterministic.
- **ADAPT — Microsoft XAG 107/112/113/114:** predictable navigation/back path, input equivalence, clear focus, and enough context to understand an activation before committing.
- **ADAPT — Android 48dp touch-target principle:** meet physical touch usability through verified project scaling. Do not treat `48dp == 48px` as a universal implementation constant.
- **TEST — responsive/device evidence:** Task 8 must avoid blocking responsive adaptation, but Task 9 remains owner of the full aspect/cutout/foldable/tablet matrix and real device validation.

Implementation rules:

- use `Control` / `Container` ownership rather than fixed-position layout where practical;
- important interactive controls remain inside safe layout regions;
- disabled confirm visibly communicates why it is disabled when that reason is player-relevant;
- selection/focus/disabled state has textual/shape/state support, not color-only meaning;
- cancel/back remains reachable using each declared input family;
- popup/overlay closure restores a meaningful prior focus when applicable.

## 6. HiGodot receipt + deterministic GREEN

- [ ] produce a fresh HiGodot authoring receipt for every protected persistent file changed by the Task 8 current session, including generated `.gd.uid` files only if the current Godot/HiGodot session actually generates and retains them;
- [ ] keep vendor/tool-state delta separate from Task 8 product delta unless an explicitly scoped reconciliation proves both;
- [ ] read back the exact protected delta against the receipt;
- [ ] focused Task 8 GUT tests GREEN with fresh current evidence;
- [ ] existing Task 5 atomic-use + workflow coordinator regressions GREEN;
- [ ] existing Task 6/7 screen regressions GREEN;
- [ ] current Component Sheet regression suite remains present and GREEN;
- [ ] full headless runner is at least `44` suites after Task 8 registration and has `0` failures;
- [ ] applicable repository CI GREEN at exact PR head;
- [ ] Hera acceptance reports `HERA_SOURCE_DELTA: NONE`;
- [ ] human/device/performance/full-slice/export remain `NOT_RUN` unless real new evidence is produced.

Do not use the old `15/90/0`, `42/1588/0`, or any old exact assertion total as a substitute for fresh current tests.

## 7. Adversarial merge review

Attack at minimum:

```text
second target/use authority appeared in UI
preview mutates Mana/inventory/result/world
shared semantic component became a gameplay authority
first/nearest/best target is silently selected or confirmed
UI recalculates final Mana/result instead of displaying coordinator output
historical custom panels and shared primitives both own the same visual state
confirm can double-fire
stale target creates a partial transaction
cancel/back invents competing restore semantics
input paths diverge by device
focus is absent/ambiguous
layout is hardcoded to one aspect and blocks Task9
historical HiGodot readiness was promoted to current readiness
historical dirty runner overwrote the current Component Sheet suite
receipt omits protected/generated files
Hera/test tooling mutates persistent source
human/device/performance claims are promoted without evidence
```

Merge evidence:

```yaml
exact_head_unchanged: true
all_applicable_ci_success: true
focused_task8_gut_green: true
spell_workflow_regression_green: true
component_sheet_regression_preserved: true
full_headless_suite_count_floor: 44
full_headless_failures: 0
higodot_v314_current_readiness: PASS
higodot_task8_fresh_receipt_readback: PASS
hera_source_delta: NONE
unresolved_review_threads: 0
P0: 0
P1: 0
product_decision_changed: false
```

## 8. Post-merge synchronization under v4.8

After product implementation is actually merged:

- re-read merged `main`;
- promote Task 8 to merged only from merged-main evidence;
- set Task 9 next only after that readback;
- synchronize repository current canon and bounded `NOTION_HUMAN_FACING_CANON` / system work-state surfaces with the same Task 8 implementation sync/checkpoint ID;
- keep Google Sheets `MIGRATION_ONLY_UNTIL_REMOVAL` and perform **no new canonical Sheet write**;
- preserve historical Task 8 hold/acceptance/tool evidence rather than rewriting history;
- keep unsupported human/device/performance/export/full-slice statuses unchanged;
- run stale-consumer and adversarial readback.

```yaml
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
google_sheet_new_canon_write: FORBIDDEN
```

## 9. Current execution router

This plan does not pin one ChatGPT/Codex/PowerShell session as permanent authority. Every resumed execution must fresh-read capability first.

```text
FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
→ read-only Task8 recovery probe
→ local dirty delta exists?
   ├─ yes: preserve → fresh HiGodot readback → reconcile current main/semantic UI/runner → fresh tests
   └─ no: fresh HiGodot TDD RED → re-author minimum screen → fresh tests
→ exact protected-delta HiGodot receipt/readback
→ focused GUT + current full runner (>=44 suites, 0 failures)
→ Hera source-delta NONE
→ exact-head CI + review threads 0 + adversarial P0/P1 0
→ normal Task8 PR merge
→ merged-main readback
→ bounded Notion/repository sync
→ Task9 continuation
```

If the required HiGodot/local authority is not exposed to the current executor, do not bypass it. Produce or refresh an executor-ready recovery checkpoint and defer only the blocked persistent product step.

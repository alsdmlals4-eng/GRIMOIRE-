# Task 8 Spell Use Screen Implementation Plan

> Persistent Godot authoring MUST use the project-authorized HiGodot/Godot AI route. GitHub text writes are not an authoring fallback.

**Decision:** `GM-SPELL-WORKFLOW-UI-V2-01`  
**Historical resume sync:** `GR-SYNC-20260811-17-TASK8-RESUME-V314-PREFLIGHT`  
**Current execution contract:** `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8`  
**Current recovery owner:** `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`  
**Local execution authority:** `FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED`

Historical Task 8 project/Base SHAs and old local test results are provenance only. Every resumed work unit must fresh-read current completed Base `main`, current project `main`, live open PRs, the current test runner, and the exact local worktree before persistent product mutation.

## 1. Goal and immutable gameplay authority

Complete `TASK8_SPELL_USE_SCREEN` as the third screen of the approved spell workflow while consuming the existing Stage 3 authority exactly as-is.

```text
prepared spell UI
→ explicit target choice
→ SpellWorkflowCoordinator.prepare_target_preview(...)
→ supplied final preview / Mana display
→ SpellWorkflowCoordinator.request_use_confirmation()
→ second explicit player confirmation
→ SpellWorkflowCoordinator.confirm_use(caller_supplied_spell_use_id)
→ existing AtomicSpellUseService
```

Task 8 owns presentation and player intent only. It does not own target validation, success calculation, Mana spend, prepared-spell consumption, result mutation, rollback, save semantics, or the full responsive Product Root.

The current `SpellWorkflowCoordinator` entry points remain:

- `select_prepared_spell(spell_id: StringName) -> bool`
- `prepare_target_preview(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> Dictionary`
- `request_use_confirmation() -> bool`
- `confirm_use(use_transaction_id: StringName) -> Dictionary`

`request_use_confirmation()` only advances the existing workflow state. `confirm_use(...)` consumes a caller-supplied game spell-use request id and delegates to the existing use service. Task 8 must not create a second use-service or a second spell-use state machine.

## 2. Current recovery gate

The first persistent step is **not** automatic re-authoring. It is local-delta recovery.

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

Those old passes prove only the historical dirty worktree that was observed then. They are not current PASS evidence.

### Fresh local sequence

1. Read exact repository/worktree path, branch, HEAD, staged/cached state, untracked files, and `git status --short`.
2. Run the existing read-only Task 8 recovery probe.
3. Do not use `reset`, `restore`, `clean`, destructive branch operations, or unrelated process kills during discovery.
4. Decide from local evidence whether the old Task 8 dirty delta still exists.
5. Attach a fresh exact-project HiGodot v3.1.4 session before reading or mutating protected `.gd/.tscn` product files.
6. Produce a fresh HiGodot authoring receipt for the exact protected files used by the current session.

### If the dirty delta exists

- preserve it before mutation;
- fresh-read all Task 8 product artifacts through HiGodot;
- reconcile them against current `main` rather than replacing them from a transcript or old patch;
- run fresh current tests;
- stage/commit/push only after fresh acceptance.

### If the dirty delta is gone

- do not rebuild `.gd/.tscn` from GitHub comments, ChatGPT Library transcript text, or general text writes;
- use the historical transcript only as recovery reference;
- re-author through fresh HiGodot TDD RED → minimum GREEN → receipt/readback → regressions/Hera/CI/adversarial review.

## 3. Current-main compatibility receipt

Fresh remote comparison after the v4.8 authority merge found that the core Stage 3 owners used by Task 8 did not drift from the Task 7 baseline:

```yaml
spell_workflow_coordinator_blob: 4774ff7751d48cabe58619afcb0d82512c05d9d0
spell_workflow_state_blob: 0af9b1b3fc48307ac5990f1b990835c93e2c2ed4
test_spell_workflow_state_blob: 7a76707a9839338c54e8e5b58e67373b2937ac3e
verdict: UNCHANGED_FROM_TASK7_BASELINE
```

The test runner **did** advance after the historical Task 8 work because PR #151 added the Component Sheet suite.

```yaml
historical_task7_runner_blob: 9fe4006d05983934107f390e4bca476f624580c5
current_runner_blob_at_recovery_preflight: 0c9c4d03a3970700a12d6219708859e1c98a4d33
current_observed_full_runner: 43_suites_1840_assertions_0_failures
runner_recovery_rule: PRESERVE_ALL_FRESH_CURRENT_SUITES_AND_ADD_TASK8_SUITE
post_task8_suite_rule: CURRENT_RUNNER_SUITE_COUNT_PLUS_ONE
current_observed_post_task8_floor: 44
```

`43 → 44` is only the current observed floor. At actual Task 8 execution time, fresh-read the current runner and require **fresh current suite count + Task 8**, with every pre-existing suite still registered and failures `0`. Never replace `tests/test_runner.gd` with the historical dirty copy.

## 4. Current semantic UI reuse after PR #151

PR #151 added reusable presentation components after the historical Task 8 delta was written. They should reduce duplicated UI code, but they do not own gameplay rules.

### ADOPT — `ContextTargetSelector`

Use `ContextTargetSelector` as the preferred current target-choice primitive when fresh recovered tests allow it.

It accepts supplied `{id, label, hint}` rows, emits `target_selected(target_id)`, preserves explicit selection, and does not recommend or auto-pick a target.

Task 8 must keep the authoritative supplied target record keyed by the component id. A target keyword may be adapted into that id, but label/hint text must never be parsed back into gameplay data. When the selector emits an id, Task 8 resolves the original supplied record and passes its exact keyword/data/payload to `prepare_target_preview(...)`.

### ADOPT — `CommitBar` as player-intent UI only

`CommitBar` exposes edit/commit intent and reports `owns_transaction: false`. For Task 8, the game-specific rule is:

```yaml
spell_use_id_policy: SPELL_USE_ID_CALLER_SUPPLIED_ONLY
commit_bar_gameplay_ownership: NONE
spell_use_screen_id_generation: FORBIDDEN
```

The historical Task 8 implementation already used the compatible two-step behavior: the spell-use request id was supplied by its caller, the first Use action opened confirmation only, and the second explicit action emitted that same opaque game id once while duplicate input was locked.

Current adaptation rule:

1. First commit intent with a valid final preview calls the existing `request_use_confirmation()` authority and does not use the spell.
2. Only when that authority accepts may the UI show the explicit confirmation state.
3. Second explicit commit intent may pass the already caller-supplied spell-use request id to the existing `confirm_use(...)` path exactly once.
4. Task 8 and `CommitBar` do not create, derive, recycle, or infer a spell-use request id.
5. In-flight locking stays active until success/failure rendering restores the appropriate UI state.

### ADAPT — `ForecastCard` only with authoritative semantic fields

`ForecastCard` is not a mandatory direct replacement for the historical `ExpectedResultPanel`.

Current `StarCircuitCalculator.preview()` guarantees values such as `success_percent`, `success_label`, `final_mana`, and `target_keyword`. It does **not** guarantee `ForecastCard`'s semantic text fields such as known improvement or uncertain consequence.

```yaml
forecast_reuse_policy: FORECAST_SEMANTICS_SOURCE_REQUIRED
forecast_semantic_invention: FORBIDDEN
```

Use `ForecastCard` only if an authoritative current target/context/payload/preview owner explicitly supplies the semantic text and any breakdown rows needed by that component. Do not invent those meanings from success percentage, target hints, labels, or UI guesses.

If the recovered `ExpectedResultPanel` only renders authoritative raw preview/effect/risk/Mana fields and there is no authoritative source for ForecastCard semantics, keep it as a thin Task 8 presentation panel or adapt it to shared theme primitives rather than forcing ForecastCard.

### Historical custom-panel migration

If the recovered dirty delta contains `TargetSelectionPanel` / `ExpectedResultPanel`:

1. fresh-read them through HiGodot before change;
2. preserve any Task 8-specific focus restoration, failure display, stale-preview invalidation, accessibility, or duplicate-fire handling until parity tests exist;
3. migrate presentation behavior only after parity coverage;
4. prefer shared primitives or thin Task 8 wrappers after parity is proven;
5. do not keep two independent visual-state owners for the same target/forecast/commit semantics.

### Shared component rejection rules

`ContextTargetSelector`, `ForecastCard`, `CommitBar`, and Task 8 wrappers must never:

- validate gameplay target rules;
- recalculate final Mana/success/result;
- invent forecast meaning not supplied by an authority;
- spend Mana or consume inventory;
- create/own spell-use requests;
- implement rollback;
- auto-select first/nearest/best target.

## 5. Fresh acceptance behavior

Use the existing Task 6/7 integration-test family.

### Recovered dirty delta path

Do not manufacture a “screen missing” RED when the implementation already exists locally. Preserve it, run focused current tests, and use any current compatibility/semantic-reuse failure as the RED for the required reconciliation.

### Re-author path when the delta is gone

Start through HiGodot with focused RED coverage for:

- opening screen causes zero Mana/inventory/result/world mutation;
- no valid selected target => confirm unavailable/fail-closed;
- explicit target selection calls existing preview authority;
- target change invalidates stale preview;
- shown Mana/success/result values come from supplied authority output, not local recalculation;
- forecast/effect/risk text appears only when an authority supplied it;
- first commit intent requests confirmation and does not use the spell;
- second explicit confirmation passes the caller-supplied spell-use request id exactly once;
- repeated activation cannot spend/use/apply twice;
- stale/invalid target fails closed without partial local mutation;
- failure rendering clears stale success visuals and restores allowed input;
- cancel/back creates no competing rollback policy;
- touch/mouse/keyboard/gamepad share one semantic activation path;
- focus/selection/disabled state is not color-only;
- long Korean labels and minimum structural layout remain unambiguous in automated baseline.

## 6. Minimum screen boundary

Preferred screen paths remain:

```text
src/ui/spell_workflow/spell_use_screen.gd
src/ui/spell_workflow/spell_use_screen.tscn
```

Remote current `main` has no files at those paths, so a recovered local copy is not a partially merged remote implementation. Fresh local readback still outranks this remote observation.

Information hierarchy:

```text
prepared spell summary
→ explicit target choices
→ selected target
→ final Mana / success
→ expected result/consequence only when authoritatively supplied
→ explicit confirmation boundary
→ cancel / back
```

No Task 9 full Product Root or full responsive matrix is pulled into Task 8.

## 7. Input, focus, accessibility, and layout

- Use `Control` / `Container` ownership rather than fixed-position layout where practical.
- Keep important controls inside safe layout regions.
- Mouse/touch/keyboard/gamepad must resolve to the same semantic actions.
- Focus must be visible and deterministic.
- Disabled confirm should expose a player-relevant reason where appropriate.
- Selection/focus/disabled states need text/shape/state support, not color-only meaning.
- Cancel/back remains reachable for declared input families.
- Overlay/popup closure restores meaningful prior focus where applicable.
- Task 9 remains owner of full aspect/cutout/foldable/tablet and real-device validation.

## 8. Fresh evidence gate before Task 8 merge

Required current evidence:

- fresh exact-project HiGodot v3.1.4 readiness;
- fresh HiGodot authoring receipt/readback for every protected file actually changed;
- focused Task 8 GUT GREEN;
- Task 5 atomic-use + workflow coordinator regressions GREEN;
- Task 6/7 screen regressions GREEN;
- all fresh pre-existing full-runner suites preserved;
- Task 8 suite added without overwriting later runner additions;
- full runner satisfies `CURRENT_RUNNER_SUITE_COUNT_PLUS_ONE` and failures `0`;
- exact-head applicable repository CI GREEN;
- Hera `HERA_SOURCE_DELTA: NONE`;
- unresolved review threads `0`;
- adversarial review `P0=0`, `P1=0`;
- Human/Device/Performance/Full Slice/export remain `NOT_RUN` unless new real evidence is produced.

Do not substitute historical `15/90/0`, `42/1588/0`, `43/1840/0`, or any old exact assertion total for fresh current evidence.

## 9. Adversarial merge review

Attack at minimum:

```text
second target/use gameplay authority appeared in UI
preview mutates Mana/inventory/result/world
shared semantic component became gameplay authority
first/nearest/best target is silently selected or confirmed
UI recalculates final Mana/result
ForecastCard invents semantic text not supplied by current authority
CommitBar or Task8 invents a spell-use request id
first commit skips request_use_confirmation
historical custom panels and shared primitives both own the same visual state
confirm can fire twice
stale target creates partial use
failure leaves stale preview/result visible
cancel/back invents rollback semantics
input paths diverge by device
focus is absent/ambiguous
historical HiGodot readiness is treated as current readiness
historical runner overwrites current suites
receipt omits protected/generated files
Hera/test tooling mutates persistent source
unsupported Human/Device/Performance claims are promoted
```

## 10. Post-merge synchronization under v4.8

After Task 8 product implementation is actually merged:

- re-read merged `main`;
- promote Task 8 to merged only from merged-main evidence;
- set Task 9 next only after that readback;
- synchronize repository current canon and bounded `NOTION_HUMAN_FACING_CANON` / system work-state surfaces with the same Task 8 implementation checkpoint id;
- keep Google Sheets `MIGRATION_ONLY_UNTIL_REMOVAL` and perform no new canonical Sheet write;
- preserve historical Task 8/tool evidence instead of rewriting history;
- keep Human/Device/Performance/Full Slice/export limits unchanged unless independently verified;
- run stale-consumer and adversarial readback.

```yaml
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
google_sheet_new_canon_write: FORBIDDEN
```

## 11. Current execution router

```text
FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
→ fresh current runner count + local worktree identity
→ read-only Task8 recovery probe
→ local dirty delta exists?
   ├─ yes: preserve → fresh HiGodot readback → reconcile current main/shared UI/runner → fresh tests
   └─ no: fresh HiGodot TDD RED → re-author minimum screen → fresh tests
→ exact protected-delta HiGodot receipt/readback
→ focused GUT + full runner (fresh current suite count + Task8, failures 0)
→ Hera source-delta NONE
→ exact-head CI + review threads 0 + adversarial P0/P1 0
→ normal Task8 PR merge
→ merged-main readback
→ bounded Notion/repository sync
→ Task9 continuation
```

If the required local HiGodot authority is not exposed to the current executor, do not bypass it. Refresh the executor-ready recovery checkpoint and defer only the blocked persistent product step.

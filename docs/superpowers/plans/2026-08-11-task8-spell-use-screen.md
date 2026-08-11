# Task 8 Spell Use Screen Implementation Plan

> Persistent Godot authoring MUST use the project-authorized HiGodot/Godot AI route. GitHub text writes are not an authoring fallback.

**Decision:** `GM-SPELL-WORKFLOW-UI-V2-01`  
**Resume sync:** `GR-SYNC-20260811-17-TASK8-RESUME-V314-PREFLIGHT`  
**Current project main at preflight:** `8b3a82576bce2961fe104dc430c2d9c9e0831e06`  
**Current Base main at preflight:** `315c66eea9614c284b9c11c4d522141065dfa4b0`

**Goal:** Implement `TASK8_SPELL_USE_SCREEN` as the third screen of the approved spell workflow while consuming the existing Stage 3 preview/confirmation/atomic-use authority exactly as-is.

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

## 0. Preconditions and tool alignment

Current tracked project evidence says HiGodot v3.1.3. The user reports the live Godot AI environment is now v3.1.4, and official upstream v3.1.4 has been verified. Before any new protected persistent Task 8 source mutation:

- [ ] obtain fresh live readback that the authoring executor reports v3.1.4 and is ready for this project;
- [ ] compare/reconcile the project-tracked `addons/godot_ai` state with the intended v3.1.4 tool state, or explicitly isolate a vendor-only delta before Task 8 product authoring;
- [ ] do not label tracked vendor v3.1.4 `PASS` solely from the user report or upstream release existence;
- [ ] preserve GUT 9.7.1 as deterministic GDScript test authority;
- [ ] preserve Hera 1.0.0 as live QA/observability only with persistent source mutation forbidden;
- [ ] create a fresh Task 8 HiGodot authoring receipt for the exact protected product delta.

If v3.1.4 alignment cannot be evidenced, persistent Task 8 authoring is `BLOCKED_UNVERIFIED`; planning/tests/handoff may continue, but GitHub writes must not bypass HiGodot.

## 1. Exact interfaces to consume

Recovered from current main before authoring:

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

### Task 6/7 UI conventions

Follow the existing `src/ui/spell_workflow/` family:

- `Control` root;
- explicit intent signals / Button semantics;
- reusable component/panel binding;
- supplied state rendered without domain recomputation;
- focus/context restoration where overlays are involved;
- existing test layout under `tests/integration/`.

Task 7 explicitly has no `TargetSelectionPanel`/`TargetButton`, so target selection belongs first to Task 8.

## 2. TDD RED through HiGodot

Use the exact current Task 6/7 integration-test conventions. Expected new test surface should remain under the existing spell-workflow UI test family; do not create a replacement framework.

RED behaviors:

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

Run the smallest focused GUT command and verify the tests fail for the intended missing Task 8 screen behavior before GREEN implementation.

## 3. Minimum Spell Use Screen through HiGodot

Preferred path follows current family:

```text
src/ui/spell_workflow/spell_use_screen.gd
src/ui/spell_workflow/spell_use_screen.tscn
```

Only use these names if fresh authoring readback confirms no current conflicting path or newer convention.

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

## 4. Input, focus, accessibility, and layout contract

Fresh benchmark disposition:

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

## 5. HiGodot receipt + deterministic GREEN

- [ ] produce a fresh HiGodot authoring receipt for every protected persistent file changed by the Task 8 authoring session, including generated `.gd.uid` files if created;
- [ ] keep vendor/tool-state delta separate from Task 8 product delta unless an explicitly scoped reconciliation proves both;
- [ ] read back the exact protected delta against the receipt;
- [ ] focused Task 8 GUT tests GREEN;
- [ ] existing Task 5 atomic-use + workflow coordinator regressions GREEN;
- [ ] existing Task 6/7 screen regressions GREEN;
- [ ] applicable repository CI GREEN at exact PR head;
- [ ] Hera acceptance reports `HERA_SOURCE_DELTA: NONE`;
- [ ] human/device/performance/full-slice/export remain `NOT_RUN` unless real new evidence is produced.

## 6. Adversarial merge review

Attack at minimum:

```text
second target/use authority appeared in UI
preview mutates Mana/inventory/result/world
first/nearest target is silently selected or confirmed
UI recalculates final Mana/result instead of displaying coordinator output
confirm can double-fire
stale target creates a partial transaction
cancel/back invents competing restore semantics
input paths diverge by device
focus is absent/ambiguous
layout is hardcoded to one aspect and blocks Task9
v3.1.4 user report was promoted to tracked-vendor PASS without evidence
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
higodot_v314_alignment: PASS_OR_EXPLICITLY_ISOLATED_VENDOR_DELTA
higodot_task8_fresh_receipt_readback: PASS
hera_source_delta: NONE
unresolved_review_threads: 0
P0: 0
P1: 0
product_decision_changed: false
```

## 7. Post-merge synchronization

After product implementation is actually merged:

- re-read merged `main`;
- promote Task 8 to merged only from merged-main evidence;
- set Task 9 next only after that readback;
- synchronize GitHub canon + Google Sheet using `GM-SPELL-WORKFLOW-UI-V2-01` and the same Task 8 implementation sync/checkpoint ID;
- preserve historical Task 8 hold and v3.1.3 audit evidence rather than rewriting history;
- keep unsupported human/device/performance/export/full-slice statuses unchanged;
- run stale-consumer and adversarial readback.

## 8. Current execution boundary

This ChatGPT session has completed fresh authority reads, current-interface recovery, and fresh benchmark/professional research. It does not expose the authorized HiGodot authoring executor, so it must stop before persistent Task 8 `.gd/.tscn/.tres/.res/project.godot` mutation.

The next persistent action is:

```text
HiGodot v3.1.4 live/tracked alignment readback
→ Task 8 focused GUT RED
→ minimum Spell Use Screen GREEN
→ receipt/readback
→ regressions/Hera/CI/adversarial
```
# Task8 Spell Use Reconciliation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Recover the approved Task8 target-and-cast screen as a thin player-facing consumer of the current `SpellWorkflowCoordinator` authority.

**Architecture:** `SpellUseScreen` owns only rendering, explicit player intent, focus order, and stale-preview clearing. It delegates prepared-spell selection, target preview, confirmation gating, and exactly-once use to `SpellWorkflowCoordinator`; `ContextTargetSelector` and `CommitBar` provide the current shared presentation primitives. The historical primary candidate is reference evidence only: every persistent `.gd`/`.tscn` artifact is newly authored through the exact connected Godot editor after a focused failing test.

**Tech Stack:** Godot 4.7.2, GDScript, GUT 9.7.1, Godot AI editor bridge, Hera read-only QA, the project headless runner.

**Spec:** `docs/planning/TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-24.md`, GitHub Issue #111, `docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md`

## Global Constraints

- Current product flow is `글자 → 주문 → 대상 → 시전`; Task8 implements only the target-and-cast portion.
- Preserve `SpellWorkflowCoordinator` and existing atomic-use services as the sole gameplay authority.
- No automatic target selection, automatic cast, new transaction/use ID, Mana/inventory/result mutation, rollback, or Stage2 rewrite.
- The caller supplies the opaque `use_transaction_id`; the screen must fail closed when it is absent.
- Target changes or invalid targets clear stale preview truth and disable confirmation.
- First explicit action requests confirmation; the second calls `confirm_use(use_transaction_id)` exactly once; failures retain context.
- Use `ContextTargetSelector` after behavior parity is tested and `CommitBar` only as player-intent UI. Do not use `ForecastCard` unless the current authoritative payload supplies each semantic field it displays.
- New GDScript starts with a Korean role header comment. Persistent `.gd` and `.tscn` writes use the exact connected Godot editor only.
- Preserve all current runner suites and add exactly one Task8 suite. No IMG-02 environment asset binding is in this task.
- Human, device, performance, export, and full vertical-slice validation remain `NOT_RUN` unless actually run.

---

## File Structure

- `src/ui/spell_workflow/spell_use_screen.gd` — thin Task8 UI controller; no gameplay mutation authority.
- `src/ui/spell_workflow/spell_use_screen.tscn` — responsive composition using current shared target/commit components and a thin result panel.
- `tests/gut/integration/test_spell_use_screen.gd` — focused GUT behavior and accessibility regression contract.
- `tests/integration/test_spell_use_screen.gd` — runner-compatible integration contract, kept deliberately thin and behavior-identical to the focused GUT cases.
- `tests/test_runner.gd` — registers only the runner-compatible Task8 suite in addition to every existing suite.
- `docs/planning/TASK8_*` — bounded implementation receipt and status correction after verified work only.

### Task 1: Establish the focused red contract

**Files:**
- Create: `tests/gut/integration/test_spell_use_screen.gd`
- Create: `tests/integration/test_spell_use_screen.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `SpellWorkflowCoordinator.select_prepared_spell(spell_id) -> bool`, `prepare_target_preview(target_keyword, target, payload) -> Dictionary`, `request_use_confirmation() -> bool`, and `confirm_use(use_transaction_id) -> Dictionary`.
- Produces: tests requiring explicit target choice, stale-preview invalidation, two-stage caller-supplied confirmation, failure-context retention, and logical focus order.

- [ ] **Step 1: Create one failing test for explicit target preview.**

```gdscript
func test_target_choice_requires_coordinator_preview_before_commit() -> void:
    var screen := _configured_screen(&"use-opaque-1")
    assert_false(screen.can_confirm())
    screen.select_target(&"incident.root", _valid_target(), _payload())
    assert_eq(screen.current_preview()["status"], &"FINAL_PREVIEW_READY")
    assert_true(screen.can_confirm())
```

- [ ] **Step 2: Run the focused suite through the connected editor and confirm it fails because `SpellUseScreen` is absent.**

Expected: a load/instantiate failure naming `res://src/ui/spell_workflow/spell_use_screen.gd`, not an unrelated project error.

- [ ] **Step 3: Add the remaining red tests before production code.**

```gdscript
func test_invalid_target_clears_previous_preview_and_blocks_commit() -> void:
    # A valid preview followed by INVALID_TARGET leaves no selectable preview.

func test_first_commit_requests_confirmation_and_second_uses_caller_id_once() -> void:
    # `confirm_use` receives &"use-opaque-1" exactly once.

func test_empty_transaction_id_fails_closed_without_commit() -> void:
    # A missing caller-supplied ID cannot reach gameplay authority.

func test_cancel_retains_context_and_emits_only_cancellation_intent() -> void:
    # No Mana, inventory, or rollback behavior occurs in the screen.
```

- [ ] **Step 4: Create the runner-compatible integration suite before production code and register it after the existing Task7 workflow suites.**

```gdscript
"res://tests/integration/test_spell_use_screen.gd",
```

- [ ] **Step 5: Re-run the focused GUT suite and the current project runner; record the expected RED result for the absent Spell Use screen.**

### Task 2: Re-author the minimal thin UI controller

**Files:**
- Create: `src/ui/spell_workflow/spell_use_screen.gd`

**Interfaces:**
- Consumes: caller-owned coordinator and `use_transaction_id` via `configure(coordinator, use_transaction_id)`.
- Produces: `render_prepared_spell_summary(summary)`, `set_target_choices(target_choices)`, `select_target(target_keyword, target, payload)`, `current_preview()`, `request_confirmation()`, `confirm(transaction_id)`, and `cancel()`.

- [ ] **Step 1: Write only the smallest GDScript that lets the first red test instantiate the screen.**

```gdscript
# 주문 쓰기 화면은 기존 Coordinator의 대상·시전 권한을 표시하고 의도만 전달한다.
class_name SpellUseScreen
extends Control

signal cancel_requested

var _coordinator = null
var _use_transaction_id: StringName = &""
var _current_preview: Dictionary = {}
var _confirmation_requested := false
var _committed := false
```

- [ ] **Step 2: Implement `select_target` by calling only `prepare_target_preview`.**

```gdscript
func select_target(target_keyword: StringName, target: Dictionary, payload: Dictionary) -> Dictionary:
    _current_preview = _coordinator.prepare_target_preview(target_keyword, target, payload)
    if StringName(_current_preview.get("status", &"")) != &"FINAL_PREVIEW_READY":
        _clear_preview_for_failed_target(StringName(_current_preview.get("status", &"INVALID_TARGET")))
    return current_preview()
```

- [ ] **Step 3: Run the focused suite and confirm the target-preview test passes while unimplemented confirmation tests still fail.**

- [ ] **Step 4: Implement confirmation as the two explicit coordinator calls.**

```gdscript
func request_confirmation() -> bool:
    if _current_preview.is_empty() or _committed:
        return false
    _confirmation_requested = _coordinator.request_use_confirmation()
    return _confirmation_requested

func confirm(transaction_id: StringName) -> Dictionary:
    if transaction_id.is_empty() or transaction_id != _use_transaction_id or not _confirmation_requested or _committed:
        return {"status": &"USE_CONFIRMATION_REQUIRED"}
    var result := _coordinator.confirm_use(transaction_id)
    if StringName(result.get("status", &"")) == &"USED":
        _committed = true
    return result
```

- [ ] **Step 5: Run the focused suite and confirm every Task8 behavior test passes.**

### Task 3: Compose the current shared UI scene

**Files:**
- Create: `src/ui/spell_workflow/spell_use_screen.tscn`
- Modify: `src/ui/spell_workflow/spell_use_screen.gd`

**Interfaces:**
- Consumes: `ContextTargetSelector.target_selected(target_id)` and `CommitBar.edit_requested`/`commit_requested`.
- Produces: a keyboard-accessible summary → target choice → final preview → confirmation/cancel hierarchy.

- [ ] **Step 1: Extend the red test to assert scene nodes and focus order.**

```gdscript
func test_information_hierarchy_orders_summary_choices_preview_confirm_and_cancel() -> void:
    assert_eq(_screen.focus_order(), ["PreparedSpellSummary", "TargetSelector", "FinalPreview", "CommitBar", "CancelButton"])
```

- [ ] **Step 2: Create the scene through the connected Godot editor using current shared component scenes.**

```text
SpellUseScreen (Control)
└── Content (VBoxContainer)
    ├── PreparedSpellSummary (Label)
    ├── TargetSelector (ContextTargetSelector instance)
    ├── FinalPreview (VBoxContainer with authoritative values only)
    ├── CommitBar (CommitBar instance)
    └── CancelButton (Button)
```

- [ ] **Step 3: Bind component signals to player-intent methods; never call services directly from component callbacks.**

- [ ] **Step 4: Re-run focused Task8 tests and the current Task6/Task7 workflow screen tests.**

### Task 4: Reconcile regression coverage and evidence

**Files:**
- Modify: `docs/planning/TASK8_*` only after exact evidence exists.

**Interfaces:**
- Consumes: focused Task8 suite, coordinator/atomic-use suites, current full runner, Godot editor diagnostics, and Hera read-only output.
- Produces: truthful task evidence without promoting unrun human/device/performance/full-slice gates.

- [ ] **Step 1: Run exact connected-editor Task8 tests and record counts/failures.**
- [ ] **Step 2: Run coordinator, state, and atomic spell-use predecessor regressions.**
- [ ] **Step 3: Run `tests/test_runner.gd` once after all final edits and require the added Task8 suite plus every existing suite.**
- [ ] **Step 4: Use Hera only for editor/runtime diagnostics, source-delta observation, and UI smoke evidence; do not use Hera for persistent writes.**
- [ ] **Step 5: Run `git diff --check`, exact-path adversarial review, and protected historical-worktree unchanged checks.**
- [ ] **Step 6: Update the GitHub Issue #111 checkpoint and Notion/repository documentation with only verified results.**

### Task 5: Integrate only after review gates pass

**Files:**
- Modify: reviewed Task8 files and bounded evidence docs only.

- [ ] **Step 1: Run the verification-before-completion checklist and inspect the complete diff against Issue #111.**
- [ ] **Step 2: Commit the current reconciliation branch with the focused product and evidence changes.**
- [ ] **Step 3: Push and open a Task8 product PR; verify exact-head CI and unresolved review threads before merge.**
- [ ] **Step 4: Merge only when applicable checks are green, then fresh-read `origin/main` and record the post-merge evidence.**

## Self-Review

- Scope coverage: explicit target selection, final preview, two-step cast confirmation, duplicate prevention, stale preview clearing, cancellation, focus semantics, current shared UI adoption, exact current-runner preservation, and bounded evidence are mapped to Tasks 1–5.
- Placeholder scan: no open implementation placeholders are used; unknown semantic forecast fields are explicitly excluded instead of guessed.
- Type consistency: the plan uses the current Coordinator signatures and current shared component signals exactly as read from the connected project.

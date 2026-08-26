# Task9 Spell Workflow Product Root Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deliver the smallest executable GRIMOIRE spell-workflow root that lets a player explicitly progress from glyph writing to one completed spell use.

**Architecture:** `SpellWorkflowProductRoot` is a presentation/orchestration owner only. It constructs existing services and connects Task6/7/8 public signals without duplicating reservation, mana, transaction, or result rules. A child `GlyphStrokeCanvas` adapts pointer/touch strokes into `GlyphDrawingScreen.submit_strokes`.

**Tech Stack:** Godot 4.7.2, GDScript, existing deterministic runner/GUT, Godot AI v3.2 authoring, Hera runtime QA.

**Spec:** `docs/superpowers/specs/2026-08-27-task9-spell-workflow-product-root-design.md`

## Global Constraints

- Persistent `.gd`, `.tscn`, `.tres`, and `project.godot` changes occur only in the exact live Godot editor; every new GDScript begins with a short Korean role comment.
- Preserve `SpellWorkflowCoordinator` as sole state-transition authority; target and cast remain explicit/exactly-once.
- Use existing Korean labels and approved runtime assets; create no art, audio, or VFX.
- Use the isolated Task9 worktree; do not touch unrelated PRs, force push, or report machine QA as human/device/performance/export PASS.

---

### Task 1: Product-root deterministic contract

**Files:**
- Create: `tests/integration/test_spell_workflow_product_root.gd`
- Modify: `tests/test_runner.gd`
- Create: `src/ui/spell_workflow/spell_workflow_product_root.gd`
- Create: `src/ui/spell_workflow/spell_workflow_product_root.tscn`

**Interfaces:**
- Consumes `GlyphDrawingScreen.glyph_saved`, `CircuitPlacementScreen` intent signals, `SpellUseScreen.configure/select_target/request_confirmation/confirm`, and `SpellWorkflowCoordinator` public APIs.
- Produces `start_slice() -> Dictionary`, `visible_step() -> StringName`, and `last_result() -> Dictionary` for deterministic inspection.

- [ ] Write the failing root-flow test:

```gdscript
func test_root_requires_explicit_glyph_circuit_target_and_two_step_cast() -> void:
    var root := _create_root()
    assert_eq(root.visible_step(), &"GLYPH")
    assert_eq(root.save_test_heat_glyph().get("status"), &"VAULT_GLYPH_CREATED")
    assert_eq(root.visible_step(), &"CIRCUIT")
    assert_eq(root.place_saved_glyph_as_main().get("status"), &"PLACED")
    assert_eq(root.preview_spell().get("status"), &"PREVIEW_READY")
    assert_eq(root.confirm_preparation().get("status"), &"PREPARED")
    assert_eq(root.visible_step(), &"TARGET")
    assert_eq(root.choose_target(&"WARD").get("status"), &"FINAL_PREVIEW_READY")
    assert_true(root.request_cast_confirmation())
    assert_eq(root.confirm_cast().get("status"), &"USED")
    assert_eq(root.confirm_cast().get("status"), &"USE_CONFIRMATION_REQUIRED")
```

- [ ] Run only the new test and verify it fails because the root does not exist.
- [ ] Author the minimal root in the Godot editor. Construct the same valid HEAT/vault/typed-stock fixture as `tests/unit/test_spell_workflow_coordinator.gd`; switch screens only on authoritative result statuses.
- [ ] Rerun the test; expect exactly one `USED` and closed replay.
- [ ] Commit only these intentional files with `feat: add spell workflow product root`.

### Task 2: Real glyph writing input

**Files:**
- Create: `src/ui/spell_workflow/components/glyph_stroke_canvas.gd`
- Create: `src/ui/spell_workflow/components/glyph_stroke_canvas.tscn`
- Modify: `src/ui/spell_workflow/glyph_drawing_screen.gd`
- Modify: `src/ui/spell_workflow/glyph_drawing_screen.tscn`
- Create: `tests/integration/test_glyph_stroke_canvas.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes pointer/touch events and `GlyphDrawingScreen.submit_strokes(strokes: Array)`.
- Produces `strokes_submitted(strokes: Array)`, `clear_strokes() -> void`, `stroke_count() -> int`, and `submit_collected_strokes() -> void`.

- [ ] Write this failing test:

```gdscript
func test_canvas_collects_separate_pointer_strokes_only_after_explicit_submit() -> void:
    var canvas := _create_canvas()
    canvas.inject_pointer_press(Vector2(8, 8))
    canvas.inject_pointer_drag(Vector2(40, 40))
    canvas.inject_pointer_release(Vector2(64, 64))
    assert_eq(canvas.stroke_count(), 1)
    assert_false(canvas.was_submitted())
    canvas.submit_collected_strokes()
    assert_true(canvas.was_submitted())
```

- [ ] Run the test; expect a missing collector failure.
- [ ] Author the Control and embed it in `WritingCanvas` in the Godot editor. Normalise to the canvas rectangle, collect only while pressed, append only strokes with at least two points, submit only on explicit action, clear on retry, and support mouse plus touchscreen without glyph inference.
- [ ] Rerun the new test and `test_glyph_drawing_workflow_screen.gd`; expect no automatic vault write.
- [ ] Commit only these intentional files with `feat: add glyph stroke input adapter`.

### Task 3: Explicit screen orchestration and receipt

**Files:**
- Modify: `src/ui/spell_workflow/spell_workflow_product_root.gd`
- Modify: `src/ui/spell_workflow/spell_workflow_product_root.tscn`
- Modify: `tests/integration/test_spell_workflow_product_root.gd`

**Interfaces:**
- Consumes `CircuitPlacementScreen.place_main_requested`, `preview_requested`, `prepare_requested`, and `SpellUseScreen.cancel_requested`.
- Produces distinct preparation confirmation, exactly two valid target candidates (`WARD`, `FLOWER`), a `USED` receipt, and restart.

- [ ] Extend the failing root test:

```gdscript
func test_root_does_not_advance_for_missing_target_or_invalid_circuit() -> void:
    var root := _create_root()
    assert_eq(root.preview_spell().get("status"), &"INVALID_CIRCUIT")
    root.save_test_heat_glyph()
    root.place_saved_glyph_as_main()
    root.preview_spell()
    root.confirm_preparation()
    assert_eq(root.confirm_cast().get("status"), &"USE_CONFIRMATION_REQUIRED")
    assert_eq(root.visible_step(), &"TARGET")
```

- [ ] Run it and confirm the guarded-state/receipt assertions fail.
- [ ] Author only the missing orchestration in the Godot editor: refresh circuit snapshots after authoritative changes; require separate preparation confirmation; pass a root-supplied opaque transaction ID; configure two distinct target label/hint/keyword/payload dictionaries; show receipt only after `USED`; start a fresh session on restart.
- [ ] Run all product-root and spell-use tests; expect invalid circuit/no target/cancel/replay to remain non-consuming and both valid targets to resolve once.
- [ ] Commit only these intentional files with `feat: connect explicit spell workflow path`.

### Task 4: Entry, responsive checks, and canonical current state

**Files:**
- Modify through Godot editor: `project.godot`
- Modify: `tests/integration/test_mobile_safe_root.gd`
- Modify: `START_HERE.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/planning/TASK9_SPELL_WORKFLOW_PRODUCT_ROOT_2026-08-27.md`

**Interfaces:**
- Consumes the root scene and existing safe-root checks.
- Produces `res://src/ui/spell_workflow/spell_workflow_product_root.tscn` as development entry and evidence-correct Task8/Task9 status.

- [x] Add and run an assertion that `project.godot` names the product-root scene rather than `star_circuit_harness.tscn`.
- [x] Set the main scene through Godot editor; update only current status/provenance documentation, preserving historical records and `NOT_RUN` evidence layers.
- [x] Run the full deterministic suite and GUT; record exact counts.
- [ ] Commit only these intentional files with `docs: record Task9 workflow entry`.

### Task 5: Exact-head QA, review, merge, and Notion readback

**Files:**
- Modify: `docs/planning/TASK9_SPELL_WORKFLOW_PRODUCT_ROOT_2026-08-27.md`
- Modify: `docs/ACTIVE_CONTEXT.md`

- [ ] Import, run representative headless path, full runner, and GUT at exact branch head; leave generated import changes unstaged.
- [ ] Use Hera for run/stop, screen-tree transition `GLYPH → CIRCUIT → TARGET → RESULT`, diagnostics, and screenshot only; confirm no Hera persistent source delta.
- [ ] Complete five adversarial loops for empty input, invalid circuit, absent target, replay/stale cast, and safe-root/responsive overflow; correct valid findings and rerun affected tests.
- [ ] Create one Task9 PR, exact-head review it, merge only on green/conflict-free checks with no protected-scope drift; read back merged main.
- [ ] Update/read back Notion Home plus repository current context: implementation, evidence, asset consumption, remaining non-machine work, and machine-only evidence ceiling.

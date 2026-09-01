# GRIMOIRE Story Arc Blueprint Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use `superpowers:executing-plans` task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Extend the story-led Circle/Clock vertical slice from admission through lesson, practicum, supervised duel practice, and festival without turning the front door into an activity hub or inventing card-duel rules.

**Architecture:** `StoryProgress` remains the sole owner of narrative access and card unlocks. Each new story beat uses scene-local view code plus existing `CircleComposition`, explicit cast, and `EventClock` services; a planned chapter Resource maps a beat to its scene without saving UI nodes. The duel background remains unbound until user final lock, so all scenes must retain a valid no-new-asset fallback during implementation.

**Tech Stack:** Godot 4.7.1, GDScript, typed Resources, native `Control`/`Container`/`Theme`, GUT runner, Python `unittest` contract checks.

**Spec:** `docs/superpowers/specs/2026-09-01-story-arc-blueprint-design.md`

## Global Constraints

- Keep `StoryFrontDoor` actions exactly story-led: no lesson/practicum/duel/festival mode buttons.
- Preserve the legacy Star save read-only; no namespace change, migration, deletion, or automatic conversion.
- Reuse `CircleGlyphWritingPanel`, role-free 1–3 circles, explicit Preview → target → cast, and `EventClock` ownership.
- `RULESET_PENDING` remains visible; card detail rules, mana values, turns, and independent card-duel start are not implementation tasks until user provides and approves rules.
- Functional labels, numbers, target state, clock values, and dialogue stay live UI. Backgrounds are environment-only and `MOUSE_FILTER_IGNORE`.
- Candidate `GR-CAND-STORY-ARC-DUEL-ENV-02` cannot be referenced by a runtime scene until the user final lock is recorded. Candidate 01 is preserved only as a rejected provenance record.
- Human, device, accessibility, performance, export, and release evidence stay `NOT_RUN` unless separately executed.

## Files and responsibilities

| Path | Responsibility |
| --- | --- |
| `src/core/story/story_progress.gd` | Authoritative beat progression, never scene node ownership. |
| `src/core/story/story_chapter_definition.gd` + `data/story/*.tres` | Planned static beat-to-scene route definitions. |
| `src/ui/story/first_class_root.*` | Safe direct-writing lesson view and event handoff. |
| `src/ui/story/story_event_root.*` | Existing first practicum, retitled/re-routed only after test coverage. |
| `src/ui/story/duel_practicum_root.*` | Supervised nonlethal Circle/Clock practice event; asset-independent fallback first. |
| `src/ui/story/festival_canopy_root.*` | Noncombat shared restoration event. |
| `src/ui/components/*` | Reusable live result/clock/state presentation. |
| `tests/unit/test_story_progress.gd`, `tests/integration/test_story_*.gd` | Deterministic route, explicit action, no-hub, and duplicate-input regression coverage. |
| `tests/test_story_arc_blueprint_contract.py` | Blueprint, candidate, benchmark, and pending-card boundary. |

### Task 1: Extend story beats without creating a menu hub

**Files:**
- Modify: `src/core/story/story_progress.gd`
- Create: `tests/unit/test_story_arc_progress.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: valid `StoryProgress` at `ADMISSION_PROLOGUE`, existing `advance_from_admission()`.
- Produces: `advance_from_class()`, `advance_from_first_practicum()`, `advance_from_duel_practicum()` returning `{status, progress, route_path}` only for valid sequential beats.

- [ ] **Step 1: Write the failing route test.**

```gdscript
func test_admission_progress_routes_to_first_class_before_practicum() -> void:
    var progress = StoryProgress.create_new()
    var next: Dictionary = progress.advance_from_admission()
    case.assert_equal(&"FIRST_CLASS_ROUTE", next.get("status", &""))
    case.assert_equal("res://src/ui/story/first_class_root.tscn", next.get("route_path", ""))
```

- [ ] **Step 2: Run the focused GUT suite and verify it fails because `FIRST_CLASS_ROUTE` and the scene do not exist.**

Run: `Start-Process <Godot-4.7.1> ... -- --suite tests/unit/test_story_arc_progress.gd`

- [ ] **Step 3: Add the minimal sequential beat constants and guarded advance methods.**

```gdscript
const FIRST_CLASS_SCENE := "res://src/ui/story/first_class_root.tscn"
const FIRST_CLASS := &"FIRST_CLASS"

func advance_from_admission() -> Dictionary:
    if current_beat() != ADMISSION_PROLOGUE:
        return {"status": &"ADMISSION_REQUIRED"}
    return _advance_to(FIRST_CLASS, &"FIRST_CLASS_ROUTE", FIRST_CLASS_SCENE)
```

- [ ] **Step 4: Verify the focused suite passes and the existing no-hub tests remain green.**
- [ ] **Step 5: Commit:** `feat: add sequential story arc beats`

### Task 2: Build the first-class learning scene with existing direct glyph input

**Files:**
- Create: `src/ui/story/first_class_root.tscn`
- Create: `src/ui/story/first_class_root.gd`
- Create: `tests/integration/test_first_class_root.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `StoryProgress` at `FIRST_CLASS`, `CircleGlyphWritingPanel`, `ThemeFactory`.
- Produces: `class_completed(progress)` signal only after a recognized glyph and an explicit continue action.

- [ ] **Step 1: Write the failing integration test.**

```gdscript
case.assert_true(scene.has_node("EnvironmentBackground"), "Class keeps an environment layer")
case.assert_true(scene.has_node("Content/GlyphWritingPanel"), "Class reuses direct glyph writing")
case.assert_false(scene.has_node("BestAnswerButton"), "Class does not teach a fixed answer")
```

- [ ] **Step 2: Run it and verify it fails because `first_class_root.tscn` is absent.**
- [ ] **Step 3: Create a Control/Container scene with a plain safe fallback background, one safe water-channel target, live Korean guidance, direct glyph panel, and a disabled continue action until acceptance.**
- [ ] **Step 4: Verify focused GUT, 1280×720 editor observation, and a no-error diagnostic readback.**
- [ ] **Step 5: Commit:** `feat: add first class glyph lesson`

### Task 3: Route the existing first practicum after class while preserving event semantics

**Files:**
- Modify: `src/ui/story/admission_prologue.gd`
- Modify: `src/ui/story/story_event_root.gd`
- Modify: `tests/integration/test_story_event_root.gd`
- Modify: `tests/unit/test_story_progress.gd`

**Interfaces:**
- Consumes: class completion handoff and current `frostbloom_event_01.tres` goal/threat contract.
- Produces: the existing `Preview → target → cast` receipt only for `FIRST_PRACTICUM` progress.

- [ ] **Step 1: Write a failing test that rejects direct Admission → practicum bypass but keeps an accepted class handoff valid.**
- [ ] **Step 2: Run it and verify the current direct route fails the new assertion.**
- [ ] **Step 3: Replace only the routing guard; do not change clock segment values, action ids, glyph costs, or automatic target behavior.**
- [ ] **Step 4: Run the story-event suite, full runner, and manual editor path admission → class → practicum.**
- [ ] **Step 5: Commit:** `feat: route first practicum through class`

### Task 4: Add an asset-independent supervised duel-practice event

**Files:**
- Create: `data/events/duel/duel_practicum_event_01.tres`
- Create: `src/ui/story/duel_practicum_root.tscn`
- Create: `src/ui/story/duel_practicum_root.gd`
- Create: `tests/integration/test_duel_practicum_root.gd`

**Interfaces:**
- Consumes: `StoryProgress` at `DUEL_PRACTICUM`, current Circle/Clock resolver APIs.
- Produces: a single explicit event resolution with a Goal and Threat receipt; no card duel route.

- [ ] **Step 1: Write a failing test that requires one goal clock, one threat clock, a live target selection, explicit cast, and no `CardDuelButton`.**
- [ ] **Step 2: Run it and verify it fails because the duel event scene/data do not exist.**
- [ ] **Step 3: Implement the scene with a safe ColorRect/approved existing school fallback; do not bind `GR-CAND-STORY-ARC-DUEL-ENV-02`.**
- [ ] **Step 4: Verify repeated action ids do not advance either clock twice and a success can coexist with threat advancement.**
- [ ] **Step 5: Commit:** `feat: add supervised circle duel practice`

### Task 5: Bind the selected duel environment only after final visual lock

**Files:**
- Modify after authorization: `assets/manifests/story_arc_01_duel_practice_environment_candidate_02.json`
- Move after authorization: candidate to `assets/art/backgrounds/academy/`
- Modify after authorization: `src/ui/story/duel_practicum_root.tscn`
- Modify after authorization: `docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`
- Modify after authorization: `tests/integration/test_duel_practicum_root.gd`

**Interfaces:**
- Consumes: user final lock for `GR-CAND-STORY-ARC-DUEL-ENV-02`.
- Produces: `TextureRect` bound to the approved file with `MOUSE_FILTER_IGNORE` and no baked functional information.

- [ ] **Step 1: Stop if final lock is absent; keep the fallback scene.**
- [ ] **Step 2: After lock, write a failing test for exact texture path, `MOUSE_FILTER_IGNORE`, and `STRETCH_KEEP_ASPECT_COVERED`.**
- [ ] **Step 3: Promote without altering image bytes, update SHA/provenance, and bind only `EnvironmentBackground`.**
- [ ] **Step 4: Verify actual 1280×720 and 1920×1080 crop/readability; retain Human/Device/Performance as NOT_RUN unless executed.**
- [ ] **Step 5: Commit:** `art: bind approved duel practice environment`

### Task 6: Add festival as a noncombat story result, then retain card-rule boundary

**Files:**
- Create: `src/ui/story/festival_canopy_root.tscn`
- Create: `src/ui/story/festival_canopy_root.gd`
- Create: `tests/integration/test_festival_canopy_root.gd`
- Modify: `src/ui/cards/card_archive_screen.gd` only if a story beat unlock needs displaying

**Interfaces:**
- Consumes: `StoryProgress` after duel practice, existing Clock UI.
- Produces: noncombat Goal/Threat receipt and optional story-owned card record; never a numerical card duel.

- [ ] **Step 1: Write a failing test that requires no enemy/weapon/scoreboard node and preserves `RULESET_PENDING` in the archive.**
- [ ] **Step 2: Run it and verify it fails before the festival scene exists.**
- [ ] **Step 3: Implement the minimal canopy restoration scene using a safe fallback and existing live UI components.**
- [ ] **Step 4: Verify the focused suite and that `CardArchiveScreen.request_start_duel()` still returns `RULESET_PENDING`.**
- [ ] **Step 5: Commit:** `feat: add festival restoration story event`

### Task 7: Validate the full story slice and prepare human/device evidence

**Files:**
- Modify: `docs/validation/CIRCLE_CLOCK_HUMAN_DEVICE_ACCESSIBILITY_PRECHECK_2026-09-01.md`
- Create: story-arc implementation receipt under `docs/validation/`
- Modify: `docs/ACTIVE_CONTEXT.md`, `docs/DEVELOPMENT_GATES.md`, `docs/DESIGN_DOCUMENT_REGISTRY.json`

**Interfaces:**
- Consumes: all preceding scene/test results and exact Git head.
- Produces: bounded machine/editor evidence and a separate human/device runbook; no automatic Human PASS.

- [ ] **Step 1: Run the full Python contract suite and full Godot test runner on the changed head.**
- [ ] **Step 2: Run the editor path New Record → Admission → Class → Practicum → Duel → Festival with 1280×720 and 1920×1080 checks.**
- [ ] **Step 3: Record only observed axes, complete five adversarial loops, and re-read the exact PR head.**
- [ ] **Step 4: Commit:** `docs: record story arc slice evidence`

## Explicit deferred work

No implementation task defines card detailed rules. `RULESET_PENDING` stays until the user supplies the Shadowverse/GWENT-like turn, hand, board, mana distribution, scoring, victory, and failure rules in a separately approved design. The card archive may show story-owned records, but cannot gain an independent duel route before that user decision.

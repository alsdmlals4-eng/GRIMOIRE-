# First Twelve Minutes Runtime Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use `superpowers:executing-plans` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking. Subagent execution is intentionally not used for this project task.

**Goal:** Build GRIMOIRE's playable entry flow: admission ceremony → direct `FLOW` lesson → two-target guided greenhouse practicum, while preserving the W6 Frostbloom product root and its explicit spell transaction guarantees.

**Architecture:** Extract the existing generic spell transaction setup from the W6-specific product root into one data-driven `GuidedSpellSessionController`. Keep `SpellWorkflowProductRoot` as the W6 regression/entry scene using a W6 session config. Build a separate `FirstSessionRoot` that owns only admission/class/practicum sequencing, reuses the existing glyph/circuit/spell-use surfaces, and supplies a separate `FirstPracticumContext` plus `FLOW`/`FOCUS`/`DISPERSE` configuration.

**Tech Stack:** Godot 4.7.1, GDScript, existing GUT/custom headless test runner, existing GRIMOIRE theme and spell workflow components, user-approved candidate PNGs after explicit runtime-asset lock.

**Spec:** `docs/superpowers/specs/2026-08-30-first-twelve-minutes-admission-class-practicum-design.md`

## Global Constraints

- Fixed mobile-first `LANDSCAPE` presentation; 1280×720 is the logical validation frame, not mobile-device proof.
- Player-facing order remains `글자 → 주문 → 대상 → 시전`; internal `FIVE_POINT_STAR` rules remain unchanged.
- Main glyph is exactly one; auxiliary glyphs are zero to five equivalent vertex placements; target selection occurs only after circuit Preview; Commit is explicit and exactly once.
- `FLOW` is the first-session direct-writing glyph. W6's `HEAT` bootstrap and W6 Frostbloom Resource remain independent and retain their current tests/meaning.
- `FOCUS`, `DISPERSE`, and no auxiliary glyph are all valid first-practicum choices. Do not add an auto-best route, target, or commit.
- A failed/invalid input, cancelled Preview, or changed target may not consume Mana or glyph resources. Duplicate confirmation fails closed.
- Magic is direct blue-to-blue-violet airborne handwriting, never text emitted by a book. Environment backgrounds and situation targets contain no baked glyph, magic-writing, rune, spell trail, or blue/violet magic-state cue; the optional transparent `MagicWritingOverlay` is separately composited only when the live state needs it. Functional Korean text, values, buttons, localisation, and recognised glyph/spell meaning are live Godot UI, not baked images.
- Do not create functional empty decorative panels. Background/veil nodes use `MOUSE_FILTER_IGNORE`; actual target controls must retain explicit touch/click hit areas.
- Do not reference `assets/art/source_candidates/first_session_02/**` from a scene until `USER_BATCH_REVIEW_AND_FINAL_RUNTIME_ASSET_APPROVAL_REQUIRED` is closed and the files are promoted to canonical asset paths.
- No 3D exploration, enemy waves, horror framing, permanent relationship/faction choices, or production audio work in this unit.
- Human, device, performance, accessibility, export, and full-slice validation remain `NOT_RUN` until independently executed and recorded.

---

## File Map

| Path | Responsibility |
| --- | --- |
| `src/core/content/guided_spell_session_config.gd` | Typed reusable configuration for a glyph, initial stock, scenario Resource, session IDs, labels, and base stats. |
| `src/core/workflow/guided_spell_session_controller.gd` | Domain-only setup and state transitions for accepted glyph → circuit → target Preview → explicit atomic use. |
| `src/core/content/first_practicum_context.gd` | First-practicum-only context protocol implementation and equal-priority result payloads. |
| `data/first_session/first_practicum_context_01.tres` | First practicum's `FLOW` targets and receipt data, separate from `data/frostbloom/w6/**`. |
| `data/first_session/first_practicum_session_config_01.tres` | Config for direct `FLOW`, `FOCUS`/`DISPERSE` stock, and the first practicum Resource. |
| `src/ui/spell_workflow/spell_workflow_product_root.gd` | Thin W6 surface presenter that delegates all domain transitions to the new controller. |
| `src/ui/first_session/first_session_root.gd` | Admission/class/practicum flow state machine and reusable UI surface wiring. |
| `src/ui/first_session/first_session_root.tscn` | New product-start scene with background, admission/class/practicum, reusable spell screens, result panel, and no blank frames. |
| `src/ui/first_session/first_practicum_situation_layer.gd` | Scene target button adapter; maps explicit world taps to target IDs without gameplay authority. |
| `src/ui/first_session/first_practicum_situation_layer.tscn` | Two visible target controls above a non-input-blocking background. |
| `src/ui/spell_workflow/spell_use_screen.gd` | Add an intentional public `select_target_choice(id)` adapter for world-layer selection while preserving existing selector behavior. |
| `project.godot` | Change main scene only after first-session scene, W6 regression, and asset promotion gates are green. |
| `assets/manifests/first_session_02_runtime_candidate_batch.json` | Superseded R1 candidate lifecycle record; retained as provenance because it embedded glyph/magic cues in source artwork. |
| `assets/manifests/first_session_02_runtime_candidate_layer_separation_02.json` | Current R2 candidate lifecycle record; enforces environment/target/glyph-overlay separation until user final image approval. |
| `assets/manifests/first_session_02_runtime_assets.json` | New canonical promoted runtime asset record, created only after approval. |
| `tests/unit/test_guided_spell_session_controller.gd` | Domain state/transaction tests for the generic controller. |
| `tests/unit/test_first_practicum_context.gd` | Context validation and equal-value target tests. |
| `tests/integration/test_first_session_root.gd` | Scene-state, direct-`FLOW`, nonblocking backdrop, target/Preview/Commit, and restart tests. |
| `tests/integration/test_spell_workflow_product_root.gd` | Existing W6 regression contract; extend only with thin-controller delegation expectations while preserving W6 assertions. |

## Task 1: Establish an isolated implementation baseline

**Files:**

- Create: no repository source files.
- Modify: no repository source files.
- Test: existing baseline runner and focused W6 product-root test.

**Interfaces:**

- Consumes: current `main`, approved design spec, `assets/manifests/first_session_02_runtime_candidate_layer_separation_02.json`.
- Produces: a clean isolated worktree on a `codex/first-twelve-minutes-runtime` branch plus a recorded baseline result.

- [ ] **Step 1: Detect worktree isolation and the existing project-local worktree root.**

Run:

```powershell
git rev-parse --git-dir
git rev-parse --git-common-dir
git rev-parse --show-superproject-working-tree
Get-ChildItem -Force .worktrees
git check-ignore -q .worktrees
```

Expected: the current checkout is the dirty shared `main` checkout, `.worktrees` is ignored, and no existing first-session worktree is reused accidentally.

- [ ] **Step 2: Create the isolated worktree from fresh `origin/main`.**

Run:

```powershell
git fetch origin main
git worktree add .worktrees/codex-first-twelve-minutes-runtime -b codex/first-twelve-minutes-runtime origin/main
```

Expected: no existing dirty user change is stashed, cleaned, rebased, copied, or modified.

- [ ] **Step 3: Verify the baseline fails only when a real project validator or runner identifies a pre-existing issue.**

Run in the new worktree:

```powershell
& .\.agents\skills\grimoire-workflow-router\scripts\validate_operating_contract.ps1
python tests/test_spell_workflow_ui_v2_contract.py -v
```

Expected: contract validator prints `OPERATING_CONTRACT_VALID`; Python contract test is green. If either fails, stop before source edits and report the exact baseline blocker.

- [ ] **Step 4: Run the existing W6 headless product runner.**

Run using the exact available project Godot executable:

```powershell
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd
```

Expected: current custom runner completes without failures. Record the executable path and output; do not call the result human/device proof.

- [ ] **Step 5: Record the baseline without committing user-owned shared-workspace files.**

Create the implementation receipt only in the isolated branch after the first code task is green. Do not make a documentation-only commit on the shared `main` checkout.

## Task 2: Add the first-practicum data boundary

**Files:**

- Create: `src/core/content/first_practicum_context.gd`
- Create: `data/first_session/first_practicum_context_01.tres`
- Create: `data/first_session/first_practicum_session_config_01.tres`
- Create: `tests/unit/test_first_practicum_context.gd`
- Modify: no W6 Resource, W6 target-definition script, or W6 result text.

**Interfaces:**

- Consumes: `Resource`, target payload shape accepted by `SpellWorkflowCoordinator.prepare_target_preview`, the existing `FrostbloomW6TargetDefinition` protocol (`validate`, `target_choices`, `target_choice`, `summary`).
- Produces: `FirstPracticumContext.validate() -> Dictionary`, `target_choices() -> Array`, `target_choice(target_id: StringName) -> Dictionary`, and `summary() -> Dictionary`.

- [ ] **Step 1: Write the failing context test.**

```gdscript
func test_first_practicum_context_keeps_two_equal_valid_preservation_targets() -> void:
    var context = load("res://data/first_session/first_practicum_context_01.tres")
    var validation: Dictionary = context.validate()
    assert_eq(validation.get("status"), &"OK")
    var choices: Array = context.target_choices()
    assert_eq(choices.size(), 2)
    assert_eq(StringName(Dictionary(choices[0]).get("id")), &"FROST_SEEDLINGS")
    assert_eq(StringName(Dictionary(choices[1]).get("id")), &"GREENHOUSE_SUPPORT")
    for choice_variant in choices:
        var choice := Dictionary(choice_variant)
        assert_false(String(choice.get("protected_value", "")).is_empty())
        assert_false(String(choice.get("forgone_or_remaining", "")).is_empty())
        assert_false(String(choice.get("unknown", "")).is_empty())
        assert_false(bool(choice.get("recommended", false)))
```

- [ ] **Step 2: Run the test and verify the expected missing-resource failure.**

Run:

```powershell
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/unit/test_first_practicum_context.gd
```

Expected: FAIL because the first practicum Resource/class does not exist, not because the existing W6 test changed.

- [ ] **Step 3: Implement the minimum context protocol.**

Implement `FirstPracticumContext` with two separately authored target entries. Each entry supplies `id`, Korean `label`, `hint`, `protected_value`, `target_keyword`, `target`, and payload fields `known_improvement`, `forgone_or_remaining`, `unknown`. `validate()` rejects duplicate IDs, missing result fields, missing target keyword, and a `recommended: true` value. Keep outcome data small and supervised: the unselected concern remains a next observation, not a failure state.

- [ ] **Step 4: Run the focused test and the W6 product-root test.**

Run:

```powershell
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/unit/test_first_practicum_context.gd
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/integration/test_spell_workflow_product_root.gd
```

Expected: new context test and unchanged W6 regression assertions pass.

- [ ] **Step 5: Commit the isolated data boundary.**

```powershell
git add src/core/content/first_practicum_context.gd data/first_session/first_practicum_context_01.tres data/first_session/first_practicum_session_config_01.tres tests/unit/test_first_practicum_context.gd
git commit -m "feat(first-session): add guided practicum context"
```

## Task 3: Extract one generic spell-session controller and keep W6 stable

**Files:**

- Create: `src/core/content/guided_spell_session_config.gd`
- Create: `src/core/workflow/guided_spell_session_controller.gd`
- Create: `tests/unit/test_guided_spell_session_controller.gd`
- Modify: `src/ui/spell_workflow/spell_workflow_product_root.gd`
- Modify: `tests/integration/test_spell_workflow_product_root.gd`

**Interfaces:**

- Consumes: `GuidedSpellSessionConfig`, `CircuitPlacementSession`, `SpellWorkflowCoordinator`, `AtomicSpellPreparationService`, `AtomicSpellUseService`, the approved scenario-context protocol.
- Produces: `GuidedSpellSessionController.start()`, `glyph_drawing_context()`, `accept_saved_glyph(glyph_id)`, `place_main()`, `place_auxiliary(slot, glyph_id)`, `preview_spell()`, `confirm_preparation()`, `target_choices()`, `choose_target(target_id)`, `request_cast_confirmation()`, `confirm_cast()`, `reset()` and `visible_step()`.

- [ ] **Step 1: Write a failing domain transaction test.**

```gdscript
func test_flow_focus_practicum_requires_preview_then_one_explicit_cast() -> void:
    var config = load("res://data/first_session/first_practicum_session_config_01.tres")
    var controller = GuidedSpellSessionController.create(config)
    assert_eq(controller.start().get("status"), &"SLICE_READY")
    assert_eq(controller.accept_saved_glyph(&"FLOW").get("status"), &"VAULT_GLYPH_CREATED")
    assert_eq(controller.place_main().get("status"), &"PLACED")
    assert_eq(controller.place_auxiliary(0, &"FOCUS").get("status"), &"PLACED")
    assert_eq(controller.choose_target(&"FROST_SEEDLINGS").get("status"), &"PREPARATION_REQUIRED")
    assert_eq(controller.preview_spell().get("status"), &"CIRCUIT_PREVIEW_READY")
    assert_eq(controller.confirm_preparation().get("status"), &"PREPARED")
    assert_eq(controller.choose_target(&"FROST_SEEDLINGS").get("status"), &"FINAL_PREVIEW_READY")
    assert_true(controller.request_cast_confirmation())
    assert_eq(controller.confirm_cast().get("status"), &"USED")
    assert_eq(controller.confirm_cast().get("status"), &"USE_CONFIRMATION_REQUIRED")
```

- [ ] **Step 2: Run the focused controller test and verify RED.**

Run:

```powershell
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/unit/test_guided_spell_session_controller.gd
```

Expected: FAIL because `GuidedSpellSessionController` and its config are missing.

- [ ] **Step 3: Implement config and controller without UI node access.**

`GuidedSpellSessionConfig` owns `context`, `scribe_glyph_id`, `initial_stock_ids`, transaction IDs, `mana_max`, `glyph_base_mana`, and `glyph_base_success`. The controller owns reservations and exact workflow state, but no `Control`, `Label`, or scene path. It must use the existing coordinator/services; it must not calculate a second preview or mutate a context Resource.

- [ ] **Step 4: Refactor W6 root into a thin presenter.**

Give `SpellWorkflowProductRoot` a W6 config Resource or explicit default config that produces the same W6 `HEAT` flow, target order, Korean receipt copy, mana result, and duplicate-cast rejection already asserted by its integration test. Replace only the duplicated domain setup/transition block with controller calls; preserve existing node paths and `W6ObservationSummary` behavior.

- [ ] **Step 5: Verify GREEN and W6 parity.**

Run:

```powershell
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/unit/test_guided_spell_session_controller.gd
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/integration/test_spell_workflow_product_root.gd
python tests/test_spell_workflow_ui_v2_contract.py -v
```

Expected: first-session controller tests pass; all existing W6 assertions retain their exact target IDs and receipt behavior; no UI contract regression.

- [ ] **Step 6: Commit the controller extraction.**

```powershell
git add src/core/content/guided_spell_session_config.gd src/core/workflow/guided_spell_session_controller.gd src/ui/spell_workflow/spell_workflow_product_root.gd tests/unit/test_guided_spell_session_controller.gd tests/integration/test_spell_workflow_product_root.gd
git commit -m "refactor(workflow): share guided spell session controller"
```

## Task 4: Build admission, class, and world-target presentation

**Files:**

- Create: `src/ui/first_session/first_session_root.tscn`
- Create: `src/ui/first_session/first_session_root.gd`
- Create: `src/ui/first_session/first_practicum_situation_layer.tscn`
- Create: `src/ui/first_session/first_practicum_situation_layer.gd`
- Create: `tests/integration/test_first_session_root.gd`
- Modify: `src/ui/spell_workflow/spell_use_screen.gd`
- Modify: `src/ui/spell_workflow/spell_use_screen.tscn` only if one live UI slot is needed for the world-target adapter.

**Interfaces:**

- Consumes: `GuidedSpellSessionController`, `FirstPracticumContext`, `GlyphDrawingScreen`, `CircuitPlacementScreen`, `SpellUseScreen`, `FirstPracticumSituationLayer.target_selected(target_id) -> void`.
- Produces: `FirstSessionRoot.advance_admission()`, `start_class()`, `start_practicum()`, `restart_first_session()`, `visible_phase()`, and a scene-layer target signal with no direct domain mutation.

- [ ] **Step 1: Write a failing first-session scene test.**

```gdscript
func test_first_session_reaches_flow_class_then_target_preview_without_w6_context() -> void:
    var packed_scene = load("res://src/ui/first_session/first_session_root.tscn")
    var root = packed_scene.instantiate()
    assert_eq(root.visible_phase(), &"ADMISSION")
    assert_eq(root.advance_admission().get("status"), &"CLASS_READY")
    assert_eq(root.accept_saved_glyph(&"FLOW").get("status"), &"VAULT_GLYPH_CREATED")
    assert_eq(root.visible_phase(), &"PRACTICUM_CIRCUIT")
    assert_eq(root.place_main().get("status"), &"PLACED")
    assert_eq(root.preview_spell().get("status"), &"CIRCUIT_PREVIEW_READY")
    assert_eq(root.confirm_preparation().get("status"), &"PREPARED")
    assert_eq(root.visible_phase(), &"PRACTICUM_TARGET")
    assert_eq(root.choose_world_target(&"GREENHOUSE_SUPPORT").get("status"), &"FINAL_PREVIEW_READY")
```

- [ ] **Step 2: Run the test and verify RED.**

Run:

```powershell
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/integration/test_first_session_root.gd
```

Expected: FAIL because `FirstSessionRoot` does not yet exist.

- [ ] **Step 3: Implement the smallest stateful presentation.**

Create one root with phases `ADMISSION`, `CLASS_GLYPH`, `CLASS_REFLECT`, `PRACTICUM_CIRCUIT`, `PRACTICUM_TARGET`, `PRACTICUM_RESULT`. Keep admission to one advance action and no permanent mutation. Configure the reused glyph screen for `FLOW`; after accepted glyph, render one class reflection and continue to the circuit screen. Wire `place_aux_requested` to `controller.place_auxiliary(slot, glyph_id)`. Reveal the situation layer only after preparation. Send a world-target tap through `SpellUseScreen.select_target_choice(target_id)` or the same controller-owned choice dictionary; the layer itself must never call `confirm_cast`.

- [ ] **Step 4: Add input/rollback assertions before styling.**

Add assertions that the admission/class backgrounds use `Control.MOUSE_FILTER_IGNORE`; target controls remain visible/focusable during `PRACTICUM_TARGET`; cancel/edit restores target selection without resource consumption; `FOCUS`, `DISPERSE`, and no-auxiliary paths yield a Preview; duplicate cast is rejected.

- [ ] **Step 5: Run the scene, controller, W6, and UI regressions.**

Run:

```powershell
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/integration/test_first_session_root.gd
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/unit/test_guided_spell_session_controller.gd
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/integration/test_spell_workflow_product_root.gd
python tests/test_spell_workflow_ui_v2_contract.py -v
```

Expected: FirstSession reaches a final Preview only from an explicit world target; W6 remains unchanged; no test declares runtime/human/device proof.

- [ ] **Step 6: Commit the playable presentation.**

```powershell
git add src/ui/first_session src/ui/spell_workflow/spell_use_screen.gd src/ui/spell_workflow/spell_use_screen.tscn tests/integration/test_first_session_root.gd
git commit -m "feat(first-session): add admission class practicum flow"
```

## Task 5: Promote reviewed candidate assets and bind them safely

**Files:**

- Create: `assets/art/backgrounds/academy/bg_admission_hall_ceremony.png`
- Create: `assets/art/backgrounds/classroom/bg_classroom_water_channel.png`
- Create: `assets/art/targets/greenhouse/target_frost_seedlings_unstable.png`
- Create: `assets/art/targets/greenhouse/target_greenhouse_support_unstable.png`
- Create: `assets/art/vfx/glyphs/fx_direct_air_glyph_overlay.png`
- Create: `assets/manifests/first_session_02_runtime_assets.json`
- Modify: `assets/manifests/first_session_02_runtime_candidate_layer_separation_02.json`
- Modify: `docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`
- Modify: `docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`
- Modify: `src/ui/first_session/first_session_root.tscn`
- Modify: `src/ui/first_session/first_practicum_situation_layer.tscn`
- Test: `tests/integration/test_first_session_root.gd`

**Interfaces:**

- Consumes: explicit user final approval of all five R2 candidates, copied source candidates, SHA-256 inventory, target/overlay alpha requirements.
- Produces: canonical approved asset paths, provenance records, scene `TextureRect`/`TextureButton` references, separately controlled `MagicWritingOverlay`, and candidate-path exclusion.

- [ ] **Step 1: Do not start this task until the recorded batch state is `USER_APPROVED_RUNTIME_ASSET_BATCH`.**

Required evidence: the user has reviewed the five R2 generated candidates and explicitly authorized their runtime use. If a candidate is revised, update only that candidate's prompt/record and repeat batch review for the changed asset.

- [ ] **Step 2: Write a failing candidate-path exclusion test.**

```gdscript
func test_first_session_uses_only_promoted_assets_not_source_candidates() -> void:
    var scene_source := FileAccess.get_file_as_string("res://src/ui/first_session/first_session_root.tscn")
    var target_source := FileAccess.get_file_as_string("res://src/ui/first_session/first_practicum_situation_layer.tscn")
    assert_false(scene_source.contains("assets/art/source_candidates/"))
    assert_false(target_source.contains("assets/art/source_candidates/"))
    assert_true(ResourceLoader.exists("res://assets/art/backgrounds/academy/bg_admission_hall_ceremony.png"))
    assert_true(ResourceLoader.exists("res://assets/art/targets/greenhouse/target_frost_seedlings_unstable.png"))
    assert_true(ResourceLoader.exists("res://assets/art/vfx/glyphs/fx_direct_air_glyph_overlay.png"))
```

- [ ] **Step 3: Run it and verify RED before copying canonical files.**

Run:

```powershell
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/integration/test_first_session_root.gd
```

Expected: FAIL because canonical paths do not exist yet.

- [ ] **Step 4: Promote files non-destructively and record provenance.**

Copy, never overwrite, each approved source candidate to its planned canonical path. Persist source and promoted SHA-256, dimensions, alpha, OpenAI generation route, reviewed constraints, consumer, and `PROJECT_ASSET_APPROVED`. Update coverage rows to distinguish candidate approval from `APPLIED_AND_RUNTIME_VERIFIED`.

- [ ] **Step 5: Bind canonical textures with input-safe scene settings.**

Use `TextureRect` with `MOUSE_FILTER_IGNORE` for backgrounds. Use `TextureButton`/focusable `Control` targets above the background with visible target hit areas. Do not embed target labels in the texture; bind live Korean labels/help in the existing target/Preview UI.

- [ ] **Step 6: Verify GREEN, import, and source-boundary safety.**

Run:

```powershell
<GODOT_4_7_1> --headless --import --path .
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/integration/test_first_session_root.gd
git diff --check
```

Expected: assets load, target alpha remains present, source candidate paths are absent from runtime scenes, and no whitespace error occurs.

- [ ] **Step 7: Commit approved asset promotion and binding.**

```powershell
git add assets/art assets/manifests docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json src/ui/first_session tests/integration/test_first_session_root.gd
git commit -m "feat(first-session): bind reviewed academy assets"
```

## Task 6: Switch the development main entry and validate the representative flow

**Files:**

- Modify: `project.godot`
- Modify: `tests/integration/test_spell_workflow_product_root.gd`
- Modify: `tests/integration/test_first_session_root.gd`
- Create: `docs/validation/FIRST_TWELVE_MINUTES_IMPLEMENTATION_RECEIPT_2026-08-30.md`

**Interfaces:**

- Consumes: approved canonical assets, passing FirstSession/W6 tests, parseable first-session scene.
- Produces: `project.godot` main scene pointing to `FirstSessionRoot`, W6 scene preserved as direct regression entry, and evidence separated by machine/runtime/human ceilings.

- [ ] **Step 1: Write a failing project-entry test.**

```gdscript
func test_project_main_scene_is_the_first_session_and_w6_scene_still_loads() -> void:
    var main_path := String(ProjectSettings.get_setting("application/run/main_scene", ""))
    var main_scene = load(main_path)
    assert_eq(main_scene.resource_path, "res://src/ui/first_session/first_session_root.tscn")
    var w6_scene = load("res://src/ui/spell_workflow/spell_workflow_product_root.tscn")
    assert_true(w6_scene.can_instantiate())
```

- [ ] **Step 2: Run it and verify RED.**

Run:

```powershell
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd -- --only tests/integration/test_first_session_root.gd
```

Expected: FAIL because the development main entry remains the W6 product root.

- [ ] **Step 3: Change only the main-scene entry.**

Set `application/run/main_scene` to `res://src/ui/first_session/first_session_root.tscn` through Godot-authoring-safe project editing. Do not remove the W6 scene or its test path.

- [ ] **Step 4: Run full deterministic validation.**

Run:

```powershell
<GODOT_4_7_1> --headless --import --path .
<GODOT_4_7_1> --headless --path . --script res://tests/test_runner.gd
<GODOT_4_7_1> --headless --path . -s addons/gut/gut_cmdln.gd -gconfig=res://.gutconfig.json -gexit
python tests/test_spell_workflow_ui_v2_contract.py -v
python tests/test_star_glyph_circuit_canon_contract.py -v
git diff --check
```

Expected: parser/import/custom runner/GUT/contract checks pass. Treat a green run as `MACHINE_VERIFIED` only.

- [ ] **Step 5: Capture runtime evidence in the correct GRIMOIRE editor session.**

Observe in order: admission advance; `FLOW` stroke recognition; class reflection; `FOCUS`, `DISPERSE`, and no-aux Preview; each world target; final Preview; one explicit cast; duplicate-cast rejection; restart. Capture source-delta before/after live QA. If no GRIMOIRE editor is attached, record `RUNTIME_VERIFIED: BLOCKED_UNVERIFIED` rather than substituting another project session.

- [ ] **Step 6: Write the receipt and commit.**

The receipt must list each machine check, exact head, asset hashes, scene path, runtime observation status, and separately retain `HUMAN/DEVICE/PERFORMANCE/ACCESSIBILITY/EXPORT/FULL_SLICE: NOT_RUN` until performed.

```powershell
git add project.godot tests/integration docs/validation/FIRST_TWELVE_MINUTES_IMPLEMENTATION_RECEIPT_2026-08-30.md
git commit -m "feat(first-session): make admission flow the main entry"
```

## Plan Self-Review

### Spec coverage

| Spec requirement | Plan task |
| --- | --- |
| Admission before first direct writing, no permanent choice | Task 4 |
| `FLOW` first class and direct writing recovery | Tasks 2–4 |
| `FOCUS` / `DISPERSE` / no auxiliary are valid | Tasks 2–4 |
| W6 must remain separate | Tasks 2–3 and W6 regression runs in every later task |
| World targets after Preview and explicit one-time Cast | Tasks 3–4 |
| Images first, no blank frames, live UI text | Task 5 plus the global constraints |
| Candidate-to-canonical approval lifecycle | Task 5 |
| main entry, automated/runtime evidence ceilings | Task 6 |
| human/device/performance/accessibility not overstated | Global constraints and Task 6 |

### Placeholder scan

The plan contains no unresolved placeholder or nonspecific implementation instruction. Every code unit, test target, execution command, ownership boundary, and promotion condition is named.

### Type consistency

- `FirstPracticumContext` uses the same target-context protocol as the W6 Resource, but it has a distinct class/resource path.
- `GuidedSpellSessionController` is the only new domain owner; `FirstSessionRoot` and `SpellWorkflowProductRoot` are UI presenters.
- `FirstPracticumSituationLayer.target_selected(target_id)` maps to the controller/`SpellUseScreen` choice ID; it never owns an alternative cast API.
- `GuidedSpellSessionConfig` defines the only initial glyph/stock/Mana configuration interface used by both session roots.

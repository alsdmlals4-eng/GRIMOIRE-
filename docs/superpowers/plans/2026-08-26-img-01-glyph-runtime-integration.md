# IMG-01 Six-Glyph Runtime Integration Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Connect the six approved IMG-01 glyph PNGs to Task6 recognition, Task7 glyph cards, and the display-only FIVE_POINT_STAR board through one visual resolver.

**Architecture:** A static UI-only resolver maps glyph IDs to approved art, Korean name, and `Texture2D`. The existing screens bind from it; the circuit screen passes only its existing placement snapshot to the display-only board.

**Tech Stack:** Godot 4.7.1, GDScript, `.tscn`, SceneTree regression runner, Python contract checks.

**Spec:** `docs/superpowers/specs/2026-08-26-img-01-glyph-runtime-integration-design.md`

## Global Constraints

- Keep `글자 → 주문 → 대상 → 시전`; only the first two stages receive visual bindings.
- Do not change `GlyphCatalog.normalize_id`, stock, reservation, prepare/commit, Mana, success/risk, target, or cast behavior.
- Direct IDs are `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, `BURST`; only `AMPLIFY` displays `BURST` as visual compatibility.
- Unknown IDs display no art and no name. Korean names are lower-right live UI text, never baked into a PNG.
- The board has one center Main and 0–5 outer Aux visual slots; sparse Aux values use stored slot indices.
- New GDScript begins with a Korean role comment. Manual import/device/resolution/performance results remain `NOT_RUN` unless evidenced.

---

### Task 1: Shared glyph visual resolver

**Files:**
- Create: `src/ui/spell_workflow/glyph_visual_resolver.gd`
- Create: `tests/unit/test_glyph_visual_resolver.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Produces `asset_id_for(glyph_id: StringName) -> StringName`.
- Produces `texture_path_for(glyph_id: StringName) -> String`.
- Produces `texture_for(glyph_id: StringName) -> Texture2D`.
- Produces `korean_name_for(glyph_id: StringName) -> String`.

- [ ] **Step 1: Write a failing resolver test**

Create the test, append it to the SceneTree `SUITES`, and assert every direct ID resolves to itself and its matching filename. Also assert `AMPLIFY → BURST`, `AMPLIFY → 폭발`, and `UNKNOWN` returns empty values.

```gdscript
for glyph_id in [&"HEAT", &"PROTECT", &"FLOW", &"FOCUS", &"DISPERSE", &"BURST"]:
    case.assert_equal(glyph_id, resolver.asset_id_for(glyph_id))
    case.assert_true(resolver.texture_path_for(glyph_id).ends_with("glyph_%s.png" % String(glyph_id).to_lower()))
case.assert_equal(&"BURST", resolver.asset_id_for(&"AMPLIFY"))
case.assert_equal("폭발", resolver.korean_name_for(&"AMPLIFY"))
case.assert_equal("", resolver.texture_path_for(&"UNKNOWN"))
```

- [ ] **Step 2: Verify RED**

Run `godot --headless --path . -s tests/test_runner.gd`. Expected: the resolver suite fails because `glyph_visual_resolver.gd` does not exist.

- [ ] **Step 3: Write minimal resolver**

Create the resolver with the Korean header comment and class name. Use one direct-ID dictionary containing the six `res://assets/art/ui/glyphs/glyph_*.png` paths/names and one compatibility dictionary containing only `&"AMPLIFY": &"BURST"`. Unsupported IDs return empty/null values; `texture_for` loads only a non-empty path.

- [ ] **Step 4: Verify GREEN**

Run `godot --headless --path . -s tests/test_runner.gd`. Expected: resolver and all pre-existing suites pass.

- [ ] **Step 5: Commit**

Run `git add src/ui/spell_workflow/glyph_visual_resolver.gd tests/unit/test_glyph_visual_resolver.gd tests/test_runner.gd` followed by `git commit -m "feat: add glyph visual resolver"`.

### Task 2: Task6 recognition preview

**Files:**
- Modify: `src/ui/spell_workflow/glyph_drawing_screen.tscn`
- Modify: `src/ui/spell_workflow/glyph_drawing_screen.gd`
- Modify: `tests/integration/test_glyph_drawing_workflow_screen.gd`

**Interfaces:**
- Consumes `GlyphVisualResolver.texture_for` and `GlyphVisualResolver.korean_name_for`.
- Produces `RecognitionPanel/Content/GlyphPreview` and `RecognitionPanel/Content/GlyphNameLabel`.
- Preserves the one-time `save_accepted_candidate()` contract.

- [ ] **Step 1: Write failing scene assertions**

Extend Task6 integration coverage to require both node paths. With its existing fake coordinator returning `HEAT`, assert the preview texture is non-null and `GlyphNameLabel.text == "열기"`; retain the existing `accept_calls == 1` assertions unchanged.

- [ ] **Step 2: Verify RED**

Run `godot --headless --path . -s tests/test_runner.gd`. Expected: Task6 test fails because preview/name nodes are absent.

- [ ] **Step 3: Add visual nodes and binding**

Replace the direct RecognitionPanel label layout with `RecognitionPanel/Content`, retain `Message`, then add a keep-aspect `GlyphPreview` and lower-right `GlyphNameLabel`. Preload the resolver and bind it as follows:

```gdscript
preview.texture = GlyphVisualResolver.texture_for(glyph_id)
name_label.text = GlyphVisualResolver.korean_name_for(glyph_id)
name_label.visible = not name_label.text.is_empty()
```

Call the binding from `_show_recognition` using `_selected_glyph_id()` and change `_set_recognition_text` to `RecognitionPanel/Content/Message`. Do not change recognition, candidate, or save data.

- [ ] **Step 4: Verify GREEN**

Run `godot --headless --path . -s tests/test_runner.gd`. Expected: preview/name and idempotent-save assertions pass.

- [ ] **Step 5: Commit**

Run `git add src/ui/spell_workflow/glyph_drawing_screen.tscn src/ui/spell_workflow/glyph_drawing_screen.gd tests/integration/test_glyph_drawing_workflow_screen.gd` followed by `git commit -m "feat: preview recognized glyph art"`.

### Task 3: Task7 glyph-card visual presentation

**Files:**
- Modify: `src/ui/spell_workflow/components/glyph_card.tscn`
- Modify: `src/ui/spell_workflow/components/glyph_card.gd`
- Modify: `tests/integration/test_circuit_placement_workflow_screen.gd`

**Interfaces:**
- Consumes `data["glyph_id"]` and the resolver.
- Produces `Content/GlyphPresentation/GlyphTexture` and `Content/GlyphPresentation/GlyphNameLabel`.
- Preserves `GlyphCard.data()`, selectability, tooltip, and disabled `modulate` state.

- [ ] **Step 1: Write failing card assertions**

After the first-card lookup, assert `GlyphTexture` exists with a non-null texture and `GlyphNameLabel.text == "열기"` for the supplied vault `HEAT` card.

- [ ] **Step 2: Verify RED**

Run `godot --headless --path . -s tests/test_runner.gd`. Expected: Task7 test fails because visual nodes are absent.

- [ ] **Step 3: Add card visual binding**

Add `Content/GlyphPresentation` above current labels with aspect-centered `GlyphTexture` and lower-right `GlyphNameLabel`. In `GlyphCard.bind`, resolve `StringName(_data.get("glyph_id", &""))`; unsupported IDs clear the texture and hide the label. Leave source/count/reservation/pointer logic unchanged.

- [ ] **Step 4: Verify GREEN**

Run `godot --headless --path . -s tests/test_runner.gd`. Expected: card visual assertions and reserved-card behavior pass.

- [ ] **Step 5: Commit**

Run `git add src/ui/spell_workflow/components/glyph_card.tscn src/ui/spell_workflow/components/glyph_card.gd tests/integration/test_circuit_placement_workflow_screen.gd` followed by `git commit -m "feat: render glyph art on placement cards"`.

### Task 4: Display-only star-circuit glyph slots

**Files:**
- Modify: `src/ui/components/star_circuit_board.tscn`
- Modify: `src/ui/components/star_circuit_board.gd`
- Modify: `src/ui/spell_workflow/circuit_placement_screen.gd`
- Modify: `tests/integration/test_star_ui_kit_scene.gd`
- Modify: `tests/integration/test_circuit_placement_workflow_screen.gd`

**Interfaces:**
- Produces `set_glyph_visuals(main_glyph_id: StringName, auxiliary_by_slot: Dictionary) -> void`.
- Produces `glyph_visual_snapshot() -> Dictionary` with copied IDs and `owns_gameplay_state: false`.
- Consumes snapshot `main.glyph_id`, `auxiliaries[].glyph_id`, and `auxiliaries[].slot`.

- [ ] **Step 1: Write failing board assertions**

Extend `test_star_ui_kit_scene.gd`: call `set_glyph_visuals(&"HEAT", {2: &"PROTECT"})`, then assert center texture exists, slot 2 texture exists, and an unbound slot has no texture. Extend circuit-placement coverage to assert its loaded snapshot reports center `HEAT`, slot 2 `PROTECT`, and display-only ownership.

- [ ] **Step 2: Verify RED**

Run `godot --headless --path . -s tests/test_runner.gd`. Expected: missing board API/nodes fail the new assertions.

- [ ] **Step 3: Add overlay and display-only binding**

Add an overlay with `CenterGlyphTexture`, `CenterGlyphNameLabel`, and `AuxGlyphTexture0..4` plus matching name labels. In `StarCircuitBoard`, preload the resolver, position overlays from its existing `_vertex_points(center)` geometry, and implement the binding:

```gdscript
func set_glyph_visuals(main_glyph_id: StringName, auxiliary_by_slot: Dictionary) -> void:
    _bind_visual_slot("Center", main_glyph_id)
    for slot in range(5):
        _bind_visual_slot("Aux%s" % slot, StringName(auxiliary_by_slot.get(slot, &"")))
```

`_bind_visual_slot` may only assign texture/name/visibility. In `CircuitPlacementScreen._render_board`, construct `{slot: glyph_id}` from current auxiliary records, read the main ID from `_placement_snapshot["main"]`, call `set_glyph_visuals`, then retain the existing `set_visual_state` call unchanged.

- [ ] **Step 4: Verify GREEN**

Run `godot --headless --path . -s tests/test_runner.gd`. Expected: sparse visual slots, state colors, and all interaction/transaction assertions pass.

- [ ] **Step 5: Commit**

Run `git add src/ui/components/star_circuit_board.tscn src/ui/components/star_circuit_board.gd src/ui/spell_workflow/circuit_placement_screen.gd tests/integration/test_star_ui_kit_scene.gd tests/integration/test_circuit_placement_workflow_screen.gd` followed by `git commit -m "feat: render glyph visuals on star circuit"`.

### Task 5: Truthful evidence and final validation

**Files:**
- Modify: `docs/planning/GRIMOIRE_GPT_WORK_IMAGE_GOAL_HANDOFF_2026-08-26.md`
- Modify: `docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json`

- [ ] **Step 1: Validate asset evidence before documentation**

Run a Python check that parses every `assets/manifests/glyph_*.json` and compares each export SHA-256 to its local PNG. Expected: approved manifests match their exports; no runtime-connection evidence is asserted yet.

- [ ] **Step 2: Record only verified runtime evidence**

Record Issue #179, resolver/UI scope, and automated result. Keep editor/import, 48/64/96px readability, 1280×720/1920×1080 capture, device, and performance as `NOT_RUN` unless actually evidenced. Preserve BURST’s temporary status.

- [ ] **Step 3: Run final checks**

Run `python tools/generate_project_operating_views.py --check`, `python -m unittest tests.test_base_v91_operating_contract tests.test_current_authority_reality_contract`, `godot --headless --path . -s tests/test_runner.gd`, and `git diff --check`. Expected: all available checks pass; if Godot is unavailable, retain its exact command result and do not elevate runtime validation.

- [ ] **Step 4: Commit**

Run `git add docs/planning/GRIMOIRE_GPT_WORK_IMAGE_GOAL_HANDOFF_2026-08-26.md docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json` followed by `git commit -m "docs: record IMG-01 runtime integration evidence"`.

## Plan self-review

- Spec coverage: resolver (Task 1), Task6 (Task 2), Task7 cards (Task 3), board/sparse slots (Task 4), provenance and honest gates (Task 5).
- Type consistency: all consumers use Task 1 APIs; board binding is exactly `set_glyph_visuals(main_glyph_id, auxiliary_by_slot)`.
- Placeholder scan: no unresolved placeholder or undefined hand-off remains.

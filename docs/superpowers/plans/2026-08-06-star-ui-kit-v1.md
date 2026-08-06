# GRIMOIRE Star Circuit UI Kit v1 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Convert the gray star-circuit Harness into a reusable Navy/Gold magic-academy UI Kit without changing gameplay behavior.

**Architecture:** Introduce a shared Theme factory, a reusable procedural star-board component, a small vector icon set, and theme variations applied to the existing Scene. Keep all state transitions and resource mutation in `star_circuit_harness.gd`; visual components receive read-only state updates.

**Tech Stack:** Godot 4.7.1 GDScript, Godot Theme/StyleBoxFlat, SVG, Python unittest contracts, Godot headless integration tests.

## Global Constraints

- Preserve `FIVE_POINT_STAR`, six runtime glyphs, Typed Stock, Mana, and Atomic Commit exactly.
- Parent visual decisions: `ART-STYLE-01`, `ART-BIBLE-01`, `ASSET-SPEC-01`, `GM-INGAME-ART-CHECKPOINT-01`.
- Use one shared Navy/Gold/Cyan Theme; no screen-specific duplicated frame set.
- Do not bake Korean or English text into images.
- Minimum interactive target remains 48×48.
- 1280×720 must not clip left/right rails or cover A0.
- Physical-device and human visual validation remain `NOT_RUN`.

---

### Task 1: UI Kit contract RED

**Files:**
- Create: `tests/test_star_ui_kit_contract.py`
- Create: `tests/integration/test_star_ui_kit_scene.gd`
- Modify: `tests/test_runner.gd`
- Modify: `.github/workflows/validate-star-runtime-poc.yml`

**Interfaces:**
- Consumes: design spec and existing Scene.
- Produces: required file paths, token values, theme variations, component paths, and visual-state assertions.

- [ ] Write Python contract requiring Theme factory, star-board component, SVG icons, Scene theme assignment, and approved token strings.
- [ ] Write Godot integration suite requiring instantiated components and visual state updates.
- [ ] Add the suite to `tests/test_runner.gd` and the Python contract to the Runtime workflow.
- [ ] Run CI and confirm failures are limited to missing UI Kit files and bindings.
- [ ] Commit RED evidence.

### Task 2: Shared Theme factory

**Files:**
- Create: `src/ui/theme/grimoire_theme_factory.gd`

**Interfaces:**
- Produces: `static func create_theme() -> Theme` and stable type variations `AcademyPanel`, `AcademyPanelEmphasis`, `AcademyButton`, `AcademyButtonPrimary`, `AcademyBadge`, `GlyphSlot`, `GlyphSlotMain`, `StatusBanner`, `StatusBannerWarning`, `StatusBannerSuccess`.

- [ ] Implement immutable color constants from the design spec.
- [ ] Implement shared StyleBoxFlat builders for panel, button, slot, and focus states.
- [ ] Register Label, Button, PanelContainer, and ProgressBar defaults with readable font sizes.
- [ ] Run focused contracts and fix only Theme failures.
- [ ] Commit Theme factory.

### Task 3: Reusable StarCircuitBoard

**Files:**
- Create: `src/ui/components/star_circuit_board.gd`
- Create: `src/ui/components/star_circuit_board.tscn`

**Interfaces:**
- Produces: `set_visual_state(state: StringName, active_vertices: int, cause_vertex: int = -1) -> void` and `visual_snapshot() -> Dictionary`.
- Consumes: no gameplay model; draw-only state.

- [ ] Draw five-point star, center ring, vertex rings, and subtle backplate guides.
- [ ] Support `EDIT`, `VALID`, `TARGET`, `FINAL`, `CONFIRM`, `COMMITTED`, `INVALID` visual states.
- [ ] Use cyan/gold/amber/red semantics with line pattern and label support outside the component.
- [ ] Verify reduced-motion behavior is immediate.
- [ ] Commit component.

### Task 4: Vector icon elements

**Files:**
- Create: `assets/art/ui/common/icon_phase_diamond.svg`
- Create: `assets/art/ui/common/icon_warning_diamond.svg`
- Create: `assets/art/ui/common/icon_typed_stock.svg`
- Create: `assets/art/ui/common/icon_mana.svg`
- Create: `assets/art/ui/common/academy_corner_ornament.svg`

**Interfaces:**
- Produces: text-free SVG assets with simple paths only.

- [ ] Create SVGs using approved Navy/Gold/Cyan semantics.
- [ ] Ensure no embedded raster, filter, font, or baked text.
- [ ] Run Python contract asset checks.
- [ ] Commit vector elements.

### Task 5: Apply UI Kit to Star Circuit Harness

**Files:**
- Modify: `src/ui/star_circuit_harness.tscn`
- Modify: `src/ui/star_circuit_harness.gd`

**Interfaces:**
- Consumes: `GrimoireThemeFactory.create_theme()` and `StarCircuitBoard.set_visual_state()`.
- Produces: same node paths required by existing interaction tests plus new component nodes.

- [ ] Apply shared Theme at root.
- [ ] Add background layers, central star board, phase badge, section headers, icon rows, and decorative corners.
- [ ] Apply type variations rather than per-node color duplication.
- [ ] Preserve every existing signal path and test-visible button path.
- [ ] Update visual state after reset, preview, target, confirm, commit, invalid, and insufficient-mana transitions.
- [ ] Replace placeholder hierarchy copy with Korean-first section labels while preserving test-required values through stable node content APIs.
- [ ] Run all Godot suites and focused Python contracts.
- [ ] Commit Scene visual pass.

### Task 6: Adversarial UX review and exact-head closure

**Files:**
- Create: `docs/planning/STAR_UI_KIT_V1_ADVERSARIAL_REVIEW_2026-08-06.md`
- Create: `docs/planning/sync/GR-SYNC-20260806-08-STAR-UI-KIT-V1.md`
- Modify authority and Sheet pointers only if all exact-head workflows pass.

**Interfaces:**
- Produces: explicit findings for hierarchy, clipping, state ambiguity, color-only signaling, decorative obstruction, and runtime overclaim.

- [ ] Inspect changed-file scope and ensure gameplay source files are unchanged.
- [ ] Verify existing interactive flow and resource invariants.
- [ ] Verify Theme/component tests, Planning/Base, Toolchain, Rights, and Physical Pack workflows on exact head.
- [ ] Record unresolved items as final art/font/device/human `NOT_RUN`.
- [ ] Open Draft PR, inspect comments/review threads, and merge only after exact-head PASS.
- [ ] Update Google Sheet with same Decision/Sync and main SHA after merge.

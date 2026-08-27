# Task11 Product Root Visual Surface Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Apply the persisted greenhouse background and existing Academy live theme to the current Product Root without changing spell-flow authority.

**Architecture:** `spell_workflow_product_root.tscn` owns a noninteractive background and readability veil. `GrimoireThemeFactory` remains the single live-theme owner; its default PanelContainer and Button styles make the existing screen tree readable without new texture variants. The integration test asserts only the asset and theme wiring, not pixels or gameplay internals.

**Tech Stack:** Godot 4.7.1, GDScript, `.tscn`, project integration runner.

**Spec:** `docs/planning/TASK11_PRODUCT_ROOT_VISUAL_SURFACE_2026-08-27.md`

## Global Constraints

- Reuse `res://assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp`; do not generate a new image.
- Retain the approved flow `글자 → 주문 → 대상 → 시전 → 결과` and all existing authority.
- Keep labels live and localizable; no baked functional text or values.
- Human, device, performance, export, and full-slice validation remain `NOT_RUN`.

---

### Task 1: Prove Product Root visual wiring is absent

**Files:**
- Modify: `tests/integration/test_spell_workflow_product_root.gd`
- Modify: `src/ui/spell_workflow/spell_workflow_product_root.tscn`
- Modify: `src/ui/theme/grimoire_theme_factory.gd`

**Interfaces:**
- Consumes: `res://assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp`, `GrimoireThemeFactory.create_theme()`.
- Produces: a noninteractive background and live Academy theme for the existing Product Root.

- [ ] **Step 1: Write the failing test**

```gdscript
case.assert_true(product_scene_source.contains("bg_greenhouse_field_base.webp"))
case.assert_true(product_scene_source.contains("theme = GrimoireThemeFactory.create_theme()"))
```

- [ ] **Step 2: Run it to verify it fails**

Run: project integration runner filtered to `test_spell_workflow_product_root.gd`.

- [ ] **Step 3: Add the smallest visual wiring**

Add the asset resource, full-rect TextureRect, noninteractive navy readability veil, and root theme assignment. Extend the existing factory with default `PanelContainer` and `Button` styles.

- [ ] **Step 4: Run focused and full checks**

Run: focused integration runner, full custom runner, Python current-authority contracts, and `git diff --check`.

- [ ] **Step 5: Render and record**

Run Product Root at 1280×720 through Hera; capture screenshot and diagnostics.

- [ ] **Step 6: Commit**

```text
feat(task11): apply greenhouse visual surface
```

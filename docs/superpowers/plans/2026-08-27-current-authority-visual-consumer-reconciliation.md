# Current Authority & Visual Consumer Reconciliation Plan

> **For agentic workers:** Use `superpowers:executing-plans` task by task. This is a documentation-and-structured-state correction only.

**Goal:** Make the durable routing and visual-consumer records say what current `main` actually runs after Task9.

**Design:** Read runtime facts first, make the authority test reject stale Task8/POC values, repair only primary records, regenerate derived views, then make narrow Notion current-state callouts. Historical documents remain as provenance rather than being rewritten as current truth.

**Spec:** `docs/superpowers/specs/2026-08-27-current-authority-visual-consumer-reconciliation-design.md`

## Task 1: Red authority contract

**Files:**
- Modify `tests/test_current_authority_reality_contract.py`

- [ ] Change the expected next gate and runtime-state expectations to Task9.
- [ ] Add assertions for six glyph runtime assets and the explicit unbound IMG-02 source-candidate status.
- [ ] Run this focused test and record the expected failure against the stale primary records.

## Task 2: Primary structured records

**Files:**
- Modify `skills/PROJECT_BASE_ADAPTER.json`
- Modify `skills/SKILL_REGISTRY.json`
- Modify `docs/DEVELOPMENT_GATES.md`
- Modify `docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json`
- Modify `docs/planning/visual/GRIMOIRE_VISUAL_PRODUCTION_CHECKLIST_2026-08-26.json`
- Modify `docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json`

- [ ] Preserve Task8 as recovery provenance but make Task9 the current gate.
- [ ] Record Product Root as the active runtime entry.
- [ ] Record six glyph files as current runtime consumers.
- [ ] Record IMG-02 only as persisted source candidates with no runtime binding on current `main`.
- [ ] Update registry SHA in the primary adapter after the registry is complete.

## Task 3: Derived views and green contracts

**Files:**
- Generated: `skills/PROJECT_SKILL_SNAPSHOT.json`
- Generated: `skills/BASE_V9_ADAPTER.json`
- Generated: `skills/PROJECT_BASE_SKILL_ADAPTER.json`
- Modify `tests/test_current_authority_reality_contract.py`

- [ ] Regenerate views with `tools/generate_project_operating_views.py`.
- [ ] Run the focused authority contract to green.
- [ ] Run the generator check and JSON syntax checks.

## Task 4: Human-facing sync

- [ ] Add a bounded current-state callout to Notion Visual Coverage and Image Handoff.
- [ ] Read both pages back to verify the callouts.
- [ ] Create a GitHub Issue and submit this isolated correction for review/merge only after all local checks pass.

## Verification

- `python -m unittest tests.test_current_authority_reality_contract`
- `python tools/generate_project_operating_views.py --check`
- JSON parse validation for edited JSON files
- `git diff --check`
- Fresh headless Godot product-root check only as a regression readback; it is not human/device/performance evidence.

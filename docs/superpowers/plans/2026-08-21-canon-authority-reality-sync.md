# GRIMOIRE Canon Authority Reality Sync Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make GRIMOIRE's active routing, generated operating views, current entry documents, and human-facing workspace reflect the already-existing Godot/Spell Workflow/Frostbloom reality while retiring Google Sheets from active authority without deleting historical provenance.

**Architecture:** Keep `skills/PROJECT_BASE_ADAPTER.json` as the canonical project routing source and keep generated compatibility views, but remove hard-coded planning-only/not-created assumptions from the generator. Treat Notion as human-facing canon and the repository as structured/runtime canon; retain `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` only as migration provenance until its unique-material audit is complete. Do not touch open PR #151 or any product/runtime path.

**Tech Stack:** Python 3.12 unittest, JSON project adapters, GitHub Actions, Markdown authority docs, Notion readback.

**Spec:** User-approved PHASE A audit result in this conversation; Base current `docs/operations/PROJECT_WORKSPACE_AUTHORITY_CONTRACT.json` and `docs/DEPRECATED_PROJECT_SURFACE_RETIREMENT_POLICY.md`.

## Global Constraints

- Current GRIMOIRE base main at work-unit start: `bdf964629b08204666905996c587e5e99ad0b32c`.
- Current Base live observation at work-unit start: `aa9a0d823db9c7373751d35d341489f64c62f7b9`; Base project pin remains `v9.4.3` and is not upgraded by this work.
- Open draft PR #151 is read-only and must not be modified, closed, merged, rebased, or have its changed files reused by this correction.
- No `src/**`, `data/**`, `assets/**`, `addons/**`, `project.godot`, Scene, Resource, gameplay rule, balance, or runtime behavior change.
- Notion = human-facing project canon; repository = structured/runtime canon.
- Google Sheets = `MIGRATION_ONLY_UNTIL_REMOVAL`; historical files and sync receipts remain provenance and are not rewritten.
- Do not claim Task8 merged/current-local evidence, Human, Device, Performance, export, or Full Vertical Slice PASS.
- Current product stage remains `DEMO_FIRST_VERTICAL_SLICE`; implementation is `PARTIAL_FOUNDATION`, not complete.
- Current default Godot main scene remains `res://src/ui/star_circuit_harness.tscn` and is explicitly classified as a development/runtime POC entry, not the finished first-session product root.

---

### Task 1: Current-authority reality contract RED

**Files:**
- Create: `tests/test_current_authority_reality_contract.py`
- Modify: `.github/workflows/validate-base-v9-adoption.yml`

**Interfaces:**
- Consumes: existing Adapter, Registry, generator, `project.godot`, current entry docs.
- Produces: executable requirements for authority roles, real project state, and retired Sheet routing.

- [ ] Write a focused unittest requiring: `project.godot` exists; Adapter says project created and partial implementation; runtime evidence is automated only; next product gate is Task8 PR-prep reverify; `gdd_sheet.role=MIGRATION_ONLY_UNTIL_REMOVAL`; active entrypoints do not include `google_sheet_contract`; Registry does not expose `project_sheet` as active execution contract; generated views derive engine/execution state from Adapter rather than hard-coded NOT_CREATED/PLAN values.
- [ ] Register only this focused test in `validate-base-v9-adoption.yml`.
- [ ] Open a Draft PR and verify RED occurs on stale current authority, not syntax or infrastructure.

### Task 2: Canonical Adapter and Registry correction

**Files:**
- Modify: `skills/PROJECT_BASE_ADAPTER.json`
- Modify: `skills/SKILL_REGISTRY.json`

**Interfaces:**
- Consumes: current repository reality and Base domain-split authority.
- Produces: corrected canonical routing source and project registry.

- [ ] Set current project state to `CREATED`, `PARTIAL_FOUNDATION`, `DEMO_FIRST_VERTICAL_SLICE`, Task8 PR-prep reverify next gate, and preserve all evidence ceilings.
- [ ] Change Sheet metadata to migration-only provenance; remove Sheet from active entrypoint/execution-contract routing.
- [ ] Set Registry product/platform/implementation fields to current reality and Base release identity to v9.4.3 compatibility without changing the Base pin.
- [ ] Recompute Adapter `project_registry.sha256` from the exact updated Registry bytes.

### Task 3: Generator and generated-view correction

**Files:**
- Modify: `tools/generate_project_operating_views.py`
- Regenerate: `skills/PROJECT_SKILL_SNAPSHOT.json`
- Regenerate: `skills/BASE_V9_ADAPTER.json`
- Regenerate: `skills/PROJECT_BASE_SKILL_ADAPTER.json`

**Interfaces:**
- Consumes: corrected Adapter.
- Produces: compatibility views that cannot reintroduce NOT_CREATED / PLANNING_ONLY drift.

- [ ] Replace hard-coded maturity, engine, execution-profile, work-mode, and Sheet-active output with Adapter-derived fields.
- [ ] Keep `--check` deterministic.
- [ ] Regenerate outputs exactly from the generator and verify the focused test is GREEN.

### Task 4: Active authority docs and Sheet retirement state

**Files:**
- Modify: `AGENTS.md`
- Modify: `START_HERE.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/DEVELOPMENT_GATES.md`
- Modify: `docs/planning/PROJECT_CANON_SYNC_POLICY.md`
- Modify: `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
- Create: `docs/planning/sync/GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC.md`

**Interfaces:**
- Consumes: corrected canonical Adapter/Registry and live `main` evidence.
- Produces: one current human/machine routing story with historical provenance preserved.

- [ ] Promote current product state to planning complete + partial foundation + Task8 remote/local reverify required; preserve Star Harness as development POC.
- [ ] Replace active GitHub+Sheet synchronization instructions with Notion human canon + repository structured/runtime canon.
- [ ] Mark the workbook `MIGRATION_ONLY_UNTIL_REMOVAL / BLOCKED_UNVERIFIED_UNIQUE_MATERIAL`; do not delete it or historical Sheet receipts.
- [ ] Record that Task8 local head `8c611f...` is historical local acceptance evidence, not currently reachable remote product authority.

### Task 5: Exact-head verification, adversarial review, merge, and Notion readback

**Files:**
- No product files.
- Notion Project Home and Work Master: bounded property/content readback after merged-main.

**Interfaces:**
- Consumes: exact PR head.
- Produces: merged-main authority and human-facing sync state.

- [ ] Run all applicable PR workflows and require exact-head terminal success; no `NOT_RUN` category may be upgraded by CI.
- [ ] Confirm changed paths do not overlap PR #151 changed files and no product path changed.
- [ ] Run five adversarial passes: omission, contradiction, legacy leakage, evidence inflation, open-PR overlap.
- [ ] Merge only with expected exact head.
- [ ] Read back new `main`.
- [ ] Update Notion Project Home/Work Master to the merged SHA/current implementation reality and remove false `SYNCED` claims where a conflict remains.
- [ ] Read back Notion destination fields before reporting completion.

## Self-Review

- Spec coverage: current state, authority split, Sheet retirement, open PR protection, evidence ceiling, generated-view drift, postmerge Notion readback are all assigned to explicit tasks.
- Placeholder scan: no TODO/TBD/implementation placeholder remains.
- Type consistency: Adapter remains the generator source; generated views consume Adapter fields only; historical workbook remains provenance instead of an active authority.

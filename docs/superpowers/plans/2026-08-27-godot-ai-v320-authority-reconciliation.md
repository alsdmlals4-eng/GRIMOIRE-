# Godot AI v3.2.0 Authority Reconciliation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make the already-tracked official Godot AI v3.2.0 vendor tree and the active project authority contracts agree without rewriting v3.1.x provenance.

**Architecture:** Keep `addons/godot_ai` unchanged: it already equals the official v3.2.0 plugin subtree. Add a new v3.2.0 provenance record, promote only current mutable authority surfaces and their semantic contract tests, and leave v3.1.2–v3.1.4 files as history. The Task8 product branch remains untouched and is revalidated only after this baseline PR lands.

**Tech Stack:** Git, Python `unittest`, Markdown/JSON contracts, Godot project metadata, GitHub Actions.

**Spec:** GitHub Issue #188 — Reconcile tracked Godot AI v3.2.0 with current authority contracts.

## Global Constraints

- Do not modify `addons/godot_ai/**`, `project.godot`, Task5–Task8 product code, scenes, or tests.
- Official evidence is tag `v3.2.0` commit `42c44e4d02ca1836a0e1866361509d3a14d83b0c` and plugin subtree `66a9df59a92f0029efcd35c22fea355c93e8fe49`.
- Preserve v3.1.2–v3.1.4 records as `HISTORICAL_PROVENANCE`; do not relabel their past sessions or receipts as v3.2.0 evidence.
- Do not upgrade human, device, performance, or full-slice validation claims.
- Persistent Godot authoring remains Godot AI/HiGodot-only; this task is documentation and contract verification, not engine authoring.

---

### Task 1: Define the v3.2.0 current-vendor contract

**Files:**
- Create: `docs/validation/HIGODOT_V3_2_0_VENDOR_INTEGRITY.json`
- Modify: `tests/test_higodot_v3_1_4_tracked_reconciliation.py`
- Test: `tests/test_higodot_v3_1_4_tracked_reconciliation.py`

**Consumes:** current tracked addon tree and the official v3.2.0 tag/tree evidence from Issue #188.

**Produces:** an explicit current `v3.2.0` exact-tree contract while retaining the existing v3.1.4 history test.

- [x] **Step 1: Write the failing current-tree assertion**

Add a test named `test_tracked_plugin_is_exact_official_v320_tree` that asserts `version="3.2.0"` and exact tree `66a9df59a92f0029efcd35c22fea355c93e8fe49`.

- [x] **Step 2: Run the focused test to verify RED**

Run: `python -m unittest tests.test_higodot_v3_1_4_tracked_reconciliation.HiGodotV314TrackedReconciliationTests.test_tracked_plugin_is_exact_official_v320_tree -v`

Expected: FAIL because the v3.2.0 contract test does not yet exist.

- [x] **Step 3: Add the minimal current-vendor evidence and test constants**

Create the JSON record with release/tag/subtree identity, the main commit introducing the vendor tree, and explicit limits that historical live session/receipt claims remain v3.1.4 history. Keep the existing v3.1.4 evidence assertions unchanged.

- [x] **Step 4: Run the focused test to verify GREEN**

Run: `python -m unittest tests.test_higodot_v3_1_4_tracked_reconciliation -v`

Expected: PASS with the historical v3.1.4 assertions and the new current v3.2.0 exact-tree assertion.

### Task 2: Promote current authority surfaces without rewriting history

**Files:**
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/DEVELOPMENT_GATES.md`
- Modify: `.github/workflows/validate-godot-authoring-gut-authority.yml`
- Modify: `tests/test_godot_authoring_gut_authority_contract.py`
- Test: `tests/test_godot_authoring_gut_authority_contract.py`

**Consumes:** Task 1’s v3.2.0 evidence; current project source-of-truth rules.

**Produces:** current owner documents that identify v3.2.0 as tracked-vendor authority while Sync20 and its v3.1.4 live-session fields remain history-only.

- [x] **Step 1: Write failing assertions for the new current authority**

Change the active tracked-plugin assertion to require `3.2.0`, tree `66a9df59a92f0029efcd35c22fea355c93e8fe49`, and the v3.2.0 evidence file. Retain Sync20's v3.1.4 live-session assertions as historical provenance.

- [x] **Step 2: Run the focused test to verify RED**

Run: `python -m unittest tests.test_godot_authoring_gut_authority_contract.GodotAuthoringGutAuthorityContractTests.test_sync20_machine_state_records_current_tool_authority -v`

Expected: FAIL because the tracked-plugin assertion still requires v3.1.4.

- [x] **Step 3: Update only current mutable surfaces**

Set current tracked-vendor fields to v3.2.0 and the exact v3.2.0 tree. Name `v3.1.4` evidence and Sync20's live session as historical provenance; do not alter Sync20 JSON or manufacture a v3.2.0 live-session or authoring-receipt claim.

- [x] **Step 4: Run focused contract tests to verify GREEN**

Run: `python -m unittest tests.test_godot_authoring_gut_authority_contract -v`

Expected: PASS; historical v3.1.x evidence tests remain intact.

### Task 3: Freshness and exact-head validation

**Files:**
- Modify: `docs/superpowers/plans/2026-08-27-godot-ai-v320-authority-reconciliation.md`

**Consumes:** Task 1 and Task 2 changes.

**Produces:** reproducible proof that current consumers agree and Task8 stays outside the diff.

- [x] **Step 1: Verify version propagation and historical preservation**

Run: `rg -n 'v3\\.2\\.0|3\\.2\\.0|v3\\.1\\.4|3\\.1\\.4' AGENTS.md START_HERE.md docs tests .github`

Expected: v3.2.0 occurs in current vendor authority and tests; v3.1.4 remains in history-only evidence and explicitly historical references.

- [x] **Step 2: Run the authority workflow’s local commands**

Run every `python -m unittest` module referenced by `.github/workflows/validate-godot-authoring-gut-authority.yml`.

Expected: all modules pass from the exact branch head.

- [x] **Step 3: Run reference freshness and diff checks**

Run a manual impact map and version scan because this project has no `.github/reference-freshness.json` configuration: `rg -n 'v3\\.2\\.0|3\\.2\\.0|v3\\.1\\.4|3\\.1\\.4' AGENTS.md START_HERE.md docs tests .github`.

Run: `git diff --check c0b4d45f52204b59844eda9fcd0b2b2bdda9a127...HEAD`

Expected: no blocking stale active reference or whitespace error; v3.1.4 matches are history-only; Task8 paths do not appear in the diff.

- [x] **Step 4: Record results in this plan and commit**

Mark only actually completed steps, then run `git status --short`, stage only the listed authority contract files, and commit with `fix(authority): reconcile Godot AI v3.2.0 contracts`.

**Recorded results (2026-08-27):** The new v3.2.0 evidence test failed first because its evidence record did not exist, then passed. The active-context assertion failed first because current tracked-vendor metadata was absent, then passed. All 15 modules from `validate-godot-authoring-gut-authority.yml` passed locally after the reconciliation. The repository has no `.github/reference-freshness.json`; manual impact mapping and version scan classified v3.1.4 matches as historical evidence or historical locators, and renamed the active CI step to version-neutral wording. Task8 product paths are absent from this branch diff.

# GRIMOIRE v4.5 r2 Contract Binding Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace GRIMOIRE's current v4.4 project binding with the user-approved `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION` v4.5 r2 thin-adapter binding without erasing v4.4 history or weakening existing tool/evidence gates.

**Architecture:** Add a GRIMOIRE-specific v4.5 binding document and sync record under new Decision `GM-CONTRACT-V4-5-BINDING-01` / Sync `GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING`. Current cold-start and machine state consumers move to v4.5, while v4.3/v4.4 binding documents and their historical evidence remain immutable history. Existing HiGodot/GUT/Hera/supply-chain/product decisions are consumed, not re-created.

**Tech Stack:** Markdown/YAML-like project canon, JSON state, Python `unittest`, GitHub Actions, Google Sheets.

## Global Constraints

- Base current authority is re-fetched at execution time; current observed Base main is `315c66eea9614c284b9c11c4d522141065dfa4b0` and the v4.5 source's `7ce3fb64...` is historical only.
- Repository: `alsdmlals4-eng/GRIMOIRE-`; Sheet: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`.
- Local/Godot path: `C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-`.
- `adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON`.
- `base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK`.
- `base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ`.
- Superpowers and similar frameworks remain `EXTERNAL_PROCESS_OVERLAY`; they do not own project/Base canon.
- HiGodot/Godot AI v3.1.3 remains sole persistent Godot authoring authority.
- GUT v9.7.1 remains deterministic GDScript test authority; Hera v1.0.0 remains live QA/observability only and may not persist source mutations.
- `GM-SPELL-WORKFLOW-UI-V2-01` remains unchanged: Task 7 merged, Task 8 next.
- Human/device/performance/full-vertical-slice/export/audio/local evidence remains exactly at its current verified or NOT_RUN state.
- v4.4 binding is retained as historical evidence, never deleted or rewritten as if false.

---

### Task 1: Define v4.5 binding contract test

**Files:**
- Create: `tests/test_v4_5_contract_binding.py`
- Modify: `.github/workflows/validate-godot-authoring-gut-authority.yml`

**Interfaces:**
- Consumes: v4.5 r2 source contract, current `main` cold-start surfaces.
- Produces: fail-closed assertions for new binding Decision/Sync, thin-adapter/Base policies, GRIMOIRE inputs, preserved tool/product/evidence boundaries, and historical v4.4 retention.

- [ ] **Step 1: Write the failing test** asserting the v4.5 binding file exists and current surfaces advertise v4.5 / `GM-CONTRACT-V4-5-BINDING-01` while v4.4 binding remains historical.
- [ ] **Step 2: Add the test to the authority workflow** after historical v4.4 binding verification.
- [ ] **Step 3: Open a Draft PR and verify RED** because the new binding/current promotion does not exist yet.

### Task 2: Add GRIMOIRE v4.5 r2 binding and transition record

**Files:**
- Create: `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md`
- Create: `docs/planning/sync/GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING.md`

**Interfaces:**
- Consumes: current Base main, v4.5 r2 source policies, GRIMOIRE repo/path/Sheet/tool state.
- Produces: project-specific v4.5 binding and durable transition provenance.

- [ ] **Step 1: Write the minimal binding** with GRIMOIRE paths and same authority boundaries.
- [ ] **Step 2: Explicitly classify source snapshot `7ce3fb64...` as historical and current Base `315c66ee...` as live observation only, never permanent authority.**
- [ ] **Step 3: Record explicit user approval and continuous-work execution scope so the source document's instruction-authoring guard is not misread as blocking this requested repository migration.**

### Task 3: Promote current human/machine consumers to v4.5

**Files:**
- Modify: `START_HERE.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/DEVELOPMENT_GATES.md`
- Modify: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- Modify: `docs/planning/CURRENT_UNRESOLVED_GATES.md`
- Modify: `docs/planning/CANON_SYNC_STATE.json`
- Modify: `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
- Modify: `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`

**Interfaces:**
- Consumes: binding from Task 2 and existing current Task7/tool/evidence state.
- Produces: one current contract answer: v4.5 r2.

- [ ] **Step 1: Change only active contract fields/Decision/Sync and Base observation metadata.**
- [ ] **Step 2: Preserve Task7→Task8, HiGodot/GUT/Hera, supply-chain, Star Circuit, and all NOT_RUN boundaries.**
- [ ] **Step 3: Preserve v4.4 provenance in explicit historical sections/fields.**

### Task 4: Convert v4.4 tests from current authority to historical compatibility

**Files:**
- Modify: `tests/test_v4_4_contract_binding.py`
- Modify: current-state tests that hardcode v4.4 as active only where they conflict with the approved transition.

**Interfaces:**
- Consumes: v4.5 current authority and retained v4.4 binding.
- Produces: tests that protect v4.4 history without blocking v4.5 current state.

- [ ] **Step 1: Keep assertions that v4.4 binding/history exists and preserves its original Decision/inputs.**
- [ ] **Step 2: Remove only assertions that require v4.4 to remain current; replace them with v4.5 current assertions in `test_v4_5_contract_binding.py`.**
- [ ] **Step 3: Run exact-head CI and inspect each newly exposed stale consumer rather than weakening broad validation.**

### Task 5: Sync Google Sheet under same v4.5 Decision/Sync

**Files:** Google Sheet tabs `00`, `01`, `02`, `04`, `99`.

**Interfaces:**
- Consumes: exact-head GitHub binding state.
- Produces: Sheet current contract = v4.5 r2, plus durable history row.

- [ ] **Step 1: Update Hub/work-order/current-decisions with `GM-CONTRACT-V4-5-BINDING-01`.**
- [ ] **Step 2: Add audit/history rows under `GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING`.**
- [ ] **Step 3: Explicitly re-read all written ranges before promoting `SHEET_WRITE_READBACK_PASS`.**

### Task 6: Adversarial regression, merge, and post-merge readback

**Files:** no new product files.

**Interfaces:**
- Consumes: PR exact HEAD, tests, Sheet readback.
- Produces: merged v4.5 current canon with preserved history.

- [ ] **Step 1: Attack for accidental v4.4 deletion, Base snapshot freezing, tool authority broadening, evidence overclaim, product-scope change, and untouched current consumers.**
- [ ] **Step 2: Require exact HEAD unchanged, all applicable CI success, review threads 0, and Sheet readback PASS.**
- [ ] **Step 3: Squash merge under inherited approval.**
- [ ] **Step 4: Re-read new `main`, current docs, open PRs, and Sheet; report any remaining conflict before Task 8 work.**

# GRIMOIRE v4.4 Binding and GUT Finalization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Bind the uploaded v4.4 project contract to GRIMOIRE, reconcile the current entry state, and finish only the already-approved GUT 9.7.1 formal-adoption gates before PR #82 Task 2 can resume.

**Architecture:** Keep PR #85 as the single in-flight GUT adoption branch. Add v4.4 as an operational binding without changing product Godot files, prove legacy-required-contract parity and the no-protected-Godot-diff HiGodot receipt condition with fail-closed tests, then synchronize the same Decision IDs to the Sheet and revalidate the exact head. Historical v4.3 records remain history and are not rewritten as if they never existed.

**Tech Stack:** GitHub Actions, Python 3.12 unittest, Godot 4.7.1, GUT 9.7.1, Google Sheets.

## Global Constraints

- Active uploaded contract: `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION` v4.4.
- Binding Decision ID: `GM-CONTRACT-V4-4-BINDING-01`.
- Base current main observed for this entry: `fa69a77a14f923a756064f6ae151d34cadb374f7`.
- Project remote: `alsdmlals4-eng/GRIMOIRE-`; project main observed: `563c2b08cb96354fdd7209a32d7fd8ec26bb334c`.
- Existing GUT authority Decision: `GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01`.
- Approved vendor equivalence Decision: `GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01`.
- Public Actions Decision: `GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01`.
- Keep GUT editor plugin disabled.
- Do not claim full GUT vendor-tree identity.
- Do not modify `project.godot`, `*.tscn`, `*.tres`, `*.res`, Scene/Node/Resource/Theme/Animation/Project Settings in this finalization package.
- HiGodot is the sole persistent Godot authoring authority; if protected Godot diff is zero, the authoring manifest is not required but the zero-diff condition must be proven.
- Codex handoff remains `NOT_REQUESTED`.
- PR #82 Task 2 stays unauthorized until GUT formal adoption is merged and main readback passes.
- Local Windows checkout, local Godot execution, Local Godot Reference shelf, shared audio vault, and Hera exact pair remain unverified from this execution environment unless separately evidenced.

---

### Task 1: Bind v4.4 and reconcile the live entry state

**Files:**
- Test: `tests/test_v4_4_contract_binding.py`
- Create: `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md`
- Create: `docs/planning/ENTRY_STATE_RECONCILIATION_V4_4.md`
- Modify: `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
- Modify: `.github/workflows/validate-godot-authoring-gut-authority.yml`

**Interfaces:**
- Consumes: uploaded v4.4 contract, current Base main, current project main, PR #85/PR #82, live Google Sheet.
- Produces: active working-branch contract binding and reconciled blocker list.

- [x] **Step 1: Write the failing v4.4 contract test.**
- [x] **Step 2: Verify RED because the v4.4 binding is absent.**
- [ ] **Step 3: Add the minimal binding and reconciliation records.**
- [ ] **Step 4: Update authority state without claiming formal adoption, visual/audio completion, or PR #82 authorization.**
- [ ] **Step 5: Run the authority contract and keep all historical v4.3 evidence intact.**

---

### Task 2: Prove legacy required-contract parity

**Files:**
- Create: `docs/validation/GUT_LEGACY_REQUIRED_CONTRACT_PARITY.json`
- Create: `tests/test_gut_legacy_contract_parity.py`
- Create: `tests/gut/unit/test_glyph_definition.gd`
- Modify: `.github/workflows/validate-gut-formal-adoption.yml`

**Interfaces:**
- Consumes: `tests/test_runner.gd`, `tests/unit/test_glyph_definition.gd`, and product glyph-definition API.
- Produces: one machine-readable required parity pair with both legacy and GUT suites present and executed.

- [ ] **Step 1: Add a failing parity-manifest contract test.**
- [ ] **Step 2: Confirm RED because the manifest/GUT parity suite is absent.**
- [ ] **Step 3: Port the same public `GlyphDefinition` behavior to a GUT suite without changing product code.**
- [ ] **Step 4: Add the parity manifest and require it in CI.**
- [ ] **Step 5: Verify legacy runner and GUT both pass on exact head.**

---

### Task 3: Prove the HiGodot receipt gate for a zero protected diff

**Files:**
- Create: `tests/test_higodot_authoring_receipt_gate.py`
- Modify: `.github/workflows/validate-gut-formal-adoption.yml`
- Modify: `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`

**Interfaces:**
- Consumes: PR base/head Git diff and the protected Godot path contract.
- Produces: `HIGODOT_AUTHORING_RECEIPT_GATE_PASS_NO_PROTECTED_GODOT_DIFF` when and only when protected diff is zero.

- [ ] **Step 1: Add a failing static contract for the receipt-gate workflow.**
- [ ] **Step 2: Add full-history checkout and a fail-closed protected-path diff check.**
- [ ] **Step 3: Record PASS only from the actual current PR diff; otherwise require a HiGodot manifest.**

---

### Task 4: Role-separated review, unresolved-zero, and Sheet synchronization

**Files:**
- Create: `docs/reviews/PR85_GUT_FORMAL_ADOPTION_ROLE_SEPARATED_REVIEW_2026-08-08.md`
- Modify: `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
- Modify: PR #85 body/title as needed.
- Update Google Sheet rows using the same Decision IDs.

**Interfaces:**
- Consumes: exact-head diff, CI results, review-thread state, v4.4 Entry Gate, current Sheet rows.
- Produces: role-separated review evidence and a synchronized formal-adoption state.

- [ ] **Step 1: Review exact-head diff independently from implementer claims.**
- [ ] **Step 2: Require P0/P1 = 0 and unresolved review threads = 0.**
- [ ] **Step 3: Write/read back Sheet state with `GM-CONTRACT-V4-4-BINDING-01` plus existing GUT Decisions.**
- [ ] **Step 4: Mark formal-adoption blockers zero only if parity, receipt, hosted GUT/JUnit/hash, and review gates all pass.**

---

### Task 5: Exact-head validation, merge, and main readback

**Files:**
- No new product files.
- Post-merge cold-start/current-state documents may be finalized in a separate minimal follow-up if GitHub main has advanced since the PR base.

**Interfaces:**
- Consumes: final PR #85 exact head and repository required checks.
- Produces: merged-main GUT formal-adoption evidence or a precise blocked status.

- [ ] **Step 1: Re-read PR head/base/test-merge identities and all current checks.**
- [ ] **Step 2: Confirm unresolved review threads = 0 and approved scope only.**
- [ ] **Step 3: Merge without re-asking approval only if v4.4 `APPROVED_ITEM_INHERITS_MERGE_AUTHORITY` conditions are satisfied and repository policy permits it.**
- [ ] **Step 4: Re-read merged main and update Sheet/history.**
- [ ] **Step 5: Keep local Fetch/Pull and clean Godot Project Play as `BLOCKED_NO_LOCAL_ACCESS` unless actually performed on the user's checkout.**

# Task8 Preservation Observation + Reconciliation Prep Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Promote the successful user-machine Task8 preservation receipt into current authority and provide a fail-closed PowerShell route that creates a separate clean reconciliation worktree from an exact fetched `origin/main` without mutating either historical Task8 worktree.

**Architecture:** Keep the preserved historical worktrees frozen. Repository authority records the observed preservation receipt. A new prep tool verifies the external snapshot manifests and exact observed candidate identities, fetches `origin`, requires an explicit expected current-main SHA, and creates a new reconciliation branch/worktree only when the target path/branch do not already exist. It never pulls or rewrites the ordinary checkout and never resets/cleans/stashes either historical worktree.

**Tech Stack:** PowerShell, Git worktrees, Python `unittest`, GitHub Actions.

**Spec:** `docs/planning/TASK8_LOCAL_RECOVERY_EXECUTOR_PACKET_2026-08-24.md` and `docs/planning/TASK8_LOCAL_RECOVERY_OBSERVATION_2026-08-24.md`.

## Global Constraints

- Active project contract: v4.8 r2.
- Primary preserved candidate: `feat/task8-spell-use-screen-v2@8c611f601aa98397ed1558e92ab207e0e8347a9b`.
- Secondary/reference candidate: `task8/spell-use-screen@fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f`.
- User-machine preservation receipt observed: `TASK8_CANDIDATES_PRESERVED`, `source_unchanged=true`, `source_content_unchanged=true`.
- Historical worktrees remain read-only recovery evidence.
- Persistent Godot authoring remains HiGodot-only.
- Product/runtime source is not changed in this work unit.
- Google Sheets remains migration-only; current Sheet drift is audit evidence, not a new canon write target.

---

### Task 1: Promote preservation observation

**Files:**
- Create: `docs/planning/TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVATION_2026-08-24.md`
- Modify: `AGENTS.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `START_HERE.md`
- Test: `tests/test_task8_preservation_observed_reconciliation_prep.py`

**Interfaces:**
- Consumes: user-machine preservation JSON receipt.
- Produces: current gate `TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED`.

- [ ] Write the failing current-state contract.
- [ ] Run CI and confirm failure is missing preservation-observation/current-gate promotion.
- [ ] Add the bounded observation receipt and update only current routing fields.
- [ ] Re-run current-state tests to GREEN.

### Task 2: Add fail-closed clean reconciliation prep tool

**Files:**
- Create: `tools/task8_prepare_clean_reconciliation.ps1`
- Extend: `tests/test_task8_preservation_observed_reconciliation_prep.py`
- Modify: `.github/workflows/validate-current-state-sync.yml`

**Interfaces:**
- Consumes: repository path, external snapshot root, explicit expected `origin/main` SHA, explicit reconciliation worktree path.
- Produces: JSON receipt with `TASK8_CLEAN_RECONCILIATION_WORKTREE_READY`, clean worktree path/branch/head, and preserved-candidate verification result.

- [ ] Extend the test with a temporary local bare `origin` fixture and preserved-manifest fixture.
- [ ] Confirm RED because the prep tool does not exist.
- [ ] Implement the minimum safe tool: identity/snapshot verification → `git fetch origin` → exact `origin/main` SHA check → branch/path collision checks → `git worktree add -b` → clean-head verification.
- [ ] Confirm historical source worktree refs/status/index are not mutated by the tool fixture.
- [ ] Re-run the complete current-state suite to GREEN.

### Task 3: Verify and integrate

**Files:** no new product files.

- [ ] Verify changed paths contain no `src/**`, `data/**`, `assets/**`, `.gd`, `.tscn`, `.tres`, `.res`, or `project.godot` product mutation.
- [ ] Run exact-head CI.
- [ ] Perform at least five whole-state adversarial review loops on the same head.
- [ ] Require review threads 0 and no unrelated open PR takeover.
- [ ] Merge with expected-head protection.
- [ ] Read back merged `main`.
- [ ] Update Issue #111 and Notion Project Registry with the merged main SHA and `actual_local_preservation: OBSERVED_PASS`; keep reconciliation/HiGodot/product/Human/Device/Performance/Export/Full Slice unpromoted until actually run.
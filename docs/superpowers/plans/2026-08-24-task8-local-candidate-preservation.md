# Task8 Local Candidate Preservation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Preserve the two observed local-only Task8 worktrees outside the GRIMOIRE repository without mutating either source worktree, and emit a verifiable receipt before any local synchronization.

**Architecture:** Add one repository-owned PowerShell preservation tool plus focused Python contract tests. The tool fail-closes on source identity mismatch or an unsafe destination, copies every existing tracked-dirty and untracked file into an external snapshot, writes working/cached binary diffs and metadata, hashes copied files, then proves source branch/HEAD/status/index/refs are unchanged before reporting `TASK8_CANDIDATES_PRESERVED`.

**Tech Stack:** PowerShell 7 / Windows PowerShell compatible syntax, Git CLI read-only inspection, Python `unittest` contract tests, GitHub Actions.

**Spec:** `docs/planning/TASK8_LOCAL_RECOVERY_OBSERVATION_2026-08-24.md`

## Global Constraints

- Primary source identity: `feat/task8-spell-use-screen-v2` @ `8c611f601aa98397ed1558e92ab207e0e8347a9b`.
- Secondary source identity: `task8/spell-use-screen` @ `fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f`.
- Source worktrees are read-only: no fetch, pull, checkout, switch, reset, restore, clean, stash, add, commit, merge, rebase, cherry-pick, or source file writes.
- Destination must resolve outside the repository and both candidate worktrees.
- Never overwrite an existing snapshot run directory.
- Preserve all currently existing tracked-dirty and untracked files, not only Task8-named paths; this keeps unrelated dirt separable during later reconciliation instead of silently losing it.
- Store source status/name-status plus working/cached binary diffs as evidence, but never treat those files as current-main compatibility proof.
- Persistent Godot product authoring remains `HIGODOT_ONLY`; this tool only copies recovery evidence.
- Task8 product remains UNMERGED after preservation; Human/Device/Performance/Export/Full Slice remain NOT_RUN.

---

### Task 1: Preservation contract regression

**Files:**
- Create: `tests/test_task8_local_candidate_preservation_contract.py`
- Create later in GREEN: `tools/task8_local_candidate_preserve.ps1`

**Interfaces:**
- Consumes: `-Repo <ordinary checkout>`, `-DestinationRoot <external directory>`.
- Produces: JSON stdout receipt with `status`, `snapshot_root`, `source_unchanged`, and two candidate receipts.

- [ ] **Step 1: Write the failing tests**

Cover:
- tool exists and contains the exact primary/secondary branch + SHA defaults;
- mutating Git verbs are absent;
- unsafe destination under the repo fails before creating a snapshot;
- wrong candidate branch/HEAD fails closed;
- a temporary fixture with two worktrees preserves tracked dirty + untracked file bytes, writes manifests/diffs, and leaves refs/status/index byte-identical.

- [ ] **Step 2: Run the focused current-state workflow and verify RED**

Run through the existing PR workflow that executes project Python contract tests. Expected: the new preservation contract fails because `tools/task8_local_candidate_preserve.ps1` is absent.

### Task 2: Minimal read-only-source preservation implementation

**Files:**
- Create: `tools/task8_local_candidate_preserve.ps1`
- Modify only if needed for contract clarity: `tests/test_task8_local_candidate_preservation_contract.py`

**Interfaces:**
- Defaults to the observed Task8 identities above.
- Optional expected identity parameters exist only to let the integration test construct disposable fixture SHAs; every receipt records the identities actually enforced.
- Creates a unique child directory under `-DestinationRoot`; never deletes or overwrites an existing snapshot.

- [ ] **Step 1: Validate all source identities before destination creation**

For each candidate, read `rev-parse --show-toplevel`, branch, HEAD, status, tracked working/cached name lists, untracked paths, index path/hash. Fail if the expected branch/HEAD differs or either candidate is missing.

- [ ] **Step 2: Validate destination boundary**

Canonicalize the repository, candidate roots, and destination root. Reject destination roots inside the repository/candidate trees. Create only a new unique snapshot child directory outside those roots.

- [ ] **Step 3: Capture preservation data**

For each candidate:
- copy every existing tracked working/cached dirty file preserving relative paths;
- copy every untracked file preserving relative paths;
- write `working.patch` and `cached.patch` with `git diff --binary --full-index` using command-local line-ending configuration;
- write `manifest.json` with branch/HEAD, name-status lists, copied relative paths, and SHA-256 for each copied file.

- [ ] **Step 4: Verify source did not change**

Re-read branch, HEAD, status, repository refs, and index SHA-256 after preservation. If any differs, return a blocked receipt and do not claim preservation success.

- [ ] **Step 5: Emit bounded JSON receipt**

Successful stdout contract:

```json
{
  "status": "TASK8_CANDIDATES_PRESERVED",
  "source_unchanged": true,
  "snapshot_root": "<external path>",
  "candidates": [
    {"role":"primary_v2","branch":"feat/task8-spell-use-screen-v2","head":"8c611f...","manifest":"primary_v2/manifest.json"},
    {"role":"secondary_original","branch":"task8/spell-use-screen","head":"fcb5dbe...","manifest":"secondary_original/manifest.json"}
  ]
}
```

No product/current-main compatibility claim is added.

- [ ] **Step 6: Run focused tests to GREEN**

Expected: preservation contract tests pass, including source refs/status/index invariants and byte-for-byte copied fixture files.

### Task 3: Repository-wide verification and delivery

**Files:**
- Modify only if a real regression is found: preservation tool/test.

- [ ] **Step 1: Run exact-head applicable CI**

Require current-state sync, planning/Base, Godot authoring authority, toolchain, Star Circuit/runtime/physical and Component Sheet workflows to finish successfully when applicable. Path-non-applicable workflows stay `SKIPPED`, not PASS.

- [ ] **Step 2: Run adversarial whole-state review 5 times**

Attack:
1. source worktree mutation or implicit synchronization;
2. missing untracked/dirty data or path traversal into destination;
3. source identity mismatch or secondary candidate accidentally promoted to merge authority;
4. snapshot success claimed despite changed refs/status/index/hash;
5. Task8/runtime/Human/Device/Performance evidence overpromotion.

Any new valid finding resets the review to Loop 1.

- [ ] **Step 3: Merge with expected-head protection and read back main**

No force merge or ruleset bypass. After merge, update Issue #111 and Notion Project Registry only; do not alter Human Home or Task13 visual state.

### Task 4: User-machine preservation execution

**Files:**
- No repository mutation.

- [ ] **Step 1: Run the commit-pinned preservation tool on the user PC**

Use the merged exact commit copy from GitHub TEMP bootstrap. `-DestinationRoot` must be outside `C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-`; recommended bounded destination is `C:\Users\user\Documents\GRIMOIRE-Task8-Recovery`.

- [ ] **Step 2: Read the JSON receipt**

Require `TASK8_CANDIDATES_PRESERVED`, `source_unchanged: true`, and both exact candidate identities before allowing any local fetch/pull/reconciliation.

- [ ] **Step 3: Advance only after verified preservation**

Next route: clean current-main reconciliation worktree → fresh HiGodot readback of primary v2 → targeted secondary parity comparison → current shared UI/current runner reconciliation → fresh Task8 tests/Hera/adversarial review → Task8 product PR.

## Self-review

- Spec coverage: both observed candidates, path-alias/noise lesson, pre-sync preservation, HiGodot-only product boundary, evidence ceiling are covered.
- Placeholder scan: no TBD/TODO/implementation-later placeholders.
- Type/identity consistency: primary/secondary branch and SHAs match the observed recovery receipt; success code is consistently `TASK8_CANDIDATES_PRESERVED`.

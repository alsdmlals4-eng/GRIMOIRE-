# Windows + WSL2 Local Validation Matrix Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reproduce GRIMOIRE's Python and Godot/GUT validation on Windows Python 3.11/3.12/3.13 and WSL2 Ubuntu Python 3.12 with exact-HEAD, fail-closed evidence manifests.

**Architecture:** Keep `tools/run_local_gut_validation.py` as the single-lane executor. Add a tested Python matrix model/aggregator, a PowerShell host orchestrator, and a Bash WSL entrypoint. Windows and WSL Python 3.12 run the runtime lane; Python 3.11 and 3.13 run the complete Python contract suite.

**Tech Stack:** PowerShell 7/Windows PowerShell, WSL2 Ubuntu, Bash, Python 3.11/3.12/3.13, `unittest`, Godot 4.7.1, GUT 9.7.1, JSON, JUnit XML.

## Global Constraints

- Decision ID: `GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01`.
- Base main: `312e491c8e9b333cb585b4e0550f80e3aea5f3f7`.
- Matrix lanes: `windows-py311`, `windows-py312`, `windows-py313`, `wsl-ubuntu-py312`.
- GitHub Actions remains `NOT_RUN_BUDGET_BLOCKED`; never record missing Actions as PASS.
- Exact PR HEAD, clean working tree, correct repository remote, and no Git operation in progress are mandatory.
- Do not modify `project.godot`, `*.tscn`, `*.tres`, `*.res`, product data, or assets.
- Do not enable the GUT editor plugin.
- `artifacts/local-validation/` must be ignored by Git.
- PR #82 Task 2 remains blocked.

---

### Task 1: Freeze the matrix contract in RED

**Files:**
- Create: `tests/test_local_validation_matrix.py`
- Create: `tests/test_local_validation_matrix_contract.py`

**Interfaces:**
- Consumes: design lane IDs and current repository paths.
- Produces: failing requirements for `tools/local_validation_matrix.py`, `tools/run_local_validation_matrix.ps1`, `tools/run_local_validation_matrix_wsl.sh`, and matrix schema.

- [ ] **Step 1: Write tests requiring exactly four lane definitions, fail-closed aggregation, required scripts, and `.gitignore` evidence exclusion.**
- [ ] **Step 2: Run `python -m unittest tests.test_local_validation_matrix tests.test_local_validation_matrix_contract -v`.**
- [ ] **Step 3: Confirm RED because matrix files and ignore rule do not exist.**
- [ ] **Step 4: Commit with `test: require Windows and WSL2 local validation matrix`.**

---

### Task 2: Implement the matrix model and aggregator

**Files:**
- Create: `tools/local_validation_matrix.py`
- Create: `docs/validation/LOCAL_VALIDATION_MATRIX_MANIFEST.schema.json`
- Test: `tests/test_local_validation_matrix.py`

**Interfaces:**
- Produces: `default_lane_specs()`, `aggregate_lane_manifests(...)`, and CLI `aggregate`.
- The aggregator accepts `lane_id=manifest_path` pairs and writes `matrix-manifest.json`.

- [ ] **Step 1: Implement immutable lane specs for Windows 3.11/3.12/3.13 and WSL Ubuntu 3.12.**
- [ ] **Step 2: Require exact lane count, lane IDs, expected/actual HEAD equality, expected Python major/minor, expected host, and lane result `PASS`.**
- [ ] **Step 3: Preserve all lane failures in the matrix manifest and return non-zero if any lane fails.**
- [ ] **Step 4: Run focused tests and commit `test: aggregate local validation matrix evidence`.**

---

### Task 3: Extend the per-lane executor

**Files:**
- Modify: `tools/run_local_gut_validation.py`
- Modify: `docs/validation/GUT_LOCAL_VALIDATION_MANIFEST.schema.json`
- Create: `tests/test_local_gut_validation_environment.py`

**Interfaces:**
- Add CLI `--lane-id` and `--expected-python`.
- Manifest adds `lane_id`, `host`, `python`, and complete JUnit validation.

- [ ] **Step 1: Write failing tests for Python version matching, isolated Godot user-data environment, recursive JUnit discovery, XML validation, and full unittest discovery command.**
- [ ] **Step 2: Run tests and confirm missing functions/fields fail.**
- [ ] **Step 3: Implement environment collection and platform-specific isolated `APPDATA` or `HOME/XDG_*`.**
- [ ] **Step 4: Replace the focused Python command with `python -m unittest discover -s tests -p test_*.py -v`.**
- [ ] **Step 5: Copy one valid `gut-results.xml` into the lane evidence directory and require discovered tests > 0 and failures = 0.**
- [ ] **Step 6: Run focused tests and commit `test: capture per-lane Python and JUnit evidence`.**

---

### Task 4: Add Windows and WSL orchestration

**Files:**
- Create: `tools/run_local_validation_matrix.ps1`
- Create: `tools/run_local_validation_matrix_wsl.sh`
- Modify: `.gitignore`
- Test: `tests/test_local_validation_matrix_contract.py`

**Interfaces:**
- PowerShell accepts `ExpectedHead`, `BaseSha`, `PullRequest`, and optional `WslDistribution`.
- WSL script accepts the same SHAs and PR number plus its evidence directory.

- [ ] **Step 1: Implement Windows `py -3.11`, `py -3.12`, and `py -3.13` lane execution.**
- [ ] **Step 2: On Windows 3.12, install/verify Windows Godot 4.7.1 and run the full lane.**
- [ ] **Step 3: Resolve the Windows repository path with `wslpath`, invoke Ubuntu `python3.12`, install/verify Linux Godot 4.7.1, and run the full WSL lane.**
- [ ] **Step 4: Continue collecting all lanes after individual failures, then call the Python aggregator.**
- [ ] **Step 5: Add `artifacts/local-validation/` to `.gitignore`.**
- [ ] **Step 6: Run contract tests and commit `test: add Windows WSL2 local validation pack`.**

---

### Task 5: Synchronize Decision and project state

**Files:**
- Modify: `docs/decisions/DEC-GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01.md`
- Modify: `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
- Modify: PR #85 body
- Modify: Google Sheet rows using the same Decision ID.

**Interfaces:**
- Records matrix specification without claiming execution success.

- [ ] **Step 1: Record the four fixed lanes and runtime-lane split.**
- [ ] **Step 2: Set local matrix state to `PACK_IMPLEMENTED_EXECUTION_NOT_RUN` and merge authorization false.**
- [ ] **Step 3: Write Sheet sync `GR-SYNC-20260807-18-WINDOWS-WSL2-LOCAL-MATRIX` and read it back.**
- [ ] **Step 4: Re-read PR #85 exact HEAD and changed files.**

---

### Task 6: Execute on the user machine and ingest evidence

**Files:**
- Generated locally: `artifacts/local-validation/**`
- Attach or commit only a reviewed receipt, not raw transient product caches.

**Interfaces:**
- Command:

```powershell
pwsh -File tools/run_local_validation_matrix.ps1 `
  -ExpectedHead <PR85_EXACT_HEAD> `
  -BaseSha 312e491c8e9b333cb585b4e0550f80e3aea5f3f7 `
  -PullRequest 85 `
  -WslDistribution Ubuntu
```

- [ ] **Step 1: Checkout the exact PR #85 HEAD and verify `git status --short` is empty.**
- [ ] **Step 2: Run the PowerShell command.**
- [ ] **Step 3: Inspect `matrix-manifest.json`; current vendor mismatch is expected to fail runtime lanes until resolved.**
- [ ] **Step 4: Attach evidence to PR #85 and update Sheet with actual PASS/FAIL values.**
- [ ] **Step 5: Do not merge until all required lanes, vendor integrity, GUT/JUnit/hash, review, and Sheet gates pass.**

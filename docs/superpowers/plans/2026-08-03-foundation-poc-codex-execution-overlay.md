# Foundation POC Codex Execution Overlay

> **For agentic workers:** REQUIRED SUB-SKILL: Use `superpowers:using-git-worktrees` before implementation, then `superpowers:subagent-driven-development` or `superpowers:executing-plans`. Every behavior change follows `superpowers:test-driven-development`; completion claims require `superpowers:verification-before-completion`.

**Goal:** Execute the existing Mobile Foundation POC implementation in Codex without treating local Godot installation as a planning or approval blocker.

**Architecture:** This document is the authoritative execution overlay for `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`. The original plan remains the detailed source for Tasks 2–12. Its former Task 1 toolchain gate is superseded by a lightweight local verification step because the user has confirmed that Godot is installed and the repository CI has independently downloaded and verified Godot 4.7.1 stable.

**Tech Stack:** Godot 4.7.1 stable, GDScript, Python 3.12, GitHub Actions, JSON evidence reports.

## Global Constraints

- Local Godot state: `USER_ATTESTED_INSTALLED`.
- Chat-side local execution state: `NOT_DIRECTLY_VERIFIED_BY_CHAT`.
- CI Toolchain evidence: `4.7.1.stable.official.a13da4feb / PASS`.
- Godot installation is not a user approval gate.
- Codex must not reinstall Godot when a usable local binary is already present.
- When the binary is not on `PATH`, Codex sets `GODOT_BIN` to the user's existing executable path.
- `tools/setup_godot_toolchain.py` is a fallback recovery tool, not the default first task.
- Product implementation is permitted only inside the Foundation POC scope defined below.
- Real glyph recognition, ML, training data, final art, final audio, Boss content, complete Main/Grimoire screens, and full chapter content remain prohibited.
- Every visible POC screen must display `POC / TEST_VALUE / NOT_CONTENT_COMPLETE`.
- Runtime, physical-device, performance, accessibility, and human-playtest status remains `NOT_RUN` until Codex or the user actually runs those checks.
- Do not claim a test passed without command output from the current implementation HEAD.

## Authority and Supersession

The following old instruction is superseded:

```text
Do not execute until a separate Godot Toolchain/Stage 0 readiness approval passes.
```

Replace it with:

```text
User confirmed local Godot is installed.
Codex verifies the executable and version at session start.
A missing PATH entry is configuration work, not a planning block.
Installation fallback is used only when the existing local installation cannot be located or executed.
```

Execution mapping:

```yaml
old_plan_task_1: SUPERSEDED_BY_CODEX_LOCAL_BASELINE
old_plan_tasks_2_to_12: ADOPT_WITH_THIS_OVERLAY
stage_0_term: RETIRED_FROM_USER_FACING_WORKFLOW
product_implementation: AUTHORIZED_FOR_LATER_CODEX_SESSION_WITHIN_FOUNDATION_POC_SCOPE
current_chat_execution: PLAN_AND_HANDOFF_ONLY
```

---

## Task 0: Create an Isolated Codex Worktree and Verify the Existing Godot Installation

**Files:**
- No product files are created in this task.
- Existing fallback: `tools/setup_godot_toolchain.py`.

**Interfaces:**
- Consumes: local repository clone and the user's installed Godot executable.
- Produces: exact binary path, exact version output, clean worktree, and baseline test results.

- [ ] **Step 1: Create or select an isolated worktree**

```bash
git fetch origin
git worktree add ../GRIMOIRE-foundation-poc -b codex/foundation-poc origin/main
cd ../GRIMOIRE-foundation-poc
```

Expected: a clean branch based on the latest `origin/main`. If the branch already exists, use the existing isolated worktree rather than forcing or deleting it.

- [ ] **Step 2: Locate the user's existing Godot binary**

Windows PowerShell:

```powershell
$Godot = (Get-Command godot -ErrorAction SilentlyContinue).Source
if (-not $Godot) { $Godot = (Get-Command godot4 -ErrorAction SilentlyContinue).Source }
if (-not $Godot) {
  $Candidates = @(
    "$env:LOCALAPPDATA\Programs\Godot\Godot_v4.7.1-stable_win64.exe",
    "$env:USERPROFILE\Downloads\Godot_v4.7.1-stable_win64.exe",
    "C:\Program Files\Godot\Godot_v4.7.1-stable_win64.exe"
  )
  $Godot = $Candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
}
if (-not $Godot) { throw "Installed Godot executable was not located. Ask only for its path; do not reopen game-design approval." }
$env:GODOT_BIN = $Godot
& $env:GODOT_BIN --version
```

Expected: a real Godot version string. The target is `4.7.1.stable`. A different installed version is a technical compatibility issue to report, not a reason to reopen the game design.

- [ ] **Step 3: Record the local baseline without reinstalling**

```powershell
@{
  godot_bin = $env:GODOT_BIN
  version = (& $env:GODOT_BIN --version | Out-String).Trim()
  source = "USER_EXISTING_LOCAL_INSTALLATION"
} | ConvertTo-Json | Set-Content -Encoding utf8 godot-local-baseline.json
```

Expected: `godot-local-baseline.json` contains the local executable and version. Do not commit absolute user paths; use it only as local evidence.

- [ ] **Step 4: Run repository planning and toolchain regression checks**

```bash
python tools/generate_project_operating_views.py --check
python -m unittest tests.test_base_v9_adoption -v
python -m unittest tests.test_godot_toolchain_setup -v
```

Expected: all commands pass before product files are created. If a regression fails, fix the regression on the Codex branch; do not alter approved game rules to make tests pass.

- [ ] **Step 5: Confirm the product tree is not already partially implemented**

```bash
git status --short
test ! -e project.godot || echo "EXISTING_PROJECT_REQUIRES_INSPECTION"
```

Expected: a clean worktree. If `project.godot` already exists on the current main at execution time, inspect and adapt rather than overwrite it blindly.

---

## Task 1: Establish the Foundation POC Product Scope

**Files allowed for this Codex implementation:**

```text
project.godot
src/core/**
src/input/**
src/persistence/**
src/platform/**
src/ui/**
src/app/**
tests/test_case.gd
tests/test_runner.gd
tests/unit/**
tests/integration/**
tools/check_foundation_poc_scope.py
.github/workflows/validate-foundation-poc.yml
artifacts/foundation-poc/**
docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md
docs/planning/FOUNDATION_POC_STOP_GATE_01_<date>.md
```

**Prohibited scope:**

```text
assets/final/**
audio/final/**
content/chapters/**
content/dialogue/**
ml/**
training-data/**
Boss implementation
final economy/balance
full Main or Grimoire production UI
release packaging claims
```

- [ ] **Step 1: Add the scope guard test before creating product content**

Use the exact scope checker and test specified in Task 10 of the original plan. Run the test and confirm RED because the checker does not yet exist.

```bash
python -m unittest tests.test_foundation_poc_scope -v
```

Expected: failure caused by the missing scope checker, not by an import typo.

- [ ] **Step 2: Implement the minimal scope checker**

Implement `tools/check_foundation_poc_scope.py` using the forbidden roots and required POC disclosure from the original plan. Run the test until GREEN.

```bash
python -m unittest tests.test_foundation_poc_scope -v
python tools/check_foundation_poc_scope.py
```

Expected: both commands exit `0` on the pre-product tree.

- [ ] **Step 3: Commit the execution boundary**

```bash
git add tools/check_foundation_poc_scope.py tests/test_foundation_poc_scope.py
git commit -m "test: lock Foundation POC implementation scope"
```

---

## Task 2: Execute Original Plan Tasks 2–4 — Project Scaffold and Pure Core

**Detailed source:** `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`, Tasks 2, 3, and 4.

**Deliverables:**

```text
project.godot
tests/test_case.gd
tests/test_runner.gd
tests/unit/test_smoke.gd
src/core/focus_task_reducer.gd
tests/unit/test_focus_task_reducer.gd
src/core/atomic_result_ledger.gd
tests/unit/test_atomic_result_ledger.gd
artifacts/foundation-poc/.gitkeep
```

- [ ] **Step 1: Perform the Task 2 RED run**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: failure because `project.godot` and the test runner do not exist.

- [ ] **Step 2: Implement only the minimal project and runner from original Task 2**

Use Godot 4.7.1 and `gl_compatibility`. Keep the fixed landscape viewport at `1280×720` and the project name `GRIMOIRE Foundation POC`.

- [ ] **Step 3: Verify Task 2 GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add project.godot tests artifacts/foundation-poc/.gitkeep
git commit -m "build: scaffold headless Godot foundation POC"
```

- [ ] **Step 4: Execute original Task 3 with RED → GREEN → commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/core/focus_task_reducer.gd tests/unit/test_focus_task_reducer.gd tests/test_runner.gd
git commit -m "feat: add pure focus task reducer"
```

- [ ] **Step 5: Execute original Task 4 with RED → GREEN → commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/core/atomic_result_ledger.gd tests/unit/test_atomic_result_ledger.gd tests/test_runner.gd
git commit -m "feat: prevent duplicate result transactions"
```

Expected: core state transitions and duplicate transaction protection pass headlessly without UI dependencies.

---

## Task 3: Execute Original Plan Tasks 5–8 — Writing, Save, and Lifecycle

**Detailed source:** original Tasks 5, 6, 7, and 8.

**Deliverables:**

```text
src/input/stroke_buffer.gd
src/input/glyph_recognizer.gd
src/input/deterministic_test_recognizer.gd
src/input/writing_session.gd
src/persistence/session_snapshot.gd
src/persistence/save_repository.gd
src/platform/app_lifecycle_coordinator.gd
tests/unit/test_stroke_and_recognition.gd
tests/unit/test_writing_session.gd
tests/unit/test_snapshot_and_save.gd
tests/integration/test_pause_resume_transaction.gd
```

- [ ] **Step 1: Implement pointer ownership and deterministic recognition through TDD**

Required test behaviors:

```text
one pointer owns an active stroke
second pointer cannot join the active stroke
active-stroke cancel preserves completed strokes
recognition result carries the draft revision
```

- [ ] **Step 2: Implement writing-session stale-result and confidence guards through TDD**

Required test behaviors:

```text
no automatic glyph confirmation
stale recognition result rejected
low-confidence candidate cannot be confirmed
full cancel clears the draft and increments revision
```

- [ ] **Step 3: Implement schema-v1 snapshot and atomic save recovery through TDD**

Required test behaviors:

```text
active stroke never persists
completed strokes round-trip
main save preferred over backup
corrupt main can fall back to valid backup
corrupt snapshot is not overwritten automatically
```

- [ ] **Step 4: Implement pause/resume and exactly-once commit through TDD**

Required test behaviors:

```text
completed draft survives suspend/resume
active stroke is cancelled before save
a resumed transaction applies exactly once
duplicate commit returns the first immutable result
```

- [ ] **Step 5: Run all headless tests and commit after each original task**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: all unit and integration suites exit `0` after each task; do not batch unverified features into one commit.

---

## Task 4: Execute Original Plan Tasks 9–10 — Mobile Harness and Layout Matrix

**Detailed source:** original Tasks 9 and 10 plus the approved three-slot Mobile Summon HUD design as a compatibility constraint.

**Deliverables:**

```text
src/ui/mobile_safe_root.gd
src/ui/mobile_safe_root.tscn
src/app/foundation_poc_app.gd
src/app/foundation_poc_app.tscn
src/ui/layout_matrix_runner.gd
tests/integration/test_mobile_safe_root.gd
tests/integration/test_layout_matrix.gd
```

- [ ] **Step 1: Build the unstyled landscape harness through TDD**

Required visible context:

```text
Objective
Timer
Player Status
Writing Canvas
POC / TEST_VALUE / NOT_CONTENT_COMPLETE
```

- [ ] **Step 2: Preserve future Mobile Summon HUD space without implementing the full HUD**

The Foundation POC does not implement final summon visuals. It must avoid a layout that makes the approved left safe-area `MAIN / S1 / S2 / S3` compact rail impossible. Reserve the left-side structure or keep the harness flexible enough for that later plan.

- [ ] **Step 3: Execute the layout matrix**

At minimum test:

```text
1280×720
1600×900
1920×1080
2400×1080
text scales 1.00, 1.30, and 2.00
representative left/right/top/bottom safe insets
```

Expected: required context and the POC disclosure remain visible for every matrix entry.

- [ ] **Step 4: Run headless and manual local checks**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
& $env:GODOT_BIN --path .
```

Expected: the manual application shows only synthetic debug scenarios, not finished content.

---

## Task 5: Execute Original Plan Tasks 11–12 — CI, Evidence, and Stop Gate

**Detailed source:** original Tasks 11 and 12.

**Deliverables:**

```text
.github/workflows/validate-foundation-poc.yml
docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md
artifacts/foundation-poc/headless-test-report.json
artifacts/foundation-poc/save-resume-report.json
artifacts/foundation-poc/layout-matrix-report.json
docs/planning/FOUNDATION_POC_STOP_GATE_01_<date>.md
```

- [ ] **Step 1: Reuse the repository-owned Godot provisioning path in CI**

Use `tools/setup_godot_toolchain.py` in GitHub Actions rather than adding an unreviewed third-party setup Action.

- [ ] **Step 2: Run the complete local validation**

```powershell
python -m unittest tests.test_base_v9_adoption tests.test_godot_toolchain_setup tests.test_foundation_poc_scope -v
python tools/check_foundation_poc_scope.py
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: all commands exit `0` on the exact implementation HEAD.

- [ ] **Step 3: Record evidence honestly**

The validation report must separate:

```yaml
automated_headless: PASS_OR_FAIL_FROM_CURRENT_OUTPUT
layout_matrix: PASS_OR_FAIL_FROM_CURRENT_OUTPUT
save_resume_exactly_once: MEASURED_VALUE
local_installed_godot: USER_ATTESTED_AND_CODEX_VERIFIED
physical_mobile_device: NOT_RUN_UNLESS_EXECUTED
performance_battery_thermal: NOT_RUN_UNLESS_EXECUTED
accessibility_assistive_technology: NOT_RUN_UNLESS_EXECUTED
human_playtest: NOT_RUN_UNLESS_EXECUTED
```

- [ ] **Step 4: Run the adversarial Stop Gate**

Reject or rework the implementation if any of the following occurs:

```text
duplicate transaction applies more than once
completed draft is lost on suspend/resume
active stroke is persisted as completed input
required context disappears in the layout matrix
final-content paths appear in the POC
missing evidence is reported as PASS
```

- [ ] **Step 5: Prepare a Draft PR**

The PR description must include exact commands, exact HEAD, test counts, failures, generated evidence paths, and all `NOT_RUN` categories. Do not merge automatically.

---

## Completion Definition

The Codex implementation is complete only when:

```yaml
project_scaffold: PASS
headless_test_runner: PASS
focus_reducer: PASS
atomic_result_ledger: PASS
stroke_ownership: PASS
writing_session_guards: PASS
snapshot_round_trip: PASS
atomic_save_recovery: PASS
pause_resume_exactly_once: PASS
mobile_context_visibility_matrix: PASS
scope_guard: PASS
ci_current_head: PASS
stop_gate: PASS_TO_USER_REVIEW
```

The following may still remain `NOT_RUN` without invalidating the Foundation POC implementation:

```text
real glyph recognition quality
physical phone/tablet verification
performance, battery, and thermal profiling
screen-reader and switch-access validation
human playtest
final art, audio, balance, and full content
```

## Next Handoff

After this plan is committed, the next implementation session should open this file first, then the original detailed plan. Codex should begin at **Task 0** and continue without asking whether Godot installation itself is approved.
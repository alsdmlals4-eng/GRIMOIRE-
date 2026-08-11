# Task8 Handoff and BCP Closure Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Pause Task8 product mutation safely, persist a restartable GRIMOIRE continuation checkpoint, close applicable project learning, and store any reusable learning as a Base proposal-only BCP without colliding with concurrent projects.

**Architecture:** GRIMOIRE remains the product and continuation authority. The first project PR updates existing continuation owners and adds one focused regression without touching Task8 product files. Reusable learning is then proposed in Base only under `[수정제안서]/**` using the current Base proposal schema and a final concurrency race check. A final small GRIMOIRE closure updates the BCP locator and keeps Task8 explicitly unmerged and resumable.

**Tech Stack:** GitHub repository docs/tests, Python `unittest`, Google Sheets continuation readback, Base proposal registry/schema/validator.

## Global Constraints

- Current target project is `alsdmlals4-eng/GRIMOIRE-`; other projects are read-only comparison evidence.
- Project Decision remains `GM-SPELL-WORKFLOW-UI-V2-01`; tool authority remains `GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01`.
- Task8 product branch remains `feat/task8-spell-use-screen-v2` at local handoff head `8c611f601aa98397ed1558e92ab207e0e8347a9b`; this handoff work does not stage, commit, push, or rewrite that local product delta.
- Preserve legacy current-state compatibility markers until their existing consumers/tests are intentionally migrated.
- Do not reset, restore, clean, normalize, or adopt known Task8 representation noise or unrelated untracked artifacts.
- Base writes are restricted to `[수정제안서]/**`; Base active implementation is forbidden in this stage.
- New Base proposal status must start as `SUBMITTED`; machine ID/path come from the current Registry/template/validator and must be rechecked against latest Base main and all open proposal PRs immediately before write and merge.
- The final project continuation state must not create a recursive PR solely to write its own merge SHA.

---

### Task 1: Add a fail-first continuation contract

**Files:**
- Create: `tests/test_task8_handoff_bcp_continuation.py`

**Interfaces:**
- Consumes: current `docs/ACTIVE_CONTEXT.md` and `docs/planning/CURRENT_UNRESOLVED_GATES.md`.
- Produces: exact markers required from the new Sync21 handoff checkpoint.

- [ ] **Step 1: Write the failing unittest**

Require the new Sync ID, exact local Task8 branch/head, observed acceptance evidence, current PR-prep interruption state, Codex-only session reuse rule, Base-candidate pending state, and preservation of legacy current-state compatibility markers.

- [ ] **Step 2: Observe intended RED**

Use the repository Python test route on the test-only head. Expected failure: the new Sync21 document/markers are absent while existing historical compatibility markers remain present.

- [ ] **Step 3: Keep the RED limited to handoff state**

Confirm no `.gd`, `.tscn`, `.uid`, `project.godot`, addon, Task8 artifact, or unrelated source path was changed by the RED commit.

### Task 2: Persist the GRIMOIRE handoff and project-learning application

**Files:**
- Create: `docs/planning/sync/GR-SYNC-20260812-21-TASK8-HANDOFF-BCP.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/planning/CURRENT_UNRESOLVED_GATES.md`
- Test: `tests/test_task8_handoff_bcp_continuation.py`

**Interfaces:**
- Consumes: Task8 local acceptance evidence, current remote project/Base/Sheet reads, existing BCP-015 and Base dedicated-local-execution contracts.
- Produces: one restartable Sync21 checkpoint and a closed project-side learning record.

- [ ] **Step 1: Record current facts without product promotion**

Record project main observed at handoff, exact local Task8 branch/head, no remote Task8 product branch/PR, local acceptance evidence, current PR-prep revalidation requirement, and all preserved NOT_RUN evidence ceilings.

- [ ] **Step 2: Separate historical acceptance from current live readiness**

Preserve the successful exact-project HiGodot/GUT/Hera acceptance evidence as historical/current-work-unit evidence while marking the later empty HiGodot session and interrupted PR-prep as requiring a fresh revalidation before staging.

- [ ] **Step 3: Apply three learning records**

`LRN-GR-20260812-01`: split remote-authority freshness from local-executor verification; classify as `BASE_CANDIDATE` with project application in the handoff route.

`LRN-GR-20260812-02`: hidden/orphan exact-project editor recovery reuses existing BCP-015 and Base dedicated-local-execution contracts; classify as `NO_PROMOTION / REUSE_EXISTING_BCP`.

`LRN-GR-20260812-03`: while an already-established dedicated Codex session remains open, Codex-only continuation may reuse it; a fresh PowerShell is required only when the environment/session must be recreated or a required operation exceeds the current Codex capability boundary. Classify as `PROJECT_ONLY`.

- [ ] **Step 4: Run focused and existing current-state regressions**

Run `python -m unittest tests.test_task8_handoff_bcp_continuation tests.test_spell_workflow_current_state_sync -v`. Expected: PASS while legacy Task8 unmerged/current-next markers remain intact.

### Task 3: Review and merge the project handoff PR

**Files:**
- Review only the Task 1-2 project delta.

**Interfaces:**
- Consumes: exact project PR head and current project main.
- Produces: merged project application evidence for Base proposal provenance.

- [ ] **Step 1: PR influence and scope check**

Require no same-goal open project PR, no product/addon changes, no Task8 local branch mutation, and no unrelated docs/canon migration.

- [ ] **Step 2: Exact-head validation**

Require applicable GitHub checks terminal/success, zero unresolved review threads, exact reviewed head unchanged, and current main freshness.

- [ ] **Step 3: Merge and read back new main**

Merge with expected-head protection, fetch the new project main, verify all handoff files/markers exist, and run the project `POST_CHANGE_MONITOR_LOOP` classification.

### Task 4: Store the reusable Base proposal with concurrency protection

**Files:**
- Create: `[수정제안서]/<CURRENT_VALID_BCP_ID>/PROPOSAL.md`
- Modify: `[수정제안서]/PROPOSAL_REGISTRY.json`

**Interfaces:**
- Consumes: merged GRIMOIRE project application evidence and current Base README/Registry/template/validator/open proposal PRs.
- Produces: one proposal-only `SUBMITTED` BCP or a `REUSE_EXISTING_BCP / CONCURRENT_SAME_GOAL` result if another chat wins the same goal first.

- [ ] **Step 1: Final identity and same-goal preflight**

Fresh-read Base main, open proposal-only PRs, current Registry, proposal template, validator, and same-goal proposals. Never assume `BCP-2026-021` remains free.

- [ ] **Step 2: Create only the own proposal delta**

If no same-goal proposal exists, create the next current-schema ID/path and append exactly one Registry entry to the latest Registry semantic union. Status is `SUBMITTED`; source project and merged project commit are exact. If another chat already created the same goal, do not create a duplicate top-level BCP.

- [ ] **Step 3: Proposal validation and adversarial review**

Require Proposal file ↔ Registry identity closure, no duplicate ID/path, all required headings, project provenance, counterexamples/non-use/rollback, and changed paths only under `[수정제안서]/**`.

- [ ] **Step 4: Final Base race check and merge**

Immediately before merge, re-read Base main, open proposal PRs, Registry, same-goal state, current exact head/checks/threads. If Base advanced, rebuild only the own delta on latest main and revalidate. Merge proposal-only PR and read back Base new main. Do not implement the proposal.

### Task 5: Close project continuation and Sheet readback

**Files:**
- Modify existing GRIMOIRE continuation owners only as needed to store the merged Base proposal locator.
- Update the focused continuation regression accordingly.
- Update existing Google Sheet continuation/history surfaces after inspecting their current schema.

**Interfaces:**
- Consumes: merged project handoff evidence, merged Base proposal locator/new main, live Sheet schema.
- Produces: Learning Closure `CLOSED` and exact next Task8 executable step.

- [ ] **Step 1: Record Base proposal locator without implementation authority**

Store proposal ID/path/PR/Base new main/status, `proposal_storage_merge_authority = GRANTED`, `base_implementation_authority = NOT_GRANTED_IN_THIS_STAGE`, and next action `SEPARATE_FOLLOWUP_STAGE` for any Base implementation.

- [ ] **Step 2: Preserve Task8 unmerged resume contract**

Next executable step remains fresh Codex-local identity/HiGodot/GUT revalidation, followed by exact nine-path stage/commit/push only after those gates pass. Task8 is not marked merged or complete.

- [ ] **Step 3: Merge the final non-recursive closure PR**

Validate and merge once. Do not open a further PR solely to write this closure PR's own merge SHA.

- [ ] **Step 4: Reconcile Google Sheet**

Fresh-read the target ranges and write only current continuation/history data needed to remove stale Base SHA/Task8 handoff markers. Read back the written cells. Do not promote human/device/performance/export/full-slice evidence.

- [ ] **Step 5: Final `POST_CHANGE_MONITOR_LOOP`**

Re-read both repository mains, both open-PR sets, Base proposal registry, project continuation owners, and Sheet. Classify each retained change as `OMISSION | CONFLICT | COMPLEMENT_GAP | DUPLICATE_WORK | NO_MATERIAL_FOLLOWUP` and stop only with no P0/P1 or open Learning Closure item.

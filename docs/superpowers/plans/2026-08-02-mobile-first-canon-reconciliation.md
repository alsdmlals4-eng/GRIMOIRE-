# GRIMOIRE Mobile-First Canon Reconciliation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 사용자의 최신 승인인 `Mobile 우선 / PC 후속`을 `GM-PLATFORM-02`로 정본화하고, Base v9.4·Asset Spec 완료 상태와 함께 GitHub·Google Sheet·Issue의 오래된 참조를 같은 Sync ID로 교정한다.

**Architecture:** GitHub 권위 문서와 편집 가능한 Adapter를 먼저 갱신해 authority commit을 만든다. 이어 Google Sheet의 허브·결정·도메인·감사·변경이력을 같은 Decision ID와 commit으로 갱신하고 Readback한 뒤, sync receipt와 Draft PR을 남긴다.

**Tech Stack:** GitHub Markdown/JSON, Google Sheets API batchUpdate, Base v9.4 project adapter/generator contracts.

## Global Constraints

- Primary platform: `Mobile`.
- Follow-up platform: `PC`.
- `GM-PLATFORM-02`는 `GM-PLATFORM-01`을 대체하되 과거 이력을 삭제하지 않는다.
- 승인된 프로젝트 코어·Vertical Slice·Art Style·Art Bible·Battle Rules·Asset Spec·잠긴 기준 이미지는 보존한다.
- Mobile OS, store, portrait/landscape, performance numbers, recognition thresholds는 근거 없이 확정하지 않는다.
- `PLANNING_ONLY_PROFILE`, `implementation: NOT_STARTED`, `codex: BLOCKED`를 유지한다.
- 기본 브랜치 직접 수정 금지. Draft PR만 생성한다.
- 실행하지 않은 Godot·device·performance·accessibility·human 검증은 `NOT_RUN`이다.

---

### Task 1: Freeze authority and findings

**Files:**
- Create: `docs/planning/PLATFORM_MOBILE_FIRST_02_2026-08-02.md`
- Create: `docs/planning/PROJECT_ADVERSARIAL_AUDIT_2026-08-02.md`

**Interfaces:**
- Consumes: latest user instruction, main `3ecf67cb9e39145976c66cb1f0bc2c42d9c17d03`, Sheet 27-tab state.
- Produces: `GM-PLATFORM-02`, `MOBILE-FOUNDATION-01`, verified findings and protected scope.

- [ ] **Step 1:** Record `GM-PLATFORM-02` as user-approved and `GM-PLATFORM-01` as superseded.
- [ ] **Step 2:** Record Base v9.4/Asset Spec/Issue/Sheet drift findings with severity and evidence paths.
- [ ] **Step 3:** State unresolved mobile OS/orientation/device/performance choices as `USER_DECISION_REQUIRED` or `NOT_RUN`.
- [ ] **Step 4:** Commit the plan and authority evidence.

### Task 2: Reconcile active GitHub consumers

**Files:**
- Modify: `AGENTS.md`
- Modify: `START_HERE.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- Modify: `docs/DEVELOPMENT_GATES.md`
- Modify: `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
- Modify: `skills/PROJECT_BASE_ADAPTER.json`

**Interfaces:**
- Consumes: `GM-PLATFORM-02` and current Base v9.4 adapter.
- Produces: one cold-start answer: Mobile-first, Asset Spec complete, `MOBILE-FOUNDATION-01` current, implementation not started.

- [ ] **Step 1:** Replace active PC-first platform fields with Mobile-first and retain PC as follow-up.
- [ ] **Step 2:** Replace stale Base v9.3/current Asset Spec references with Base v9.4/Asset Spec approved state.
- [ ] **Step 3:** Mark PC-specific inputs and 16:9 assumptions as preserved references requiring Mobile revalidation, not automatic promises.
- [ ] **Step 4:** Set `MOBILE-FOUNDATION-01` as the next reconciliation gate; keep Boss/Grimoire/Audio queued.
- [ ] **Step 5:** Parse edited JSON and run generated-view checks when an executable workspace is available; otherwise record `NOT_RUN`.

### Task 3: Synchronize Google Sheet

**Files:**
- Update Sheet tabs: `00`, `01`, `02`, `04`, `05`, `10`, `15`, `20`, `30`, `60`, `70`, `80`, `90`, `99`.

**Interfaces:**
- Consumes: GitHub authority commit SHA from Task 2.
- Produces: `GR-SYNC-20260802-07 / SYNCED_TO_WORKING_BRANCH` readback evidence.

- [ ] **Step 1:** Update hub/current gate/Base version/sync status.
- [ ] **Step 2:** Add `GM-PLATFORM-02` and supersession link to the confirmed-decision table.
- [ ] **Step 3:** Update platform/input/UX/quality/playtest/production rows without inventing OS, orientation, or numeric budgets.
- [ ] **Step 4:** Add adversarial audit and change-history rows with GitHub authority SHA and changed ranges.
- [ ] **Step 5:** Re-read every written range and compare Decision ID, platform order, gate, and SHA.

### Task 4: Reconcile issue tracking and open Draft PR

**Files:**
- Update issue `#9`.
- Close issue `#16` as completed/superseded.
- Create Draft PR from `chatgpt/grimoire-mobile-first-canon-20260802` to `main`.

**Interfaces:**
- Consumes: GitHub/Sheet readback.
- Produces: one current next-work queue and reviewable Draft PR.

- [ ] **Step 1:** Replace issue #9's obsolete Art Style blocker with Mobile Foundation/execution blockers and touch-first fixture scope.
- [ ] **Step 2:** Close issue #16 because Base v9.1 adoption has been superseded by merged Base v9.4 PR #26.
- [ ] **Step 3:** Add sync receipt containing Decision ID, authority commit, Sheet ranges, Readback, and remaining `NOT_RUN` evidence.
- [ ] **Step 4:** Open Draft PR and leave merge pending user review and CI.

### Task 5: Verification and adversarial regression

**Files:**
- Inspect all changed files, generated consumers, Sheet ranges, issues, and PR.

**Interfaces:**
- Consumes: final branch HEAD and Sheet state.
- Produces: `CONFLICT_FIXED` or an explicit blocked finding.

- [ ] **Step 1:** Search active entrypoints for `primary_platform: PC`, `PC 우선`, `Base v9.3`, and `next_product_gate: ASSET-SPEC-01`.
- [ ] **Step 2:** Classify historical occurrences in receipts/change history as `ALLOWED_LEGACY`; fix active occurrences.
- [ ] **Step 3:** Verify locked art SHA, approved Decision IDs, and `implementation: NOT_STARTED` did not regress.
- [ ] **Step 4:** Verify GitHub branch/Sheet/Issue/PR readback and report unrun runtime/device/human checks.

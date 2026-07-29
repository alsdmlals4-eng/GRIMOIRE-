# Magic Writing Synthetic Remediation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 마법 글자 작성·인식 사람 검증 Artifact가 후보 확인·부분 수정·순수 설계 실패를 독립적으로 측정하도록 시나리오를 재구성한다.

**Architecture:** 현재 카드 세션은 UX 책임 분리만 검증한다. 후보 포함/미포함, 순수 설계 실패, 중립 오류 복구를 별도 시나리오로 나누며 실제 Android touch와 recognizer 정확도는 후속 기술 Prototype으로 분리한다.

**Tech Stack:** Markdown 연구 계약, 수동 changed-files 검증

## Global Constraints

- `ART-STYLE-01`을 다음 차단 결정으로 유지한다.
- `human_validation: NOT_RUN`, `recognizer_validation: NOT_RUN`, `implementation_authority: NONE` 유지.
- Godot·Scene·Resource·Save Schema·룬 정본·인식 알고리즘 변경 금지.

---

### Task 1: Artifact 교정

**Files:**
- Modify: `docs/superpowers/plans/2026-07-29-magic-writing-input-validation-artifact.md`

**Interfaces:**
- Consumes: `docs/planning/GATE_2_MAGIC_WRITING_SYNTHETIC_TESTER_REPORT_2026-07-29.md`
- Produces: 후보 포함/미포함 시나리오, 순수 의미 실패, 중립 부분 수정, 기술 Prototype 분리 계약

- [ ] **Step 1:** current main·Base Governance metadata를 갱신한다.
- [ ] **Step 2:** 낮은 확신 시나리오를 의도 후보 포함·미포함으로 분리한다.
- [ ] **Step 3:** 입력 의도와 인식 결과가 일치한 순수 주문 설계 실패 시나리오로 교체한다.
- [ ] **Step 4:** 마지막 획을 직접 지목하지 않는 중립 오류 카드로 부분 수정 시나리오를 교체한다.
- [ ] **Step 5:** 실제 touch·recognizer·latency·confidence calibration을 별도 후속 Prototype으로 이동한다.
- [ ] **Step 6:** 낮은 확신 자동 시전을 interaction state 수준에서 금지한다.

### Task 2: 검증과 병합

**Files:**
- Verify: branch diff
- Verify: planning router and protected-path boundaries

**Interfaces:**
- Consumes: Task 1 Artifact
- Produces: 카드 UX와 실제 기술 검증의 분리 증거

- [ ] **Step 1:** 변경 파일이 계획과 Artifact에 한정되는지 확인한다.
- [ ] **Step 2:** 자동 Actions 적용 여부를 확인하고 없으면 문서 경로·상태·보호 경계를 수동 검증한다.
- [ ] **Step 3:** 미해결 리뷰 스레드가 없는지 확인한다.
- [ ] **Step 4:** 검증된 HEAD를 squash merge한다.

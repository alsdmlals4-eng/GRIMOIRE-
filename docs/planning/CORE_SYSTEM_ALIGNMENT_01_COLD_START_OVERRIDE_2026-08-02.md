# GM-CORE-SYSTEM-ALIGNMENT-01 — Cold-start 정본 Override

```yaml
status: ACTIVE_CANON_OVERRIDE_ON_WORKING_BRANCH
decision_id: GM-CORE-SYSTEM-ALIGNMENT-01
approved_at: 2026-08-02T21:44:00+09:00
working_sync_id: GR-SYNC-20260802-23
pull_request: 47
main_baseline: eaf05c24b90d233964d093b0e772e5e94b505f36
base_release: 9.4.3
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
product_implementation: NOT_STARTED
codex_execution: BLOCKED
current_planning_work: CORE_SYSTEM_ALIGNMENT_AND_CANON_RECONCILIATION
grill_counter: 1_of_10
pending_decision_ids:
  - GM-CORE-SYSTEM-ALIGNMENT-01
```

## 1. 목적

`docs/DESIGN_DOCUMENT_REGISTRY.json`, `docs/ACTIVE_CONTEXT.md`, `docs/DEVELOPMENT_GATES.md`와 일부 Google Sheet 행에 남은 과거 Platform·Base·Gate·시험·PR 상태를 현재 승인 정본보다 낮은 역사 상태로 제한한다.

이 Override는 해당 파일을 삭제하지 않는다. PR #47이 병합되기 전에는 Working Branch 권위이며, 병합 후 직접 문서 재조정에 흡수되어야 한다.

## 2. 현재 우선 정본

Cold-start에서는 다음 순서로 읽는다.

1. `START_HERE.md`.
2. 이 문서.
3. `docs/planning/CORE_SYSTEM_ALIGNMENT_01_APPROVAL_2026-08-02.md`.
4. `docs/planning/GRIMOIRE_CORE_SYSTEM_ALIGNMENT_AUDIT_2026-08-02.md`.
5. `docs/planning/IMPLEMENTATION_ENTRY_01_APPROVAL_2026-08-02.md`.
6. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
7. 질문 주제의 기존 승인 책임 원본.
8. 과거 상태 문서는 위 정본과 충돌하지 않는 범위에서만 사용한다.

## 3. 핵심 재미·시스템 계층

```text
비타협 핵심 플레이
→ 핵심 진행
→ 핵심을 시험하는 적용 모드
→ 보조 시스템
→ 전달·안전·기술 인프라
```

핵심 재미:

> 상황을 읽고 글자의 의미를 설계해 명시적으로 구현하며, 결과와 대가를 설명하고 마도서에 기록하는 재미.

Stock과 소환수는 직접 작성 반복 피로를 낮추는 보조 시스템이다. 현재 상황 검증·명시적 Commit·결과 책임을 대체하지 않는다.

## 4. Stock·소환수 현재 경계

### Stock

- 같은 문제에서 이미 확인한 글자는 Token으로 재선택 가능.
- 신규·미숙·중요 글자는 직접 작성 우선.
- 재사용 후에도 상황 검증과 명시적 Commit 필요.
- 저장 단위·용량·비용·영구성은 `GM-STOCK-SYSTEM-01`에서 결정.

### 소환수

- 현재 승인 역할은 위험 감지·관계·발견·보호·Draft 보존·작성 시간 확보.
- 글자 작성·조합·대상 선택·자동 시전 대행은 현재 승인되지 않음.
- 직접 대행을 포함하려면 `GM-SUMMON-FATIGUE-DELEGATION-01` 필요.

## 5. 교정되는 충돌

- PC 우선 표기 → Mobile 우선.
- Base v9.3 표기 → Base v9.4.3.
- ASSET-SPEC 또는 MOBILE-FOUNDATION 현재 Gate → Implementation Entry 병합 완료 후 Core Alignment 정리 단계.
- `수업→시험` → `수업→교내 일상 응용·수업 후 실습`.
- Pre-merge `IN_PROGRESS` → 이전 Batch 완료·main 최종화.
- 핵심 시스템 단일 목록 → 책임 계층 분리.
- 누락된 다계열·포트폴리오·숨김 학기 평가·Stock·소환수 행 추가.

## 6. 실행 경계

이 정리 승인으로 제품 구현을 시작하지 않는다.

```text
CORE ALIGNMENT PR #47 검증·병합
→ main/Sheet Readback
→ Cold-start 원본 직접 흡수·재조정
→ Godot Toolchain Preflight
→ Base v9.4.3 Plan 재검증
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01
→ P0=0·P1=0 뒤에만 Foundation POC 실행
```

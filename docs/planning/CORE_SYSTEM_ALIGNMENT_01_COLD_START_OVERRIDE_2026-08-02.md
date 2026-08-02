# GM-CORE-SYSTEM-ALIGNMENT-01 — Cold-start 정본 Override

```yaml
status: ACTIVE_CANON_OVERRIDE_ON_WORKING_BRANCH
decision_id: GM-CORE-SYSTEM-ALIGNMENT-01
approved_at: 2026-08-02T21:49:00+09:00
clarified_at: 2026-08-02T21:57:00+09:00
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

과거 Platform·Base·Gate·시험·PR 상태를 현재 승인 정본보다 낮은 역사 상태로 제한한다. PR #47 병합 전에는 Working Branch 권위이며, 병합 후 직접 문서 재조정에 흡수한다.

## 2. 현재 우선 정본

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
→ 보조·운용 시스템
→ 전달·안전·기술 인프라
```

핵심 재미:

> 상황을 읽고 글자의 의미를 설계해 명시적으로 구현하며, 직접 작성·Stock·소환수 운용의 결과와 대가를 설명하고 마도서에 기록하는 재미.

## 4. Stock·소환수 현재 경계

### Stock

- 같은 문제에서 이미 확인한 글자는 Token으로 재선택 가능.
- 신규·미숙·중요 글자는 직접 작성 우선.
- 플레이어 Stock 사용은 상황 검증과 명시적 Commit 필요.
- 소환수는 주기 행동으로 Stock을 충전할 수 있음.
- 저장 단위·용량·비용·보존 범위는 `GM-STOCK-SYSTEM-01`에서 결정.

### 소환수

```text
메인 소환수 = 상시 활성
기타 소환수 = [소환] 주문으로 호출 후 활성
활성 소환수 = 일정 시간마다 지정 [주문] 사용 또는 [스톡] 충전
```

- 기타 소환수의 종류와 호출 시점은 플레이어가 선택한다.
- `[소환]` 주문은 명시적 Commit과 비용 적용을 거친다.
- 주기 행동은 승인된 자동화다.
- 주기·사용 주문·대상 규칙·충전량·지속시간·동시 소환·Pause 처리 등은 `GM-SUMMON-SYSTEM-01`에서 결정한다.
- 자동 행동은 Atomic Result Ledger에서 한 번만 적용하고 출처·결과를 설명해야 한다.

## 5. 교정되는 충돌

- PC 우선 표기 → Mobile 우선.
- Base v9.3 표기 → Base v9.4.3.
- 과거 현재 Gate → Implementation Entry 병합 완료 후 Core Alignment 정리 단계.
- `수업→시험` → `수업→교내 일상 응용·수업 후 실습`.
- Pre-merge `IN_PROGRESS` → 이전 Batch 완료·main 최종화.
- 핵심 시스템 단일 목록 → 책임 계층 분리.
- 누락된 다계열·포트폴리오·숨김 학기 평가·Stock·소환수 행 추가.
- 소환수 단순 보호 정의 → 상시/호출/주기 주문·Stock 지원 정의.

## 6. 실행 경계

```text
CORE ALIGNMENT PR #47 검증·병합
→ main/Sheet Readback
→ Cold-start 원본 직접 흡수·재조정
→ GM-STOCK-SYSTEM-01·GM-SUMMON-SYSTEM-01 상세 설계
→ Godot Toolchain Preflight
→ Base v9.4.3 Plan 재검증
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01
→ P0=0·P1=0 뒤에만 Foundation POC 실행
```

# GR-SYNC-20260802-23 — Core System Alignment Working Sync

## 상태

```yaml
sync_id: GR-SYNC-20260802-23
status: SYNCED_TO_WORKING_BRANCH_PENDING_FINAL_READBACK
decision_id: GM-CORE-SYSTEM-ALIGNMENT-01
approved_option: A_CORE_FUN_FIRST_TAXONOMY_WITH_STOCK_AND_SUMMON_FATIGUE_RELIEF_GUARDS
approved_at: 2026-08-02T21:44:00+09:00
pull_request: 47
base_branch: main
main_baseline: eaf05c24b90d233964d093b0e772e5e94b505f36
head: PENDING_FINAL_HEAD
grill_counter: 1_of_10
pending_decisions: 1
sheet_state: PENDING_WRITE_AND_READBACK
implementation: NOT_STARTED
codex_execution: BLOCKED
```

## 동기화 내용

- 핵심 재미와 목표 계층.
- 핵심 플레이 / 핵심 진행 / 적용 모드 / 보조 / 전달·안전 인프라 분류.
- R1~R7 개선 원칙.
- 별도 시험 표현 제거와 교내 일상 응용 전환.
- 누락된 다계열·포트폴리오·숨김 학기 평가 시스템.
- `GR-L-13` 결과 태그·학기 평가·회복 루프.
- Stock과 확인 글자 Token 재사용의 피로 완화 역할.
- 소환수의 보호·Draft 보존·작성 시간 확보 역할.
- Stock 상세 규칙과 소환수 직접 대행 경계의 후속 Decision 분리.

## 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
STOCK_DETAILED_RULES = DESIGN_REQUIRED
SUMMON_DIRECT_DELEGATION = NOT_APPROVED
RUNTIME·DEVICE·PERFORMANCE·ACCESSIBILITY·HUMAN = NOT_RUN
```

## 완료 조건

1. GitHub 권위 문서와 Batch State가 같은 Decision ID를 사용한다.
2. Google Sheet 신규·교정 행이 기존 데이터를 덮어쓰지 않는다.
3. Sheet Readback에서 `GM-CORE-SYSTEM-ALIGNMENT-01`, `GR-SYNC-20260802-23`, counter `1/10`을 확인한다.
4. PR #47 최종 HEAD에서 CI·adversarial gate·review thread를 확인한다.
5. 사용자 명시 병합 승인 전 병합하지 않는다.

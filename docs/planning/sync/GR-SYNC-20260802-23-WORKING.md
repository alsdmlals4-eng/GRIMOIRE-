# GR-SYNC-20260802-23 — Core System Alignment Working Sync

## 상태

```yaml
sync_id: GR-SYNC-20260802-23
status: SYNCED_TO_WORKING_BRANCH
scope: CORE_SYSTEM_ALIGNMENT_AND_FATIGUE_RELIEF_CLASSIFICATION
decision_id: GM-CORE-SYSTEM-ALIGNMENT-01
approved_option: A_CORE_FUN_FIRST_TAXONOMY_WITH_STOCK_AND_SUMMON_FATIGUE_RELIEF_GUARDS
approved_at: 2026-08-02T21:49:00+09:00
approval_phrase: 정리안 승인
pull_request: 47
base_branch: main
main_baseline: eaf05c24b90d233964d093b0e772e5e94b505f36
head: RESOLVE_FROM_PR_HEAD
grill_counter: 1_of_10
pending_decisions: 1
sheet_state: PASS
implementation: NOT_STARTED
codex_execution: BLOCKED
```

## 승인 내용

현행 기획을 재기획하지 않고 다음 계층으로 정리한다.

1. 비타협 핵심 플레이.
2. 핵심 진행.
3. 핵심을 시험하는 적용 모드.
4. 보조 시스템.
5. 전달·안전·기술 인프라.

핵심 재미는 `상황 판독 → 의미 설계 → 명시적 Commit → 설명 가능한 세계 변화 → 마도서 복기`다.

## Stock·소환수 보정

사용자는 직접 작성 반복 피로를 줄이기 위해 `[스톡]` 개념과 소환수를 추가했음을 재확인했다.

현재 정본과 충돌 없이 확정 가능한 최소선:

- 같은 문제에서 확인한 글자는 Stock/Token으로 재선택 가능.
- Stock 사용 후에도 현재 상황 검증과 명시적 Commit이 필요.
- 자동 최적 조합·자동 시전은 금지.
- 소환수는 위험 감지·보호·Draft 보존·작성 시간 확보를 제공.
- 소환수의 글자 작성·조합·대상 선택·자동 시전 대행은 아직 승인되지 않음.

상세 Stock 단위·용량·비용·영구성은 `GM-STOCK-SYSTEM-01`, 소환수 직접 대행 범위는 `GM-SUMMON-FATIGUE-DELEGATION-01`에서 결정한다.

## Sheet 반영·Readback

반영 탭:

- `02_현재_확정결정`
- `05_GDD_요약`
- `12_핵심루프`
- `40_핵심시스템_메인콘텐츠`
- `99_변경이력`

확인:

- `GM-CORE-SYSTEM-ALIGNMENT-01` 신규 행.
- `GR-L-13` 결과 태그·회복·학기말 평가 루프 추가.
- `GR-S-20~24` 다계열·포트폴리오·학기 평가·Stock·소환수 보완.
- Mobile 입력을 Touch·Stylus 기준으로 교정.
- `수업→시험` 표현을 `수업→교내 일상 응용/축제`로 교정.
- 완료된 Pre-merge Gate 상태 교정.
- `GR-SYNC-20260802-23` 변경이력 행 추가.
- 행 덮어쓰기 0, 기존 Decision ID 보존.

```yaml
sheet_readback: PASS
```

## 시각 보정

초기 승인 문서와 Batch State 일부에는 자동 기록 과정에서 `21:44`가 남아 있다. 실제 사용자 승인 시각과 이 Sync의 권위 시각은 `2026-08-02T21:49:00+09:00`이며, 시간 충돌 시 이 영수증을 우선한다.

## 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
STOCK_DETAILED_RULES = DESIGN_REQUIRED
SUMMON_DIRECT_DELEGATION = NOT_APPROVED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```

## 완료 조건

1. PR #47 최종 HEAD에서 CI·adversarial gate·review thread를 확인한다.
2. 사용자 명시 병합 승인 전 병합하지 않는다.

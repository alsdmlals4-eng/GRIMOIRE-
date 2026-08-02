# GR-SYNC-20260802-23 — Core System Alignment Working Sync

## 상태

```yaml
sync_id: GR-SYNC-20260802-23
status: SYNCED_TO_WORKING_BRANCH_PENDING_FINAL_HEAD_REVERIFY
scope: CORE_SYSTEM_ALIGNMENT_STOCK_AND_SUMMON_CLARIFICATION
decision_id: GM-CORE-SYSTEM-ALIGNMENT-01
approved_option: A_CORE_FUN_FIRST_TAXONOMY_WITH_STOCK_AND_SUMMON_FATIGUE_RELIEF_GUARDS
approved_at: 2026-08-02T21:49:00+09:00
clarified_at: 2026-08-02T21:57:00+09:00
approval_phrase: 정리안 승인
clarification_phrase: 메인 소환수는 상시 적용, 기타 소환수는 [소환] 후 주기 [주문] 또는 [스톡] 지원
pull_request: 47
base_branch: main
main_baseline: eaf05c24b90d233964d093b0e772e5e94b505f36
head: RESOLVE_FROM_PR_HEAD
grill_counter: 1_of_10
pending_decisions: 1
clarification_new_grill_count: false
sheet_state: PENDING_FINAL_HEAD_READBACK
merge_request: RECEIVED_BEFORE_MATERIAL_HEAD_CHANGE
merge_authorization: REAPPROVAL_REQUIRED_FOR_FINAL_HEAD
implementation: NOT_STARTED
codex_execution: BLOCKED
```

## 승인 내용

현행 기획을 재기획하지 않고 다음 계층으로 정리한다.

1. 비타협 핵심 플레이.
2. 핵심 진행.
3. 핵심을 시험하는 적용 모드.
4. 보조·운용 시스템.
5. 전달·안전·기술 인프라.

핵심 재미는 `상황 판독 → 의미 설계 → 명시적 Commit → 설명 가능한 세계 변화 → 마도서 복기`다.

## Stock·소환수 보완 정의

```text
메인 소환수 = 상시 활성
기타 소환수 = 플레이어가 [소환] 주문으로 호출한 뒤 활성
활성 소환수 = 일정 시간마다 지정 [주문] 사용 또는 [Stock] 충전
```

- 같은 문제에서 확인한 글자는 Stock/Token으로 재선택할 수 있다.
- 플레이어가 Stock을 사용할 때는 현재 상황 검증과 명시적 Commit이 필요하다.
- 메인 소환수는 별도 `[소환]` 없이 상시 효과 또는 주기 행동을 제공한다.
- 기타 소환수는 `[소환]` 주문의 비용·Commit 후에만 활성화된다.
- 활성 소환수의 지정 주문 사용과 Stock 충전은 승인된 자동화다.
- 자동 행동의 출처·주기·대상 또는 적용 규칙·기여도를 표시한다.
- 자동 최적 해법, 다른 소환수 자동 호출, 무한 Stock·무한 자동시전은 금지한다.
- Pause·Background·Save/Resume에서 중복 Tick·주문·Stock 충전이 없어야 한다.

상세 Stock 계약은 `GM-STOCK-SYSTEM-01`, 상세 소환수 계약은 `GM-SUMMON-SYSTEM-01`에서 결정한다.

## 적대적 검토

근거:

- `docs/planning/CORE_SYSTEM_ALIGNMENT_01_SUMMON_CLARIFICATION_ADVERSARIAL_REVIEW_2026-08-02.md`

판정:

```yaml
review_status: PASS_WITH_HARD_GUARDS
p0: 0
p1_design_guards: 5
implementation_readiness: NOT_READY
```

주요 위험:

- 소환수 자동 행동이 핵심 플레이보다 강해지는 autoplay 지배.
- Stock 충전과 `[소환]` 비용의 무한 순환.
- 자동 주문 대상·비용·실패의 블랙박스화.
- 앱 재개 시 중복 Tick과 중복 보상.
- 메인 소환수 상시 효과가 모든 선택을 상위호환하는 문제.

## Sheet 반영·Readback

반영 탭:

- `02_현재_확정결정`
- `05_GDD_요약`
- `12_핵심루프`
- `40_핵심시스템_메인콘텐츠`
- `99_변경이력`

확인 대상:

- `GM-CORE-SYSTEM-ALIGNMENT-01` 승인·보완 정의.
- `GR-L-13` 결과 태그·회복·학기말 평가 루프.
- `GR-L-19` 직접 작성·Stock·소환수 운용 루프.
- `GR-S-20~24` 다계열·포트폴리오·평가·Stock·소환수 계층.
- `GR-S-05`는 관계·상시 기초지원, `GR-S-24`는 소환수 자동행동의 단일 소유자로 분리.
- `수업→시험` 표현 제거.
- 완료된 과거 Pre-merge 상태 교정.
- 행 덮어쓰기 0, 기존 Decision ID 보존.

최종 PR HEAD 기록 후 Sheet를 다시 읽어 `PASS`로 마감한다.

## 시각 권위

- 정리안 승인: `2026-08-02T21:49:00+09:00`.
- 소환수 보완 정의: `2026-08-02T21:57:00+09:00`.
- 일부 초기 자동 문서의 `21:44`는 생성 시각 오류이며 위 시각이 우선한다.

## 병합 승인 경계

사용자는 PR #47 병합을 승인했으나, 그 뒤 소환수 정의로 PR HEAD가 실질적으로 변경됐다. 정확한 HEAD 승인 원칙에 따라 기존 병합 승인은 변경 전 HEAD에만 유효하다.

```text
소환수 보완 동기화
→ 최종 HEAD CI·적대 Gate·리뷰·Sheet Readback
→ 최종 변경 내용 보고
→ 사용자 병합 재승인
→ 병합
```

## 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
STOCK_DETAILED_RULES = DESIGN_REQUIRED
SUMMON_DETAILED_RULES = DESIGN_REQUIRED
SUMMON_PERIODIC_SUPPORT = APPROVED_CONCEPT_IMPLEMENTATION_BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```

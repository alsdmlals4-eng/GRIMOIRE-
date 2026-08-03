# GR-SYNC-20260803-05 — Mobile Summon HUD 사용자 명세 보강 Working Sync

## 1. 상태

```yaml
sync_id: GR-SYNC-20260803-05
status: READY_FOR_USER_MERGE_APPROVAL_AFTER_FINAL_HEAD_CI
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
baseline_main: 7fd2c137469120a9ccf942df5b9860af135acc87
working_branch: agent/mobile-summon-hud-spec-hardening
pull_request: 54
pull_request_state: OPEN_DRAFT_NOT_MERGED
decision_id: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
review_id: GR-REVIEW-MOBILE-SUMMON-HUD-20260803-01
user_approved_at: 2026-08-03T21:11:00+09:00
selected_approach: B_TARGETED_HARDENING_WITH_LAYOUT_PRESERVED
grill_counter: 0_of_10
pending_distinct_decisions: 0
counter_increment: false
merge_required: true
merge_trigger: WORK_HANDOFF_FLUSH
merge_authorized: false
```

같은 Decision ID의 사용자 명세 재승인이므로 GrillMe 카운터를 증가시키지 않는다.

## 2. 승인된 보강

1. Drawer 열람은 Active Pressure Clock을 정지하지 않는다.
2. Active Stroke 종료와 Draft 안전 보존 뒤 `MANAGEMENT_CONFIRM`만 Clock을 정지한다.
3. 같은 시각 Event의 계산·Ledger 순서는 `MAIN → S1 → S2 → S3`; 전체 HUD 표시 예산은 `1.2초 TEST_VALUE`다.
4. Text Scale Test는 `100%·130%·Android 최대 200%`다.
5. 타이머는 Focus 또는 의미 있는 변화만 발표하며 매초 발표하지 않는다.
6. 빈·오류 슬롯은 nullable ViewModel과 `timing_mode: NONE`을 사용한다.
7. Exactly-once 소유자는 ResultLedger이며 Active Stroke 입력 소유자는 Writing Canvas다.

## 3. GitHub 변경 범위

### 승인·설계·상태 계약

- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`.
- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_USER_SPEC_REVIEW_2026-08-03.md`.
- `docs/superpowers/specs/2026-08-03-three-slot-mobile-summon-hud-design.md`.
- `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`.
- `docs/planning/benchmarks/MOBILE_SUMMON_HUD_WIREFRAME_STANDARD_BENCHMARK_2026-08-03.md`.

### TDD 산출물

- `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
- `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.

### Cold-start·기계 정본

- `AGENTS.md`.
- `START_HERE.md`.
- `docs/ACTIVE_CONTEXT.md`.
- `docs/DEVELOPMENT_GATES.md`.
- `docs/DESIGN_DOCUMENT_REGISTRY.json`.
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
- `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`.
- 이 Working Sync Receipt.

제품 코드·Godot Scene·Resource·게임 데이터·Asset은 변경하지 않는다.

## 4. 계획 상태

```yaml
mobile_summon_hud_spec: USER_APPROVED_HARDENED_SPEC_ACTIVE
implementation_plan: WRITTEN_NOT_EXECUTED
tdd_test_matrix: WRITTEN_NOT_EXECUTED
p0_open: 0
p1_open: 2
next_p1:
  - GODOT_TOOLCHAIN_PREFLIGHT
  - BASE_V9_4_3_PLAN_REVALIDATION_AND_EXECUTION_READINESS
```

## 5. Google Sheet 동기화·Readback

대상 Spreadsheet: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`.

반영·재조회 완료:

- `00_프로젝트_허브!H2:K2`.
- `01_작업순서!I33:J33`.
- `02_현재_확정결정!A49:J49`.
- `04_누락_충돌_감사!A43:H43`.
- `05_GDD_요약!H4:J4`, `H7:J8`.
- `60_UX_UI_접근성!A24:J24`.
- `99_변경이력!A49:H49`.

```yaml
sheet_write: PASS
sheet_readback: PASS
sheet_decision_id_match: PASS
sheet_sync_id_match: PASS
sheet_counter: 0_of_10
sheet_pending_distinct_decisions: 0
sheet_text_integrity_sentinel: PASS
sheet_sentinels:
  - 소환수
  - 자연충전
  - 적대적 검토
  - 벤치마킹
  - 마도서
```

Sheet에는 PR #54, 사전 마감 HEAD `c1df7ea9`, Counter `0/10`, Plan `WRITTEN_NOT_EXECUTED`, 제품·Runtime 검증 `NOT_RUN` 경계를 기록했다. 최종 HEAD와 CI Run은 GitHub 최종 검증 뒤 Sheet에서 갱신한다.

## 6. 적대적 검토 요약

- **무료 Pause:** Drawer 가시성과 Clock Pause를 분리했다.
- **Event 연출 부채:** 슬롯별 누적이 아닌 전체 Batch 예산을 사용한다.
- **최대 글꼴 붕괴:** Android 최대 200%를 필수 Matrix에 포함했다.
- **음성 과밀:** 매초 타이머 발표를 금지했다.
- **가짜 빈 슬롯 데이터:** nullable 필드와 `NONE` timing mode를 사용한다.
- **HUD 이중 정본:** ResultLedger 단독 Exactly-once 소유권을 유지한다.
- **필기 손실:** Canvas가 Active Stroke를 끝까지 소유한다.

제품 구현·실기기·사람 검증 전까지 잔여 위험이 해소됐다고 주장하지 않는다.

## 7. 사전 마감 HEAD 검증

```yaml
pre_finalization_head: c1df7ea97b3068870b8fde22e23195a3e0d416e8
workflow_run: 30814628515
workflow: Validate_GRIMOIRE_planning_and_Base_v9_4_3
workflow_status: PASS
adapter_generator: PASS
unit_tests: PASS
json_parse: PASS
utf8_nfc_text_integrity: PASS
adversarial_gate: PASS
review_threads: 0
reviews: 0
comments: 0
pull_request_mergeable: true
```

이 커밋 이후 Batch·Working Sync Readback 마감 문서가 추가되므로, 병합 판단은 PR #54의 **새 최종 HEAD CI**를 권위로 사용한다.

## 8. 최종 HEAD 검증 계약

```yaml
final_head: RESOLVED_FROM_PR_54_AFTER_THIS_COMMIT
final_head_ci_authority: PR_54_EXACT_HEAD_CHECKS
required_checks:
  - ADAPTER_GENERATOR
  - UNIT_TESTS
  - JSON_PARSE
  - UTF8_NFC_TEXT_INTEGRITY
  - ADVERSARIAL_GATE
required_review_threads: 0
required_unresolved_reviews: 0
required_mergeable: true
```

GitHub 문서를 다시 수정해 자기 참조형 HEAD 루프를 만들지 않는다. 최종 HEAD·CI Run·Sheet 최종 상태는 PR 검증과 Sheet 변경이력에 기록한다.

## 9. 병합 경계

이 Sync는 Working Branch 정본이다. 모든 Gate가 통과해도 사용자 명시 병합 승인 전에는 main에 병합하지 않는다.

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_PROJECT = NOT_STARTED
MOBILE_SUMMON_HUD_IMPLEMENTATION = NOT_AUTHORIZED
TDD_PLAN = WRITTEN_NOT_EXECUTED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
MERGE_AUTHORIZATION = NOT_RECEIVED
```

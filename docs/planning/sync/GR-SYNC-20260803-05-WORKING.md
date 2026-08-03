# GR-SYNC-20260803-05 — Mobile Summon HUD 사용자 명세 보강 Working Sync

## 1. 상태

```yaml
sync_id: GR-SYNC-20260803-05
status: SYNCED_TO_WORKING_BRANCH_PENDING_PR_CI_SHEET_FINAL_READBACK
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
baseline_main: 7fd2c137469120a9ccf942df5b9860af135acc87
working_branch: agent/mobile-summon-hud-spec-hardening
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

## 5. Google Sheet 동기화 범위

대상 Spreadsheet: `19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM`.

계획 범위:

- `00_프로젝트_허브!H2:K2`.
- `01_작업순서!I33:J33`.
- `02_현재_확정결정!A49:J49`.
- `04_누락_충돌_감사!A42:H42`.
- `05_GDD_요약!H4:J8` 중 기존 Sync 셀.
- `60_UX_UI_접근성`의 Mobile Summon HUD 행.
- `99_변경이력` 신규 append 행.

Sheet에는 같은 Decision ID와 `GR-SYNC-20260803-05`, PR 번호, 최종 PR HEAD, Counter `0/10`, Plan `WRITTEN_NOT_EXECUTED`, 검증 `NOT_RUN` 경계를 기록한다.

## 6. 적대적 검토 요약

- **무료 Pause:** Drawer 가시성과 Clock Pause를 분리했다.
- **Event 연출 부채:** 슬롯별 누적이 아닌 전체 Batch 예산을 사용한다.
- **최대 글꼴 붕괴:** Android 최대 200%를 필수 Matrix에 포함했다.
- **음성 과밀:** 매초 타이머 발표를 금지했다.
- **가짜 빈 슬롯 데이터:** nullable 필드와 `NONE` timing mode를 사용한다.
- **HUD 이중 정본:** ResultLedger 단독 Exactly-once 소유권을 유지한다.
- **필기 손실:** Canvas가 Active Stroke를 끝까지 소유한다.

## 7. 검증 상태

```yaml
branch_diff_scope: PENDING_FINAL_COMPARE
json_parse: PENDING_FINAL_HEAD
utf8_nfc_text_integrity: PENDING_FINAL_HEAD_CI
adapter_generator: PENDING_FINAL_HEAD_CI
unit_tests: PENDING_FINAL_HEAD_CI
adversarial_gate: PENDING_FINAL_HEAD
sheet_write: PENDING_PR_NUMBER_AND_FINAL_HEAD
sheet_readback: PENDING
sheet_sentinel: PENDING
review_threads: PENDING_PR
reviews: PENDING_PR
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 8. 병합 경계

이 Sync는 Working Branch 정본이다. PR 생성과 검증이 끝나도 사용자 명시 병합 승인 전에는 main에 병합하지 않는다.

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_PROJECT = NOT_STARTED
MOBILE_SUMMON_HUD_IMPLEMENTATION = NOT_AUTHORIZED
TDD_PLAN = WRITTEN_NOT_EXECUTED
CODEX_EXECUTION = BLOCKED
MERGE_AUTHORIZATION = NOT_RECEIVED
```

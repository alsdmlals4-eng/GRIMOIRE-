# GM-MOBILE-SUMMON-HUD-WIREFRAME-01 — 사용자 명세 검토 승인 기록

## 1. 검토 상태

```yaml
decision_id: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
review_id: GR-REVIEW-MOBILE-SUMMON-HUD-20260803-01
status: USER_APPROVED_TARGETED_HARDENING
approved_at: 2026-08-03T21:11:00+09:00
selected_approach: B_TARGETED_HARDENING_WITH_LAYOUT_PRESERVED
working_sync: GR-SYNC-20260803-05
grill_counter_before: 0_of_10
grill_counter_after: 0_of_10
counter_reason: SAME_DECISION_ID_REAPPROVAL_NO_INCREMENT
implementation: NOT_STARTED
godot_ui_implementation: NOT_AUTHORIZED
codex_execution: BLOCKED_BY_EXECUTION_READINESS_GATE
```

## 2. 검토 대상

- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`.
- `docs/superpowers/specs/2026-08-03-three-slot-mobile-summon-hud-design.md`.
- `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`.
- `docs/planning/benchmarks/MOBILE_SUMMON_HUD_WIREFRAME_STANDARD_BENCHMARK_2026-08-03.md`.
- 상위 계약 `GM-MOBILE-UX-FLOW-01`, `GM-MOBILE-WRITING-BATTLE-WIREFRAME-01`, `GM-SUMMON-SYSTEM-01`.

## 3. 대안 비교

### A — 현행 명세 그대로 승인

- 장점: 가장 빠른 문서 종료.
- 반대 근거: Pause 진입점, 동시 Event 표시 지연, 빈 슬롯 타입, 음성 타이머, Active Stroke 입력 소유권이 구현자마다 다르게 해석될 수 있다.
- 판정: `REJECT`.

### B — 레이아웃을 유지하고 7개 계약만 보강

- 장점: 이미 승인된 좌측 Rail·우측 Writing Panel 구조를 유지하면서 구현·QA 모호성만 제거한다.
- 비용: ViewModel·상태·테스트 계약이 늘지만 제품 범위나 Asset 제작량은 증가하지 않는다.
- 판정: `ADOPT / USER_APPROVED`.

### C — 좌우 반전·왼손 모드까지 즉시 재설계

- 장점: 장기 접근성 후보를 일찍 탐색한다.
- 반대 근거: 실기기 증거 없이 현재 Prototype 범위를 확대하고 테스트 조합을 크게 늘린다.
- 판정: `DEFER_TO_DEVICE_AND_HUMAN_VALIDATION`.

## 4. 승인된 7개 보강

### 4.1 관리 Pause

- Drawer 열람과 슬롯 비교는 Clock을 정지하지 않는다.
- Active Stroke가 끝나고 Draft가 안전하게 보존된 뒤 `MANAGEMENT_CONFIRM`에 진입할 때만 정지한다.
- 취소는 State·마나·주기·Draft를 변경하지 않는다.

### 4.2 동시 Event 표시 예산

- 계산·Ledger 적용 순서는 `MAIN → S1 → S2 → S3`다.
- 슬롯별 연출 시간을 누적하지 않는다.
- 같은 시각 Batch 전체 HUD 표시 예산은 `1.2초 TEST_VALUE`다.

### 4.3 최대 글꼴 크기

- 필수 Test를 `100%·130%·Android 최대 200%`로 확장한다.
- 최대 확대에서는 장식부터 줄이고 슬롯·역할·수치·상태·Touch target은 유지한다.

### 4.4 타이머 음성 발표

- 남은 초는 접근성 Focus 시 현재값을 읽는다.
- 매초 자동 발표하지 않는다.
- 상태 전환·Event·오류·중요 임계점만 의미 있는 변화로 발표한다.

### 4.5 빈 슬롯 ViewModel

- 빈 슬롯과 오류 슬롯을 위해 소환수·역할·스탯·주기·대상 필드를 nullable로 확정한다.
- `timing_mode: PERSISTENT | CYCLIC | NONE`을 추가한다.

### 4.6 Exactly-once 소유권

- Event 적용과 중복 차단은 `ResultLedger·Transaction` 계층만 소유한다.
- HUD는 정본 표시 레코드를 읽을 뿐 적용 여부를 판단하지 않는다.

### 4.7 Active Stroke 입력 소유권

- Writing Canvas가 진행 중인 Pointer·Touch sequence를 끝까지 소유한다.
- 획 종료 전 Rail 접촉은 슬롯 선택·Focus 이동·귀환·교체를 발생시키지 않는다.

## 5. 공식·현업 근거 판정

```yaml
apple_touch_and_adaptive_layout: ADOPT
android_48dp_touch: ADOPT
android_200_percent_nonlinear_font_scaling: ADOPT_FOR_TEST_MATRIX
android_live_region_polite_vs_assertive: ADAPT_FOR_MEANINGFUL_CHANGE_ONLY
godot_safe_area_query: ADOPT
godot_control_input_propagation: ADAPT_FOR_CANVAS_STROKE_OWNERSHIP
mobile_game_edge_hud_patterns: ADAPT_NOT_COPY
```

공식 출처는 Benchmark 책임 원본에 기록한다. 외부 사례의 고유 UI·명칭·수치를 복제하지 않는다.

## 6. 적대적 검토

- **무료 Pause 위험:** Drawer 가시성과 Clock 상태를 분리했다.
- **5초 주기와 연출 지연 충돌:** 전체 Batch 표시 예산을 두어 다음 주기 판독을 보호했다.
- **200% 확대 붕괴:** 장식 축소·두 줄 슬롯·안전 Scroll을 허용했다.
- **음성 과밀:** 매초 발표를 금지했다.
- **빈 슬롯 가짜 데이터:** nullable 필드와 `NONE` timing mode를 도입했다.
- **HUD 이중 정본:** Exactly-once를 ResultLedger 단독 책임으로 되돌렸다.
- **필기 손실:** Canvas의 Active Stroke 소유권을 명시했다.

잔여 위험은 Runtime·실기기·접근성·사람 검증 전까지 해소됐다고 주장하지 않는다.

## 7. 승인 결과

```yaml
layout: LEFT_SAFE_AREA_VERTICAL_COMPACT_RAIL
slot_order: [MAIN, S1, S2, S3]
detail: ONE_CONTEXTUAL_DRAWER
writing_focus_detail: READ_ONLY_MICRO_DETAIL
management_pause_state: MANAGEMENT_CONFIRM_AFTER_SAFE_DRAFT
event_resolution_owner: RESULT_LEDGER_TRANSACTION
event_presentation_budget_seconds_total: 1.2_TEST_VALUE
text_scale_cases: [1.00, 1.30, ANDROID_MAX_2.00]
timer_announcement: FOCUS_OR_MEANINGFUL_CHANGE_ONLY
active_stroke_owner: WRITING_CANVAS
hud_mutates_gameplay_state: false
```

## 8. 다음 산출물과 경계

이 승인으로 다음 문서 작성은 허용한다.

- `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
- `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.

다음은 허용하지 않는다.

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_PROJECT_CREATION = BLOCKED
GODOT_UI_IMPLEMENTATION = NOT_AUTHORIZED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```

실행은 Toolchain preflight, Base v9.4.3 최종 Plan 재검증, `GM-FOUNDATION-POC-EXECUTION-READINESS-01` PASS 및 별도 Scope 승인 뒤에만 가능하다.

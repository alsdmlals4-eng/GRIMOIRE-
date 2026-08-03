# GM-MOBILE-SUMMON-HUD-WIREFRAME-01 — 보조 3슬롯 Mobile 소환 HUD Wireframe 승인

## 1. 승인 상태

```yaml
decision_id: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
status: USER_APPROVED_HARDENED_SPEC_ACTIVE
approved_option: B_LEFT_COMPACT_RAIL_WITH_CONTEXTUAL_DETAIL_DRAWER
initial_approval_at: 2026-08-03T07:49:00+09:00
user_spec_review_approved_at: 2026-08-03T21:11:00+09:00
review_result: APPROVE_AFTER_TARGETED_HARDENING
benchmark_id: GR-BM-MOBILE-SUMMON-HUD-20260803-01
grill_me_batch: REAPPROVAL_NO_INCREMENT_0_OF_10
parent_decisions:
  - GM-MOBILE-UX-FLOW-01
  - GM-MOBILE-WRITING-BATTLE-WIREFRAME-01
  - GM-SUMMON-SYSTEM-01
  - GM-STOCK-SUMMON-STATE-INTERFACE-01
implementation_plan: WRITTEN_NOT_EXECUTED
implementation: NOT_STARTED
codex_execution: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 승인 문장

> Mobile Landscape의 소환 HUD는 우측 Writing Focus Panel과 반대편인 좌측 Safe Area에 `MAIN → S1 → S2 → S3` 세로 압축 Rail을 유지하고, 선택한 슬롯 하나만 중앙 방향으로 상세 Drawer를 연다. Writing Focus 중에는 Rail과 읽기 전용 Micro Detail만 유지하며 귀환·교체 조작은 숨긴다. Drawer 열람은 시간을 정지하지 않고, 안전하게 Draft가 보존된 명시적 관리 확인 상태만 Clock을 정지할 수 있다.

## 3. 사용자 명세 검토에서 확정한 7개 보강

```yaml
drawer_read_pauses_clock: false
management_confirmation_pauses_clock: true
management_entry_requires_safe_draft: true
same_time_event_resolution: ATOMIC_DETERMINISTIC
same_time_event_presentation_budget_seconds_total: 1.2_TEST_VALUE
required_text_scale_tests: [1.00, 1.30, ANDROID_MAX_2.00]
timer_accessibility_announcement: ON_FOCUS_OR_MEANINGFUL_CHANGE_ONLY
event_dedup_owner: RESULT_LEDGER
active_stroke_input_owner: WRITING_CANVAS
hud_state_mutation: PROHIBITED
```

이 보강은 새 Gameplay Decision이 아니라 같은 Decision ID의 명세 명확화다. GrillMe 카운터를 증가시키지 않는다.

## 4. 배치 책임

```text
상단: 목표·적 의도·타이머·환경 위험
좌측: MAIN·S1·S2·S3 압축 Rail
중앙: 대상·전장·결과 미리보기
우측: 확장 Writing Focus Panel
하단: HP·마나·Stock·Commit 관련 상태
```

정확한 픽셀은 확정하지 않는다. 배치는 Safe Area와 상대 Anchor를 사용하며 `16:9`, `19.5:9`, `20:9`, 좌·우 Cutout을 검증한다.

## 5. 압축 Rail

항상 같은 순서를 사용한다.

```text
MAIN
S1
S2
S3
```

각 슬롯 필수 정보:

1. 슬롯 ID.
2. 소환수 식별 초상 또는 Silhouette.
3. 주 역할 아이콘과 텍스트.
4. 대표 정수 스탯.
5. 다음 행동까지 남은 초 또는 `상시`.
6. `정상·정지·봉인·무효·오류·빈 슬롯` 상태 문구.

예시:

```text
S1 생산 [스톡] 2 03초
S2 수호 [방어도] 2 상시
S3 공격 [공격] 2 정지
```

색은 보조 수단이며 슬롯·역할·수치·시간·상태를 색 없이도 구분한다.

## 6. 선택 상세 Drawer와 관리 Pause

슬롯을 선택하면 하나의 상세 Drawer만 중앙 방향으로 연다.

표시 항목:

- 소환수 이름과 역할.
- 고정 대상 규칙.
- 대표 정수 스탯.
- 다음 유효 Event의 적용 전·후 예상값.
- 남은 주기와 정지 사유.
- 마지막 Event ID와 결과 요약.
- 허용 상태에서만 `귀환·교체` 조작.

다른 슬롯을 선택하면 기존 Drawer를 교체한다. Drawer를 중첩하지 않는다.

- Drawer를 읽거나 슬롯을 비교하는 동안 Active Pressure Clock은 계속 진행한다.
- `귀환·교체`를 누른 즉시 정지하지 않는다.
- 진행 중인 획이 종료되고 Draft가 안전하게 보존된 뒤 명시적 `MANAGEMENT_CONFIRM` 상태에 진입할 때만 Clock을 정지한다.
- 확인 취소 시 State·마나·주기·대상을 변경하지 않고 이전 Focus 상태로 돌아간다.
- 확인 완료 후 실제 변경은 Transaction 계층에서 원자 처리한다.

## 7. Writing Focus·입력 소유권 계약

Writing Panel 확장 중:

- 압축 Rail은 유지한다.
- 전체 Drawer는 닫는다.
- 슬롯 선택 시 대상 규칙·대표 수치·다음 행동·상태만 읽기 전용 Micro Detail로 표시한다.
- `귀환·교체`는 숨긴다.
- Canvas가 Active Stroke의 Pointer·Touch 소유권을 유지한다.
- 획이 끝나기 전 Rail 접촉은 슬롯 선택·귀환·교체·Focus 이동을 발생시키지 않는다.
- 장식·Tooltip·FX는 입력을 받지 않도록 구성한다.
- Rail 입력은 진행 중인 획을 취소하거나 Focus를 빼앗지 않는다.

기존 승인 필수 정보인 대상, 적 의도, 타이머, 환경 위험, HP, 마나는 계속 보여야 한다.

## 8. Event 처리와 표시 예산

동시 Event의 계산·Ledger 적용 순서:

```text
MAIN → S1 → S2 → S3
```

- 계산과 Exactly-once 적용은 `ResultLedger·Transaction` 계층이 소유한다.
- HUD는 이미 정본화된 표시 Event만 읽으며 중복 적용 여부를 판단하지 않는다.
- 각 Event는 출처 슬롯·Event ID·정수 Delta를 유지한다.
- 화면 연출은 슬롯마다 `0.8~1.2초`를 누적하지 않는다.
- 같은 시각 Batch의 전체 출처 표시 예산은 `1.2초 TEST_VALUE`다.
- 공간이 부족하면 한 슬롯씩 짧게 강조하거나 요약 Queue를 사용하되 계산 순서를 바꾸지 않는다.

자동 공격은 불안정도를 `1` 아래로 낮추거나 Situation의 마지막 해결 Event가 될 수 없다.

## 9. 상태별 표시

| 상태 | Rail | Detail | Clock | 조작 |
|---|---|---|---|---|
| OBSERVE | 전체 압축 | 1개 Drawer | 진행 | 선택·관리 진입 |
| WRITING_FOCUS | 전체 압축 | 읽기 전용 Micro Detail | 승인된 Blocking 외 진행 | 확인만 |
| MANAGEMENT_CONFIRM | 전체 압축 | 확인 Summary | 정지 | 확인·취소 |
| SYSTEM_RESOLVE | 출처 강조 | 닫힘 | 정지 | 없음 |
| RESULT | 출처·정수 Delta | 결과 요약 | 결과 종료까지 정지 | 확인만 |
| PAUSE/BACKGROUND | `정지` 표시 | 닫힘 | 정지 | 없음 |
| RESUME | 저장 상태·남은 초 복구 | 닫힘 | 검증 뒤 재개 | 확인 |
| ERROR | 슬롯·오류 문구 | 복구 설명 | 잘못된 상태 정지 | 안전 복구만 |

## 10. 접근성·Touch·타이머 발표

- Android 상호작용 영역 최소 `48dp × 48dp`.
- iOS 주요 Touch 영역 최소 `44pt × 44pt`.
- 시각 아이콘이 작아도 실제 Hit Area는 최소값을 유지한다.
- 슬롯별 접근성 이름은 슬롯·소환수·역할·수치·시간·상태를 포함한다.
- Text Scale `100%·130%·Android 최대 200%`를 필수 검증한다.
- 200%에서는 장식 초상 축소, 두 줄 슬롯, 축약된 역할명 또는 안전한 세로 Scroll을 허용하지만 슬롯·역할·수치·상태·Touch target을 제거하지 않는다.
- 남은 초는 포커스 진입 시 현재값을 읽고 매초 자동 발표하지 않는다.
- 상태 전환·Event 발생·오류·중요 임계점만 의미 있는 변화로 발표한다.
- 일반 상태 변화는 비방해적 Queue를 사용하고 긴급 오류만 즉시 알림을 검토한다.
- Reduced Motion에서는 Pulse·Drawer 이동 대신 즉시 상태 변경과 정적 강조를 사용한다.
- Godot 논리 UI 단위 환산은 실기기 측정 `TEST_VALUE`다.

## 11. Safe Area·반응형 기본값

```yaml
rail_visual_width_safe_area_ratio: 0.07_to_0.10_TEST_VALUE
compact_slot_gap: 4_to_8_TEST_VALUE
detail_drawer_max_safe_width_ratio: 0.28_TEST_VALUE
same_time_event_presentation_budget_seconds_total: 1.2_TEST_VALUE
text_scale_required_cases: [1.00, 1.30, ANDROID_MAX_2.00]
```

공간이 부족하면 장식 초상 크기를 먼저 줄인다. Touch 영역·슬롯 ID·역할·수치·상태 문구를 먼저 줄이거나 숨기지 않는다. 남은 초는 시각적으로 유지하되 200%에서 별도 줄로 이동할 수 있다.

## 12. View Model 경계

HUD는 읽기 전용 `SummonHudViewModel`을 사용한다.

```text
SummonRosterState
+ ActivePressureClock
+ ResultLedger
→ SummonHudViewModel
→ Rail / Detail Drawer / Result Source View
```

빈 슬롯·오류 슬롯을 표현할 수 있도록 일부 필드는 nullable이다.

```yaml
slot_id: MAIN | S1 | S2 | S3
summon_id: string | null
primary_role: MAIN | PRODUCTION | GUARDIAN | ASSAULT | RECOVERY | null
representative_stat_type: STOCK | DEFENSE | ATTACK | HEAL | null
representative_stat_value: integer | null
remaining_cycle_ms: integer | null
timing_mode: PERSISTENT | CYCLIC | NONE
target_rule_text: string | null
state_code: EMPTY | ACTIVE | PAUSED | SEALED | INVALID | ERROR
last_event_id: string | null
last_result_summary: string | null
can_recall: boolean
can_replace: boolean
unavailable_reason: string | null
error_message: string | null
```

HUD가 직접 수행하면 안 되는 일:

- 마나 차감.
- 슬롯 변경.
- 소환·귀환·교체 확정.
- Stock 충전·소비.
- 공격·치유·방어 적용.
- Event ID 중복 판단·적용 처리.
- 손상 Save 자동 수정.

조작은 Transaction 계층에 Command를 전달한다.

## 13. 적대적 검토

### 위험 1 — 좌측 대상 정보와 충돌

가드: 기본 좌측 중앙 Anchor가 충돌하면 슬롯 순서를 유지한 채 가장 가까운 하단 Safe Anchor로 이동한다.

### 위험 2 — Drawer가 무료 Pause가 됨

가드: 읽기 상태에서는 Clock을 계속 진행한다. 안전한 Draft 보존 뒤 명시적 관리 확인 상태만 정지한다.

### 위험 3 — Rail이 글쓰기 획을 취소

가드: Canvas가 Active Stroke 소유권을 유지하고 획 종료 전 Rail 조작을 무효화한다.

### 위험 4 — 다중 Event 과밀과 연출 지연

가드: 계산 순서는 결정적으로 유지하고 같은 시각 Batch의 전체 표시를 `1.2초 TEST_VALUE` 안에서 요약한다.

### 위험 5 — 접근성 확대 붕괴

가드: Android 최대 200%를 포함하고 장식을 먼저 축소하며 두 줄 슬롯을 허용한다.

### 위험 6 — 타이머 음성 과잉

가드: 매초 자동 발표를 금지하고 포커스·상태 전환·중요 임계점만 알린다.

### 위험 7 — HUD가 Exactly-once 책임을 침범

가드: Event 중복 차단과 적용은 ResultLedger만 소유하고 HUD는 정본화된 표시 Event를 읽는다.

## 14. 수용 테스트

필수 Matrix:

- `16:9`, `19.5:9`, `20:9`.
- 좌·우 Cutout.
- Writing Panel 축소·확장.
- Text Scale `100%·130%·Android 최대 200%`.
- MAIN + 보조 `0·1·2·3체`.
- 빈 슬롯·정상·정지·봉인·무효·오류.
- 동시 `MAIN/S1/S2/S3` Event와 전체 표시 예산.
- Pause·Background·Resume.
- 네 번째 소환·역할 중복·교체 실패.
- Active Stroke 중 Rail 접촉.
- Screen reader 포커스·의미 있는 변화·매초 비발표.
- Grayscale·Reduced Motion.

## 15. 재작업 조건

다음 중 하나면 REWORK한다.

- 적 의도·타이머·환경 위험·HP·마나·Writing Canvas 가림.
- 최소 Touch target 미달.
- S1/S2/S3 식별 실패.
- Event 출처·순서 혼동.
- 같은 시각 Event 표시가 전체 예산을 초과해 다음 주기 판독을 방해함.
- Drawer 읽기만으로 Clock 정지.
- 안전한 Draft 보존 전 관리 Pause 진입.
- Rail 입력으로 Stroke 손실 또는 Focus 이동.
- 130% 또는 Android 최대 200%에서 슬롯·역할·수치·상태 손실.
- 타이머가 매초 자동 발표되어 음성 사용을 방해함.
- HUD가 State 또는 Event 적용 여부를 직접 수정·판단함.
- 손상 Save를 조용히 자동 교정.
- 실행하지 않은 검증을 PASS로 표기.

## 16. 구현 경계

이 결정은 Wireframe·인터페이스 계약과 TDD 계획 작성만 승인한다.

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_UI_IMPLEMENTATION = NOT_AUTHORIZED
TDD_PLAN = WRITTEN_NOT_EXECUTED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
FINAL_PIXEL_VALUES = TEST_VALUE
```

# GM-MOBILE-SUMMON-HUD-WIREFRAME-01 — 보조 3슬롯 Mobile 소환 HUD Wireframe 승인

## 1. 승인 상태

```yaml
decision_id: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
status: USER_DELEGATED_RECOMMENDED_OPTION_ACTIVE
approved_option: B_LEFT_COMPACT_RAIL_WITH_CONTEXTUAL_DETAIL_DRAWER
approved_at: 2026-08-03T07:49:00+09:00
benchmark_id: GR-BM-MOBILE-SUMMON-HUD-20260803-01
grill_me_batch: 5_of_10
parent_decisions:
  - GM-MOBILE-UX-FLOW-01
  - GM-MOBILE-WRITING-BATTLE-WIREFRAME-01
  - GM-SUMMON-SYSTEM-01
  - GM-STOCK-SUMMON-STATE-INTERFACE-01
implementation: NOT_STARTED
codex_execution: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 2. 승인 문장

> Mobile Landscape의 소환 HUD는 우측 Writing Focus Panel과 반대편인 좌측 Safe Area에 `MAIN → S1 → S2 → S3` 세로 압축 Rail을 유지하고, 선택한 슬롯 하나만 중앙 방향으로 상세 Drawer를 연다. Writing Focus 중에는 Rail과 읽기 전용 Micro Detail만 유지하며 귀환·교체 조작은 숨긴다.

## 3. 배치 책임

```text
상단: 목표·적 의도·타이머·환경 위험
좌측: MAIN·S1·S2·S3 압축 Rail
중앙: 대상·전장·결과 미리보기
우측: 확장 Writing Focus Panel
하단: HP·마나·Stock·Commit 관련 상태
```

정확한 픽셀은 확정하지 않는다. 배치는 Safe Area와 상대 Anchor를 사용하며 `16:9`, `19.5:9`, `20:9`, 좌·우 Cutout을 검증한다.

## 4. 압축 Rail

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

## 5. 선택 상세 Drawer

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

## 6. 시간 압박 보호

- Drawer를 읽는 것만으로 Active Pressure Clock을 정지하지 않는다.
- `귀환·교체` 확인 단계에 명시적으로 진입한 뒤에만 승인된 관리 Pause를 검토한다.
- Drawer 열기·닫기는 상태·마나·주기·대상을 변경하지 않는다.
- 이를 통해 상세 확인이 무료 전술 Pause로 변질되는 것을 막는다.

## 7. Writing Focus 계약

Writing Panel 확장 중:

- 압축 Rail은 유지한다.
- 전체 Drawer는 닫는다.
- 슬롯 선택 시 대상 규칙·대표 수치·다음 행동·상태만 읽기 전용 Micro Detail로 표시한다.
- `귀환·교체`는 숨긴다.
- Rail 입력은 진행 중인 획을 취소하거나 Focus를 빼앗지 않는다.
- 캔버스가 Rail Tooltip·FX·Drawer보다 입력 우선권을 가진다.

기존 승인 필수 정보인 대상, 적 의도, 타이머, 환경 위험, HP, 마나는 계속 보여야 한다.

## 8. Event 출처

동시 Event는 다음 순서로 하나씩 표시한다.

```text
MAIN → S1 → S2 → S3
```

각 Event:

1. 출처 슬롯 강조.
2. 정수 변화 표시.
3. Result Ledger에 슬롯과 Event ID 기록.
4. 현재 Event Resolve 종료 후 다음 Event 처리.

자동 공격은 불안정도를 `1` 아래로 낮추거나 Situation의 마지막 해결 Event가 될 수 없다.

## 9. 상태별 표시

| 상태 | Rail | Detail | Clock | 조작 |
|---|---|---|---|---|
| OBSERVE | 전체 압축 | 1개 Drawer | 진행 | 선택·귀환·교체 |
| WRITING_FOCUS | 전체 압축 | 읽기 전용 Micro Detail | 승인된 Blocking 외 진행 | 확인만 |
| SYSTEM_RESOLVE | 출처 강조 | 닫힘 | 정지 | 없음 |
| RESULT | 출처·정수 Delta | 결과 요약 | 결과 종료까지 정지 | 확인만 |
| PAUSE/BACKGROUND | `정지` 표시 | 닫힘 | 정지 | 없음 |
| RESUME | 저장 상태·남은 초 복구 | 닫힘 | 검증 뒤 재개 | 확인 |
| ERROR | 슬롯·오류 문구 | 복구 설명 | 잘못된 상태 정지 | 안전 복구만 |

## 10. 접근성·Touch

- Android 상호작용 영역 최소 `48dp × 48dp`.
- iOS 주요 Touch 영역 최소 `44pt × 44pt`.
- 시각 아이콘이 작아도 실제 Hit Area는 최소값을 유지한다.
- 슬롯별 접근성 이름은 슬롯·소환수·역할·수치·시간·상태를 포함한다.
- Text Scale `130%`를 필수 검증한다.
- Reduced Motion에서는 Pulse·Drawer 이동 대신 즉시 상태 변경과 정적 강조를 사용한다.
- Godot 논리 UI 단위 환산은 실기기 측정 `TEST_VALUE`다.

## 11. Safe Area·반응형 기본값

```yaml
rail_visual_width_safe_area_ratio: 0.07_to_0.10_TEST_VALUE
compact_slot_gap: 4_to_8_TEST_VALUE
detail_drawer_max_safe_width_ratio: 0.28_TEST_VALUE
result_source_emphasis_seconds: 0.8_to_1.2_TEST_VALUE
text_scale_required: 1.30
```

공간이 부족하면 장식 초상 크기를 먼저 줄인다. Touch 영역·역할·수치·시간·상태 문구를 먼저 줄이거나 숨기지 않는다.

## 12. View Model 경계

HUD는 읽기 전용 `SummonHudViewModel`을 사용한다.

```text
SummonRosterState
+ ActivePressureClock
+ ResultLedger
→ SummonHudViewModel
→ Rail / Detail Drawer / Result Source View
```

HUD가 직접 수행하면 안 되는 일:

- 마나 차감.
- 슬롯 변경.
- 소환·귀환·교체 확정.
- Stock 충전·소비.
- 공격·치유·방어 적용.
- Event ID 적용 처리.
- 손상 Save 자동 수정.

조작은 Transaction 계층에 Command를 전달한다.

## 13. 적대적 검토

### 위험 1 — 좌측 대상 정보와 충돌

가드: 기본 좌측 중앙 Anchor가 충돌하면 슬롯 순서를 유지한 채 가장 가까운 하단 Safe Anchor로 이동한다.

### 위험 2 — Drawer가 무료 Pause가 됨

가드: 읽기 상태에서는 Clock을 계속 진행한다. 관리 확인 상태만 별도 계약으로 Pause 가능성을 검증한다.

### 위험 3 — Rail이 글쓰기 획을 취소

가드: active Stroke 중 관리 조작 금지, Rail 읽기 전용, Canvas 입력 우선.

### 위험 4 — 다중 Event 과밀

가드: 결정적 순서, 한 번에 출처 하나, 정수 Delta와 짧은 결과 문구.

### 위험 5 — 접근성 확대 붕괴

가드: 장식을 먼저 축소하고 두 줄 Compact Slot을 허용하되 Touch target과 핵심 정보는 유지한다.

## 14. 수용 테스트

필수 Matrix:

- `16:9`, `19.5:9`, `20:9`.
- 좌·우 Cutout.
- Writing Panel 축소·확장.
- Text Scale `100%·130%`.
- MAIN + 보조 `0·1·2·3체`.
- 빈 슬롯·정상·정지·봉인·무효·오류.
- 동시 `MAIN/S1/S2/S3` Event.
- Pause·Background·Resume.
- 네 번째 소환·역할 중복·교체 실패.
- Grayscale·Reduced Motion.

## 15. 재작업 조건

다음 중 하나면 REWORK한다.

- 적 의도·타이머·환경 위험·HP·마나·Writing Canvas 가림.
- 최소 Touch target 미달.
- S1/S2/S3 식별 실패.
- Event 출처·순서 혼동.
- Drawer 읽기만으로 Clock 정지.
- Rail 입력으로 Stroke 손실.
- Text Scale 130%에서 역할·수치·시간·상태 손실.
- HUD가 State를 직접 수정.
- 손상 Save를 조용히 자동 교정.
- 실행하지 않은 검증을 PASS로 표기.

## 16. 구현 경계

이 결정은 Wireframe과 인터페이스 계약만 승인한다.

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
GODOT_UI_IMPLEMENTATION = NOT_AUTHORIZED
TDD_PLAN = NEXT_AFTER_USER_SPEC_REVIEW
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
FINAL_PIXEL_VALUES = TEST_VALUE
```

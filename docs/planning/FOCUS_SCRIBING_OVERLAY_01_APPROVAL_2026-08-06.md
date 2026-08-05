# 집중 필사 Overlay 01 승인

```yaml
status: USER_AUTHORIZED_TEST_VALUE_DEFAULT
parent_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
state_id: STATE_FOCUS_SCRIBE
runtime_scope: TYPED_GLYPH_STOCK_GENERATION
mobile_device_validation: NOT_RUN
human_validation: NOT_RUN
```

## 목적

압박 상황에서 플레이어가 실제 시간과 마나를 지불해 선택한 글자 Stock 하나를 능동 보충하는 선택적 위험 관리 기능이다. 기본 전투의 필수 행동이나 마나 회복 수단으로 만들지 않는다.

## 고정 계약

```yaml
TIME_SCALE_0_25_TEST_VALUE: true
MANA_ONE_PER_REAL_SECOND_TEST_VALUE: true
base_duration_seconds: 10_TEST_VALUE
minimum_actual_seconds: 3_TEST_VALUE
SAME_GLYPH_STOCK_PLUS_1: true
shared_capacity_reservation: 1
full_pause: false
CANCEL_NO_REFUND: true
power_bonus: prohibited
mana_recovery: prohibited
completed_spell_generation: prohibited
```

## 진입

```text
숙련 글자 선택
→ Typed Glyph Stock 공용 용량 1칸 예약
→ Overlay 열기
→ Active Pressure 0.25배로 진행
```

빈 용량이 없거나 선택 glyph_id가 없으면 시작하지 않는다. 예약된 용량은 다른 자연충전·필사 세션이 사용할 수 없다.

## Overlay 표시

- 선택한 glyph_id.
- 완료까지 남은 실제 시간.
- 실제 시간 기준 마나 소모 속도.
- 직접 HP 피해·행동 불가·마나 0·Focus loss·Background 중단 위험.
- 현재 글자별 Stock과 공유 용량.
- 취소 시 이미 흐른 시간과 소비 마나가 환불되지 않는다는 경고.
- 주변 상황이 계속 진행 중임을 나타내는 `0.25x` 라벨.

## 성공

선택 glyph_id와 승인된 인식 결과가 일치하고 세션 시간이 완료되면 예약 용량에 같은 glyph_id Stock 1개를 생성한다. `stock_generation_event_id`를 Exactly-once로 기록한다.

## 중단

```yaml
PLAYER_CANCELLED: release_capacity_no_stock
DIRECT_HP_LOSS: release_capacity_no_stock
CONTROL_DISABLED: release_capacity_no_stock
MANA_ZERO: release_capacity_no_stock
FOCUS_LOSS: release_capacity_no_stock
BACKGROUND_TRANSITION: release_capacity_no_stock
```

중단 시 미완성 입력과 용량 예약을 폐기한다. 이미 소비한 마나는 반환하지 않는다. 중단 후 Stock은 증가하지 않는다.

## 입력·접근성

직접 그리기, 가이드 추적, 스냅, 획 순서 보정은 성공 시 같은 글자 Stock 1개를 생성한다. 입력 방식에 따른 위력·마나·추가 Stock 보너스를 두지 않는다.

## 금지

- 범용 Stock으로 변환.
- 다른 glyph_id Stock 생성.
- 완전 Pause.
- 취소 환불.
- 필사를 통한 마나 회복·주문 위력 증가.
- 용량 초과 생성.

## 검증 경계

자동 테스트는 Typed Stock 생성·용량 예약·실시간 마나 소모·중단 무생성·취소 무환불을 검증한다. 실제 손글씨 피로·가림·압박 체감·모바일 성능은 `NOT_RUN`이다.

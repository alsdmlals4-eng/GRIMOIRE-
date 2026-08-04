# Spell 글자 Stock 시스템 — 최신 책임 원본

## 문서 상태

```yaml
status: ACTIVE_RESPONSIBILITY_SOURCE
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
parent_decision: GM-STOCK-SYSTEM-01
updated_at: 2026-08-04T09:37+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 시스템 약속

```text
Stock
= 숙련한 특정 글자 노드 1회를 직접 그리지 않고 배치하는 준비량

집중 필사
= 실제 시간과 마나를 지불해 같은 글자 Stock 1개를 능동 보충하는 선택 행동
```

완성 주문 Stock은 폐기한다. 알려진 주문도 3×3 회로에서 글자·대상·연결을 구성하고 Commit한다.

## Stock 단위

```yaml
stock_scope: TYPED_GLYPH_ONLY
unit: ONE_TYPED_GLYPH_NODE_PLACEMENT
shared_capacity: 8_TEST_VALUE
target_node_cost: 0
connection_edge_cost: 0
completed_spell_stock: prohibited
```

예:

```yaml
stored_stock:
  열: 2
  흐름: 1
  보호: 2
  집중: 0
  분산: 1
```

## 회로 편집과 예약

```text
글자 노드 배치
→ 같은 glyph_id Stock 1 예약

노드 이동
→ 기존 예약 유지

글자 교체
→ 이전 예약 해제 후 새 글자 Stock 예약

노드 제거·회로 취소
→ 예약 해제

Commit 성공
→ 예약 Stock + 주문 마나 + 결과를 같은 Transaction ID로 원자 처리

Commit 실패·대상 취소·시스템 오류
→ Stock·마나 미소비
```

대상 노드와 연결선은 Stock을 소비하지 않는다.

## 자연충전

```yaml
active_charge_target_count: 1
charge_target: ONE_TYPED_GLYPH
base_charge_seconds: 10_TEST_VALUE
minimum_actual_seconds: 3_TEST_VALUE
clock: ACTIVE_PRESSURE
progress_storage: PER_GLYPH
summon_support: INTEGER_REMAINING_SECONDS_REDUCTION
offline_charge: false
```

- 충전 대상과 전환 시점은 플레이어가 정한다.
- 진행도는 글자별로 보존한다.
- 최대 수량에 도달해도 다른 글자로 자동 전환하지 않는다.
- Pause·System Resolve·Focus loss·Background·Save/Load에서는 진행하지 않는다.
- 소환수는 현재 지정 글자의 남은 시간만 줄이고 대상을 바꾸지 않는다.

## 집중 필사

```yaml
state_id: STATE_FOCUS_SCRIBE
player_label: 집중_필사
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
successful_gain: SAME_GLYPH_STOCK_PLUS_1
capacity_reservation_on_entry: 1
full_pause: false
```

### 진입

```text
숙련 글자 선택
→ 공용 용량 1칸 예약
→ 집중 필사 시작
```

예약된 용량은 자연충전·소환수 지원이 채울 수 없다. 빈 용량이 없으면 시작할 수 없다.

### 성공

```text
선택 glyph_id와 인식 glyph_id 일치
→ 예약칸에 같은 글자 Stock +1
→ stock_generation_event_id 기록
```

### 중단

- 수동 취소.
- 인식 실패.
- 실제 HP 감소를 동반한 직접 피해.
- 행동 불가 제어 상태.
- 마나 0.
- Focus loss·Background.

중단 시 미완성 획을 폐기하고 예약을 해제한다. 이미 소모한 마나와 흐른 시간은 반환하지 않는다.

최종 직접 피해가 0이면 Prototype에서는 필사를 유지한다. 지속 피해는 기본적으로 중단하지 않지만 HP·마나는 계속 감소한다.

## 시간계 경계

- 적·환경은 `0.25배 TEST` Active Pressure로 계속 진행한다.
- 필사 마나 소모는 실제 시간 기준이다.
- 자연충전과 소환수 주기는 Active Pressure 기준이다.
- 따라서 집중 필사는 완전 Pause도, 수동·수동 외 생산 동시 가속도 아니다.

## 입력·접근성

- 글자 Stock 선택이 주문 조합의 기본 입력이다.
- 직접 그리기는 보충·교육·복원 기능이다.
- 그림 정확도는 주문 위력·효율·Stock 지급량 보너스를 주지 않는다.
- 가이드 추적·스냅·획 순서 보정도 성공 시 같은 Stock 1개를 지급한다.
- 자연충전만으로 모든 기본 전투를 수행할 수 있어야 한다.

## 알려진 주문 설계도

```yaml
mode: NON_BINDING_GHOST_REFERENCE
auto_stock_reservation: false
auto_target: false
auto_commit: false
```

설계도는 참고 회로이며 원터치 시전이 아니다.

## Save·Resume

저장 필드:

- 글자별 보유·예약 Stock.
- 공유 용량 사용량.
- 현재 자연충전 대상과 글자별 진행도.
- 소환수 지원 주기 잔여시간.
- 집중 필사 상태·선택 glyph_id·예약 용량.
- 적용 완료 Transaction/Event ID.

Background 복귀로 Stock을 소급 생성하지 않는다. 집중 필사는 Focus loss에서 종료하고 부분 획을 저장하지 않는다.

## 금지

```text
COMPLETED_SPELL_ONE_TAP_STOCK
GENERIC_STOCK_CONVERSION
FULL_PAUSE_DURING_FOCUS_SCRIBE
DRAWING_POWER_BONUS
DRAWING_REQUIRED_FOR_BASIC_COMBAT
TARGET_OR_EDGE_STOCK_COST
PASSIVE_CHARGE_REAL_TIME_ACCELERATION_DURING_FOCUS
```

## 연결 정본

- 회로: `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`.
- 용량: `docs/planning/STOCK_CAPACITY_SYSTEM.md`.
- 충전: `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`.
- 대상 전환: `docs/planning/STOCK_TARGET_SWITCH_SYSTEM.md`.
- 피격: `docs/planning/STOCK_HIT_PAUSE_SYSTEM.md`.
- 상태 색인: `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`.

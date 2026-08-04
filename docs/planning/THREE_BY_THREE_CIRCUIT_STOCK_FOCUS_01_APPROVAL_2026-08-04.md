# GM-3X3-CIRCUIT-STOCK-FOCUS-01 — 3×3 주문 회로·글자 Stock·집중 필사 승인

## 승인 상태

```yaml
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
status: USER_APPROVED_ACTIVE_HARDENED_BY_PREMERGE_REVIEW
approved_at: 2026-08-04T09:14+09:00
hardened_at: 2026-08-04T09:37+09:00
hardening_review: GR-ADV-20260804-3X3-CANON-PREMERGE
counter_increment: true
grill_counter_after_approval: 5_of_10
hardening_counter_increment: false
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

> 3×3 회로판에 메인 글자·보조 글자·대상 키워드 노드를 배치하고, 인접 노드를 방향성 있게 연결한 구조가 주문이 된다. Stock은 특정 글자 노드 1회의 직접 그리기를 대체한다. 전투 중 `[집중 필사]`는 시간을 느리게 하며 같은 글자 Stock을 보충하고 실제 시간 기준 마나를 소비한다.

## 주문 정의

```text
글자 노드
+ 대상 키워드 노드
+ 3×3 셀 위치
+ 방향성 연결
= 회로

유효 회로 Commit
= 주문
```

주문명은 글자 이름과 별개다.

```text
열 + 폭발 + 투사·충돌 배치
→ 「파이어볼」
```

같은 글자라도 배치·순서·분기·대상이 다르면 다른 주문이 될 수 있다.

## 3×3 회로판 계약

```yaml
grid: 3x3
main_glyph_nodes: exactly_1
support_glyph_nodes_slice: 0_to_2
target_keyword_nodes_slice: 1_to_4
total_nodes_slice: up_to_7
branches_slice: up_to_1
edge_direction: required
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
skip_connection: prohibited
crossing_edges: prohibited
hidden_position_bonus: prohibited
slice_target_node_role: TERMINAL_LEAF
```

- 위치는 연결 가능성과 분기 형태를 결정한다.
- 중앙·모서리·거리 자체에는 숨은 위력·마나·성공률 보너스가 없다.
- 연결선은 가로·세로·대각선으로 바로 인접한 셀끼리만 만들 수 있다.
- 연결선이 다른 노드·셀을 건너뛰거나 교차하지 않는다.
- 모든 사용 노드는 메인 글자에서 도달 가능해야 한다.
- Slice의 대상 노드는 효과가 도달하는 끝점이다.
- `흐름`은 UI상 보조 글자이며 데이터상 `CONNECTION_SUPPORT` 하위 역할이다.

## 대상 키워드

```yaml
visible_identified_combatants: AUTO_LIST
observed_environment_or_device: LIST_AFTER_OBSERVATION
hidden_weakness_or_internal_part: LIST_AFTER_INVESTIGATION
critical_safety_target: MULTI_ROUTE_DISCOVERABLE
```

사건 예시: 카시안, 묘목, 밸브, 배관, 환기구, 정령, 지면.

전투 예시: 플레이어, 소환수, 동료, 식별된 적, 지면, 엄폐물, 출입구, 전장 장치.

```text
보호 → 집중 → 아군 A
= 단일 강보호

보호 → 분산
          ├→ 아군 A
          └→ 아군 B
= 다중 분산 보호
```

- `[집중]`은 출력·범위를 한곳에 모으고 대상 상한을 1로 제한한다.
- `[분산]`은 여러 대상·구역을 허용하지만 개별 출력이 나뉜다.
- 분산 문법 없이 여러 대상에 분기하면 불완전·불안정 경고를 표시한다.

## 글자 Stock

```yaml
stock_scope: TYPED_GLYPH_ONLY
stock_unit: ONE_TYPED_GLYPH_NODE_PLACEMENT
completed_spell_stock: prohibited
shared_capacity: 8_TEST_VALUE
target_keyword_stock_cost: 0
connection_edge_stock_cost: 0
```

```text
글자 노드 배치
→ 같은 글자 Stock 1 예약

노드 제거·회로 취소
→ 예약 해제

Commit 성공
→ 예약 Stock + 주문 마나 + 결과 적용을 같은 Transaction으로 처리

Commit 실패·대상 취소·시스템 오류
→ Stock·마나 미소비
```

완성 주문 원터치 Stock은 3×3 판단을 우회하므로 폐기한다.

## 자연충전

```yaml
natural_charge_target: one_typed_glyph_at_a_time
one_glyph_charge_seconds: 10_TEST_VALUE
clock_source: ACTIVE_PRESSURE
summon_stock_support: INTEGER_REMAINING_SECONDS_REDUCTION
minimum_actual_charge_seconds: 3_TEST_VALUE
offline_charge: false
```

- 진행도는 글자 종류별로 보존한다.
- 소환수 `[스톡]`은 현재 지정 글자의 남은 시간만 단축한다.
- 자동으로 다른 글자 충전 대상으로 전환하지 않는다.

## 집중 필사

```yaml
state_id: STATE_FOCUS_SCRIBE
player_label: 집중_필사
active_pressure_scale: 0.25_TEST_VALUE
full_pause: false
enemy_and_environment_continue: true
mana_drain_per_real_second: 1_TEST_VALUE
successful_recognition_gain: SAME_GLYPH_STOCK_PLUS_1
stock_or_item_cost: 0
capacity_reservation_on_start: 1
```

```text
숙련 글자 선택
→ 공용 Stock 용량 1칸 예약
→ 집중 필사 진입
→ Active Pressure가 느리게 진행
→ 실제 시간 기준 마나 소모
→ 글자 작성·인식 성공
→ 예약칸에 같은 글자 Stock +1
```

- 예약칸은 자연충전·소환수 지원이 채울 수 없다.
- 취소·인식 실패·직접 HP 피해·제어 상태·마나 0·Focus loss에서 중단하고 예약을 해제한다.
- 미완성 획은 폐기하며 이미 흐른 시간과 소모 마나는 반환하지 않는다.
- 최종 직접 피해가 0이면 Prototype에서는 중단하지 않는다.
- 지속 피해는 기본적으로 중단하지 않지만 HP와 마나는 계속 감소한다.
- 자연충전과 소환수 주기는 Active Pressure 기준이라 집중 중 실제 시간으로 가속되지 않는다.

`무료 충전`은 Stock·아이템·별도 행동권을 쓰지 않는다는 뜻이며, 시간과 마나는 비용이다.

## 입력·접근성

- 기본 입력은 글자 Stock 선택, 대상 배치, 노드 연결이다.
- 직접 그리기는 Stock 보충과 신규 글자 교육·복원을 위한 보조 기능이다.
- 그림 정확도는 주문 위력·효율·Stock 지급량을 높이지 않는다.
- 가이드 추적·보정 입력도 같은 글자 Stock 1개를 지급할 수 있다.
- 직접 그리기 없이 자연충전과 준비 편성만으로 기본 전투를 수행할 수 있어야 한다.

## 알려진 주문 설계도

```yaml
known_spell_blueprint: NON_BINDING_GHOST_REFERENCE
node_auto_commit: false
target_auto_selection: false
auto_best_route: false
```

설계도는 반투명 참고 배치를 보여줄 수 있지만, 글자 Stock 예약·대상 선택·최종 Commit은 플레이어가 수행한다.

## Preview

```yaml
fields:
  - primary_effect
  - speed
  - scope
  - pressure_change
  - likely_benefit
  - main_risk
  - unresolved_problem
  - confidence
confidence_values: [정보_충분, 정보_부분, 정보_부족]
numeric_success_probability: prohibited
ending_reveal: prohibited
```

## 금지 경계

```text
FULL_PAUSE_DURING_FOCUS_SCRIBE = PROHIBITED
COMPLETED_SPELL_ONE_TAP_STOCK = PROHIBITED
GENERIC_STOCK_CONVERSION = PROHIBITED
DRAWING_POWER_BONUS = PROHIBITED
DRAWING_REQUIRED_FOR_BASIC_COMBAT = PROHIBITED
PASSIVE_CHARGE_ACCELERATED_BY_REAL_TIME_DURING_FOCUS = PROHIBITED
TARGET_OR_EDGE_STOCK_COST = PROHIBITED
BLUEPRINT_AUTO_TARGET_OR_AUTO_COMMIT = PROHIBITED
HIDDEN_GRID_POSITION_BONUS = PROHIBITED
NUMERIC_SUCCESS_PROBABILITY_PREVIEW = PROHIBITED
```

## 검증 항목

제품 구현 후 검증한다.

1. 인접 연결 규칙이 직관적이며 배치가 의미 있게 느껴지는가.
2. 메인·보조·대상 노드가 색 없이도 구분되는가.
3. `보호+집중`과 `보호+분산`의 대상 규칙을 설명할 수 있는가.
4. Stock 예약·취소·Commit·필사 용량 예약에 복제·손실이 없는가.
5. 집중 필사 중 적 위협이 사라지지 않는가.
6. `0.25배·마나 1/초`가 유용하지만 상시 최적 행동은 아닌가.
7. 자연충전만으로 기본 전투가 가능한가.
8. 접근성 보정이 성능 차별을 만들지 않는가.

모든 수치는 Runtime·사람 검증 전 `TEST_VALUE`다.

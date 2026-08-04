# GM-3X3-CIRCUIT-STOCK-FOCUS-01 — 3×3 주문 회로·글자 Stock·집중 필사 승인

## 1. 승인 상태

```yaml
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-04T09:14+09:00
scope: SPELL_ASSEMBLY_GLYPH_STOCK_AND_COMBAT_FOCUS_SCRIBING
parent_decisions:
  - GM-CIRCUIT-01
  - GM-STOCK-SYSTEM-01
  - GM-SLICE-HEAT-FLOW-OBSERVATION-01
counter_increment: true
previous_grill_counter: 4_of_10
new_grill_counter: 5_of_10
pending_approved_decisions: 5
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

사용자는 주문 제작을 다음처럼 확정했다.

> 3×3 회로판에 메인 글자·보조 글자·대상 키워드 노드를 배치하고, 노드를 방향성 있게 연결한 전체 구조가 주문이 된다. Stock은 글자 노드 하나의 직접 그리기를 대체한다. 전투 중 그리기는 `[집중 필사]`로 시간을 느리게 흐르게 하면서 해당 글자 Stock을 무료로 확보하지만, 집중 유지 중 초당 소량의 마나를 소비한다.

---

## 2. 주문 정의

```text
글자 노드
+ 대상 키워드 노드
+ 노드의 위치
+ 방향성 연결선
= 회로

회로가 유효하게 완성되고 Commit됨
= 주문
```

주문명은 구성 글자의 이름과 별개다.

```text
열 + 폭발 + 투사·충돌 배치
→ 「파이어볼」

열 + 흐름 + 외곽 순환 배치
→ 교수의 고유 안전 주문
```

같은 글자를 사용해도 배치·연결·대상·분기에 따라 다른 주문이 될 수 있다.

---

## 3. 3×3 회로판

```text
┌────┬────┬────┐
│ 1  │ 2  │ 3  │
├────┼────┼────┤
│ 4  │ 5  │ 6  │
├────┼────┼────┤
│ 7  │ 8  │ 9  │
└────┴────┴────┘
```

### 노드 종류

```yaml
MAIN_GLYPH:
  meaning: 발생시키거나 변화시킬 중심 현상
  required: exactly_1

SUPPORT_GLYPH:
  meaning: 출력·범위·전달·시간·안정·행동 변형
  required: optional

TARGET_KEYWORD:
  meaning: 현재 사건·전투에서 적용할 인물·적·시설·지형·구역
  required: at_least_1_for_targeted_spell
```

Vertical Slice 권장 제한:

```yaml
main_glyph_nodes: 1
support_glyph_nodes: 0_to_2
target_keyword_nodes: 1_to_4
total_nodes: up_to_7
branches: up_to_1
crossing_edges: prohibited
multiple_main_glyphs: prohibited
```

- 3×3 모든 칸을 채울 필요는 없다.
- 메인 글자는 어느 칸에든 배치할 수 있다.
- 연결 화살표가 적용 순서를 결정한다.
- 두 점 사이의 거리 자체는 위력·마나 비용을 바꾸지 않는다.
- 연결선이 다른 노드 위를 통과하거나 교차하지 않는다.
- 대상 노드는 조사·전투 상태에서 실제 선택 가능한 항목만 제공한다.

---

## 4. 대상 키워드

### 사건 대상

예:

- 카시안
- 묘목
- 밸브
- 배관
- 환기구
- 정령
- 지면
- 완충 결정

조사로 발견·식별한 대상만 사용할 수 있다. 다만 생명 안전과 철수에 필요한 최소 대상은 복수 경로로 제공한다.

### 전투 대상

예:

- 플레이어
- 메인 소환수
- 보조 소환수
- 전투 참가 동료
- 현재 식별된 적
- 지면·엄폐물·출입구·전장 장치·지정 구역

퇴장·사망·비식별·완전 은폐·효과 범위 밖 대상은 비활성화한다.

### 보조 글자와 대상 수

```text
보호 → 집중 → 아군 A
= 단일 대상에 높은 보호량

보호 → 분산
          ├→ 아군 A
          └→ 아군 B
= 여러 대상에 보호량 분배
```

- `집중`: 출력·범위를 한곳에 모으며 대상 선택 상한을 1로 제한한다.
- `분산`: 여러 대상 또는 넓은 구역을 허용하되 개별 출력이 나뉜다.
- 보조 글자 없이 다중 대상을 연결하면 불완전 또는 불안정 회로로 경고한다.

---

## 5. Stock 재정의

Stock은 **숙련한 특정 글자 1회를 직접 그리지 않고 노드로 배치하는 준비량**이다.

```yaml
stock_unit: ONE_TYPED_FUNCTIONAL_GLYPH_COPY
stock_scope: GLYPH_ONLY
completed_spell_stock: PROHIBITED
shared_capacity_prototype: 8_TEST_VALUE
target_keyword_stock_cost: 0
connection_edge_stock_cost: 0
```

예:

```yaml
stored_glyph_stock:
  열: 2
  흐름: 1
  보호: 2
  집중: 0
  분산: 1
```

`보호 → 집중 → 카시안`을 만들 때:

- 보호 Stock 1 소비
- 집중 Stock 1 소비
- 카시안 대상 노드 무료
- 연결선 무료

### 배치·취소·Commit 원자성

```text
글자 노드 배치
→ 해당 Stock 1 예약

노드 제거·회로 취소
→ 예약 해제

주문 Commit 성공
→ 예약된 Stock과 주문 마나를 같은 Transaction으로 소비

Commit 실패·대상 취소·시스템 오류
→ Stock과 주문 마나 미소비
```

---

## 6. 자연충전

기존 자연충전은 **선택한 특정 글자 Stock 1종**에만 유지한다.

```yaml
natural_charge_target: one_typed_glyph_at_a_time
one_glyph_base_charge_seconds: 10_TEST_VALUE
clock_source: ACTIVE_PRESSURE
summon_stock_support: REDUCE_REMAINING_SECONDS_BY_INTEGER
minimum_actual_charge_seconds: 3_TEST_VALUE
```

- 완성 주문 자연충전은 폐기한다.
- 진행도는 글자 종류별로 보존한다.
- 소환수 `[스톡]`은 활성 글자의 남은 충전시간만 정수 초 단축한다.
- Focus·Background·Pause·System Resolve 등 기존 정지 경계를 유지한다.

---

## 7. 집중 필사

전투 중 그리기는 주문 회로의 필수 입력이 아니라 **특정 글자 Stock을 능동적으로 보충하는 선택적 숙련 행동**이다.

```yaml
state: FOCUS_SCRIBE
effect:
  active_pressure_time_scale: 0.25_TEST_VALUE
  enemy_and_environment_continue: true
  mana_drain_per_real_second: 1_TEST_VALUE
  successful_recognition_gain: SELECTED_GLYPH_STOCK_PLUS_1
  stock_or_consumable_cost: 0
```

`무료 충전`의 의미:

- Stock을 소비하지 않는다.
- 별도 아이템·쿨다운·행동권을 소비하지 않는다.
- 그러나 실제 시간이 흐르고 마나가 소모되므로 무비용 정지는 아니다.

### 절차

```text
필사할 학습·숙련 글자 선택
→ [집중 필사] 진입
→ Active Pressure가 느리게 진행
→ 실제 시간 기준 마나 지속 소모
→ 글자를 직접 그림
→ 인식 성공
→ 선택한 글자 Stock +1
→ 집중 종료 또는 다음 필사 선택
```

### 실패·중단

- 취소·인식 실패·직접 피해·제어 상태·마나 0·Focus loss에서 집중을 종료한다.
- 미완성 획은 저장하지 않는다.
- 이미 소모된 마나와 흐른 시간은 환불하지 않는다.
- 실패한 필사로 Stock을 얻지 않는다.
- 공용 준비 용량이 가득 차면 필사를 시작할 수 없다.

### 시간계 가드

- 자연충전과 소환수 `[스톡]` 주기는 Active Pressure 기준으로 진행되므로 집중 중 함께 빨라지지 않는다.
- 필사 마나 소모는 실제 시간 기준으로 적용한다.
- 집중은 시간을 완전히 정지하지 않는다.
- System Resolve 중에는 필사할 수 없다.

---

## 8. 편의성과 접근성

주문 조합의 기본 입력은 글자 Stock 선택과 3×3 노드 연결이다.

직접 그리기는 다음을 위한 보조 기능이다.

- 필요한 글자 Stock이 부족할 때 능동 보충
- 학습한 글자의 형태 숙련
- 신규 글자의 교육·복원 과정

가드레일:

- 직접 그린 글자는 주문 위력·효율 보너스를 받지 않는다.
- 편의성 입력을 사용해도 주문 성능 페널티가 없다.
- 필사 정확도에 따라 Stock을 2개 이상 지급하지 않는다.
- 보정·가이드 추적 같은 접근성 옵션은 동일한 Stock 1개를 지급할 수 있다.
- 그리기를 하지 않아도 자연충전과 준비 편성으로 모든 기본 전투를 수행할 수 있어야 한다.

---

## 9. 적대적 검토와 보호 경계

### 위험 A — 집중 필사가 사실상 완전 Pause가 됨

가드:

- Active Pressure는 계속 흐른다.
- 적·환경 Event도 느린 속도로 계속 진행한다.
- 실제 시간 기준 마나가 감소한다.

### 위험 B — 필사 유지로 자연충전까지 공짜 가속

가드:

- 자연충전·소환수 지원은 Active Pressure 기준이다.
- 집중 중 Active Pressure가 느려지므로 수동 필사 외 생산은 오히려 느리다.

### 위험 C — 쉬운 글자를 그려 어려운 글자 Stock으로 전환

가드:

- Stock은 글자 종류가 지정된다.
- 그린 글자와 획득 Stock의 ID가 동일해야 한다.

### 위험 D — 그림 실력이 성능을 독점

가드:

- Stock 선택이 기본 입력이다.
- 그리기는 보충 수단일 뿐이다.
- 그리기 품질은 위력·마나·Stock 지급량에 보너스를 주지 않는다.

### 위험 E — 완성 주문 Stock이 3×3 판단을 우회

가드:

- 완성 주문 Stock을 폐기한다.
- 알려진 주문도 글자 노드 배치와 연결·대상 선택을 거쳐 Commit한다.
- 마도서 설계도는 자동 시전이 아니라 배치 안내·불러오기 초안만 제공할 수 있다.

### 금지

```text
FULL_PAUSE_DURING_FOCUS_SCRIBE = PROHIBITED
COMPLETED_SPELL_ONE_TAP_STOCK = PROHIBITED
GENERIC_STOCK_CONVERSION_FROM_ANY_GLYPH = PROHIBITED
DRAWING_POWER_BONUS = PROHIBITED
DRAWING_REQUIRED_FOR_BASIC_COMBAT = PROHIBITED
PASSIVE_CHARGE_ACCELERATED_BY_REAL_TIME_DURING_FOCUS = PROHIBITED
TARGET_NODE_CONSUMES_GLYPH_STOCK = PROHIBITED
CONNECTION_EDGE_CONSUMES_GLYPH_STOCK = PROHIBITED
```

---

## 10. 검증 항목

제품 구현 후 다음을 검증한다.

1. 3×3 화면에서 메인·보조·대상 노드가 색 없이도 구분되는가.
2. `보호+집중`과 `보호+분산`의 대상 규칙을 설명할 수 있는가.
3. Stock 예약·취소·Commit에서 중복 소비·복제가 없는가.
4. 집중 필사 중 적 위협이 사라지지 않는가.
5. `0.25배·마나 1/초`가 유용하지만 상시 최적 행동은 아닌가.
6. 자연충전만으로도 기본 전투가 가능한가.
7. 필사를 선택한 플레이어가 마나·시간 비용을 이해하는가.
8. 접근성 필사 보정이 성능 차별을 만들지 않는가.

초기 수치는 Runtime·사람 검증 전 상용 최종값으로 주장하지 않는다.

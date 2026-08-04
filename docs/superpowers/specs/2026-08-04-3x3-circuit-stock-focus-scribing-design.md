# 3×3 Spell Circuit, Glyph Stock, and Focus Scribing Design

## Status

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
status: USER_APPROVED_ACTIVE
written_at: 2026-08-04T09:14+09:00
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. Design Goal

주문 제작의 주 행동을 `글자 선택 → 3×3 노드 배치 → 방향성 연결 → 대상 선택 → Commit`으로 단순화한다.

직접 그리기는 주문 제작의 필수 입력에서 제외하고, 전투 중 부족한 특정 글자 Stock을 능동적으로 보충하는 보조 숙련 행동으로 재배치한다.

```text
기본 전투 판단
→ Stock으로 글자 노드 배치
→ 대상 노드 배치
→ 노드 연결
→ 주문 Commit

선택적 보조 행동
→ [집중 필사]
→ 특정 글자 직접 작성
→ 해당 글자 Stock +1
```

## 2. Why This Approach

### Rejected A — Drawing every glyph directly into the circuit

- 3×3 배치·연결과 손글씨 입력을 동시에 처리해 모바일 조작이 과밀해진다.
- 빠른 전투에서 그림 입력이 반복 피로와 접근성 장벽이 된다.
- 그림 실력이 주문 성능과 전투 속도를 독점할 위험이 있다.

### Rejected B — Complete spell one-tap Stock

- 알려진 주문을 원터치로 실행하면 3×3 회로 판단이 사라진다.
- 대상·분기·보조 글자 선택을 우회한다.
- 상황 해결과 전투가 서로 다른 규칙처럼 느껴진다.

### Selected C — Typed glyph Stock plus optional focus scribing

- 주문 조합은 언제나 3×3 회로를 거친다.
- Stock은 글자 하나의 직접 입력만 대체한다.
- 필사는 부족한 글자를 능동 보충하지만 시간과 마나의 위험을 가진다.
- 자연충전만으로도 기본 전투가 가능해 필사가 강제되지 않는다.

## 3. 3×3 Circuit Model

### Cell model

```yaml
rows: 3
columns: 3
cell_count: 9
cell_contents:
  - EMPTY
  - MAIN_GLYPH
  - SUPPORT_GLYPH
  - TARGET_KEYWORD
```

### Node identity

```yaml
node_id: string
cell_index: 0_to_8
node_type: MAIN_GLYPH | SUPPORT_GLYPH | TARGET_KEYWORD
glyph_id: string | null
target_id: string | null
incoming_edge_ids: string[]
outgoing_edge_ids: string[]
```

### Edge identity

```yaml
edge_id: string
from_node_id: string
to_node_id: string
direction: DIRECTED
crosses_other_edge: false
passes_through_unrelated_node: false
```

### Validation order

```text
1. 메인 글자 정확히 1개
2. 모든 글자·대상 노드가 메인에서 도달 가능
3. 보조 글자 규칙과 대상 수가 호환
4. 연결선 교차·고립·순환 오류 확인
5. 현재 상황에서 대상이 유효한지 확인
6. 예상 효과와 주요 위험 표시
7. Commit 허용
```

## 4. Topology Rules

- 셀 간 거리는 위력·마나·Stock 비용을 바꾸지 않는다.
- 글자의 연결 순서와 분기 구조가 의미를 만든다.
- 한 노드에서 여러 대상 노드로 나가는 분기는 허용된 보조 글자가 있어야 한다.
- Vertical Slice에서는 선 교차와 복수 메인을 금지한다.
- 알려진 주문명은 `글자 집합 + 연결 위상 + 핵심 적용 방식`이 등록 설계도와 일치할 때 표시한다.
- 대상 인물의 개별 ID는 주문명을 바꾸지 않지만, 단일·다중·지면 지정 같은 대상 형식은 주문 식별에 포함될 수 있다.

## 5. Target Model

### Situation target provider

조사·대화·관찰 결과가 사용할 수 있는 대상 키워드를 제공한다.

```yaml
source_examples:
  - CASSIAN_COMMUNICATION
  - PIPE_DIAGRAM
  - GREENHOUSE_IRRIGATION_INSPECTION
  - SPIRIT_OBSERVATION
```

### Combat target provider

현재 전투 Snapshot에서 대상 후보를 제공한다.

```yaml
combat_target_types:
  - PLAYER
  - ALLY
  - MAIN_SUMMON
  - SECONDARY_SUMMON
  - ENEMY
  - TERRAIN
  - DEVICE
  - ZONE
```

대상 후보는 UI가 임의로 만들지 않는다. 사건·전투 상태가 제공한 읽기 전용 Target ViewModel을 사용한다.

## 6. Glyph Stock Model

### Definition

```text
특정 글자 Stock 1
= 그 글자를 한 번 직접 그리지 않고 노드로 배치할 권리 1회
```

### Inventory

```yaml
shared_capacity: 8_TEST_VALUE
entries:
  - glyph_id: string
    quantity: integer
    reserved_quantity: integer
    natural_charge_remaining_ms: integer | null
```

### Reservation transaction

```text
노드 배치
→ Stock 예약

노드 이동
→ 동일 예약 유지

노드 교체
→ 이전 예약 해제 + 새 Stock 예약

회로 취소
→ 전체 예약 해제

Commit 성공
→ 예약 Stock 소비 + 주문 마나 소비 + 결과 적용

Commit 실패
→ 예약 유지 또는 안전 취소 선택
```

소비와 결과 적용은 하나의 Transaction ID로 Exactly-once 처리한다.

## 7. Natural Charge Model

```yaml
active_target_count: 1
charge_target_type: TYPED_GLYPH
base_seconds_per_glyph: 10_TEST_VALUE
clock: ACTIVE_PRESSURE
progress_persistence: PER_GLYPH
summon_support: INTEGER_SECONDS_REDUCTION
```

완성 주문 충전은 제거한다. 기존 완성 주문 설계도는 주문명·회로 안내용으로 남을 수 있지만 Stock 항목이 되지 않는다.

## 8. Focus Scribing State

### Entry

- 학습·숙련해 필사 가능한 글자를 먼저 선택한다.
- 공용 Stock 용량에 빈칸이 있어야 한다.
- System Resolve·Pause·Background·제어 불가 상태가 아니어야 한다.
- 최소 1 이상의 마나가 있어야 한다.

### Runtime contract

```yaml
state_code: FOCUS_SCRIBE
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_clock: REAL_TIME
mana_drain_per_second: 1_TEST_VALUE
enemy_progress: CONTINUES_AT_ACTIVE_PRESSURE_SCALE
natural_stock_charge: CONTINUES_ONLY_BY_ACTIVE_PRESSURE
summon_stock_cycle: CONTINUES_ONLY_BY_ACTIVE_PRESSURE
```

### Success

```text
선택 글자와 인식 결과가 일치
+ 완성된 유효 획
+ Stock 용량 여유
→ 해당 glyph_id Stock +1
→ 고유 stock_generation_event_id 기록
```

### Exit and interruption

```yaml
manual_cancel:
  stock_gain: 0
  mana_refund: 0

direct_damage_interrupt:
  partial_trace_saved: false
  stock_gain: 0

mana_zero:
  auto_exit: true
  stock_gain_if_not_completed: 0

focus_loss_or_background:
  auto_exit: true
  partial_trace_saved: false
```

## 9. UX States

### Circuit assembly

- 중앙: 3×3 회로판
- 좌측 또는 하단: 보유 글자 Stock
- 우측: 예상 효과·주요 위험·남은 문제
- 대상 노드는 사건/전투 Target Tray에서 끌어온다.
- 글자 노드의 Stock 예약 여부를 숫자와 문구로 표시한다.

### Focus scribing

- 3×3 회로판을 축소하거나 읽기 전용으로 유지한다.
- 필사 캔버스를 우선 영역으로 확장한다.
- `[집중]`, 현재 시간 흐름 상태, `마나 -1/초 TEST_VALUE`, 예상 Stock 증가를 항상 표시한다.
- 적 의도·치명 위험·현재 HP·마나는 계속 보여야 한다.
- 시간을 멈춘 것처럼 보이는 정지 연출을 사용하지 않는다.

## 10. Accessibility

- 직접 필사를 하지 않아도 기본 전투와 사건 해결이 가능해야 한다.
- 가이드 선·스냅·획 순서 안내는 허용하며 Stock 지급량은 동일하다.
- 필사 정확도는 성공/재시도 판정만 하고 위력 보너스를 주지 않는다.
- Reduced Motion에서는 배경 감속 Blur 대신 정적 집중 테두리와 명확한 시간 상태 문구를 사용한다.
- 타이머와 마나 소모는 색뿐 아니라 숫자·아이콘·텍스트로 표시한다.

## 11. Adversarial Review

### Exploit: Focus becomes a pause button

Countermeasure: Active Pressure와 적 Event가 계속 진행하며 마나는 실제 시간으로 감소한다.

### Exploit: Focus farms passive charge and summon cycles

Countermeasure: 자연충전과 소환수 주기는 Active Pressure 기준이라 집중 중 느려진다.

### Exploit: Easiest glyph generates universal Stock

Countermeasure: Stock은 typed glyph이며 그린 glyph_id와 생성 glyph_id가 같아야 한다.

### Exploit: Cancel duplicates reserved Stock

Countermeasure: placement reservation과 commit consumption을 단일 Stock Transaction 계층이 소유한다.

### Usability risk: 3×3 becomes visual spaghetti

Countermeasure: Slice에서 교차선 금지, 메인 1개, 보조 2개, 분기 1회를 사용한다.

### Accessibility risk: drawing skill becomes mandatory DPS

Countermeasure: 자연충전은 항상 존재하고 필사는 위력 보너스를 주지 않는다.

## 12. Prototype Test Values

```yaml
shared_capacity: 8
one_glyph_natural_charge_seconds: 10
minimum_actual_natural_charge_seconds: 3
focus_active_pressure_scale: 0.25
focus_mana_drain_per_real_second: 1
successful_scribe_stock_gain: 1
```

이 값은 밸런스 가설이며 Runtime·사람 검증 후 조정한다.

## 13. Acceptance Criteria

- `보호 → 집중 → 아군 A`가 단일 보호로 검증된다.
- `보호 → 분산 → 아군 A/아군 B`가 분산 보호로 검증된다.
- 대상 노드와 연결선은 Stock을 소비하지 않는다.
- 직접 필사 성공 시 선택한 글자 Stock만 1 증가한다.
- 필사 중 적·환경 진행이 0이 되지 않는다.
- 필사 중 실제 시간 기준 마나가 감소한다.
- 필사 중 자연충전·소환수 생산이 실제 시간 기준으로 가속되지 않는다.
- 완성 주문 Stock 원터치 경로가 존재하지 않는다.
- 편의성 입력 사용자가 주문 위력·마나 효율에서 불이익을 받지 않는다.

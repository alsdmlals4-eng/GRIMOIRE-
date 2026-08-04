# 3×3 Spell Circuit, Glyph Stock, and Focus Scribing Design

## Status

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
status: USER_APPROVED_ACTIVE_HARDENED
review: GR-ADV-20260804-3X3-CANON-PREMERGE
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. Design Goal

주문 제작을 다음 하나의 공통 문법으로 통합한다.

```text
글자 선택
→ 3×3 셀에 글자·대상 노드 배치
→ 인접 노드 방향 연결
→ 예상 효과·위험 확인
→ Commit
```

전투·사건 해결은 같은 회로판을 사용한다. 직접 그리기는 주문마다 반복하는 필수 입력이 아니라 특정 글자 Stock을 보충하는 선택적 숙련 행동이다.

## 2. Selected Approach

### 폐기 — 모든 글자를 주문 안에서 직접 작성

모바일 조작과 판단이 과밀하고 접근성 부담이 커진다.

### 폐기 — 완성 주문 원터치 Stock

대상·분기·배치 판단을 우회한다.

### 채택 — Typed Glyph Stock + 3×3 Circuit + Focus Scribing

- Stock은 숙련 글자 하나의 반복 입력을 대체한다.
- 주문은 항상 3×3 회로를 거친다.
- 필사는 시간·마나 위험과 교환해 같은 글자 Stock을 보충한다.
- 자연충전만으로도 기본 전투가 가능하다.

## 3. Data Model

### Cell

```yaml
rows: 3
columns: 3
cell_count: 9
contents:
  - EMPTY
  - MAIN_GLYPH
  - SUPPORT_GLYPH
  - TARGET_KEYWORD
```

### Node

```yaml
node_id: string
cell_index: 0_to_8
node_type: MAIN_GLYPH | SUPPORT_GLYPH | TARGET_KEYWORD
glyph_subtype: EFFECT | CONNECTION_SUPPORT | MODIFIER | null
glyph_id: string | null
target_id: string | null
incoming_edge_ids: string[]
outgoing_edge_ids: string[]
```

### Edge

```yaml
edge_id: string
from_node_id: string
to_node_id: string
direction: DIRECTED
adjacency: ORTHOGONAL_OR_DIAGONAL_ONE_CELL
crosses_other_edge: false
skips_cell: false
```

## 4. Topology Contract

```yaml
main_glyph_count: exactly_1
support_glyph_count_slice: 0_to_2
target_count_slice: 1_to_4
total_node_count_slice: up_to_7
branch_count_slice: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
crossing_edges: prohibited
all_nodes_reachable_from_main: required
slice_target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

위치는 연결 가능성과 분기 형태를 결정한다. 중앙·모서리·선 길이에는 숨은 수치 보너스가 없다.

`흐름`은 플레이어에게 보조 글자로 보이지만 내부적으로 `CONNECTION_SUPPORT`다.

## 5. Validation Order

```text
1. 메인 글자 정확히 1개
2. 모든 사용 노드가 메인에서 도달 가능
3. 모든 연결이 인접 셀 사이인가
4. 교차·건너뛰기·고립·금지 순환이 없는가
5. 보조 글자와 대상 수가 호환되는가
6. 대상이 현재 Snapshot에서 유효한가
7. Stock 예약과 마나가 충족되는가
8. 예상 효과·주요 위험·미해결 문제 표시
9. Commit 허용
```

## 6. Target Provider

### Situation

- 눈에 보이는 인물·시설은 기본 후보가 될 수 있다.
- 내부 부품·숨은 약점·환경 경로는 조사 뒤 제공한다.
- 핵심 생명 안전 대상은 복수 경로로 확인 가능해야 한다.

### Combat

```yaml
auto_list:
  - PLAYER
  - IDENTIFIED_ALLY
  - MAIN_SUMMON
  - ACTIVE_SECONDARY_SUMMON
  - IDENTIFIED_VISIBLE_ENEMY
observed_or_investigated:
  - TERRAIN
  - DEVICE
  - ZONE
  - HIDDEN_WEAKNESS
```

퇴장·사망·완전 은폐·효과 범위 밖 대상은 비활성화한다. Target Provider는 읽기 전용 Snapshot을 제공하고 회로 UI가 임의 대상을 생성하지 않는다.

## 7. Glyph Stock

```text
특정 글자 Stock 1
= 해당 glyph_id 노드 1회를 그리지 않고 배치할 권리
```

```yaml
shared_capacity: 8_TEST_VALUE
completed_spell_stock: false
target_stock_cost: 0
edge_stock_cost: 0
```

### Reservation Transaction

```text
글자 노드 배치 → 같은 글자 Stock 예약
노드 이동 → 예약 유지
글자 교체 → 이전 예약 해제 + 새 Stock 예약
노드 제거·회로 취소 → 예약 해제
Commit 성공 → Stock·마나·결과 원자 처리
Commit 실패·대상 취소·시스템 오류 → 소비 없음
```

## 8. Natural Charge

```yaml
active_target_count: 1
charge_target_type: TYPED_GLYPH
base_seconds_per_glyph: 10_TEST_VALUE
minimum_actual_seconds: 3_TEST_VALUE
clock: ACTIVE_PRESSURE
progress_persistence: PER_GLYPH
summon_support: INTEGER_SECONDS_REDUCTION
offline_charge: false
```

완성 주문 충전은 존재하지 않는다.

## 9. Focus Scribing

### Entry

```text
필사할 숙련 글자 선택
→ 빈 공용 용량 1칸 예약
→ STATE_FOCUS_SCRIBE 진입
```

진입 불가:

- 공용 용량 여유 없음
- System Resolve·Pause·Background
- 행동 불가 제어 상태
- 마나 0

### Runtime

```yaml
state_code: STATE_FOCUS_SCRIBE
player_label: 집중_필사
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_clock: REAL_TIME
mana_drain_per_second: 1_TEST_VALUE
enemy_progress: CONTINUES_AT_ACTIVE_PRESSURE_SCALE
natural_charge: ACTIVE_PRESSURE_ONLY
summon_stock_cycle: ACTIVE_PRESSURE_ONLY
reserved_capacity_slots: 1
```

예약된 용량은 자연충전과 소환수 지원이 채울 수 없다.

### Success

```text
선택 glyph_id와 인식 glyph_id 일치
+ 유효한 완성 획
→ 예약칸에 같은 glyph_id Stock +1
→ 고유 stock_generation_event_id 기록
```

### Interrupt

- 수동 취소
- 인식 실패
- 실제 HP 감소를 동반한 직접 피해
- 행동 불가 제어 상태
- 마나 0
- Focus loss·Background

중단 시 부분 획은 폐기하고 예약 용량을 해제한다. 시간·마나는 환불하지 않는다. 최종 피해 0과 기본 지속 피해는 Prototype에서 중단하지 않는다.

## 10. Known Spell Blueprint

```yaml
mode: NON_BINDING_GHOST_REFERENCE
auto_reserve_stock: false
auto_target: false
auto_commit: false
auto_best_route: false
```

등록 주문은 반투명 참고 위상을 제공할 수 있다. 플레이어는 실제 노드 배치·Stock 예약·대상 선택·Commit을 직접 수행한다.

## 11. Preview

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
confidence_values:
  - 정보_충분
  - 정보_부분
  - 정보_부족
```

성공 확률 숫자와 결말 미리보기는 금지한다.

## 12. Mobile UX

### Circuit Assembly

- 중앙: 3×3 회로판.
- 한쪽: 보유 글자 Stock과 수량.
- 반대쪽: 효과·위험·미해결 문제.
- 대상 Tray: 현재 Situation/Combat Provider가 제공한 후보.
- 인접 연결 가능 셀만 드래그 중 강조.
- 메인·보조·대상은 색 없이도 모양·라벨·아이콘으로 구분.

### Focus Scribing

- 회로판은 축소·읽기 전용으로 유지.
- 필사 Canvas를 우선 영역으로 확장.
- `[집중 필사]`, `시간 0.25배 TEST`, `마나 -1/초 TEST`, 획득 글자·예약 용량을 표시.
- HP·적 의도·치명 위험·마나는 계속 노출.
- 완전 정지처럼 보이는 연출 금지.

## 13. Accessibility

- 자연충전과 Stock 선택만으로 기본 전투 가능.
- 가이드 선·스냅·획 순서 안내 허용.
- 보정 입력도 같은 Stock 1개 지급.
- 그림 품질은 위력·마나 효율·지급량 보너스 없음.
- Reduced Motion은 Blur 대신 정적 테두리와 시간 상태 문구 사용.
- 시간·마나·위험은 색 외 숫자·아이콘·텍스트로 중복 표현.

## 14. Adversarial Guards

```text
완전 Pause 악용 → Active Pressure와 마나 비용 유지
수동+수동 외 생산 가속 → 자연충전·소환수는 Active Pressure만 사용
범용 Stock 변환 → 그린 glyph_id와 생성 glyph_id 동일
필사 중 마지막 용량 경합 → 진입 시 1칸 예약
Stock 예약 복제 → 단일 Transaction 계층 소유
3×3 장식화 → 인접 연결만 허용
Visual spaghetti → 교차 금지·분기 1·노드 7
설계도 정답 버튼화 → Ghost Reference only
그림 실력 강제 → 위력 보너스 없음·기본 전투 필사 불필요
```

## 15. Acceptance Criteria

- 인접하지 않은 노드는 연결할 수 없다.
- 모든 사용 노드는 메인에서 도달 가능하다.
- 대상 노드는 Slice에서 끝점이다.
- `보호→집중→A`와 `보호→분산→A/B`가 다른 대상 규칙으로 검증된다.
- 대상과 연결선은 Stock을 쓰지 않는다.
- 필사 성공은 선택한 같은 글자 Stock만 1 증가시킨다.
- 필사 예약칸은 수동 외 충전이 침범하지 않는다.
- 필사 중 적·환경 진행과 마나 소모가 유지된다.
- 완성 주문 원터치 경로가 없다.
- 접근성 입력 사용자가 성능 불이익을 받지 않는다.

모든 수치는 Runtime·사람 검증 전 `TEST_VALUE`다.

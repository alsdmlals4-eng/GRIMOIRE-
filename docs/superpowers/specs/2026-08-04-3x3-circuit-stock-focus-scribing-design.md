# 3×3 Spell Circuit Design — `[부분 대체됨]`

## Status

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-3X3-CIRCUIT-STOCK-FOCUS-01
status: ACTIVE_CIRCUIT_SPEC_PARTIALLY_SUPERSEDED_RESOURCE_SECTION
partial_superseding_decision: GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
partial_superseding_spec: docs/superpowers/specs/2026-08-05-glyph-vault-universal-stock-design.md
implementation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
```

> 3×3 회로의 Cell·Node·Edge·Topology·Target Provider·Preview 계약은 계속 유효하다. 과거 Typed Glyph Stock·자연충전 대상·필사 출력 데이터 모델은 새 Spec으로 대체됐다.

## 1. Active circuit model

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

## 2. Active topology contract

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

위치는 연결 가능성과 분기 형태를 결정한다. 중앙·모서리·선 길이에는 숨은 수치 보너스가 없다. `흐름`은 UI상 보조 글자이며 데이터상 `CONNECTION_SUPPORT`다.

## 3. Active validation order

```text
1. 메인 글자 정확히 1개
2. 모든 사용 노드가 메인에서 도달 가능
3. 모든 연결이 인접 셀 사이인가
4. 교차·건너뛰기·고립·금지 순환이 없는가
5. 보조 글자와 대상 수가 호환되는가
6. 대상이 현재 Snapshot에서 유효한가
7. 보관함 또는 범용 Stock 예약과 마나가 충족되는가
8. 예상 효과·주요 위험·미해결 문제 표시
9. Commit 허용
```

## 4. Active Target Provider

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

퇴장·사망·완전 은폐·효과 범위 밖 대상은 비활성화한다. UI가 임의 대상이나 정답 대상을 생성하지 않는다.

## 5. Resource model — superseded

다음 과거 계약은 구현에 사용하지 않는다.

```text
TYPED_GLYPH_ONLY
PER_GLYPH_STOCK_PROGRESS
NATURAL_CHARGE_TO_TYPED_GLYPH
FOCUS_SCRIBE_TO_SAME_GLYPH_STOCK
```

새 계약:

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_allowed_pool: LEARNED_MAIN_OR_SUPPORT
resource_source: EXPLICIT_SOURCE_SELECTION
natural_charge_output: UNIVERSAL_GLYPH_STOCK_PLUS_1
focus_scribe_output: FOCUS_SCRIBE_WRITES_TO_VAULT
target_or_edge_cost: 0
spell_commit_uses_mana: true
completed_spell_stock: prohibited
```

상세 책임은 `2026-08-05-glyph-vault-universal-stock-design.md`와 `STOCK_SYSTEM.md`를 따른다.

## 6. Focus state — preserved with changed output

```yaml
state_code: STATE_FOCUS_SCRIBE
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_clock: REAL_TIME
mana_drain_per_second: 1_TEST_VALUE
enemy_progress: CONTINUES_AT_ACTIVE_PRESSURE_SCALE
full_pause: false
```

필사할 글자와 보관함 빈 슬롯을 예약하고, 성공하면 같은 `glyph_id`의 보관함 항목을 1 생성한다.

## 7. Known spell blueprint

```yaml
mode: NON_BINDING_GHOST_REFERENCE
auto_reserve_resource: false
auto_target: false
auto_commit: false
auto_best_route: false
```

## 8. Preview

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
numeric_success_probability: prohibited
ending_reveal: prohibited
```

## 9. Mobile UX

- 중앙: 3×3 회로판.
- 왼쪽: 컴팩트 상태바, 핵심/보조 글자 Tray, 보관함과 범용 Stock.
- 오른쪽: 상황 설명, 키워드·대상, Preview.
- 글자 배치 때 가능한 `[보관함: 해당 글자]`와 `[Stock]` 출처를 명시적으로 고른다.
- 인접 연결 가능 셀만 강조한다.
- 메인·보조·대상·자원은 색 외 모양·라벨·아이콘으로 구분한다.

## 10. Acceptance criteria

- 인접하지 않은 노드는 연결할 수 없다.
- 모든 사용 노드는 메인에서 도달 가능하다.
- 대상 노드는 Slice에서 끝점이다.
- `보호→집중→A`와 `보호→분산→A/B`가 다른 대상 규칙으로 검증된다.
- 대상과 연결선은 자원을 쓰지 않는다.
- 보관함은 정확히 일치하는 글자에만 사용된다.
- 범용 Stock은 습득한 핵심·보조 글자 중 하나에 사용된다.
- 모든 주문 Commit은 마나를 사용한다.
- 집중 필사 중 적·환경 진행과 마나 소모가 유지된다.
- 완성 주문 원터치 경로가 없다.

모든 수치는 Runtime·사람 검증 전 `TEST_VALUE`다. 과거 전체 자원 설계는 Git 이력에만 보존된다.

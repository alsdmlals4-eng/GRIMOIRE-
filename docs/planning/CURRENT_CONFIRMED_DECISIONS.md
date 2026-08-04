# GRIMOIRE 현재 확정 결정 스냅샷

## 상태

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT
updated_at: 2026-08-04T09:37+09:00
main_authority_commit: 839129524ba14279141add809fb400383949d5ea
current_main_sync: GR-SYNC-20260804-10-MAIN
finalization_pull_request: 58
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 완료된 Batch

1. `GM-FOUNDATION-POC-EXECUTION-READINESS-01`
2. `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01`
3. `GM-SCHOOL-CRISIS-PEDAGOGY-01`
4. `GM-SLICE-HEAT-FLOW-OBSERVATION-01`
5. `GM-3X3-CIRCUIT-STOCK-FOCUS-01`

PR #57에서 main에 병합됐고 새 Grill Batch는 `0/10`으로 시작한다.

## 프로젝트 코어

> 마법학교 학생이 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임지는 마법 RPG.

```text
조사 → 의도 선택 → 3×3 회로 → Preview → Commit → 세계 변화 → 복기·발견
```

## 주문

```yaml
grid: 3x3
main_glyph: exactly_1
support_glyphs_slice: 0_to_2
targets_slice: 1_to_4
total_nodes_slice: up_to_7
branches_slice: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
crossing_edges: prohibited
skip_connection: prohibited
all_nodes_reachable: required
target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

```text
글자 노드 + 대상 노드 + 셀 위치 + 방향성 인접 연결 = 회로
유효 회로 Commit = 주문
```

주문명은 글자 이름과 별개다. 알려진 설계도는 자동 시전이 아닌 참고 회로다.

## Slice

```yaml
main: 열
connection_support: 흐름
modifiers: [집중, 분산]
```

보이고 식별된 전투 참가자는 자동 대상이며 환경·장치·숨은 약점은 관찰·조사 후 열린다.

## Stock·마나·필사

```yaml
stock_scope: TYPED_GLYPH_ONLY
shared_capacity: 8_TEST_VALUE
natural_charge_target_count: 1
one_glyph_charge_seconds: 10_TEST_VALUE
minimum_actual_seconds: 3_TEST_VALUE
target_or_edge_cost: 0
completed_spell_stock: prohibited
spell_commit_uses_mana: true
focus_time_scale: 0.25_TEST_VALUE
focus_mana_per_real_second: 1_TEST_VALUE
focus_success: SAME_GLYPH_STOCK_PLUS_1
focus_capacity_reservation: 1
```

직접 그리기는 선택적 Stock 보충 기능이며 위력 보너스를 주지 않는다. 자연충전만으로 기본 전투가 가능해야 한다.

## Frostbloom

등장: 에일린 교수, 카시안, 모트. 교수는 외부 확산만 막는 하나의 주문 예시를 보여주며 정답·필수 루트·채점키가 아니다.

대표 접근:

1. 시설 복구.
2. 생명 구조.
3. 정령 안정화.
4. 봉쇄·철수.
5. 제압·시간 확보.
6. 합리적 미등록 해결.

## 보류

- 상태이상–typed glyph Stock 재설계.
- 마나 비용 공식.
- 3×3 Mobile Wireframe.
- Godot 다운로드 SHA-256 고정 검증.
- 제품 Runtime·모바일·성능·접근성·사람 검증.

모든 Prototype 수치는 `TEST_VALUE`다.

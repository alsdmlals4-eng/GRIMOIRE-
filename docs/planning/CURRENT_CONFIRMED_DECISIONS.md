# GRIMOIRE 현재 확정 결정 스냅샷

## 상태

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT
main_authority_commit: 39da99fbc56ccdf90904b24b5725cb0d0779595a
current_main_sync: GR-SYNC-20260804-11-MAIN-READBACK
sheet_readback_pull_request: 59
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 완료 Batch

PR #57과 #58을 통해 다음 Decision 5개가 main 정본으로 확정됐다.

1. `GM-FOUNDATION-POC-EXECUTION-READINESS-01`
2. `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01`
3. `GM-SCHOOL-CRISIS-PEDAGOGY-01`
4. `GM-SLICE-HEAT-FLOW-OBSERVATION-01`
5. `GM-3X3-CIRCUIT-STOCK-FOCUS-01`

새 Grill Batch는 `0/10`이다.

## 핵심 재미

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
조사 → 의도 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

## 주문 정본

```yaml
grid: 3x3
main_glyph: exactly_1
support_glyphs: 0_to_2
targets: 1_to_4
total_nodes: up_to_7
branches: up_to_1
edge: ADJACENT_8_NEIGHBOR_ONLY
crossing_or_skip: prohibited
all_nodes_reachable: required
target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

글자·대상 노드의 위치와 인접 방향 연결이 회로이며 유효 회로 Commit이 주문이다. 주문명은 글자 이름과 별개다.

## Slice

`열` 메인 + `흐름` 연결 보조 + 선택 `집중·분산`.

보이고 식별된 전투 참가자는 자동 대상 후보이고 환경·장치·숨은 약점은 관찰·조사 후 열린다.

## Stock·마나·필사

```yaml
stock: TYPED_GLYPH_ONLY
capacity: 8_TEST_VALUE
natural_charge: ONE_TYPED_GLYPH_10_SECONDS_TEST
minimum_charge: 3_SECONDS_TEST
completed_spell_stock: prohibited
spell_commit_uses_mana: true
focus_time_scale: 0.25_TEST_VALUE
focus_mana: 1_PER_REAL_SECOND_TEST_VALUE
focus_gain: SAME_GLYPH_STOCK_PLUS_1
focus_capacity_reservation: 1
```

직접 그리기는 선택적 Stock 보충 기능이며 위력 보너스를 주지 않는다.

## Frostbloom

등장: 에일린 교수, 카시안, 모트. 교수 주문은 하나의 해결 예시일 뿐 정답·필수 루트·채점키가 아니다. 시설 복구·생명 구조·정령 안정화·봉쇄·제압·합리적 미등록 해결을 허용한다.

## 보류

- 상태이상–typed glyph Stock 재설계.
- 마나 비용 공식.
- 3×3 Mobile Wireframe.
- 배포물 SHA-256 고정 검증.
- 제품 Runtime·모바일·성능·접근성·사람 검증.

모든 Prototype 수치는 `TEST_VALUE`다.

# GRIMOIRE 현재 확정 결정 스냅샷

## 상태

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
current_main_sync: GR-SYNC-20260804-12-CLOSURE
closure_pull_request: 60
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
canon_status: MERGED_AND_FINALIZED_SHEET_READBACK_PASS
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 완료 Batch

PR #57·#58·#59를 통해 다음 Decision 5개가 main 정본으로 확정됐으며 새 Grill Batch는 `0/10`이다.

1. `GM-FOUNDATION-POC-EXECUTION-READINESS-01`
2. `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01`
3. `GM-SCHOOL-CRISIS-PEDAGOGY-01`
4. `GM-SLICE-HEAT-FLOW-OBSERVATION-01`
5. `GM-3X3-CIRCUIT-STOCK-FOCUS-01`

## 핵심 재미

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
조사 → 의도 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

## 주문

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

## Slice·Stock·필사

- `열` 메인 + `흐름` 연결 보조 + 선택 `집중·분산`.
- Typed glyph Stock만 사용.
- 모든 주문 Commit은 마나 사용.
- 대상·연결선 Stock 비용 0.
- 완성 주문 원터치 Stock 폐기.
- `[집중 필사]`: `0.25배 TEST`, `마나 1/초 TEST`, 같은 글자 `+1`, 용량 `1` 예약.
- 직접 그리기는 선택 기능이며 위력 보너스 없음.

## Frostbloom

에일린 교수, 카시안, 모트가 등장한다. 교수 주문은 하나의 예시일 뿐 정답·필수 루트·채점키가 아니다. 시설 복구·생명 구조·정령 안정화·봉쇄·제압·합리적 미등록 해결을 허용한다.

## 보류

상태이상–typed glyph Stock 재설계, 마나 비용 공식, 3×3 Mobile Wireframe, 배포물 SHA-256 고정 검증, 제품 Runtime·모바일·성능·접근성·사람 검증.

모든 Prototype 수치는 `TEST_VALUE`다.

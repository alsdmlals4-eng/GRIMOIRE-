# GRIMOIRE 현재 확정 결정 스냅샷

## 상태

```yaml
status: MAIN_CANON_STABLE_WITH_USER_APPROVED_DRAFT_CHECKPOINT
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
main_closure_commit: 4c50b462a8e296e24583b727ab93c82ba1e9c041
current_main_sync: GR-SYNC-20260804-12-CLOSURE
working_pull_request: 61
latest_approved_decision: GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
grill_counter: 2_of_10
pending_decisions: 2
merge_authorized: false
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 완료 Batch

PR #57~#60에서 다음 Decision 5개가 main 정본으로 완료됐다.

1. `GM-FOUNDATION-POC-EXECUTION-READINESS-01`
2. `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01`
3. `GM-SCHOOL-CRISIS-PEDAGOGY-01`
4. `GM-SLICE-HEAT-FLOW-OBSERVATION-01`
5. `GM-3X3-CIRCUIT-STOCK-FOCUS-01` — 자원 범위는 새 Decision에 의해 `[부분 대체됨]`.

## 현재 승인·병합 대기 Decision

1. `GM-GLYPH-VAULT-UNIVERSAL-STOCK-01`
   - 보관함 = 미리 그린 특정 글자 전용.
   - Stock = 습득한 핵심·보조 글자 중 원하는 하나에 쓰는 범용 자원.
   - 자연충전 → 범용 Stock.
   - 집중 필사 → 해당 글자 보관함.

2. `GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01`
   - 의미 있는 작업은 벤치마크·현업 비교 필수.
   - 실행 가능한 변경은 strict RED→GREEN→REFACTOR.
   - 비실행 작업은 제작 전 수용·거부 사례와 증거 한계 선언.
   - 승인 Batch 최대 10건.
   - 고위험 충돌·세션 종료·큰 정본 영향은 조기 Draft 체크포인트 허용.

두 Decision은 사용자 승인됐지만 PR #61 검토·CI·Sheet Readback 전에는 main 병합 상태가 아니다.

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

## Slice·자원·필사

```yaml
slice_main: HEAT
slice_supports: [FLOW, FOCUS, DISPERSE]
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_pool: LEARNED_MAIN_OR_SUPPORT
source_selection: EXPLICIT_SOURCE_SELECTION
target_and_edge_cost: 0
spell_commit_uses_mana: true
completed_spell_stock: prohibited
natural_charge_output: UNIVERSAL_GLYPH_STOCK_PLUS_1
focus_scribe_output: FOCUS_SCRIBE_WRITES_TO_VAULT
focus_time_scale: 0.25_TEST_VALUE
focus_mana: 1_PER_REAL_SECOND_TEST_VALUE
```

## 문양·모바일

- 실제 입력 문양은 1~3획 권장, 고급 문양 최대 4획 후보.
- 장식 문양은 입력 실루엣을 유지하고 외곽 룬·광원만 추가한다.
- 핵심 단어는 현상, 보조 단어는 방향·작동 방식을 직관적으로 보여준다.
- 왼쪽: 컴팩트 상태바·핵심/보조 Tray·보관함·Stock.
- 중앙: 3×3 회로.
- 오른쪽: 상황 설명·키워드/대상·Preview.

## TDD 현재 증거

```yaml
contract_test: tests/test_glyph_vault_stock_governance_contract.py
red_workflow_run: 30925666145
red_result: 6_tests_3_failures_3_errors_expected
implementation: NOT_STARTED
```

## 보류

문양 후보의 사람 인지 테스트, 상태이상–새 자원 연동, 마나 비용 공식, 제품 Godot 프로젝트, 모바일 실기기·성능·접근성·사람 검증, Base 공용 정책 승격.

모든 Prototype 수치는 `TEST_VALUE`다.

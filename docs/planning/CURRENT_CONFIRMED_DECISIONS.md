# GRIMOIRE 현재 확정 결정 스냅샷

## 상태

```yaml
status: MAIN_CANON_STABLE_WITH_USER_APPROVED_DRAFT_CHECKPOINT
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
main_closure_commit: 4c50b462a8e296e24583b727ab93c82ba1e9c041
current_main_sync: GR-SYNC-20260804-12-CLOSURE
draft_sync: GR-SYNC-20260805-02-GLYPH-VOCABULARY-IMPLEMENTATION-PLANS
working_pull_request: 61
latest_approved_decision: GM-GLYPH-VOCABULARY-V1-01
grill_counter: 3_of_10
pending_decisions: 3
current_gate: IMPLEMENTATION_PLANS_READY
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
   - 보관함 슬롯과 Stock 용량은 별도.
   - 자연충전 → 단일 범용 Stock 진행도.
   - 집중 필사 → 해당 글자 보관함.
   - Spec 사용자 검토 완료.

2. `GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01`
   - 의미 있는 작업은 벤치마크·현업 비교 필수.
   - 실행 가능한 변경은 strict RED→GREEN→REFACTOR.
   - 비실행 작업은 제작 전 수용·거부 사례와 증거 한계 선언.
   - 승인 Batch 최대 10건.
   - 고위험 충돌·세션 종료·큰 정본 영향은 조기 Draft 체크포인트 허용.
   - Spec 사용자 검토 완료.

3. `GM-GLYPH-VOCABULARY-V1-01`
   - 핵심 단어 10종·보조 단어 10종 의미 범위 승인.
   - Runtime Slice는 `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, `BURST` 6종.
   - 입력형 1~3획 권장, 장식형은 기본 실루엣 유지.
   - 낮은 확신 자동 확정 금지.
   - 사람 인지·손가락 검증 전 Runtime 확대 금지.

세 Decision은 사용자 승인됐지만 PR #61은 Draft·미병합이며 별도 병합 승인이 없다.

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
slice_runtime_glyphs: [HEAT, PROTECT, FLOW, FOCUS, DISPERSE, BURST]
frostbloom_main: HEAT
frostbloom_supports: [FLOW, FOCUS, DISPERSE]
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_pool: LEARNED_MAIN_OR_SUPPORT
source_selection: EXPLICIT_SOURCE_SELECTION
capacity: SEPARATE_VAULT_AND_STOCK_CAPACITY
target_and_edge_cost: 0
spell_commit_uses_mana: true
completed_spell_stock: prohibited
natural_charge: UNIVERSAL_STOCK_SINGLE_CHARGE_PROGRESS
focus_scribe_output: FOCUS_SCRIBE_WRITES_TO_VAULT
focus_time_scale: 0.25_TEST_VALUE
focus_mana: 1_PER_REAL_SECOND_TEST_VALUE
```

## 구현 계획

```text
Resource Foundation POC
→ VaultInventory
→ UniversalStockPool
→ ResourceReservationLedger
→ AtomicSpellCommitService
→ Save/Resume·View Model·Stop Gate

Resource Stop Gate
→ Vocabulary Recognition POC
→ GlyphDefinition·Template Repository
→ DollarOneRecognizer·bounded DollarNRecognizer
→ RecognitionCandidate·confidence/stale guards
→ confusion_matrix·Human/Device Stop Gate
```

- Resource 계획: `docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md`.
- Recognition 계획: `docs/superpowers/plans/2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md`.
- 제품 구현은 아직 시작하지 않았다.

## TDD 증거

```yaml
contract_test: tests/test_glyph_vault_stock_governance_contract.py
initial_red_workflow: 30925666145
capacity_red_workflow: 30928418370
entrypoint_red_workflow: 30928799903
charge_lifecycle_red_workflow: 30929106014
spec_review_and_plan_red_workflow: 30958182618
planning_and_adversarial_green: 30958977292
godot_toolchain_green: 30958977145
sheet_readback: PASS
implementation: NOT_STARTED
```

## 보류·미실행

상태이상–새 자원 연동, 마나 비용 공식, 제품 Godot 프로젝트, 실제 문양 인식률, 모바일 실기기, 성능, 접근성, 사람 인지·피로 검증, Base 공용 정책 승격은 미실행 또는 보류다.

모든 Prototype 수치는 `TEST_VALUE`다.

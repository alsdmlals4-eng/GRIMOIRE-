# GRIMOIRE Active Context

## 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/glyph-vault-stock-governance-design
working_pull_request: 61
platform: MOBILE_LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
current_main_sync: GR-SYNC-20260804-12-CLOSURE
draft_sync: GR-SYNC-20260805-02-GLYPH-VOCABULARY-IMPLEMENTATION-PLANS
latest_approved_decision: GM-GLYPH-VOCABULARY-V1-01
grill_counter: 3_of_10
pending_decisions: 3
checkpoint_state: HIGH_CANON_IMPACT_DRAFT_CHECKPOINT
current_gate: IMPLEMENTATION_PLANS_READY
merge_authorized: false
product_project: NOT_CREATED
product_code: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 정본 복원

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → 자원 승인/Spec → 운영 승인/Spec → Vocabulary 승인/Spec → 구현 계획 2종 → 3×3/Frostbloom → Batch → Sync 02 → PR #61`.

## 플레이어 약속

> 조사로 상황을 이해하고 의도를 정한 뒤, 글자·대상·3×3 회로로 주문을 구현하고 결과와 대가를 책임진다.

```text
조사 → 의도 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기
```

## 회로

```yaml
main_glyph: exactly_1
support_glyphs: 0_to_2
targets: 1_to_4
total_nodes: up_to_7
branches: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
crossing_edges: prohibited
skip_connection: prohibited
all_nodes_reachable: required
target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

Frostbloom Slice는 `HEAT` 메인, `FLOW` 연결 보조, 선택 `FOCUS·DISPERSE`를 사용한다. 보이고 식별된 참가자는 자동 대상이며 환경·장치·숨은 약점은 조사 후 열린다.

## 보관함·Stock·필사

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_allowed_pool: LEARNED_MAIN_OR_SUPPORT
source_selection: EXPLICIT_SOURCE_SELECTION
capacity: SEPARATE_VAULT_AND_STOCK_CAPACITY
natural_charge: UNIVERSAL_STOCK_SINGLE_CHARGE_PROGRESS
focus_scribe_gain: EXACT_GLYPH_VAULT_PLUS_1
target_and_edge_cost: 0
completed_spell_stock: prohibited
spell_commit_uses_mana: true
focus_time_scale: 0.25_TEST_VALUE
focus_mana: 1_PER_REAL_SECOND_TEST_VALUE
```

보관함은 직접 그린 특정 글자만 사용한다. Stock은 사용 시점에 습득한 핵심·보조 글자 중 하나를 고른다. 둘 다 가능하면 출처를 명시적으로 선택한다. 예약은 용량을 이중 차감하지 않는다.

## Vocabulary v1

```yaml
main_count: 10
support_count: 10
slice_runtime:
  - HEAT
  - PROTECT
  - FLOW
  - FOCUS
  - DISPERSE
  - BURST
input_strokes: 1_to_3
advanced_candidate_max_strokes: 4
ornament_is_recognition_input: false
expansion_gate: HUMAN_COMPREHENSION_TEST_REQUIRED_BEFORE_EXPANSION
```

20종의 의미 범위는 승인됐지만 Runtime 인식은 우선 6종으로 제한한다. 낮은 확신은 자동 확정하지 않으며 실제 사람·기기 검증 전 확대하지 않는다.

## 작업 운영

```yaml
benchmark: BENCHMARK_AND_PRO_COMPARISON_REQUIRED
evidence: SOURCE_VERSION_TRANSFER_LIMIT_REQUIRED
executable_work: STRICT_RED_GREEN_REFACTOR
non_executable_work: TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
max_approved_decisions_per_batch: 10
early_checkpoint:
  - HIGH_RISK_CONFLICT
  - SESSION_END_OR_CONTEXT_LOSS
  - MAJOR_CANON_IMPACT
```

이번 승인 단계는 contract test를 먼저 확장하고 Workflow `30958182618`에서 Vocabulary 승인·계획·Batch 3 누락 때문에 예상 RED를 확인한 뒤 최소 GREEN을 작성했다. 최신 Planning·Godot workflow는 성공했고 Sheet Readback도 PASS다.

## 구현 계획

1. `docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md`.
2. Resource Stop Gate 이후 `docs/superpowers/plans/2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md`.

Resource 계획은 `VaultInventory`, `UniversalStockPool`, `ResourceReservationLedger`, `AtomicSpellCommitService`를 순수 상태 계층으로 구현한다. Recognition 계획은 `GlyphDefinition`, `GlyphTemplateRepository`, `$1/$N`, `RecognitionCandidate`, `confusion_matrix`를 구현한다.

## Frostbloom

등장: 에일린 교수, 카시안, 모트. 교수는 외부 확산만 막는 한 가지 주문 예시를 보여주며 내부 목표를 대신 해결하지 않는다. 교수 방식과의 일치는 채점 기준이 아니다.

## 다음 우선순위

1. PR #61 최신 HEAD·Review Thread·Sheet 상태 고정.
2. Codex 격리 worktree에서 Resource 계획을 TDD로 실행.
3. Resource Stop Gate 통과 후 Recognition 계획 실행.
4. 실제 기기·사람 검증 전 Vocabulary 확대 금지.

## 금지

완성 주문 원터치 Stock, Stock 주문 무마나 실행, 보관함 글자 변환, 미습득 글자 Stock 선택, 자원 출처 자동 소비, 집중 필사 완전 Pause, 그림 위력 보너스, 설계도 자동 대상·자동 Commit, 교수 예시 정답화, 숫자 성공률 Preview, 낮은 인식 확신 자동 확정, 사람 검증 전 6종 초과 Runtime 확대, 검증 없는 Runtime PASS.

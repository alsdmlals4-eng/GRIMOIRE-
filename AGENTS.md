# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: a27b75ea9aabcbb84159356b857e22b3acd30a43
current_main_sync: GR-SYNC-20260804-12-CLOSURE
working_branch: agent/glyph-vocabulary-recognition-poc
working_pull_request: 63
active_child_branch: agent/stage2-circuit-bridge-harness-poc
active_child_pull_request: 65
current_sync: GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX
latest_approved_decision: GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
related_approved_decisions:
  - GM-GLYPH-VAULT-UNIVERSAL-STOCK-01
  - GM-WORKFLOW-BENCHMARK-TDD-CHECKPOINT-01
  - GM-GLYPH-VOCABULARY-V1-01
  - GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
grill_counter: 4_of_10
pending_decisions: 4
checkpoint_state: HIGH_CANON_IMPACT_DRAFT_CHECKPOINT
current_gate: STAGE2_HARNESS_UX_HX_READY_FOR_CODEX_TDD
human_device_validation: NOT_RUN
runtime_expansion_7_plus: BLOCKED
merge_authorized: false
product_project: CREATED_POC
product_implementation: RESOURCE_AND_RECOGNITION_POC_PASS_STAGE2_HARNESS_IN_TDD
runtime_validation: AUTOMATED_SYNTHETIC_ONLY
```

PR #57~#60의 main 정본은 유지한다. PR #61~#63과 현재 자식 PR #65는 Stacked Draft이며 별도 승인 전 Ready 전환·병합하지 않는다. PR #65는 승인된 Stage 2 Low-fi Harness의 TDD 구현만 수행한다.

## 권위 우선순위

1. 사용자의 최신 명시 결정.
2. 이 파일.
3. `START_HERE.md`.
4. `docs/ACTIVE_CONTEXT.md`.
5. `docs/DEVELOPMENT_GATES.md`.
6. `docs/planning/CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md`.
7. `docs/planning/CANON_STATUS_INDEX_2026-08-05.md`.
8. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`.
9. 최신 승인 Decision·Protocol·UX/HX 원본.
10. 실제 제품 코드·테스트·Runtime 증거.
11. Base pin·공유 Skill 계약.
12. 과거 Draft·Working·Sync·추정.

구형 파일은 상태 색인의 `[부분 대체됨]·[대체됨]·[보류]·[구현완료 보관]·[폐기]·[이력]` 분류를 따른다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CURRENT_RUNTIME_CHECKPOINT_2026-08-05.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-05.md
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ GLYPH_HUMAN_CIRCUIT_BRIDGE 승인·Protocol·적대 검토
→ STAGE2_CIRCUIT_BRIDGE_HARNESS UX/HX·State Matrix
→ Stage 2 Harness 구현 계획
→ Sync06 Receipt·Sheet
→ PR #63
→ PR #65
```

## Base 계약

```yaml
base_repository: alsdmlals4-eng/Base
release: v9.4.3
release_commit: 7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8
release_evidence_commit: da33a350d61b8adc52df97fccc7001708a933370
finalization_commit: 0b7c94f38d959efc0fc9442274c60b2e268a3c97
registry_sha256: 693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59
```

Base 공용 승격은 프로젝트 증거가 생긴 뒤 별도 검토한다. 이번 PR에서 Base 파일을 변경하지 않는다.

## 역할 분리

```text
GPT → 핵심 재미·콘텐츠·UX/HX·벤치마킹·적대적 검토·정본 동기화·구현 계획
Codex형 구현 → 승인 범위의 Godot 코드·TDD·자동 Runtime 증거
사람 검증 → 실제 참가자·실기기 실행과 관찰
```

자동화 PASS는 사람 검증 PASS가 아니다. 실제 사람·실기기 결과는 계속 `NOT_RUN`으로 유지한다.

## 프로젝트 코어

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
SITUATION_TO_MEANING_TO_COMMIT_TO_CONSEQUENCE_TO_GRIMOIRE
조사·상황 → 의도·의미 → 3×3 회로 → Preview → Commit → 변화·대가 → 복기·Grimoire
```

`RECOGNITION_IS_INPUT_INFRASTRUCTURE_NOT_THE_CORE_FUN`.

`EXACT_GLYPH_VAULT_AND_UNIVERSAL_GLYPH_STOCK_ARE_SUPPORT_SYSTEMS`.

전투와 비전투는 같은 주문 문법을 쓴다.

## Stage 2 Harness 경계

```text
LOW_FIDELITY_VALIDATION_HARNESS_NOT_FINAL_ART
TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT
LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL
CENTER_TARGET_AND_3X3_CIRCUIT
RIGHT_WRITING_FOCUS_PANEL
BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT
SCENARIO_CONTEXT_SURVIVES_RECOGNITION_RETRY
EXPLICIT_VAULT_OR_STOCK_SOURCE_PER_GLYPH
COMMIT_REQUIRES_SEPARATE_CONFIRMATION
NO_AUTOMATIC_SOLUTION_OR_BEST_GLYPH_RECOMMENDATION
```

Harness는 상황 2종·Runtime 6종·기본 도형과 텍스트만 사용한다. 최종 전투 HUD, 최종 아트, 7번째 글자, 전체 콘텐츠 확장을 만들지 않는다.

## 3×3 회로

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
slice_target_nodes: TERMINAL_LEAF
hidden_position_bonus: prohibited
```

```text
글자 노드 + 대상 노드 + 셀 위치 + 방향성 인접 연결 = 회로
유효 회로 Preview → 별도 Confirm → Commit = 주문
```

Validator는 자동 수정·자동 최적화·Best Glyph를 제공하지 않는다.

## 보관함·Stock·마나·필사

```yaml
vault: EXACT_GLYPH_VAULT
stock: UNIVERSAL_GLYPH_STOCK
stock_allowed_pool: LEARNED_MAIN_OR_SUPPORT
resource_source: EXPLICIT_SOURCE_SELECTION
capacity: SEPARATE_VAULT_AND_STOCK_CAPACITY
natural_charge: UNIVERSAL_STOCK_SINGLE_CHARGE_PROGRESS
focus_scribe_output: FOCUS_SCRIBE_WRITES_TO_VAULT
target_or_edge_cost: 0
completed_spell_stock: prohibited
spell_commit_uses_mana: true
focus_time_scale: 0.25_TEST_VALUE
focus_mana_per_real_second: 1_TEST_VALUE
full_pause: false
```

- 보관함은 직접 그려 저장한 특정 `glyph_id`에만 사용한다.
- Stock 1개는 사용 시점에 습득한 핵심·보조 글자 중 하나를 선택한다.
- 둘 다 사용 가능하면 출처를 직접 고른다.
- 예약·Commit은 기존 Resource Reservation·Atomic Commit 계층을 우선 재사용한다.
- 직접 그리기는 위력 보너스가 없고 기본 전투의 필수 입력이 아니다.

## Vocabulary v1

```yaml
main_glyphs: 10
support_glyphs: 10
slice_runtime_glyphs:
  - HEAT
  - PROTECT
  - FLOW
  - FOCUS
  - DISPERSE
  - BURST
expansion_gate: HUMAN_COMPREHENSION_TEST_REQUIRED_BEFORE_EXPANSION
input_strokes: 1_to_3
advanced_candidate_max_strokes: 4
ornament_is_recognition_input: false
```

Runtime은 정확히 6종이다. 사람 인지·손가락 입력·혼동·피로와 핵심 루프 연결 검증 전 확대하지 않는다.

## TDD 규칙

```text
STRICT_RED_GREEN_REFACTOR
TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
```

- 실행 가능한 기능은 테스트를 먼저 쓰고 예상 이유의 RED를 실제 CI 경로에서 확인한다.
- 최소 GREEN 후 전체 회귀를 확인하고 GREEN 상태에서만 Refactor한다.
- 새 기능은 기존 API를 먼저 확인하고 존재하지 않는 Production API를 추정하지 않는다.
- 자동 판정할 수 없는 재미·직관성·피로도는 실제 검증 전 `HUMAN_NOT_RUN`으로 유지한다.

## 로그·개인정보 경계

```text
ANONYMOUS_PARTICIPANT_ID_ONLY
NO_RAW_PERSONAL_IDENTIFIER
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
RECOGNITION_EVENT_STREAM
CORE_LOOP_EVENT_STREAM
MODERATOR_INTERVENTION_EVENT
ARTIFACT_SHA_AND_FIXTURE_ID_REQUIRED
```

이름·연락처·계정 등 원시 개인식별정보를 저장하지 않는다. Recognition과 Core Loop 이벤트를 분리하고 진행자 개입을 별도 기록한다.

## Hard Stop

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
DUPLICATE_SAVE_OR_REWARD_ZERO_HARD_STOP
STALE_RESULT_APPLICATION_ZERO_HARD_STOP
```

Hard Stop 발생 시 다음 Scenario 진행과 자동 PASS 처리를 금지한다.

## 승인 Batch·병합

```text
MAX_APPROVED_DECISIONS_PER_BATCH_10
EARLY_CHECKPOINT_HIGH_RISK_CONFLICT
EARLY_CHECKPOINT_SESSION_END
EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
```

이번 Harness는 기존 승인 Decision의 구현 상세이므로 GrillMe는 `4/10`을 유지한다. Draft 체크포인트와 자동화 PASS는 병합 승인이 아니다.

## 검증 경계

```yaml
resource_foundation_automated: PASS
recognition_six_glyph_automated: PASS
stage2_harness_automated: IN_TDD
human_device_validation: NOT_RUN
human_end_to_end_core_loop: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
runtime_expansion_7_plus: BLOCKED
final_art: NOT_REQUIRED_FOR_HARNESS
merge_authorized: false
```

모든 Prototype 수치는 `TEST_VALUE`다.

## 구현 계획

1. `docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md`.
2. `docs/superpowers/plans/2026-08-05-glyph-vocabulary-recognition-poc-implementation-plan.md`.
3. `docs/superpowers/plans/2026-08-05-stage2-circuit-bridge-harness-implementation-plan.md`.
4. PR #65에서 State·Fixture·Recognition Bridge·Circuit·Commit·Low-fi Scene·Event Recorder를 TDD로 구현한다.

PR #63과 PR #65는 Draft·미병합이며 별도 사용자 승인 전 Ready 전환·병합하지 않는다.

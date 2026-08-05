# GR-TEST-032 Authority Preservation — 2026-08-06

## 목적

이 문서는 Sync08 실행 준비가 Sync07의 제품·기획·검증 정본을 삭제하거나 약화하지 않았음을 보장하는 권위 보존 부록이다. 현재 진입점은 간결한 실행 상태를 제공하지만, 상세 회로·자원·UX·TDD·Base 드리프트·Stop Gate는 이 문서와 원본 문서를 통해 계속 유효하다.

```yaml
previous_sync: GR-SYNC-20260805-07-STAGE2-HARNESS-AUTOMATED
previous_pull_request: 65
previous_pr_state: PR_65_OPEN_DRAFT_UNMERGED
previous_product_gate: STAGE2_HARNESS_AUTOMATED_PASS_HUMAN_NOT_RUN
current_sync: GR-SYNC-20260806-01-GR-TEST-032-EXECUTION-READY
current_pull_request: 67
current_gate: GR_TEST_032_READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN
human_execution: NOT_RUN
human_pass_claim: NO_HUMAN_PASS_CLAIM
runtime_expansion_7_plus: BLOCKED
merge_authorized: false
```

Sync08은 `GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01`의 실행 준비 기록이며 새 제품 결정이 아니다. GrillMe는 `4/10`을 유지한다.

## 플레이어 약속과 핵심 루프

```text
SITUATION_TO_MEANING_TO_COMMIT_TO_CONSEQUENCE_TO_GRIMOIRE
상황·조사 → 의도·의미 → 3×3 회로 → Preview → Commit → 변화·대가 → Grimoire
RECOGNITION_IS_INPUT_INFRASTRUCTURE_NOT_THE_CORE_FUN
EXACT_GLYPH_VAULT_AND_UNIVERSAL_GLYPH_STOCK_ARE_SUPPORT_SYSTEMS
```

플레이어는 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임진다. Recognition은 입력 인프라이며 핵심 재미를 대체하지 않는다. Vault와 Stock은 자원 지원 계층이며 의미 선택과 결과 책임을 자동화하지 않는다.

## Stage 2 Low-fi Harness 공간 정본

```text
TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT
LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL
CENTER_TARGET_AND_3X3_CIRCUIT
RIGHT_WRITING_FOCUS_PANEL
BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT
LOW_FIDELITY_VALIDATION_HARNESS_NOT_FINAL_ART
```

- 상단: 목표·위협·현재 상황을 지속 노출한다.
- 좌측: Stage 1·2·3 진행 Rail은 읽기 전용이며 현재 상태를 설명한다.
- 중앙: 대상과 3×3 회로를 구성한다.
- 우측: Writing/Focus 입력과 Recognition 피드백을 담당한다.
- 하단: HP·Mana·명시적 Vault/Stock 출처·Preview·Commit을 제공한다.
- Retry 중 Scenario·Target·Source·Circuit Draft를 보존한다.
- Active Stroke 중 Writing Canvas가 입력을 독점하며 Circuit·Preview·Commit 입력을 차단한다.
- Commit은 Preview 뒤 별도 Confirm을 요구하며 Cancel은 Mutation 없이 돌아간다.
- 자동 해법·Best Glyph·성공 확률 추천을 제공하지 않는다.

## Stage 2 상태 흐름

```text
SCENARIO_BRIEF
→ INTENT_AND_SOURCE_SELECT
↔ WRITING_FOCUS
↔ CIRCUIT_EDIT
→ PREVIEW_READY
→ COMMIT_CONFIRM
→ SYSTEM_RESOLVE
→ RESULT_EXPLAIN
```

오류·Retry는 `ERROR_SAFE_RECOVERY`를 거치며 이전 Context를 보존한다. Preview 이전에는 자원 변경이 0이고, Confirm 시점에 기존 Reservation·Mana·Atomic Commit 서비스를 사용한다. 중복 Confirm은 추가 비용·보상·결과를 만들지 않는다.

## 3×3 회로 정본

```text
MAIN_GLYPH_EXACTLY_1
SUPPORT_GLYPHS_0_TO_2
TARGETS_1_TO_4
TOTAL_NODES_UP_TO_7
BRANCHES_UP_TO_1
ADJACENT_8_NEIGHBOR_ONLY
CROSSING_EDGES_PROHIBITED
SKIP_CONNECTION_PROHIBITED
ALL_NODES_REACHABLE_REQUIRED
TARGET_NODES_TERMINAL_LEAF
```

글자 노드·대상 노드·셀 위치·방향성 인접 연결이 회로를 구성한다. Validator는 자동 수정·자동 최적화·Best Glyph 선택을 제공하지 않는다. 교차 간선 누락은 적대 검토에서 RED `31018302521`로 발견했고 GREEN `31018467326`으로 보완됐다.

## Resource 정본

```text
EXACT_GLYPH_VAULT
UNIVERSAL_GLYPH_STOCK
LEARNED_MAIN_OR_SUPPORT
EXPLICIT_SOURCE_SELECTION
SEPARATE_VAULT_AND_STOCK_CAPACITY
UNIVERSAL_STOCK_SINGLE_CHARGE_PROGRESS
FOCUS_SCRIBE_WRITES_TO_VAULT
TARGET_AND_EDGE_COST_ZERO
SPELL_COMMIT_USES_MANA
COMPLETED_SPELL_STOCK_PROHIBITED
```

- Exact Vault는 사용자가 직접 그려 성공적으로 저장한 특정 `glyph_id`를 보관한다.
- Universal Stock은 사용 시점에 습득한 Main/Support 글자 중 하나를 선택하는 범용 자원이다.
- 둘 다 사용 가능하면 플레이어가 출처를 명시적으로 고른다.
- Recognition 성공은 Exact Vault에만 저장하며 Stock을 생성하지 않는다.
- stale·low-confidence·선택/인식 불일치 결과는 저장하지 않는다.
- Vault와 Stock의 용량은 별도다.

## Vocabulary 정본

```text
MAIN_10_SUPPORT_10
RUNTIME_GLYPHS_EXACTLY_6
HEAT
PROTECT
FLOW
FOCUS
DISPERSE
BURST
HUMAN_COMPREHENSION_TEST_REQUIRED_BEFORE_EXPANSION
```

의미 Registry는 Main 10·Support 10을 유지하지만 Runtime Slice는 정확히 6종이다. 사람 인지·손가락 입력·혼동·피로·핵심 루프 연결 검증 전 7번째 Runtime 글자를 추가하지 않는다.

## 자동 검증 증거 보존

```text
28_GODOT_SUITES
1343_ASSERTIONS
0_FAILURES
```

Sync07 최종 exact-head 검증:

```yaml
foundation_run: 31020223682
planning_base_adversarial_run: 31020223136
godot_toolchain_run: 31020224001
result: PASS
```

위 자동 증거는 합성·결정적 Fixture 범위이며 실제 사람의 의미 이해나 실제 기기 조작성 PASS를 의미하지 않는다.

## TDD·작업 Governance

```text
STRICT_RED_GREEN_REFACTOR
TEST_FIRST_ACCEPTANCE_FOR_NON_EXECUTABLE_WORK
BENCHMARK_AND_PRO_COMPARISON_REQUIRED
SOURCE_VERSION_LIMIT_REQUIRED
MAX_APPROVED_DECISIONS_PER_BATCH_10
EARLY_CHECKPOINT_HIGH_RISK_CONFLICT
EARLY_CHECKPOINT_SESSION_END
EARLY_CHECKPOINT_MAJOR_CANON_IMPACT
```

실행 가능한 기능은 실패 이유가 명확한 RED를 먼저 확인하고 최소 GREEN 후 전체 회귀를 검증한다. 재미·직관성·피로도처럼 자동 판정할 수 없는 항목은 실제 실행 전 `NOT_RUN`으로 유지한다.

## 로그·개인정보 정본

```text
ANONYMOUS_PARTICIPANT_ID_ONLY
NO_RAW_PERSONAL_IDENTIFIER
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
RECOGNITION_EVENT_STREAM
CORE_LOOP_EVENT_STREAM
MODERATOR_INTERVENTION_EVENT
ARTIFACT_SHA_AND_FIXTURE_ID_REQUIRED
```

이름·연락처·이메일·계정명·주소 등 원시 개인식별정보를 저장하지 않는다. Recognition·Core Loop·Moderator 이벤트를 분리하고, first attempt와 post-feedback를 합쳐 약점을 숨기지 않는다.

## Hard Stop 정본

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
STALE_RESULT_APPLICATION_ZERO_HARD_STOP
MISMATCH_SAVE_ZERO_HARD_STOP
DUPLICATE_SAVE_OR_REWARD_ZERO_HARD_STOP
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
DUPLICATE_COST_OR_RESULT_ZERO_HARD_STOP
MODERATOR_SOLUTION_PROMPT_ZERO_HARD_STOP
CRITICAL_ACCESSIBILITY_FAILURE_ZERO_HARD_STOP
```

Hard Stop 발생 시 다음 Scenario·PASS 승격·Runtime 확대를 중단한다.

## Base 계약·드리프트 보존

```text
BASE_PIN_C987647D
BASE_MAIN_339A48BE
BASE_DRIFT_54_COMMITS_DEFERRED
```

```yaml
project_base_pin: c987647d01ad2baa028a16e03d85ddfc1572a727
observed_base_main: 339a48be688e312b7894e1f2372aecfe0ee3f6f4
observed_ahead_commits: 54
migration_status: DEFERRED_TO_SEPARATE_TDD_CHANGE
```

Base의 Human/Synthetic evidence governance·Godot 4.7.1 runtime pilot·Live Editor Contract 변화는 별도 TDD 마이그레이션으로 처리한다. PR #67에서 Base pin을 암묵적으로 최신화하지 않는다.

## Sync08 실행 준비 확장

```text
GR-SYNC-20260806-01-GR-TEST-032-EXECUTION-READY
READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN
C_STAGED_RECOGNITION_THEN_CORE_LOOP
STAGE_1_RECOGNITION_DIAGNOSTIC
SAME_PARTICIPANT_WITH_BREAK
STAGE_2_CORE_LOOP_BRIDGE
```

Sync08이 추가한 것은 다음 실행 운영물뿐이다.

- Runbook.
- Moderator Script.
- Physical Device Preflight.
- 익명 Session·Attempt·Result 템플릿.
- PENDING/PROMISING/TUNE/REWORK/STOP 분석기.
- Hard Stop 강제와 PII·7번째 글자 거부.
- 원시 증거 해시·레코드 수 일치 검증.

```text
SOURCE_ATTEMPT_SHA256_REQUIRED
SOURCE_STAGE2_SHA256_REQUIRED
SOURCE_RECORD_COUNT_MUST_MATCH_AGGREGATE
```

완료 세션은 Stage 1 원시 Attempt SHA-256·레코드 수와 Stage 2 관찰 SHA-256·레코드 수가 집계값과 일치해야 분석된다. `PROMISING`도 Human PASS·출시 PASS·Ready·Merge 승인이 아니다.

## 현재 정직한 경계

```text
HUMAN_EXECUTION_NOT_RUN
HUMAN_DEVICE_VALIDATION_NOT_RUN
HUMAN_END_TO_END_CORE_LOOP_NOT_RUN
FULL_VERTICAL_SLICE_REPRESENTATIVENESS_NOT_RUN
NO_HUMAN_PASS_CLAIM
RUNTIME_EXPANSION_7_PLUS_BLOCKED
MERGE_NOT_AUTHORIZED
```

PR #63·#65·#67은 Draft·미병합이다. 실제 물리 기기 Preflight와 P01~P06 실행, 결과 적대 검토, 사용자 승인 전 Ready 또는 Merge하지 않는다.

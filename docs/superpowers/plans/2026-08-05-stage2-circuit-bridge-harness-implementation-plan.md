# Stage 2 Circuit Bridge Harness Implementation Plan

## 목적

`GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01`의 Stage 2 사람 검증을 실행할 수 있도록, 기존 6종 Recognition·Glyph Resource Foundation·모바일 HUD 공간 권위를 연결하는 최소 Godot Harness를 구현한다.

```yaml
sync_id: GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX
status: READY_FOR_CODEX_TDD_HARNESS
implementation_owner: CODEX
base_branch: agent/glyph-vocabulary-recognition-poc
recommended_branch: agent/stage2-circuit-bridge-harness-poc
recommended_pr: NEW_DRAFT_STACKED_ON_PR63
human_execution: NOT_RUN
```

## 절대 범위

```text
RED_TEST_WRITTEN_FIRST
STRICT_RED_GREEN_REFACTOR
RUNTIME_GLYPHS_EXACTLY_6
NO_FINAL_ART_ASSET_REQUIRED
NO_SEVENTH_GLYPH
NO_FULL_VERTICAL_SLICE_CONTENT_EXPANSION
HUMAN_EXECUTION_NOT_RUN
READY_FOR_CODEX_TDD_HARNESS
```

이 계획은 최종 게임 화면, 신규 글자, 전체 학교·전투 콘텐츠를 만들지 않는다. 기본 도형, 텍스트, 상태 아이콘으로 검증용 Harness만 만든다.

## 재사용 대상

- `src/ui/controllers/recognition_poc_main.gd`.
- `src/ui/models/glyph_recognition_layout_model.gd`.
- `src/ui/models/glyph_recognition_poc_view_model.gd`.
- `src/ui/models/glyph_resource_view_model.gd`.
- `src/glyphs/resources/`의 Vault, Stock, Reservation, Commit 계층.
- 승인된 20종 Registry 중 Runtime 6종 템플릿.
- 기존 모바일 HUD의 Top/Left/Center/Right/Bottom 공간 언어.

재사용 전 실제 API와 Scene Path를 확인한다. 존재하지 않는 Production Circuit API를 추정하지 않는다.

## 신규 파일 후보

```text
src/ui/models/stage2_circuit_bridge_state.gd
src/ui/models/stage2_circuit_bridge_view_model.gd
src/ui/controllers/stage2_circuit_bridge_main.gd
src/ui/stage2_circuit_bridge_harness.tscn
src/testing/stage2_bridge_event_recorder.gd
src/testing/stage2_bridge_fixture_repository.gd
data/testing/stage2_bridge_scenarios.json
tests/test_stage2_circuit_bridge_state.gd
tests/test_stage2_circuit_bridge_harness.gd
tests/test_stage2_bridge_event_recorder.gd
```

파일명은 실제 프로젝트 구조와 충돌할 경우 조정할 수 있지만 책임 경계는 유지한다.

## Task 1 — State Machine RED

### RED

`tests/test_stage2_circuit_bridge_state.gd`를 먼저 작성한다.

검증:

- 초기 상태 `SCENARIO_BRIEF`.
- 허용 전환만 통과.
- `WRITING_FOCUS`에서 `ACTIVE_STROKE_OWNER_WRITING_CANVAS`.
- Retry 후 Scenario, Target, Source, Circuit Draft 보존.
- `COMMIT_CONFIRM` 전 Commit 금지.
- Cancel은 상태·자원을 변경하지 않음.
- Hard Stop은 다음 Scenario 진행 금지.

### GREEN

`stage2_circuit_bridge_state.gd`에 명시적 Enum과 전환 Guard를 최소 구현한다.

### REFACTOR

State 전환, Guard Reason, Event 기록을 분리한다.

## Task 2 — Scenario Fixture RED

### RED

Fixture Repository 테스트를 먼저 작성한다.

필수 Fixture:

- `SCENARIO_A_NONCOMBAT_PROTECT_CONTROL`.
- `SCENARIO_B_PRESSURED_FIELD_RESPONSE`.

각 Fixture는 다음만 포함한다.

- Objective, Threat, Situation.
- Target 1~4.
- 허용 Runtime Glyph 6종.
- 적법한 복수 해결 범위.
- 결과·대가 설명 Fixture.

### GREEN

`data/testing/stage2_bridge_scenarios.json`과 Repository를 구현한다.

금지:

- 단일 정답 강제.
- Best Glyph 추천.
- 7번째 글자.
- 최종 Narrative Content 확장.

## Task 3 — Recognition Bridge RED

### RED

기존 Recognition 결과를 Harness State에 연결하는 Adapter 테스트를 먼저 작성한다.

검증:

- 성공 결과는 Exact Glyph Vault에만 반영.
- 낮은 확신·혼동·stale·선택 불일치 차단.
- Retry 전후 Scenario Context 보존.
- `FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED` 이벤트.
- `RECOGNITION_EVENT_STREAM` 별도 기록.

### GREEN

기존 Recognition View Model/Coordinator에 최소 Adapter를 추가한다. 기존 Recognition 알고리즘을 복제하지 않는다.

## Task 4 — 3×3 Circuit Editor/Validator RED

### RED

Harness에서 필요한 승인 계약만 검증한다.

```yaml
grid: 3x3
main_glyph: exactly_1
support_glyphs: 0_to_2
targets: 1_to_4
total_nodes: up_to_7
branches: up_to_1
edge_rule: ADJACENT_8_NEIGHBOR_ONLY
crossing_or_skip: prohibited
all_nodes_reachable: required
target_nodes: TERMINAL_LEAF
```

검증:

- Invalid Reason이 구체적.
- 자동 수정 없음.
- 각 Glyph에 명시적 Vault/Stock Source.
- Tap 기반 Node/Edge 대안 존재.

### GREEN

Production Circuit 구현이 없다면 `stage2_circuit_bridge` Namespace 안의 최소 Validator로 구현하고, Production 완료로 표현하지 않는다.

## Task 5 — Preview·Atomic Commit RED

### RED

- Source 누락, invalid circuit, stale Recognition, 부족 자원에서 Commit 금지.
- Preview에 의미·대상·비용·위험 표시.
- Commit은 별도 Confirm 후 1회만 실행.
- Cancel은 Mutation 0.
- 중복 Confirm은 결과·비용 1회.
- 실패 시 Reservation Rollback.

### GREEN

기존 Resource Reservation·Atomic Commit Service를 우선 재사용한다. Harness Adapter가 필요하면 Production Service 앞의 얇은 계층으로 둔다.

```text
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
DUPLICATE_SAVE_OR_REWARD_ZERO_HARD_STOP
```

## Task 6 — Low-fi Scene·HX RED

### RED

4개 Landscape 해상도와 Text Scale 100/130/200% Layout 테스트를 먼저 작성한다.

필수 영역:

```text
TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT
LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL
CENTER_TARGET_AND_3X3_CIRCUIT
RIGHT_WRITING_FOCUS_PANEL
BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT
```

검증:

- Android 48dp, iOS 44pt Target.
- Safe Area.
- Source Badge 과밀 없음.
- Active Stroke 중 Motion 0.
- Reduced Motion 0ms 상태 교체.
- Drag 외 Tap 대안.
- 색상 단독 상태 없음.

### GREEN

기본 Control, Panel, Label, TextureRect Placeholder만 사용한다.

```text
NO_FINAL_ART_ASSET_REQUIRED
```

## Task 7 — Event Recorder RED

### RED

다음 Stream을 별도 검증한다.

```text
RECOGNITION_EVENT_STREAM
CORE_LOOP_EVENT_STREAM
MODERATOR_INTERVENTION_EVENT
```

필수 Metadata:

```text
ANONYMOUS_PARTICIPANT_ID_ONLY
NO_RAW_PERSONAL_IDENTIFIER
ARTIFACT_SHA_AND_FIXTURE_ID_REQUIRED
```

검증:

- first/post-feedback 분리.
- hand/device class 기록.
- Moderator Intervention 전후 분리.
- Raw 이름·연락처·계정 저장 금지.
- 동일 Event 중복 기록 방지.

### GREEN

JSON Lines 또는 Deterministic JSON Array 중 기존 Project Convention에 맞는 하나를 사용한다.

## Task 8 — 통합 Headless Gate

다음 순서로 실행한다.

```text
새 RED 테스트 확인
→ State/Fixture/Recognition/Circuit/Commit/Layout/Event GREEN
→ 기존 19 suites·913 assertions 회귀 확인
→ Scope Checker: Runtime Glyph 정확히 6
→ Headless POC
→ Planning/Base·Adversarial
→ Godot Toolchain
```

필수 결과:

- 신규 Harness 테스트 0 failure.
- 기존 Resource·Recognition 회귀 0.
- Runtime 6종 유지.
- Human 결과 생성 금지.
- 실제 기기 상태 `NOT_RUN` 유지.

## Task 9 — 증거와 Draft PR

생성:

```text
docs/validation/STAGE2_CIRCUIT_BRIDGE_HARNESS_REPORT.md
docs/planning/STAGE2_CIRCUIT_BRIDGE_HARNESS_STOP_GATE_01_2026-08-05.md
artifacts/foundation-poc/stage2-bridge-fixture-report.json
artifacts/foundation-poc/stage2-bridge-event-schema.json
```

새 Draft PR은 PR #63 위에 Stacked하며 자동화 PASS만으로 Ready/merge하지 않는다.

## 완료 정의

```yaml
harness_automated_gate: PASS
human_execution: NOT_RUN
human_device_validation: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
runtime_expansion_7_plus: BLOCKED
final_art: NOT_REQUIRED_FOR_HARNESS
merge_authorized: false
```

Codex는 구현 완료 후 exact-head Commit, 모든 Workflow Run, 변경 파일, 미실행 Gate를 보고한다.

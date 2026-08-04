# GRIMOIRE 작업 규칙

이 파일은 **GRIMOIRE: 세계를 다시 쓰는 법**의 최상위 프로젝트 운영 권위다. 세부 수치와 기능 규칙은 연결된 최신 승인 책임 원본을 우선한다.

## 1. 프로젝트 바인딩

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/foundation-poc-readiness-review
working_pull_request: 57
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
work_mode: GPT_CREATIVE_PLANNING_AND_CODEX_HANDOFF
base_release: v9.4.3
main_authority: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
current_main_sync: GR-SYNC-20260803-06
current_working_sync: GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS
current_approved_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_me_batch_counter: 5/10
pending_decisions: 5
current_gpt_focus: 3X3_CIRCUIT_AND_FOCUS_SCRIBE_MOBILE_WIREFRAME
foundation_poc_product_code: NOT_STARTED
codex_execution: DEFERRED_UNTIL_SELECTED_CREATIVE_SCOPE_IS_READY
runtime_validation: NOT_RUN
```

브랜치·pending Decision·카운터의 기계 권위는 `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`이다.

## 2. 역할 분리

```text
GPT
→ 핵심 재미·콘텐츠·대사·UX·이미지·아트 설계
→ 적대적 검토
→ 승인 결과를 GitHub·Sheet에 같은 Decision ID로 동기화
→ 선택된 범위만 Codex 명세로 전달

Codex
→ 승인된 설계의 Godot 구현
→ project.godot·GDScript·Scene·Resource·테스트·CI
→ Runtime·실기기·성능 검증
```

GPT 단계에서 제품 구현 PASS를 주장하지 않는다.

## 3. 권한 우선순위

1. 사용자의 최신 명시적 결정.
2. 이 `AGENTS.md`.
3. `START_HERE.md`.
4. `docs/ACTIVE_CONTEXT.md`.
5. 최신 승인 Decision과 책임 원본.
6. `docs/DEVELOPMENT_GATES.md`.
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
8. 실제 코드·Scene·데이터·테스트.
9. Base Release·Evidence.
10. Legacy·과거 대화·추정.

## 4. 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md
→ docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md
→ 질문 주제의 최신 책임 원본
→ docs/planning/GRILL_ME_BATCH_MERGE_STATE.json
→ docs/planning/sync/GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS.md
```

GitHub·Sheet 조회로 해결되는 사실을 사용자에게 다시 묻지 않는다.

## 5. Base 계약

```yaml
base_repository: alsdmlals4-eng/Base
release: v9.4.3
release_commit: 7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8
release_evidence_commit: da33a350d61b8adc52df97fccc7001708a933370
finalization_commit: 0b7c94f38d959efc0fc9442274c60b2e268a3c97
registry_sha256: 693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59
```

- `skills/PROJECT_BASE_ADAPTER.json`만 프로젝트 통합 편집 권위다.
- Base Skill 본문을 프로젝트에 복제하지 않는다.
- 승인 Scope 밖 구현을 시작하지 않는다.

## 6. 필수 작업 루프

```text
현재 정본·실제 상태 조회
→ 의도·결정 정의
→ 벤치마킹과 대안 비교
→ 중립 권장안
→ 사용자 승인
→ 같은 Decision ID로 GitHub·Sheet 동기화
→ 적대적 검토
→ UTF-8·NFC·Readback
→ 최신 HEAD CI·Review 확인
```

사용자 의견에 자동 동의하지 않는다. 권장안에도 반대 질문과 실패 조건을 적용한다.

## 7. 프로젝트 핵심 약속

> 상황을 조사하고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자와 대상 노드를 3×3 회로에 배치·연결해 주문을 만들고, 결과와 대가를 책임지는 마법학교 RPG.

```text
상황·위험 조사
→ 해결 의도 선택
→ 글자·대상 키워드 확보
→ 3×3 노드 배치·연결
→ 예상 효과·위험 확인
→ 명시적 Commit
→ 세계 변화
→ 복기·마도서 기록
```

전투는 복수 해결 방식 중 하나이며 필수가 아니다.

## 8. 3×3 주문 회로 계약

책임 원본:

- `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`

```yaml
grid: 3x3
main_glyph_nodes: exactly_1
support_glyph_nodes_slice_max: 2
target_keyword_nodes_slice_max: 4
total_nodes_slice_max: 7
branches_slice_max: 1
crossing_edges: prohibited
```

```text
글자 노드 + 대상 키워드 노드 + 위치 + 방향성 연결
= 회로
= 주문 설계
```

- 주문명은 글자 이름과 별개다.
- 같은 글자도 배치·연결·대상 형식에 따라 다른 주문이 된다.
- 대상 노드는 사건 조사 결과 또는 현재 전투 참가자·지형에서 동적으로 제공된다.
- 셀 거리에는 숨은 위력 보너스가 없다.

## 9. 대상 문법

```text
보호 → 집중 → 아군 A
= 단일 강보호

보호 → 분산
          ├→ 아군 A
          └→ 아군 B
= 다중 분산 보호
```

- 집중은 출력과 범위를 한곳에 모으고 대상 상한을 1로 제한한다.
- 분산은 다중 대상·넓은 구역을 허용하며 개별 출력이 나뉜다.
- 허용 보조 없이 다중 대상 분기를 만들면 불완전·불안정 경고다.

## 10. 글자 Stock 계약

책임 원본:

- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/STOCK_CAPACITY_SYSTEM.md`
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`

```yaml
stock_scope: TYPED_GLYPH_ONLY
stock_unit: ONE_GLYPH_NODE_PLACEMENT
shared_capacity: 8_TEST_VALUE
natural_charge_target_count: 1
one_glyph_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
completed_spell_stock: prohibited
target_node_stock_cost: 0
connection_edge_stock_cost: 0
```

- 특정 글자 Stock 1개는 그 글자를 직접 그리지 않고 노드 1개로 배치한다.
- 노드 배치 시 예약하고 Commit 성공 때 주문 마나와 함께 원자 소비한다.
- 완성 주문 원터치 Stock은 3×3 판단을 우회하므로 금지한다.
- 마도서 설계도는 배치 안내·초안만 제공하며 자동 Commit하지 않는다.

## 11. 집중 필사 계약

```yaml
state: FOCUS_SCRIBE
role: OPTIONAL_TYPED_GLYPH_STOCK_REPLENISHMENT
active_pressure_scale: 0.25_TEST_VALUE
full_pause: false
mana_drain_per_real_second: 1_TEST_VALUE
successful_recognition_gain: SAME_GLYPH_STOCK_PLUS_1
```

- 적·환경은 느려진 Active Pressure로 계속 진행한다.
- 자연충전·소환수 `[스톡]` 주기는 Active Pressure 기준이라 실제 시간으로 가속되지 않는다.
- 직접 피해로 실제 HP가 감소하면 필사를 중단하고 미완성 획을 폐기한다.
- 필사는 기본 전투 필수가 아니며 위력 보너스를 주지 않는다.
- 가이드 추적 등 접근성 보조도 동일한 Stock 1개를 지급할 수 있다.

## 12. Vertical Slice 글자·사건 계약

```yaml
main_glyph: HEAT
connection_grammar: FLOW
optional_support_glyphs: [FOCUS, DISPERSE]
representative_known_circuit: HEAT_PLUS_FLOW
```

교수의 외곽 회로는 하나의 유효 예시일 뿐 정답·필수·최적·평가기준이 아니다. 자동 판독 없이 텍스트 노벨 조사로 `열`과 `흐름`을 확인하고, 관찰 결과는 감각과 실제 변화만 표시한다.

## 13. 학교 위기 교육 계약

```yaml
L0: OBSERVE_NORMAL_NONLETHAL_FAILURE
L1: NARROW_MISSED_CONDITION_WITHOUT_NAMING_SOLUTION
L2: CLEAR_SAFETY_WARNING_BEFORE_IRREVERSIBLE_DANGER
L3: DIRECT_LIFESAVING_INTERVENTION_ONLY
```

교수는 핵심 목표를 대신 해결하지 않는다. 철수·봉쇄·지원 요청은 자동 실패가 아니다.

## 14. 복수 해결 계약

```yaml
approaches: 5
solution_patterns_per_approach: 4
total_reference_patterns: 20
explicit_answer_menu: false
reasonable_unlisted_solution: ALLOWED_BY_MEANING_AND_SITUATION_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

## 15. Summon·State·Save 계약

- 메인 소환수 1 + 보조 S1/S2/S3.
- 같은 시각 Event 순서 `MAIN → S1 → S2 → S3`.
- 소환수는 조사·수호·견제·Stock 자연충전을 보조하지만 회로·대상 선택을 대신하지 않는다.
- Stock 소비와 주문 결과는 같은 Transaction ID로 원자 처리한다.
- Exactly-once 소유자는 ResultLedger다.
- Background·Offline 경과로 전투·치유·Stock을 생성하지 않는다.

## 16. 적대적 보호 경계

```text
COMPLETED_SPELL_ONE_TAP_STOCK = PROHIBITED
MULTIPLE_MAIN_GLYPHS_IN_SLICE = PROHIBITED
CROSSING_EDGES_IN_SLICE = PROHIBITED
TARGET_NODE_STOCK_COST = PROHIBITED
CONNECTION_EDGE_STOCK_COST = PROHIBITED
GENERIC_STOCK_FROM_DIFFERENT_GLYPH = PROHIBITED
FULL_PAUSE_DURING_FOCUS_SCRIBE = PROHIBITED
PASSIVE_CHARGE_REAL_TIME_ACCELERATION_DURING_FOCUS = PROHIBITED
DRAWING_POWER_BONUS = PROHIBITED
DRAWING_REQUIRED_FOR_BASIC_COMBAT = PROHIBITED
AUTO_OPTIMAL_TARGET_OR_CIRCUIT = PROHIBITED
FACULTY_EXAMPLE_AS_ONLY_SOLUTION = PROHIBITED
PLAYER_REQUIRED_TO_COPY_FACULTY_CIRCUIT = PROHIBITED
AUTOMATIC_GLYPH_RECOGNITION_OVERLAY = PROHIBITED
SINGLE_TRUE_ENDING = PROHIBITED
```

## 17. 현재 다음 작업

```text
3×3 회로판 Mobile Landscape Wireframe
→ 집중 필사 오버레이·시간·마나 UX
→ 서리꽃 온실 UX Map에 적용
→ Art Direction·Asset Brief
→ 승인 범위의 Codex 구현 명세
```

제품 `project.godot`, GDScript, Scene 구현과 Runtime·Device·Performance·Accessibility·Human 검증은 아직 시작하지 않았다. PR #57은 Draft 상태를 유지하며 병합하지 않는다.

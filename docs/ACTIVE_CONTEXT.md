# GRIMOIRE Active Context

> 현재 승인 상태와 다음 작업을 복원하는 권위 문서다.

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/foundation-poc-readiness-review
pull_request: 57
primary_platform: MOBILE_LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
last_main_sync: GR-SYNC-20260803-06
current_working_sync: GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS
approved_current_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
approved_slice_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
approved_situation_decision: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
approved_pedagogy_decision: GM-SCHOOL-CRISIS-PEDAGOGY-01
grill_counter: 5_of_10
pending_approved_decisions: 5
current_gpt_focus: 3X3_CIRCUIT_AND_FOCUS_SCRIBE_MOBILE_WIREFRAME
product_project_godot: NOT_CREATED
product_code: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 역할 분리

```text
GPT
→ 핵심 재미·콘텐츠·대사·UX·이미지·아트 설계
→ 적대적 검토와 GitHub·Sheet 정본 동기화

Codex
→ 승인된 명세의 Godot 구현
→ project.godot·GDScript·Scene·테스트·CI·Runtime·실기기 검증
```

현재는 제품 구현을 시작하지 않는다.

## 복원 순서

1. `START_HERE.md`
2. 이 문서
3. `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
4. `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`
5. `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
6. `docs/planning/STOCK_SYSTEM.md`
7. `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md`
8. `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
9. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
10. `docs/planning/sync/GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS.md`

## 승인된 플레이어 약속

> 상황을 읽고 해결 의도를 선택한 뒤, 글자와 대상을 3×3 회로에 배치·연결해 주문을 만들고 결과와 대가를 책임진다.

```text
상황·환경·인물 조사
→ 해결 의도·우선순위 선택
→ 사용 가능한 글자·대상 키워드 확인
→ 3×3 노드 배치·연결
→ 예상 효과·위험 확인
→ Commit
→ 세계 변화
→ 복기·마도서 기록
```

## 3×3 회로 계약

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
글자 노드 + 대상 키워드 노드 + 셀 위치 + 방향성 연결
= 회로
= 주문 설계
```

- 대상 키워드는 사건 조사 결과 또는 현재 전투 참가자·지형·장치에서 동적으로 제공한다.
- 메인 글자는 어느 칸에든 배치할 수 있다.
- 셀 거리에는 숨은 위력·마나 보너스가 없다.
- 주문명은 구성 글자의 이름과 별개다.

예:

```text
열 + 폭발 + 투사·충돌 배치
→ 파이어볼
```

## 전투 대상 문법

```text
보호 → 집중 → 아군 A
= 단일 대상 강보호

보호 → 분산
          ├→ 아군 A
          └→ 아군 B
= 다중 대상 분산 보호
```

- 집중은 출력과 범위를 한곳에 모으고 대상 선택 상한을 1로 제한한다.
- 분산은 다중 대상 또는 넓은 구역을 허용하며 개별 출력이 나뉜다.
- 보조 없이 다중 대상에 분기하면 불완전·불안정 경고다.

## 글자 Stock 계약

```yaml
stock_scope: TYPED_GLYPH_ONLY
stock_unit: ONE_GLYPH_NODE_PLACEMENT
shared_capacity: 8_TEST_VALUE
natural_charge_target_count: 1
one_glyph_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
completed_spell_stock: false
target_node_stock_cost: 0
connection_edge_stock_cost: 0
```

- Stock은 특정 글자 하나의 직접 그리기를 대체한다.
- 글자 노드 배치 시 예약하고 Commit 성공 때 주문 마나와 함께 소비한다.
- 대상 노드와 연결선은 Stock을 소비하지 않는다.
- 완성 주문 Stock은 3×3 조합을 우회하므로 폐기했다.
- 자연충전은 한 번에 특정 글자 1종만 진행하며 글자별 진행도를 보존한다.
- 소환수 `[스톡]`은 현재 글자의 남은 충전시간을 정수 초 단축한다.

## 집중 필사 계약

```yaml
state: FOCUS_SCRIBE
role: OPTIONAL_TYPED_GLYPH_STOCK_REPLENISHMENT
active_pressure_scale: 0.25_TEST_VALUE
full_pause: false
mana_drain_per_real_second: 1_TEST_VALUE
successful_recognition_gain: SAME_GLYPH_STOCK_PLUS_1
```

절차:

```text
필사할 학습·숙련 글자 선택
→ [집중 필사] 진입
→ Active Pressure와 적·환경이 느리게 계속 진행
→ 실제 시간 기준 마나 소모
→ 글자 작성·인식 성공
→ 같은 글자 Stock +1
```

가드:

- 자연충전·소환수 주기는 Active Pressure 기준이라 집중 중 실제 시간으로 가속되지 않는다.
- 직접 피해로 실제 HP가 감소하면 필사가 중단되고 미완성 획을 폐기한다.
- 피해 0의 완전 방어는 Prototype에서 필사를 끊지 않는다.
- 필사 실패·취소·마나 0에는 Stock을 얻지 못한다.
- 그리기 품질에 따른 위력·Stock 추가 보너스는 없다.
- 자연충전만으로 기본 전투가 가능해야 한다.

## Vertical Slice 글자 문법

```yaml
main_glyph: HEAT
connection_grammar: FLOW
optional_support_glyphs: [FOCUS, DISPERSE]
representative_known_circuit: HEAT_PLUS_FLOW
```

이 계약은 과거 `FLOW main` 계약을 대체한다.

- `열`: 열을 만들거나 기존 열원을 중심 현상으로 지정.
- `흐름`: 대상·경로·순서·순환 구성.
- `집중·분산`: 출력과 범위 조정.

## 대표 사건 — 서리꽃 온실의 심장

```yaml
persistent_cast:
  - 에일린_로스베르_교수
  - 카시안_렌_동급생
  - 모트_동반정령
upperclass_present: false
```

카시안은 닫힌 회수 밸브와 압력을 확인하지 않고 `열 + 흐름`을 사용해 배관 균열과 냉기 누출을 일으킨다. 입력·문법은 맞지만 상황·경로·출구 판단에 실패한 사례다.

교수는 외부 확산만 고유 주문으로 막는다. 교수의 방식은 하나의 유효 예시이며 정답·필수·최적·평가기준이 아니다. 플레이어는 3×3 회로로 시설 복구·생존 확보·정령 안정화·봉쇄·제압 또는 다른 합리적 해결을 설계한다.

## 조사형 키워드 확인

```text
시작 문양 조사 → [확인한 키워드: 열]
이동 선 조사 → [확인한 키워드: 흐름]
모서리 문양 조사 → 미학습 고급 구조 / 해독 불가
```

자동 글자 판독 오버레이를 사용하지 않는다. 관찰 결과는 감각과 실제 변화만 표시한다.

## 학교 위기 교육 원칙

```yaml
L0: 정상 시행착오·비치명적 손실 관찰
L1: 놓친 조건을 좁히는 방향 제시
L2: 돌이킬 수 없는 위험 직전 안전 경고
L3: 생명 위험만 직접 차단·구조
```

교수는 핵심 목표를 대신 해결하지 않는다. 철수·봉쇄·지원 요청은 자동 실패가 아니다.

## 복수 해결 계약

```yaml
approaches: 5
solution_patterns_per_approach: 4
total_reference_patterns: 20
explicit_answer_menu: false
reasonable_unlisted_solution: ALLOWED_BY_MEANING_AND_SITUATION_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

## 보호 경계

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

## 다음 우선순위

1. 3×3 회로판 Mobile Landscape Wireframe.
2. 집중 필사 캔버스·감속·마나 UX.
3. 서리꽃 온실 사건 UX Map에 새 회로 적용.
4. 온실·교수 주문·서리 정령 Art Direction.
5. 선택 범위의 Codex 구현 명세.

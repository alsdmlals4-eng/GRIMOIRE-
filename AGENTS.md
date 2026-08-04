# GRIMOIRE 작업 규칙 — 최상위 권위

## 프로젝트 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/foundation-poc-readiness-review
working_pull_request: 57
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_sync: GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS
current_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 5_of_10
pending_decisions: 5
merge_authorization: USER_EXPLICIT_EARLY_FLUSH_AT_5_OF_10
product_project: NOT_CREATED
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

## 권위 우선순위

1. 사용자의 최신 명시 결정.
2. 이 파일.
3. `START_HERE.md`.
4. `docs/ACTIVE_CONTEXT.md`.
5. `docs/DEVELOPMENT_GATES.md`.
6. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`.
7. 최신 승인 Decision 책임 원본.
8. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
9. 실제 제품 코드·테스트·Runtime 증거.
10. Base pin·공유 Skill 계약.
11. 과거 Draft·Working·Sync·대화·추정.

구형 파일은 상태 색인에서 `[대체됨]·[부분 대체됨]·[보류]·[구현완료 보관]·[폐기]·[이력]`으로 분류한다. 분류되지 않은 과거 파일을 현재 정본으로 사용하지 않는다.

## 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/DEVELOPMENT_GATES.md
→ docs/planning/CANON_STATUS_INDEX_2026-08-04.md
→ docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md
→ docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md
→ docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md
→ docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md
→ docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md
→ docs/planning/GRILL_ME_BATCH_MERGE_STATE.json
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

`skills/PROJECT_BASE_ADAPTER.json`에서는 Base pin·routing·protected paths·generator 계약만 현재 권위다. `current_state`, `gdd_sheet`, 과거 branch·sync Snapshot은 상태 색인에 따라 비권위다. 생성 View는 직접 편집하지 않는다.

## 역할 분리

```text
GPT
→ 핵심 재미·콘텐츠·대사·UX·이미지·아트 설계
→ 적대적 검토와 GitHub·Sheet 정본 동기화
→ 선택된 범위의 Codex 명세 준비

Codex
→ 승인된 범위의 Godot 제품 구현
→ GDScript·Scene·Resource·테스트·CI·실기기 검증
```

현재 제품 구현은 `[보류]`다. 3×3 Mobile Wireframe과 Frostbloom UX·Art 범위가 준비된 뒤 Codex로 전환한다.

## 필수 작업 루프

```text
현재 정본·실제 상태 조회
→ 사용자 의도 정의
→ 대안 비교·벤치마킹
→ 중립 권장안
→ 승인 또는 위임 확인
→ 같은 Decision ID로 GitHub·Sheet 반영
→ 적대적 검토
→ 구형 문서 상태 분류
→ UTF-8·NFC·Text Integrity
→ 최신 HEAD CI·Review·Sheet Readback
→ 승인된 경우 병합
→ main finalization·readback
```

사용자 의견에 자동 동의하지 않는다. 권장안에도 반대 질문과 악용 가능성을 적용한다.

## 프로젝트 코어

> 마법학교 학생이 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임져 마도서에 기록하는 마법 RPG.

```text
조사
→ 의도·우선순위 선택
→ 3×3 회로 설계
→ Preview
→ Commit
→ 세계 변화
→ 결과·대가·발견 복기
```

전투는 동일 문법을 사용하는 여러 해결 방식 중 하나이며 항상 필수는 아니다.

## 3×3 주문 회로

책임 원본:

- `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`

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
글자 노드 + 대상 노드 + 셀 위치 + 방향성 인접 연결
= 회로

유효 회로 Commit
= 주문
```

주문명은 글자 이름과 별개다. 등록 주문 설계도는 반투명 참고 회로일 뿐 자동 대상·자동 Stock 예약·자동 Commit을 하지 않는다.

## Vertical Slice 글자

```yaml
main_glyph: HEAT
connection_support: FLOW
optional_modifiers: [FOCUS, DISPERSE]
```

- `열`: 중심 현상 또는 기존 열원 지정.
- `흐름`: 대상·경로·순서 구성.
- `집중`: 단일 대상·좁은 범위에 출력 집중.
- `분산`: 여러 대상·넓은 구역에 출력 분배.

## 대상 제공

- 보이고 식별된 전투 참가자는 자동 목록.
- 환경·장치·숨은 부품은 관찰·조사 후 목록.
- 핵심 생명 안전 대상은 복수 경로로 확인 가능.
- UI는 대상을 임의 생성하거나 정답 대상을 추천하지 않는다.

## 글자 Stock

```yaml
stock_scope: TYPED_GLYPH_ONLY
shared_capacity: 8_TEST_VALUE
natural_charge_target_count: 1
one_glyph_charge_seconds: 10_TEST_VALUE
minimum_actual_charge_seconds: 3_TEST_VALUE
target_or_edge_cost: 0
completed_spell_stock: prohibited
```

글자 노드 배치 시 같은 글자 Stock을 예약하고 Commit 성공 때 주문 마나·결과와 원자 소비한다. 취소·실패 시 소비하지 않는다.

## 집중 필사

```yaml
state: STATE_FOCUS_SCRIBE
player_label: 집중_필사
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
success: SAME_GLYPH_STOCK_PLUS_1
capacity_reservation_on_entry: 1
full_pause: false
```

- 진입 시 용량 1칸을 예약해 자연충전 경합을 막는다.
- 적·환경은 느린 Active Pressure로 계속 진행한다.
- 자연충전·소환수 주기는 Active Pressure 기준이다.
- 직접 HP 피해·마나 0·제어 상태·Focus loss에서 중단한다.
- 그림 정확도는 위력·효율·지급량 보너스를 주지 않는다.
- 자연충전만으로 기본 전투가 가능해야 한다.

## Frostbloom 사건

- 에일린 로스베르 교수.
- 카시안 렌.
- 동반 정령 모트.
- 상급생 없음.

교수는 외부 확산만 막는 하나의 주문 예시를 보여준다. 교수 회로는 정답·필수 루트·최적해·채점키가 아니다. 플레이어는 시설 복구·구조·정령 안정화·봉쇄·제압 또는 합리적 미등록 해결을 선택할 수 있다.

선택지는 의도만 확인하며 주문을 자동 선택하지 않는다. 조사·관찰은 감각과 실제 상태 변화만 보여주고 원리·정답·성공률·결말을 설명하지 않는다.

## Preview

```yaml
fields:
  - primary_effect
  - speed
  - scope
  - pressure_change
  - likely_benefit
  - main_risk
  - unresolved_problem
  - confidence
confidence: [정보_충분, 정보_부분, 정보_부족]
```

숫자 성공 확률과 결말 미리보기는 금지한다.

## 교육 개입

```yaml
L0: 정상 시행착오 관찰
L1: 놓친 조건을 좁히는 방향 제시
L2: 돌이킬 수 없는 위험 전 안전 경고
L3: 즉각적 생명 위험만 직접 구조
```

교수는 핵심 목표를 대신 해결하지 않는다. 철수·봉쇄·지원 요청은 자동 실패가 아니다.

## 보호 경계

```text
완성 주문 원터치 Stock = 금지
집중 필사 완전 Pause = 금지
그림 위력 보너스 = 금지
기본 전투 필사 강제 = 금지
범용 Stock 변환 = 금지
대상·연결선 Stock 비용 = 금지
교수 예시 정답·채점키 = 금지
설계도 자동 대상·자동 Commit = 금지
숨은 셀 위치 보너스 = 금지
성공 확률 숫자 Preview = 금지
제품 구현 없이 Runtime PASS 주장 = 금지
```

## 병합 규칙

사용자가 `5/10`에서 조기 Batch flush와 PR #57 병합을 명시적으로 승인했다. 최신 HEAD의 계획 CI·Base Adapter CI·Godot Toolchain CI가 성공하고 Review Thread가 0이며 Sheet Readback이 일치하면 병합한다. 병합 후 별도 finalization PR에서 Batch를 `0/10`으로 초기화하고 main 권위·Sheet 상태를 확정한다.

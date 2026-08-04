# GRIMOIRE Active Context

## 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/foundation-poc-readiness-review
pull_request: 57
platform: MOBILE_LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_sync: GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS
current_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
slice_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
situation_decision: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
pedagogy_decision: GM-SCHOOL-CRISIS-PEDAGOGY-01
grill_counter: 5_of_10
pending_decisions: 5
merge_authorized: true
merge_trigger: USER_EXPLICIT_EARLY_FLUSH_AT_5_OF_10
product_project: NOT_CREATED
product_code: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 현재 정본

```text
AGENTS.md
→ START_HERE.md
→ ACTIVE_CONTEXT.md
→ DEVELOPMENT_GATES.md
→ CANON_STATUS_INDEX_2026-08-04.md
→ 3×3 승인·Spec
→ Frostbloom 승인 문서
→ Batch 기계 권위
```

파일 상태는 `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`를 따른다. 과거 Draft·Working·Stage 0·FAIL_CLOSED 문서는 현재 상태 권위가 아니다.

## 플레이어 약속

> 상황을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 해결 의도를 구현하고 결과와 대가를 책임진다.

```text
조사
→ 의도·우선순위
→ 3×3 회로
→ Preview
→ Commit
→ 변화·대가
→ 마도서 복기
```

## 3×3 회로

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

위치는 연결 가능성과 분기 형태를 결정하고 숨은 수치 보너스는 없다.

## Slice 글자

```yaml
main: HEAT
connection_support: FLOW
modifiers: [FOCUS, DISPERSE]
```

- `열`: 중심 현상 또는 기존 열원.
- `흐름`: 대상·경로·순서.
- `집중`: 단일 대상·좁은 범위.
- `분산`: 여러 대상·넓은 구역.

## 대상

- 보이고 식별된 전투 참가자: 자동 후보.
- 환경·장치·숨은 약점: 관찰·조사 후 후보.
- 핵심 생명 안전 대상: 복수 경로로 확인.
- UI 자동 정답 대상 추천: 금지.

## 글자 Stock

```yaml
stock_scope: TYPED_GLYPH_ONLY
shared_capacity: 8_TEST_VALUE
natural_charge_target: ONE_TYPED_GLYPH
base_charge_seconds: 10_TEST_VALUE
minimum_actual_seconds: 3_TEST_VALUE
target_or_edge_cost: 0
completed_spell_stock: prohibited
```

글자 노드 배치 시 같은 글자 Stock을 예약하고 Commit 성공 때 마나·결과와 원자 소비한다.

## 집중 필사

```yaml
state: STATE_FOCUS_SCRIBE
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
success_gain: SAME_GLYPH_STOCK_PLUS_1
capacity_reservation: 1
full_pause: false
```

- 시작 시 용량 1칸 예약.
- 적·환경 계속 진행.
- 자연충전·소환수는 Active Pressure 기준.
- 직접 HP 피해·마나 0·제어 상태·Focus loss에서 중단.
- 그림 품질 위력 보너스 없음.
- 기본 전투에 필사 강제 없음.

## Frostbloom

```yaml
cast:
  - 에일린_로스베르
  - 카시안_렌
  - 모트
upperclass_present: false
```

카시안은 `열+흐름`의 입력과 문법은 맞았지만 닫힌 밸브·압력·출구 판단에 실패한다. 교수는 외부 확산만 막는 하나의 주문 예시를 보여주며 내부 핵심 목표를 대신 해결하지 않는다.

가능한 접근:

1. 시설 복구.
2. 생명 구조.
3. 정령 안정화.
4. 봉쇄·철수.
5. 제압·시간 확보.
6. 의미와 상황에 맞는 미등록 해결.

교수 방식과의 일치가 채점 기준이 아니다.

## Preview·관찰

- Preview는 효과·속도·범위·압력 변화·이익·위험·미해결 문제·정보 충분도를 보여준다.
- `confidence`는 `정보 충분/부분/부족`이며 숫자 성공률이 아니다.
- 조사·관찰은 원리·정답·추천 주문·결말을 설명하지 않는다.

## 현재 병합 상태

```text
정본 경화·상태 색인
→ Sheet 동기화
→ 최신 HEAD CI·Review 확인
→ PR #57 병합
→ finalization PR
→ Batch 0/10·main sync·Sheet readback
```

## 병합 후 우선순위

1. 3×3 Mobile Landscape Wireframe.
2. 집중 필사 Overlay.
3. Frostbloom UX Map.
4. Art Direction·Asset Brief.
5. 선택 범위 Codex 구현 계획.

## 보호 경계

```text
완성 주문 원터치 Stock 금지
집중 필사 완전 Pause 금지
그림 위력 보너스 금지
교수 예시 정답화 금지
설계도 자동 대상·자동 Commit 금지
숨은 셀 위치 보너스 금지
성공 확률 숫자 Preview 금지
제품 구현 전 Runtime PASS 주장 금지
```

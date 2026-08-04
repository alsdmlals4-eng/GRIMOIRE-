# GRIMOIRE 현재 확정 결정 스냅샷

## 상태

```yaml
status: ACTIVE_CANONICAL_DECISION_SNAPSHOT
updated_at: 2026-08-04T09:37+09:00
project: "GRIMOIRE: 세계를 다시 쓰는 법"
product_stage: DEMO_FIRST_VERTICAL_SLICE
platform: MOBILE_LANDSCAPE_FIXED
base_release: v9.4.3
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_branch: agent/foundation-poc-readiness-review
working_pull_request: 57
working_sync: GR-SYNC-20260804-09-3X3-CIRCUIT-STOCK-FOCUS
current_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 5_of_10
merge_trigger: USER_EXPLICIT_EARLY_FLUSH_AT_5_OF_10
implementation: NOT_STARTED
runtime_validation: NOT_RUN
```

세부 파일 상태는 `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`를 따른다.

## 프로젝트 코어

> 마법학교 학생이 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자·대상·회로로 의도를 구현하고 결과와 대가를 책임지는 마법 RPG.

```text
조사
→ 의도·우선순위 선택
→ 3×3 주문 회로
→ Preview
→ Commit
→ 세계 변화
→ 복기·발견
```

## 주문 문법

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

주문명은 글자 이름과 별개다. 설계도는 반투명 참고 회로이며 자동 대상·자동 Commit을 제공하지 않는다.

## Slice 글자

```yaml
main: 열
connection_support: 흐름
modifiers: [집중, 분산]
```

과거 `흐름 메인` 계약은 대체됐다.

## 대상

- 보이고 식별된 전투 참가자는 자동 후보.
- 환경·장치·숨은 약점은 관찰·조사 후 후보.
- 핵심 생명 안전 대상은 복수 경로로 확인.
- 대상 노드는 Slice에서 회로 끝점.

## 글자 Stock

```yaml
stock_scope: TYPED_GLYPH_ONLY
shared_capacity: 8_TEST_VALUE
natural_charge_target_count: 1
one_glyph_charge_seconds: 10_TEST_VALUE
minimum_actual_seconds: 3_TEST_VALUE
target_or_edge_cost: 0
completed_spell_stock: prohibited
```

Stock은 특정 글자 노드 1회의 반복 입력을 대체한다. Stock 주문도 Commit 시 동일한 주문 마나를 사용한다.

## 집중 필사

```yaml
state: STATE_FOCUS_SCRIBE
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
success_gain: SAME_GLYPH_STOCK_PLUS_1
capacity_reservation: 1
full_pause: false
```

집중 필사는 선택적 Stock 보충 기능이다. 그림 품질에 위력 보너스가 없으며 자연충전만으로 기본 전투가 가능해야 한다.

## Frostbloom 사건

등장 인물:

- 에일린 로스베르 교수.
- 카시안 렌.
- 모트.

교수는 외부 확산만 막는 하나의 주문 예시를 보여준다. 교수 방식은 정답·필수 루트·채점키가 아니다.

대표 접근:

1. 시설 복구.
2. 카시안·묘목 구조.
3. 정령 안정화.
4. 봉쇄·철수.
5. 제압·시간 확보.
6. 합리적 미등록 해결.

선택지는 의도를 정하고 주문은 플레이어가 회로로 구현한다.

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
L1: 놓친 조건 방향 제시
L2: 돌이킬 수 없는 위험 전 경고
L3: 즉각적 생명 위험만 직접 구조
```

## 현재 구현·검증

- Godot 개발환경 설치·CI probe: 성공 증거 존재.
- 제품 `project.godot`: 없음.
- 제품 코드: 미착수.
- Runtime·모바일·성능·접근성·사람 검증: 미실행.
- `0.25배`, `마나 1/초`, 용량 `8`, 충전 `10초`: TEST 값.

## 현재 병합

사용자가 승인 Decision 5개를 조기 Batch flush하여 PR #57을 병합하도록 명시적으로 승인했다. 최신 HEAD CI, Review Thread 0, Sheet Readback 일치 후 병합하고 별도 finalization PR에서 Batch를 0/10으로 초기화한다.

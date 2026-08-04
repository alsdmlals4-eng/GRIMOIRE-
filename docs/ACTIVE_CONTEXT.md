# GRIMOIRE Active Context

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
finalization_pull_request: 58
platform: MOBILE_LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: 839129524ba14279141add809fb400383949d5ea
current_main_sync: GR-SYNC-20260804-10-MAIN
latest_decision: GM-3X3-CIRCUIT-STOCK-FOCUS-01
grill_counter: 0_of_10
pending_decisions: 0
product_project: NOT_CREATED
product_code: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

PR #57에서 누적 Decision 5개를 main에 병합했고 새 Grill Batch가 시작됐다. PR #58은 finalization 중이다.

## 정본 복원

```text
AGENTS.md
→ START_HERE.md
→ ACTIVE_CONTEXT.md
→ DEVELOPMENT_GATES.md
→ CANON_STATUS_INDEX
→ CURRENT_CONFIRMED_DECISIONS
→ 3×3 승인·Spec
→ Frostbloom 승인
→ Batch
```

## 플레이어 약속

> 상황을 읽고 무엇을 지킬지 선택한 뒤, 글자·대상·회로로 해결 의도를 구현하고 결과와 대가를 책임진다.

```text
조사 → 의도 → 3×3 회로 → Preview → Commit → 변화·대가 → 마도서 복기
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

Slice는 `열` 메인, `흐름` 연결 보조, `집중·분산` 수정 보조를 사용한다.

## 대상

- 보이고 식별된 전투 참가자는 자동 후보.
- 환경·장치·숨은 약점은 관찰·조사 후 후보.
- 핵심 생명 안전 대상은 복수 경로로 확인.
- 정답 대상 자동 추천 금지.

## Stock·마나

```yaml
stock_scope: TYPED_GLYPH_ONLY
shared_capacity: 8_TEST_VALUE
natural_charge_target: ONE_TYPED_GLYPH
base_charge_seconds: 10_TEST_VALUE
minimum_actual_seconds: 3_TEST_VALUE
target_or_edge_cost: 0
completed_spell_stock: prohibited
spell_commit_uses_mana: true
```

글자 노드 배치 시 같은 글자 Stock을 예약하고 Commit 성공 때 Stock·마나·결과를 원자 처리한다.

## 집중 필사

```yaml
state: STATE_FOCUS_SCRIBE
active_pressure_scale: 0.25_TEST_VALUE
mana_drain_per_real_second: 1_TEST_VALUE
success_gain: SAME_GLYPH_STOCK_PLUS_1
capacity_reservation: 1
full_pause: false
```

적·환경은 계속 진행한다. 자연충전·소환수 주기는 Active Pressure 기준이다. 직접 HP 피해·마나 0·제어 상태·Focus loss에서 중단한다. 그림 품질은 위력 보너스를 주지 않는다.

## Frostbloom

등장: 에일린 교수, 카시안, 모트. 교수는 외부 확산만 막는 하나의 주문 예시를 보여주며 내부 문제를 대신 해결하지 않는다.

가능한 접근:

1. 시설 복구.
2. 생명 구조.
3. 정령 안정화.
4. 봉쇄·철수.
5. 제압·시간 확보.
6. 합리적 미등록 해결.

## 다음 우선순위

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
숫자 성공률 Preview 금지
제품 구현 전 Runtime PASS 주장 금지
```

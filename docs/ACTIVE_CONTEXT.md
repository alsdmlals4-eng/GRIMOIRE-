# GRIMOIRE Active Context

## 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
sheet_readback_pull_request: 59
platform: MOBILE_LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: 39da99fbc56ccdf90904b24b5725cb0d0779595a
current_main_sync: GR-SYNC-20260804-11-MAIN-READBACK
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

## 정본

```text
AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES
→ CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS
→ 3×3 승인·Spec → Frostbloom 승인 → Batch → Sync 11
```

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

Slice는 `열` 메인, `흐름` 연결 보조, `집중·분산` 보조를 사용한다. 보이고 식별된 전투 참가자는 자동 대상이며 환경·장치·숨은 약점은 조사 후 열린다.

## Stock·마나·필사

```yaml
stock: TYPED_GLYPH_ONLY
capacity: 8_TEST_VALUE
natural_charge: ONE_TYPED_GLYPH_10_SECONDS_TEST
minimum_charge: 3_SECONDS_TEST
completed_spell_stock: prohibited
spell_commit_uses_mana: true
focus_time_scale: 0.25_TEST_VALUE
focus_mana: 1_PER_REAL_SECOND_TEST_VALUE
focus_gain: SAME_GLYPH_STOCK_PLUS_1
focus_capacity_reservation: 1
```

글자 노드 배치 시 Stock을 예약하고 Commit 성공 때 Stock·마나·결과를 원자 처리한다. 필사는 선택적 보충 기능이며 기본 전투 필수가 아니다.

## Frostbloom

등장: 에일린 교수, 카시안, 모트. 교수는 외부 확산만 막는 한 가지 주문 예시를 보여주며 내부 목표를 대신 해결하지 않는다. 교수 방식과의 일치는 채점 기준이 아니다.

가능한 접근: 시설 복구, 생명 구조, 정령 안정화, 봉쇄·철수, 제압·시간 확보, 합리적 미등록 해결.

## 다음 우선순위

1. 3×3 Mobile Landscape Wireframe.
2. 집중 필사 Overlay.
3. Frostbloom UX Map.
4. Art Direction·Asset Brief.
5. 선택 범위 Codex 구현 계획.

## 금지

```text
완성 주문 원터치 Stock
Stock 주문 무마나 실행
집중 필사 완전 Pause
그림 위력 보너스
설계도 자동 대상·자동 Commit
교수 예시 정답화
숫자 성공률 Preview
검증 없는 Runtime PASS
```

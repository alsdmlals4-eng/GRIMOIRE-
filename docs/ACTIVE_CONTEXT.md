# GRIMOIRE Active Context

## 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
platform: MOBILE_LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: 6ee87a452ebb5793fb6739249287dfd537f4ee89
previous_main_sync: GR-SYNC-20260804-12-CLOSURE
current_main_sync: GR-SYNC-20260806-01
merged_pull_request: 68
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_MAIN
sheet_readback: PASS
product_project: NOT_CREATED
product_code: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 정본

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → 별형 회로 승인·Spec → 회로·마나·숙련 책임 원본 → GR-SYNC-20260806-01-MAIN`.

## 플레이어 약속

> 조사로 상황을 이해하고 의도를 정한 뒤, 글자·별형 회로·대상 키워드로 주문을 구현하고 결과와 대가를 책임진다.

```text
조사 → 의도 → 별형 글자 회로 → 회로 Preview → 대상 키워드 → 최종 Preview → Commit → 변화·대가 → 복기
```

## FIVE_POINT_STAR 회로

```yaml
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
target_nodes_inside_circuit: prohibited
numeric_success_preview: required
hidden_vertex_bonus: prohibited
```

외곽 슬롯은 초기 버전에서 동등하며 전부 채울 필요가 없다. 대상 키워드는 관찰·조사 후 열리고 UI는 정답 대상을 추천하지 않는다.

## 숙련도·성공률·마나

```yaml
glyph_mastery: 0_to_100
success_complexity: [0, -10, -20, -30, -40, -50]
mana_complexity: [0, +10%, +20%, +30%, +40%, +50%]
precision: MANA_PLUS_25_PERCENT_SUCCESS_PLUS_MASTERY_DIV_10_PP
reduction: MANA_MINUS_10_PLUS_MASTERY_DIV_10_PERCENT
first_year_target: ONE_AUX_STABLE_TWO_AUX_60_PERCENT_BOUNDARY
```

숙련도는 직접 그리기·의미 있는 사용·수업·연습·과제·연구로 쌓는다. 학년은 직접 성공률 보너스가 아니라 상위 수업과 숙련도 상한을 제공한다.

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
```

직접 작성과 Stock은 같은 주문 의미·마나·성공 공식을 사용한다. 필사는 선택적 Stock 보충 기능이며 기본 전투 필수가 아니다.

## Frostbloom

등장: 에일린 교수, 카시안, 모트. 교수는 하나의 주문 예시만 보여주며 내부 목표를 대신 해결하지 않는다. 교수 방식과의 일치는 채점 기준이 아니다.

가능한 접근: 시설 복구, 생명 구조, 정령 안정화, 봉쇄·철수, 제압·시간 확보, 합리적 미등록 해결.

## 다음 우선순위

1. 별형 회로 Mobile Landscape Wireframe.
2. 부분 성공·실패·역류 세부 계약.
3. 집중 필사 Overlay.
4. Frostbloom UX Map.
5. 제품 프로젝트 생성 후 Codex 구현 계획.

## 금지

3×3 회로를 활성 문법으로 사용, 회로 내부 대상 노드, 숨은 별 위치 보너스, 완성 주문 원터치 Stock, Stock 주문 무마나 실행, 학년 직접 성공률 보너스, 그림 위력 보너스, 설계도 자동 대상·자동 Commit, 검증 없는 Runtime PASS.

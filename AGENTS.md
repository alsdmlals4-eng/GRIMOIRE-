# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/star-circuit-runtime-godot-poc
working_pull_request: 69
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: 2012a9f4c2da09a1defec07f8d8f7a0d3c867d93
previous_main_sync: GR-SYNC-20260806-01-MAIN
current_working_sync: GR-SYNC-20260806-02-STAR-RUNTIME-POC
latest_approved_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_WORKING_BRANCH_MERGE_AUTHORIZED
product_project: CREATED
product_implementation: RUNTIME_POC_IMPLEMENTED_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
```

## 권위·복원 순서

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → 별형 회로 승인·Spec → 회로·마나·숙련 책임 원본 → GR-SYNC-20260806-01-MAIN → GR-SYNC-20260806-02-STAR-RUNTIME-POC → 실제 코드·테스트`.

과거 3×3 문서는 이력으로만 보존한다. 활성 Runtime에서 3×3 위상·회로 내부 대상·보조 2개 상한·숫자 성공률 금지를 복원하지 않는다.

## 프로젝트 코어

> 상황과 위험을 읽고 무엇을 지킬지 선택한 뒤, 글자·별형 회로·대상 키워드로 의도를 구현하고 결과와 대가를 책임지는 마법학교 RPG.

```text
조사 → 의도 → FIVE_POINT_STAR 회로 → 회로 Preview → 대상 키워드 → 최종 Preview → Commit → 세계 변화 → 복기
```

## 승인 Runtime 계약

```yaml
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_equivalent_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
target_nodes_inside_circuit: prohibited
numeric_success_preview: required
hidden_vertex_bonus: prohibited
slot_order_effect: false
success_complexity: [0, -10, -20, -30, -40, -50]
mana_complexity: [0, +10%, +20%, +30%, +40%, +50%]
final_success_clamp: 5_to_98_percent
precision: MANA_PLUS_25_PERCENT_SUCCESS_PLUS_MASTERY_DIV_10_PP
reduction: MANA_MINUS_10_PLUS_MASTERY_DIV_10_PERCENT_SUCCESS_PLUS_0_PP
```

회로 숙련도는 보조가 있을 때 `메인×0.45 + 보조평균×0.35 + 최저보조×0.20`, 없을 때 메인 숙련도다. 성공률 보정은 `clamp((숙련도-50)×0.5,-25,+25)%p`이며 최종 마나는 메인 기본 마나보다 낮아질 수 없다.

## 구현 증거

- `project.godot` — Godot 4.7.1, Mobile Landscape, 별형 Harness main scene.
- `src/core/star/` — Validator·Calculator·State·Atomic Coordinator.
- `src/ui/star_circuit_harness.*` — 중앙·외곽5·두 Preview·Target·Commit Low-fi Scene.
- `src/core/resources/`, `src/core/spells/` — Vault·Stock·Mana·Exactly-once Commit.
- `src/input/` — 정확히 6개 Runtime 글자 인식 기반.
- `tests/test_runner.gd` — 26 Suites.
- `tools/run_star_runtime.py` — 로컬 설치·Headless·Editor 실행기.

TDD 증거: RED `c5b8c0b5 / 31049468374`, 강화 RED `7ef9f58a / 31050745948`, Runtime GREEN `c6dfc7d1 / 31050121154`에서 26 Suites·1,010 assertions·0 failures.

## 금지

3×3 활성 Runtime, 회로 내부 Target, 자동 Target·자동 Commit, Best route, 숨은 Vertex 보너스, 완성 주문 Stock, Stock 무마나 주문, 그림 위력 보너스, 학년 직접 성공률 보너스, 중복 소비, Cancel 소비, 자동 테스트를 사람·출시 PASS로 주장하는 행위.

## 다음 우선순위

1. PR #69 exact-head CI·리뷰 후 병합과 main 재검증.
2. 물리 기기 Narrow/Tall Landscape·Touch·Stylus·Text130%·A11y 검증.
3. 부분 성공·실패·역류 세부 계약.
4. Frostbloom 실제 결과 Pipeline·UX Map.
5. 사람 핵심 재미 검증.

출시·외부 자산 작업은 `PLATFORM_RELEASE_AND_ASSET_RIGHTS_PROFILE.md`, `ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`, `GAME_RELEASE_COMPLIANCE_EVIDENCE_PACK.md`를 따른다. 실기기·사람·스토어 증거가 없으면 출시 완료를 주장하지 않는다.

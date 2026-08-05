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
current_working_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
latest_approved_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_WORKING_BRANCH_MERGE_AUTHORIZED
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
numeric_status: PLAYTEST_TUNING_REQUIRED
```

## 권위·복원 순서

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → 별형 회로 승인·Spec → Wireframe·Resolution·Focus·Frostbloom 승인 → 회로·마나·숙련·Stock 책임 원본 → Sync01 Main → Sync03 → 실제 코드·테스트`.

과거 3×3 회로는 역사로만 보존한다. 활성 Runtime에서 3×3 위상·회로 내부 Target·Edge 퍼즐·보조 2개 상한·숫자 성공률 금지를 복원하지 않는다.

## 프로젝트 코어

> 상황과 위험을 조사하고 무엇을 지킬지 선택한 뒤, 배운 글자와 별형 회로로 주문을 설계하고 비용·성공 가능성·위험을 이해한 상태에서 Commit하여 결과와 대가를 책임진다.

```text
조사 → 의도 → FIVE_POINT_STAR 회로 → 회로 Preview → 대상 키워드 → 최종 성공률·마나·위험 Preview → 명시 Commit → 결과·대가 → 복기
```

## 승인 회로·밸런스

```yaml
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_equivalent_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
target_nodes_inside_circuit: prohibited
numeric_success_preview: required
hidden_vertex_bonus: prohibited
success_complexity: [0, -10, -20, -30, -40, -50]
mana_complexity: [0, +10%, +20%, +30%, +40%, +50%]
final_success_clamp: 5_to_98_percent
precision: MANA_PLUS_25_PERCENT_SUCCESS_PLUS_MASTERY_DIV_10_PP
reduction: MANA_MINUS_10_PLUS_MASTERY_DIV_10_PERCENT_SUCCESS_PLUS_0_PP
```

## 실제 구현

- `src/core/star/` — Validator·Calculator·State·Atomic Coordinator·Spell Resolution Policy.
- `src/core/resources/typed_glyph_stock_pool.gd` — 같은 glyph_id만 대체하는 Typed Stock과 공유 용량.
- `src/core/resources/focus_scribing_session.gd` — 0.25 Active Pressure, 실제 시간 Mana, 같은 glyph_id Stock +1, 취소 무환불.
- `src/ui/star_circuit_harness.*` — 중앙·외곽5·숙련도·Breakdown·경고·Target·Final Preview·Commit Low-fi Scene.
- `src/ui/focus_scribing_overlay.*` — 선택 글자·남은 시간·Mana 속도·중단 위험·용량·무환불 표시.
- `data/testing/frostbloom_star_ux_map.json` — 여섯 해결 의도, Best route·교수 정답화·자동 Target/Commit 금지.
- `src/input/` — 정확히 6개 Runtime 글자 인식 기반.
- `tools/run_star_runtime.py` — Godot 4.7.1 설치·검증, Headless Test, Editor, Main Scene Run.

## TDD·검증 증거

```yaml
completion_red_run: 31052151348
implementation_green_head: f3187672bc18c989052d9e3f84a5306a272d9083
star_runtime_run: 31053300711
planning_base_adversarial_run: 31053301043
godot_toolchain_run: 31053300879
platform_rights_run: 31053300688
godot_suites: 31
assertions: 1137
failures: 0
sheet_readback: PASS
```

## 금지

3×3 활성 Runtime, 회로 내부 Target, 범용 Stock의 임의 glyph 대체, 자동 Target·자동 Commit, Best route, 숨은 Vertex 보너스, 완성 주문 Stock, Stock 무마나 주문, 그림 위력 보너스, 학년 직접 성공률 보너스, 중복 소비, Commit 전 소비, 실패 원인 은폐, 자동 테스트를 기기·사람·출시 PASS로 주장하는 행위.

## 다음 Gate

1. PR #69 exact-head 검증·리뷰·병합과 main 재검증.
2. 실제 Android/iOS Narrow/Tall Landscape·Touch·Stylus·Text130%·Screen Reader·성능 검증.
3. 사람 핵심 재미·실패 공정성·Frostbloom 다중 해결 이해도 검증.
4. Full Vertical Slice 결과 Pipeline·콘텐츠 확장.

출시·외부 자산 작업은 `docs/PLATFORM_RELEASE_AND_ASSET_RIGHTS_PROFILE.md`, `docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`, `docs/GAME_RELEASE_COMPLIANCE_EVIDENCE_PACK.md`를 따른다. 실기기·사람·스토어 증거가 없으면 출시 완료를 주장하지 않는다.

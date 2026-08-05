# GRIMOIRE 작업 규칙 — 최상위 권위

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
current_branch: main
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
current_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
latest_approved_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_MAIN
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

## 권위 순서

`사용자의 최신 명시 결정 → AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → 별형 승인·Spec → Wireframe·Resolution·Focus·Frostbloom 승인 → 회로·Mana·숙련·Stock 책임 원본 → Main Sync03 → 실제 코드·테스트`.

## 프로젝트 코어

> 상황을 조사하고 해결 의도를 정한 뒤, 배운 글자와 별형 회로로 주문을 설계하고 비용·성공 가능성·위험을 확인하여 스스로 Commit하고 결과와 대가를 복기한다.

```text
조사 → 의도 → FIVE_POINT_STAR 회로 → 회로 Preview → 대상 키워드 → 최종 성공률·마나·위험 Preview → 명시 Commit → 결과·대가 → 복기
```

## 활성 계약

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
stock_scope: TYPED_GLYPH_ONLY
```

## 구현

- `src/core/star/` — Validator·Calculator·State·Atomic Coordinator·Resolution Policy.
- `src/core/resources/typed_glyph_stock_pool.gd` — 같은 glyph_id만 대체하는 Typed Stock.
- `src/core/resources/focus_scribing_session.gd` — 0.25 Active Pressure, 실제 시간 Mana, 같은 glyph Stock +1, 취소 무환불.
- `src/ui/star_circuit_harness.*` — Mobile Landscape Low-fi Harness.
- `src/ui/focus_scribing_overlay.*` — 집중 필사 Overlay.
- `data/testing/frostbloom_star_ux_map.json` — 여섯 해결 의도와 자동 추천 금지.
- `src/input/` — 정확히 6개 Runtime 글자 인식.
- `tools/run_star_runtime.py` — Godot Test·Run·Editor.

## 검증

```yaml
pr: 69
runtime_main_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
pr_exact_head: c68a553d77d6d7e0cc6f92f4c318f00c267db6c5
pr_star_runtime_run: 31054934827
pr_planning_base_adversarial_run: 31054934887
pr_godot_toolchain_run: 31054934882
pr_platform_rights_run: 31054934838
main_star_runtime_run: 31055213468
main_platform_rights_run: 31055213609
godot_suites: 31
assertions: 1137
failures: 0
sheet_readback: PASS
```

## 금지

3×3 활성 Runtime, 회로 내부 Target, 범용 Stock의 임의 glyph 대체, 자동 Target·자동 Commit, Best route, 숨은 Vertex 보너스, 완성 주문 Stock, Stock 무마나 주문, 학년 직접 성공률 보너스, Commit 전 소비, 중복 소비, 실패 원인 은폐, 교수 회로 정답화, 자동 테스트를 기기·사람·출시 PASS로 주장하는 행위.

## 출시·권리

- `docs/PLATFORM_RELEASE_AND_ASSET_RIGHTS_PROFILE.md`
- `docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md`
- `docs/GAME_RELEASE_COMPLIANCE_EVIDENCE_PACK.md`

실제 Mobile Device·Performance·Screen Reader·Human·Full Slice 증거가 없으므로 출시 준비 완료는 주장하지 않는다.

# GRIMOIRE Documentation Map — Main

```yaml
main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
current_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_MAIN
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
```

## 시작 경로

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → DESIGN_DOCUMENT_REGISTRY → 최신 승인 원본 → Main Sync03 → Runtime·Tests`.

## 승인·책임 원본

- `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`
- `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/MANA_SYSTEM.md`
- `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`
- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/STOCK_CAPACITY_SYSTEM.md`
- `docs/planning/STAR_CIRCUIT_MOBILE_LANDSCAPE_WIREFRAME_01_APPROVAL_2026-08-06.md`
- `docs/planning/SPELL_RESOLUTION_PARTIAL_FAILURE_BACKLASH_01_APPROVAL_2026-08-06.md`
- `docs/planning/FOCUS_SCRIBING_OVERLAY_01_APPROVAL_2026-08-06.md`
- `docs/planning/FROSTBLOOM_STAR_CIRCUIT_UX_MAP_01_APPROVAL_2026-08-06.md`

## Runtime

- `project.godot`
- `src/core/star/`
- `src/core/resources/typed_glyph_stock_pool.gd`
- `src/core/resources/focus_scribing_session.gd`
- `src/ui/star_circuit_harness.*`
- `src/ui/focus_scribing_overlay.*`
- `data/testing/frostbloom_star_ux_map.json`
- `src/input/`
- `tests/test_runner.gd`
- `tests/test_star_runtime_implementation_contract.py`
- `tests/test_star_runtime_completion_contract.py`
- `.github/workflows/validate-star-runtime-poc.yml`
- `.github/workflows/validate-base-v9-adoption.yml`
- `tools/run_star_runtime.py`
- `docs/validation/GODOT_STAR_RUNTIME_TEST_GUIDE_2026-08-06.md`

## Sync

- `docs/planning/sync/GR-SYNC-20260806-01-MAIN.md` — 별형 설계 Main.
- `docs/planning/sync/GR-SYNC-20260806-02-STAR-RUNTIME-POC.md` — 초기 Runtime POC 이력.
- `docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION.md` — Working 이력.
- `docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN.md` — 현재 Main 권위.

## 역사

`GM-3X3-CIRCUIT-STOCK-FOCUS-01`은 부분 대체된 이력이다. Typed Stock·명시 Commit·모든 주문 Mana 원칙만 유지하며 3×3 위상·회로 내부 Target·Edge 문법·보조2 상한은 활성 근거가 아니다. `UniversalStockPool`은 과거 호환 POC이며 활성 별형 Commit은 Typed Stock을 사용한다.

## 검증 경계

자동 Runtime은 31 Suites·1,137 assertions·0 failures다. 실제 Mobile Device·Performance·Screen Reader·Human·Full Slice는 `NOT_RUN`이다.

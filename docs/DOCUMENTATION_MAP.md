# GRIMOIRE Documentation Map — Main + GR-TEST-033 Overlay

```yaml
main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
current_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
current_validation_sync: GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY
current_validation_gate: GR-TEST-033
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_MAIN
validation_status: EXECUTION_PACK_AUTOMATED_PASS_HUMAN_NOT_RUN
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
```

## 시작 경로

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → DESIGN_DOCUMENT_REGISTRY → 별형 Runtime 승인 원본 → Main Sync03 → GR-TEST-033 Design·Runbook·Preflight → Sync04 → Runtime·Tests·Raw Evidence`.

## Runtime 승인·책임 원본

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
- `tools/run_star_runtime.py`
- `.github/workflows/validate-star-runtime-poc.yml`

## GR-TEST-033 실행 패키지

- `docs/superpowers/specs/2026-08-06-star-circuit-physical-validation-design.md`
- `docs/superpowers/plans/2026-08-06-star-circuit-physical-validation-implementation-plan.md`
- `docs/validation/GR_TEST_033_STAR_PHYSICAL_RUNBOOK.md`
- `docs/validation/GR_TEST_033_MODERATOR_SCRIPT.md`
- `docs/validation/GR_TEST_033_DEVICE_PREFLIGHT.md`
- `docs/planning/GR_TEST_033_STAR_PHYSICAL_EXECUTION_READY_GATE_2026-08-06.md`
- `artifacts/human-validation/gr-test-033-session-template.json`
- `artifacts/human-validation/gr-test-033-attempt-schema.json`
- `artifacts/human-validation/gr-test-033-observation-schema.json`
- `artifacts/human-validation/gr-test-033-result-template.json`
- `tools/analyze_gr_test_033.py`
- `tests/test_gr_test_033_star_physical_contract.py`
- `.github/workflows/validate-star-physical-pack.yml`

## Sync

- `docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN.md` — Runtime Main 권위.
- `docs/planning/sync/GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY.md` — 실행 패키지 자동 PASS·Sheet Readback·실제 검증 NOT_RUN.

## 역사

`GM-3X3-CIRCUIT-STOCK-FOCUS-01`은 부분 대체된 이력이다. Typed Stock·명시 Commit·모든 주문 Mana 원칙만 유지하며 3×3 위상·회로 내부 Target·Edge 문법·보조2 상한은 활성 근거가 아니다. `UniversalStockPool`은 과거 호환 POC이며 활성 별형 Commit은 Typed Stock을 사용한다.

## 검증 경계

자동 Runtime은 31 Suites·1,137 assertions·0 failures이고 GR-TEST-033 실행 패키지 계약은 PASS다. 실제 Mobile Device·Performance·Screen Reader·Human·Full Slice는 `NOT_RUN`이다.

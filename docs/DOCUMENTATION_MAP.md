# GRIMOIRE Documentation Map — 현재 정본 경로

## 상태

```yaml
working_branch: agent/star-circuit-runtime-godot-poc
working_pull_request: 69
current_working_sync: GR-SYNC-20260806-02-STAR-RUNTIME-POC
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
product_project: CREATED
product_implementation: RUNTIME_POC_IMPLEMENTED_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 시작 경로

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → DESIGN_DOCUMENT_REGISTRY → 최신 승인 원본 → Sync02 → Runtime Code·Tests`.

## 정본·Sync

- `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`
- `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/MANA_SYSTEM.md`
- `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`
- `docs/planning/sync/GR-SYNC-20260806-02-STAR-RUNTIME-POC.md`
- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`

## Runtime

- `project.godot` — Star Harness Main Scene.
- `src/core/star/` — 회로 문법·계산·State·Atomic Coordinator.
- `src/ui/star_circuit_harness.*` — Low-fi Scene.
- `src/core/resources/`, `src/core/spells/` — Vault·Stock·Mana·Exactly-once.
- `src/input/` — 6글자 인식.
- `tests/test_runner.gd` — Godot 26 Suites.
- `tests/test_star_runtime_implementation_contract.py` — 기획→실제 코드 적대 계약.
- `.github/workflows/validate-star-runtime-poc.yml` — PR·main Push 검증.
- `tools/run_star_runtime.py` — 로컬 Headless·Editor 실행.
- `docs/validation/GODOT_STAR_RUNTIME_TEST_GUIDE_2026-08-06.md` — 사용자 테스트 절차.

## 역사 보존

`GM-3X3-CIRCUIT-STOCK-FOCUS-01` 문서는 `SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01` 이력이다. Typed Stock·명시 Commit·마나 원칙만 유지하며 3×3 위상·내부 Target·Edge 문법·보조2 상한은 활성 근거가 아니다.

## 검증 경계

자동 Runtime은 PASS다. 실제 Mobile Device·Performance·Accessibility·Human·Full Slice는 `NOT_RUN`; Prototype 수치는 `PLAYTEST_TUNING_REQUIRED`다.

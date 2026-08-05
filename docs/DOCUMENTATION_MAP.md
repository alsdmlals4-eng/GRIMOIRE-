# GRIMOIRE Documentation Map — 현재 정본 경로

## 상태

```yaml
working_branch: agent/star-circuit-runtime-godot-poc
working_pull_request: 69
current_working_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: NOT_RUN
```

## 시작 경로

`AGENTS → START_HERE → ACTIVE_CONTEXT → DEVELOPMENT_GATES → CANON_STATUS_INDEX → CURRENT_CONFIRMED_DECISIONS → DESIGN_DOCUMENT_REGISTRY → 최신 승인 원본 → Sync03 → Runtime Code·Tests`.

## 별형 회로 책임 원본

- `docs/planning/STAR_GLYPH_CIRCUIT_MASTERY_BALANCE_01_APPROVAL_2026-08-06.md`
- `docs/superpowers/specs/2026-08-06-star-glyph-circuit-mastery-balance-design.md`
- `docs/planning/MAGIC_LETTER_CIRCUIT_SYSTEM.md`
- `docs/planning/MANA_SYSTEM.md`
- `docs/planning/SUPPORT_LETTER_MASTERY_SYSTEM.md`
- `docs/planning/STOCK_SYSTEM.md`
- `docs/planning/STOCK_CAPACITY_SYSTEM.md`

## Runtime Completion 승인

- `docs/planning/STAR_CIRCUIT_MOBILE_LANDSCAPE_WIREFRAME_01_APPROVAL_2026-08-06.md`
- `docs/planning/SPELL_RESOLUTION_PARTIAL_FAILURE_BACKLASH_01_APPROVAL_2026-08-06.md`
- `docs/planning/FOCUS_SCRIBING_OVERLAY_01_APPROVAL_2026-08-06.md`
- `docs/planning/FROSTBLOOM_STAR_CIRCUIT_UX_MAP_01_APPROVAL_2026-08-06.md`
- `docs/superpowers/plans/2026-08-06-star-circuit-runtime-completion-plan.md`
- `docs/planning/sync/GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION.md`

## Runtime

- `project.godot` — Mobile Landscape Star Harness Main Scene.
- `src/core/star/` — 회로 문법·계산·State·Atomic Coordinator·Resolution Policy.
- `src/core/resources/typed_glyph_stock_pool.gd` — glyph_id별 Stock·공유 용량.
- `src/core/resources/focus_scribing_session.gd` — 필사 세션.
- `src/ui/star_circuit_harness.*` — Low-fi 회로·Preview·경고·접근성 Scene.
- `src/ui/focus_scribing_overlay.*` — 필사 Overlay.
- `data/testing/frostbloom_star_ux_map.json` — 다중 해결 Fixture.
- `src/input/` — 6글자 인식.
- `tests/test_runner.gd` — Godot 31 Suites.
- `tests/test_star_runtime_implementation_contract.py` — 기획→코드 적대 계약.
- `tests/test_star_runtime_completion_contract.py` — Completion Gate 적대 계약.
- `.github/workflows/validate-star-runtime-poc.yml` — PR·main Push 검증.
- `.github/workflows/validate-base-v9-adoption.yml` — Planning/Base·제품 변경 적대 Gate.
- `tools/run_star_runtime.py` — 로컬 Test·Run·Editor.
- `docs/validation/GODOT_STAR_RUNTIME_TEST_GUIDE_2026-08-06.md` — 실행 절차.

## Sheet

- `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
- Sync03 Readback: 허브, 결정, 감사, GDD, 핵심루프, 규칙, 핵심시스템, 성장경제, UX, 변경이력 `PASS`.

## 역사 보존

`GM-3X3-CIRCUIT-STOCK-FOCUS-01`은 `SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01` 이력이다. Typed Stock·명시 Commit·Mana 원칙만 유지하며 3×3 위상·내부 Target·Edge 문법·보조2 상한은 활성 근거가 아니다. 범용 Stock Pool은 과거 POC 호환 테스트로만 보존하며 활성 별형 Commit은 Typed Stock을 사용한다.

## 검증 경계

자동 Runtime은 31 Suites·1,137 assertions·0 failures다. 실제 Mobile Device·Performance·Screen Reader·Human·Full Slice는 `NOT_RUN`; Prototype 수치는 `PLAYTEST_TUNING_REQUIRED`다.

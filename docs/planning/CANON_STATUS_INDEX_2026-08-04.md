# GRIMOIRE 정본 상태 색인 — 2026-08-04 / 2026-08-06 Runtime Completion Addendum

## 표기

`[활성]` 현재 정본, `[부분 대체됨]` 명시 범위만 유효, `[대체됨]` 현재 참조 금지, `[보류]` 실행 지시 아님, `[구현완료 보관]` 완료 이력, `[이력]` 당시 상태 증거.

## 현재 작업

```yaml
main_authority_commit: 2012a9f4c2da09a1defec07f8d8f7a0d3c867d93
previous_main_sync: GR-SYNC-20260806-01-MAIN
working_branch: agent/star-circuit-runtime-godot-poc
working_pull_request: 69
working_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
latest_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
canon_status: SYNCED_TO_WORKING_BRANCH_MERGE_AUTHORIZED
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: NOT_RUN
```

## 활성 기획

- 별형 회로 승인·Spec.
- `MAGIC_LETTER_CIRCUIT_SYSTEM`, `MANA_SYSTEM`, `SUPPORT_LETTER_MASTERY_SYSTEM`, `STOCK_SYSTEM`, `STOCK_CAPACITY_SYSTEM`.
- `STAR_CIRCUIT_MOBILE_LANDSCAPE_WIREFRAME_01_APPROVAL_2026-08-06.md`.
- `SPELL_RESOLUTION_PARTIAL_FAILURE_BACKLASH_01_APPROVAL_2026-08-06.md`.
- `FOCUS_SCRIBING_OVERLAY_01_APPROVAL_2026-08-06.md`.
- `FROSTBLOOM_STAR_CIRCUIT_UX_MAP_01_APPROVAL_2026-08-06.md`.

## 활성 Runtime

- `project.godot`.
- `src/core/star/` — 별형 문법·계산·상태·Commit·결과 Policy.
- `src/core/resources/typed_glyph_stock_pool.gd`.
- `src/core/resources/focus_scribing_session.gd`.
- `src/ui/star_circuit_harness.*`, `src/ui/focus_scribing_overlay.*`.
- `data/testing/frostbloom_star_ux_map.json`.
- `src/core/resources/`, `src/core/spells/`, `src/input/`, `src/persistence/`의 비충돌 범위.
- `tests/test_runner.gd` 31 Suites와 Runtime Python 적대 계약.
- `tools/run_star_runtime.py`.
- `GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION`.

## 부분 대체됨 — GM-3X3-CIRCUIT-STOCK-FOCUS-01

```text
SUPERSEDED_BY_GM-STAR-CIRCUIT-MASTERY-BALANCE-01
```

유지: Typed Stock, 명시 Commit, Mana 소모, 입력 방식 동일 의미. 대체: 3×3 위상, 회로 내부 Target, Edge 문법, 보조2 상한, 숫자 성공률 금지.

## 구현완료 보관

- 기존 `UniversalStockPool` POC와 해당 회귀 Suite는 저장 호환·과거 기반 증거다.
- 활성 별형 주문 Commit·집중 필사는 `TypedGlyphStockPool`을 사용하며 다른 glyph_id 대체를 금지한다.
- Sync02는 초기 별형 Runtime POC 이력이고 Sync03이 현재 Completion 권위다.

## 보류·미실행

실제 Android/iOS Mobile Wireframe 검증, 손가락 가림, Touch·Stylus, Screen Reader, 성능, 사람 핵심 재미·실패 공정성·Frostbloom 서사 만족도, Full Vertical Slice.

## Sync

- `GR-SYNC-20260806-01-MAIN`: `[활성 기획 main 동기화 이력]`.
- `GR-SYNC-20260806-02-STAR-RUNTIME-POC`: `[이력/초기 Runtime POC]`.
- `GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION`: `[활성 Working Sync / Sheet Readback PASS / PR69 병합 대기]`.

Prototype 수치는 `PLAYTEST_TUNING_REQUIRED`다.

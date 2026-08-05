# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 최신 Decision | `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` |
| Working Sync | `GR-SYNC-20260806-02-STAR-RUNTIME-POC` |
| PR | `#69 / merge authorized` |
| 제품 Godot 프로젝트 | `CREATED` |
| 제품 구현 | `RUNTIME_POC_IMPLEMENTED_AUTOMATED_PASS` |
| Runtime | `AUTOMATED_HEADLESS_PASS` |
| Mobile Device·Performance·Accessibility·Human | `NOT_RUN` |
| Prototype 수치 | `PLAYTEST_TUNING_REQUIRED` |

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CANON_STATUS_INDEX_2026-08-04.md`
5. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
6. 별형 회로 승인·Spec·회로·마나·숙련 책임 원본
7. `docs/planning/sync/GR-SYNC-20260806-02-STAR-RUNTIME-POC.md`
8. `docs/validation/GODOT_STAR_RUNTIME_TEST_GUIDE_2026-08-06.md`

## 핵심 흐름

```text
조사 → 의도 → FIVE_POINT_STAR → 회로 Preview → 대상 키워드 → 최종 숫자 Preview → 명시 Commit → 변화 → 복기
```

중앙 메인 1개, 동등한 외곽 보조 0~5개다. Target은 회로 밖 키워드이며 자동 추천하지 않는다. Vault·Stock·Mana·결과는 Commit에서 원자 처리하고 Cancel·실패·중복 Commit은 추가 소비하지 않는다.

## 바로 테스트

Windows 저장소 루트:

```powershell
py -3 tools/run_star_runtime.py
py -3 tools/run_star_runtime.py --editor
```

F5/F6 실행 Scene은 `res://src/ui/star_circuit_harness.tscn`이다.

자동 PASS는 Low-fi Runtime 계약 증거다. 실제 Touch·Stylus·기기 성능·접근성·사람 핵심 재미·Full Slice는 검증되지 않았다.

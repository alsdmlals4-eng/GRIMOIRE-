# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| Runtime | `FIVE_POINT_STAR / TYPED_GLYPH_ONLY` |
| Decision | `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` |
| Validation Sync | `GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY` |
| Gate | `GR-TEST-033` |
| 실행 패키지 | `READY_FOR_PHYSICAL_EXECUTION` |
| 자동 Runtime | `31 Suites / 1,137 assertions / 0 failures` |
| Device·Performance·Screen Reader·Human·Full Slice | `NOT_RUN` |
| PR | `#72 OPEN_DRAFT_UNMERGED` |

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/superpowers/specs/2026-08-06-star-circuit-physical-validation-design.md`
6. `docs/validation/GR_TEST_033_STAR_PHYSICAL_RUNBOOK.md`
7. `docs/validation/GR_TEST_033_MODERATOR_SCRIPT.md`
8. `docs/validation/GR_TEST_033_DEVICE_PREFLIGHT.md`
9. `docs/planning/GR_TEST_033_STAR_PHYSICAL_EXECUTION_READY_GATE_2026-08-06.md`
10. `docs/planning/sync/GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY.md`

## 실행 준비

```powershell
py -3 tools/run_star_runtime.py --run --skip-setup
```

실제 세션 후 원시 JSON을 봉인하고 다음을 실행한다.

```powershell
py -3 tools/analyze_gr_test_033.py --session session.json --attempts attempts.json --observations observations.json --output result.json
```

현재는 패키지만 준비됐으며 실제 물리 기기·사람 결과는 없다. `PROMISING`도 Human PASS나 출시 준비 완료를 뜻하지 않는다.

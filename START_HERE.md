# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| Runtime | `FIVE_POINT_STAR / TYPED_GLYPH_ONLY` |
| Runtime Main Sync | `GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN` |
| Validation Main Sync | `GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN` |
| Validation Merge | `292d2b850b38945e404f81dbcf209220067729d2` |
| Gate | `GR-TEST-033` |
| Device·Performance·Screen Reader·Human·Full Slice | `NOT_RUN` |

## Godot에서 열기

저장소를 내려받거나 clone한 뒤 저장소 최상위의 `project.godot`을 Godot Project Manager에서 Import한다.

```text
GRIMOIRE-/project.godot
└─ Main Scene: res://src/ui/star_circuit_harness.tscn
```

권장 Godot 버전은 `4.7.1`이며 프로젝트는 1280×720 Mobile Landscape와 GL Compatibility를 사용한다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/validation/GR_TEST_033_STAR_PHYSICAL_RUNBOOK.md`
6. `docs/planning/sync/GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN.md`

실제 기기·참가자 증거 전에는 `DEVICE_NOT_RUN / PERFORMANCE_NOT_RUN / HUMAN_NOT_RUN / FULL_VERTICAL_SLICE_NOT_RUN`이다.

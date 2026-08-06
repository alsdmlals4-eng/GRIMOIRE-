# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| Latest Decision | `GM-SPELL-WORKFLOW-UI-V2-01` |
| Runtime Main | `FIVE_POINT_STAR / TYPED_GLYPH_ONLY` |
| Runtime Main Sync | `GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN` |
| Validation Main Sync | `GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN` |
| Working Design Sync | `GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2` |
| Working PR | `#78 Draft` |
| Current Gate | `WRITTEN_SPEC_USER_REVIEW_REQUIRED` |
| GrillMe | `5/10` |
| UI v2 Implementation | `NOT_STARTED` |
| Device·Performance·Screen Reader·Human·Full Slice | `NOT_RUN` |

## 현재 주문 흐름

```text
1. 글자 그리기
→ 2. 회로 배치
→ 3. 주문 사용
```

- 1단계는 글자 획득과 보관함 저장을 담당한다.
- 2단계는 보관함·스톡 글자를 사용해 FIVE_POINT_STAR 주문을 완성한다.
- 3단계는 대상 선택·상세 예상 결과·마나 소비·실제 판정을 담당한다.

상세 설계는 `docs/superpowers/specs/2026-08-06-spell-workflow-ui-v2-design.md`다.

## Godot에서 열기

저장소 최상위의 `project.godot`을 Godot Project Manager에서 Import한다.

```text
GRIMOIRE-/project.godot
└─ 현재 Main Scene: res://src/ui/star_circuit_harness.tscn
```

권장 Godot 버전은 `4.7.1`, 화면은 1280×720 Mobile Landscape, GL Compatibility다. UI v2 Main Scene 전환은 구현 계획 승인 전 금지한다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/planning/SPELL_WORKFLOW_UI_V2_01_APPROVAL_2026-08-06.md`
6. `docs/superpowers/specs/2026-08-06-spell-workflow-ui-v2-design.md`
7. `docs/validation/GR_TEST_033_STAR_PHYSICAL_RUNBOOK.md`

작성된 UI v2 설계는 구현·기기·사람 PASS가 아니다.

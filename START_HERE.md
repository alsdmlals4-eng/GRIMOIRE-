# GRIMOIRE 시작 지점

## 현재 상태

| 항목 | 기준 |
|---|---|
| Latest Decision | `GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01` |
| Product Decision | `GM-SPELL-WORKFLOW-UI-V2-01` |
| Preserved Runtime Decision | `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` |
| Runtime Main | `FIVE_POINT_STAR / TYPED_GLYPH_ONLY` |
| UI Kit Merge | `PR #77 / 8165ac98` |
| Spell Workflow Design·Plan Merge | `PR #78 / 6c39ab68` |
| Spell Workflow Implementation | `PR #82 / Task 1 GREEN / PAUSED` |
| Tool Authority Design | `PR #83 / DRAFT_REVIEW_REQUIRED` |
| Current Gate | `BLOCKED_PENDING_GODOT_AUTHORING_GUT_AUTHORITY_REVIEW` |
| HiGodot | `SOLE_AUTHORING_AUTHORITY_DESIGN` |
| GUT | `9.7.1 / VENDORED_NOT_CONSUMED` |
| Device·Performance·Screen Reader·Human·Full Slice | `NOT_RUN` |

## 현재 주문 흐름

```text
1. 글자 그리기
→ 2. 회로 배치
→ 3. 주문 사용
```

- 1단계는 글자 획득과 보관함 저장을 담당한다.
- 2단계는 보관함·스톡 글자를 사용해 FIVE_POINT_STAR 주문을 완성하고 글자만 소비한다.
- 3단계는 대상 선택·상세 예상 결과·마나 소비·실제 판정을 담당한다.

Task 1에서 10종 Glyph Catalog와 `BURST → AMPLIFY` 호환 ViewModel이 RED→GREEN을 통과했다. Task 2는 도구 권위 Draft PR #83이 승인·병합되고 GUT 실제 소비·CI 채택 구현이 완료되기 전 시작하지 않는다.

## 저작·검증 권위

- HiGodot/Godot AI는 Scene·Node·Resource·`project.godot`·Project Settings의 단일 저작 권위다.
- GUT은 검증 권위이며 제품 파일을 수정하지 않는다.
- 현재 GUT 9.7.1 파일은 `addons/gut`에 있지만 plugin 활성화·제품 test 소비·CI 실행이 없으므로 채택 완료가 아니다.
- 미확정 항목은 `docs/planning/CURRENT_UNRESOLVED_GATES.md`를 따른다.

## 이미지 상태

주문 UI 3화면 이미지는 사용자 방향 승인 완료다. 다만 실제 3화면 Runtime과 최종 아트 검증은 실행하지 않았다.

```yaml
status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
awaiting_user_direction_approval: false
implementation_visual_review: PENDING
final_art: NOT_CLAIMED
```

## Godot에서 열기

저장소 최상위의 `project.godot`을 Godot Project Manager에서 Import한다.

```text
GRIMOIRE-/project.godot
└─ 현재 Main Scene: res://src/ui/star_circuit_harness.tscn
```

권장 Godot 버전은 `4.7.1`, 화면은 1280×720 Mobile Landscape, GL Compatibility다. UI v2 Main Scene 전환은 구현 완료·GUT/legacy 병행 회귀·렌더 증거·저작 영수증 Gate가 모두 PASS하기 전 금지한다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/planning/CURRENT_UNRESOLVED_GATES.md`
6. `docs/planning/GODOT_AUTHORING_GUT_TEST_AUTHORITY_ADOPTION_2026-08-06.md`
7. `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
8. `docs/superpowers/specs/2026-08-06-spell-workflow-ui-v2-design.md`
9. `docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md`

다음 작업은 PR #83의 RED 계약을 GREEN으로 만들고 Sheet 상태를 같은 Decision ID로 Write·Readback하는 것이다. 제품 Task 2가 아니다.

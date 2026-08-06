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
| Tool Authority Design | `PR #83 / USER_APPROVED / PLAN_READY` |
| Current Gate | `BLOCKED_PENDING_GUT_FORMAL_ADOPTION` |
| HiGodot | `SOLE_AUTHORING_AUTHORITY` |
| GUT | `9.7.1 / VENDORED_NOT_CONSUMED / CLI_ONLY_PLAN` |
| Base | `9.4.3 pinned / main 4f98f968 observed` |
| Device·Performance·Screen Reader·Human·Full Slice | `NOT_RUN` |

## 주문 흐름

```text
글자 그리기 → 회로 배치 → 주문 사용
```

- 글자 그리기: 인식·획득·보관함 저장.
- 회로 배치: 보관함·스톡 글자를 사용해 FIVE_POINT_STAR 주문을 완성하고 글자만 소비.
- 주문 사용: 대상 선택·상세 예상·마나 소비·실제 판정.

PR #82 Task 1의 10종 Glyph Catalog와 `BURST → AMPLIFY` 호환은 GREEN이다. Task 2는 GUT formal adoption과 남은 차단 Gate가 닫히기 전 시작하지 않는다.

## 저작·테스트 권위

- HiGodot/Godot AI는 `project.godot`, Scene·Node·Resource·Project Settings의 단일 저작 권위다.
- GUT은 제품 결과를 읽고 실행하는 테스트 권위이며 제품 파일을 수정하지 않는다.
- 초기 채택은 CLI-only다. GUT Editor Plugin은 활성화하지 않으며 `project.godot`을 변경하지 않는다.
- 실제 GUT 제품 test·CI·JUnit·hash·legacy parity·HiGodot receipt Gate는 아직 `NOT_IMPLEMENTED`다.

구현 계획:

```text
docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md
```

## 이미지 상태

```yaml
status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
awaiting_user_direction_approval: false
implementation_visual_review: PENDING
final_art: NOT_CLAIMED
```

## Godot에서 열기

```text
GRIMOIRE-/project.godot
└─ Main Scene: res://src/ui/star_circuit_harness.tscn
```

Godot 4.7.1, 1280×720 Mobile Landscape, GL Compatibility다. UI v2 Main Scene 전환은 전체 구현·GUT/legacy 회귀·렌더·HiGodot 영수증 PASS 전 금지한다.

## 읽기 순서

1. `AGENTS.md`
2. `docs/ACTIVE_CONTEXT.md`
3. `docs/DEVELOPMENT_GATES.md`
4. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
5. `docs/planning/CURRENT_UNRESOLVED_GATES.md`
6. `docs/planning/GODOT_AUTHORING_GUT_TEST_AUTHORITY_ADOPTION_2026-08-06.md`
7. `docs/planning/GODOT_AUTHORING_GUT_AUTHORITY_STATE.json`
8. `docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md`
9. `docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md`

다음 작업은 PR #83 exact-head 검수·Sheet 00/01 포함 동기화·독립 리뷰다. 병합된 main이 확보된 뒤 별도 GUT formal-adoption TDD PR을 연다.

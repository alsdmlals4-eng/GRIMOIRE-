# GRIMOIRE 현재 확정 결정 스냅샷

```yaml
status: ACTIVE_CANON_TOOL_AUTHORITY_DESIGN_APPROVED
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
runtime_layout: FIVE_POINT_STAR
current_gate: BLOCKED_PENDING_GUT_FORMAL_ADOPTION
spell_workflow_implementation_pr: 82
spell_workflow_implementation_status: PAUSED_AFTER_TASK1_GREEN
tool_authority_design_pr: 83
tool_authority_design_status: DESIGN_APPROVED_IMPLEMENTATION_PLAN_READY
higodot_authority: SOLE_AUTHORING_AUTHORITY
gut_version: 9.7.1
gut_status: VENDORED_NOT_CONSUMED
gut_adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
image_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
merge_authorized: false
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
```

## 보존되는 제품 정본

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 `FIVE_POINT_STAR`, 중앙 Main 1개, Auxiliary 0~5개, 글자별 숙련도, Typed Glyph Stock, 명시 Preview, Exactly-once 자원 처리를 유지한다.

`GM-SPELL-WORKFLOW-UI-V2-01`의 주문 흐름도 유지한다.

```text
1. 글자 그리기 → 인식·획득·보관함 저장
2. 회로 배치 → 보관함/스톡 예약·Preview·글자 소비·완성 주문 생성
3. 주문 사용 → 대상 선택·상세 예상 결과·마나 소비·실제 판정
```

PR #82 Task 1은 10종 Glyph Catalog와 `BURST → AMPLIFY` 호환을 구현해 자동 회귀를 통과했다. Task 2는 시작하지 않는다.

## GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01

사용자 승인일: 2026-08-06.

### HiGodot

- `project.godot`, Scene·Node·`*.tscn`, `*.tres`, `*.res`, Resource, Project Settings의 단일 저작 권위.
- protected diff에는 저작 영수증과 Scene open/reload evidence 필요.
- 테스트 assertion·expected value·fixture·CI 성공 기준 수정 금지.

### GUT 9.7.1

```yaml
source: https://github.com/bitwes/Gut
version: 9.7.1
license: MIT
godot_compatibility: 4.7.x
repository_state: VENDORED_NOT_CONSUMED
formal_adoption: NOT_YET_IMPLEMENTED
adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
editor_plugin: DISABLED
```

초기 adoption PR은 `project.godot`을 수정하지 않는다. GUT은 제품 파일을 읽고 실행하지만 수정할 수 없다.

실행 계획:

```text
docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md
```

## Base 정합성

프로젝트 Base pin은 9.4.3이다. Base 최신 main `4f98f968a377f7b6a11aafa4fc94d11bddbebedc`의 선택적 애드온 소비 정책은 이번 설계와 정합하지만, pin 변경은 승인·수행하지 않았다.

## 이미지 승인 상태

```yaml
user_direction_approval: COMPLETE
runtime_validation: NOT_RUN
implementation_visual_review: PENDING
final_art: NOT_CLAIMED
status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
```

## 현재 차단

`docs/planning/CURRENT_UNRESOLVED_GATES.md`의 실제 blocker가 닫히기 전 다음을 금지한다.

- PR #82 Task 2.
- GUT formal adoption 완료 선언.
- UI v2 Main Scene 전환.
- Ready·병합 승인.
- 최종 아트·Runtime·기기 완료 선언.

## 다음 Gate

PR #83의 Sheet 00·01 포함 동기화, exact-head CI, 적대검토, 독립 리뷰를 완료한다. 병합된 main을 기준으로 별도 GUT formal-adoption TDD PR을 연다.

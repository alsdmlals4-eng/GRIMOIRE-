# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
current_branch: main
platform: MOBILE_LANDSCAPE_FIXED
runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
runtime_layout: FIVE_POINT_STAR
ui_kit_main_sync: GR-SYNC-20260806-08-STAR-UI-KIT-V1-MAIN
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
tool_authority_sync: GR-SYNC-20260806-10-GODOT-AUTHORING-GUT-AUTHORITY
current_gate: BLOCKED_PENDING_GUT_FORMAL_ADOPTION
canon_status: ACTIVE_PRODUCT_CANON_TOOL_AUTHORITY_DESIGN_APPROVED
spell_workflow_implementation_pr: 82
spell_workflow_implementation_head: 0919b71dfec3c6f57b88e1290789302267936960
spell_workflow_implementation_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2: NOT_STARTED_ON_BRANCH
tool_authority_design_pr: 83
tool_authority_design_status: DESIGN_APPROVED_IMPLEMENTATION_PLAN_READY
higodot_authority: SOLE_AUTHORING_AUTHORITY
higodot_bundled_version: 3.1.2
gut_pinned_version: 9.7.1
gut_current_consumption: VENDORED_NOT_CONSUMED
gut_adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
gut_target_authority: FORMAL_TEST_AUTHORITY
gut_ci: NOT_ENABLED
base_release_pin: 9.4.3
base_current_main_observed: 4f98f968a377f7b6a11aafa4fc94d11bddbebedc
image_direction_approval: COMPLETE
image_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
merge_authorized: false
```

## 활성 주문 UX

```text
글자 그리기 → 회로 배치 → 주문 사용
```

PR #82 Task 1은 10종 Glyph Catalog와 legacy `BURST → AMPLIFY` 정규화를 RED→GREEN으로 완료했다. Task 2는 현재 차단된다.

## 권위 상태

HiGodot은 protected Godot serialization의 단일 write authority다. GUT은 별도 테스트 권위이며 초기 채택은 CLI-only다. Editor Plugin은 켜지 않으며 `project.godot` 변경을 만들지 않는다.

현재 없는 것:

- `.gutconfig.json`.
- 실제 제품을 검증하는 `GutTest`.
- Godot 4.7.1 headless GUT CI와 JUnit.
- 실행 전후 제품 hash 무변경 Gate.
- legacy/GUT 필수 계약 parity.
- protected diff용 HiGodot 영수증 Gate.

구현 계획은 `docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md`다.

## 이미지 상태

사용자 방향 승인은 완료됐다. 남은 것은 실제 3화면 구현·렌더·기기·사람 검토이며 final art는 주장하지 않는다.

## 현재 작업

PR #83의 승인 상태·계획·Sheet 00/01 허브를 정합화하고 exact-head 검증과 독립 리뷰를 완료한다. 병합된 main을 기준으로만 별도 GUT formal-adoption PR을 시작한다.

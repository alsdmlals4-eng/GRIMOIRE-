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
current_gate: BLOCKED_PENDING_GODOT_AUTHORING_GUT_AUTHORITY_REVIEW
canon_status: ACTIVE_PRODUCT_CANON_TOOL_AUTHORITY_DRAFT_REQUIRED
spell_workflow_implementation_pr: 82
spell_workflow_implementation_head: 0919b71dfec3c6f57b88e1290789302267936960
spell_workflow_implementation_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2: NOT_STARTED_ON_BRANCH
tool_authority_design_pr: 83
tool_authority_design_status: DESIGN_DRAFT_REVIEW_REQUIRED
higodot_authority: SOLE_AUTHORING_AUTHORITY_DESIGN
higodot_bundled_version: 3.1.2
gut_pinned_version: 9.7.1
gut_current_consumption: VENDORED_NOT_CONSUMED
gut_target_authority: FORMAL_TEST_AUTHORITY
gut_ci: NOT_ENABLED
image_direction_approval: COMPLETE
image_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
merge_authorized: false
```

## 활성 주문 UX 방향

```text
글자 그리기 → 회로 배치 → 주문 사용
```

- 글자 그리기: 직접 필기·인식·획득·보관함 저장.
- 회로 배치: 보관함/스톡에서 같은 수의 최대 5개 준비 글자를 사용해 `FIVE_POINT_STAR` 회로를 설계하고 글자만 소비해 완성 주문을 만든다.
- 주문 사용: 대상 키워드를 선택하고 최종 성공률·효과·위험·마나를 확인한 뒤 실제 판정을 실행한다.

PR #82의 Task 1은 10종 Glyph Catalog와 legacy `BURST → AMPLIFY` 정규화를 RED→GREEN으로 완료했다. 이후 구현은 새 차단 Gate 때문에 중지했다.

## 저작·테스트 권위 상태

현재 `project.godot`은 `addons/godot_ai`를 활성화한다. Scene·Node·Resource·Project Settings 변경은 HiGodot을 통한 저작 영수증이 필요하도록 설계한다.

GUT 9.7.1은 `addons/gut`에 포함되어 있으나 다음이 없다.

- GUT Editor Plugin 활성화.
- `.gutconfig.json`.
- 제품 test가 `GutTest`를 실제 상속하는 경로.
- Godot 4.7.1 headless GUT CLI CI.
- JUnit Artifact.
- GUT 실행 전후 제품 파일 hash 무변경 Gate.

따라서 formal adoption 완료를 주장하지 않는다.

## 이미지 상태

사용자 방향 승인은 완료되었다. 다시 방향 승인을 기다리지 않는다. 남은 것은 실제 Godot 3화면 구현·렌더·기기·사람 검토다.

## 현재 작업

우선순위는 Draft PR #83에서 권위 분리 명세·활성 상태 복구·미확정 차단 목록·Sheet Write/Readback을 완료하는 것이다.

제품 구현 PR #82 Task 2는 `docs/planning/CURRENT_UNRESOLVED_GATES.md`의 blocking 항목이 0이 되기 전 재개하지 않는다.

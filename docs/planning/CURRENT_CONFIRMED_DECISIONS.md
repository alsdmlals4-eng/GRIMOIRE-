# GRIMOIRE 현재 확정 결정 스냅샷

```yaml
status: ACTIVE_CANON_TOOL_AUTHORITY_DRAFT_BLOCKING
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
runtime_layout: FIVE_POINT_STAR
current_gate: BLOCKED_PENDING_GODOT_AUTHORING_GUT_AUTHORITY_REVIEW
spell_workflow_implementation_pr: 82
spell_workflow_implementation_status: PAUSED_AFTER_TASK1_GREEN
tool_authority_design_pr: 83
tool_authority_design_status: DESIGN_DRAFT_REVIEW_REQUIRED
higodot_authority: SOLE_AUTHORING_AUTHORITY_DESIGN
gut_version: 9.7.1
gut_status: VENDORED_NOT_CONSUMED
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

PR #82의 Task 1은 승인된 10종 Glyph Catalog와 `BURST → AMPLIFY` 호환을 구현하고 자동 회귀를 통과했다. Task 2는 시작하지 않는다.

## 새 도구 권위 결정

### HiGodot

HiGodot/Godot AI를 Scene·Node·Resource·Project Settings 직렬화의 단일 저작 권위로 설계한다.

- `project.godot`, `*.tscn`, `*.tres`, `*.res`의 최종 수정은 HiGodot 경로를 사용한다.
- protected diff에는 저작 영수증과 Scene open/reload evidence가 필요하다.
- HiGodot은 테스트 assertion·expected value·fixture·CI 성공 기준을 수정하지 않는다.

### GUT 9.7.1

GUT을 정식 테스트 권위로 채택하는 방향은 사용자 승인되었다. 다만 실제 채택 완료는 별도 구현·검증 뒤 선언한다.

```yaml
source: https://github.com/bitwes/Gut
version: 9.7.1
license: MIT
godot_compatibility: 4.7.x
repository_state: VENDORED_NOT_CONSUMED
formal_adoption: NOT_YET_IMPLEMENTED
```

현재 `addons/gut`은 포함되어 있으나 `project.godot` plugin 활성화, `.gutconfig.json`, 제품 GUT test, GUT CI, JUnit Artifact가 없다.

GUT은 제품 파일을 읽고 실행할 수 있지만 수정할 수 없다.

## 이미지 승인 상태

주문 UI 3화면 방향은 사용자 승인 완료다.

```yaml
user_direction_approval: COMPLETE
runtime_validation: NOT_RUN
implementation_visual_review: PENDING
final_art: NOT_CLAIMED
status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
```

동일 방향 승인을 다시 기다리는 상태로 기록하지 않는다.

## 현재 차단 목록

`docs/planning/CURRENT_UNRESOLVED_GATES.md`의 blocking 항목이 0이 되기 전 다음을 금지한다.

- PR #82 Task 2 시작.
- GUT formal adoption 완료 선언.
- UI v2 Main Scene 전환.
- Ready 전환·병합 승인.
- 최종 아트·Runtime·기기 검증 완료 선언.

## 다음 Gate

Draft PR #83에서 다음을 완료한다.

1. 도구 권위 명세 검토.
2. 활성 정본의 stale 작업 진입 상태 복구.
3. Sheet 02·04·72·99 같은 Decision ID 동기화.
4. exact-head CI와 Sheet readback.

그 뒤 별도 GUT 채택 구현 PR을 RED→GREEN으로 실행한다.

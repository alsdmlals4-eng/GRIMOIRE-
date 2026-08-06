# GRIMOIRE 현재 미확정·차단 게이트

```yaml
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
status: BLOCKING
implementation_entry: BLOCKED_PENDING_GODOT_AUTHORING_GUT_AUTHORITY_REVIEW
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
```

## 차단 항목

| ID | 현재 상태 | 해소 조건 |
|---|---|---|
| `TOOL_AUTHORITY_REVIEW_NOT_APPROVED` | BLOCKING | Draft PR #83의 권위 분리 명세 승인·병합 |
| `GUT_ACTUAL_CONSUMPTION_NOT_ENABLED` | BLOCKING | 제품 코드를 검증하는 GUT test와 `.gutconfig.json` 추가 |
| `GUT_CI_NOT_ENABLED` | BLOCKING | Godot 4.7.1 headless GUT CLI·JUnit·exit-code CI PASS |
| `HIGODOT_AUTHORING_RECEIPT_GATE_NOT_IMPLEMENTED` | BLOCKING | protected Godot artifact diff와 HiGodot 영수증 대응 CI PASS |
| `GUT_PRODUCT_MUTATION_HASH_GATE_NOT_IMPLEMENTED` | BLOCKING | GUT 실행 전후 product path hash 무변경 검증 PASS |
| `LEGACY_TO_GUT_COVERAGE_PARITY_NOT_PROVEN` | BLOCKING | 커스텀 runner와 GUT 핵심 계약 병행·coverage 비교 PASS |
| `SHEET_STATUS_CORRECTION_NOT_FINALIZED` | BLOCKING | Sheet 02·04·72·99 Write·Readback PASS와 exact-head 영수증 |
| `SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN` | BLOCKING_FOR_VISUAL_COMPLETION | 3개 실제 Godot Screen 렌더·상호작용 검증 |
| `DEVICE_PERFORMANCE_SCREEN_READER_HUMAN_NOT_RUN` | RELEASE_BLOCKING | 실제 실행 증거 |

## READY 판정 복구

```yaml
previous_status: SPELL_WORKFLOW_UI_V2_READY_FOR_TDD
corrected_status: BLOCKED_PENDING_GODOT_AUTHORING_GUT_AUTHORITY_REVIEW
reason: NEW_MANDATORY_TOOL_AUTHORITY_AND_TEST_FRAMEWORK_PREREQUISITE
```

기존 설계·UI Kit 관점의 READY 기록은 역사 증거로 남지만 활성 작업 진입 상태로 사용하지 않는다.

## 이미지 AWAITING 판정 복구

```yaml
review_id: GR-REV-SPELL-WORKFLOW-UI-V2
image_id: GR-IMG-011
user_direction_approval: COMPLETE
runtime_validation: NOT_RUN
final_art: NOT_CLAIMED
correct_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
```

`NO_USER_APPROVAL_AWAITING_FOR_DIRECTION`

사용자에게 동일한 방향 승인을 다시 요청하지 않는다. 남은 것은 구현 화면 검수·Runtime·기기·사람 검증이다.

## 진입 규칙

다음 명령·상태 전환은 차단 항목이 0이 되기 전 금지한다.

```text
SPELL_WORKFLOW_TASK2_START
PROJECT_MAIN_SCENE_SWITCH_TO_UI_V2
GUT_FORMALLY_ADOPTED
READY_FOR_REVIEW
MERGE_AUTHORIZED
FINAL_ART_APPROVED
RUNTIME_VALIDATED
```

체크리스트에 확인 표시만 하는 것으로 해소할 수 없다. 각 항목은 실행 로그, exact-head CI, Sheet readback 또는 검토 승인 증거를 요구한다.

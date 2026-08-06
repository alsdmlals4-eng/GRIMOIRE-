# GRIMOIRE 현재 미확정·차단 게이트

```yaml
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
status: BLOCKING
implementation_entry: BLOCKED_PENDING_GUT_FORMAL_ADOPTION
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
pr83_review_exception: USER_APPROVED_PR83_ONLY
```

## 실제 남은 차단 항목

| ID | 현재 상태 | 해소 조건 |
|---|---|---|
| `GUT_ACTUAL_CONSUMPTION_NOT_ENABLED` | BLOCKING | 실제 제품 코드·Scene을 검증하는 `GutTest`와 `.gutconfig.json` PASS |
| `GUT_CI_NOT_ENABLED` | BLOCKING | Godot 4.7.1 headless GUT CLI·JUnit·exit-code CI PASS |
| `HIGODOT_AUTHORING_RECEIPT_GATE_NOT_IMPLEMENTED` | BLOCKING | protected Godot artifact diff 0 또는 HiGodot 영수증 대응 CI PASS |
| `GUT_PRODUCT_MUTATION_HASH_GATE_NOT_IMPLEMENTED` | BLOCKING | GUT 실행 전후 product path hash 무변경 PASS |
| `LEGACY_TO_GUT_COVERAGE_PARITY_NOT_PROVEN` | BLOCKING | 커스텀 runner와 GUT 필수 계약 병행·coverage mapping PASS |
| `DESIGN_PR_NOT_MERGED_TO_MAIN` | BLOCKING | PR #83 현재 exact-head CI PASS·Sheet 예외 readback·병합·main readback |
| `SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN` | BLOCKING_FOR_VISUAL_COMPLETION | 3개 실제 Godot Screen 렌더·상호작용 검증 |
| `DEVICE_PERFORMANCE_SCREEN_READER_HUMAN_NOT_RUN` | RELEASE_BLOCKING | 실제 실행 증거 |

## 해소된 항목

```yaml
tool_authority_design_review: USER_APPROVED_2026-08-06
sheet_02_04_72_99_write_readback: PASS
image_direction_approval: COMPLETE
implementation_plan: docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md
pr83_external_independent_review: STRUCTURALLY_UNAVAILABLE
pr83_review_exception: USER_APPROVED_2026-08-06T23:28+09:00 / PR83_ONLY
pr83_exception_receipt: docs/planning/PR83_INDEPENDENT_REVIEW_EXCEPTION_2026-08-06.md
```

`GUT_ADOPTION_PR_INDEPENDENT_REVIEW_REQUIRED`

PR #83 한정 예외는 후속 GUT formal-adoption 구현 PR의 독립 리뷰를 면제하지 않는다.

`PR82_TASK2_NOT_AUTHORIZED`

PR #82 Task 2는 GUT formal-adoption 구현·병합·main readback과 blocker-zero 판정 전까지 시작할 수 없다.

## READY 판정

```yaml
historical_status: SPELL_WORKFLOW_UI_V2_READY_FOR_TDD
current_status: BLOCKED_PENDING_GUT_FORMAL_ADOPTION
reason: GUT_ACTUAL_CONSUMPTION_CI_HASH_PARITY_RECEIPT_NOT_IMPLEMENTED
```

기존 설계·UI Kit 관점의 READY 기록은 역사 증거이며 활성 작업 진입 상태가 아니다.

## 이미지 AWAITING 판정

```yaml
review_id: GR-REV-SPELL-WORKFLOW-UI-V2
image_id: GR-IMG-011
user_direction_approval: COMPLETE
runtime_validation: NOT_RUN
final_art: NOT_CLAIMED
correct_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
```

`NO_USER_APPROVAL_AWAITING_FOR_DIRECTION`

사용자에게 동일한 방향 승인을 다시 요청하지 않는다. 남은 것은 구현 화면·Runtime·기기·사람 검증이다.

## 진입 규칙

PR #83 설계 병합은 PR83_ONLY 예외와 현재 exact-head 증거로 별도 판정한다. 다음 제품·채택 상태 전환은 실제 차단 항목이 0이 되기 전 금지한다.

```text
SPELL_WORKFLOW_TASK2_START
PROJECT_MAIN_SCENE_SWITCH_TO_UI_V2
GUT_FORMALLY_ADOPTED
GUT_ADOPTION_PR_MERGE_AUTHORIZED
FINAL_ART_APPROVED
RUNTIME_VALIDATED
```

체크리스트 확인만으로 해소하지 않는다. 각 항목은 exact-head 실행 로그, Artifact, hash, Sheet readback 또는 해당 PR에 요구되는 검토 증거를 요구한다.

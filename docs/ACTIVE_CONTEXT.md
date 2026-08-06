# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
current_branch: main
platform: MOBILE_LANDSCAPE_FIXED
runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
runtime_main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
runtime_layout: FIVE_POINT_STAR
validation_main_sync: GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN
latest_decision: GM-SPELL-WORKFLOW-UI-V2-01
spell_workflow_main_sync: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2-MAIN
spell_workflow_main_merge: 6c39ab683fe7f4cd15fbcdb50bc4cee153deebec
current_gate: SPELL_WORKFLOW_UI_V2_READY_FOR_TDD_PR77_DEPENDENCY
written_spec_review: USER_APPROVED
canon_status: SYNCED_TO_MAIN_PLAN_COMPLETE
existing_runtime: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
spell_workflow_ui_v2_implementation_plan: COMPLETE
implementation_plan_path: docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md
spell_workflow_ui_v2_implementation: NOT_STARTED
related_ui_pull_request: 77
ui_dependency_status: DRAFT_UNMERGED_VISUAL_APPROVAL_REQUIRED
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
grill_counter: 5_of_10
```

## 활성 주문 UX 방향

```text
글자 그리기 → 회로 배치 → 주문 사용
```

- 글자 그리기: 직접 필기·인식·획득·보관함 저장.
- 회로 배치: 보관함/스톡에서 같은 수의 최대 5개 준비 글자를 사용해 `FIVE_POINT_STAR` 회로를 설계하고 글자만 소비해 완성 주문을 만든다.
- 주문 사용: 대상 키워드를 선택하고 최종 성공률·효과·위험·마나를 확인한 뒤 실제 판정을 실행한다.

공통 경제 재화는 금화, 주문 비용은 마나다. 핵심 글자는 열·흐름·보호·냉각·수복, 보조 글자는 집중·분산·안정·지속·증폭이다.

## 현재 작업

설계와 10개 TDD 작업 계획은 PR #78로 main에 병합되었다. 제품 구현은 아직 시작하지 않았다. 다음 선행 조건은 PR #77 UI Kit의 별도 시각 승인·병합 또는 이를 기반으로 한 stacked Draft 구현 PR이다.

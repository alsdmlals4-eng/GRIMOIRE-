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
ui_kit_main_sync: GR-SYNC-20260806-08-STAR-UI-KIT-V1-MAIN
ui_kit_main_merge: 8165ac983a8236bd780ac0ac0af1c121d36efd67
latest_decision: GM-SPELL-WORKFLOW-UI-V2-01
spell_workflow_main_sync: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2-MAIN
spell_workflow_main_merge: 6c39ab683fe7f4cd15fbcdb50bc4cee153deebec
current_gate: SPELL_WORKFLOW_UI_V2_READY_FOR_TDD
written_spec_review: USER_APPROVED
canon_status: SYNCED_TO_MAIN_PLAN_AND_UI_KIT_COMPLETE
existing_runtime: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
ui_kit_status: SYNCED_TO_MAIN_AUTOMATED_RENDER_PASS
ui_kit_pull_request: 77
ui_kit_exact_head: 64116046ab17adac81ce4d238ebf19ddd2ec2293
spell_workflow_ui_v2_implementation_plan: COMPLETE
implementation_plan_path: docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md
spell_workflow_ui_v2_implementation: NOT_STARTED
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
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

## UI 기반 상태

PR #77의 `GrimoireThemeFactory`, `StarCircuitBoard`, 공통 SVG 5종, 렌더·권리 검증은 main에 병합되었다. 후속 화면은 이를 재사용하며 별도 테마를 복제하지 않는다.

자동 렌더는 1280×720 GL Compatibility 구현 증거다. 실제 Android/iOS, 성능, Screen Reader, 사람 시각 검증과 최종 아트 승인은 아직 실행하지 않았다.

## 현재 작업

설계와 10개 TDD 작업 계획, 공용 UI Kit 선행 조건이 모두 main에 반영되었다. 다음 우선순위는 main 기반 별도 Draft TDD 구현 PR을 열고 계획의 Task 1부터 RED→GREEN으로 실행하는 것이다.

# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
current_branch: agent/spell-workflow-ui-v2-design
platform: MOBILE_LANDSCAPE_FIXED
runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
runtime_main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
validation_main_sync: GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN
validation_merge_commit: 292d2b850b38945e404f81dbcf209220067729d2
latest_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_design_sync: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2
working_pull_request: 78
current_gate: SPELL_WORKFLOW_UI_V2_WRITTEN_SPEC_REVIEW
canon_status: SYNCED_TO_WORKING_BRANCH_PENDING_MERGE
product_project: CREATED
existing_runtime: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
spell_workflow_ui_v2_implementation: NOT_STARTED
runtime_validation: EXISTING_RUNTIME_AUTOMATED_HEADLESS_PASS
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
grill_counter: 5_of_10
```

## 활성 주문 UX 방향

```text
글자 그리기
→ 회로 배치
→ 주문 사용
```

- 글자 그리기: 직접 필기·인식·획득·보관함 저장.
- 회로 배치: 보관함/스톡에서 같은 수의 최대 5개 준비 글자를 사용해 별형 회로를 설계하고, 글자 소비로 완성 주문을 만든다.
- 주문 사용: 대상 키워드를 선택하고 대상 적용 최종 성공률·효과·위험·마나를 확인한 뒤 실제 판정을 실행한다.

사건 상태 카드는 상황 설명 Overlay를 열며 해결 목표까지만 알려주고 정답 글자 조합은 노출하지 않는다.

## 자원·글자 정본

- 공통 경제 재화: 금화.
- 주문 사용 비용: 마나.
- 보라색 보석·프리미엄 재화: 사용하지 않음.
- 핵심: 열·흐름·보호·냉각·수복.
- 보조: 집중·분산·안정·지속·증폭.
- 보관함 준비 수 = 스톡 준비 수, 각각 최대 5.

## 현재 작업

설계 정본은 Draft PR #78에 있다. 사용자가 작성된 Spec을 검토하기 전에는 구현 계획·제품 코드·Scene 변경을 시작하지 않는다. PR #77은 공용 UI Kit 범위로 유지한다.

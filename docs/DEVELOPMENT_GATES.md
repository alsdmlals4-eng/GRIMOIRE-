# GRIMOIRE 개발·기획 게이트

```yaml
runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
runtime_main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
validation_main_sync: GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN
validation_merge_commit: 292d2b850b38945e404f81dbcf209220067729d2
latest_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_design_sync: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2
working_pull_request: 78
current_gate: SPELL_WORKFLOW_UI_V2_IMPLEMENTATION_PLAN
written_spec_review: USER_APPROVED
layout: FIVE_POINT_STAR
canon_status: USER_APPROVED_MERGE_AUTHORIZED
existing_runtime: AUTOMATED_HEADLESS_PASS
spell_workflow_ui_v2_implementation_plan: IN_PROGRESS
spell_workflow_ui_v2_implementation: NOT_STARTED
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
```

## Gate 0–12 — 기존 별형 Runtime과 검증 Pack

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 `FIVE_POINT_STAR`·숙련도·Typed Glyph Stock·Atomic Commit·GR-TEST-033 실행 Pack은 보존한다. 실제 Android/iOS·Screen Reader·Performance·Human 실행은 계속 `NOT_RUN`이다.

## Gate 13 — 주문 3단계 UX/UI v2 설계

Draft PR #78에서 다음을 정본화했다.

```text
1. 글자 그리기 → Vault 획득
2. 회로 배치 → 글자 예약·Preview·글자 소비·완성 주문 생성
3. 주문 사용 → Target·Final Preview·마나 소비·판정
```

추가 계약:

- 사건 상태 Overlay는 해결 목표까지만 제공하고 정답 조합을 숨긴다.
- 보관함 준비 수와 스톡 준비 수는 같고 각각 최대 5개다.
- 핵심 5종·보조 5종을 역할별로 구분한다.
- 공통 재화는 금화, 주문 비용은 마나다.
- 마나는 예상 비용 영역에 한 번만 표시한다.
- 2단계 기본 성공률과 3단계 대상 적용 성공률을 분리한다.

상태는 `USER_WRITTEN_SPEC_APPROVED`다.

## Gate 14 — 구현 계획

2026-08-06 19:48 KST 사용자 승인으로 활성화되었다. 실제 저장소 구조·기존 Runtime API·PR #77 UI Kit 의존성을 기준으로 TDD 작업을 독립 검토 가능한 단위로 분해한다.

계획 경로:

`docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md`

## Gate 15 — TDD 구현

별도 구현 PR에서 다음 순서로 진행한다.

```text
RED 계약
→ 완성 주문 모델·보관소
→ 회로 확정과 글자 소비 분리
→ 주문 사용과 마나·결과 적용 분리
→ 3개 Screen·Incident Overlay
→ Vault/Stock Equal-count Source Panel
→ 자동 렌더·접근성·회귀
→ 적대적 재검토
```

PR #77에는 공용 UI Kit만 유지하며 3단계 전체 기능을 섞지 않는다. 구현 브랜치는 PR #77의 공용 UI 컴포넌트를 소비하되, PR #77이 main에 병합되기 전에는 stacked Draft 상태로만 유지한다.

## Godot Gate

- `project.godot`
- 현재 Main Scene: `res://src/ui/star_circuit_harness.tscn`
- Godot `4.7.1`
- 1280×720 Mobile Landscape / GL Compatibility
- UI v2 Main Scene 전환은 구현 PR의 전체 자동 회귀와 렌더 증거가 PASS하기 전 금지

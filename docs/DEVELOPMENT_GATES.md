# GRIMOIRE 개발·기획 게이트

```yaml
runtime_main_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
runtime_main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
validation_main_sync: GR-SYNC-20260806-05-STAR-PHYSICAL-VALIDATION-MAIN
ui_kit_main_sync: GR-SYNC-20260806-08-STAR-UI-KIT-V1-MAIN
ui_kit_main_merge: 8165ac983a8236bd780ac0ac0af1c121d36efd67
latest_decision: GM-SPELL-WORKFLOW-UI-V2-01
spell_workflow_main_sync: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2-MAIN
spell_workflow_main_merge: 6c39ab683fe7f4cd15fbcdb50bc4cee153deebec
current_gate: SPELL_WORKFLOW_UI_V2_READY_FOR_TDD
written_spec_review: USER_APPROVED
layout: FIVE_POINT_STAR
canon_status: SYNCED_TO_MAIN_PLAN_AND_UI_KIT_COMPLETE
existing_runtime: AUTOMATED_HEADLESS_PASS
ui_kit_status: SYNCED_TO_MAIN_AUTOMATED_RENDER_PASS
spell_workflow_ui_v2_implementation_plan: COMPLETE
implementation_plan_path: docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md
spell_workflow_ui_v2_implementation: NOT_STARTED
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
```

## Gate 0–12 — 기존 별형 Runtime과 검증 Pack

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 `FIVE_POINT_STAR`·숙련도·Typed Glyph Stock·Atomic Commit·GR-TEST-033 실행 Pack은 보존한다. 실제 Android/iOS·Screen Reader·Performance·Human 실행은 계속 `NOT_RUN`이다.

## Gate 13 — 주문 3단계 UX/UI v2 설계

완료 및 main 병합. `글자 그리기 → 회로 배치 → 주문 사용`으로 책임을 분리하며, Stage 2는 글자만 소비하고 Stage 3는 마나와 결과만 적용한다.

## Gate 14 — 구현 계획

완료 및 main 병합. `docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md`에 Core 분리, 세 화면, 접근성, 렌더 증거, 정본 동기화를 10개 TDD 작업으로 작성했다.

## Gate 14.5 — 공용 UI Kit v1

PR #77, merge `8165ac983a8236bd780ac0ac0af1c121d36efd67`로 main에 병합했다.

- `GrimoireThemeFactory`
- `StarCircuitBoard`
- Navy/Gold/Cyan 공용 Theme Variation
- 공통 SVG 5종과 provenance
- Godot import·Texture2D·1280×720 GL Compatibility 렌더 계약

자동 검증은 PASS했지만 실제 기기·사람 시각 검증과 최종 아트 승인은 `NOT_RUN / NOT_CLAIMED`다.

## Gate 15 — TDD 구현

아직 시작하지 않았다. main 기반 별도 Draft PR에서 다음 순서로 진행한다.

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

UI Kit 선행 의존성은 해소되었다. 구현 PR은 main에서 분기하고 PR #77의 공용 테마와 컴포넌트를 직접 재사용하며 복제하지 않는다.

## Godot Gate

- `project.godot`
- 현재 Main Scene: `res://src/ui/star_circuit_harness.tscn`
- Godot `4.7.1`
- 1280×720 Mobile Landscape / GL Compatibility
- 현재 Main Scene에서 UI Kit v1 확인 가능
- UI v2 Main Scene 전환은 구현 PR의 전체 자동 회귀와 렌더 증거가 PASS하기 전 금지

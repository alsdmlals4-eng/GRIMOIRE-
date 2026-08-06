# GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2-MAIN

```yaml
sync_id: GR-SYNC-20260806-09-SPELL-WORKFLOW-UI-V2-MAIN
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
date: 2026-08-06
written_spec_approved_at: 2026-08-06T19:48:00+09:00
design_pull_request: 78
design_exact_head: 392175aae0dfef674f943265f4f6965afa6c2ff4
main_merge_commit: 6c39ab683fe7f4cd15fbcdb50bc4cee153deebec
status: SYNCED_TO_MAIN_PLAN_COMPLETE_READY_FOR_TDD
implementation: NOT_STARTED
related_ui_pull_request: 77
ui_dependency_status: DRAFT_UNMERGED_VISUAL_APPROVAL_REQUIRED
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
screen_reader_validation: NOT_RUN
human_validation: NOT_RUN
full_vertical_slice: NOT_RUN
```

## 반영 범위

- `글자 그리기 → 회로 배치 → 주문 사용` 3단계 UX 정본
- Stage 2 글자 소비와 Stage 3 마나·결과 적용 분리
- Vault/Stock 준비 수 동일, 각각 1~5개
- 핵심 5종·보조 5종과 BURST→AMPLIFY 과부하 해석
- Gold-only 공통 경제, Mana-only 주문 비용
- Incident Overlay의 정답 비노출과 상태 복원 계약
- 10개 TDD 작업 구현 계획

## 검증

PR #78 exact head `392175aae0dfef674f943265f4f6965afa6c2ff4`에서 다음이 PASS했다.

```yaml
planning_base_run: 31095736655
star_runtime_run: 31095736751
physical_pack_run: 31095737393
godot_toolchain_run: 31095736654
review_threads: 0
```

## 경계

제품 `src/**`는 변경하지 않았다. UI v2 구현·새 Scene·새 테스트·실기기·사람 검증은 시작하지 않았다. PR #77 UI Kit를 복제하거나 병합하지 않았다.

## 다음 Gate

PR #77을 별도 시각 검토 후 병합하거나, `agent/star-ui-kit-v1` 기반 stacked Draft TDD 구현 PR을 연다.

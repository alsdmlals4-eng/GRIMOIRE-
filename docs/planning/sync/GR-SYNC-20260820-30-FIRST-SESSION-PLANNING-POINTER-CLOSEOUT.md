# GR-SYNC-20260820-30-FIRST-SESSION-PLANNING-POINTER-CLOSEOUT

```yaml
sync_id: GR-SYNC-20260820-30-FIRST-SESSION-PLANNING-POINTER-CLOSEOUT
sync_type: CURRENT_POINTER_CLOSEOUT_ONLY
project: GRIMOIRE
source_main_before_change: 526d5140d604d073528e3b12f12ead3ecb787e84
base_main_observed: 369e7173c6a21ec2c7e70cef5e11f799a5d7dbc0
base_project_pin: v9.4.3
base_pin_changed: false
latest_approved_refinement: GM-FROSTBLOOM-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER-01
latest_approved_refinement_sync: GR-SYNC-20260820-29-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER
completed_review_axis: FROSTBLOOM_FIRST_SESSION_END_TO_END_REVIEW
planning_completion_state: READY_PENDING_USER_EXPLICIT_DECLARATION
USER_EXPLICIT_PLANNING_COMPLETION: NOT_DECLARED
TASK2_CLOSE_ALLOWED: false
NO_NEW_PRODUCT_DECISION: true
product_scope_change: NONE
runtime_mutation: NONE
Human: NOT_RUN
Device: NOT_RUN
Performance: NOT_RUN
Full Slice: NOT_RUN
```

## 목적

PR #146 병합 이후 실제 최신 기획 refinement와 `CURRENT_CONFIRMED_DECISIONS.md` 상단 pointer 사이에 남아 있던 정본 지연을 닫는다. 이 sync는 게임 규칙·콘텐츠·밸런스·UI 동작을 새로 결정하지 않는다.

## 반영 범위

- `current_planning_refinement`를 `GM-FROSTBLOOM-FIRST-SESSION-PERSISTENT-HANDOFF-ELASTIC-BUFFER-01`로 승격한다.
- `current_planning_refinement_sync`를 Sync29로 승격한다.
- 이미 수행 완료된 `FROSTBLOOM_FIRST_SESSION_END_TO_END_REVIEW`를 `next_planning_axis`에서 제거한다.
- 새 기획축을 발명하지 않고 `NONE_PENDING_USER_EXPLICIT_PLANNING_COMPLETION_DECLARATION`으로 둔다.
- 사용자의 명시적 “기획 완료” 선언이 아직 없으므로 `planning_completion_state`는 `READY_PENDING_USER_EXPLICIT_DECLARATION`이며 TASK-2는 닫지 않는다.
- 이번 작업에서 관측한 Base main SHA만 갱신하고 `base_project_pin: v9.4.3`은 변경하지 않는다.

## 변경하지 않는 것

```text
NO_NEW_PRODUCT_DECISION
NO_NEW_GAMEPLAY_CONTENT
NO_RUNTIME_IMPLEMENTATION_CHANGE
NO_TASK8_CHANGE
NO_BALANCE_CHANGE
NO_HUMAN_EVIDENCE_PROMOTION
NO_DEVICE_EVIDENCE_PROMOTION
NO_PERFORMANCE_EVIDENCE_PROMOTION
NO_FULL_SLICE_EVIDENCE_PROMOTION
```

## 완료 조건

1. dedicated pointer closeout regression GREEN.
2. 기존 planning/runtime/current-state 회귀 GREEN.
3. exact-head main concurrency 확인.
4. PR squash merge.
5. 병합 SHA를 Notion Project Home / TASK-2에 동기화하고 readback.
6. TASK-2는 사용자 명시 완료 선언 전까지 `진행 중` 유지.

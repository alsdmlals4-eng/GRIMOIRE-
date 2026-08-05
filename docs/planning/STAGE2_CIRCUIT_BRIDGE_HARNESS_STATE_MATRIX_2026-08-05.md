# Stage 2 Circuit Bridge Harness State Matrix — 2026-08-05

## 계약

```yaml
decision_id: GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
sync_id: GR-SYNC-20260805-06-STAGE2-HARNESS-UX-HX
status: STATE_MATRIX_COMPLETE
artifact_class: LOW_FIDELITY_VALIDATION_HARNESS_NOT_FINAL_ART
human_execution: NOT_RUN
```

## 공통 불변 조건

```text
TOP_OBJECTIVE_THREAT_SITUATION_PERSISTENT
LEFT_MAIN_S1_S2_S3_READ_ONLY_RAIL
CENTER_TARGET_AND_3X3_CIRCUIT
RIGHT_WRITING_FOCUS_PANEL
BOTTOM_HP_MANA_SOURCE_PREVIEW_COMMIT
SCENARIO_CONTEXT_SURVIVES_RECOGNITION_RETRY
NO_AUTOMATIC_SOLUTION_OR_BEST_GLYPH_RECOMMENDATION
COLOR_IS_NOT_THE_ONLY_STATE_SIGNAL
```

모든 상태에서 Objective·Threat·Situation을 유지한다. Source, Circuit Draft, Recognition 결과는 상태 전환 중 원자적으로 보존한다.

## 상태표

| 상태 | 화면·초점 | 허용 행동 | 차단 행동 | 로그 | 종료 조건 |
|---|---|---|---|---|---|
| `SCENARIO_BRIEF` | 상단 상황과 중앙 대상 강조. Rail·Canvas·Commit 비활성 | 상황 읽기, 목표·위협 확인, 시작 | 글자 입력, 회로 연결, Commit | `scenario_viewed`, `objective_recall_prompted` | 참가자가 시작 선택 |
| `INTENT_AND_SOURCE_SELECT` | Rail과 Source Selector 활성 | Main/Support 의미 선택, Vault/Stock 출처 선택, 대상 확인 | Commit, 자동 추천 | `intent_selected`, `source_selected`, `target_inspected` | 최소 Main 1과 대상 존재 |
| `WRITING_FOCUS` | 우측 Canvas가 Pointer 독점 | 획 입력, 취소, 초기화, 후보 직접 선택, Retry | 전역 Drag, 회로 Pan, Commit | `recognition_started`, `stroke_completed`, `candidate_shown`, `retry_requested` | 승인된 Exact Glyph 또는 취소 |
| `CIRCUIT_EDIT` | 중앙 3×3과 대상 활성 | 노드 배치, 8방향 인접 연결, Tap 대안, 삭제, 출처 수정 | 자동 완성, Best Glyph, Commit | `node_placed`, `edge_added`, `circuit_invalid_reason` | 회로가 Preview 가능 |
| `PREVIEW_READY` | 하단 Preview와 비용·위험 강조 | Preview 읽기, 회로/출처 수정, Commit 확인 열기 | 즉시 시스템 적용 | `preview_opened`, `preview_reason_viewed` | Commit 확인 또는 편집 복귀 |
| `COMMIT_CONFIRM` | 요약 Dialog. Confirm/Cancel 분리 | Confirm, Cancel | 배경 회로 편집, Stroke 입력 | `commit_dialog_opened`, `commit_confirmed`, `commit_cancelled` | Confirm 또는 Cancel |
| `SYSTEM_RESOLVE` | 입력 잠금, 결과 계산 상태 | 기다리기, 접근성 상태 읽기 | 중복 Confirm, 편집, 추가 저장 | `commit_started`, `resource_reserved`, `result_resolved` | 원자적 성공 또는 Safe Recovery |
| `RESULT_EXPLAIN` | 결과·대가·Grimoire 요약 | 결과 읽기, 인과 설명, 다음 상황 | 동일 Commit 재실행 | `result_viewed`, `consequence_explained`, `scenario_completed` | 진행자 다음 단계 |
| `ERROR_SAFE_RECOVERY` | 오류 제목·원인·복구 행동 | 직전 편집 상태 복원, Retry, Session 중단 | 자동 Commit, 자동 후보 확정 | `error_shown`, `recovery_selected`, `hard_stop_raised` | 복원 또는 Hard Stop 종료 |

## 입력 소유권

```text
ACTIVE_STROKE_OWNER_WRITING_CANVAS
```

| 입력 | 소유 상태 | 규칙 |
|---|---|---|
| Stroke Pointer | `WRITING_FOCUS` | 획 시작부터 종료까지 Canvas 독점 |
| Circuit Drag | `CIRCUIT_EDIT` | Active Stroke가 없을 때만 허용 |
| Tap Source | `INTENT_AND_SOURCE_SELECT`, `CIRCUIT_EDIT` | 글자별 명시적 Vault/Stock 선택 |
| Preview | `CIRCUIT_EDIT`, `PREVIEW_READY` | 무효 이유가 있으면 읽기 가능하나 Commit 차단 |
| Confirm | `COMMIT_CONFIRM` | 별도 Tap 한 번으로만 처리, Debounce/Idempotency 필요 |
| Cancel | 모든 Modal 상태 | `CANCEL_RETURNS_WITHOUT_MUTATION` |

## Commit 안전 계약

```text
COMMIT_REQUIRES_SEPARATE_CONFIRMATION
CANCEL_RETURNS_WITHOUT_MUTATION
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
```

Commit 가능 조건:

1. Main 정확히 1개.
2. Support 0~2개.
3. Target 1~4개.
4. 전체 노드 도달 가능.
5. Target은 Terminal Leaf.
6. 모든 사용 글자에 Vault 또는 Stock 출처가 명시됨.
7. Recognition revision이 최신이고 선택 글자와 일치함.
8. 비용·위험 Preview가 생성됨.
9. Confirm Dialog에서 별도 확인됨.

Confirm Event는 Idempotency Key 1개와 연결한다. 중복 입력은 두 번째 결과·비용을 만들지 않는다.

## Recognition Retry 상태 보존

```text
SCENARIO_CONTEXT_SURVIVES_RECOGNITION_RETRY
```

Retry 전후 보존:

- Objective·Threat·Situation.
- Pressure Clock 상태.
- 대상 선택.
- 이미 유효한 다른 글자와 출처.
- 3×3 회로 Draft.
- 참가자 Intent 메모.

Retry 시 폐기:

- 실패한 Stroke Buffer.
- stale 후보.
- 승인되지 않은 임시 Glyph Instance.

## 모션·접근성 상태

```text
ANDROID_TOUCH_TARGET_48DP
IOS_TOUCH_TARGET_44PT
NON_DRAG_ALTERNATIVE_REQUIRED
TRANSITION_DURATION_120_TO_180_MS_TEST_VALUE
REDUCED_MOTION_ZERO_DURATION_STATE_SWAP
NO_MOTION_DURING_ACTIVE_STROKE
```

| 전환 | 기본 HX | Reduced Motion |
|---|---|---|
| Brief → Select | 160ms Fade | 즉시 교체 |
| Select → Writing | 140ms Panel 강조 | 즉시 Focus Border |
| Writing → Retry | 정적 오류 윤곽+텍스트 | 동일 |
| Circuit → Preview | 160ms 하단 확장 | 즉시 표시 |
| Preview → Confirm | 120ms Dialog Fade | 즉시 표시 |
| Resolve → Result | 180ms 결과 강조 | 즉시 결과 문구 |

Active Stroke와 Pressure Clock에는 장식 Motion을 추가하지 않는다.

## 이벤트 Stream 분리

```text
RECOGNITION_EVENT_STREAM
CORE_LOOP_EVENT_STREAM
MODERATOR_INTERVENTION_EVENT
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
ANONYMOUS_PARTICIPANT_ID_ONLY
NO_RAW_PERSONAL_IDENTIFIER
ARTIFACT_SHA_AND_FIXTURE_ID_REQUIRED
```

Recognition Stream 예:

- attempt index, glyph ID, hand, device class.
- first/post-feedback 구분.
- accepted/retry/blocked와 reason code.
- elapsed time, revision ID, candidate ID.

Core Loop Stream 예:

- scenario/fixture ID.
- intent·source·target·circuit edit events.
- Preview opened, invalid reason viewed.
- Confirm/Cancel, result, consequence explanation.

Moderator Stream 예:

- intervention timestamp.
- neutral clarification / UI navigation / prohibited solution prompt.
- intervention 전·후 결과 분리.

## Hard Stop Routing

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
DUPLICATE_SAVE_OR_REWARD_ZERO_HARD_STOP
STALE_RESULT_APPLICATION_ZERO_HARD_STOP
```

Hard Stop은 `ERROR_SAFE_RECOVERY`에서 Session 중단으로 이동하고, 자동 재시도나 다음 Scenario 진행을 금지한다.

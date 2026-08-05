# GR-TEST-032 사람·실기기 실행 Runbook

## 현재 상태

```yaml
test_id: GR-TEST-032
decision_id: GM-GLYPH-HUMAN-CIRCUIT-BRIDGE-01
approved_option: C_STAGED_RECOGNITION_THEN_CORE_LOOP
status: READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN
participants: 6
participant_count_status: TEST_VALUE
same_participant_across_stages: true
break_between_stages_minutes: 10
scored_attempts_per_participant: 24
planned_total_scored_attempts: 144
runtime_glyphs: EXACTLY_6_RUNTIME_GLYPHS
human_device_validation: HUMAN_DEVICE_VALIDATION_NOT_RUN
human_end_to_end_core_loop: HUMAN_END_TO_END_CORE_LOOP_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_REPRESENTATIVENESS_NOT_RUN
runtime_expansion_7_plus: RUNTIME_EXPANSION_7_PLUS_BLOCKED
merge: MERGE_NOT_AUTHORIZED
```

이 문서는 실제 사람과 물리 기기로 `GR-TEST-032`를 실행하기 위한 운영 패키지다. 준비 완료는 Human PASS가 아니다.

## 검증 목적

1. 실제 손가락 입력에서 Runtime 6종을 의도대로 선택·저장할 수 있는지 확인한다.
2. 실패 원인을 인식 입력·의미 이해·자원 출처·회로 문법·Preview 이해로 분리한다.
3. 인식 과정이 상황 판단과 Commit 책임을 방해하는지 확인한다.
4. 참가자가 의미 선택·회로·결과·대가의 인과를 설명할 수 있는지 확인한다.

## 실행 전 필수 조건

- PR #65 Stage 2 Harness 자동 Gate PASS.
- Artifact commit SHA와 빌드 ID 기록.
- 기기별 Device Preflight 완료.
- 참가자 익명 ID P01~P06만 사용.
- 이름·연락처·계정명 등 PII 저장 금지.
- 손 순서 교차 배치.

## 참가자·기기 배치 — TEST_VALUE

```yaml
participants: 6
participant_ids: [P01, P02, P03, P04, P05, P06]
required_phone_classes: [NARROW_LANDSCAPE_16_9_TO_18_9, TALL_LANDSCAPE_19_5_9_TO_20_9]
android_physical_devices_minimum: 2
ios_physical_smoke: RECOMMENDED_IF_IOS_TARGET_IS_ACTIVE
hands: [DOMINANT, NON_DOMINANT]
hand_order: COUNTERBALANCED
```

| 참가자 | Stage 1 첫 손 | Stage 2 주 입력 손 | 기기군 |
|---|---|---|---|
| P01 | Dominant | Non-dominant | Narrow |
| P02 | Non-dominant | Dominant | Tall |
| P03 | Dominant | Non-dominant | Tall |
| P04 | Non-dominant | Dominant | Narrow |
| P05 | Dominant | Non-dominant | Narrow 또는 iOS Smoke |
| P06 | Non-dominant | Dominant | Tall 또는 iOS Smoke |

## 전체 흐름

```text
DEVICE_PREFLIGHT → CONSENT_AND_ANONYMOUS_ID → STAGE_1_RECOGNITION_DIAGNOSTIC
→ STAGE_1_HARD_STOP_CHECK → SAME_PARTICIPANT_WITH_BREAK
→ STAGE_2_CORE_LOOP_BRIDGE → RESULT_EXPLANATION
→ FATIGUE_AND_ACCESSIBILITY_REPORT → DATA_COMPLETENESS_CHECK → ANALYSIS
```

## Stage 1 — Recognition Diagnostic

```yaml
runtime_glyph_ids: [HEAT, PROTECT, FLOW, FOCUS, DISPERSE, BURST]
warmup_attempts: 2
scored_attempts_per_glyph_per_hand: 2
scored_attempts_per_participant: 24
planned_total_scored_attempts: 144
rest_after_scored_attempts: 12
```

- Warm-up 2회는 집계 제외.
- 글자·손 순서를 균형화하고 각 글자·각 손 2회 기록.
- `first_attempt`와 `post_feedback`을 분리.
- 12회·24회 피로 1~5 기록.
- 모든 진행자 개입은 `MODERATOR_INTERVENTION_EVENT`로 기록.

### Stage 1 Hard Stop

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
STALE_RESULT_APPLICATION_ZERO_HARD_STOP
MISMATCH_SAVE_ZERO_HARD_STOP
DUPLICATE_SAVE_ZERO_HARD_STOP
DATA_CORRUPTION_ZERO_HARD_STOP
```

Hard Stop 발생 시 Stage 2 진입을 중단하고 `STOP_REVIEW_REQUIRED`로 표시한다. First-attempt 정확도 저하만으로 Stop하지 않고 글자·손·기기별 원인을 분리한다.

## 휴식

최소 10분 휴식. 점수·순위·다른 참가자 결과·추가 연습을 제공하지 않는다.

## Stage 2 — Core Loop Bridge

상황 A와 B를 모두 실행하며 한 가지 정답을 강요하지 않는다.

### 상황 A — 비전투 보호·조절

목표·보존 대상 확인 → Main/Support 의미 선택 → Vault/Stock 출처 명시 → 3×3 회로 → Commit 전 의도 설명 → Preview 비용·위험 설명 → 별도 Confirm → 결과·부작용 설명.

### 상황 B — 압박이 있는 현장 대응

위협·대상·시간 압박 확인 → 다른 의미 조합 시도 → Retry 시 Context 보존 확인 → Preview/Confirm/Commit → 결과·대가 Grimoire 요약.

### Stage 2 Hard Stop

```text
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
DUPLICATE_COST_OR_RESULT_ZERO_HARD_STOP
MODERATOR_SOLUTION_PROMPT_ZERO_HARD_STOP
```

의도하지 않은 Commit, 중복 비용·결과, 진행자 정답 제시, 치명적 접근성 실패가 있으면 다음 상황을 진행하지 않는다.

## 기록·원시 증거 무결성

```text
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
RECOGNITION_EVENT_STREAM
CORE_LOOP_EVENT_STREAM
MODERATOR_INTERVENTION_EVENT
ANONYMOUS_PARTICIPANT_ID_ONLY
ARTIFACT_SHA_REQUIRED
SOURCE_ATTEMPT_SHA256_REQUIRED
SOURCE_STAGE2_SHA256_REQUIRED
SOURCE_RECORD_COUNT_MUST_MATCH_AGGREGATE
```

- 원시 Stage 1 Attempt 파일을 불변 형태로 보관하고 SHA-256을 계산한다.
- `source_attempt_record_count`는 `scored_attempt_count`와 정확히 같아야 한다.
- Stage 2 관찰 원본의 SHA-256과 레코드 수를 별도 기록한다.
- `source_stage2_observation_count`는 `scenario_completion_count`와 정확히 같아야 한다.
- 분석기는 위 해시나 개수 일치가 없으면 완료 세션을 거부한다.
- 손·기기·글자별 결과와 진행자 개입 전·후 결과를 별도 집계한다.

## 실행 후 데이터 완전성

- P01~P06 형식과 중복 여부 확인.
- 모든 Scored Attempt의 기기·손·글자·first/post 결과 확인.
- Stage 2 두 상황의 의도·출처·회로·Preview·Commit·결과 설명 확인.
- Hard Stop 명시와 PII 부재 확인.
- 실행 전 `HUMAN_EXECUTION_NOT_RUN`을 임의 PASS로 바꾸지 않는다.

## 결과 분류

- `PROMISING`: Hard Stop 0, 입력 문제와 핵심 판단 분리, 핵심 인과 대부분 자력 설명.
- `TUNE`: 구조는 이해하나 특정 글자·손·기기·문구에 반복 마찰.
- `REWORK`: 인식과 회로 문제를 구분하지 못하거나 Preview가 선택을 설명하지 못함.
- `STOP`: accepted false, accidental Commit, 중복 비용·결과, 저장 손상, 중대 접근성 실패.

모든 임계값은 TEST_VALUE이며 `PROMISING`도 Human PASS·출시 PASS·병합 승인이 아니다.

## 현재 경계

```text
READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN
HUMAN_DEVICE_VALIDATION_NOT_RUN
HUMAN_END_TO_END_CORE_LOOP_NOT_RUN
FULL_VERTICAL_SLICE_REPRESENTATIVENESS_NOT_RUN
RUNTIME_EXPANSION_7_PLUS_BLOCKED
MERGE_NOT_AUTHORIZED
```

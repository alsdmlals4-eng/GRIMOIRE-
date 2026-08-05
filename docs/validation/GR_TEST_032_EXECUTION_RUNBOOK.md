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

이 문서는 실제 사람과 물리 기기로 `GR-TEST-032`를 실행하기 위한 운영 패키지다. 문서와 템플릿 준비 완료는 Human PASS가 아니다. 실행 결과가 입력되기 전에는 모든 사람·기기 상태를 `NOT_RUN`으로 유지한다.

## 검증 목적

1. 실제 손가락 입력에서 Runtime 6종을 의도대로 선택·저장할 수 있는지 확인한다.
2. 실패 원인을 인식 입력·의미 이해·자원 출처·회로 문법·Preview 이해로 분리한다.
3. 인식 과정이 상황 판단과 Commit 책임을 방해하는지 확인한다.
4. 참가자가 자신의 의미 선택·회로·결과·대가의 인과를 설명할 수 있는지 확인한다.

## 실행 전 필수 조건

- PR #65 Stage 2 Harness 자동 Gate가 PASS 상태다.
- 테스트 Artifact의 commit SHA와 실행 빌드 식별자를 기록한다.
- `GR_TEST_032_DEVICE_PREFLIGHT.md`의 필수 항목을 기기별로 완료한다.
- 참가자에게 익명 ID `P01`~`P06`만 부여한다.
- 이름·전화번호·이메일·계정명 등 원시 개인식별정보를 저장하지 않는다.
- 화면 녹화 사용 시 참가자 동의를 현장 운영 체계에서 별도로 확보하되, 저장 데이터에는 익명 ID만 남긴다.
- 손 순서는 참가자별로 교차 배치한다.

## 참가자·기기 배치 — TEST_VALUE

```yaml
participants: 6
participant_ids: [P01, P02, P03, P04, P05, P06]
required_phone_classes:
  - NARROW_LANDSCAPE_16_9_TO_18_9
  - TALL_LANDSCAPE_19_5_9_TO_20_9
android_physical_devices_minimum: 2
ios_physical_smoke: RECOMMENDED_IF_IOS_TARGET_IS_ACTIVE
hands:
  - DOMINANT
  - NON_DOMINANT
hand_order: COUNTERBALANCED
```

권장 교차 배치:

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
DEVICE_PREFLIGHT
→ CONSENT_AND_ANONYMOUS_ID
→ STAGE_1_RECOGNITION_DIAGNOSTIC
→ STAGE_1_HARD_STOP_CHECK
→ SAME_PARTICIPANT_WITH_BREAK
→ STAGE_2_CORE_LOOP_BRIDGE
→ RESULT_EXPLANATION
→ FATIGUE_AND_ACCESSIBILITY_REPORT
→ DATA_COMPLETENESS_CHECK
→ ANALYSIS
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

1. 참가자에게 글자 이름과 의미를 보여준다.
2. Warm-up 2회는 점수에 포함하지 않는다.
3. Runtime 6종을 손·글자 순서가 편향되지 않도록 무작위 또는 사전 균형 순서로 제시한다.
4. 각 글자·각 손마다 Scored Attempt 2회를 실행한다.
5. 첫 시도 결과를 `first_attempt`에 기록한다.
6. Retry 안내 후 한 번 재시도한 결과는 `post_feedback`에 별도 기록한다.
7. 12회와 24회 시점에 5점 피로 자기보고를 받는다.
8. 진행자 개입은 `MODERATOR_INTERVENTION_EVENT`로 별도 기록한다.

### Stage 1 Hard Stop

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
STALE_RESULT_APPLICATION_ZERO_HARD_STOP
MISMATCH_SAVE_ZERO_HARD_STOP
DUPLICATE_SAVE_ZERO_HARD_STOP
DATA_CORRUPTION_ZERO_HARD_STOP
```

다음 중 하나라도 발생하면 해당 참가자의 Stage 2 진입을 중단하고 전체 세션을 `STOP_REVIEW_REQUIRED`로 표시한다.

- 승인된 오인식 1건 이상.
- stale 결과 반영 1건 이상.
- 선택/인식 불일치 저장 1건 이상.
- 중복 Vault 생성 1건 이상.
- 크래시·저장 손상.
- 진행자가 정답을 알려주지 않으면 진행할 수 없는 구조적 막힘.

First-attempt 정확도 저하만으로 Hard Stop 처리하지 않는다. 글자·손·기기별 원인을 분리해 `TUNE` 또는 `REWORK` 후보로 남긴다.

## 휴식

```text
SAME_PARTICIPANT_WITH_BREAK
```

- 최소 10분 휴식한다.
- Stage 1 점수·순위·다른 참가자 결과를 알려주지 않는다.
- 연습을 추가 제공하지 않는다.
- 휴식 시작·종료 시각을 기록한다.

## Stage 2 — Core Loop Bridge

상황 A와 B를 모두 실행한다. 한 가지 정답을 강요하지 않는다.

### 상황 A — 비전투 보호·조절

1. 목표와 보존해야 할 대상을 읽는다.
2. Runtime 6종 안에서 Main/Support 의미를 선택한다.
3. 각 글자에 Exact Vault 또는 Universal Stock 출처를 명시한다.
4. 3×3 회로를 구성한다.
5. Preview 전에 의도와 의미를 말로 설명한다.
6. Preview의 비용·위험·예상 변화를 설명한다.
7. 별도 Confirm 후 Commit한다.
8. 결과와 부작용을 설명한다.

### 상황 B — 압박이 있는 현장 대응

1. 위협·대상·시간 압박을 확인한다.
2. 상황 A와 다른 의미 조합 또는 대상 연결을 시도한다.
3. Recognition Retry가 발생해도 상황·대상·출처·회로 Draft가 유지되는지 확인한다.
4. Preview와 별도 Confirm을 거쳐 Commit한다.
5. 결과와 대가를 Grimoire 요약으로 회상한다.

### Stage 2 Hard Stop

```text
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
DUPLICATE_COST_OR_RESULT_ZERO_HARD_STOP
MODERATOR_SOLUTION_PROMPT_ZERO_HARD_STOP
```

- 의도하지 않은 Commit 1건 이상.
- 중복 비용·보상·결과 1건 이상.
- 진행자가 정답·최적 해법을 제시한 세션.
- 손가락 가림·Safe Area·접근성 문제로 핵심 조작이 불가능한 경우.

## 기록 분리

```text
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
RECOGNITION_EVENT_STREAM
CORE_LOOP_EVENT_STREAM
MODERATOR_INTERVENTION_EVENT
ANONYMOUS_PARTICIPANT_ID_ONLY
ARTIFACT_SHA_REQUIRED
```

- 첫 시도와 피드백 후 결과를 합산해 약점을 숨기지 않는다.
- 손·기기·글자별 결과를 별도 집계한다.
- 진행자 개입 전·후 결과를 별도 집계한다.
- 원시 이벤트와 관찰 메모는 익명 ID와 Artifact SHA로 연결한다.

## 실행 후 데이터 완전성 확인

- 참가자 ID가 허용 형식인지 확인한다.
- 모든 Scored Attempt에 기기·손·글자·첫 시도·피드백 후 결과가 있다.
- Stage 2 두 상황의 의도·출처·회로·Preview·Commit·결과 설명이 기록됐다.
- Hard Stop 발생 여부가 명시됐다.
- 이름·연락처·계정명 등 PII가 없는지 확인한다.
- 실제 실행 전 템플릿의 `HUMAN_EXECUTION_NOT_RUN`을 PASS로 임의 변경하지 않는다.

## 결과 분류

- `PROMISING`: Hard Stop 0이며 입력 문제와 핵심 판단이 분리되고 핵심 인과를 대부분 스스로 설명한다.
- `TUNE`: 구조는 이해하지만 특정 글자·손·기기·문구·Target에 반복 마찰이 있다.
- `REWORK`: 인식 문제와 회로 문제를 구분하지 못하거나 Preview가 선택을 설명하지 못한다.
- `STOP`: 오인식 승인, accidental Commit, 중복 비용·결과, 저장 손상 또는 중대 접근성 실패가 있다.

후보 임계값은 모두 `TEST_VALUE`이며 실제 분포와 실패 원인을 본 뒤 재검토한다.

## 현재 정직한 경계

```text
READY_FOR_HUMAN_EXECUTION_HUMAN_NOT_RUN
HUMAN_DEVICE_VALIDATION_NOT_RUN
HUMAN_END_TO_END_CORE_LOOP_NOT_RUN
FULL_VERTICAL_SLICE_REPRESENTATIVENESS_NOT_RUN
RUNTIME_EXPANSION_7_PLUS_BLOCKED
MERGE_NOT_AUTHORIZED
```

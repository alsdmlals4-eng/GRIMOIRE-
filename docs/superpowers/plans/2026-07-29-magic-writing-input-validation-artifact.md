# GRIMOIRE 마법 글자 작성·인식 사람 검증 Artifact 실행 계획 — 합성 위험 재구성판

```yaml
session_packet_id: GRIMOIRE-HV-001
project: GRIMOIRE
baseline_branch: main
baseline_commit: 3db342cbf153f8bfd6b41d1a22f9296370e25fca
base_governance_commit: 9c4071c5ecefe28769b512d426442338ceb7acdd
base_governance_path: docs/knowledge/game-development/HUMAN_VALIDATION_ARTIFACT_GOVERNANCE.md
base_synthetic_governance_path: docs/knowledge/game-development/SYNTHETIC_TESTER_SIMULATION_GOVERNANCE.md
synthetic_review_source: docs/planning/GATE_2_MAGIC_WRITING_SYNTHETIC_TESTER_REPORT_2026-07-29.md
artifact_status: REWORKED_STIMULUS_READY_FOR_CARD_SESSION
human_validation: NOT_RUN
android_touch_validation: NOT_RUN
recognizer_validation: NOT_RUN
implementation_authority: NONE
```

> 현재 카드 세션은 실제 글자 인식 알고리즘이나 Android 조작감을 검증하지 않는다. 진행자가 제공하는 후보·확신 카드는 `SIMULATED_RECOGNITION_RESULT`이며 후보 확인·부분 수정·입력 실패와 설계 실패의 책임 분리 UX만 검증한다.

## 1. 결정 질문

> 플레이어가 의도 후보가 목록에 있거나 없을 때 서로 다른 복구 경로를 선택하고, 입력 의도와 인식 결과가 일치한 상태의 주문 설계 실패를 입력 실패와 구분하며, 오류 위치를 직접 알려주지 않아도 부분 수정 경로를 탐색할 수 있는가?

## 2. 단계와 주장 상한

```yaml
validation_phases:
  phase_1:
    artifact_fidelity: CARD_WITH_NON_INSTRUMENTED_DRAWING_SURFACE
    status: READY_FOR_CARD_SESSION
    measures:
      - 후보·확신 상태 이해
      - 의도 후보 포함·미포함 시 복구 선택
      - 입력 실패와 순수 주문 설계 실패 구분
      - 중립 오류 결과에서 부분 수정 경로 탐색
  phase_2:
    artifact_fidelity: ANDROID_TOUCH_PROTOTYPE
    status: NOT_BUILT
    measures:
      - 손가락 가림·오터치·한 손 사용·위험 경고 발견
  phase_3:
    artifact_fidelity: RECOGNIZER_TECHNICAL_PROTOTYPE
    status: NOT_BUILT
    measures:
      - actual recognizer accuracy
      - latency
      - confidence calibration
simulated_components:
  - SIMULATED_RECOGNITION_RESULT
  - 후보 글자와 확신 상태
  - 위치를 지목하지 않는 중립 오류 카드
scripted_components:
  - 의미 조합 판정
  - 세계 변화 결과 카드
claim_ceiling:
  can_claim:
    - 후보·확신 상태의 개념 이해 가능성
    - 후보 미포함 시 재작성·취소 경로 선택 가능성
    - 입력 실패와 주문 설계 실패 구분
    - 오류 위치를 알려주지 않은 상태의 복구 전략 후보
  cannot_claim:
    - 실제 인식 정확도·첫 시도 인식률·최종 인식률
    - 실제 confidence calibration
    - 후보 표시 latency·알고리즘 처리 시간
    - 실제 Android 손가락 가림·오터치·성능·저지연 입력
    - 최종 룬·세계관·Art Bible·접근성 통과
```

`automatic_wrong_cast=0`은 카드 상태에서 시전 버튼을 잠그는 안전 계약 확인일 뿐 실제 알고리즘 오시전률 검증이 아니다.

## 3. 보호 경계

- 제품 단계는 `PROTOTYPE_AND_VERTICAL_SLICE`, 구현은 `NOT_STARTED`다.
- 별도 Core PoC를 재도입하지 않는다.
- 신규·미숙·중요 글자의 직접 작성 원칙을 유지한다.
- 메인 글자 1개 + 보조 글자 0개 이상 계약을 유지한다.
- 낮은 확신에서 자동 시전하지 않는다.
- 소환수는 작성·글자 선택·정답 제시를 대행하지 않는다.
- 모든 글자·의미는 `RESEARCH_ONLY_GLYPH`다.
- `ART-STYLE-01`, `ART-BIBLE-01`, Godot 구현, Save Schema, 인식 알고리즘을 확정하지 않는다.

## 4. phase 1 최소 Artifact

1. 비계측 16:9 작성 오버레이 판.
2. 연구용 글자 카드 4장.
3. `SIMULATED_RECOGNITION_RESULT` 후보 카드.
4. 의도 후보 포함·미포함 카드 쌍.
5. 메인·보조 의미 조합 카드.
6. 입력 판정과 설계 판정을 분리한 결과 카드.
7. 위치를 지목하지 않는 중립 오류 카드.
8. first attempt·post-feedback attempt 기록지.
9. 행동·자기보고·진행자 개입 분리 기록지.

조작 후보 영역은 연구 판에서 48dp 상당 이상으로 준비하고, 상태는 색상 외 문구·아이콘으로 중복 표현한다. 이는 실제 Android 접근성 통과 선언이 아니다.

## 5. 연구용 글자

| ID | 의미 | 획 | 검증 목적 |
|---|---|---:|---|
| `RESEARCH_GLYPH_A` | PUSH / 밀기 | 1 | 후보 포함·미포함 복구 |
| `RESEARCH_GLYPH_B` | SHIELD / 막기 | 1 | 후보 충돌 대조 |
| `RESEARCH_GLYPH_C` | OPEN / 열기 | 1 | 유사 후보 대조 |
| `RESEARCH_GLYPH_D` | ANCHOR / 고정 | 2 | 중립 부분 수정 |

연구 글자는 세계관 정본이 아니며 실제 recognizer 학습 데이터로 사용하지 않는다.

## 6. 후보 카드 생성 계약

```yaml
candidate_card_contract:
  candidate_count: 2_OR_3_RESEARCH_ONLY
  candidate_relation: VISUALLY_NEAR_RESEARCH_GLYPHS
  target_inclusion: COUNTERBALANCED_PRESENT_OR_ABSENT
  automatic_selection: FORBIDDEN
  automatic_cast_when_low_confidence: DISABLED_BY_STATE
  product_algorithm_claim: NONE
```

일부러 낮은 확신을 반복해 원하는 후보를 뽑는 행동을 기록한다. 카드 후보 개수·유사도·반복 비용은 제품 규칙으로 승격하지 않는다.

## 7. 재구성 시나리오

### 1A — 낮은 확신, 의도 후보 포함

```yaml
scenario_id: GR-WRITE-1A
situation: "훈련 구체를 오른쪽 표식 밖으로 밀어내라"
participant_intent: PUSH
simulated_result:
  component_status: SIMULATED_RECOGNITION_RESULT
  candidates: [OPEN, PUSH]
  target_included: true
  confidence: LOW
interaction_state:
  cast_enabled: false
allowed_recovery: [SELECT_CANDIDATE, REWRITE, CANCEL_INPUT]
```

후보·확신 상태를 이해하는지 본다. 실제 인식 성공률은 측정하지 않는다.

### 1B — 낮은 확신, 의도 후보 미포함

```yaml
scenario_id: GR-WRITE-1B
situation: "훈련 구체를 오른쪽 표식 밖으로 밀어내라"
participant_intent: PUSH
simulated_result:
  component_status: SIMULATED_RECOGNITION_RESULT
  candidates: [OPEN, SHIELD]
  target_included: false
  confidence: LOW
interaction_state:
  cast_enabled: false
allowed_recovery: [REWRITE, CANCEL_INPUT, UNDO_LAST_IF_AVAILABLE]
forbidden: [SELECT_NON_TARGET_AS_CORRECTION, AUTOMATIC_CAST]
```

의도 후보가 없을 때 목록에서 억지로 정답을 고르지 않고 입력 복구로 돌아가는지 본다.

### 2 — 입력 일치·순수 주문 설계 실패

```yaml
scenario_id: GR-WRITE-2
situation: "밀려오는 상자를 이동시킨 뒤 지정 위치에 유지하라"
participant_intent: PUSH
simulated_result:
  recognized: PUSH
  confidence: HIGH
input_result:
  intent_matches_recognition: true
  input_valid: true
semantic_result:
  design_valid: false
  observed_world_change: "상자는 이동하지만 지정 위치에 머물지 않는다"
allowed_recovery: [PRESERVE_RECOGNIZED_MAIN, ADD_SUPPORT_GLYPH, REPLACE_MAIN]
forbidden: [FORCE_FULL_REWRITE, LABEL_AS_RECOGNITION_FAILURE]
```

진행자는 `ANCHOR를 추가하라`고 말하지 않는다. 참가자가 입력을 보존한 채 의미 조합을 수정하는지 본다.

### 3 — 오류 위치를 지목하지 않는 부분 수정

```yaml
scenario_id: GR-WRITE-3
glyph_intent: ANCHOR
strokes_drawn: 2
simulated_result:
  candidates: [ANCHOR, SHIELD]
  confidence: LOW
  neutral_error_message: "입력 형태의 일치도가 낮아 확인이 필요합니다"
interaction_state:
  cast_enabled: false
parallel_recovery_options: [UNDO_LAST, REWRITE_ALL, SELECT_CANDIDATE, CANCEL_INPUT]
forbidden_copy:
  - "마지막 획이 틀렸습니다"
  - "두 번째 획을 다시 그리세요"
```

`UNDO_LAST`를 선택하더라도 진행자가 정답 경로를 알려준 성공으로 기록하지 않는다. 어떤 복구를 먼저 탐색했는지와 이유를 기록한다.

### 4 — 실제 Android touch·recognizer 검증: 현재 세션 제외

```yaml
scenario_id: GR-WRITE-4-TECHNICAL
status: TEST_REQUIRED_NOT_BUILT
requires:
  - 목표 Android 기기
  - 실제 입력 overlay Prototype
  - 계측 가능한 recognizer 또는 고정 ground truth dataset
  - 경고 상태 변화 구현
measures:
  - finger_occlusion
  - accidental_touch
  - warning_discovery
  - one_hand_use
  - actual_recognizer_accuracy
  - recognizer_latency
  - confidence_calibration
```

phase 1 카드 세션에서 위 항목을 통과 처리하지 않는다. `ART-STYLE-01` 이후 별도 기술 Prototype 계획이 책임진다.

## 8. 시나리오 배정

1A와 1B 순서 학습을 줄이기 위해 참가자에게 하나만 먼저 배정하고 후반에 다른 조건을 제공한다.

```yaml
candidate_condition_assignment:
  group_1: [1A, 2, 3, 1B]
  group_2: [1B, 2, 3, 1A]
```

두 번째 후보 조건은 학습 후 행동으로 별도 표시하고 첫 조건과 합산하지 않는다.

## 9. 진행자 스크립트

> 시스템이 어떤 글자로 인식했다고 제시하는지 확인하고 필요하면 수정한 뒤, 인식된 글자가 상황에 맞는 주문인지 별도로 판단해 주세요. 후보 카드는 실제 인식 알고리즘 결과가 아니라 흐름을 검증하기 위한 모의 결과입니다. 후보 목록에 의도한 글자가 없을 수도 있습니다.

1. 상황·연구용 글자 카드 공개.
2. 참가자가 비계측 판에 작성한다.
3. 작성 종료까지를 `drawing_completion_seconds`로 기록한다. 알고리즘 latency가 아니다.
4. 피드백 전 `first_attempt_shape_intent`를 기록한다.
5. 배정된 `SIMULATED_RECOGNITION_RESULT`를 공개하고 `facilitator_intervention`에 기록한다.
6. 낮은 확신 카드에서는 시전 버튼이 잠긴 상태임을 보여주되 복구 선택을 추천하지 않는다.
7. 참가자가 후보 확인·수정·취소·재작성을 선택한다.
8. `post_feedback_attempt`로 수정 경로와 이유를 기록한다.
9. 시나리오 2에서 입력 결과와 의미 조합 결과를 순서대로 공개한다.
10. 입력 실패와 설계 실패를 구분하게 한다.
11. 행동 기록 뒤 후보 우회·반복 피로·자동화 선호를 질문한다.

진행자는 후보·조합을 대신 선택하거나 마지막 획 취소·보조 글자 정답을 지시하지 않는다.

## 10. 참가자와 기록

```yaml
pilot_purpose: UX_RESPONSIBILITY_AND_RECOVERY_DEFECT_DISCOVERY
minimum_participants: 6
segments:
  low_gesture_system_experience: 3
  drawing_rhythm_gesture_experienced: 3
phase_1_surface: NON_INSTRUMENTED_DRAWING_BOARD
android_device_required: false
session_minutes: 25-35
```

분리 기록:

- `drawing_completion_seconds` — 알고리즘 latency 아님.
- 피드백 전 의도한 글자·이유.
- 공개한 simulated 카드와 진행자 개입.
- 후보·확신 상태 설명.
- `target_included` 여부와 선택한 복구 경로.
- 의도 후보 미포함 시 비대상 후보를 억지 선택했는지.
- 낮은 확신을 반복 생성하려는 행동.
- 오류 위치를 알려주지 않은 상태의 첫 복구 선택.
- 입력 실패/순수 설계 실패 설명.
- 전체 재작성·후보 선택·부분 취소의 이유.
- 자동 시전 요구·실패 유형 혼동 critical incident.

사용 금지 지표:

- `first_attempt_recognition_success_rate`
- `final_recognition_rate`
- `recognizer_latency`
- `confidence_calibration_accuracy`
- `android_touch_success_rate`

## 11. 판정

비율은 `n/N` 참고값으로만 기록한다.

```yaml
PROMISING_DIRECTION:
  required_patterns:
    - "서로 다른 참가자 2명 이상이 후보·확신 상태를 자기 말로 설명"
    - "의도 후보 미포함 시 비대상 후보를 정답처럼 고르지 않고 입력 복구로 전환"
    - "입력 의도와 인식 결과가 일치한 설계 실패를 인식 실패와 구분"
    - "중립 오류 카드에서 복구 경로를 선택하고 이유를 설명"
    - "scripted 흐름에서 낮은 확신 자동 시전 없음"
  claim: "후보 확인→복구→의미 조합의 UX 책임 분리를 기술 Prototype에서 검증할 방향을 지지"
ADAPT:
  condition: "책임 분리는 이해되지만 후보 미포함·부분 수정·시전 잠금 중 반복 혼란"
REWORK:
  condition: "후보 목록이 직접 쓰기를 대체하거나 입력 실패와 설계 실패가 계속 혼합됨"
REJECT:
  condition: "확인·복구 단계가 직접 작성 판타지를 지속적으로 해치고 비대상 후보 선택이 지배 전략이 됨"
STOP:
  condition: "simulated 결과를 실제 정확도로 보고, 연구 글자를 정본화, 실제 Android·recognizer 미실행 결과를 통과 처리"
```

판정은 공용 `PROMISING_DIRECTION`까지만 허용한다. 실제 알고리즘 채택은 별도 기술 Prototype이 책임진다.

## 12. 후속 기술 Prototype 게이트

```yaml
technical_followups:
  android_touch_prototype:
    prerequisite: ART_STYLE_01_DECIDED
    status: NOT_BUILT
  recognizer_prototype:
    prerequisite:
      - ART_STYLE_01_DECIDED
      - RESEARCH_GLYPH_SET_REVIEWED_NOT_CANONIZED
      - GROUND_TRUTH_DATASET_DEFINED
    status: NOT_BUILT
```

## 13. 현재 상태

```yaml
synthetic_must_fix_applied:
  target_present_and_absent_split: true
  pure_semantic_failure_added: true
  neutral_partial_correction_added: true
  touch_and_recognizer_tests_separated: true
  low_confidence_cast_state_locked: true
research_glyphs_canonized: false
art_style_decided: false
product_code_changed: false
vertical_slice_implementation_started: false
algorithm_accuracy: NOT_RUN
recognizer_latency: NOT_RUN
confidence_calibration: NOT_RUN
android_touch_validation: NOT_RUN
android_performance: NOT_RUN
accessibility: NOT_RUN
human_validation: NOT_RUN
implementation_authority: NONE
next_gate: RUN_REWORKED_CARD_SESSION_THEN_AUTHOR_SEPARATE_TOUCH_AND_RECOGNIZER_PROTOTYPES_AFTER_ART_STYLE_DECISION
```

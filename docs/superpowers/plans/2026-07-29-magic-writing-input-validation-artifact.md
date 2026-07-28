# GRIMOIRE 마법 글자 작성·인식 사람 검증 Artifact 실행 계획 — Governance 교정판

```yaml
session_packet_id: GRIMOIRE-HV-001
project: GRIMOIRE
baseline_branch: main
baseline_commit: f3cd913faf67ee04069d78fe3024aa71e9f72b07
base_governance_commit: dd6ae48225da58088045733e8fdc3de5784bdeff
base_governance_path: docs/knowledge/game-development/HUMAN_VALIDATION_ARTIFACT_GOVERNANCE.md
base_template_path: templates/research/HUMAN_VALIDATION_SESSION_PACKET.md
artifact_status: READY_FOR_LOW_FIDELITY_TOUCH_SESSION
human_validation: NOT_RUN
android_performance_validation: NOT_RUN
implementation_authority: NONE
```

> 이 문서는 실제 글자 인식 알고리즘을 검증하지 않는다. 진행자가 제공하는 후보·확신 카드는 `SIMULATED_RECOGNITION_RESULT`이며 후보 확인·부분 수정·입력 실패와 설계 실패의 책임 분리 UX만 검증한다.

## 1. 결정 질문

> 플레이어가 시스템의 후보·확신 상태를 이해하고, 입력 문제는 부분 수정으로 복구하며, 인식된 글자가 상황에 맞지 않는 설계 문제와 구분할 수 있는가?

## 2. Artifact fidelity와 주장 상한

```yaml
artifact_fidelity: CARD_WITH_TOUCH_SURFACE
simulated_components:
  - SIMULATED_RECOGNITION_RESULT
  - 후보 글자와 확신 상태
  - 오류 근거 카드
scripted_components:
  - 의미 조합 판정
  - 세계 변화 결과 카드
fixed_outcomes:
  - 시나리오별 후보·확신·설계 결과
claim_ceiling:
  can_claim:
    - 후보·확신 상태의 이해 가능성
    - 마지막 획 취소·후보 선택·전체 재작성 경로의 발견 가능성
    - 입력 실패와 주문 설계 실패 구분
    - 손가락 가림·경고 누락·조작 과부하 후보
  cannot_claim:
    - 실제 인식 정확도·첫 시도 인식률·최종 인식률
    - 실제 confidence calibration
    - 후보 표시 latency·알고리즘 처리 시간
    - 실제 Godot·Android 성능·저지연 입력
    - 최종 룬·세계관·Art Bible·접근성 통과
```

`automatic_wrong_cast=0`은 scripted 흐름의 안전 계약 확인일 뿐 실제 알고리즘 오시전률 검증이 아니다.

## 3. 보호 경계

- 제품 단계는 `PROTOTYPE_AND_VERTICAL_SLICE`, 구현은 `NOT_STARTED`다.
- 별도 Core PoC를 재도입하지 않는다.
- 신규·미숙·중요 글자의 직접 작성 원칙을 유지한다.
- 메인 글자 1개 + 보조 글자 0개 이상 계약을 유지한다.
- 낮은 확신에서 자동 시전하지 않는다.
- 소환수는 작성·글자 선택·정답 제시를 대행하지 않는다.
- 모든 글자·의미는 `RESEARCH_ONLY_GLYPH`다.
- `ART-STYLE-01`, `ART-BIBLE-01`, Godot 구현, Save Schema를 확정하지 않는다.

## 4. 최소 Artifact

1. 16:9 작성 오버레이 판.
2. 연구용 글자 카드 4장.
3. `SIMULATED_RECOGNITION_RESULT` 후보 카드.
4. 메인·보조 의미 조합 카드.
5. 상황·위험 카드.
6. 입력 판정과 설계 판정을 분리한 결과 카드.
7. first attempt·post-feedback attempt 기록지.
8. 행동·자기보고·진행자 개입 분리 기록지.

조작 후보 영역은 48dp 이상으로 준비하고, 상태는 색상 외 문구·아이콘으로 중복 표현한다. 이는 실제 접근성 통과 선언이 아니다.

## 5. 연구용 글자

| ID | 의미 | 획 | 검증 목적 |
|---|---|---:|---|
| `RESEARCH_GLYPH_A` | PUSH / 밀기 | 1 | 방향 의미·후보 선택 |
| `RESEARCH_GLYPH_B` | SHIELD / 막기 | 1 | 입력 성공·상황 부적합 |
| `RESEARCH_GLYPH_C` | OPEN / 열기 | 1 | 진행 방향 후보 충돌 |
| `RESEARCH_GLYPH_D` | ANCHOR / 고정 | 2 | 마지막 획 취소 |

## 6. 시나리오

### 1 — 낮은 확신 후보 수정

```yaml
scenario_id: GR-WRITE-1
situation: "훈련 구체를 오른쪽 표식 밖으로 밀어내라"
participant_draws: PUSH
simulated_result:
  component_status: SIMULATED_RECOGNITION_RESULT
  top_candidate: OPEN
  alternate_candidate: PUSH
  confidence: LOW
allowed_recovery: [ALTERNATE, REWRITE]
forbidden: [AUTOMATIC_CAST]
```

실제 인식 성공이 아니라 낮은 확신과 대안 후보를 이해하는지 측정한다.

### 2 — 입력 성공·설계 실패

```yaml
scenario_id: GR-WRITE-2
situation: "밀려오는 상자를 이동시킨 뒤 지정 위치에 고정하라"
simulated_result: {recognized: SHIELD, confidence: HIGH}
semantic_result: {input_valid: true, design_valid: false}
allowed_recovery: [PRESERVE_RECOGNIZED, REPLACE_MAIN, ADD_ANCHOR]
forbidden: [FORCE_FULL_REWRITE]
```

### 3 — 마지막 획 취소

```yaml
scenario_id: GR-WRITE-3
glyph: ANCHOR
first_stroke: VALID
second_stroke: SCRIPTED_OUT_OF_TOLERANCE
simulated_result:
  candidate: ANCHOR
  confidence: LOW
  error_basis: "두 번째 획이 중심 교차 영역을 벗어남"
allowed_recovery: [UNDO_LAST, REDRAW_SECOND]
forbidden: [CLEAR_ALL_REQUIRED]
```

### 4 — 손가락 가림과 경고

```yaml
scenario_id: GR-WRITE-4
glyph: OPEN
warning_change: "대상 안정 → 대상 균열 — 확정 전 확인"
warning_timing: "획이 하단 중앙을 지날 때"
required_observation: "확정 전에 경고 변화를 확인"
```

## 7. 진행자 스크립트

> 시스템이 어떤 글자로 인식했다고 제시하는지 확인하고 필요하면 수정한 뒤, 그 글자가 상황에 맞는 주문인지 별도로 판단해 주세요. 후보 카드는 실제 인식 알고리즘 결과가 아니라 흐름을 검증하기 위한 모의 결과입니다.

1. 상황·글자 카드 공개.
2. 참가자가 손가락으로 작성.
3. 작성 종료까지를 `drawing_completion_seconds`로 기록한다. 알고리즘 latency가 아니다.
4. 피드백 전 `first_attempt_shape_intent`를 기록한다.
5. `SIMULATED_RECOGNITION_RESULT`를 공개하고 `facilitator_intervention`에 기록한다.
6. 참가자가 후보 확인·수정·확정.
7. `post_feedback_attempt`로 수정 경로와 이유 기록.
8. 의미 조합·상황 판정 공개.
9. 입력 실패와 설계 실패를 구분하게 한다.
10. 행동 기록 뒤 가림·피로·자동화 선호를 질문한다.

진행자는 후보·조합을 대신 선택하거나 마지막 획 취소를 지시하지 않는다.

## 8. 참가자와 기록

```yaml
pilot_purpose: UX_RESPONSIBILITY_AND_RECOVERY_DEFECT_DISCOVERY
minimum_participants: 6
segments:
  low_touch_action_experience: 3
  drawing_rhythm_gesture_experienced: 3
devices:
  - small_android_phone_finger
  - medium_android_phone_finger
optional: [supported_stylus_device]
scenario_order:
  group_1: [1, 2, 3, 4]
  group_2: [4, 3, 2, 1]
session_minutes: 25-35
```

분리 기록:

- `drawing_completion_seconds`.
- 피드백 전 의도한 글자·이유.
- 공개한 simulated 카드와 진행자 개입.
- 후보·확신 상태 설명.
- 수정 경로와 힌트 없는 발견 여부.
- 입력 실패/설계 실패 설명.
- 경고 확인·실제 가림·오터치 행동.
- 피로·가림·자동 보정 자기보고.
- 자동 시전 요구·실패 유형 혼동·경고 누락 critical incident.

사용 금지 지표:

- `first_attempt_recognition_success_rate`
- `final_recognition_rate`
- `recognizer_latency`
- `confidence_calibration_accuracy`

## 9. 판정

비율은 `n/N` 참고값으로만 기록한다.

```yaml
PROMISING_DIRECTION:
  required_patterns:
    - "서로 다른 참가자 2명 이상이 후보·확신 상태를 자기 말로 설명"
    - "입력 실패와 설계 실패를 구분"
    - "부분 수정 경로를 발견하거나 발견 실패 원인을 명확히 기록"
    - "scripted 흐름에서 낮은 확신 자동 시전 없음"
  claim: "후보 확인→부분 수정→의미 조합의 UX 책임 분리를 기술 Prototype에서 검증할 방향을 지지"
ADAPT:
  condition: "책임 분리는 이해되지만 후보 표시·부분 수정·가림 중 반복 혼란"
REWORK:
  condition: "전체 재작성·작은 조작·경고 누락이 흐름을 반복 중단"
REJECT:
  condition: "입력 오류와 설계 오류를 구분하지 못하거나 확인 단계가 코어 손맛을 지속적으로 해침"
STOP:
  condition: "simulated 결과를 실제 정확도로 보고, 연구 글자를 정본화, 별도 Core PoC 확장"
```

판정은 공용 `PROMISING_DIRECTION`까지만 허용한다. 실제 알고리즘 채택은 별도 기술 Prototype이 책임진다.

## 10. 현재 상태

```yaml
research_glyphs_canonized: false
art_style_decided: false
product_code_changed: false
vertical_slice_implementation_started: false
algorithm_accuracy: NOT_RUN
recognizer_latency: NOT_RUN
confidence_calibration: NOT_RUN
android_performance: NOT_RUN
accessibility: NOT_RUN
human_validation: NOT_RUN
implementation_authority: NONE
next_gate: RUN_SIMULATED_RECOGNITION_UX_PILOT_AND_WRITE_CLAIM_CEILING_REPORT
```

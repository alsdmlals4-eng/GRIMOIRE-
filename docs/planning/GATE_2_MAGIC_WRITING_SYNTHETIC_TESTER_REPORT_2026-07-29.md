# GRIMOIRE 마법 글자 작성·인식 합성 테스터 보고서

```yaml
simulation_id: GRIMOIRE-SYNTH-001
validation_method: SYNTHETIC_TESTER_SIMULATION
evidence_tier: T6_AI_INFERENCE
baseline_commit: f775b360fa33d083f400b7176902f27436779d86
base_governance_commit: 9c4071c5ecefe28769b512d426442338ceb7acdd
structure_analysis: docs/planning/GATE_2_SYNTHETIC_TESTER_STRUCTURE_ANALYSIS_2026-07-29.md
human_validation: NOT_RUN
android_touch_validation: NOT_RUN
recognizer_validation: NOT_RUN
ai_simulation: COMPLETED
implementation_authority: NONE
assumption_not_observation: true
```

## 1. 결정 질문

> 플레이어가 후보·확신 상태를 이해하고, 입력 문제는 부분 수정으로 복구하며, 인식된 글자가 상황에 맞지 않는 주문 설계 문제와 구분할 수 있는가?

이 보고서는 실제 글자 인식 정확도·지연·confidence calibration·손가락 조작감을 측정하지 않는다.

## 2. 페르소나별 가정

### GESTURE_NOVICE

```yaml
scenario_id: GW-01_LOW_CONFIDENCE
assumed_first_attempt:
  - 후보 목록에 의도한 글자가 존재하면 첫 번째 또는 가장 익숙한 이름을 선택
  - confidence를 시스템 확률이 아니라 정답 추천 순위로 해석
reasoning_basis: 후보와 확신 카드가 실제 recognizer보다 정답 선택 UI처럼 작동할 수 있음
confidence: HIGH
counterexample: 의도 후보가 없는 조건과 오류 근거만 있는 조건을 추가하면 복구 책임을 더 분리할 수 있음
adversarial_question: 인식 상태를 이해한 것인가, 정답이 목록에 있어서 고른 것인가?
assumption_not_observation: true
```

### IMPATIENT_CASTER

```yaml
scenario_id: GW-01_LOW_CONFIDENCE
assumed_first_attempt:
  - 후보 확인을 건너뛰고 가장 빠른 시전 또는 확인 버튼을 찾음
  - 자동 시전 금지 문구보다 시전 가능 버튼의 시각적 강조를 우선
reasoning_basis: 짧은 전투 입력에서 확인 단계가 마찰로 인식될 수 있음
confidence: MEDIUM
counterexample: 낮은 확신에서는 시전 버튼 자체를 잠그고 수정·후보 선택만 제공하면 오해가 줄어듦
adversarial_question: 안전 계약이 문구로만 존재하는가, 상호작용 상태로 강제되는가?
assumption_not_observation: true
```

### SEMANTIC_PLANNER

```yaml
scenario_id: GW-02_DESIGN_FAILURE
assumed_first_attempt:
  - 진행자가 SHIELD로 인식됐다고 알린 뒤 상황 부적합을 설명하면 입력 실패와 설계 실패를 동시에 의심
  - 자신이 쓴 의도 글자와 인식 결과가 다르면 주문 조합 문제보다 recognizer 문제로 귀인
reasoning_basis: 인식된 글자 불일치와 상황 부적합이 한 장면에 혼합됨
confidence: HIGH
counterexample: 의도한 글자가 정확히 인식됐지만 상황 규칙상 실패하는 장면이면 설계 실패만 분리 가능
adversarial_question: 이 시나리오는 의미 설계를 검증하는가, 오인식 이후의 혼란을 검증하는가?
assumption_not_observation: true
```

### ERROR_RECOVERY_OPTIMIZER

```yaml
scenario_id: GW-03_PARTIAL_UNDO
assumed_first_attempt:
  - "마지막 획이 틀렸다"는 오류 근거를 보고 즉시 마지막 획 취소를 선택
  - 부분 수정 기능을 발견했다기보다 진행자 설명을 그대로 수행
reasoning_basis: 오류 원인과 수정 범위가 자극물에서 직접 공개됨
confidence: HIGH
counterexample: 중립적인 형태 불일치 결과만 보여주고 전체 재작성·마지막 획 취소·후보 선택을 병렬 제공하면 발견 가능성을 볼 수 있음
adversarial_question: 복구 기능을 발견한 것인가, 정답 경로를 지시받은 것인가?
assumption_not_observation: true
```

### DRAWING_EXPERT

```yaml
scenario_id: GW-03_PARTIAL_UNDO
assumed_first_attempt:
  - 자동 보정과 정규화가 획의 개성·순서·속도를 무시하면 직접 쓰는 손맛이 약해진다고 판단
  - 부분 취소보다 전체를 다시 써 자신의 형태를 유지하려 할 가능성
reasoning_basis: 손맛 판타지와 recognizer 안정성의 긴장
confidence: MEDIUM
counterexample: 보정이 시각 형태를 바꾸지 않고 좌표 노이즈만 줄이면 손맛 훼손이 적을 수 있음
adversarial_question: 보정은 입력을 돕는가, 플레이어의 글씨를 시스템 글씨로 바꾸는가?
assumption_not_observation: true
```

### FINGER_ONLY_MOBILE

```yaml
scenario_id: GW-04_OCCLUSION
assumed_first_attempt:
  - 손가락 아래 후보·위험 경고·획 끝점을 확인하지 못할 가능성
  - 경고 위치가 손가락 이동 경로와 겹치면 인지 자체가 지연
reasoning_basis: 작은 모바일 화면과 직접 터치의 물리적 가림
confidence: LOW
counterexample: 실제 화면 크기·손가락 위치·레이아웃이 없으므로 카드 문서만으로는 가림 정도를 판단할 수 없음
adversarial_question: 이 위험은 문서로 해결 가능한가, 실제 기기에서만 확인 가능한가?
assumption_not_observation: true
```

### ADVERSARIAL_INPUT

```yaml
scenario_id: ALL
assumed_first_attempt:
  - 후보 목록을 이용해 실제로 쓰지 않은 글자를 선택하는 지름길을 탐색
  - 낮은 확신을 일부러 만들어 원하는 후보 목록이 나올 때까지 반복
reasoning_basis: 후보 선택이 작성 정확도보다 강한 우회 입력이 될 수 있음
confidence: MEDIUM
counterexample: 후보 목록이 작성 형태와 충분히 가까운 소수 후보만 제공하고 반복 비용이 있으면 악용성이 줄어듦
adversarial_question: 직접 쓰기 시스템인가, 후보 뽑기 시스템인가?
assumption_not_observation: true
```

## 3. Finding

| ID | 상태 | 내용 | 최소 조치 |
|---|---|---|---|
| `GR-SYN-F01` | `MUST_FIX_BEFORE_TEST` | 낮은 확신 시나리오에서 의도한 글자가 항상 후보에 있어 복구가 과도하게 쉬움 | 의도 후보 있음/없음 조건을 분리하고, 없는 경우 재작성·획 수정 경로 검증 |
| `GR-SYN-F02` | `MUST_FIX_BEFORE_TEST` | 설계 실패 시나리오에 오인식이 함께 있어 입력 실패와 의미 실패를 분리하지 못함 | 의도한 글자가 정확히 인식됐지만 상황 규칙상 부적합한 시나리오로 교체 |
| `GR-SYN-F03` | `MUST_FIX_BEFORE_TEST` | “마지막 획이 틀림” 문구가 부분 수정 정답을 직접 누출 | 중립 오류 결과와 복구 선택지만 제공 |
| `GR-SYN-F04` | `SHOULD_ADAPT` | 후보 선택이 직접 쓰기를 우회하는 메타 입력이 될 가능성 | 후보 생성 조건·개수·반복 비용을 후속 Prototype 질문으로 고정 |
| `GR-SYN-F05` | `TEST_REQUIRED` | 손가락 가림·오터치·경고 발견은 실제 Android 화면 없이 판정 불가 | 목표 기기 touch Prototype 필요 |
| `GR-SYN-F06` | `TEST_REQUIRED` | 실제 recognizer accuracy·latency·confidence calibration은 simulated card로 판정 불가 | 독립 기술 Prototype·ground truth dataset 필요 |
| `GR-SYN-F07` | `COUNTEREXAMPLE` | 오류 정보를 너무 숨기면 손맛보다 반복 재작성 피로가 커질 수 있음 | 오류 원인 전체 공개가 아니라 수정 가능한 범위의 단계적 단서 제공 |
| `GR-SYN-F08` | `SHOULD_ADAPT` | 낮은 확신에서 시전 금지가 문구만 있고 상태 강제가 아니면 성급한 입력 위험 | interaction state에서 시전 잠금·명시적 확인 계약 필요 |

## 4. 권장 시나리오 재구성

### GW-01A: 의도 후보 포함

- 의도 글자가 후보에 포함된다.
- 후보·확신 상태 이해와 올바른 후보 선택을 본다.
- 실제 recognizer 정확도는 보지 않는다.

### GW-01B: 의도 후보 미포함

- 의도 글자가 후보에 없다.
- 재작성, 마지막 획 취소, 전체 취소 중 복구 경로를 구분한다.
- 후보 목록을 정답 선택 UI로 만드는 문제를 공격한다.

### GW-02: 순수 주문 설계 실패

- 작성 의도와 인식 결과가 동일하다.
- 글자 자체는 정상 인식됐지만 현재 대상·거리·조건에서 주문 조합이 부적합하다.
- 입력 상태를 보존한 채 의미 조합만 수정하게 한다.

### GW-03: 중립 부분 수정

- 시스템은 형태 불일치 또는 낮은 확신만 표시한다.
- “마지막 획”을 직접 알려주지 않는다.
- 전체 재작성·마지막 획 취소·후보 선택을 병렬 제공한다.

### GW-04: 실제 기기 전용

- 손가락 가림·오터치·위험 경고·한 손 사용은 카드 시뮬레이션에서 제외한다.
- 후속 Android touch Prototype의 `TEST_REQUIRED`로만 유지한다.

## 5. 적대적 검토

```yaml
strongest_case_for_current_direction: 입력 후보·부분 수정·의미 조합을 분리하면 직접 쓰기 판타지를 유지하면서 실패 복구 책임을 설명할 수 있음
strongest_case_against_current_direction: 현재 scripted candidate와 오류 설명이 정답 경로를 미리 제공해 실제 복구 발견성을 측정하지 못함
hidden_assumption: 후보 목록이 직접 쓰기의 보조 장치로만 남고 대체 입력으로 악용되지 않는다는 가정
dominant_strategy_risk: 일부러 낮은 확신을 만들어 원하는 후보를 고르는 반복
facilitator_or_copy_bias: 의도 후보 포함과 마지막 획 오류 직접 공개
fidelity_confound: 실제 recognizer·touch 없이 카드가 모든 기술 상태를 대신함
canon_conflict_check: NO_CONFLICT
product_path_intrusion_check: NONE
verdict: REWORK
```

## 6. 판정

```yaml
decision: REWORK
reason: 현재 시나리오가 후보 확인·부분 수정·순수 설계 실패를 독립적으로 측정하지 못하고 정답 경로를 누출함
human_validation: NOT_RUN
actual_touch_usability: NOT_RUN
actual_recognizer_accuracy: NOT_RUN
actual_latency: NOT_RUN
confidence_calibration: NOT_RUN
implementation_authority: NONE
recognizer_selected: false
art_style_gate_changed: false
canon_changed: false
next_gate: REWRITE_LOW_FIDELITY_STIMULI_THEN_BUILD_SEPARATE_TOUCH_AND_RECOGNIZER_PROTOTYPES_AFTER_ART_STYLE_DECISION
```

`ART-STYLE-01`은 계속 다음 차단 결정이며 이 보고서로 룬·아트·세계관·인식 알고리즘을 확정하지 않는다.

# GRIMOIRE 마법 글자 작성·인식 합성 세션 실행 보고서

```yaml
simulation_id: GRIMOIRE-SYNTH-SESSION-002
validation_method: SYNTHETIC_TESTER_SIMULATION
evidence_tier: T6_AI_INFERENCE
baseline_branch: main
baseline_commit: 617d736cd2582ff909a6b9b9ed2aff70b1584f14
base_governance_commit: 9c4071c5ecefe28769b512d426442338ceb7acdd
structure_analysis: docs/planning/GATE_2_SYNTHETIC_TESTER_STRUCTURE_ANALYSIS_2026-07-29.md
prior_risk_report: docs/planning/GATE_2_MAGIC_WRITING_SYNTHETIC_TESTER_REPORT_2026-07-29.md
source_artifact: docs/superpowers/plans/2026-07-29-magic-writing-input-validation-artifact.md
synthetic_session: EXECUTED
human_validation: NOT_RUN
android_touch_validation: NOT_RUN
recognizer_validation: NOT_RUN
implementation_authority: NONE
assumption_not_observation: true
```

## 1. 결정 질문

> 의도 후보 포함/미포함, 순수 주문 설계 실패, 중립 부분 수정이 분리된 카드 흐름에서 플레이어가 후보 확인을 직접 쓰기의 대체 입력으로 악용하지 않고 입력 복구와 의미 설계 수정을 구분할 수 있는가?

## 2. 가상 페르소나 Case

### GESTURE_NOVICE

```yaml
assumed_first_attempt:
  target_present: 후보 목록에서 의도한 글자를 찾으면 직접 작성 결과보다 후보 정답을 고른다고 이해
  target_absent: 의도 후보가 없으면 시스템이 틀렸다고 판단하고 전체 재작성 선택
  pure_semantic_failure: 인식 결과가 맞다는 설명이 명확하면 보조 글자 또는 조합 수정으로 전환
reasoning_basis: 후보·확신 UI를 인식 상태보다 정답 추천으로 읽기 쉬움
counterexample: 후보는 `가능한 해석`이고 원본 stroke와 비교해야 한다는 문구·형상 비교를 제공하면 책임 구분이 개선됨
confidence: HIGH
finding: 시나리오 분리는 유효하지만 후보 카드의 역할 설명이 핵심
```

### GESTURE_EXPERIENCED

```yaml
assumed_first_attempt:
  target_present: 원본 형태와 후보 형태를 비교해 의도 후보 선택
  target_absent: 마지막 stroke 취소와 부분 재작성 중 형태 차이가 작은 경로 선택
  neutral_partial_correction: 오류 위치가 직접 표시되지 않아도 원본 stroke를 검토해 부분 수정 시도
reasoning_basis: 리듬·드로잉·제스처 복구 경험
counterexample: 실제 recognizer가 stroke별 근거를 제공하지 못하면 카드에서 가능한 부분 수정이 제품에서 불가능할 수 있음
confidence: MEDIUM
finding: UX 책임은 설명 가능하지만 기술 제공 가능성은 recognizer Prototype이 책임져야 함
```

### IMPATIENT_CASTER

```yaml
assumed_first_attempt:
  target_present: 첫 후보를 빠르게 선택
  target_absent: 전체 재작성보다 가장 가까운 비대상 후보를 억지 선택
  low_confidence_lock: 시전 버튼 잠금 이유를 읽지 않고 반복 탭
reasoning_basis: 확인 단계가 주문 발동을 지연시키면 가장 짧은 경로를 선택함
counterexample: 잠금 상태에서 `후보 확인 또는 입력 수정 필요`를 버튼 근처에 표시하고 비대상 후보의 의미 결과를 미리 보여주면 오선택 감소 가능
confidence: HIGH
finding: 후보 목록이 직접 작성보다 빠른 우회 입력이 될 위험이 남음
```

### SYSTEM_OPTIMIZER

```yaml
assumed_first_attempt:
  exploit: 일부러 애매한 입력을 만들어 원하는 후보 목록을 반복 생성
  target_absent: 비대상 후보 중 현재 상황에 유리한 의미를 선택해 직접 작성 요구 우회
  semantic_failure: 조합 수정 비용이 낮으면 직접 입력보다 후보/보조 글자 조합 탐색을 반복
reasoning_basis: 후보 생성 비용·반복 제한·원본 형태 유사도 계약이 아직 제품 수치로 없음
counterexample: 후보 수 제한, 원본 stroke 유사도 하한, 반복 비용 또는 cooldown이 있으면 우회성이 감소
confidence: HIGH
finding: 후보 정책은 UX 문구가 아니라 별도 기술·밸런스 계약이 필요함
```

### ADVERSARIAL_INPUTTER

```yaml
assumed_first_attempt:
  exploit: 낮은 확신 상태를 반복해 후보 pool을 탐색
  second_exploit: 시전 잠금이 UI 상태만이면 키보드·다른 입력 경로로 확정 시도
  neutral_error: 오류 위치가 없다는 점을 이용해 모든 stroke를 무작위로 수정하며 후보 변화 관찰
reasoning_basis: 카드 흐름은 입력 이벤트·상태 머신·반복 비용을 강제하지 못함
counterexample: interaction state에서 모든 확정 경로를 차단하고 후보 생성 로그·반복 횟수를 기술 Prototype에서 기록하면 악용 검증 가능
confidence: HIGH
finding: 카드 세션은 악용 가설을 찾을 수 있으나 차단 여부를 검증할 수 없음
```

## 3. 시나리오별 잠정 결과

| 시나리오 | 잠정 결과 | 근거 | 남은 위험 |
|---|---|---|---|
| 의도 후보 포함 | `PROMISING_DIRECTION` | 후보·확신 상태 이해 질문을 독립적으로 검토 가능 | 후보가 정답 선택 UI로 읽힐 수 있음 |
| 의도 후보 미포함 | `PROMISING_DIRECTION` | 비대상 후보 억지 선택과 입력 복구 전환을 분리 가능 | 전체 재작성만 반복할 가능성 |
| 순수 설계 실패 | `PROMISING_DIRECTION` | 인식 결과를 보존하고 의미 조합만 수정하는 책임이 명확 | 실제 주문 문법 UI는 미구현 |
| 중립 부분 수정 | `ADAPT` | 마지막 stroke 정답 누출을 제거 | 카드에서는 가능한 부분 진단이 recognizer에서 불가능할 수 있음 |
| 낮은 확신 시전 잠금 | `ADAPT` | 흐름 계약은 명확 | 실제 모든 입력 경로 차단은 기술 검증 필요 |

## 4. Finding

| ID | 판정 | 내용 | 후속 조치 |
|---|---|---|---|
| `GR-SS-F01` | `PROMISING_DIRECTION` | 후보 포함/미포함 분리로 후보 확인과 입력 복구 책임을 독립 검토 가능 | 두 조건의 후보 카드 표현을 동일 형식으로 유지 |
| `GR-SS-F02` | `PROMISING_DIRECTION` | 순수 설계 실패가 인식 실패와 분리됨 | 주문 의미·조건 수정 UI는 후속 Prototype 필요 |
| `GR-SS-F03` | `ADAPT` | 후보가 직접 쓰기를 대체하는 빠른 입력으로 악용될 수 있음 | 후보 수·유사도 하한·반복 비용 정책을 별도 계약으로 작성 |
| `GR-SS-F04` | `ADAPT` | 중립 오류는 정답 누출을 줄이지만 부분 수정 발견성이 낮을 수 있음 | 단계적 오류 범위 힌트의 최소 수준 정의 |
| `GR-SS-F05` | `TEST_REQUIRED` | 실제 touch 가림·오터치·한 손 사용은 카드로 판정 불가 | `ART-STYLE-01` 뒤 Android touch Prototype |
| `GR-SS-F06` | `TEST_REQUIRED` | accuracy·latency·confidence calibration·stroke 근거 제공 가능성 미확인 | ground-truth dataset과 recognizer Prototype |
| `GR-SS-F07` | `TEST_REQUIRED` | 시전 잠금이 모든 입력 경로에서 강제되는지 미확인 | Godot interaction state 테스트는 구현 승인 후 수행 |

## 5. 적대적 판정

```yaml
strongest_case_for_direction: 교정된 네 시나리오는 후보 확인·입력 복구·순수 의미 실패·부분 수정을 서로 다른 책임으로 검토할 수 있음
strongest_case_against_direction: 후보 목록이 더 빠른 대체 입력이 되고 카드가 실제 recognizer의 한계를 숨길 수 있음
hidden_assumption: recognizer가 부분 수정에 필요한 근거와 안정적인 후보를 제공할 수 있다는 가정
dominant_strategy_risk: 애매한 입력 반복으로 원하는 후보 pool 탐색
copy_or_facilitator_bias: 후보 카드 자체가 정답 목록으로 보임
fidelity_limit: CARD_WITH_NON_INSTRUMENTED_DRAWING_SURFACE
provisional_decision: ADAPT
```

## 6. 잠정 결론

```yaml
synthetic_session_result: ADAPT
reason: 기존 REWORK 원인이었던 측정 혼합과 정답 누출은 해소됐지만 후보 우회 정책·부분 수정 근거·시전 잠금은 기술 Prototype 없이는 확인할 수 없음
design_revision_authority: PROVISIONAL_RESEARCH_ARTIFACT_ONLY
human_validation: NOT_RUN
actual_touch_usability: NOT_RUN
actual_recognizer_accuracy: NOT_RUN
actual_latency: NOT_RUN
confidence_calibration: NOT_RUN
recognizer_selected: false
art_style_gate_changed: false
product_code_changed: false
canon_changed: false
implementation_authority: NONE
next_gate: DEFINE_CANDIDATE_POLICY_AND_ERROR_HINT_LEVEL_THEN_BUILD_SEPARATE_TOUCH_AND_RECOGNIZER_PROTOTYPES_AFTER_ART_STYLE_DECISION
```

`ART-STYLE-01`은 계속 다음 차단 결정이며 이 보고서로 룬·아트·세계관·인식 알고리즘을 확정하지 않는다.

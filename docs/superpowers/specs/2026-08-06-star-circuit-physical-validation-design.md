# GR-TEST-033 Star Circuit Physical Validation Design

```yaml
gate_id: GR-TEST-033
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY
source_main: ccacb730775056c8d7ea5d7bae6cebcfc260b5df
runtime_layout: FIVE_POINT_STAR
stock_scope: TYPED_GLYPH_ONLY
status: DESIGN_APPROVED_BY_RECOMMENDED_EXECUTION
physical_execution: PHYSICAL_EXECUTION_NOT_RUN
human_validation: HUMAN_NOT_RUN
release_ready_claimed: false
```

## 목적

자동 검증을 이미 통과한 별형 회로 Runtime을 실제 Mobile Landscape 환경에서 사람이 이해하고 조작할 수 있는지 측정한다. 이 Gate는 Runtime 코드를 다시 증명하는 것이 아니라 Device·Performance·Screen Reader·Human 공백을 증거화한다.

## 검증 질문

1. 중앙 Main 1개와 선택적인 외곽 Auxiliary 0~5개를 처음 보는 사람이 구분하는가.
2. 회로 Preview와 Target Keyword 이후 Final Preview의 차이를 설명하는가.
3. 같은 glyph_id Typed Stock만 대체 가능하다는 규칙을 오해하지 않는가.
4. 명시 Commit 이전에는 자원 변화가 없고 Cancel이 안전하다고 이해하는가.
5. 결과의 cause glyph·new information·next opportunity를 공정한 피드백으로 받아들이는가.
6. 집중 필사의 실시간 Mana·중단·무환불 위험을 조작 전에 이해하는가.
7. Frostbloom에서 교수 예시를 정답으로 고정하지 않고 둘 이상의 합리적 해결 의도를 찾는가.

## 기기 매트릭스

- Android Narrow Landscape: ANDROID_48DP, Safe Area, Touch.
- Android Tall Landscape: ANDROID_48DP, Finger Occlusion, Touch·Stylus 가능 시 병행.
- iOS Notch Landscape: IOS_44PT, Safe Area, VoiceOver.
- 모든 기기: TEXT_SCALE_130_PERCENT, REDUCED_MOTION_0MS, COLOR_NOT_SOLE_SIGNAL, SCREEN_READER_READING_ORDER.

기기 보유 상황에 따라 일부 셀은 `NOT_AVAILABLE`로 기록할 수 있으나 실행하지 않은 셀을 PASS로 대체하지 않는다.

## 참가자·세션

```yaml
participants_candidate: 6_TEST_VALUE
anonymous_ids: P01_TO_P06
first_attempt_post_feedback: FIRST_ATTEMPT_POST_FEEDBACK_SEPARATED
session_minutes_candidate: 35_TO_50_TEST_VALUE
no_personal_identifier: required
```

참가자 수와 후보 임계값은 제품 확정값이 아니라 실행 계획용 `TEST_VALUE`다.

## 과업

- `SIMPLE_ZERO_AUX`: Main만 사용한 기본 주문.
- `MULTI_AUX`: Auxiliary 2개 이상과 Breakdown 확인.
- `TYPED_STOCK_MISMATCH`: 다른 glyph Stock 대체가 차단됨을 이해.
- `FOCUS_COMPLETE`: 집중 필사 완료와 동일 glyph Stock +1 확인.
- `FOCUS_CANCEL`: 중단 시 무생성·무환불 이해.
- `FROSTBLOOM_MULTI_SOLUTION`: 서로 다른 합리적 해결 의도 두 개 이상 탐색.

## Hard Stop

```text
ACCIDENTAL_COMMIT
MUTATION_BEFORE_COMMIT
DUPLICATE_COST_OR_RESULT
CROSS_GLYPH_STOCK_SUBSTITUTION
HIDDEN_EXTRA_MANA
RANDOM_UNPREVIEWED_TARGET
CRITICAL_SCREEN_READER_BLOCKER
MODERATOR_SOLUTION_PROMPT
PII_PRESENT
```

하나라도 발생하면 해당 실행 결과는 `STOP`이며 다음 Runtime 확대나 Human PASS로 승격하지 않는다.

## 분석 등급

`PENDING_NOT_RUN / PROMISING / TUNE / REWORK / STOP`만 사용한다. `PROMISING`도 Human PASS, 출시 준비 완료, Full Vertical Slice 대표성을 의미하지 않는다.

## 증거 무결성

Attempt와 Observation 원시 레코드의 canonical SHA-256·레코드 수를 Session에 기록하고 Analyzer가 일치 여부를 강제한다. 금지 PII key와 이메일·한국 휴대전화 패턴을 재귀 차단한다. 결과는 항상 `human_pass_claimed: false`, `release_ready_claimed: false`, `full_vertical_slice_claimed: false`를 유지한다.

## 비목표

Final Art 평가, 밸런스 확정, 7번째 Runtime glyph, 자동 Best Route, 자동 Target·Commit, 출시 승인, Full Vertical Slice 대표성 주장은 포함하지 않는다.

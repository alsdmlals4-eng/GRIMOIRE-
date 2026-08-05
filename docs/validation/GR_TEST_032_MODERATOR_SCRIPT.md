# GR-TEST-032 진행자 스크립트

## 운영 원칙

```text
ANONYMOUS_PARTICIPANT_ID_ONLY
NO_SOLUTION_PROMPT
NO_BEST_GLYPH_RECOMMENDATION
NO_PARTICIPANT_RANKING_OR_SCORE_FEEDBACK
MODERATOR_INTERVENTION_EVENT
STOP_ON_HARD_STOP
FIRST_ATTEMPT_AND_POST_FEEDBACK_SEPARATED
```

진행자는 테스트를 통과시키는 사람이 아니라 실패 원인을 분리해서 관찰하는 사람이다. 정답·최적 해법·추천 글자·회로 위치를 알려주지 않는다.

## 세션 시작 전

1. 참가자에게 익명 ID만 부여한다.
2. 이름·연락처·계정명은 기록하지 않는다.
3. 기기·OS·해상도·화면 비율·빌드 Artifact SHA를 기록한다.
4. 주손·비주손과 실행 순서를 확인한다.
5. 화면 녹화 또는 관찰 기록 방식을 안내한다.
6. 언제든 중단하거나 휴식을 요청할 수 있다고 알린다.

### 시작 멘트

> 이 테스트는 사용자의 능력을 평가하는 시험이 아니라 인터페이스와 규칙의 문제를 찾는 과정입니다. 모르는 부분이 있으면 평소처럼 행동해 주세요. 제가 정답을 알려드리지는 않지만, 어디에서 막혔는지 기록하겠습니다.

## 허용되는 진행자 개입

- 과제 문장을 동일한 표현으로 한 번 다시 읽어준다.
- 앱이 제공하는 안내를 참가자가 놓친 경우 “화면의 안내를 확인해 주세요”라고 말한다.
- 기기·앱 크래시나 입력 미응답을 확인하고 재현 단계를 기록한다.
- 참가자가 명시적으로 휴식을 요청하면 중단·휴식을 제공한다.
- 진행자 개입은 항상 `MODERATOR_INTERVENTION_EVENT`로 기록한다.

## 금지되는 진행자 개입

- “이 글자를 고르세요.”
- “이 위치에 놓으세요.”
- “Vault가 정답입니다.” 또는 “Stock을 쓰세요.”
- “Preview는 이런 뜻입니다.”처럼 시스템이 제공하지 않은 해설 추가.
- 참가자의 현재 점수·정확도·순위 공개.
- 다른 참가자의 결과와 비교.
- 실패 직후 추가 연습이나 정답 시연 제공.

```text
NO_SOLUTION_PROMPT
NO_BEST_GLYPH_RECOMMENDATION
NO_PARTICIPANT_RANKING_OR_SCORE_FEEDBACK
```

# Stage 1 진행

## Warm-up

> 먼저 기록에 포함되지 않는 연습을 두 번 진행하겠습니다. 화면에 표시된 글자를 손가락으로 작성해 주세요.

Warm-up 결과는 Scored Attempt에 포함하지 않는다.

## Scored Attempt 기본 멘트

> 화면에 표시된 글자의 의미를 확인한 뒤, 지정된 손으로 작성해 주세요. 결과가 나오면 의도한 글자와 후보가 맞는지 확인해 주세요.

첫 결과 후:

> 지금 결과를 어떻게 이해했는지 말해 주세요.

Retry가 표시된 경우:

> 화면의 재시도 안내를 읽고 한 번 다시 시도해 주세요.

진행자는 획 순서·모양·방향을 말로 교정하지 않는다.

## 12회 피로 질문

> 현재 손과 눈의 피로를 1점에서 5점으로 말해 주세요. 1점은 전혀 피곤하지 않음, 5점은 계속하기 어려움입니다.

## 24회 피로 질문

> 지금 피로를 같은 1점에서 5점으로 말해 주세요. 어떤 글자나 동작이 특히 피곤했는지도 알려 주세요.

## Stage 1 Hard Stop 확인

다음 중 하나면 즉시 `STOP_ON_HARD_STOP`을 적용한다.

- accepted false.
- stale 결과 반영.
- 선택/인식 불일치 저장.
- 중복 Vault 생성.
- 크래시·데이터 손상.
- 중대한 접근성 또는 안전 문제.

진행자 기록 멘트:

> 테스트 중단 조건이 확인되어 현재 단계에서 종료하겠습니다. 사용자의 잘못이 아니라 시스템 검토가 필요한 상태입니다.

# 휴식

> 첫 번째 단계가 끝났습니다. 최소 10분 동안 쉬겠습니다. 이 시간에는 결과나 점수를 설명하지 않겠습니다.

- 휴식 시작·종료 시각 기록.
- 추가 연습 금지.
- Stage 1 점수나 순위 공개 금지.

# Stage 2 진행

## 공통 시작 멘트

> 이제 글자 입력만이 아니라 상황을 읽고 주문의 의도와 회로를 구성하는 과제를 진행합니다. 한 가지 정답만 있는 과제가 아닙니다. 선택 이유를 말해 주세요.

## 상황 A

> 목표와 지켜야 할 대상을 읽어 주세요. 사용할 글자와 출처를 선택하고, 회로를 구성해 주세요. Preview 전에 무엇을 하려는지 설명해 주세요.

Preview 후:

> Preview에서 예상되는 변화·비용·위험을 어떻게 이해했는지 설명해 주세요.

Commit 전:

> 이 주문을 실제로 실행할 준비가 되었으면 별도 확인을 진행해 주세요.

결과 후:

> 결과가 어떤 선택에서 나왔는지, 예상과 달랐던 점과 대가를 설명해 주세요.

## 상황 B

> 이번에는 위협과 시간 압박이 있는 상황입니다. 상황 A와 동일한 답을 반복할 필요는 없습니다. 목표·위협·대상을 확인하고 선택 이유를 설명해 주세요.

Recognition Retry 발생 시 진행자는 상황 내용을 다시 설명하지 않는다. 참가자가 Context를 잃었는지 관찰·기록한다.

결과 후:

> 방금 결과를 Grimoire에 한 문단으로 남긴다고 생각하고, 선택·결과·대가를 요약해 주세요.

## Stage 2 Hard Stop

- accidental Commit.
- 중복 비용·보상·결과.
- 저장 손상.
- 진행자가 해결책을 알려주지 않으면 계속할 수 없는 구조적 막힘.
- 손가락 가림·Safe Area·접근성 문제로 핵심 조작 불가능.

Hard Stop이면 즉시 다음 상황을 진행하지 않는다.

# 종료 질문

1. 인식 입력과 주문 선택 중 어느 쪽이 더 어려웠습니까?
2. Vault와 Stock의 차이를 어떻게 이해했습니까?
3. Preview가 Commit 결정에 도움이 되었습니까?
4. 결과와 자신의 선택 사이의 인과를 설명할 수 있습니까?
5. 어느 손·글자·기기 상태에서 피로 또는 가림이 컸습니까?
6. 다시 플레이한다면 무엇을 다르게 선택하겠습니까?

## 기록 규칙

모든 개입은 다음을 기록한다.

```yaml
event_stream: MODERATOR_INTERVENTION_EVENT
participant_id: P01_to_P06
timestamp_ms: required
stage: STAGE_1_or_STAGE_2
prompt_category: REPEAT_TASK_OR_UI_NOTICE_OR_TECHNICAL_RECOVERY
prompt_text_summary: no_raw_personal_identifier
solution_content_provided: false
artifact_sha: required
```

`solution_content_provided: true`가 한 번이라도 발생하면 해당 Stage 2 결과를 독립 성공으로 집계하지 않고 `REWORK_OR_STOP_REVIEW_REQUIRED`로 보낸다.

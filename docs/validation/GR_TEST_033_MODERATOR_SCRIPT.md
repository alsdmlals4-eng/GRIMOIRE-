# GR-TEST-033 Moderator Script

```yaml
gate_id: GR-TEST-033
moderator_role: PROCEDURE_ONLY
NO_SOLUTION_PROMPT: required
NO_BEST_ROUTE_RECOMMENDATION: required
NO_PARTICIPANT_RANKING: required
NO_PERSONAL_IDENTIFIER: required
```

## 시작 문구

“이 테스트는 여러분의 능력을 평가하지 않고 화면과 규칙이 이해 가능한지 확인합니다. 이름·연락처를 기록하지 않으며, 막히면 생각하고 있는 내용을 말해 주세요. 정답 회로나 최적 경로는 제공하지 않습니다.”

## 허용 안내

- 버튼·패널의 위치를 다시 읽어준다.
- 과업 목표 문구를 그대로 반복한다.
- 조작이 멈췄을 때 “지금 무엇을 예상하고 있나요?”라고 묻는다.
- 접근성 대체 입력의 존재를 알려준다.
- 기기·앱 오류로 진행이 불가능한 경우 중단한다.

## 금지 안내

- 특정 glyph, Auxiliary 수, Target Keyword를 추천하지 않는다.
- 교수 예시가 정답이라고 암시하지 않는다.
- 성공률이 높은 경로나 Mana 효율 경로를 추천하지 않는다.
- 참가자 간 점수·순위·속도를 비교하지 않는다.
- 실패 후 즉시 정답을 알려주지 않는다.
- `NO_SOLUTION_PROMPT`, `NO_BEST_ROUTE_RECOMMENDATION`, `NO_PARTICIPANT_RANKING`을 위반하지 않는다.

## 피드백 시점

FIRST_ATTEMPT가 완전히 끝난 뒤에만 UI 기능 설명을 제공한다. POST_FEEDBACK_RETRY는 별도 Attempt로 기록한다. 첫 시도의 오류를 삭제하거나 재분류하지 않는다.

## 질문

- “회로 Preview와 마지막 Preview는 무엇이 달랐나요?”
- “Commit을 누르기 전에 무엇이 바뀔 것으로 예상했나요?”
- “왜 이 Stock을 사용할 수 없었다고 생각하나요?”
- “결과가 그렇게 나온 원인은 무엇이라고 이해했나요?”
- “다음에 무엇을 다르게 시도할 수 있나요?”
- “교수의 예시 외에 다른 해결 의도는 무엇인가요?”

## 중단과 기록

Moderator가 해결 방향을 말한 경우 `MODERATOR_SOLUTION_PROMPT` Hard Stop을 1로 기록한다. 이메일·전화번호·실명 등 PII가 노출되면 기록을 즉시 중단하고 원시 파일에 저장하지 않는다.

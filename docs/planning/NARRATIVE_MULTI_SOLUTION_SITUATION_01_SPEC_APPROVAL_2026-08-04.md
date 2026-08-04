# Narrative Multi-Solution Situation 01 — Written Spec Approval

## 승인 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
status: USER_APPROVED_WRITTEN_SPEC_WITH_SLICE_GRAMMAR_SUPERSESSION
approved_at: 2026-08-04T06:32+09:00
slice_grammar_updated_at: 2026-08-04T08:15+09:00
slice_grammar_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
spec: docs/superpowers/specs/2026-08-04-narrative-multi-solution-situation-design.md
same_decision_reapproval: true
counter_increment: false
implementation: NOT_STARTED
codex: DEFERRED
```

사용자는 복수 해결 사건 구조의 작성 명세를 승인했다.

```text
텍스트 선택 = 해결 의도·우선순위
주문 설계 = 실제 실행 방법
전투 = 여러 해결 방식 중 하나
단일 True Ending = 사용하지 않음
```

## Vertical Slice 학습 범위 — 최신 승인

이 문서의 과거 `FLOW main` 범위는 `GM-SLICE-HEAT-FLOW-OBSERVATION-01`로 명시적으로 대체됐다.

```yaml
main_glyph: HEAT
connection_grammar: FLOW
optional_support_glyphs:
  - FOCUS
  - DISPERSE
representative_known_circuit: HEAT_PLUS_FLOW
slice_spell_grammar: MAIN_1_PLUS_CONNECTION_AND_OPTIONAL_SUPPORT
```

- `열`은 현상을 발생시키거나 기존 열원을 주문의 중심 현상으로 지정한다.
- `흐름`은 열의 대상·경로·순서·순환을 구성한다.
- `집중`은 좁고 강한 적용을 만들며 과열·과압·국부 손상 위험을 높인다.
- `분산`은 여러 대상과 넓은 구역에 나누며 속도와 즉효성을 낮춘다.

## 교수 시연의 지위

교수의 외곽 `열 + 흐름` 회로는 학교 회랑으로 번지는 냉기를 막는 **한 가지 유효한 예시**다.

```yaml
faculty_demonstration: ONE_VALID_EXAMPLE
canonical_answer: false
required_player_route: false
best_solution_guaranteed: false
used_as_grading_key: false
```

플레이어는 교수의 회로를 조사해 배운 키워드를 확인할 수 있지만, 내부 사건을 같은 방식으로 풀 필요는 없다.

- 시설 복구
- 카시안·묘목 생존 확보
- 정령 안정화
- 현상 봉쇄와 철수
- 제압과 시간 확보
- 대표 패턴에 없는 합리적 응용

모두 글자 의미·상황 조건·대가가 설명되면 유효하게 판정한다.

## 해결 패턴 범위

```yaml
approaches: 5
solution_patterns_per_approach_target: 4
total_recognized_patterns_target: 20
patterns_are_explicit_menu_answers: false
patterns_are_backend_validations: true
reasonable_unlisted_solution: ALLOWED_BY_MEANING_AND_SITUATION_EVALUATION
```

20개 대표 패턴은 정답 목록이 아니라 판정·설명·QA 기준이다. 교수 예시 역시 20개 중 하나를 강제하는 Tutorial Answer가 아니다.

## 보호 경계

- 교수 예시를 유일·기본·최적 정답으로 표시하지 않는다.
- 플레이어에게 교수 회로 복사·자동 적용 버튼을 제공하지 않는다.
- 미학습 고급 글자를 숨은 효과로 제공하지 않는다.
- 다섯 접근의 네 패턴을 사실상 같은 주문의 이름 변경으로 만들지 않는다.
- 준비된 패턴 밖의 창의적 주문도 같은 의미·상황 판정 규칙으로 허용한다.
- 열은 냉기를 비용 없이 삭제하지 않으며 과열·압력·생명·시설·정령 관계 대가를 가진다.

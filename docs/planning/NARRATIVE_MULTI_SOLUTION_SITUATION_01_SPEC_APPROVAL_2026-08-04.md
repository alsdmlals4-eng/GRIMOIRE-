# Narrative Multi-Solution Situation 01 — Written Spec Approval

## 승인 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
decision_id: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
status: USER_APPROVED_WRITTEN_SPEC
approved_at: 2026-08-04T06:32+09:00
spec: docs/superpowers/specs/2026-08-04-narrative-multi-solution-situation-design.md
same_decision_reapproval: true
counter_increment: false
grill_counter: 2_of_10
pending_decisions: 2
implementation: NOT_STARTED
codex: DEFERRED
```

사용자는 복수 해결 사건 구조의 작성 명세를 승인했다.

승인된 핵심 계약:

```text
텍스트 선택 = 해결 의도·우선순위
주문 설계 = 실제 실행 방법
전투 = 여러 해결 방식 중 하나
단일 True Ending = 사용하지 않음
```

## 현재 학습 범위 정정

Vertical Slice에서 사건 발생 전 플레이어가 배운 글자는 다음 세 개다.

```yaml
main_glyphs:
  - FLOW
support_glyphs:
  - FOCUS
  - DISPERSE
slice_spell_grammar: MAIN_1_PLUS_SUPPORT_0_OR_1
```

따라서 기존 명세의 `열·보호·이동·감지·안정·고정` 등 미학습 글자를 사용한 주문 예시는 Vertical Slice 실행안으로 채택하지 않는다. 이후 루트별 해법은 `흐름`, `흐름+집중`, `흐름+분산`과 환경·소환수·물리 조작의 결합으로 다시 설계한다.

## 다음 설계 범위

대표 사건 `서리꽃 온실의 심장`의 다섯 접근마다 약 네 개의 유효 해결 패턴을 준비한다.

```yaml
approaches: 5
solution_patterns_per_approach_target: 4
total_recognized_patterns_target: 20
patterns_are_explicit_menu_answers: false
patterns_are_backend_validations: true
```

20개 패턴을 텍스트 선택지로 그대로 노출하지 않는다. 플레이어는 해결 접근만 선택하고, 조사한 흐름의 출발점·목표·경로와 `집중/분산`을 조합해 패턴을 발견한다.

## 보호 경계

- `흐름`은 이미 존재하는 마력·냉기·온기·공기·물의 이동을 바꾸며 무에서 현상을 생성하지 않는다.
- `집중`은 좁고 강한 한 경로로 모으며 과압·역류 위험을 만든다.
- `분산`은 넓고 안전하게 나누지만 속도와 즉효성이 낮다.
- 미학습 글자를 숨은 자동 효과로 제공하지 않는다.
- 다섯 접근의 네 패턴이 사실상 같은 주문의 이름 변경으로 끝나지 않게 한다.
- 준비된 패턴 밖의 창의적 주문도 동일한 의미·상황 판정 규칙으로 허용한다.

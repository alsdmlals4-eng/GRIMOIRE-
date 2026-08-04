# GRIMOIRE Narrative Multi-Solution Situation Design

## 상태

```yaml
decision_id: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
status: USER_APPROVED_CORE_PARTIALLY_SUPERSEDED
core_reference_allowed: true
old_spell_input_examples_reference_allowed: false
implementation: NOT_STARTED
codex: DEFERRED
```

## 유지되는 정본 코어

```text
텍스트 선택
= 해결 의도·우선순위 확인

대화·조사
= 관찰 사실·관점·위험 제공

주문 설계
= 플레이어가 실제 실행 방법 구성
```

- 선택지가 주문을 자동 선택하거나 성공을 보장하지 않는다.
- 전투는 여러 해결 방식 중 하나이며 필수가 아니다.
- 단일 정답·단일 진엔딩을 사용하지 않는다.
- 준비된 대표 패턴 밖의 합리적 해결도 의미·상황·대가로 판정한다.
- 핵심 안전 정보는 복수 경로로 제공한다.
- 읽기·조사·Preview 중 실시간 압박을 강제로 소비하지 않는다.

## 대표 접근

1. 시설 복구.
2. 생명 구조.
3. 정령 안정화·교섭.
4. 봉쇄·철수.
5. 제압·시간 확보.

## 대체된 주문 설계 부분

과거 자유 배치·직접 작성 중심 예시와 `Flow main` 예시는 사용하지 않는다.

현재 주문 설계:

```text
3×3 글자·대상 노드 배치
→ 인접 방향 연결
→ Preview
→ Commit
```

현재 책임 원본:

- `docs/planning/THREE_BY_THREE_CIRCUIT_STOCK_FOCUS_01_APPROVAL_2026-08-04.md`.
- `docs/superpowers/specs/2026-08-04-3x3-circuit-stock-focus-scribing-design.md`.
- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`.
- `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`.

## Preview

```yaml
fields:
  - primary_effect
  - speed
  - scope
  - pressure_change
  - likely_benefit
  - main_risk
  - unresolved_problem
  - confidence
confidence: [정보_충분, 정보_부분, 정보_부족]
numeric_success_probability: prohibited
ending_reveal: prohibited
```

## 금지

```text
선택지의 주문 자동 결정
선택지의 성공 보장
20개 내부 패턴의 답안 메뉴 노출
교수 예시와 불일치한 해결 자동 실패
전투 강제
단일 진엔딩
숫자 성공 확률 Preview
```

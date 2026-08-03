# GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01 — 루트 패턴·주문 전 힌트 승인

## 1. 승인 상태

```yaml
decision_id: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
status: USER_APPROVED_ROUTE_PATTERNS_AND_PRECAST_GUIDANCE
approved_at: 2026-08-04T06:43+09:00
representative_situation: FROSTBLOOM_GREENHOUSE_HEART
counter_increment: false
grill_counter: 2_of_10
pending_decisions: 2
merge_trigger: NONE
implementation: NOT_STARTED
codex: DEFERRED
```

사용자는 다음을 승인했다.

1. `서리꽃 온실의 심장`에서 다섯 해결 접근마다 네 개의 대표 유효 해결 패턴을 준비한다.
2. 20개 패턴은 정답 목록으로 노출하지 않고 의미 판정과 QA를 위한 내부 대표 패턴으로 사용한다.
3. 주문 사용 전 등장인물 대화와 예상 효과 설명으로 방향성을 참고할 수 있게 한다.
4. 힌트는 주문 조합·정답·최종 결말을 직접 알려주지 않는다.

같은 Decision ID의 승인된 세부화이므로 Grill 카운터는 증가하지 않는다.

---

## 2. 확정된 학습 범위

```yaml
main_glyph: 흐름
support_glyphs: [집중, 분산]
spell_grammar: 메인 1 + 보조 0~1
```

Vertical Slice 실행안에서는 아직 배우지 않은 `열·보호·이동·감지·안정·고정` 등의 글자를 사용하지 않는다.

---

## 3. 확정된 루트 구조

```yaml
approaches:
  - 시설 복구
  - 생명 구조 우선
  - 정령 안정화·교섭
  - 현상 봉쇄
  - 전투·강제 제압
solution_patterns_per_approach: 4
total_reference_patterns: 20
explicit_answer_menu: false
reasonable_unlisted_solution: ALLOWED_BY_MEANING_EVALUATION
combat_is_mandatory: false
```

각 패턴은 다음 요소로 구분한다.

```text
출발 흐름
→ 목표
→ 이동 경로
→ 집중·분산 여부
→ 환경·인물·소환수 보조
→ 직접 효과
→ 남는 위험과 대가
```

---

## 4. 주문 전 힌트 승인

채택안은 `등장인물 대화 + 예상 효과 카드` 혼합형이다.

```text
해결 접근 선택
→ 관련 인물의 짧은 관점 대화
→ 출발 흐름·목표·위험 확인
→ 주문 초안 구성
→ 예상 효과 카드 확인
→ 수정 또는 시전
```

### 등장인물 대화

- 교수·지도자: 원리, 안전, 책임.
- 관리 학생: 시설 구조와 현장 장치.
- 경쟁 학생: 속도와 즉시 행동의 장단점.
- 메인 동반 정령: 정령 반응과 감각적 단서.
- 고립 학생: 내부 통로와 긴급 상태.

대화는 정답 조합이 아니라 관찰된 사실과 판단 기준을 제공한다.

### 예상 효과 카드

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
```

표시하지 않는 정보:

- 정답·오답 판정
- 성공 확률
- 최종 결말
- 숨은 점수
- 아직 발견하지 않은 원인

---

## 5. 시간·접근성 경계

- 대화·조사 선택·예상 효과를 읽는 동안 실시간 타이머가 흐르지 않는다.
- 반복 확인에 자원 페널티를 부과하지 않는다.
- 기본 관찰만으로 안전한 해법 최소 하나를 찾을 수 있어야 한다.
- 필수 생존 정보는 관계 선택 하나에 독점시키지 않는다.
- 색상만으로 이득·위험·불확실성을 구분하지 않는다.

---

## 6. 책임 정본

- 상세 설계: `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
- 상위 사건 설계: `docs/superpowers/specs/2026-08-04-narrative-multi-solution-situation-design.md`
- 명세 승인: `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_SPEC_APPROVAL_2026-08-04.md`
- 최초 승인: `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_APPROVAL_2026-08-04.md`

---

## 7. 다음 작업

```text
공통 조사 장면
→ 접근 선택 전 등장인물 대화
→ 다섯 접근별 주문 전 힌트 대사
→ 주문 초안 예상 효과 카드 문구
→ 시전 결과와 대가
→ 마도서 기록
→ UX Wireframe
→ Art Direction·Concept Art Brief
```

제품 Godot 프로젝트·GDScript·Scene 구현은 시작하지 않는다.

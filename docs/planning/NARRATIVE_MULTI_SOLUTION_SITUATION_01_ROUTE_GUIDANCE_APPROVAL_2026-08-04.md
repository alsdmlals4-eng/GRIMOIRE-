# GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01 — 루트 패턴·주문 전 힌트 승인

## 1. 승인 상태

```yaml
decision_id: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
status: USER_APPROVED_ROUTE_PATTERNS_AND_PRECAST_GUIDANCE_UPDATED
approved_at: 2026-08-04T06:43+09:00
slice_grammar_updated_at: 2026-08-04T08:15+09:00
slice_grammar_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
representative_situation: FROSTBLOOM_GREENHOUSE_HEART
counter_increment: false
implementation: NOT_STARTED
codex: DEFERRED
```

사용자는 다음을 승인했다.

1. 다섯 해결 접근마다 네 개의 대표 유효 해결 패턴을 준비한다.
2. 20개 패턴은 정답 목록으로 노출하지 않고 의미 판정과 QA 기준으로 사용한다.
3. 주문 사용 전 조사·대화·예상 효과로 방향을 참고할 수 있게 한다.
4. 힌트는 정답·최종 결말을 직접 알려주지 않는다.
5. 교수의 시연은 한 가지 유효 예시이며 기준 답안이 아니다.

---

## 2. 확정된 Vertical Slice 문법

이 절은 `GM-SLICE-HEAT-FLOW-OBSERVATION-01`을 따른다.

```yaml
main_glyph: 열
connection_grammar: 흐름
optional_support_glyphs: [집중, 분산]
representative_known_circuit: 열 + 흐름
spell_grammar: 메인 1 + 연결 문법 + 선택 보조 0~1
```

- `열`은 직접 열을 발생시키거나 환기·온수 등 기존 열원을 중심 현상으로 지정한다.
- `흐름`은 열의 목표·경로·순서·순환을 구성한다.
- `집중`과 `분산`은 출력과 범위를 조절한다.
- 미학습 고급 글자를 숨은 효과로 제공하지 않는다.

---

## 3. 교수 예시와 복수 해결 경계

교수는 외부 냉기 확산을 막는 `열 + 흐름` 외곽 순환 회로를 보여준다.

```yaml
faculty_example_role: OBSERVABLE_VALID_APPLICATION
faculty_example_is_only_answer: false
faculty_example_is_required_route: false
faculty_example_is_optimal_by_default: false
player_can_copy_full_circuit: false
reasonable_unlisted_solution: ALLOWED_BY_MEANING_EVALUATION
```

플레이어는 교수의 사용법을 그대로 따라야 하는 것이 아니다. 교수에게서 확인할 수 있는 것은 다음 정도다.

- 익숙한 글자가 실제 위기에서 사용될 수 있다.
- 열이 도착한 곳부터 상태가 변한다.
- 효과는 경로와 출구에 따라 달라진다.
- 하나의 주문이 모든 문제를 동시에 해결하지 않는다.

플레이어는 시설 복구·생존 확보·정령 안정화·봉쇄·제압 중 다른 목표를 선택하거나, 대표 패턴 밖의 합리적 방법을 만들 수 있다.

---

## 4. 확정된 루트 구조

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
single_true_ending: false
```

각 패턴은 다음 요소로 구분한다.

```text
열 현상의 출처
→ 목표
→ 흐름 경로·순서
→ 집중·분산 여부
→ 환경·카시안·소환수 보조
→ 직접 효과
→ 남는 위험과 대가
```

직접 생성한 열뿐 아니라 환기 온기·온수 관개·남아 있는 열원도 사용할 수 있다. 물리적 밸브·격벽·철수와 결합하는 혼합 해결도 허용한다.

---

## 5. 조사·관찰·예상 효과

```text
교수 시전
→ 감각과 상태 변화 관찰
→ 선택형 텍스트 노벨 회로 조사
→ `열`·`흐름` 키워드 확인
→ 환경·인물 조사
→ 주문 초안
→ 예상 효과 확인
→ 수정 또는 시전
```

### 관찰 결과

플레이어에게는 해설 대신 감각과 실제 변화만 표시한다.

- 따뜻한 기운이 느껴진다.
- 회로가 지나간 유리의 서리가 녹는다.
- 밖으로 나가려던 냉기가 방향을 바꿨다.
- 온실 안쪽 압력계는 그대로다.

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
- 교수 예시와의 일치 점수
- 아직 발견하지 않은 원인

---

## 6. 최소 인물과 정보 경계

지속 등장 인물:

- 에일린 교수
- 같은 1학년 카시안
- 메인 동반 정령 모트

상급생은 이번 사건에 등장하지 않는다. 시설 정보는 도면·표식·압력계·주문 잔향으로 전달한다. 필수 생존 정보는 최소 두 경로에서 얻을 수 있다.

---

## 7. 시간·접근성 경계

- 대화·조사·예상 효과 확인 중 실시간 타이머가 흐르지 않는다.
- 반복 확인에 자원 페널티를 부과하지 않는다.
- 조사하지 않아도 안전한 봉쇄·철수 방법은 남긴다.
- 색상만으로 이득·위험·불확실성을 구분하지 않는다.

---

## 8. 보호 경계

```text
FACULTY_EXAMPLE_AS_ANSWER_KEY = PROHIBITED
PLAYER_REQUIRED_TO_MATCH_FACULTY_METHOD = PROHIBITED
AUTOMATIC_GLYPH_RECOGNITION_OVERLAY = PROHIBITED
OBSERVATION_RESULT_EXPLAINS_SOLUTION = PROHIBITED
ALL_20_PATTERNS_VISIBLE_AS_ANSWER_MENU = PROHIBITED
UNLISTED_REASONABLE_SOLUTION_REJECTED_BY_DEFAULT = PROHIBITED
SUCCESS_PERCENTAGE_OR_FINAL_ENDING_PREVIEW = PROHIBITED
COMBAT_AS_MANDATORY_RESOLUTION = PROHIBITED
```

## 9. 책임 정본

- 최신 Slice 승인: `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md`
- 상세 패턴: `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
- 대사 원고: `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
- 상위 사건 설계: `docs/superpowers/specs/2026-08-04-narrative-multi-solution-situation-design.md`

다음 작업은 사건 UX Wireframe과 Art Direction이며, 제품 Godot 구현은 시작하지 않는다.

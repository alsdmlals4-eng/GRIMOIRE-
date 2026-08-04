# GM-SLICE-HEAT-FLOW-OBSERVATION-01 — 열·흐름 조사형 학습 승인

## 1. 승인 상태

```yaml
decision_id: GM-SLICE-HEAT-FLOW-OBSERVATION-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-04T08:15+09:00
scope: VERTICAL_SLICE_GLYPH_GRAMMAR_FACULTY_EXAMPLE_AND_INVESTIGATION_UX
parent_decisions:
  - GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
  - GM-SCHOOL-CRISIS-PEDAGOGY-01
counter_increment: true
previous_grill_counter: 3_of_10
new_grill_counter: 4_of_10
pending_approved_decisions: 4
merge_trigger: NONE
merge_authorized: false
implementation: NOT_STARTED
codex: DEFERRED
```

사용자는 `열 메인 + 흐름 경로 문법`, 텍스트 노벨식 키워드 조사, 감각 중심 관찰 결과를 승인했다.

또한 교수의 외곽 회로를 다음처럼 확정했다.

> 교수의 회로는 하나의 유효한 해결 방식과 사고법을 보여주는 예시다. 정답·필수 루트·최적해가 아니며, 플레이어는 다른 합리적 방식으로 사건을 해결할 수 있다.

---

## 2. Vertical Slice 글자 계약

이 결정은 기존 Vertical Slice의 `흐름 메인 + 집중/분산 보조` 계약을 명시적으로 대체한다.

```yaml
main_glyph: HEAT
connection_grammar: FLOW
optional_support_glyphs:
  - FOCUS
  - DISPERSE
representative_known_circuit: HEAT_PLUS_FLOW
safe_grammar: MAIN_1_PLUS_CONNECTION_AND_OPTIONAL_SUPPORT
```

의미:

- `열`: 열 현상을 발생시키거나 기존 열원을 주문의 중심 현상으로 지정한다.
- `흐름`: 열이 이동할 대상·경로·순서·순환을 구성한다.
- `집중`: 좁은 대상과 경로에 출력을 모은다.
- `분산`: 여러 대상 또는 넓은 구역에 출력을 나눈다.

`흐름`은 두 번째 메인 글자가 아니다. 연결 문법으로 작동한다.

---

## 3. 교수의 회로는 예시이지 기준 답안이 아니다

교수는 학교 회랑으로 번지는 냉기를 막기 위해 외벽에 `열 + 흐름` 회로를 사용한다.

```text
외벽에 열 발생
→ 열을 외곽 고리로 순환
→ 유리 서리 해빙
→ 냉기 진행 방향 전환
→ 외부 확산 차단
```

이 회로의 역할:

- 이미 배운 글자가 실제 위기에서 어떻게 응용되는지 보여준다.
- 경로·출구·대상에 따라 같은 글자의 결과가 달라짐을 관찰하게 한다.
- 학교 전체로 번지는 위험만 안전하게 제한한다.

이 회로가 의미하지 않는 것:

- 플레이어도 같은 외곽 순환 회로를 써야 한다.
- `열+흐름`의 교수 배치가 유일한 정답이다.
- 교수의 방식이 항상 가장 효율적이거나 높은 평가를 받는다.
- 시설 복구가 생명 구조·정령 안정화·봉쇄보다 우월하다.
- 교수의 고급 회로를 복사할 수 있다.

```yaml
faculty_demonstration_role: ONE_VALID_EXAMPLE_NOT_CANONICAL_ANSWER
faculty_solution_required_for_player: false
faculty_solution_used_as_grading_key: false
other_reasonable_solutions: ALLOWED_BY_MEANING_AND_SITUATION_EVALUATION
```

---

## 4. 허용되는 다른 해결 방식

교수의 예시를 조사한 뒤에도 플레이어는 다음처럼 다른 목표·경로·대가를 선택할 수 있다.

1. 배관과 밸브를 단계적으로 해빙해 시설을 복구한다.
2. 탈출 통로 또는 안전 구역을 만들어 카시안과 묘목을 먼저 보호한다.
3. 정령 주변의 온도와 누출 상태를 조절해 과부하를 낮춘다.
4. 격벽·완충 구역·열 순환을 이용해 현상을 봉쇄하고 철수한다.
5. 따뜻한 경계·기류·소환수 협력으로 정령을 밀어내 시간을 번다.
6. 준비된 대표 패턴에 없는 방법도 글자 의미와 상황 조건이 맞으면 유효하게 판정한다.

직접 열을 새로 발생시키는 방식만 허용하지 않는다.

- 환기구의 기존 온기를 이용할 수 있다.
- 온수 관개수의 열을 필요한 곳에 전달할 수 있다.
- 카시안의 수동 밸브·격벽 조작과 결합할 수 있다.
- 모트나 수호 소환수의 관찰·유인·방어와 결합할 수 있다.
- 제한된 열 사용과 물리적 봉쇄·철수를 함께 사용할 수 있다.

다만 모든 플레이어 주문은 최소 하나의 배운 메인 현상 계약을 가져야 하며, 환경·인물·소환수의 행동을 미학습 글자 효과로 위장하지 않는다.

---

## 5. 키워드 확인 UX

자동 글자 판독 오버레이를 사용하지 않는다. 플레이어가 텍스트 노벨 조사로 이미 배운 글자를 확인한다.

```text
빛이 시작된 문양을 살핀다
→ [확인한 키워드: 열]

빛이 이동한 선을 따라간다
→ [확인한 키워드: 흐름]

모서리의 복잡한 문양을 살핀다
→ 미학습 고급 구조 / 해독 불가
```

이 조사는 신규 글자 해금이 아니며 행동 횟수와 실시간 시간을 소모하지 않는다.

---

## 6. 관찰 결과 UX

플레이어에게는 감각과 실제 상태 변화만 2~4줄로 표시한다.

```text
따뜻한 기운이 느껴진다.
회로가 지나간 유리의 서리가 녹는다.
밖으로 나가려던 냉기가 방향을 바꿨다.
온실 안쪽의 붉은 압력계는 그대로다.
```

시스템과 교수는 다음을 설명하지 않는다.

- 회로의 인과 원리 해설
- 내부 사건에 사용할 추천 주문
- 정답·오답·성공 확률
- 최종 결말
- 교수 회로 복사 방법

---

## 7. 적대적 보호 경계

```text
FACULTY_EXAMPLE_AS_ONLY_VALID_SOLUTION = PROHIBITED
FACULTY_EXAMPLE_AS_DEFAULT_BEST_SOLUTION = PROHIBITED
PLAYER_REQUIRED_TO_COPY_FACULTY_CIRCUIT = PROHIBITED
UNLISTED_REASONABLE_SOLUTION_AUTOMATICALLY_REJECTED = PROHIBITED
AUTOMATIC_GLYPH_RECOGNITION_OVERLAY = PROHIBITED
OBSERVATION_RESULT_EXPLAINS_CAUSAL_SOLUTION = PROHIBITED
PROFESSOR_VERBALLY_NAMES_SOLUTION = PROHIBITED
PROFESSOR_CIRCUIT_COPY_BUTTON = PROHIBITED
UNKNOWN_ADVANCED_GLYPH_AUTOMATICALLY_GRANTED = PROHIBITED
HEAT_DELETES_COLD_WITHOUT_COST = PROHIBITED
FACULTY_SOLVES_INTERNAL_OBJECTIVE = PROHIBITED
COMBAT_AS_MANDATORY_RESOLUTION = PROHIBITED
SINGLE_TRUE_ENDING = PROHIBITED
```

---

## 8. 명시적 정본 대체

이 결정이 대체하는 이전 Slice 계약:

- `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01` 작성 명세의 `FLOW main` 학습 범위.
- 루트 패턴 승인 문서의 `흐름 / 흐름+집중 / 흐름+분산` 단독 문법.
- 전체 커리큘럼 승인 문서의 `흐름은 첫 기초 메인 계열의 대표 사례` 문장.

대체 후 계약:

```text
열 = Vertical Slice 첫 대표 메인 글자
흐름 = 여러 메인 현상에 재사용되는 첫 연결 문법
집중·분산 = 출력과 범위를 조절하는 첫 선택 보조 문법
```

전체 게임의 다계열 수강·전문화 구조는 유지한다.

---

## 9. 연결 정본

- `docs/planning/FULL_GAME_MAGIC_GLYPH_CURRICULUM_01_APPROVAL_2026-08-02.md`
- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_SPEC_APPROVAL_2026-08-04.md`
- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
- `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`
- `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`

다음 창의 작업은 사건 UX Wireframe과 온실·회로·정령 Art Direction이다. 제품 Godot 구현은 시작하지 않는다.

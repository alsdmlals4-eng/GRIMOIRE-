# GR-SYNC-20260803-07 — GPT 창의 기획 Working Sync

## 현재 상태

```yaml
sync_id: GR-SYNC-20260803-07
status: SCHOOL_CRISIS_PEDAGOGY_APPROVED_SCENE_FLOW_WRITTEN_FOR_REVIEW
repository: alsdmlals4-eng/GRIMOIRE-
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_branch: agent/foundation-poc-readiness-review
pull_request: 57
current_decision_id: GM-SCHOOL-CRISIS-PEDAGOGY-01
parent_situation_decision_id: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
grill_counter: 3_of_10
pending_approved_decisions: 3
counter_increment: true
implementation: NOT_STARTED
codex: DEFERRED
```

## 승인된 사건 구조

```text
텍스트 노벨에서 사건·인물·환경을 조사한다
→ 무엇을 우선하고 어떤 방식으로 해결할지 선택한다
→ 등장인물의 관점과 예상 효과로 방향성을 확인한다
→ 선택한 의도에 맞는 주문을 플레이어가 설계한다
→ 세계 변화와 대가를 확인한다
→ 결과를 마도서에 기록한다
```

핵심 경계:

```text
텍스트 선택 = 해결 의도·우선순위
대화 힌트 = 관찰 사실·편향·위험 방향
예상 효과 = 직접 변화·속도·범위·압력·위험·미해결 문제
주문 설계 = 실제 실행 방법
```

`서리꽃 온실의 심장`은 다섯 접근마다 네 개의 대표 패턴을 가지며, 20개 패턴은 정답 메뉴가 아니라 의미 판정과 QA를 위한 내부 기준이다.

## 승인된 학교 위기 교육 원칙

> 마법사는 위기에서 스스로 상황을 읽고 해결할 수 있어야 한다. 교수는 정답을 대신 실행하지 않고 방향성과 안전 기준만 제시한다. 직접 개입은 학생 또는 민간인의 생명이 즉시 위험한 수준에서만 허용한다.

교수 역할:

```yaml
L0: 정상 시행착오·비치명적 손실 관찰
L1: 판단 질문과 원리 방향 제시
L2: 돌이킬 수 없는 위험 직전 안전 경고
L3: 치명 위험만 직접 차단·구조
```

교수는 온실 외곽 확산과 치명 위험을 통제하지만 내부의 핵·배관·정령·구조 문제를 대신 해결하지 않는다.

학생은 언제든 접근 변경·지원 요청·봉쇄 후 철수를 선택할 수 있다. 철수는 자동 실패가 아니라 위험 관리와 책임 판단으로 평가한다.

## 대표 사건 장면 흐름

```text
현장실습 브리핑
→ 온실 외부 도착과 교수의 안전선 선언
→ 최초 위기와 공통 관찰
→ 조사 선택 2회
→ 등장인물 관점 대화
→ 해결 접근 선택
→ 접근별 추가 조사·주문 전 힌트
→ 주문 초안과 예상 효과 카드
→ 첫 시전과 세계 상태 변화
→ 예상 밖 변수와 접근 수정
→ 최종 대응 또는 철수
→ 결과·교수 개입 여부·후속 반응
→ 귀환과 마도서 기록
```

기본 조사:

1. 배관과 압력계
2. 환기·관개 설비
3. 정령 행동
4. 고립 학생과 통신

기본 관찰만으로도 안전 봉쇄·철수 접근이 가능하다. 핵심 생존 정보는 관계 선택 하나에 독점시키지 않는다.

## 교수 개입선

직접 개입 조건:

- 즉시 회피하기 어려운 치명 공격
- 의식 상실 또는 마력 회로 붕괴
- 한 번의 판단 기회 안에 발생할 치명 구조물·핵 붕괴
- 온실 밖 생명까지 위협하는 연쇄 폭주

교수는 치명 위험만 제거하고 사건 전체를 정상화하지 않는다.

```yaml
intervention_result_tag: FACULTY_LIFESAVING_INTERVENTION
punitive_shame: PROHIBITED
mandatory_debrief: true
```

## 정본

- `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md`
- `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`
- `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
- `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`

## 다음 GPT 창의 작업

1. 장면 흐름 사용자 검토
2. 고유 인물 이름·성격 확정
3. 실제 텍스트 노벨 대사 원고
4. 접근별 예상 효과 카드 문구 세트
5. 사건 UX Wireframe
6. 온실·정령·마력 핵 Art Direction·Concept Art Brief
7. Vertical Slice 콘텐츠 조립

## Codex 보관 상태

```yaml
local_godot: USER_CONFIRMED_INSTALLED
ci_godot: PASS_4_7_1
codex_handoff: READY
product_project: NOT_CREATED
product_code: NOT_STARTED
codex_execution: DEFERRED_UNTIL_SELECTED_CREATIVE_SCOPE_IS_READY
```

## 보호 경계

```text
TEXT_CHOICE_AUTO_SELECTS_SPELL = PROHIBITED
DIALOGUE_NAMES_CORRECT_GLYPH_COMBINATION = PROHIBITED
COMBAT_AS_MANDATORY_RESOLUTION = PROHIBITED
PROFESSOR_SOLVES_CORE_OBJECTIVE = PROHIBITED
LIFE_THREAT_WITHOUT_FACULTY_RESPONSE = PROHIBITED
WITHDRAWAL_AS_AUTOMATIC_GAME_OVER = PROHIBITED
FACULTY_INTERVENTION_AS_HUMILIATION = PROHIBITED
PRODUCT_IMPLEMENTATION = NOT_STARTED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```

## GrillMe Batch

```yaml
previous_counter: 2_of_10
current_counter: 3_of_10
pending_decision_ids:
  - GM-FOUNDATION-POC-EXECUTION-READINESS-01
  - GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
  - GM-SCHOOL-CRISIS-PEDAGOGY-01
merge_trigger: NONE
merge_authorized: false
```

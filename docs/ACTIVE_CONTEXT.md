# GRIMOIRE Active Context

> 현재 승인 상태와 다음 작업을 복원하는 권위 문서다.

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/foundation-poc-readiness-review
pull_request: 57
primary_platform: MOBILE_LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
last_main_sync: GR-SYNC-20260803-06
current_working_sync: GR-SYNC-20260804-08-HEAT-FLOW-APPROVAL
approved_current_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
approved_situation_decision: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
approved_pedagogy_decision: GM-SCHOOL-CRISIS-PEDAGOGY-01
grill_counter: 4_of_10
pending_approved_decisions: 4
current_gpt_focus: FROSTBLOOM_UX_MAP_WIREFRAME_AND_ART_DIRECTION
product_project_godot: NOT_CREATED
product_code: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

---

## 역할 분리

```text
GPT
→ 핵심 재미·콘텐츠·스토리·대사·UX·이미지·아트 방향 설계
→ 적대적 검토와 권위 문서·Sheet 동기화

Codex
→ 승인된 명세의 Godot 구현
→ project.godot·GDScript·Scene·테스트·CI·Runtime·실기기 검증
```

현재는 제품 구현을 시작하지 않는다.

---

## 복원 순서

1. `START_HERE.md`
2. 이 문서
3. `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_APPROVAL_2026-08-04.md`
4. `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`
5. `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
6. `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
7. `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`
8. `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`
9. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
10. `docs/planning/sync/GR-SYNC-20260804-08-HEAT-FLOW-APPROVAL.md`

---

## 승인된 플레이어 약속

> 상황을 읽고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자와 회로로 해결 의도를 구현하고 결과와 대가를 책임진다.

```text
상황·환경·인물 조사
→ 해결 의도와 우선순위 선택
→ 주문 설계·예상 효과 확인
→ 직접 작성·Stock·소환수 중 실행 수단 선택
→ 명시적 Commit
→ 설명 가능한 세계 변화
→ 결과·대가·발견 기록
```

---

## 승인된 Vertical Slice 글자 문법

```yaml
main_glyph: HEAT
connection_grammar: FLOW
optional_support_glyphs: [FOCUS, DISPERSE]
representative_known_circuit: HEAT_PLUS_FLOW
safe_grammar: MAIN_1_PLUS_CONNECTION_AND_OPTIONAL_SUPPORT
```

이 계약은 과거 `FLOW main + FOCUS/DISPERSE support` 계약을 명시적으로 대체한다.

- `열`은 열을 만들거나 기존 열원을 주문의 중심 현상으로 지정한다.
- `흐름`은 대상·경로·순서·순환을 구성한다.
- `집중·분산`은 출력과 범위를 조절한다.

---

## 승인된 학교 위기 교육 원칙

```yaml
L0: 정상 시행착오·비치명적 손실 관찰
L1: 놓친 조건을 좁히는 방향 제시
L2: 돌이킬 수 없는 위험 직전 안전 경고
L3: 생명 위험만 직접 차단·구조
```

교수는 핵심 목표를 대신 해결하지 않는다. 학생은 접근 변경·지원 요청·봉쇄 후 철수를 선택할 수 있다.

---

## 대표 사건과 최소 인물

```yaml
situation: FROSTBLOOM_GREENHOUSE_HEART
persistent_cast:
  - 에일린_로스베르_교수
  - 카시안_렌_동급생
  - 모트_동반정령
upperclass_present: false
```

카시안은 닫힌 회수 밸브와 압력을 확인하지 않고 `열 + 흐름`을 사용해 배관 균열과 냉기 누출을 일으킨다. 입력과 문법은 맞았지만 상황·경로·출구 판단에 실패한 사례다. 카시안은 즉시 책임을 인정하고 내부 밸브·격벽 조작으로 해결에 협력한다.

---

## 교수의 외곽 회로

교수는 학교 회랑으로 퍼지는 냉기만 외곽 `열 + 흐름` 회로로 막는다.

```text
호박색 빛이 외벽을 따라 이동
→ 따뜻한 기운이 퍼짐
→ 유리 서리가 녹음
→ 밖으로 향하던 냉기의 방향이 바뀜
→ 외부 확산만 차단
```

```yaml
role: ONE_VALID_EXAMPLE_NOT_CANONICAL_ANSWER
required_player_route: false
default_best_solution: false
used_as_grading_key: false
full_circuit_copy: false
faculty_solves_internal_objective: false
```

교수의 방식은 “이렇게도 할 수 있다”는 예시다. 플레이어는 교수와 다른 목표·열원·경로·보조·물리 협력으로 해결할 수 있다.

---

## 조사형 키워드 확인

자동 글자 판독 오버레이를 사용하지 않는다.

```text
빛이 시작된 문양 조사
→ [확인한 키워드: 열]

빛이 이동한 선 조사
→ [확인한 키워드: 흐름]

모서리 문양 조사
→ 미학습 고급 구조 / 해독 불가
```

조사는 신규 글자 해금이 아니며 행동 횟수와 실시간 시간을 소모하지 않는다.

---

## 관찰 결과 UX

```text
따뜻한 기운이 느껴진다.
회로가 지나간 유리의 서리가 녹는다.
밖으로 나가려던 냉기가 방향을 바꿨다.
온실 안쪽의 붉은 압력계는 그대로다.
```

2~4줄의 감각과 실제 변화만 표시한다. 시스템은 원리·추천 주문·정답·성공률·결말을 설명하지 않는다.

---

## 복수 해결 계약

```yaml
approaches: 5
solution_patterns_per_approach: 4
total_reference_patterns: 20
explicit_answer_menu: false
reasonable_unlisted_solution: ALLOWED_BY_MEANING_AND_SITUATION_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

대표 접근:

1. 시설 복구
2. 생존 확보
3. 정령 안정화·교섭
4. 현상 봉쇄
5. 제압·시간 확보

다른 합리적 방법도 허용한다. 판정은 교수 예시와의 일치가 아니라 글자 의미·출발점·경로·목표·대가·실제 상태 변화로 수행한다.

---

## 기존 시스템 계약

### Stock

```yaml
shared_capacity: 8
active_charge_targets: 1
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
stock_use_mana_cost: 0
offline_charge: false
```

### Summon

```yaml
persistent_main_summon: 1
secondary_slots: [S1, S2, S3]
total_active_summon_cap: 4
same_time_event_order: [MAIN, S1, S2, S3]
```

소환수는 조사·수호·견제·운반을 보조하지만 주문 설계를 대신하지 않는다.

### State·Ledger·Save

- 소환·교체·마나·활성은 한 Transaction이다.
- Stock 소비와 결과 적용은 한 Transaction이다.
- Exactly-once 소유자는 ResultLedger다.
- 손상 Snapshot은 자동 덮어쓰지 않는다.
- Offline·Background 경과로 전투·치유·충전을 생성하지 않는다.

---

## 보호 경계

```text
FACULTY_EXAMPLE_AS_ONLY_SOLUTION = PROHIBITED
FACULTY_EXAMPLE_AS_GRADING_KEY = PROHIBITED
PLAYER_REQUIRED_TO_COPY_FACULTY_CIRCUIT = PROHIBITED
REASONABLE_UNLISTED_SOLUTION_REJECTED_BY_DEFAULT = PROHIBITED
AUTOMATIC_GLYPH_RECOGNITION_OVERLAY = PROHIBITED
OBSERVATION_RESULT_EXPLAINS_CAUSAL_SOLUTION = PROHIBITED
PROFESSOR_VERBALLY_NAMES_SOLUTION = PROHIBITED
PROFESSOR_CIRCUIT_COPY_BUTTON = PROHIBITED
UNKNOWN_ADVANCED_GLYPH_AUTOMATICALLY_GRANTED = PROHIBITED
UPPERCLASS_APPEARANCE_IN_FROSTBLOOM_EVENT = PROHIBITED
HEAT_DELETES_COLD_WITHOUT_COST = PROHIBITED
FACULTY_SOLVES_INTERNAL_OBJECTIVE = PROHIBITED
SINGLE_TRUE_ENDING = PROHIBITED
```

---

## 다음 우선순위

1. 사건 UX Map.
2. Mobile Landscape Wireframe.
3. 온실·열 회로·서리 정령 Art Direction.
4. 장면별 Asset Brief.
5. 선택 범위의 Codex 구현 명세.

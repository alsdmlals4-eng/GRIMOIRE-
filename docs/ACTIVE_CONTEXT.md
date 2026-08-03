# GRIMOIRE Active Context

> 과거 대화 없이 프로젝트의 현재 승인 상태와 검토 중 Draft를 구분해 복원하는 권위 문서다.

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
current_working_sync: GR-SYNC-20260804-07-HEAT-FLOW-INVESTIGATION-DRAFT
approved_current_decision: GM-SCHOOL-CRISIS-PEDAGOGY-01
approved_situation_decision: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
draft_glyph_observation_decision: GM-SLICE-HEAT-FLOW-OBSERVATION-01
draft_cast_dialogue_decision: GM-FROSTBLOOM-CAST-DIALOGUE-01
grill_counter: 3_of_10
pending_approved_decisions: 3
current_gpt_focus: TEXT_NOVEL_GLYPH_INVESTIGATION_AND_SENSORY_OBSERVATION
product_project_godot: NOT_CREATED
product_code: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

Draft 수정은 아직 별도 승인 Decision으로 계산하지 않는다.

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
3. `docs/planning/SLICE_HEAT_FLOW_OBSERVATION_01_DRAFT_2026-08-04.md`
4. `docs/planning/FROSTBLOOM_CAST_DIALOGUE_01_DRAFT_2026-08-04.md`
5. `docs/content/vertical_slice/FROSTBLOOM_GREENHOUSE_DIALOGUE_SCRIPT_DRAFT_2026-08-04.md`
6. `docs/superpowers/specs/2026-08-04-frostbloom-cast-dialogue-design.md`
7. `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`
8. `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md`
9. `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`
10. `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`
11. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
12. `docs/planning/sync/GR-SYNC-20260804-07-HEAT-FLOW-INVESTIGATION-DRAFT.md`

---

## 승인된 플레이어 약속

> 마법학교 학생이 상황을 읽고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자와 회로로 해결 의도를 구현하고 결과와 대가를 책임지는 마법 RPG.

```text
상황·환경·인물 조사
→ 해결 의도와 우선순위 선택
→ 주문 설계와 예상 효과 확인
→ 직접 작성·Stock·소환수 중 실행 수단 선택
→ 명시적 Commit
→ 설명 가능한 세계 변화
→ 결과·대가·발견 기록
```

전투는 여러 해결 방식 중 하나이며 필수가 아니다.

---

## 승인된 학교 위기 교육 원칙

```yaml
L0: 정상 시행착오·비치명적 손실 관찰
L1: 놓친 조건을 좁히는 방향 제시
L2: 돌이킬 수 없는 위험 직전 안전 경고
L3: 생명 위험만 직접 차단·구조
```

- 교수는 핵심 목표를 대신 해결하지 않는다.
- 교수는 외곽 확산과 생명 위험만 통제한다.
- 학생은 접근 변경·지원 요청·봉쇄 후 철수를 선택할 수 있다.
- 철수는 자동 실패나 비겁함으로 처리하지 않는다.

---

## 대표 사건의 최소 인물 구조 Draft

```yaml
persistent_cast:
  - 에일린_로스베르_교수
  - 카시안_렌_동급생
  - 모트_동반정령
upperclass_present: false
```

- 카시안은 같은 1학년이다.
- 상급생은 이번 사건에 등장하지 않는다.
- 시설 정보는 도면·계기·표식·주문 잔향으로 전달한다.
- 필수 정보는 최소 두 경로로 제공한다.

---

## 열·흐름 문법 Draft

기존 확정 상태:

```yaml
main_glyph: FLOW
support_glyphs: [FOCUS, DISPERSE]
```

사용자 수정 Draft:

```yaml
main_glyph: HEAT
connection_grammar: FLOW
optional_support_glyphs: [FOCUS, DISPERSE]
representative_known_circuit: HEAT_PLUS_FLOW
status: REQUIRES_EXPLICIT_SUPERSESSION
```

- `열`은 현상을 발생시키는 메인 글자다.
- `흐름`은 열을 목표와 경로에 따라 전달·순환시키는 연결 문법이다.
- `집중·분산`은 열의 강도와 범위를 조절한다.
- 승인 전 기존 `흐름 메인` 책임 원본을 폐기하지 않는다.

---

## 카시안 사고 Draft

```text
결빙 보조관을 빠르게 해빙하려 함
→ 열 발생
→ 닫힌 회수 밸브 안으로 흐름 전달
→ 열팽창·압력 상승
→ 배관 균열
→ 냉기 누출·핵 안전 정지
→ 자동 격벽과 카시안 고립
→ 정령 과부하
```

```yaml
input: VALID
circuit_grammar: VALID
situation_fit: INVALID
failure_type: SITUATION_DESIGN_FAILURE
```

카시안은 즉시 사고를 인정하고 수동 밸브·격벽 조작과 내부 정보 제공으로 해결에 기여한다.

---

## 교수의 비언어적 안전 회로 Draft

교수는 외부로 번지는 냉기만 회로로 막으며 사용법을 설명하지 않는다.

```text
호박색 빛이 외벽을 따라 이동
→ 따뜻한 기운이 퍼짐
→ 지나간 유리의 서리가 녹음
→ 밖으로 나가려던 냉기의 방향이 바뀜
→ 학교 회랑 확산만 차단
```

상태:

```yaml
external_spread: RISING -> CONTAINED
internal_pressure: CRITICAL -> CRITICAL
greenhouse_core: STOPPED -> STOPPED
cassian: TRAPPED -> TRAPPED
spirit_overload: RISING -> RISING
```

교수 발화 허용:

- `외부 확산은 막았다.`
- `내부 문제는 그대로다.`
- L2·L3 안전 경고

교수는 회로 이름·효과 원리·추천 목표를 설명하지 않는다.

---

## 조사형 키워드 확인 Draft

자동 `[인식]` 오버레이를 사용하지 않는다. 플레이어가 텍스트 노벨 조사로 이미 배운 키워드를 다시 확인한다.

```text
빛이 시작된 문양을 살핀다
→ 수업에서 익힌 형태와 따뜻한 기운
→ [확인한 키워드: 열]

빛이 이동한 선을 따라간다
→ 익숙한 연결선이 외벽을 따라 이어짐
→ [확인한 키워드: 흐름]

모서리 문양을 살핀다
→ 미학습 고급 구조
→ 해독 불가
```

- 조사 선택은 행동 횟수와 실시간 시간을 소모하지 않는다.
- 조사하지 않아도 사건 진행과 안전 봉쇄·철수는 가능하다.
- 키워드 확인은 새 글자 해금이 아니다.

---

## 관찰 결과 UX Draft

플레이어에게는 감각과 실제 상태 변화만 표시한다.

```text
따뜻한 기운이 느껴진다.
회로가 지나간 유리의 서리가 녹는다.
밖으로 나가려던 냉기가 방향을 바꿨다.
온실 안쪽의 붉은 압력계는 그대로다.
```

상황에 따라 2~4줄만 사용한다.

금지:

- `열이 흐름 경로를 따라 이동했다` 같은 시스템 해설
- 자동 `열+흐름 회로 확인` 표시
- 해결 가능한 대상·경로 추천
- 성공률·최종 결말·교수 회로 복사

---

## 사건 흐름 Draft

```text
1학년 실습
→ 카시안의 열·흐름 오용
→ 교수 외곽 안전 회로
→ 감각 중심 관찰 결과
→ 선택형 회로 조사로 열·흐름 확인
→ 조사 4개 중 2개
→ 교수·카시안·모트 관점 확인
→ 5개 해결 접근 선택
→ 주문 초안·예상 효과
→ 첫 시전
→ 두 번째 균열과 재설계
→ 최종 대응 또는 철수
→ 결과·교수 개입 여부
→ 마도서 기록
```

---

## 복수 해결 계약

```yaml
approaches: 5
solution_patterns_per_approach: 4
total_reference_patterns: 20
explicit_answer_menu: false
reasonable_unlisted_solution: MEANING_BASED_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

기존 20개 패턴은 승인된 `흐름 메인` 문법을 사용한다. 새 Draft가 승인되면 `열 메인 + 흐름 경로` 문법으로 명시적으로 보정한다.

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
PROFESSOR_VERBALLY_NAMES_SOLUTION = PROHIBITED
AUTOMATIC_GLYPH_RECOGNITION_OVERLAY = PROHIBITED
OBSERVATION_RESULT_EXPLAINS_CAUSAL_SOLUTION = PROHIBITED
PROFESSOR_CIRCUIT_COPY_BUTTON = PROHIBITED
UNKNOWN_ADVANCED_GLYPH_AUTOMATICALLY_GRANTED = PROHIBITED
UPPERCLASS_APPEARANCE_IN_FROSTBLOOM_EVENT = PROHIBITED
CLASSMATE_ACCIDENT_AS_MALICIOUS_PRANK = PROHIBITED
CLASSMATE_AS_PASSIVE_NUISANCE_ONLY = PROHIBITED
HEAT_DELETES_COLD_WITHOUT_COST = PROHIBITED
FACULTY_SOLVES_INTERNAL_OBJECTIVE = PROHIBITED
SILENT_CANON_SUPERSESSION_BEFORE_APPROVAL = PROHIBITED
```

---

## 다음 우선순위

1. 조사형 `열·흐름` 확인과 감각 중심 관찰 결과 검토
2. `열 메인 + 흐름 경로` Draft 검토
3. 승인 시 20개 해결 패턴과 상위 Curriculum 정본 보정
4. 상황 UX Wireframe
5. 온실·정령·회로 Art Direction
6. 승인 범위의 Codex 구현 명세

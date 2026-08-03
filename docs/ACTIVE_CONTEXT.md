# GRIMOIRE Active Context

> 과거 대화 없이 프로젝트 현재 상태를 복원하는 권위 문서다. 세부 규칙은 연결된 최신 Decision 책임 원본을 우선한다.

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/foundation-poc-readiness-review
pull_request: 57
primary_platform: Mobile
follow_up_platform: PC
mobile_orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
base_release: v9.4.3
main_authority: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
last_main_sync: GR-SYNC-20260803-06
current_working_sync: GR-SYNC-20260803-07
current_decision_id: GM-SCHOOL-CRISIS-PEDAGOGY-01
parent_situation_decision_id: GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01
current_decision_status: USER_APPROVED_PEDAGOGY_SCENE_FLOW_WRITTEN_FOR_REVIEW
grill_counter: 3_of_10
pending_distinct_decisions: 3
local_godot_installation: USER_CONFIRMED_INSTALLED
foundation_poc_technical_plan: READY_FOR_LATER_CODEX_SESSION
foundation_poc_product_code: NOT_STARTED
current_gpt_focus: FROSTBLOOM_SCENE_FLOW_DIALOGUE_UX_ART
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 역할 분리

```text
GPT
→ 핵심 재미를 정의·검증한다.
→ 콘텐츠와 플레이 경험을 설계한다.
→ UX·Wireframe·이미지·아트 방향을 만든다.
→ 적대적 검토로 충돌·누락·제작비용을 찾는다.
→ 승인된 결과를 Codex 구현 명세로 넘긴다.

Codex
→ 승인된 명세를 Godot에서 구현한다.
→ project.godot·GDScript·Scene·Resource·테스트·CI를 만든다.
→ Runtime·실기기·성능 증거를 실제 실행으로 남긴다.
```

사용자 PC에는 Godot이 설치되어 있다고 확인됐다. 로컬 실행 파일 경로·정확한 버전·Headless 증거는 이후 Codex 세션에서 확인한다. 이 설치 확인은 GPT의 핵심 재미·콘텐츠·아트 작업을 막지 않는다.

## 복원 순서

GPT 기획 작업:

1. `AGENTS.md`.
2. `START_HERE.md`.
3. 이 문서.
4. `docs/planning/SCHOOL_CRISIS_PEDAGOGY_01_APPROVAL_2026-08-04.md`.
5. `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md`.
6. `docs/planning/NARRATIVE_MULTI_SOLUTION_SITUATION_01_ROUTE_GUIDANCE_APPROVAL_2026-08-04.md`.
7. `docs/superpowers/specs/2026-08-04-frostbloom-route-patterns-and-precast-guidance-design.md`.
8. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
9. `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.
10. 질문 주제의 최신 승인 책임 원본.
11. `docs/DESIGN_DOCUMENT_REGISTRY.json`.

Codex 구현 작업:

1. 위 공통 정본.
2. `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
3. `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
4. `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.

## 플레이어 약속

> 마법학교 학생이 사건과 상황을 읽고 무엇을 지킬지 선택한 뒤, 의미를 가진 글자로 자신의 해결 의도를 주문으로 구현하며, 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

```text
사건·인물·환경 조사
→ 해결 의도와 우선순위 선택
→ 주문 의미·대상·범위·출력·대가 설계
→ 직접 작성·Stock·소환수 중 실행 수단 선택
→ 명시적 Commit
→ 설명 가능한 세계 변화
→ 결과·대가·발견 기록
```

## 승인된 사건 콘텐츠 구조

Decision: `GM-NARRATIVE-MULTI-SOLUTION-SITUATION-01`.

```text
텍스트 선택
= 해결 의도·우선순위

등장인물 대화
= 관찰 사실·편향·위험 방향

예상 효과 카드
= 직접 효과·속도·범위·압력·위험·미해결 문제

주문 설계
= 실제 실행 방법
```

텍스트 선택지가 주문을 자동 선택하거나 성공을 보장하지 않는다. 전투는 여러 해결 방식 중 하나이며 기본값이 아니다.

### 복수 해결 계약

```yaml
recommended_approaches: 5
recommended_noncombat_approaches: 4
target_solution_patterns_per_approach: 4
target_total_reference_patterns: 20
reasonable_unlisted_solution: MEANING_BASED_EVALUATION
combat_is_mandatory: false
single_true_ending: false
```

### 대표 사건

```yaml
situation_id: FROSTBLOOM_GREENHOUSE_HEART
title: 서리꽃 온실의 심장
approaches:
  - 시설 복구
  - 생명 구조 우선
  - 정령 안정화·교섭
  - 현상 봉쇄
  - 전투·강제 제압
```

대표 사건에서 정령은 원인처럼 보이지만 실제로는 냉기 누출의 피해자일 수 있다. 조사 정보에 따라 전투 외 교섭·복구·구조·봉쇄가 동등한 유효 해결법이 된다.

## 승인된 학교 위기 교육 원칙

Decision: `GM-SCHOOL-CRISIS-PEDAGOGY-01`.

> 마법사는 위기에서 스스로 상황을 읽고 해결할 수 있어야 한다. 교수는 정답을 대신 실행하지 않고 방향성과 안전 기준만 제시한다. 직접 개입은 학생 또는 민간인의 생명이 즉시 위험한 수준에서만 허용한다.

### 교수 개입 단계

```yaml
L0: 정상 시행착오·비치명적 손실은 관찰
L1: 판단 질문과 원리 방향만 제시
L2: 돌이킬 수 없는 위험 직전 안전 경고
L3: 치명 위험만 직접 차단·구조
```

교수는 외곽 확산과 치명 위험을 통제하지만 온실 내부의 핵·배관·정령·구조 문제를 대신 해결하지 않는다.

직접 개입 조건:

- 즉시 회피하기 어려운 치명 공격
- 의식 상실 또는 마력 회로 붕괴
- 한 번의 판단 기회 안에 발생할 치명 구조물·핵 붕괴
- 온실 밖 생명까지 위협하는 통제 불가능한 연쇄 폭주

직접 개입 시에도 교수는 치명 위험만 제거하고 사건 전체를 정상화하지 않는다. 개입은 조롱이나 게임 오버가 아니라 `FACULTY_LIFESAVING_INTERVENTION` 결과 태그와 복기 장면으로 처리한다.

학생은 언제든 접근 변경·지원 요청·봉쇄 후 철수를 선택할 수 있다. 철수는 자동 실패가 아니라 위험 관리와 책임 판단으로 평가한다.

## 텍스트 노벨 장면 흐름

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

- 기본 조사 4개 중 2개 선택.
- 자유일정 C에서 현장 조사를 선택했다면 3개까지 가능.
- 기본 관찰만으로도 안전 봉쇄·철수 해법을 찾을 수 있다.
- 핵심 생존 정보는 관계 선택 하나에 독점시키지 않는다.
- 대화·조사·예상 효과 확인 중 실시간 타이머는 흐르지 않는다.
- 첫 시전 후 공통 변수가 발생하며 접근을 바꿀 수 있다.

## 결과·평가 계약

단일 총점보다 다음 축을 기록한다.

```yaml
evaluation_axes:
  - situation_understanding
  - life_protection
  - facility_preservation
  - mana_efficiency
  - risk_management
  - creative_spell_use
  - spirit_relationship
  - decision_responsibility
  - independent_completion
```

유효 결말 예:

- 완전 복구
- 생명 우선 대피
- 정령 화해
- 안전 봉쇄
- 강제 제압
- 대가를 동반한 부분 복구
- 교수 생명 구조 개입 후 복기

### 실패 구분

```text
INPUT_FAILURE
GRAMMAR_FAILURE
SITUATION_DESIGN_FAILURE
PRIORITY_FAILURE
RESOURCE_EXHAUSTION
FACULTY_LIFESAVING_INTERVENTION
```

입력 실패를 상황 판단 실패로 기록하지 않는다.

## 기존 확정 시스템 계약

### 마법 글자

```yaml
main_glyphs: [FLOW]
support_glyphs: [FOCUS, DISPERSE]
safe_grammar: MAIN_1_PLUS_SUPPORT_0_OR_1
```

- `흐름`은 이미 존재하는 냉기·온기·마력·공기·물의 이동 경로를 바꾼다.
- `집중`은 빠르고 정밀하지만 과압·역류·국부 손상 위험이 있다.
- `분산`은 넓고 안전하지만 느리고 출력이 약해질 수 있다.
- 미학습 글자의 효과를 숨겨 제공하지 않는다.

### Stock

```yaml
stock_types: [FULL_SPELL, SUB_GLYPH]
shared_capacity: 8
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
active_charge_targets: 1
stock_use_mana_cost: 0
offline_charge: false
```

Stock은 해결 접근을 자동 선택하지 않고 이미 이해한 글자의 빠른 실행만 돕는다.

### Summon

```yaml
persistent_main_summon: 1
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_slots: [S1, S2, S3]
secondary_role_duplicate_cap_in_slice: 1
summon_duration_limit: NONE
resummon_cooldown: NONE
summon_spell_mana_cost: 2
support_cycle_seconds: 5
same_time_event_order: [MAIN, S1, S2, S3]
```

소환수는 전투뿐 아니라 조사·수호·견제·운반·안정화 보조로 활용하지만 글자 선택·연결·Commit을 대신하지 않는다.

### State·Ledger·Save

- 보조 `slot_id`와 `primary_role`은 Slice에서 각각 유일하다.
- 소환·교체·마나·활성은 한 Transaction이다.
- Stock 소비와 결과 적용은 한 Transaction이다.
- Exactly-once 소유자는 `ResultLedger`다.
- 손상 Snapshot은 자동 덮어쓰지 않는다.
- Background·Offline 경과로 공격·치유·Stock 지원을 생성하지 않는다.

### Mobile Summon HUD

```yaml
layout: LEFT_SAFE_AREA_VERTICAL_COMPACT_RAIL
slot_order: [MAIN, S1, S2, S3]
detail: ONE_CONTEXTUAL_DRAWER
drawer_read_pauses_clock: false
management_confirmation_pauses_clock: true
management_entry_requires_safe_draft: true
same_time_event_presentation_budget_seconds_total: 1.2_TEST_VALUE
text_scale_tests: [1.00, 1.30, ANDROID_MAX_2.00]
timer_announcement: FOCUS_OR_MEANINGFUL_CHANGE_ONLY
active_stroke_owner: WRITING_CANVAS
event_dedup_owner: RESULT_LEDGER
hud_mutates_gameplay_state: false
```

## 적대적 검토 보호 경계

```text
TEXT_CHOICE_AUTO_SELECTS_SPELL = PROHIBITED
TEXT_CHOICE_AUTO_GUARANTEES_SUCCESS = PROHIBITED
COMBAT_AS_DEFAULT_OR_MANDATORY_RESOLUTION = PROHIBITED
SINGLE_TRUE_ENDING_FOR_REPRESENTATIVE_SITUATION = PROHIBITED
NONCOMBAT_APPROACH_AS_ALWAYS_SLOWER_OR_WORSE = PROHIBITED
MORAL_GOOD_BAD_BINARY_CHOICES = PROHIBITED
INDEPENDENT_MAP_PER_BRANCH_IN_VERTICAL_SLICE = PROHIBITED
PROFESSOR_SOLVES_CORE_OBJECTIVE = PROHIBITED
PROFESSOR_NAMES_CORRECT_GLYPH_COMBINATION = PROHIBITED
LIFE_THREAT_WITHOUT_FACULTY_RESPONSE = PROHIBITED
WITHDRAWAL_AS_AUTOMATIC_GAME_OVER = PROHIBITED
FACULTY_INTERVENTION_AS_HUMILIATION = PROHIBITED
```

## 현재 GPT 산출물 우선순위

1. 작성된 `서리꽃 온실의 심장` 학교 위기 장면 흐름 검토.
2. 고유 인물 이름·성격 확정.
3. 실제 텍스트 노벨 대사 원고.
4. 접근별 예상 효과 카드 문구 세트.
5. 사건 UX Map과 Wireframe.
6. 온실·서리 정령·마력 핵 Art Direction과 Concept Art Brief.
7. Vertical Slice 전체 콘텐츠 조립.
8. 선택된 범위의 Codex 구현 명세와 Acceptance Criteria.

## 기술 구현 보관 상태

```yaml
codex_handoff: docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md
codex_execution_overlay: docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md
local_godot: USER_CONFIRMED_INSTALLED
ci_godot: PASS_4_7_1
product_project: NOT_CREATED
product_code: NOT_STARTED
codex_execution: DEFERRED_UNTIL_CREATIVE_SCOPE_IS_READY
```

## 현재 하지 않는 것

```text
GPT 대화에서 제품 Godot 프로젝트 구현
GPT 대화에서 GDScript·Scene 작업을 주 작업으로 전환
구현 준비를 핵심 재미·콘텐츠·아트보다 우선
실행하지 않은 Runtime·실기기·성능·접근성·사람 검증을 PASS 처리
```

## 다음 작업

1. `docs/superpowers/specs/2026-08-04-frostbloom-school-crisis-scene-flow-design.md`의 장면 흐름을 검토한다.
2. 고유 인물 이름과 역할 대비를 확정한다.
3. 실제 장면별 대사·선택지·예상 효과 카드 원고를 작성한다.
4. 사건 UX Wireframe을 설계한다.
5. Art Direction과 첫 Concept Art Brief를 만든다.
6. 충분히 구체화된 범위만 Codex 구현 명세로 넘긴다.

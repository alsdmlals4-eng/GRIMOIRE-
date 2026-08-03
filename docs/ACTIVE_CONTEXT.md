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
grill_counter: 1_of_10
pending_distinct_decisions: 1
local_godot_installation: USER_CONFIRMED_INSTALLED
foundation_poc_technical_plan: READY_FOR_LATER_CODEX_SESSION
foundation_poc_product_code: NOT_STARTED
current_gpt_focus: CORE_FUN_CONTENT_UX_IMAGE_ART
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
4. `docs/planning/GPT_CREATIVE_PLANNING_SCOPE_2026-08-03.md`.
5. 질문 주제의 최신 승인 책임 원본.
6. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
7. `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.
8. `docs/DESIGN_DOCUMENT_REGISTRY.json`.

Codex 구현 작업:

1. 위 공통 정본.
2. `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
3. `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
4. `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.

## 플레이어 약속

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 운용해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

```text
상황·위험 판독
→ 직접 작성·Stock·소환수 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit
→ 원자 결과 적용
→ 예상과 실제 결과 비교
→ 마도서 기록·복기·발견
```

## 현재 GPT 기획 질문

### 핵심 재미

- 플레이어가 반복해서 하고 싶은 가장 뾰족한 행동은 무엇인가.
- 글자를 직접 쓰는 행위가 단순 입력이 아니라 판단과 책임을 만드는가.
- 직접 작성·Stock·소환수의 선택이 상황에 따라 달라지는가.
- 결과가 플레이어가 설계한 의미와 대가를 설명 가능하게 보여주는가.
- 마도서 복기가 다음 플레이의 발견으로 이어지는가.

### 콘텐츠

- Vertical Slice에서 어떤 한 사이클로 게임의 약속을 증명할 것인가.
- 첫 수업·제작·현장실습·전투를 어떤 순서로 경험하게 할 것인가.
- 어떤 글자와 조합을 먼저 가르칠 것인가.
- 대표 사건·적·환경 퍼즐이 시스템 선택을 어떻게 요구하는가.
- 실패가 입력·문법·상황 판단 중 무엇 때문인지 어떻게 전달하는가.

### UX

- Main·Grimoire·수업·제작·현장·전투 화면이 어떻게 이어지는가.
- 작성 Canvas, 후보, Commit, 결과 설명이 한 흐름으로 읽히는가.
- Stock과 소환수 HUD가 작성 판단을 방해하지 않는가.
- Mobile Landscape에서 Safe Area·터치 영역·텍스트 크기가 유지되는가.

### 이미지·아트

- GRIMOIRE만의 시각적 정체성은 무엇인가.
- 글자·마도서·주문·소환수가 기능을 시각적으로 설명하는가.
- 학교와 전투 공간이 같은 세계의 규칙을 공유하는가.
- 캐릭터·환경·UI·아이콘·이펙트에 일관된 형태·재질·조명 규칙이 있는가.
- Concept Art가 실제 Godot Asset으로 분해 가능한가.

## 기존 확정 시스템 계약

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

## 현재 GPT 산출물 우선순위

1. 핵심 재미 정의와 반례 검증.
2. Vertical Slice 대표 콘텐츠 조립안.
3. 전체 UX Map과 핵심 화면 Wireframe.
4. Art Direction·Moodboard·Style Guide.
5. Concept Art·UI Mockup·이미지 Prompt.
6. 1학년 Chapter Map과 글자 Catalog.
7. 결과 평가·성장·경제·전투 수치.
8. Codex 구현용 명세와 Acceptance Criteria.

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

1. 핵심 재미를 플레이 단위로 재검증한다.
2. Vertical Slice 대표 콘텐츠를 선정한다.
3. Main·Grimoire·전투·작성 전체 UX 지도를 만든다.
4. 게임 전체 Art Direction과 첫 이미지 시안을 만든다.
5. 기획이 충분히 구체화된 범위만 Codex 구현 명세로 넘긴다.
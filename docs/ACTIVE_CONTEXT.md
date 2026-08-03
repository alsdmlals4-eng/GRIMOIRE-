# GRIMOIRE Active Context

> 과거 대화 없이 프로젝트 현재 상태를 복원하는 권위 문서다. 세부 규칙은 연결된 최신 Decision 책임 원본을 우선한다.

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/mobile-summon-hud-spec-hardening
primary_platform: Mobile
follow_up_platform: PC
mobile_orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE_WITH_CONDITIONAL_FOUNDATION_POC_ENTRY
work_mode: PLAN
base_release: v9.4.3
main_authority_commit: 7fd2c137469120a9ccf942df5b9860af135acc87
last_main_sync: GR-SYNC-20260803-04
last_working_sync: GR-SYNC-20260803-05
last_merged_pull_request: 51
last_decision_merge_commit: 81852a767d60eb2aa835ac3e36309f1dc43c861d
grill_counter: 0_of_10
pending_distinct_decisions: 0
mobile_summon_hud_spec: USER_APPROVED_HARDENED_SPEC_ACTIVE
mobile_summon_hud_tdd_plan: WRITTEN_NOT_EXECUTED
next_priority: GODOT_TOOLCHAIN_PREFLIGHT_AND_BASE_V9_4_3_PLAN_REVALIDATION
p0_open: 0
p1_open: 2
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
implementation: NOT_STARTED
codex_plan: WRITTEN_AWAITING_MERGE_AND_READINESS_REVALIDATION
codex_execution: BLOCKED_BY_EXECUTION_READINESS_GATE
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 복원 순서

1. `AGENTS.md`.
2. `START_HERE.md`.
3. 이 문서.
4. `docs/DEVELOPMENT_GATES.md`.
5. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
6. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
7. `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`.
8. `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_USER_SPEC_REVIEW_2026-08-03.md`.
9. `docs/superpowers/specs/2026-08-03-three-slot-mobile-summon-hud-design.md`.
10. `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
11. `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.
12. `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`.
13. `docs/planning/benchmarks/MOBILE_SUMMON_HUD_WIREFRAME_STANDARD_BENCHMARK_2026-08-03.md`.
14. `docs/planning/PLANNING_REMAINDER_AUDIT_2026-08-02.md`.
15. `docs/planning/sync/GR-SYNC-20260803-05-WORKING.md`.
16. `docs/planning/sync/GR-SYNC-20260803-04-MAIN.md`.

## 플레이어 약속

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 운용해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

## 핵심 재미

```text
상황·위험 판독
→ 직접 작성·준비 Stock·[소환 주문] 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit
→ 원자 결과 적용
→ 설명 가능한 세계 변화
→ 마도서 기록·복기
```

핵심은 필기 속도나 자동화량이 아니라 무엇을 바꾸고 무엇을 포기할지 결정하는 것이다.

## 시스템 계층

1. 비타협 핵심 플레이: 상황 판독·의미 조합·Commit·설명 가능한 결과·복기.
2. 핵심 진행: 학습 나선·다계열 수강·포트폴리오·학기 평가.
3. 적용 모드: 비전투 Situation·전투·제작·현장실습.
4. 보조·운용: 자유일정·관계·Stock·소환수·재료·도구.
5. 전달·안전·기술: Mobile UX·Recognition·Atomic Ledger·Save/Resume·접근성.

## Stock 최신 계약

책임 원본:

- `docs/planning/STOCK_SYSTEM.md`.
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`.
- `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`.

```yaml
stock_types: [FULL_SPELL, SUB_GLYPH]
shared_capacity: 8
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
active_charge_targets: 1
stock_use_mana_cost: 0
offline_charge: false
```

- 기능 글자 수 `n`의 충전시간은 `10 + 5 × (n - 1)초`다.
- 지정 대상 1종만 자연충전한다.
- 소환수 `[스톡] N`은 5초마다 현재 대상 남은 시간을 `N초` 감소시킨다.
- 초과 감소량 이월·자동 대상 변경·Offline 충전을 금지한다.

## 소환수 최신 계약

책임 원본: `docs/planning/SUMMON_SYSTEM_01_APPROVAL_2026-08-02.md`.

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
```

- 보조 역할은 `PRODUCTION / GUARDIAN / ASSAULT / RECOVERY`다.
- Slice에서는 네 역할 중 최대 세 역할을 편성하며 보조 사이 같은 역할 중복을 금지한다.
- 기본값은 메인 `[스톡] 1`, 보조 `[스톡] 2 / [방어도] 2 / [공격] 2 / [치유] 2`다.
- 자동 공격은 불안정도 `1` 아래·마지막 해결 Event를 만들 수 없다.
- 같은 시각 Event는 `MAIN → S1 → S2 → S3` 순서다.

## State·Ledger·Save

책임 원본: `docs/planning/STOCK_SUMMON_STATE_INTERFACE_01_APPROVAL_2026-08-02.md`.

- 보조 상태는 `secondary_summon_states` 배열 최대 3개다.
- `slot_id`와 보조 `primary_role`은 각각 유일하다.
- `[소환 주문]`의 마나·교체·활성은 한 Transaction이다.
- Stock 소비와 효과 적용도 한 Transaction이다.
- Exactly-once Event 적용은 `ResultLedger`가 단독 소유한다.
- HUD는 canonical presentation record만 읽는다.
- 슬롯·역할 중복 또는 보조 4체 이상 Save는 자동 수정하지 않는다.
- Background·Offline 경과로 행동·충전 지원을 생성하지 않는다.

## Mobile Summon HUD 확정 계약

책임 원본:

- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`.
- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_USER_SPEC_REVIEW_2026-08-03.md`.
- `docs/superpowers/specs/2026-08-03-three-slot-mobile-summon-hud-design.md`.

```text
좌측 Safe Area MAIN/S1/S2/S3 압축 Rail
+ 선택한 1슬롯 Contextual Drawer
+ 우측 Writing Focus Panel
```

```yaml
drawer_read_pauses_clock: false
management_confirmation_pauses_clock: true
management_entry_requires_safe_draft: true
same_time_event_resolution_order: [MAIN, S1, S2, S3]
same_time_event_presentation_budget_seconds_total: 1.2_TEST_VALUE
text_scale_cases: [1.00, 1.30, ANDROID_MAX_2.00]
timer_announcement: FOCUS_OR_MEANINGFUL_CHANGE_ONLY
active_stroke_owner: WRITING_CANVAS
event_dedup_owner: RESULT_LEDGER
hud_mutates_gameplay_state: false
```

항상 표시:

- 전체 Stock 준비 용량 `현재/8`.
- 현재 충전 대상·수량·남은 초.
- 활성 `[스톡]` 합계.
- MAIN·S1/S2/S3 역할·대표 정수·다음 행동·상태.
- 적 의도·불안정도·환경·플레이어 HP·마나.
- Writing Panel과 Commit.

선택 슬롯에만 대상 규칙·예상 적용값·마지막 Event·관리 요청을 상세 표시한다. Active Stroke 중 Rail 접촉은 선택·Focus 이동·귀환·교체를 발생시키지 않는다.

## TDD Plan·Test Matrix

책임 원본:

- `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
- `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.

상태:

```yaml
plan: WRITTEN_NOT_EXECUTED
matrix: WRITTEN_NOT_EXECUTED
automated_tests: NOT_RUN
runtime_tests: NOT_RUN
device_tests: NOT_RUN
accessibility_tests: NOT_RUN
human_tests: NOT_RUN
```

계획은 nullable ViewModel, 관리 Confirm, Event Queue, Active Stroke, Safe Area, 100/130/200% Text Scale, 접근성 발표, Save/Resume, Scope CI를 독립 TDD 작업으로 분해한다.

## 승인 인게임 아트 중간점검

책임 원본:

- `docs/planning/INGAME_ART_CHECKPOINT_01_APPROVAL_2026-08-03.md`.
- `docs/planning/visual/INGAME_ART_CHECKPOINT_01_APPROVED_MANIFEST.json`.

승인된 Board A/B는 화면 계보와 정보 위계 참고다. 이미지 내 문구·수치·고유명사·최종 UI 배치·Runtime·Asset 생산을 승인하지 않는다.

## 작업 품질 Gate

```text
프로젝트 정본·실제 상태
→ 결정 질문
→ QUICK/STANDARD/DEEP 벤치마킹
→ 공식 사례·현업·표준 비교
→ ADOPT/ADAPT/REJECT
→ 중립 권장안
→ 적대적 검토
→ UTF-8·NFC·Text Integrity
→ GitHub·Sheet Readback
```

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

## Vertical Slice 범위

```text
첫 수업·교내 연습
→ 자유일정
→ 교내 일상 응용·대표 제작 미니게임
→ 학교축제 비전투 응용
→ 첫 현장실습 전투·환경 책임
→ 귀환·마도서 기록
→ 축약 학기 평가·장기 Preview
```

- 목표 `46분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`.
- 대표 글자 `흐름 / 집중 / 분산`.
- 대표 제작 권장 `촉매 배합·안정화 1개`.

## 남은 P1

1. Godot Toolchain preflight.
2. Base v9.4.3 최종 main 기준 Implementation Plan 재검증과 `GM-FOUNDATION-POC-EXECUTION-READINESS-01`.

## 구현 진입 경계

전체 Vertical Slice 구현은 승인되지 않았다. Foundation POC도 Execution Readiness PASS와 별도 Scope 승인 전에는 실행하지 않는다. Stock·소환수 Runtime과 실제 HUD UI는 자동 포함되지 않는다.

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
MOBILE_SUMMON_HUD_SPEC = USER_APPROVED_HARDENED
MOBILE_SUMMON_HUD_TDD_PLAN = WRITTEN_NOT_EXECUTED
MOBILE_SUMMON_HUD_IMPLEMENTATION = NOT_AUTHORIZED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```

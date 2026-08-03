# GRIMOIRE Active Context

> 과거 대화 없이 프로젝트 현재 상태를 복원하는 권위 문서다. 세부 규칙은 연결된 최신 Decision 책임 원본을 우선한다.

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/pr54-main-finalization
primary_platform: Mobile
follow_up_platform: PC
mobile_orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE_WITH_CONDITIONAL_FOUNDATION_POC_ENTRY
work_mode: PLAN
base_release: v9.4.3
main_authority_commit: bf964063b3fa35413f9e5efb07ad831f1617c412
last_main_sync: GR-SYNC-20260803-06
last_working_sync: GR-SYNC-20260803-05
last_merged_pull_request: 54
last_merged_pull_request_head: 5f0689d78f60fa5bdfe8b33d71a874ecf453b120
last_merged_pull_request_commit: bf964063b3fa35413f9e5efb07ad831f1617c412
grill_counter: 0_of_10
pending_distinct_decisions: 0
mobile_summon_hud_spec: USER_APPROVED_HARDENED_SPEC_ACTIVE
mobile_summon_hud_tdd_plan: WRITTEN_NOT_EXECUTED
next_priority: GODOT_TOOLCHAIN_PREFLIGHT_AND_BASE_V9_4_3_PLAN_REVALIDATION
p0_open: 0
p1_open: 2
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
implementation: NOT_STARTED
codex_plan: WRITTEN_NOT_EXECUTED
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
15. `docs/planning/sync/GR-SYNC-20260803-06-MAIN.md`.

## 플레이어 약속

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 운용해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

핵심 재미:

```text
상황·위험 판독
→ 직접 작성·준비 Stock·[소환 주문] 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit
→ 원자 결과 적용
→ 설명 가능한 세계 변화
→ 마도서 기록·복기
```

## Stock 최신 계약

```yaml
stock_types: [FULL_SPELL, SUB_GLYPH]
shared_capacity: 8
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
active_charge_targets: 1
stock_use_mana_cost: 0
offline_charge: false
```

```text
기능 글자 수 n → 10 + 5 × (n - 1)초
```

- 지정 대상 1종만 자연충전한다.
- 충전 대상 전환 시 대상별 진행도를 보존한다.
- 소환수 `[스톡] N`은 5초마다 현재 지정 Stock 남은 시간을 `N초` 감소시킨다.
- 초과 감소량 이월·자동 대상 변경·Offline 충전을 금지한다.

## 소환수 최신 계약

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
- Slice에서는 최대 세 역할을 편성하고 보조 사이 역할 중복을 금지한다.
- 같은 시각 Event는 `MAIN → S1 → S2 → S3`다.
- 자동 공격은 불안정도 `1` 아래·마지막 해결 Event를 만들 수 없다.

## State·Ledger·Save

책임 원본: `GM-STOCK-SUMMON-STATE-INTERFACE-01`.

- 보조 상태는 `secondary_summon_states` 배열로 저장하며 최대 3개다.
- `slot_id`와 보조 `primary_role`은 각각 유일해야 한다.
- `[소환 주문]`의 마나 차감·교체·활성은 한 Transaction이다.
- Stock 소비와 효과 적용도 한 Transaction이다.
- 소환수 행동은 고유 `summon_event_id`로 정확히 한 번만 적용한다.
- 손상 Snapshot은 자동 덮어쓰지 않는다.
- Background·Offline 경과로 행동·충전 지원을 생성하지 않는다.

## Mobile Summon HUD 확정 계약

```yaml
layout: LEFT_SAFE_AREA_VERTICAL_COMPACT_RAIL
slot_order: [MAIN, S1, S2, S3]
detail: ONE_CONTEXTUAL_DRAWER
writing_focus_detail: READ_ONLY_MICRO_DETAIL
drawer_read_pauses_clock: false
management_confirmation_pauses_clock: true
management_entry_requires_safe_draft: true
same_time_event_resolution: ATOMIC_DETERMINISTIC_MAIN_S1_S2_S3
same_time_event_presentation_budget_seconds_total: 1.2_TEST_VALUE
text_scale_tests: [1.00, 1.30, ANDROID_MAX_2.00]
timer_announcement: FOCUS_OR_MEANINGFUL_CHANGE_ONLY
active_stroke_owner: WRITING_CANVAS
event_dedup_owner: RESULT_LEDGER
nullable_empty_error_view_model: true
hud_mutates_gameplay_state: false
```

항상 표시:

- Stock 준비 용량 `현재/8`.
- 현재 충전 대상·수량·남은 초.
- 활성 `[스톡]` 합계.
- 메인·보조 3슬롯 역할·대표 정수·다음 행동 초·상태.
- 적 의도·불안정도·환경·HP·마나.
- Writing Panel과 Commit.

선택한 보조 슬롯에만 대상 규칙·예상 적용값·마지막 Event·귀환·교체를 상세 표시한다.

## 병합 결과

```yaml
pull_request: 54
head: 5f0689d78f60fa5bdfe8b33d71a874ecf453b120
merge_commit: bf964063b3fa35413f9e5efb07ad831f1617c412
pre_merge_ci_run: 30815546367
pre_merge_ci: PASS
changed_files: 15_DOCUMENT_FILES_ONLY
product_code_changed: false
godot_scene_resource_asset_changed: false
```

## 잔여 P1

1. Godot Toolchain preflight.
2. Base v9.4.3 최종 main 기준 Plan 재검증과 `GM-FOUNDATION-POC-EXECUTION-READINESS-01`.

## 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
MOBILE_SUMMON_HUD_SPEC = USER_APPROVED_HARDENED_SPEC_ACTIVE
MOBILE_SUMMON_HUD_TDD_PLAN = WRITTEN_NOT_EXECUTED
MOBILE_SUMMON_HUD_IMPLEMENTATION = NOT_AUTHORIZED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
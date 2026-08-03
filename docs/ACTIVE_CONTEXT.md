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
execution_profile: PLANNING_ONLY_PROFILE_WITH_CONDITIONAL_FOUNDATION_POC_ENTRY
work_mode: PLAN
base_release: v9.4.3
main_authority: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
last_main_sync: GR-SYNC-20260803-06
current_working_sync: GR-SYNC-20260803-07
current_decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
selected_approach: B_STAGE_0_PREFLIGHT_BOOTSTRAP
stage_0_design_scope: USER_APPROVED
stage_0_written_spec: READY_FOR_USER_REVIEW
stage_0_implementation_plan: NOT_WRITTEN
stage_0_diagnostic_code: NOT_STARTED
grill_counter: 1_of_10
pending_distinct_decisions: 1
execution_readiness: FAIL_CLOSED_REMEDIATION_REQUIRED
p0_open: 0
p1_blocking: 4
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
foundation_poc_build_authorization: NOT_GRANTED
implementation: NOT_STARTED
codex_execution: BLOCKED
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
4. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
5. `docs/planning/FOUNDATION_POC_STAGE_0_PREFLIGHT_BOOTSTRAP_APPROVAL_2026-08-03.md`.
6. `docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md`.
7. `docs/planning/FOUNDATION_POC_EXECUTION_READINESS_01_ADVERSARIAL_REVIEW_2026-08-03.md`.
8. `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.
9. `docs/DEVELOPMENT_GATES.md`.
10. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
11. `docs/planning/sync/GR-SYNC-20260803-06-MAIN.md`.

## 플레이어 약속

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 운용해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

```text
상황·위험 판독
→ 직접 작성·준비 Stock·[소환 주문] 중 수단 선택
→ 의미·대상·범위·출력·대가 설계
→ 명시적 Commit
→ 원자 결과 적용
→ 설명 가능한 세계 변화
→ 마도서 기록·복기
```

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

Mobile HUD TDD Plan과 Test Matrix는 `WRITTEN_NOT_EXECUTED`다.

## 현재 Readiness 적대적 검토

```yaml
base_v9_4_3_identity: PASS
planning_ci_at_review_head: PASS
circular_preflight_gate: P1_BLOCKING
official_engine_pin: UNVERIFIED
godot_binary_and_runtime: NOT_RUN
export_templates_and_android: NOT_RUN
canon_reference_freshness: FAIL
foundation_plan_revalidation: NOT_RUN
execution_readiness: FAIL_CLOSED
```

순환 잠금은 기존 Foundation POC 계획의 Task 1이 Toolchain 증거를 만들면서도 Readiness PASS 전 실행 금지에 포함된 데서 발생했다.

## 사용자 승인 Stage 0

Decision: `GM-FOUNDATION-POC-EXECUTION-READINESS-01 / B_STAGE_0_PREFLIGHT_BOOTSTRAP`.

작성 명세 검토와 후속 TDD 계획 승인 뒤 허용 가능한 진단 패키지:

```text
tools/check_godot_toolchain.py
tests/test_foundation_preflight_contract.py
.github/workflows/validate-godot-preflight.yml
docs/validation/GODOT_TOOLCHAIN_PREFLIGHT_REPORT.md
```

필수 특성:

- 실제 binary와 테스트 대역 증거 분리.
- 공식 source 확인 후 exact engine pin.
- Headless·renderer startup·template·Android 상태 기록.
- Renderer probe가 필요하면 저장소 밖 임시 프로젝트만 사용하고 완전 삭제.
- 저장소 제품 경로와 `.godot/` 생성 금지.
- 진단 실패·미설치·네트워크 차단을 PASS로 승격 금지.
- 정본·Adapter·생성물 최신성 해소.
- Base v9.4.3 계획 읽기 전용 재검수.

## 금지 범위

```text
project.godot
.godot/**
src/**
scenes/**
addons/**
data/**
assets/**
content/**
ml/**
training-data/**
```

Stage 0 완료도 Foundation POC 제품 구현을 자동 허가하지 않는다.

## 증거 상태

```yaml
review_pr: 57
review_head_before_approval: 117f4a33ce5ec3ae01e3c734fcf6f6409cee5e2a
review_ci_run: 30819176521
review_generator: PASS
review_unit_tests: PASS
review_json_parse: PASS
review_utf8_nfc: PASS
review_adversarial_gate: PASS
review_sheet_readback: PASS
approval_branch_head_verification: PENDING
```

## 다음 작업

1. 사용자가 작성 명세 `docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md`를 검토한다.
2. 승인 후 `writing-plans`로 Stage 0 TDD 구현 계획을 작성한다.
3. 별도 실행 승인 전에는 진단 코드와 Workflow를 만들지 않는다.
4. 실제 Toolchain 증거와 정본 최신성 PASS 뒤 Readiness를 재판정한다.
5. Foundation POC 제품 구현은 별도 Scope 결정으로 남긴다.

## 검증 경계

```text
STAGE_0_DESIGN_SCOPE = USER_APPROVED
STAGE_0_WRITTEN_SPEC = READY_FOR_USER_REVIEW
STAGE_0_IMPLEMENTATION_PLAN = NOT_WRITTEN
STAGE_0_DIAGNOSTIC_CODE = NOT_STARTED
OFFICIAL_ENGINE_PIN = UNVERIFIED
GODOT_BINARY = NOT_RUN
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE = NOT_STARTED
FOUNDATION_POC_BUILD_AUTHORIZATION = NOT_GRANTED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```

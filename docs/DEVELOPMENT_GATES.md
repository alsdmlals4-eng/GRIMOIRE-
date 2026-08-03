# GRIMOIRE 개발·기획 게이트

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
baseline_date: 2026-08-03
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_branch: agent/foundation-poc-readiness-review
working_sync: GR-SYNC-20260803-07
pull_request: 57
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE_WITH_CONDITIONAL_FOUNDATION_POC_ENTRY
base_release: v9.4.3
core_system_alignment: APPROVED_AND_SYNCED_TO_MAIN
stock_system_01: USER_APPROVED_REVISED_DEFAULTS
summon_system_01: USER_APPROVED_THREE_SECONDARY_REVISED_DEFAULTS
stock_summon_state_interface_01: APPROVED_DESIGN_HARDENED_FOR_HUD
mobile_summon_hud_01: USER_APPROVED_HARDENED_SPEC_ACTIVE
mobile_summon_hud_tdd_plan: WRITTEN_NOT_EXECUTED
work_quality_gate_01: USER_APPROVED_ACTIVE
foundation_poc_readiness_01: FAIL_CLOSED_REMEDIATION_REQUIRED
stage_0_preflight_bootstrap: USER_APPROVED_DESIGN_SCOPE
stage_0_written_spec: READY_FOR_USER_REVIEW
stage_0_implementation_plan: NOT_WRITTEN
stage_0_diagnostic_code: NOT_STARTED
p0_open: 0
p1_blocking: 4
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
implementation_ready: false
implementation: NOT_STARTED
foundation_poc_build_authorization: NOT_GRANTED
codex_execution: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. 전체 경로

```text
핵심 기획·Mobile·시스템 계층 — 완료
→ Stock·Summon·State/Ledger/Save — 승인
→ Mobile Summon HUD 명세 — 승인
→ Mobile HUD TDD Plan·Test Matrix — 작성 완료·미실행
→ Execution Readiness 적대적 검토 — FAIL_CLOSED
→ Stage 0 Preflight Bootstrap 설계 범위 — 사용자 승인
→ 작성된 Stage 0 명세 사용자 검토 — 현재 단계
→ Stage 0 TDD 구현 계획 — 미작성
→ 별도 실행 승인
→ 실제 Toolchain 증거·정본 최신성·Base Plan 재검수
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01 재판정
→ 별도 Foundation POC Build Scope 결정
→ Foundation POC
→ Runtime·Device·Performance·Accessibility·Human Validation
→ Vertical Slice Production Approval
```

## 2. 승인된 프로젝트 방향

- 상황 판독·의미 설계·명시적 Commit·설명 가능한 결과·마도서 복기.
- 상황 해결형 단일 강적 전투와 불안정도 0 진정.
- Mobile Landscape Smartphone 품질 Gate.
- Scene-first Focus Task·Writing Panel.
- Save/Resume Anchor·Session Snapshot·Atomic Result Ledger.
- 학습→응용→책임→복기→발견 순환.
- 1학년 Demo·3학년 Full Game 방향.

별도 시험 Chapter·시험장·시험 전용 미니게임은 사용하지 않는다.

## 3. GM-STOCK-SYSTEM-01 Gate

```yaml
status: USER_APPROVED_REVISED_DEFAULTS
stock_types: [FULL_SPELL, SUB_GLYPH]
shared_capacity: 8
active_charge_targets: 1
one_glyph_charge_seconds: 10
additional_glyph_seconds: 5
stock_use_mana_cost: 0
offline_charge: false
```

```text
기능 글자 수 n의 충전시간 = 10 + 5 × (n - 1)초
```

검증:

- 준비 용량 초과 0.
- 자연충전 대상 자동 변경 0.
- Stock 소비·결과 적용 중복 0.
- Save/Resume 충전 중복 완성 0.
- Stock이 새로운 상황 설계를 전면 대체하지 않음.

## 4. GM-SUMMON-SYSTEM-01 Gate

```yaml
status: USER_APPROVED_THREE_SECONDARY_REVISED_DEFAULTS
persistent_main_summon: 1
secondary_active_summon_cap: 3
total_active_summon_cap: 4
secondary_slots: [S1, S2, S3]
secondary_role_duplicate_cap_in_slice: 1
duration_limit: NONE
cooldown: NONE
summon_spell_mana_cost: 2
support_cycle_seconds: 5
same_time_event_order: [MAIN, S1, S2, S3]
```

보조 역할은 `PRODUCTION / GUARDIAN / ASSAULT / RECOVERY`다. 같은 보조 역할 중복, Offline 행동, 자동 공격의 최종 상황 해결은 금지한다.

## 5. GM-STOCK-SUMMON-STATE-INTERFACE-01 Gate

```yaml
status: APPROVED_DESIGN_HARDENED_FOR_HUD
secondary_state_shape: ARRAY_MAX_3
secondary_slot_uniqueness: REQUIRED
secondary_role_uniqueness_in_slice: REQUIRED
exactly_once_owner: RESULT_LEDGER
hud_event_application: PROHIBITED
```

- 소환·교체·마나·활성은 한 Transaction.
- Stock 소비·주문 효과는 한 Transaction.
- `summon_event_id`와 `stock_charge_event_id` Exactly-once.
- 손상 Save 자동 덮어쓰기 금지.

## 6. GM-MOBILE-SUMMON-HUD-WIREFRAME-01 Gate — CLOSED_SPEC

```yaml
status: USER_APPROVED_HARDENED_SPEC_ACTIVE
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
hud_mutates_state: false
```

현재 상태는 명세 승인 완료이며 Runtime PASS가 아니다.

## 7. Mobile HUD TDD Plan·Test Matrix Gate — CLOSED_PLAN_ONLY

책임 원본:

- `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
- `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.

```yaml
plan_status: WRITTEN_NOT_EXECUTED
matrix_status: WRITTEN_NOT_EXECUTED
runtime_tests: NOT_RUN
device_tests: NOT_RUN
accessibility_tests: NOT_RUN
human_tests: NOT_RUN
```

## 8. GM-FOUNDATION-POC-EXECUTION-READINESS-01 Gate — FAIL_CLOSED

책임 원본:

- `docs/planning/FOUNDATION_POC_EXECUTION_READINESS_01_ADVERSARIAL_REVIEW_2026-08-03.md`.
- `docs/planning/FOUNDATION_POC_STAGE_0_PREFLIGHT_BOOTSTRAP_APPROVAL_2026-08-03.md`.
- `docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md`.

차단 P1:

1. Preflight Task와 Readiness의 순환 잠금.
2. 공식 exact engine pin 미검증.
3. 실제 binary·headless·renderer·templates·Android 증거 부재.
4. Registry·Adapter·생성물 등 활성 정본 최신성 드리프트.

```yaml
base_v9_4_3_identity: PASS
planning_ci: PASS
execution_readiness: FAIL_CLOSED_REMEDIATION_REQUIRED
foundation_poc_build_authorization: NOT_GRANTED
```

## 9. Stage 0 Preflight Bootstrap Gate — USER_APPROVED_DESIGN_SCOPE

향후 작성 명세 검토와 TDD 계획 승인 뒤 허용 가능한 파일:

```text
tools/check_godot_toolchain.py
tests/test_foundation_preflight_contract.py
.github/workflows/validate-godot-preflight.yml
docs/validation/GODOT_TOOLCHAIN_PREFLIGHT_REPORT.md
```

정본 최신성 작업은 등록된 entrypoint, Adapter source, 생성물, Batch, Sync 범위로 제한한다.

금지:

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

Renderer startup에 프로젝트 문맥이 필요하면 운영체제 임시 디렉터리의 일회성 probe project만 허용한다. 성공·실패·timeout 뒤 완전 삭제하고 저장소 변경 0을 검증한다.

Stage 0 증거:

- 공식 source와 exact version pin.
- 실제 binary `--version`.
- Binary-level headless.
- 임시 probe renderer startup과 cleanup.
- Matching export templates.
- Android SDK·JDK·adb 상태.
- iOS host boundary.
- 테스트 대역과 실제 evidence 분리.
- 정본·Adapter·generated views freshness.
- Base v9.4.3 Plan read-only revalidation.

## 10. Stage 0 현재 Gate

```yaml
design_scope: USER_APPROVED
written_spec: READY_FOR_USER_REVIEW
implementation_plan: NOT_WRITTEN
diagnostic_code: NOT_STARTED
execution_authorization: NOT_GRANTED
official_engine_pin: UNVERIFIED
godot_binary: NOT_RUN
headless: NOT_RUN
renderer: NOT_RUN
export_templates: NOT_RUN
android_toolchain: NOT_RUN
canon_reference_freshness: FAIL
base_plan_revalidation: NOT_RUN
```

다음 Gate는 작성 명세 사용자 검토다. 그 전에는 `writing-plans`와 진단 코드 생성을 시작하지 않는다.

## 11. Work Quality·Text Integrity Gate

모든 실질 작업은 Benchmark·현업/표준 비교·ADOPT/ADAPT/REJECT·적대적 검토·GitHub/Sheet Readback을 거친다.

대상: `.md`, `.json`, `.yml`, `.yaml`, `.py`, `.gd`, `.tscn`, `.tres`, `.txt`, `.csv`.

Hard Gate:

- UTF-8 strict decode.
- BOM 0.
- NFC.
- U+FFFD 0.
- 금지 제어문자 0.
- mojibake 0 또는 사람 확인.
- JSON parse.
- GitHub·Sheet sentinel Readback.

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

## 12. Active Pressure Clock Gate

진행:

- 관찰·작성·후보·조합.
- HUD Drawer 열람·슬롯 비교.

정지:

- 주문·소환수 행동·적 공격 System Resolve.
- 안전한 Draft 보존 뒤 `MANAGEMENT_CONFIRM`.
- Pause·강제 Tutorial.
- Focus loss·Background.
- Save/Load·Recognition·Loading.
- 직접 피해 Stock 정지.

Offline catch-up과 복귀 순간 다중 Event를 금지한다.

## 13. Foundation POC 제품 경계

Readiness PASS와 별도 Scope 승인 뒤에만 허용 후보:

- 최소 Godot 프로젝트·Headless tests.
- Focus Task 상태 전이.
- Atomic Result Ledger.
- Stroke·Draft·Candidate 생명주기.
- Deterministic Test Recognizer.
- Session Snapshot·atomic save.
- Pause·Resume·Focus loss.
- 무아트 Smartphone Landscape Harness.
- 합성 비전투 1개·합성 단일 강적 1개.

Stock·소환수 Runtime과 Mobile Summon HUD 구현은 자동 포함하지 않는다.

## 14. P2 — Vertical Slice 제작 전

- `BATTLE-TUNING-01`.
- `RESULT-GRADING-01`.
- 대표 제작 미니게임.
- `GRIMOIRE-SCREEN-01`.
- `MAIN-SCREEN-01`.
- `AUDIO-DIRECTION-01`.
- 접근성·난이도 정책.
- Year-One Chapter Map과 Glyph Catalog.
- 성장·평가·재료·레시피·인벤토리 수치.
- Slice 장면별 시간 예산.

## 15. 현재 검증 경계

```text
STAGE_0_DESIGN_SCOPE = USER_APPROVED
STAGE_0_WRITTEN_SPEC = READY_FOR_USER_REVIEW
STAGE_0_IMPLEMENTATION_PLAN = NOT_WRITTEN
STAGE_0_DIAGNOSTIC_CODE = NOT_STARTED
OFFICIAL_ENGINE_PIN = UNVERIFIED
GODOT_BINARY = NOT_RUN
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE_SCENE_RESOURCE_DATA = NOT_FOUND
MOBILE_SUMMON_HUD_IMPLEMENTATION = NOT_AUTHORIZED
FOUNDATION_POC_BUILD_AUTHORIZATION = NOT_GRANTED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PC_ADAPTATION_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```

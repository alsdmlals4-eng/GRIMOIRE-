# GRIMOIRE 개발·기획 게이트

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
baseline_date: 2026-08-03
baseline_main: 7fd2c137469120a9ccf942df5b9860af135acc87
working_branch: agent/mobile-summon-hud-spec-hardening
working_sync: GR-SYNC-20260803-05
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
p0_open: 0
p1_open: 2
implementation_entry: APPROVED_CONDITIONAL_FOUNDATION_POC
implementation_ready: false
implementation: NOT_STARTED
codex_plan: WRITTEN_AWAITING_MERGE_AND_READINESS_REVALIDATION
codex_execution: BLOCKED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

## 1. 전체 경로

```text
핵심 기획·Mobile·전체 게임 구조·시스템 계층 — 완료
→ 자연충전 Stock·정수 상주 소환수 — 승인
→ 메인 1 + 보조 S1/S2/S3·역할 중복 금지 — 승인
→ State/Ledger/Save 계약 — 승인 설계
→ 벤치마킹·현업 비교·Text Integrity Gate — 승인
→ 보조 3슬롯 Mobile HUD 사용자 명세 — 승인 완료
→ Mobile HUD TDD Plan·Test Matrix — 작성 완료·미실행
→ Godot Toolchain preflight — 남음
→ Base v9.4.3 Plan 재검증 — 남음
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01
→ 별도 Scope 승인
→ Foundation POC
→ Runtime·Device·Performance·Accessibility·Human Validation
→ Vertical Slice Production Approval
```

## 2. 완료된 큰 방향

- 상황 판독·의미 설계·Commit·설명 가능한 결과·마도서 복기.
- 상황 해결형 단일 강적 전투와 불안정도 0 진정.
- Mobile Landscape Smartphone 품질 Gate.
- Scene-first Focus Task·Writing Panel.
- Save/Resume Anchor·Session Snapshot·Atomic Result Ledger 방향.
- 학습 나선·다계열 수강·포트폴리오·학기 평가.
- 1학년 Demo·3학년 Full Game 범위.
- 핵심/진행/적용/보조/인프라 시스템 계층.

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
기능 글자 수 n
→ 10 + 5 × (n - 1)초
```

검증 Gate:

- 준비 용량 초과 0건.
- 자연충전 대상 자동 변경 0건.
- Stock 소비·결과 적용 중복 0건.
- Save/Resume 충전 중복 완성 0건.
- 완성 주문 Stock이 새로운 상황 설계를 전면 대체하지 않음.

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
```

보조 역할은 `PRODUCTION / GUARDIAN / ASSAULT / RECOVERY`다.

정수 기본값:

- 메인 `[스톡] 1`.
- 생산형 `[스톡] 2`.
- 수호형 `[방어도] 2`.
- 공격형 `[공격] 2`.
- 치유형 `[치유] 2`.

Slice 가드레일:

- 네 역할 중 최대 세 역할 편성.
- 보조 사이 같은 역할 중복 금지.
- 활성 `[스톡]` 합계 상한 `3`.
- 같은 시각 Event는 `MAIN → S1 → S2 → S3`.
- 자동 공격으로 불안정도 0·최종 해결 금지.
- Offline 공격·치유·Stock 지원 금지.

## 5. GM-STOCK-SUMMON-STATE-INTERFACE-01 Gate

```yaml
status: APPROVED_DESIGN_HARDENED_FOR_HUD
secondary_state_shape: ARRAY_MAX_3
secondary_slot_uniqueness: REQUIRED
secondary_role_uniqueness_in_slice: REQUIRED
exactly_once_owner: RESULT_LEDGER
hud_event_application: PROHIBITED
```

필수 소유권:

- `StockLoadoutState`.
- `StockChargeState`.
- `SummonRosterState`.
- `SummonActionState`.
- `PlayerCombatState`.
- `SituationCombatState`.
- `ResultLedger`.
- `SessionSnapshot`.
- `SummonHudViewModelBuilder`.
- `SummonEventPresentationQueue`.

필수 원자성:

- `[소환 주문]`의 역할·슬롯·마나·교체·활성.
- 보조 귀환과 파생 스탯 재계산.
- Stock 소비·주문 효과 적용.
- `summon_event_id`·`stock_charge_event_id` Exactly-once.
- 손상 슬롯·역할 중복 Save 자동 덮어쓰기 금지.

## 6. GM-MOBILE-SUMMON-HUD-WIREFRAME-01 Gate — CLOSED_SPEC

```yaml
status: USER_APPROVED_HARDENED_SPEC_ACTIVE
layout: LEFT_SAFE_AREA_VERTICAL_COMPACT_RAIL
slot_order: [MAIN, S1, S2, S3]
detail: ONE_CONTEXTUAL_DRAWER
writing_focus_detail: READ_ONLY_MICRO_DETAIL
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

검증 Gate:

- 적 의도·타이머·환경 위험·HP·마나·Writing Canvas 가림 0.
- Android `48dp`, iOS `44pt` Touch target 실측.
- Drawer 열람에 따른 Clock 정지 0.
- 안전한 Draft 보존 전 관리 Pause 0.
- Active Stroke 중 Rail 선택·Focus 이동·관리 실행 0.
- 같은 시각 Event 순서 변동 0.
- 같은 시각 Batch 전체 표시시간 `<=1.2초 TEST_VALUE`.
- Text Scale 100%·130%·Android 최대 200% 핵심 정보 손실 0.
- 타이머 매초 Screen-reader 발표 0.
- HUD의 State 수정·Event dedup 판단 0.
- 손상 Save 자동 교정 0.

현재 Gate 상태는 **명세 승인 완료**이며 Runtime PASS가 아니다.

## 7. Mobile HUD TDD Plan·Test Matrix Gate — CLOSED_PLAN_ONLY

책임 원본:

- `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
- `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.

```yaml
plan_status: WRITTEN_NOT_EXECUTED
matrix_status: WRITTEN_NOT_EXECUTED
task_count: 8
runtime_tests: NOT_RUN
device_tests: NOT_RUN
accessibility_tests: NOT_RUN
human_tests: NOT_RUN
```

계획은 nullable ViewModel, 명시적 Management Confirm, bounded Event Queue, Stroke 입력 소유권, Safe Area, 접근성, Save/Resume, Scope CI를 TDD 단위로 분리한다.

실행 조건:

1. Godot Toolchain preflight PASS.
2. Base v9.4.3 최종 main 기준 Plan 재검증.
3. `GM-FOUNDATION-POC-EXECUTION-READINESS-01` PASS.
4. Mobile Summon HUD 구현 Scope 별도 승인.

## 8. GM-GRILL-WORK-QUALITY-GATE-01

```yaml
status: USER_APPROVED_ACTIVE
benchmark_required_for_grillme: true
industry_or_standard_comparison_required: true
adopt_adapt_reject_required: true
adversarial_review_required: true
text_integrity_required: true
github_sheet_readback_required: true
```

경량 동기화는 `N/A_NO_DESIGN_CHANGE`를 사용할 수 있지만 Text Integrity와 Readback은 필수다.

## 9. Text Integrity Gate

대상: `.md`, `.json`, `.yml`, `.yaml`, `.py`, `.gd`, `.tscn`, `.tres`, `.txt`, `.csv`.

Hard Gate:

- UTF-8 strict decode PASS.
- UTF-8 BOM 0건.
- Unicode NFC PASS.
- replacement character `U+FFFD` 0건.
- 허용되지 않은 제어문자 0건.
- mojibake 의심 패턴 0건 또는 사람 확인 완료.
- JSON parse PASS.
- GitHub·Sheet sentinel Readback PASS.

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

실패 시 `TEXT_INTEGRITY_FAILED`이며 병합하지 않는다.

## 10. Active Pressure Clock Gate

진행:

- 관찰·작성·후보·조합.
- HUD Drawer 열람·슬롯 비교.

정지:

- 주문·소환수 행동·적 공격 System Resolve.
- 안전한 Draft 보존 뒤 명시적 `MANAGEMENT_CONFIRM`.
- Pause·강제 Tutorial.
- Focus loss·Background.
- Save/Load·입력 차단 Recognition·Loading.
- 직접 피해 Stock 정지.

Offline catch-up과 복귀 순간 다중 Event를 금지한다.

## 11. P1 — Execution Readiness 전 필수

### P1-01 Mobile HUD Wireframe — CLOSED_SPEC

사용자 명세 검토와 7개 표적 보강이 승인됐다.

### P1-02 TDD Plan·Test Matrix — CLOSED_PLAN_ONLY

계획과 Matrix가 작성됐으며 실행되지 않았다.

### P1-03 Godot Toolchain Preflight — OPEN

- Godot binary·version.
- renderer.
- headless test 실행.
- Mobile export template.
- 프로젝트 생성 전 경로·권한.

### P1-04 Base v9.4.3 Plan 재검증·Execution Readiness — OPEN

- 최종 main에서 Implementation Plan 재검증.
- 3슬롯 State Interface와 Foundation POC 범위 연결.
- `GM-FOUNDATION-POC-EXECUTION-READINESS-01`.
- P0=0·P1=0 및 별도 Scope 승인 때만 코드 실행.

## 12. P2 — Vertical Slice 제작 전

1. `BATTLE-TUNING-01`.
2. `RESULT-GRADING-01`.
3. 대표 제작 미니게임 — `촉매 배합·안정화 1개` 권장.
4. 선택형 현장실습 전투 — 실제 Slice 제외·Preview 권장.
5. `GRIMOIRE-SCREEN-01`.
6. `MAIN-SCREEN-01`.
7. `AUDIO-DIRECTION-01`.
8. 접근성·난이도 기본 정책.
9. Year-One Chapter Map.
10. 커리큘럼 글자 Catalog.
11. 성장·평가·재료·레시피·인벤토리 수치.
12. Slice 장면별 시간 예산.

## 13. Foundation POC 경계

Execution Readiness PASS 뒤 허용 후보:

- 최소 Godot 프로젝트·Headless tests.
- Focus Task 상태 전이.
- Atomic Result Ledger.
- Stroke·Draft·Candidate 생명주기.
- Deterministic Test Recognizer.
- Session Snapshot·atomic save.
- Pause·Resume·Focus loss.
- 무아트 Smartphone Landscape Harness.
- 합성 비전투 1개·합성 단일 강적 1개.

Stock·소환수 Runtime과 Mobile Summon HUD 구현은 별도 Scope 승인 없이 자동 포함하지 않는다.

## 14. 검증 경계

```text
GODOT_PROJECT = NOT_STARTED
PRODUCT_CODE_SCENE_RESOURCE_DATA = NOT_FOUND
MOBILE_SUMMON_HUD_SPEC = USER_APPROVED_HARDENED
MOBILE_SUMMON_HUD_PLAN = WRITTEN_NOT_EXECUTED
MOBILE_SUMMON_HUD_IMPLEMENTATION = NOT_AUTHORIZED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PC_ADAPTATION_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```

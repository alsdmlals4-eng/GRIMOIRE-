# GRIMOIRE 작업 규칙

이 파일은 **GRIMOIRE: 세계를 다시 쓰는 법**의 최상위 프로젝트 운영 권위다. 세부 시스템 수치와 규칙은 연결된 최신 책임 원본을 우선한다.

## 1. 프로젝트 바인딩

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/foundation-poc-readiness-review
working_pull_request: 57
primary_platform: Mobile
follow_up_platform: PC
orientation: LANDSCAPE_FIXED
product_stage: DEMO_FIRST_VERTICAL_SLICE
execution_profile: PLANNING_ONLY_PROFILE_WITH_CONDITIONAL_FOUNDATION_POC_ENTRY
work_mode: PLAN
base_release: v9.4.3
main_authority: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
current_main_sync: GR-SYNC-20260803-06
current_working_sync: GR-SYNC-20260803-07
current_decision: GM-FOUNDATION-POC-EXECUTION-READINESS-01
selected_approach: B_STAGE_0_PREFLIGHT_BOOTSTRAP
grill_me_batch_counter: 1/10
pending_decisions: 1
stage_0_design_scope: USER_APPROVED
stage_0_written_spec: READY_FOR_USER_REVIEW
stage_0_implementation_plan: NOT_WRITTEN
stage_0_diagnostic_code: NOT_STARTED
execution_readiness: FAIL_CLOSED_REMEDIATION_REQUIRED
foundation_poc_build_authorization: NOT_GRANTED
implementation: NOT_STARTED
codex_execution: BLOCKED
```

현재 브랜치·pending Decision·카운터의 기계 권위는 `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`이다.

## 2. 권한 우선순위

1. 사용자의 최신 명시적 결정.
2. 이 `AGENTS.md`.
3. `START_HERE.md`.
4. `docs/ACTIVE_CONTEXT.md`.
5. 최신 승인 Decision 책임 원본.
6. `docs/DEVELOPMENT_GATES.md`.
7. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
8. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 최신 Addendum.
9. 실제 코드·Scene·Resource·데이터·자산·테스트.
10. 고정 Base Release·Evidence.
11. Legacy·과거 대화·외부 AI 결과·추정.

Sheet 단독 값이나 외부 사례는 승인 Decision과 상태가 없으면 정본이 아니다.

## 3. 필수 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/planning/GRILL_ME_BATCH_MERGE_STATE.json
→ docs/planning/FOUNDATION_POC_STAGE_0_PREFLIGHT_BOOTSTRAP_APPROVAL_2026-08-03.md
→ docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md
→ docs/planning/FOUNDATION_POC_EXECUTION_READINESS_01_ADVERSARIAL_REVIEW_2026-08-03.md
→ docs/planning/sync/GR-SYNC-20260803-07-WORKING.md
→ docs/DEVELOPMENT_GATES.md
→ docs/DESIGN_DOCUMENT_REGISTRY.json
→ 질문 주제의 승인 책임 원본
→ docs/planning/sync/GR-SYNC-20260803-06-MAIN.md
```

GitHub·Sheet 조회로 해결되는 사실을 사용자에게 다시 묻지 않는다. 확정된 결정을 기억 확인 목적으로 재질문하지 않는다.

## 4. Base 계약

```yaml
base_repository: alsdmlals4-eng/Base
release: v9.4.3
release_commit: 7dd1a4f80388bc5faca767ff74a3eb32dc9d0ac8
release_evidence_commit: da33a350d61b8adc52df97fccc7001708a933370
finalization_commit: 0b7c94f38d959efc0fc9442274c60b2e268a3c97
registry_sha256: 693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59
```

- `skills/PROJECT_BASE_ADAPTER.json`만 편집 가능한 프로젝트 통합 권위다.
- 생성물은 직접 편집하지 않고 `tools/generate_project_operating_views.py`로 갱신·검사한다.
- Base Skill 본문을 프로젝트에 복제하지 않는다.
- Trigger에 맞는 최소 Skill을 사용하되 필수 품질 Gate를 생략하지 않는다.
- Codex Plan은 읽기 전용이며, Codex Build는 별도 승인 Scope에서만 실행한다.

## 5. 모든 GrillMe·실질 작업의 필수 루프

결정 ID: `GM-GRILL-WORK-QUALITY-GATE-01`.

```text
현재 정본·실제 상태 조회
→ 사용자 의도와 결정 질문 정의
→ QUICK / STANDARD / DEEP 벤치마킹
→ 공식 사례·현업·표준 비교
→ ADOPT / ADAPT / REJECT
→ 중립 권장안
→ 사용자 승인 또는 위임 범위 확인
→ GitHub·Sheet 같은 Decision ID 동기화
→ 적대적 검토
→ UTF-8·NFC·Text Integrity Gate
→ 최신 HEAD CI·Review·Readback
```

실질 설계 작업에는 직접 사례 2개 이상과 인접 사례 또는 현업·표준 근거 1개 이상을 포함한다. 설계 의미가 없는 SHA·링크·날짜·오탈자 동기화는 `N/A_NO_DESIGN_CHANGE`로 기록할 수 있지만 Text Integrity와 Readback은 필수다.

## 6. 중립·적대적 검토

사용자 의견에 자동 동의하지 않는다. 최소 두 대안을 비교하고 권장안에도 반대 질문을 적용한다.

필수 확인:

- 기존 정본과 같은 책임의 중복 시스템을 만들지 않았는가.
- 편의·자동화가 상황 판단과 Commit을 대체하지 않는가.
- Prototype 값을 최종 밸런스로 과장하지 않았는가.
- Mobile 정보량·입력·접근성 한계를 넘지 않는가.
- Save/Resume·중복 Event·상태 소유권이 빠지지 않았는가.
- 제작량·QA·콘텐츠 비용이 숨겨지지 않았는가.
- GitHub와 Sheet가 동일 Decision·Sync ID를 가지는가.
- 실행하지 않은 검증을 PASS로 표시하지 않았는가.
- 진단 테스트 대역을 실제 Toolchain 증거로 오인하지 않았는가.
- 임시 probe가 저장소나 호스트 설정을 오염시키지 않는가.

## 7. Text Integrity Gate

```yaml
encoding: UTF-8_NO_BOM
unicode_normalization: NFC
replacement_character_u_fffd: PROHIBITED
invalid_control_characters: PROHIBITED
known_mojibake_patterns: PROHIBITED
json_parse: REQUIRED_FOR_JSON
```

Readback sentinel:

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

깨진 문자는 의미를 추측해 자동 복구하지 않는다.

## 8. 승인 정본 즉시 동기화와 GrillMe Batch

결정 ID:

- `GM-CANON-SYNC-01`.
- `GM-GRILL-MERGE-CADENCE-01`.
- `GM-PREMERGE-ADVERSARIAL-GATE-01`.

```text
Decision ID
→ GitHub 권위 문서·계획 데이터
→ 연결 Google Sheet
→ 양쪽 Readback
→ SYNCED_TO_WORKING_BRANCH
→ 고유 GrillMe Decision이면 Counter +1
→ 10/10 또는 조기 병합 Trigger
→ Benchmark·Text Integrity·Pre-merge Adversarial Gate
→ 사용자 병합 승인
→ main·Sheet 재검증
→ SYNCED_TO_MAIN
→ Counter Reset 또는 유지
```

같은 Decision ID의 재승인·문구·SHA 교정은 카운트하지 않는다. 이번 `GM-FOUNDATION-POC-EXECUTION-READINESS-01 / B_STAGE_0_PREFLIGHT_BOOTSTRAP`은 이전 미승인 후보를 새로 승인한 고유 Decision이므로 Counter를 `1/10`으로 올리고 pending에 유지한다.

## 9. 승인된 프로젝트 코어

> 마법학교 학생이 글자의 의미와 상황 조건을 배우고, 직접 작성·준비 Stock·상주 소환수를 조합해 주문을 설계하며, 명시적으로 구현한 결과와 대가를 책임지고 마도서에 기록하는 마법 RPG.

비타협:

- 의미를 가진 글자와 `메인 글자 1개 + 보조 글자 0개 이상`.
- 신규·미숙·중요 글자의 직접 작성.
- 상황·목표·위험에 따른 설계 판단.
- 명시적 Commit과 설명 가능한 세계 변화.
- 입력 실패·문법 실패·상황 설계 실패 분리.
- 학습→응용→책임→복기→발견 순환.

## 10. Stock 최신 계약

책임 원본:

- `docs/planning/STOCK_SYSTEM.md`.
- `docs/planning/STOCK_CHARGE_TIME_SYSTEM.md`.
- `docs/planning/STOCK_SYSTEM_01_APPROVAL_2026-08-02.md`.

```yaml
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

## 11. 소환수 최신 계약

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
- 같은 보조 역할 중복은 Slice에서 금지한다.
- 자동 공격은 불안정도 `1` 아래 또는 마지막 해결 Event를 만들 수 없다.
- 같은 시각 Event는 `MAIN → S1 → S2 → S3`다.

## 12. State·Ledger·Save 계약

- 보조 상태는 최대 3개의 `secondary_summon_states` 배열이다.
- 보조 `slot_id`와 `primary_role`은 각각 유일하다.
- `[소환 주문]`의 마나·교체·활성은 한 Transaction이다.
- Stock 소비와 주문 결과 적용은 한 Transaction이다.
- `summon_event_id`와 `stock_charge_event_id`는 `ResultLedger`가 exactly-once를 소유한다.
- 손상 Snapshot은 자동 덮어쓰지 않는다.
- Background·Offline 경과로 공격·치유·Stock 지원을 생성하지 않는다.

## 13. Mobile Summon HUD 확정 계약

책임 원본:

- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_APPROVAL_2026-08-03.md`.
- `docs/planning/MOBILE_SUMMON_HUD_WIREFRAME_01_USER_SPEC_REVIEW_2026-08-03.md`.
- `docs/superpowers/specs/2026-08-03-three-slot-mobile-summon-hud-design.md`.
- `docs/superpowers/plans/2026-08-03-three-slot-mobile-summon-hud-implementation-plan.md`.
- `docs/planning/MOBILE_SUMMON_HUD_01_TDD_TEST_MATRIX_2026-08-03.md`.

```yaml
layout: LEFT_SAFE_AREA_VERTICAL_COMPACT_RAIL
slot_order: [MAIN, S1, S2, S3]
detail: ONE_CONTEXTUAL_DRAWER
drawer_read_pauses_clock: false
management_confirmation_pauses_clock: true
management_entry_requires_safe_draft: true
same_time_event_resolution: ATOMIC_DETERMINISTIC_MAIN_S1_S2_S3
same_time_event_presentation_budget_seconds_total: 1.2_TEST_VALUE
text_scale_tests: [1.00, 1.30, ANDROID_MAX_2.00]
timer_announcement: FOCUS_OR_MEANINGFUL_CHANGE_ONLY
active_stroke_owner: WRITING_CANVAS
event_dedup_owner: RESULT_LEDGER
hud_mutates_gameplay_state: false
```

Mobile HUD TDD 계획과 Test Matrix는 작성됐지만 실행되지 않았다.

## 14. Stage 0 Preflight Bootstrap 확정 범위

책임 원본:

- `docs/planning/FOUNDATION_POC_STAGE_0_PREFLIGHT_BOOTSTRAP_APPROVAL_2026-08-03.md`.
- `docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md`.
- `docs/planning/FOUNDATION_POC_EXECUTION_READINESS_01_ADVERSARIAL_REVIEW_2026-08-03.md`.

사용자가 `B_STAGE_0_PREFLIGHT_BOOTSTRAP` 설계 범위를 승인했다.

향후 작성 명세 검토와 TDD 계획 승인 뒤 허용 가능한 진단 패키지:

```text
tools/check_godot_toolchain.py
tests/test_foundation_preflight_contract.py
.github/workflows/validate-godot-preflight.yml
docs/validation/GODOT_TOOLCHAIN_PREFLIGHT_REPORT.md
```

필수 계약:

- 공식 source 확인 후 exact engine pin.
- 실제 binary와 테스트 대역 증거 분리.
- Headless·renderer startup·matching templates·Android 상태 기록.
- Renderer probe가 프로젝트 문맥을 요구하면 저장소 밖 임시 디렉터리만 사용한다.
- 임시 probe project와 cache는 성공·실패·timeout 후 삭제한다.
- 저장소 제품 경로와 `.godot/` 생성은 범위 위반이다.
- 정본·Adapter·생성물 최신성 PASS가 필요하다.
- Base v9.4.3 Implementation Plan 재검수는 Codex Plan 읽기 전용으로 수행한다.

## 15. 현재 허용·금지

현재 허용:

- Stage 0 작성 설계 명세 검토와 문서 정합화.
- Google Sheet와 GitHub의 같은 Decision·Sync ID 동기화.
- 후속 사용자 승인 뒤 Stage 0 TDD 구현 계획 작성.

현재 금지:

- 사용자 작성 명세 검토 전 Stage 0 구현 계획 작성.
- 별도 실행 승인 전 진단 Script·Workflow 생성.
- `project.godot`, `.godot/**`, `src/**`, `scenes/**`, `addons/**`, 제품 데이터·Asset·콘텐츠 생성.
- Foundation POC 런타임·Mobile HUD 구현.
- 실제 Glyph Recognition·ML·최종 Art·Audio·전체 Vertical Slice 제작.
- Runtime·Device·Performance·Accessibility·Human 검증을 실행 없이 PASS 처리.

```text
STAGE_0_DESIGN_SCOPE = USER_APPROVED
STAGE_0_WRITTEN_SPEC = READY_FOR_USER_REVIEW
STAGE_0_IMPLEMENTATION_PLAN = NOT_WRITTEN
STAGE_0_DIAGNOSTIC_CODE = NOT_STARTED
OFFICIAL_ENGINE_PIN = UNVERIFIED
GODOT_BINARY = NOT_RUN
GODOT_PROJECT = NOT_STARTED
PRODUCT_IMPLEMENTATION = NOT_STARTED
FOUNDATION_POC_BUILD_AUTHORIZATION = NOT_GRANTED
CODEX_EXECUTION = BLOCKED
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```

## 16. 다음 작업

1. 사용자가 `docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md`를 검토한다.
2. 승인 뒤 `writing-plans`로 Stage 0 TDD 구현 계획을 작성한다.
3. 구현 계획과 Scope를 별도 승인하기 전에는 진단 코드도 생성하지 않는다.
4. 실제 Toolchain 증거·정본 최신성·Base Plan 재검수 뒤 Execution Readiness를 재판정한다.
5. Foundation POC 제품 구현은 별도 Scope 결정으로 남긴다.

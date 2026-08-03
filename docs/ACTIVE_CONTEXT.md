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
execution_profile: FOUNDATION_POC_CODEX_EXECUTION_PREPARED
work_mode: PLAN_AND_CODEX_HANDOFF
base_release: v9.4.3
main_authority: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
last_main_sync: GR-SYNC-20260803-06
current_working_sync: GR-SYNC-20260803-07
current_decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
grill_counter: 1_of_10
pending_distinct_decisions: 1
local_godot_installation: USER_CONFIRMED_INSTALLED
local_godot_path: TO_BE_RESOLVED_BY_CODEX
local_godot_version: TO_BE_VERIFIED_BY_CODEX
ci_godot_version: 4.7.1.stable.official.a13da4feb
ci_toolchain: PASS
foundation_poc_core_planning: SUFFICIENT_TO_START
foundation_poc_codex_plan: WRITTEN_READY
foundation_poc_build_authorization: GRANTED_FOR_LATER_CODEX_SESSION
foundation_poc_product_code: NOT_STARTED
codex_execution: READY_NOT_RUN
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
5. `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
6. `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
7. `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.
8. `docs/validation/GODOT_TOOLCHAIN_SETUP_REPORT_2026-08-03.md`.
9. `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.
10. `docs/DEVELOPMENT_GATES.md`.
11. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
12. `docs/planning/sync/GR-SYNC-20260803-06-MAIN.md`.

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

Mobile HUD TDD Plan과 Test Matrix는 `WRITTEN_NOT_EXECUTED`다. Foundation POC Harness는 이 좌측 Rail을 나중에 추가할 수 없게 만드는 고정 레이아웃을 만들지 않는다.

## Godot 개발환경 상태

`Stage 0`은 게임 단계가 아니며 더 이상 사용자-facing 작업 단계로 사용하지 않는다.

```yaml
user_pc_installation: USER_CONFIRMED_INSTALLED
chat_direct_local_verification: NOT_AVAILABLE
codex_local_path_resolution: REQUIRED_AT_SESSION_START
codex_local_version_check: REQUIRED_AT_SESSION_START
ci_download: PASS
ci_headless: PASS
ci_export_templates: PASS
ci_actual_version: 4.7.1.stable.official.a13da4feb
ci_run: 30823725209
```

Codex는 기존 설치를 먼저 사용한다. PATH에 없으면 설치 경로만 확인하며, 기존 설치를 찾을 수 없거나 실행할 수 없을 때만 `tools/setup_godot_toolchain.py`를 복구 수단으로 사용한다. Godot 설치 여부를 다시 기획 승인 질문으로 만들지 않는다.

## Foundation POC Codex 실행

사용자는 실제 구현을 이후 Codex에서 진행한다고 명시했다.

책임 원본:

- `docs/planning/CODEX_FOUNDATION_POC_HANDOFF_2026-08-03.md`.
- `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
- 상세 구현 본문: `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.

기존 상세 계획의 Toolchain 대기 Task는 폐기한다. Tasks 2–12는 새 Overlay 아래에서 실행한다.

Codex 허용 범위:

```text
project.godot
src/core/**
src/input/**
src/persistence/**
src/platform/**
src/ui/**
src/app/**
tests/test_case.gd
tests/test_runner.gd
tests/unit/**
tests/integration/**
tools/check_foundation_poc_scope.py
.github/workflows/validate-foundation-poc.yml
artifacts/foundation-poc/**
docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md
docs/planning/FOUNDATION_POC_STOP_GATE_01_<date>.md
```

금지 범위:

```text
실제 Glyph Recognition ML
training-data/**
final Art·Audio
Boss
전체 Main·Grimoire 제작 UI
전체 Chapter 콘텐츠
최종 경제·밸런스
Foundation POC 밖의 대규모 리팩터링
```

## 기획·디자인 상태

Foundation POC 시작을 막는 필수 기획은 없다.

개발과 병행할 P2:

1. 전투 수치와 난이도.
2. 결과 평가·등급과 기여도.
3. 대표 제작 미니게임.
4. Main·Grimoire 화면 최종 정보구조.
5. Audio 방향.
6. 접근성 옵션.
7. 1학년 Chapter Map.
8. 글자 Catalog.
9. 성장·평가·경제.
10. Slice 시간 예산.
11. 추가 현장실습 Preview.
12. 실제 사람 검증을 포함한 Vertical Slice 조립.

이 항목은 초기 Foundation POC 구현을 막지 않는다.

## 다음 작업

1. PR #57의 계획·인계·상태 문서를 검증한다.
2. 사용자 병합 정책에 따라 PR #57을 처리한다.
3. 이후 Codex에서 최신 main 기반 격리 Worktree와 `codex/foundation-poc` 브랜치를 만든다.
4. 기존 로컬 Godot 실행 파일과 버전을 확인한다.
5. Codex Execution Overlay Task 0부터 TDD 구현한다.
6. Validation Report, Stop Gate, Draft PR을 만든다.

## 검증 경계

```text
LOCAL_GODOT_INSTALLATION = USER_CONFIRMED
LOCAL_GODOT_BINARY_AND_VERSION = TO_BE_VERIFIED_BY_CODEX
CI_GODOT_TOOLCHAIN = PASS
FOUNDATION_POC_BUILD_SCOPE = AUTHORIZED_FOR_LATER_CODEX_SESSION
GODOT_PRODUCT_PROJECT = NOT_CREATED
PRODUCT_CODE = NOT_STARTED
CODEX_EXECUTION = READY_NOT_RUN
RUNTIME_VALIDATION = NOT_RUN
MOBILE_DEVICE_VALIDATION = NOT_RUN
PERFORMANCE_VALIDATION = NOT_RUN
ACCESSIBILITY_VALIDATION = NOT_RUN
HUMAN_PLAYTEST = NOT_RUN
```
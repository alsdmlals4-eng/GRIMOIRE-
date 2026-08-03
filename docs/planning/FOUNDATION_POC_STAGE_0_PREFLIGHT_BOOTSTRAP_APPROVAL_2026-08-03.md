# GM-FOUNDATION-POC-EXECUTION-READINESS-01 — Stage 0 Preflight Bootstrap 승인

## 승인 상태

```yaml
decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
approved_subscope: B_STAGE_0_PREFLIGHT_BOOTSTRAP
status: USER_APPROVED_DESIGN_SCOPE
approved_at: 2026-08-03T22:45+09:00
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
working_branch: agent/foundation-poc-readiness-review
pull_request: 57
working_sync: GR-SYNC-20260803-07
grill_counter_after_approval: 1_of_10
counter_increment: true
pending_decision_ids:
  - GM-FOUNDATION-POC-EXECUTION-READINESS-01
stage_0_implementation: NOT_STARTED
foundation_poc_product_implementation: NOT_AUTHORIZED
codex_execution: BLOCKED_EXCEPT_FUTURE_APPROVED_STAGE_0_PACKAGE
```

사용자는 적대적 검토의 권장안 `B_STAGE_0_PREFLIGHT_BOOTSTRAP`을 승인했다.

이 승인은 Foundation POC 제품 구현 승인이 아니다. 순환 잠금을 해소하고 실제 Godot Toolchain 증거를 얻기 위한 비제품 진단 단계의 설계 범위만 승인한다.

## 승인된 목적

1. Godot binary·정확한 version·headless 실행 가능 여부를 재현 가능하게 확인한다.
2. Renderer startup, export templates, Android toolchain 상태를 `PASS / BLOCKED / NOT_APPLICABLE`로 구분해 기록한다.
3. 테스트 대역과 실제 Toolchain 증거를 혼동하지 않는다.
4. 최종 main 기준 정본·Adapter·생성물 드리프트를 해소할 준비를 만든다.
5. 실제 증거 확보 뒤 Base v9.4.3 Implementation Plan을 읽기 전용으로 재검수한다.
6. 이후 `GM-FOUNDATION-POC-EXECUTION-READINESS-01`을 다시 판정한다.

## 허용 범위

설계 검토 후 별도 구현 계획 승인을 거친 경우에만 다음 경로를 생성·수정할 수 있다.

```text
tools/check_godot_toolchain.py
tests/test_foundation_preflight_contract.py
.github/workflows/validate-godot-preflight.yml
docs/validation/GODOT_TOOLCHAIN_PREFLIGHT_REPORT.md
```

정본 최신성 해소를 위해 구현 계획에서 명시적으로 지정한 다음 문서·Adapter·생성물 변경을 허용할 수 있다.

```text
AGENTS.md
START_HERE.md
docs/ACTIVE_CONTEXT.md
docs/DEVELOPMENT_GATES.md
docs/DESIGN_DOCUMENT_REGISTRY.json
skills/PROJECT_BASE_ADAPTER.json
skills/PROJECT_BASE_SKILL_ADAPTER.json
skills/BASE_V9_ADAPTER.json
skills/PROJECT_SKILL_SNAPSHOT.json
docs/planning/GRILL_ME_BATCH_MERGE_STATE.json
docs/planning/sync/**
```

생성물은 직접 편집하지 않고 프로젝트 생성기로 갱신·검증한다.

## 금지 범위

```text
project.godot
src/**
scenes/**
addons/**
data/**
assets/**
content/**
ml/**
training-data/**
Godot Scene·Resource·게임 런타임 코드
실제 Glyph Recognition·최종 Art·Audio·전체 Vertical Slice
```

Stage 0에서 제품 경로가 변경되면 범위 위반으로 실패한다.

## 증거 계약

Stage 0 보고서는 다음 상태를 분리해야 한다.

```yaml
official_engine_release_source: VERIFIED_OR_BLOCKED
exact_engine_pin: VERIFIED_OR_UNRESOLVED
godot_binary_path: ACTUAL_PATH_OR_NOT_FOUND
godot_version_output: ACTUAL_OUTPUT_OR_NOT_RUN
headless_invocation: PASS_OR_BLOCKED
renderer_startup: PASS_OR_BLOCKED
export_template_match: PASS_OR_BLOCKED
android_sdk_jdk_adb: PASS_OR_BLOCKED_OR_NOT_REQUIRED_CURRENT_HOST
ios_export_host: PASS_ONLY_ON_SUPPORTED_MACOS_OR_HOST_REQUIRED
```

- 테스트 대역은 Python 계약 검사에만 사용한다.
- 테스트 대역 성공을 실제 Godot Preflight PASS로 표시하지 않는다.
- 로컬·Codex·CI 환경의 차이는 각각 별도 증거로 기록한다.
- 실행하지 않은 항목은 `NOT_RUN` 또는 `BLOCKED`다.

## 실행 순서

```text
사용자 B 승인
→ Stage 0 설계 문서 작성·자체 검토
→ 사용자 작성 명세 검토
→ TDD 구현 계획 작성
→ Stage 0 Scope PR 검증
→ 진단 도구 RED→GREEN
→ 실제 Toolchain 증거 수집
→ 정본·Adapter·생성물 최신성 해소
→ Base v9.4.3 Plan 읽기 전용 재검수
→ Execution Readiness 재판정
→ Foundation POC 제품 구현 별도 Scope 결정
```

## Stop Gate

다음 중 하나라도 발생하면 즉시 중단한다.

- 제품 경로 생성 또는 수정이 필요하다.
- 공식 exact engine pin을 확인할 수 없다.
- 실제 Godot binary 없이 실제 Preflight PASS를 요구한다.
- export template 또는 Android toolchain 실패를 숨겨야 진행할 수 있다.
- Adapter 생성물 직접 편집이 필요하다.
- 승인 범위를 넘어 Foundation POC 런타임 구현이 시작된다.

## 현재 검증 경계

```text
STAGE_0_DESIGN_SCOPE = USER_APPROVED
STAGE_0_WRITTEN_SPEC = AWAITING_USER_REVIEW
STAGE_0_IMPLEMENTATION_PLAN = NOT_WRITTEN
STAGE_0_DIAGNOSTIC_CODE = NOT_STARTED
GODOT_BINARY = NOT_RUN
GODOT_PROJECT = NOT_STARTED
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
FOUNDATION_POC_BUILD_AUTHORIZATION = NOT_GRANTED
```

## 책임 원본

- `docs/planning/FOUNDATION_POC_EXECUTION_READINESS_01_ADVERSARIAL_REVIEW_2026-08-03.md`.
- `docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md`.
- `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.

이 승인 후에도 작성된 설계 명세를 사용자가 검토하기 전에는 구현 계획 작성이나 진단 코드 생성을 시작하지 않는다.

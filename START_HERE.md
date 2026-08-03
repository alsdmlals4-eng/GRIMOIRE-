# GRIMOIRE 시작 지점

> 과거 대화 없이 현재 상태와 다음 작업을 복원하는 첫 화면이다. 세부 규칙은 연결된 최신 책임 원본을 우선한다.

## 현재 상태

| 항목 | 현재 기준 |
|---|---|
| 프로젝트 | `GRIMOIRE: 세계를 다시 쓰는 법` |
| 플랫폼 | `Mobile / Landscape Fixed`, 후속 `PC` |
| 제품 단계 | `DEMO_FIRST_VERTICAL_SLICE` |
| Base 정본 | `v9.4.3` |
| Main 기준 | `9632b203 / GR-SYNC-20260803-06` |
| Working Branch | `agent/foundation-poc-readiness-review` |
| Draft PR | `#57` |
| Working Sync | `GR-SYNC-20260803-07` |
| Grill Batch | `1/10 / pending 1` |
| 현재 Decision | `GM-FOUNDATION-POC-EXECUTION-READINESS-01` |
| 사용자 선택 | `B_STAGE_0_PREFLIGHT_BOOTSTRAP` |
| 작성 명세 | `READY_FOR_USER_REVIEW` |
| Stage 0 구현 계획 | `NOT_WRITTEN` |
| Stage 0 진단 코드 | `NOT_STARTED` |
| Execution Readiness | `FAIL_CLOSED_REMEDIATION_REQUIRED` |
| 제품·Godot 구현 | `NOT_STARTED / NOT_AUTHORIZED` |
| Codex 실행 | `BLOCKED` |
| Runtime·Device·Performance·Accessibility·Human | `NOT_RUN` |

## 먼저 읽을 문서

1. `AGENTS.md`.
2. `docs/ACTIVE_CONTEXT.md`.
3. `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
4. `docs/planning/FOUNDATION_POC_STAGE_0_PREFLIGHT_BOOTSTRAP_APPROVAL_2026-08-03.md`.
5. `docs/superpowers/specs/2026-08-03-foundation-poc-stage-0-preflight-bootstrap-design.md`.
6. `docs/planning/FOUNDATION_POC_EXECUTION_READINESS_01_ADVERSARIAL_REVIEW_2026-08-03.md`.
7. `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`.
8. `docs/DEVELOPMENT_GATES.md`.
9. `docs/DESIGN_DOCUMENT_REGISTRY.json`.
10. `docs/planning/sync/GR-SYNC-20260803-06-MAIN.md`.

## Stage 0 승인 범위

향후 작성 명세 검토와 TDD 계획 승인 뒤에만 다음 진단 패키지를 만들 수 있다.

```text
tools/check_godot_toolchain.py
tests/test_foundation_preflight_contract.py
.github/workflows/validate-godot-preflight.yml
docs/validation/GODOT_TOOLCHAIN_PREFLIGHT_REPORT.md
```

목적:

- 공식 Godot exact pin 확인.
- 실제 binary·version·headless·renderer startup 증거.
- matching export templates 확인.
- Android SDK·JDK·adb 상태 분리.
- iOS host 경계 기록.
- 정본·Adapter·생성물 최신성 복구.
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

Renderer startup에 프로젝트 문맥이 필요하면 운영체제 임시 디렉터리의 일회성 probe project만 허용하며, 성공·실패·timeout과 무관하게 삭제해야 한다. 저장소에는 Godot project나 cache를 만들지 않는다.

## 기존 확정 계약 유지

- Stock: 용량 `8`, 지정 대상 1종 자연충전, `10 + 5 × (n-1)초`, Offline 충전 금지.
- Summon: 메인 1 + 보조 S1/S2/S3, 보조 역할 중복 금지, 같은 시각 `MAIN → S1 → S2 → S3`.
- Mobile Summon HUD: 좌측 Rail, Contextual Drawer, 안전 Draft 뒤 관리 Pause, ResultLedger exactly-once, Writing Canvas active-stroke 소유.
- Mobile HUD TDD Plan과 Test Matrix는 작성됐지만 실행되지 않았다.

## 현재 검증 경계

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

## 다음 순서

1. 사용자가 작성된 Stage 0 설계 명세를 검토한다.
2. 승인 후 `writing-plans` 절차로 Stage 0 TDD 구현 계획을 작성한다.
3. 별도 실행 승인 전에는 진단 코드도 생성하지 않는다.
4. 실제 증거와 정본 최신성 PASS 뒤 Execution Readiness를 재판정한다.
5. Foundation POC 제품 구현은 이후 별도 Scope 결정이다.

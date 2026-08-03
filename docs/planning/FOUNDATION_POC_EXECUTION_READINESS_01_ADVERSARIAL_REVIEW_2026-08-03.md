# GM-FOUNDATION-POC-EXECUTION-READINESS-01 — 실행 준비 적대적 검토

## 1. 검토 상태

```yaml
decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
review_id: GR-REVIEW-FOUNDATION-POC-READINESS-20260803-01
review_status: COMPLETE
user_decision: REQUIRED
execution_readiness: FAIL_CLOSED
implementation: NOT_STARTED
codex_plan: ALLOWED_READ_ONLY_AFTER_REMEDIATION_APPROVAL
codex_execution: BLOCKED
product_files_changed: false
godot_project_created: false
grill_counter_increment: false
reason: CANDIDATE_NOT_USER_APPROVED
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
base_release: v9.4.3
external_official_engine_verification: BLOCKED_NETWORK_UNAVAILABLE
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

이번 검토는 Foundation POC 제품 구현을 허가하지 않는다. 실행 준비 계약의 순환 잠금과 정본 드리프트를 분리하고, 실제 Toolchain 증거를 얻기 위한 선행 단계의 범위를 제안한다.

## 2. 검토한 책임 원본

### GRIMOIRE

- `AGENTS.md`.
- `START_HERE.md`.
- `docs/ACTIVE_CONTEXT.md`.
- `docs/DEVELOPMENT_GATES.md`.
- `docs/DESIGN_DOCUMENT_REGISTRY.json`.
- `skills/PROJECT_BASE_ADAPTER.json`.
- `.github/workflows/validate-base-v9-adoption.yml`.
- `docs/planning/IMPLEMENTATION_ENTRY_01_APPROVAL_2026-08-02.md`.
- `docs/planning/IMPLEMENTATION_ENTRY_01_ADVERSARIAL_REVIEW_2026-08-02.md`.
- `docs/superpowers/plans/2026-08-02-mobile-foundation-poc-implementation-plan.md`.
- `docs/planning/sync/GR-SYNC-20260803-06-MAIN.md`.

### Base v9.4.3

- `docs/GPT_CODEX_WORKFLOW_POLICY.md`.
- `skills/reviewing-and-validating-project-changes/SKILL.md`.
- `skills/auditing-canonical-reference-freshness/SKILL.md`.

## 3. 확인된 사실

### PASS

1. Base release identity는 `v9.4.3` 단일 핀으로 유지된다.
2. Adapter·Snapshot·Generator·Python Unit·JSON·UTF-8/NFC·Adversarial Gate는 최근 PR #54–#56에서 통과했다.
3. 제품 코드·Scene·Resource·Asset·`project.godot`은 아직 생성되지 않았다.
4. Foundation POC 범위와 금지 범위는 문서로 분리돼 있다.
5. 현재 planning-only CI는 제품 경로 변경을 차단한다.

### NOT_RUN / UNVERIFIED

1. 실제 Godot binary 경로와 `--version` 결과.
2. Godot headless 실행.
3. Renderer 초기화.
4. Export templates 설치 상태.
5. Android SDK·JDK·adb·debug export 경로.
6. iOS export 가능 호스트와 Xcode 경계.
7. Smartphone 실기기 실행.
8. 공식 Godot 릴리스와 `4.7.1 stable candidate` 문구의 현재 일치 여부.

외부 공식 릴리스 조회와 로컬 Godot binary 실행 환경을 이번 세션에서 사용할 수 없었다. 이를 PASS로 대체하지 않는다.

## 4. Blocking Findings

### P1-01 — Preflight·Readiness 순환 잠금

현행 계획은 다음 두 문장을 동시에 가진다.

```text
Execution Readiness PASS 전에는 계획을 실행하지 않는다.
Task 1에서 check_godot_toolchain.py를 생성·실행해 Execution Readiness 증거를 만든다.
```

따라서 Task 1을 실행하려면 Readiness가 필요하고, Readiness를 통과하려면 Task 1이 필요하다.

```yaml
finding: CIRCULAR_GATE_DEPENDENCY
severity: P1_BLOCKING
closure: SPLIT_PREFLIGHT_BOOTSTRAP_FROM_PRODUCT_IMPLEMENTATION
```

### P1-02 — 엔진 버전 기준 미검증

`skills/PROJECT_BASE_ADAPTER.json`과 Foundation POC Plan은 `Godot 4.7.1 stable candidate`를 사용한다. 그러나 실제 binary·공식 stable 상태·export templates를 확인한 증거가 없다.

```yaml
finding: ENGINE_VERSION_UNVERIFIED
severity: P1_BLOCKING
closure:
  - VERIFY_OFFICIAL_RELEASE_SOURCE
  - PIN_EXACT_ENGINE_VERSION
  - RECORD_BINARY_VERSION_OUTPUT
  - VERIFY_MATCHING_EXPORT_TEMPLATES
```

`latest`를 암묵적으로 선택하지 않는다. 공식 확인 후 정확한 버전을 핀하며, `4.7.1`은 확인 결과가 일치할 때만 유지한다.

### P1-03 — Toolchain 증거 부재

현재 CI는 Python·문서·정본 검사만 수행한다. `GODOT_BIN`, headless, renderer, export templates, Android export를 실행하는 Job이 없다.

```yaml
finding: TOOLCHAIN_EVIDENCE_ABSENT
severity: P1_BLOCKING
current_ci: PLANNING_AND_BASE_ONLY
required_evidence:
  - GODOT_BINARY_PATH
  - GODOT_VERSION
  - HEADLESS_SMOKE
  - RENDERER_STARTUP
  - EXPORT_TEMPLATE_MATCH
  - ANDROID_TOOLCHAIN_STATUS
```

### P1-04 — 활성 정본 드리프트

최종 main은 `9632b203`과 `GR-SYNC-20260803-06`이지만 다음 활성 파일에는 이전 Working 상태가 남아 있다.

- `docs/DEVELOPMENT_GATES.md` — baseline `7fd2c137`, 이전 Working Branch·Sync.
- `docs/DESIGN_DOCUMENT_REGISTRY.json` — 이전 Working Branch, Working Sync, PR 대기 상태.
- `skills/PROJECT_BASE_ADAPTER.json` — 오래된 current sync, protected baseline, GDD authority, next product gate, engine candidate 상태.

```yaml
finding: CANON_REFERENCE_FRESHNESS_DRIFT
severity: P1_BLOCKING
closure:
  - REBIND_ACTIVE_ENTRYPOINTS_TO_CURRENT_MAIN
  - UPDATE_PROJECT_BASE_ADAPTER_AUTHORITY_FIELDS
  - REGENERATE_DERIVED_ADAPTER_AND_SNAPSHOT_VIEWS
  - RUN_GENERATOR_AND_REFERENCE_FRESHNESS_CHECKS
```

## 5. Multi-lens Review

| Lens | 판정 | 근거 |
|---|---|---|
| Simplify | APPLIED | Preflight를 제품 구현 Task와 분리하면 순환 잠금과 불필요한 범위 혼합을 제거한다. |
| Style Guide | APPLIED | Base v9.4.3의 Plan read-only·Build 분리·fail-closed·실행 증거 원칙과 일치한다. |
| Domain Review | APPLIED | POC의 목표인 입력·저장·중복 적용 검증을 콘텐츠 제작보다 먼저 유지한다. |
| Security/Safety/Trust Boundary | APPLIED | 제품 경로 생성 전 binary·권한·export 환경을 검증하고 미확인을 PASS로 승격하지 않는다. |

## 6. 접근안 비교

### A — 사용자 로컬 환경에서 수동 Preflight만 실행

```yaml
benefit: 가장 적은 저장소 변경
cost: 재현성과 CI 증거가 약함
risk: 다른 작업자·Codex 환경에서 다시 실패할 수 있음
verdict: ADAPT_ONLY
```

### B — Stage 0 Preflight Bootstrap 분리 — 권장

제품 구현과 별개인 진단 전용 패키지를 먼저 허용한다.

```yaml
stage: PREFLIGHT_BOOTSTRAP
allowed:
  - tools/check_godot_toolchain.py
  - tests/test_foundation_preflight_contract.py
  - .github/workflows/validate-godot-preflight.yml
  - docs/validation/GODOT_TOOLCHAIN_PREFLIGHT_REPORT.md
prohibited:
  - project.godot
  - src/**
  - scenes/**
  - addons/**
  - product data and assets
```

Bootstrap은 Python contract test와 환경 진단만 만든다. 실제 Godot binary가 없는 환경에서는 `BLOCKED_TOOLCHAIN_NOT_INSTALLED`로 종료하며, 테스트 대역 성공을 실제 Preflight PASS로 사용하지 않는다.

완료 흐름:

```text
Stage 0 범위 사용자 승인
→ 진단 도구 TDD
→ 로컬/Codex 환경의 실제 binary·version·template 증거
→ Base v9.4.3 final-main Codex Plan read-only 재검수
→ 정본·Adapter·Generator 드리프트 해소
→ GM-FOUNDATION-POC-EXECUTION-READINESS-01 재판정
→ 별도 Foundation POC Build Scope 승인
```

```yaml
benefit: 순환 잠금 해소·재현 가능한 증거·제품 경로 보호
cost: 작은 선행 PR 1개 추가
risk: CI 설치 방식이 공식 지원 경로와 어긋나면 재작업
verdict: RECOMMENDED_ADAPT
```

### C — Preflight 없이 Foundation POC Task 1부터 실행

```yaml
benefit: 즉시 코드 생성
cost: 버전·export·권한 실패가 제품 Branch에 섞임
risk: 승인 Gate 우회·재작업·거짓 Runtime PASS
verdict: REJECT
```

## 7. 권장 결정안

```yaml
decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
selected_approach: B_STAGE_0_PREFLIGHT_BOOTSTRAP
current_readiness: FAIL_CLOSED_REMEDIATION_REQUIRED
stage_0_authorization: AWAITING_USER_APPROVAL
stage_0_is_product_implementation: false
stage_0_product_paths_allowed: false
engine_version_policy: VERIFY_OFFICIAL_THEN_PIN_EXACT
allow_test_double_as_real_preflight: false
require_local_or_codex_real_binary_evidence: true
require_export_template_match: true
require_android_toolchain_status: true
require_canon_reference_freshness_pass: true
require_base_v9_4_3_plan_read_only_revalidation: true
foundation_poc_build_authorization: NOT_GRANTED
```

## 8. Stage 0 종료 기준

다음이 모두 충족돼야 Preflight Bootstrap을 닫는다.

1. 진단 script의 Python contract test RED→GREEN 증거.
2. 실제 Godot binary 경로 기록.
3. 실제 `--version` 출력과 승인된 exact pin 일치.
4. Headless invocation 가능.
5. Renderer startup 상태 기록.
6. 같은 버전 export templates 확인.
7. Android toolchain 상태를 `PASS / BLOCKED / NOT_REQUIRED_FOR_CURRENT_HOST`로 구분.
8. iOS는 비-macOS에서 PASS로 위장하지 않고 Host requirement만 기록.
9. 생성·변경 파일이 Stage 0 허용 목록을 벗어나지 않음.
10. Registry·Gate·Adapter·generated views reference freshness PASS.
11. 새 main 기준 Codex Plan read-only 재검수 완료.

## 9. Readiness 재판정 규칙

```yaml
p0_required: 0
p1_required: 0
unverified_engine_or_toolchain: PROHIBITED
product_scope_approval: REQUIRED_AFTER_READINESS
runtime_validation_before_project_creation: NOT_APPLICABLE
mobile_device_validation: NOT_RUN_UNTIL_HARNESS_EXISTS
```

Stage 0이 성공해도 Foundation POC 제품 구현은 자동 허가되지 않는다. 새 Readiness 보고서와 별도 Scope 승인이 필요하다.

## 10. 현재 결론

```text
BASE_V9_4_3_IDENTITY = PASS
PLANNING_CI = PASS
GODOT_TOOLCHAIN = UNVERIFIED
ENGINE_VERSION = UNVERIFIED
CANON_REFERENCE_FRESHNESS = FAIL
FOUNDATION_POC_PLAN = REQUIRES_REVALIDATION
EXECUTION_READINESS = FAIL_CLOSED
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
USER_DECISION = REQUIRED_FOR_STAGE_0_BOOTSTRAP
```

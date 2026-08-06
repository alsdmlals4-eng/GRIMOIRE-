# Godot 저작 권위·GUT 테스트 권위 채택 명세

```yaml
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
sync_id: GR-SYNC-20260806-10-GODOT-AUTHORING-GUT-AUTHORITY
source_main: 917ead7499482801610ba95ce37efafd1662d994
status: DESIGN_DRAFT_REVIEW_REQUIRED
implementation_entry: BLOCKED
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
merge_authorized: false
```

## 1. 목적

Godot 프로젝트의 실제 저작과 검증을 하나의 도구가 뒤섞어 수행하지 않도록 권위를 분리한다.

- `HIGODOT_SOLE_AUTHORING_AUTHORITY`
- `GUT_FORMAL_TEST_AUTHORITY`
- `ENTRY_GATE_BLOCKS_WORK`

이 명세가 검토·승인되고 별도 채택 구현 PR에서 실제 소비 경로와 CI가 검증되기 전까지 주문 UI v2 구현 PR #82는 중지한다.

## 2. 현재 저장소 사실

### HiGodot / Godot AI

```yaml
repository_path: addons/godot_ai
plugin_name: Godot AI
bundled_version: 3.1.2
project_plugin_enabled: true
autoload: res://addons/godot_ai/runtime/game_helper.gd
current_role: GODOT_AUTHORING_AND_RUNTIME_MCP
```

현재 `project.godot`은 `res://addons/godot_ai/plugin.cfg`만 Editor Plugin으로 활성화한다.

### GUT

```yaml
SOURCE: https://github.com/bitwes/Gut
PINNED_VERSION: 9.7.1
LICENSE: MIT
GODOT_COMPATIBILITY: 4.7.x
repository_path: addons/gut
project_plugin_enabled: false
project_tests_extending_gut_test: 0
ci_consumption: false
current_state: VENDORED_NOT_CONSUMED
```

저장소의 `addons/gut/plugin.cfg`는 9.7.1을 기록하고, `versions.json`은 9.7.1을 Godot 4.7–4.7.999에 대응시킨다. `addons/gut/LICENSE.md`는 MIT License 전문을 보존한다.

공식 GUT 저장소 README도 9.7.1 `godot_4_7` 계열을 Godot 4.7.x용으로 안내한다. 이 명세는 저장소에 이미 포함된 파일을 정식 소비하기 위한 설계이며, 포함되어 있다는 사실만으로 채택 완료를 주장하지 않는다.

## 3. 권위 분리

### 3.1 HiGodot 단일 저작 권위

`HIGODOT_SOLE_AUTHORING_AUTHORITY`

HiGodot은 다음 Godot 직렬화 산출물을 실제로 생성·수정하는 유일한 저작 권위다.

```text
project.godot
**/*.tscn
**/*.tres
**/*.res
Godot Scene 노드 구조
Resource 속성·연결
Project Settings
Editor Plugin·Autoload 설정
Main Scene 설정
Input Map·Display·Rendering 설정
```

텍스트 코드인 `.gd`, Python, Markdown, JSON, YAML은 일반 코드 리뷰·TDD 절차로 수정할 수 있다. 다만 해당 코드 변경이 Scene·Resource·Project Settings를 실제로 바꾸어야 한다면 최종 직렬화 변경은 HiGodot을 통해 수행한다.

HiGodot 실행은 다음 영수증을 남겨야 한다.

```yaml
receipt_schema: HIGODOT_AUTHORING_RECEIPT_V1
tool_version: required
base_commit: required
result_commit: required
changed_godot_artifacts: required
operations: required
scene_open_or_reload_evidence: required
project_path: required
```

### 3.2 GUT 정식 테스트 권위

`GUT_FORMAL_TEST_AUTHORITY`

GUT은 제품 결과를 읽고 실행하여 검증하는 테스트 권위다.

- 제품 Scene·Node·Resource·Project Settings를 읽는다.
- Unit·Integration·Scene test를 실행한다.
- assertion, failure, pending, orphan, error 결과를 보고한다.
- JUnit XML과 CI 로그를 생성한다.
- 제품 산출물을 수정하지 않는다.

`GUT_MUST_NOT_MUTATE_PRODUCT_FILES`

GUT 실행 중 다음 경로의 변경은 0이어야 한다.

```text
project.godot
src/**
assets/**
**/*.tscn
**/*.tres
**/*.res
addons/godot_ai/**
```

허용되는 실행 출력은 `user://`, CI 임시 디렉터리, 업로드 Artifact뿐이다.

`HIGODOT_MUST_NOT_EDIT_TEST_EXPECTATIONS`

HiGodot은 실패를 통과시키기 위해 다음을 자동 수정하지 않는다.

```text
tests/**
.gutconfig.json
GUT assertion expected value
fixture golden data
CI success criteria
```

테스트 변경은 별도 RED 증거와 요구사항 변경 근거가 있어야 한다.

## 4. 파일 소유·침범 방지 행렬

| Surface | HiGodot | GUT Runtime | 테스트 작성 코드 변경 |
|---|---|---|---|
| `project.godot` | Write authority | Read only | 직접 수정 금지 |
| `*.tscn/*.tres/*.res` | Write authority | Read/instantiate only | 직접 수정 금지 |
| `src/**/*.gd` | Read·attach·inspect | Read/execute | TDD 코드 변경 가능 |
| `tests/gut/**` | Read only | Execute | TDD 테스트 변경 가능 |
| `.gutconfig.json` | Read only | Read | 채택 구현 PR에서 변경 |
| JUnit·logs | No authority | Generate | CI Artifact only |
| `addons/gut/**` | No product authoring | Framework runtime | Vendor update PR only |

같은 파일을 두 도구가 임의 수정하는 상태를 허용하지 않는다.

## 5. GUT 실제 소비 경로

`ACTUAL_CONSUMPTION_PATH`

이 Draft 설계 PR은 GUT을 활성화하거나 테스트를 이관하지 않는다. 승인 뒤 별도 TDD 채택 구현 PR이 다음을 수행한다.

### Phase B1 — 최소 실제 소비

1. `.gutconfig.json` 추가.
2. `tests/gut/unit/`과 `tests/gut/integration/` 추가.
3. 제품 코드 또는 실제 프로젝트 Scene을 검증하는 GUT smoke test 1개 이상 작성.
4. 다음 CLI를 Godot 4.7.1 headless에서 실행.

```text
Godot --headless --path . -s addons/gut/gut_cmdln.gd -gconfig=res://.gutconfig.json -gexit
```

5. JUnit XML을 CI Artifact로 업로드.
6. 실행 전후 protected product path hash가 동일함을 검증.

### Phase B2 — 병행 검증

현재 커스텀 `res://tests/test_runner.gd`는 즉시 삭제하지 않는다.

```text
legacy_runner: COMPATIBILITY_LANE
new_and_migrated_tests: GUT_AUTHORITY_LANE
```

동일 핵심 계약을 두 lane에서 일정 기간 통과시켜 false-green을 방지한다.

### Phase B3 — 정식 전환

다음 조건이 모두 충족될 때만 GUT을 primary framework로 선언한다.

- 실제 제품 test 소비 경로 PASS.
- GUT CI PASS.
- JUnit 결과 Artifact 존재.
- 기존 runner 대비 핵심 계약 coverage parity 문서화.
- 제품 파일 무변경 hash gate PASS.
- 제거·복구 절차 dry-run PASS.
- 사용자 또는 지정 검토자 승인.

## 6. CI Gate

`CI_GATE`

### Gate A — 본 설계 진입 차단

`.github/workflows/validate-godot-authoring-gut-authority.yml`은 다음을 검증한다.

- 설계·상태·미확정 목록 존재.
- 활성 권위 파일의 stale `READY_FOR_TDD` 제거.
- GUT 9.7.1·Godot 4.7 범위·MIT License 일치.
- 현재 GUT 상태가 `VENDORED_NOT_CONSUMED`로 기록됨.
- PR #82가 `PAUSED_AFTER_TASK1_GREEN`으로 기록됨.
- 이미지 상태가 `APPROVED_DIRECTION_RUNTIME_NOT_RUN`으로 기록됨.

### Gate B — 채택 구현 CI

별도 구현 PR에서 다음 job을 필수화한다.

```text
1. verify-vendor-source-version-license
2. install-and-import-godot-4.7.1
3. run-gut-product-tests
4. upload-junit-results
5. verify-product-files-unchanged-by-gut
6. run-legacy-runner-compatibility-lane
7. compare-required-contract-coverage
8. verify-higodot-authoring-receipt-for-protected-diff
```

### Gate C — 작업 진입 Preflight

제품 구현을 시작하기 전에 다음 live authority를 읽는다.

```text
Google Sheet 02_현재_확정결정
Google Sheet 04_누락_충돌_감사
Google Sheet 72_이미지검수_승인로그
GitHub CURRENT_UNRESOLVED_GATES.md
GitHub active gate state
```

다음 중 하나라도 참이면 제품 구현 진입을 실패 처리한다.

- active gate가 `BLOCKED`.
- unresolved gate가 1개 이상.
- 이미지가 방향 승인만 되고 Runtime 검증이 `NOT_RUN`인데 final/implementation 승인으로 해석됨.
- GUT 실제 소비·CI가 없는 상태에서 formal adoption 완료로 기록됨.
- HiGodot 영수증 없이 protected Godot artifact가 변경됨.

## 7. 현재 READY/AWAITING 복구

### READY 복구

기존 `SPELL_WORKFLOW_UI_V2_READY_FOR_TDD`는 설계·UI Kit 기준으로는 당시 정확했지만, 새 필수 도구 권위 전제 도입 후에는 작업 진입을 허용할 수 없다.

```yaml
old: SPELL_WORKFLOW_UI_V2_READY_FOR_TDD
new: BLOCKED_PENDING_GODOT_AUTHORING_GUT_AUTHORITY_REVIEW
```

### AWAITING 복구

이미지 방향은 이미 사용자 승인되었다. 따라서 사용자 방향 승인을 다시 기다리는 `AWAITING_USER_APPROVAL` 의미는 잘못이다.

```yaml
user_direction_approval: COMPLETE
implementation_visual_review: PENDING
runtime_validation: NOT_RUN
final_art: NOT_CLAIMED
correct_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
```

## 8. 미확정 차단 목록

`docs/planning/CURRENT_UNRESOLVED_GATES.md`의 모든 차단 항목이 해소되기 전에는 다음 상태로 전환할 수 없다.

```text
READY_FOR_IMPLEMENTATION
GUT_FORMALLY_ADOPTED
SPELL_WORKFLOW_TASK2_IN_PROGRESS
READY_FOR_REVIEW
MERGE_AUTHORIZED
```

## 9. 제거·복구 절차

`REMOVAL_AND_ROLLBACK`

GUT 채택 구현이 실패하거나 유지 비용이 과도할 때 다음 순서로 복구한다.

1. 새 GUT workflow를 required gate에서 제거하되 실패 근거와 승인 기록을 남긴다.
2. `project.godot`의 GUT Editor Plugin 항목을 HiGodot으로 제거한다.
3. `.gutconfig.json`과 GUT 전용 hook을 제거한다.
4. GUT 전용 테스트를 삭제하지 않고 기존 runner로 변환하거나 archive 경로로 이동한다.
5. `addons/gut/**` 참조가 0인지 검색한다.
6. 참조 0과 coverage parity 확인 후 `addons/gut/**`를 제거한다.
7. MIT License·vendor provenance·제거 commit을 영수증에 보존한다.
8. 기존 `tests/test_runner.gd` compatibility lane 전체 PASS를 확인한다.
9. Sheet 02·04·99와 GitHub 상태를 같은 Decision ID로 동기화한다.

HiGodot 제거·교체는 별도 저작 도구 마이그레이션 결정 없이는 수행하지 않는다.

## 10. 비주장 경계

이 Draft PR이 증명하지 않는 것:

- GUT 정식 소비 완료.
- GUT CI PASS.
- 기존 테스트 전체 이관.
- HiGodot 영수증 생성 기능 구현.
- 주문 UI v2 Task 2 재개 허가.
- 실기기·성능·Screen Reader·사람 시각 검증.
- 최종 아트 승인.

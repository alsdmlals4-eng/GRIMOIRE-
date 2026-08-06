# Godot 저작 권위·GUT 테스트 권위 채택 명세

```yaml
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
sync_id: GR-SYNC-20260806-10-GODOT-AUTHORING-GUT-AUTHORITY
source_main: 917ead7499482801610ba95ce37efafd1662d994
status: DESIGN_APPROVED_IMPLEMENTATION_PLAN_READY
design_review: USER_APPROVED_2026-08-06
implementation_entry: BLOCKED_PENDING_GUT_FORMAL_ADOPTION
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
merge_authorized: false
BASE_CURRENT_MAIN_OBSERVED: 4f98f968a377f7b6a11aafa4fc94d11bddbebedc
BASE_RELEASE_PIN_REMAINS: 9.4.3
```

## 1. 목적과 승인 상태

사용자는 HiGodot/Godot AI를 Godot 직렬화 산출물의 단일 저작 권위로, GUT 9.7.1을 실제 소비 경로를 갖춘 정식 테스트 권위로 채택하는 설계를 승인했다.

- `HIGODOT_SOLE_AUTHORING_AUTHORITY`
- `GUT_FORMAL_TEST_AUTHORITY`
- `ENTRY_GATE_BLOCKS_WORK`

설계 검토 차단은 해소됐지만 GUT 실제 제품 테스트·CI·JUnit·무변경 hash·legacy parity·HiGodot 영수증 Gate는 구현되지 않았다. 따라서 활성 상태는 `BLOCKED_PENDING_GUT_FORMAL_ADOPTION`이다.

## 2. Base와 프로젝트 기준

Base 최신 `main`은 선택적 애드온 소비, 미사용 애드온 제거·연기, 동일 역할 중복 권위 금지, HiGodot 저작 권위와 비저작 테스트 애드온의 공존 가능성을 요구한다. 프로젝트 Adapter의 고정 릴리스는 계속 Base 9.4.3이며, 이번 작업에서 Base pin을 자동 갱신하지 않는다.

```yaml
BASE_CURRENT_MAIN_OBSERVED: 4f98f968a377f7b6a11aafa4fc94d11bddbebedc
BASE_RELEASE_PIN_REMAINS: 9.4.3
base_pin_update: NOT_APPROVED_NOT_PERFORMED
```

## 3. 저장소 사실

### HiGodot / Godot AI

```yaml
repository_path: addons/godot_ai
plugin_name: Godot AI
bundled_version: 3.1.2
project_plugin_enabled: true
autoload: res://addons/godot_ai/runtime/game_helper.gd
authority: SOLE_AUTHORING_AUTHORITY
```

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

`addons/gut/plugin.cfg`, `versions.json`, `LICENSE.md`는 버전·Godot 범위·MIT 라이선스를 제공한다. 파일 존재만으로 채택 완료를 주장하지 않는다.

## 4. 권위 분리

### 4.1 HiGodot

HiGodot은 다음의 최종 write authority다.

```text
project.godot
**/*.tscn
**/*.tres
**/*.res
Scene·Node 구조
Resource 속성·연결
Project Settings·Editor Plugin·Autoload·Main Scene·Input Map
```

protected Godot diff에는 `HIGODOT_AUTHORING_RECEIPT_V1`과 Scene open/reload evidence가 필요하다.

`HIGODOT_MUST_NOT_EDIT_TEST_EXPECTATIONS`

HiGodot은 `tests/**`, `.gutconfig.json`, assertion expected value, fixture golden data, CI 성공 기준을 수정하지 않는다.

### 4.2 GUT

`GUT_FORMAL_TEST_AUTHORITY`

GUT은 제품 코드·Scene·Resource를 읽고 instantiate·execute·assert하며 JUnit·로그를 생성한다.

`GUT_MUST_NOT_MUTATE_PRODUCT_FILES`

GUT 실행 전후 다음은 동일해야 한다.

```text
project.godot
src/**
assets/**
addons/godot_ai/**
**/*.tscn
**/*.tres
**/*.res
```

## 5. 채택 방식

`CLI_ONLY_FORMAL_ADOPTION`

초기 정식 채택은 Godot 4.7.1 headless CLI로만 수행한다. GUT Editor Plugin은 활성화하지 않으므로 `project.godot`을 바꾸지 않는다.

```yaml
adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
EDITOR_PLUGIN_ENABLEMENT: DEFERRED_UNTIL_HIGODOT_RECEIPT
protected_godot_diff_expected: false
```

Editor Plugin이 실제 필요하다는 별도 증거가 생기면 HiGodot 영수증이 있는 별도 변경으로만 검토한다.

## 6. ACTUAL_CONSUMPTION_PATH

별도 구현 PR은 다음을 RED→GREEN으로 수행한다.

1. `.gutconfig.json`.
2. `tests/gut/unit`·`tests/gut/integration`.
3. 실제 `src/**` 코드와 실제 프로젝트 Scene을 읽는 `GutTest`.
4. Godot 4.7.1 CLI 실행.
5. JUnit XML Artifact.
6. 제품 경로 pre/post SHA-256 동일성.
7. 기존 `res://tests/test_runner.gd` compatibility lane.
8. 필수 계약 coverage parity.
9. protected Godot diff가 없거나 유효한 HiGodot 영수증이 있음을 검증.

```text
Godot --headless --path . -s addons/gut/gut_cmdln.gd \
  -gconfig=res://.gutconfig.json \
  -gjunit_xml_file=user://gut-results.xml \
  -gexit
```

구현 계획 정본:

```text
docs/superpowers/plans/2026-08-06-gut-9-7-1-formal-adoption.md
```

## 7. CI_GATE

별도 구현 PR 필수 job:

```text
verify-vendor-source-version-license
install-and-import-godot-4.7.1
run-gut-product-tests
upload-junit-results
verify-product-files-unchanged-by-gut
run-legacy-runner-compatibility-lane
compare-required-contract-coverage
verify-higodot-authoring-receipt-for-protected-diff
```

## 8. 작업 진입 Gate

매 작업 진입 시 다음 live/static 권위를 읽는다.

```text
Google Sheet 00_프로젝트_허브
Google Sheet 01_작업순서
Google Sheet 02_현재_확정결정
Google Sheet 04_누락_충돌_감사
Google Sheet 72_이미지검수_승인로그
GitHub CURRENT_UNRESOLVED_GATES.md
GitHub GODOT_AUTHORING_GUT_AUTHORITY_STATE.json
```

실제 blocker가 하나라도 있으면 PR #82 Task 2, READY, Main Scene 전환, formal adoption 완료 선언을 차단한다.

## 9. READY·이미지 상태

```yaml
previous_historical_status: SPELL_WORKFLOW_UI_V2_READY_FOR_TDD
current_status: BLOCKED_PENDING_GUT_FORMAL_ADOPTION
image_user_direction_approval: COMPLETE
image_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN
implementation_visual_review: PENDING
runtime_validation: NOT_RUN
final_art: NOT_CLAIMED
```

동일 이미지 방향 승인을 다시 요청하지 않는다.

## 10. REMOVAL_AND_ROLLBACK

1. 실패 근거와 승인 기록 없이 required GUT workflow를 제거하지 않는다.
2. `.gutconfig.json`과 GUT hook을 제거한다.
3. GUT 테스트는 삭제 전에 legacy lane으로 변환하거나 archive한다.
4. `addons/gut/**` 참조를 전수 검색한다.
5. legacy runner 전체 PASS와 필수 coverage 보존을 확인한다.
6. 참조 0일 때만 `addons/gut/**` 제거를 검토한다.
7. MIT·provenance·제거 commit을 영수증으로 보존한다.
8. 같은 Decision ID로 GitHub·Sheet를 동기화하고 readback한다.

HiGodot 제거·교체는 별도 사용자 결정 없이는 수행하지 않는다.

## 11. 비주장 경계

현재 증명하지 않은 것:

- GUT 실제 제품 테스트 소비.
- GUT CI·JUnit PASS.
- 제품 무변경 hash PASS.
- legacy parity.
- HiGodot 영수증 Gate 구현.
- PR #82 Task 2 재개.
- Windows·Android export, 기기·성능·Screen Reader·사람 검증.
- 최종 아트 승인.

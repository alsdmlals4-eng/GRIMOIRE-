# DEC — GUT 9.7.1 채택 설계 선행 Gate

```yaml
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
contract_binding_decision_id: GM-CONTRACT-V4-3-BINDING-01
status: APPROVED_DIRECTION_SPEC_DRAFT_PR_IN_REVIEW
approved_at: 2026-08-06
project_main_base: 252063ccad18b885fc75cbeba3b807fefd76496e
spec_branch: chore/gut-9.7.1-adoption-spec
spec_pr: 84
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
external_independent_reviewer: NOT_PLANNED_SOLO_DEVELOPMENT
```

## 결정

GRIMOIRE는 GUT 9.7.1을 정식 테스트 실행·assertion 권위로 채택한다. 단, v4.3 계약에 따라 실제 설치·소비 구현 전에 별도 branch와 검토 가능한 Draft PR에서 채택 설계 명세를 먼저 병합한다.

```yaml
framework: GUT
version: "9.7.1"
canonical_repository: "bitwes/Gut"
release_tag: "v9.7.1"
source_branch_or_release: "godot_4_7"
pinned_commit: "aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605"
pinned_commit_signature: VERIFIED
official_addons_gut_tree: "5d6893836af4917ee62b1a395125a7530b1f239d"
project_addons_gut_tree: "09d040309bbed0e07420ad72c4aa69cbd0e58190"
license: MIT
godot_target: "4.7.x"
source_version_license: PASS
vendor_integrity: MISMATCH_OFFICIAL_V9_7_1
adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
spec_only_pr: true
formal_installation_authorized_now: false
```

## 공식 source 판정

- 공식 `v9.7.1` release는 `godot_4_7`을 대상으로 한다.
- tag commit `aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605`는 verified commit이다.
- 공식 `addons/gut` subtree는 `5d6893836af4917ee62b1a395125a7530b1f239d`다.
- 프로젝트 main `252063cc...`의 `addons/gut` subtree는 `09d040309bbed0e07420ad72c4aa69cbd0e58190`다.
- MIT license는 확인됐다.

따라서 source·version·license는 PASS지만 vendor integrity는 FAIL/mismatch다. 구현 PR은 official subtree로 교체하거나 모든 file/blob 차이를 감사해 사용자 승인을 얻기 전 GUT runtime 소비를 활성화할 수 없다.

## 근거

- 기존 `addons/gut` 파일은 9.7.1과 Godot 4.7.x metadata를 포함하지만 실제 product `GutTest`, `.gutconfig.json`, GUT CI/JUnit, mutation guard가 없다.
- 버전 문자열과 파일 보관은 정식 채택 또는 official tree identity 증거가 아니다.
- HiGodot의 단일 저작 권위와 GUT의 read/execute/assert 권위를 분리하면 Scene·Resource mutation과 테스트 기준 변경이 섞이는 위험을 줄일 수 있다.
- v4.3은 source·version·license·compatibility·consumer·CI·removal을 검토하는 adoption-spec Draft PR을 설치보다 먼저 요구한다.

## 역할 경계

```yaml
higodot:
  authority: SINGLE_GODOT_SCENE_NODE_RESOURCE_PROJECT_SETTINGS_AUTHOR
  release: v3.1.2
  pinned_commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
  source_version_license: PASS
  vendor_integrity: MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT
  may_edit:
    - project.godot
    - "*.tscn"
    - "*.tres"
    - "*.res"
    - Scene and Node structure
    - Theme, Animation, signal wiring, Project Settings
  must_not_edit:
    - tests
    - assertions
    - expected values
    - .gutconfig.json
    - CI success criteria

gut:
  authority: FORMAL_TEST_EXECUTION_AND_ASSERTION
  may_read_and_execute_production: true
  may_mutate_production: false
  editor_plugin_enabled: false
```

## v4.3 전환 판정

PR #83의 권위 설계와 구현 계획은 main에 병합되어 역사적·기초 정본으로 유효하다. 그러나 v4.3의 새 절차는 adoption-spec 전용 branch/PR을 요구하므로 formal installation 진입 상태를 다시 차단한다.

```yaml
prior_state: GUT_FORMAL_ADOPTION_IMPLEMENTATION_NEXT
corrected_state: BLOCKED_BY_GUT_ADOPTION_SPEC
prior_implementation_branch: agent/gut-9-7-1-formal-adoption-tdd
prior_implementation_branch_status: FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE
prior_branch_merge_authorized: false
```

## 보존 조건

- `GM-STAR-CIRCUIT-MASTERY-BALANCE-01`과 `FIVE_POINT_STAR`를 변경하지 않는다.
- `GM-SPELL-WORKFLOW-UI-V2-01`을 변경하지 않는다.
- PR #82 Task 1 GREEN을 보존하고 Task 2는 계속 차단한다.
- 이 명세 PR은 `project.godot`, Scene, Resource, asset, product script, `.gutconfig.json`, actual GutTest, runtime GUT workflow, addon 교체를 변경하지 않는다.

## 명세 병합 후 다음 단계

1. merged main readback.
2. official GUT subtree 교체 또는 file-level audit 승인.
3. HiGodot release ZIP 추출 manifest와 프로젝트 vendor 비교.
4. 새 implementation branch에서 strict RED→GREEN.
5. actual product GutTest, `.gutconfig.json`, Godot 4.7.1 CLI/JUnit, production hash guard, legacy parity, HiGodot manifest gate 구현.
6. Windows·Android shared-core validation.
7. exact-HEAD check와 GPT 역할 분리 검토.
8. 사용자 권위 정책에 따른 병합.

## 완료가 아닌 항목

```text
GUT_VENDOR_INTEGRITY_PASS
HIGODOT_VENDOR_INTEGRITY_PASS
GUT_FORMALLY_ADOPTED
GUT_RUNTIME_CI_PASS
HIGODOT_AUTHORING_RECEIPT_GATE_PASS
WINDOWS_ANDROID_VALIDATED
PR82_TASK2_AUTHORIZED
```

이 Decision은 채택 방향과 선행 명세 절차를 승인하며, 실제 설치·Runtime 완료를 선언하지 않는다.

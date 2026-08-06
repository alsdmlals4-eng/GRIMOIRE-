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
source_branch_or_release: "godot_4_7"
godot_target: "4.7.x"
adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
spec_only_pr: true
formal_installation_authorized_now: false
```

## 근거

- 기존 `addons/gut` 파일은 9.7.1과 Godot 4.7.x metadata를 포함하지만 실제 product `GutTest`, `.gutconfig.json`, GUT CI/JUnit, mutation guard가 없다.
- 파일 보관은 정식 채택 증거가 아니다.
- HiGodot의 단일 저작 권위와 GUT의 read/execute/assert 권위를 분리하면 Scene·Resource mutation과 테스트 기준 변경이 섞이는 위험을 줄일 수 있다.
- v4.3은 source·version·license·compatibility·consumer·CI·removal을 검토하는 adoption-spec Draft PR을 설치보다 먼저 요구한다.

## 역할 경계

```yaml
higodot:
  authority: SINGLE_GODOT_SCENE_NODE_RESOURCE_PROJECT_SETTINGS_AUTHOR
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
- 이 명세 PR은 `project.godot`, Scene, Resource, asset, product script, `.gutconfig.json`, actual GutTest, runtime GUT workflow를 변경하지 않는다.

## 명세 병합 후 다음 단계

1. merged main readback.
2. official GUT source commit, license, integrity hash, Godot 4.7.1 compatibility 확인.
3. 새 implementation branch에서 RED→GREEN.
4. actual product GutTest, `.gutconfig.json`, CLI/JUnit, production hash guard, legacy parity, HiGodot manifest gate 구현.
5. Windows·Android shared-core validation.
6. exact-HEAD check와 GPT 역할 분리 검토.
7. 사용자 권위 정책에 따른 병합.

## 완료가 아닌 항목

```text
GUT_FORMALLY_ADOPTED
GUT_RUNTIME_CI_PASS
HIGODOT_AUTHORING_RECEIPT_GATE_PASS
WINDOWS_ANDROID_VALIDATED
PR82_TASK2_AUTHORIZED
```

이 Decision은 채택 방향과 선행 명세 절차를 승인하며, 실제 설치·Runtime 완료를 선언하지 않는다.

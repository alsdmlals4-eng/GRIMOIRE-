# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.3
contract_binding_decision: GM-CONTRACT-V4-3-BINDING-01
current_branch: chore/gut-9.7.1-adoption-spec
base_main: 252063ccad18b885fc75cbeba3b807fefd76496e
platform: MOBILE_LANDSCAPE_FIXED
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
runtime_layout: FIVE_POINT_STAR
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
current_gate: BLOCKED_BY_GUT_ADOPTION_SPEC
canon_status: CONTRACT_V4_3_BOUND_SPEC_DRAFT_PR_IN_REVIEW
spell_workflow_implementation_pr: 82
spell_workflow_implementation_head: 0919b71dfec3c6f57b88e1290789302267936960
spell_workflow_implementation_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2: NOT_STARTED_ON_BRANCH
tool_authority_design_pr: 83
tool_authority_design_status: MERGED_MAIN_252063cc
gut_adoption_spec_pr: 84
gut_adoption_spec_status: OPEN_DRAFT_IN_REVIEW
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
external_independent_reviewer: NOT_PLANNED_SOLO_DEVELOPMENT
higodot_authority: SOLE_AUTHORING_AUTHORITY
higodot_release: v3.1.2
higodot_source_version_license: PASS
higodot_vendor_integrity: MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT
gut_release: v9.7.1
gut_source_version_license: PASS
gut_vendor_integrity: MISMATCH_OFFICIAL_V9_7_1
gut_current_consumption: VENDORED_NOT_CONSUMED
gut_adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
gut_formal_installation: NOT_AUTHORIZED_BEFORE_SPEC_MERGE
gut_ci: NOT_ENABLED
sheet_v4_3_sync: READBACK_PASS
base_release_pin: 9.4.3
base_current_main_observed: 4f98f968a377f7b6a11aafa4fc94d11bddbebedc
visual_direction_approval: COMPLETE
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
audio_vault_path: "C:/Users/user/Documents/GitHub/shered audio vault"
audio_vault_status: BLOCKED_UNVERIFIED
mobile_device_validation: DEVICE_NOT_RUN
performance_validation: PERFORMANCE_NOT_RUN
accessibility_validation: AUTOMATED_CONTRACT_PASS_DEVICE_NOT_RUN
human_visual_validation: HUMAN_NOT_RUN
full_vertical_slice_representativeness: FULL_VERTICAL_SLICE_NOT_RUN
local_sync: LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
godot_run: GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
merge_authorized: false
```

## 활성 계약

프로젝트별 v4.3 바인딩은 `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md`다. 원문의 Switchy-Express 경로는 범용 예시이고 GRIMOIRE 권위 경로는 `C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-`다.

v4.3에 따라 entry state를 다시 계산했다. 기존 `GUT_FORMAL_ADOPTION_IMPLEMENTATION_NEXT`는 선행 adoption-spec PR이 없으므로 `BLOCKED_BY_GUT_ADOPTION_SPEC`로 되돌렸다.

## 활성 주문 UX

```text
글자 그리기 → 회로 배치 → 주문 사용
```

PR #82 Task 1은 10종 Glyph Catalog와 legacy `BURST → AMPLIFY` 정규화를 RED→GREEN으로 완료했다. Task 2는 현재 차단된다.

## 공식 도구 소스·무결성

```yaml
higodot:
  release: v3.1.2
  commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
  release_asset_sha256: 60915d780e112aa25b142a596548786a0fb558f795278b9337722532e5dfdb33
  official_plugin_tree: e559376d95c12f67ae0117a23bcc1dd2519206c2
  project_vendor_tree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
  license: MIT
  vendor_integrity: MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT
gut:
  release: v9.7.1
  commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
  official_addons_tree: 5d6893836af4917ee62b1a395125a7530b1f239d
  project_vendor_tree: 09d040309bbed0e07420ad72c4aa69cbd0e58190
  license: MIT
  vendor_integrity: MISMATCH_OFFICIAL_V9_7_1
```

공식 release·commit·license는 확인됐다. 하지만 프로젝트 vendor subtree가 official subtree와 다르므로 tool installation integrity는 실패 상태다. PR #84는 이 mismatch를 기록하며 addon 파일을 교체하거나 실행하지 않는다.

## 권위 상태

HiGodot은 protected Godot serialization과 Editor API mutation의 단일 write authority다. GUT은 별도 read/execute/assert 테스트 권위다. GUT Editor Plugin은 켜지 않으며 `project.godot` 변경을 만들지 않는다.

현재 없는 것:

- merged GUT adoption spec.
- 승인된 official vendor replacement 또는 file-level audit.
- actual Godot 4.7.1 GUT CLI compatibility evidence.
- `.gutconfig.json`과 실제 제품 `GutTest`.
- GUT CI·JUnit·production hash guard.
- legacy/GUT 필수 계약 parity.
- protected diff용 HiGodot authoring manifest Gate.

## PR #84 범위

```text
docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_3_BINDING.md
docs/testing/GUT_9_7_1_ADOPTION_SPEC.md
docs/decisions/DEC-GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01-adopt-gut-9-7-1.md
docs/planning/ENTRY_STATE_RECONCILIATION_V4_3.json
활성 상태·Gate 문서
명세 계약 테스트
Sheet 동기화
```

PR #84는 spec-only다. `.gutconfig.json`, actual `GutTest`, runtime GUT workflow, `project.godot`, Scene, Resource, product, asset, addon 교체를 포함하지 않는다.

## 동결 브랜치

`agent/gut-9-7-1-formal-adoption-tdd`는 v4.3 spec Gate보다 먼저 시작되어 `FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE`다. 해당 commit은 병합·cherry-pick하지 않으며 adoption 증거로 사용하지 않는다.

## 검토 모델

1인 개발이므로 별도 인간 reviewer가 있다고 가장하지 않는다. 구현자 설명과 분리된 exact diff·정본·테스트 입력으로 검토하고, 사용자 결정권·GUT/CI 객관 증거·exact-HEAD Check를 결합한다.

## 시각·오디오 상태

사용자 시각 방향 승인은 완료됐다. 남은 것은 실제 3화면 구현·렌더·기기·사람 검토이며 final art는 주장하지 않는다. 오디오 Vault는 로컬 접근 불가로 path·rights가 미검증이다.

## 현재 작업

공식 source/vendor mismatch를 Google Sheet에 추가 동기화하고 PR #84 exact-HEAD CI와 역할 분리 검토를 완료한다. 병합된 main을 기준으로만 새 GUT formal-installation TDD PR을 시작한다.

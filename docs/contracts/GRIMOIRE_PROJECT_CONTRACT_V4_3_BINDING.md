# GRIMOIRE 프로젝트 계약 v4.3 바인딩

```yaml
contract_name: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION
contract_version: "4.3"
contract_status: ACTIVE_INTEGRATED_AUDIT_IMPLEMENTATION_DELIVERY_CONTRACT
binding_decision_id: GM-CONTRACT-V4-3-BINDING-01
approved_at: 2026-08-06
approval_source: 사용자 지시 — "지시문 4.3으로 업뎃했어 이걸 기준 계약으로 진행해줘"
project_name: "GRIMOIRE: 세계를 다시 쓰는 법"
project_repository: "alsdmlals4-eng/GRIMOIRE-"
project_default_branch: "main"
project_local_path: "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-"
canonical_local_checkout: "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-"
godot_project_path: "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-"
project_google_sheet: "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM"
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
external_independent_reviewer: NOT_PLANNED_SOLO_DEVELOPMENT
merge_authority: CURRENT_CONVERSATION_RECOMMENDED_MERGES_AUTO_APPROVED
shared_audio_vault_path: "C:/Users/user/Documents/GitHub/shered audio vault"
shared_audio_vault_access: READ_ONLY_SOURCE_LIBRARY
local_access: BLOCKED_UNVERIFIED
```

## 1. 권위와 적용 범위

이 문서는 업로드된 `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.3.md`를 GRIMOIRE에 적용하는 프로젝트별 바인딩이다. v4.3 원문은 통합 작업 계약이며, 이 바인딩은 원문의 빈 입력과 범용 예시 값을 GRIMOIRE의 실제 권위 값으로 채운다.

v4.2와 그 이전 계약은 역사·비교 증거로 보존하지만 활성 작업 진입·검토·병합 판정에는 v4.3을 사용한다.

## 2. 프로젝트별 입력

```yaml
mode: PLAN_AND_IMPLEMENT
base_repository: "https://github.com/alsdmlals4-eng/Base"
base_branch: "main"
base_current_main_observed: "4f98f968a377f7b6a11aafa4fc94d11bddbebedc"
project_base_pin: "9.4.3"
project_main_at_binding: "252063ccad18b885fc75cbeba3b807fefd76496e"
godot_expected_version: "4.7.x"
godot_exact_version_to_verify: "4.7.1 CI target; local executable BLOCKED_UNVERIFIED"
godot_project_file: "project.godot"
target_platforms:
  - Windows
  - Android
shared_core_policy: SINGLE_GAME_LOGIC_AND_DATA_CORE
platform_separation_policy: INPUT_UI_AND_PLATFORM_INTEGRATION_ONLY
windows_export_required: true
android_export_required: true
```

### Google Sheet 권위 범위

```yaml
decision_ledger_source: "02_현재_확정결정"
unresolved_items_source: "04_누락_충돌_감사"
image_review_sheet_tab_or_range: "72_이미지검수_승인로그"
required_tabs:
  - "00_프로젝트_허브"
  - "01_작업순서"
  - "02_현재_확정결정"
  - "04_누락_충돌_감사"
  - "72_이미지검수_승인로그"
  - "99_변경이력"
entry_state_reconciliation_required: true
```

## 3. 범용 예시와 프로젝트 권위 충돌 해소

```yaml
SWITCHY_EXPRESS_GENERIC_PLACEHOLDER_NOT_AUTHORITATIVE: true
```

v4.3 원문의 `C:/Users/user/Documents/GitHub/Ninza/Switchy-Express-Cargo-Puzzle` 값은 범용 계약 예시다. GRIMOIRE에서는 사용자 제공 프로젝트 경로 `C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-`가 권위다.

| 항목 | v4.3 범용 값 | GRIMOIRE 권위 값 | 판정 |
|---|---|---|---|
| repository | 빈 값 | `alsdmlals4-eng/GRIMOIRE-` | BOUND |
| local/Godot path | Switchy-Express 예시 | `C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-` | OVERRIDDEN_BY_USER_PROJECT_INPUT |
| Google Sheet | 빈 값 | GRIMOIRE Sheet ID | BOUND |
| review | 외부 독립 reviewer 미계획 | GPT 역할 분리 검토 + 사용자 결정권 | ACTIVE |
| 이미지 단계 | `[이미지 완료]` | `[이미지·오디오 완료]` 호환 해석 | ACTIVE |
| audio vault | `shered audio vault` | 원문 철자 그대로, 로컬 확인 전 미검증 | BLOCKED_UNVERIFIED |

## 4. 보존 결정과 금지 사항

```yaml
protected_decisions:
  - GM-STAR-CIRCUIT-MASTERY-BALANCE-01
  - GM-SPELL-WORKFLOW-UI-V2-01
  - GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
protected_runtime_layout: FIVE_POINT_STAR
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
gut_formally_adopted: false
```

- PR #82 Task 2는 GUT adoption-spec 병합, 정식 설치 구현, exact-HEAD 검증, merged-main readback 전 시작하지 않는다.
- GUT Editor Plugin을 임의로 활성화하거나 `project.godot`을 직접 편집하지 않는다.
- Scene·Node·Resource·Theme·Animation·signal·Project Settings 변경은 HiGodot만 저작한다.
- GUT·CI·fixture는 production 파일을 수정하지 않는다.
- 오디오 Vault의 절대 경로를 runtime에서 참조하지 않는다.

## 5. v4.3 전환에 따른 진입 상태 재판정

```yaml
entry_gate:
  decision_ledger_readback: PASS
  unresolved_list_readback: PASS
  image_review_sheet_readback: PASS
  originally_ready_items:
    - GUT_FORMAL_ADOPTION_IMPLEMENTATION_NEXT
  originally_awaiting_items: []
  corrected_statuses:
    - from: GUT_FORMAL_ADOPTION_IMPLEMENTATION_NEXT
      to: BLOCKED_BY_GUT_ADOPTION_SPEC
      reason: v4.3 requires a separate adoption-spec branch and reviewable Draft PR merged before installation
    - from: EXTERNAL_INDEPENDENT_REVIEW_REQUIRED
      to: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
      reason: v4.3 solo-development review model
  blocking_reasons:
    - GUT_ADOPTION_SPEC_NOT_MERGED
    - HIGODOT_SOURCE_OR_VERSION_UNVERIFIED
    - GUT_SOURCE_OR_VERSION_UNVERIFIED
    - GUT_GODOT_COMPATIBILITY_UNVERIFIED
    - AUDIO_VAULT_PATH_UNVERIFIED
  allowed_next_actions:
    - CREATE_AND_REVIEW_GUT_ADOPTION_SPEC_DRAFT_PR
    - SYNC_V4_3_BINDING_TO_GITHUB_AND_SHEET
    - VERIFY_OFFICIAL_SOURCE_LICENSE_COMPATIBILITY_AND_REMOVAL_PLAN
  decision: BLOCK
```

## 6. 브랜치 전환

```yaml
required_spec_branch: "chore/gut-9.7.1-adoption-spec"
required_spec_pr: 84
prior_implementation_branch: "agent/gut-9-7-1-formal-adoption-tdd"
prior_implementation_branch_status: FROZEN_SUPERSEDED_BY_V4_3_SPEC_GATE
prior_branch_commits_mergeable_as_adoption_evidence: false
```

방금 생성된 구현 브랜치는 v4.3 선행 명세 Gate보다 먼저 시작되었으므로 동결한다. 해당 브랜치의 테스트·상태 변경은 main에 병합하거나 GUT 채택 완료 증거로 사용하지 않는다.

## 7. 로컬·오디오 제한

이 실행 환경에서는 사용자 Windows 경로와 `shered audio vault`를 읽을 수 없다.

```text
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
```

원격 GitHub·Sheet 작업은 계속할 수 있지만 로컬 fast-forward, 실제 HiGodot 연결, 오디오 Vault inventory, 로컬 Godot 실행 완료를 주장하지 않는다.

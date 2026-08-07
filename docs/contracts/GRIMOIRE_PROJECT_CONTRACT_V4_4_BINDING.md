# GRIMOIRE 프로젝트 계약 v4.4 바인딩

```yaml
contract_name: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION
contract_version: "4.4"
contract_status: ACTIVE_BASE_ALIGNED_ZERO_BUDGET_GODOT_DELIVERY_CONTRACT
binding_decision_id: GM-CONTRACT-V4-4-BINDING-01
approved_at: 2026-08-08
approval_source: 사용자 제공 v4.4 작업지시문 + 현재 대화의 "진행해"
project_name: "GRIMOIRE: 세계를 다시 쓰는 법"
project_repository: "alsdmlals4-eng/GRIMOIRE-"
project_default_branch: "main"
project_local_path: "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-"
canonical_local_checkout: "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-"
godot_project_path: "C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-"
project_google_sheet: "19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM"
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
merge_authority: APPROVED_ITEM_INHERITS_MERGE_AUTHORITY
codex_handoff_policy: ON_DEMAND_CODEX_HANDOFF
codex_handoff_state: NOT_REQUESTED
```

## 1. 권위와 적용 범위

이 문서는 사용자가 제공한 `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4.md`를 GRIMOIRE에 적용하는 프로젝트별 바인딩이다. v4.4는 최신 사용자 지시이므로 v4.3 바인딩보다 우선한다. v4.3과 그 이전 문서는 역사·비교·추적 증거로 보존하며 삭제하거나 과거 사실을 다시 쓰지 않는다.

v4.4 원문의 범용 예시 경로 `Switchy-Express-Cargo-Puzzle`은 GRIMOIRE 권위 값이 아니다. 이 프로젝트에서는 사용자 제공 `GRIMOIRE-` 저장소/로컬/Godot 경로를 사용한다.

## 2. 2026-08-08 작업 진입 readback

```yaml
base_repository: "https://github.com/alsdmlals4-eng/Base"
base_branch: "main"
base_current_main_observed: "fa69a77a14f923a756064f6ae151d34cadb374f7"
base_recursive_inventory: PASS
base_active_skill_snapshot_count: 29
project_main_observed: "563c2b08cb96354fdd7209a32d7fd8ec26bb334c"
project_repository_visibility: PUBLIC
project_open_prs:
  - 85
  - 82
project_gut_pr: 85
project_spell_workflow_pr: 82
project_base_pin: "9.4.3"
base_pin_update: NOT_APPROVED_NOT_PERFORMED
```

현재 Base `main`은 v4.4 지시문 작성 시 관찰 SHA와 실제 readback이 일치했다. 이 값은 이번 진입 증거이며 다음 작업에서 다시 조회한다.

## 3. GitHub Actions·병합·Codex 계약

```yaml
actions_budget_usd: 0
canonical_ci_mode: PUBLIC_REPO_STANDARD_GITHUB_HOSTED
allowed_runner_class: STANDARD_GITHUB_HOSTED
forbidden_runner_classes:
  - LARGER_RUNNER
  - GPU_RUNNER
  - PAID_CUSTOM_IMAGE
required_check_policy: FAIL_CLOSED_CURRENT_REPOSITORY_POLICY
merge_method_preference: squash
merge_authority: APPROVED_ITEM_INHERITS_MERGE_AUTHORITY
codex_handoff_policy: ON_DEMAND_CODEX_HANDOFF
codex_handoff_trigger: USER_REQUESTED_CODEX_HANDOFF
```

`APPROVED_ITEM_INHERITS_MERGE_AUTHORITY`는 검증 우회 권한이 아니다. exact-head/현재 GitHub 검증 대상, required checks, unresolved threads, P0/P1, 승인 범위와 repository policy가 모두 만족되어야 한다.

Codex는 현재 사용자가 요청하지 않았으므로 `NOT_REQUESTED`다. GPT가 승인 범위의 조사·기획·검증과 비-Godot 정본/테스트 작업을 계속한다.

## 4. Godot 도구 권위

```yaml
higodot:
  canonical_source_repository: "hi-godot/godot-ai"
  pinned_project_version: "3.1.2"
  authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
  vendor_integrity: MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT

gut:
  canonical_source_repository: "bitwes/Gut"
  pinned_version: "9.7.1"
  pinned_commit: "aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605"
  authority: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY_WHEN_FORMALLY_ADOPTED
  adoption_spec_pr: 84
  adoption_spec_status: MERGED_MAIN_VERIFIED
  implementation_pr: 85
  editor_plugin: DISABLED
  formal_adoption: PENDING_REMAINING_GATES

hera:
  role: LIVE_QA_AND_OBSERVABILITY_ONLY
  persistent_source_mutation: FORBIDDEN
  exact_cli_addon_pair: BLOCKED_UNVERIFIED
```

PR #85에는 `project.godot`, `*.tscn`, `*.tres`, `*.res` 같은 protected Godot authoring 파일을 현재 변경 목록 기준으로 포함하지 않는다. protected Godot diff가 실제 0이면 v4.4/GUT spec의 규칙에 따라 HiGodot authoring manifest는 필요하지 않지만, 해당 zero-diff 자체를 fail-closed 검증해야 한다.

## 5. Asset Vault·Reference·오디오 계약

```yaml
project_asset_vault:
  local_root: "<project-root>/.asset-vault/"
  godot_local_projection: "res://assets/_vault_local/"
  tracked_manifest: "ASSET_MANIFEST.yml"
  approval_boundary: PROJECT_ASSET_APPROVED
  tracked_promotion_required: true
  current_main_manifest_readback: MISSING
  current_interpretation: NO_PROMOTED_ASSET_CLAIM_MADE_BY_THIS_BINDING

local_godot_reference_library:
  path: "C:/Users/user/Documents/GitHub/Godot_Reference"
  authority: REFERENCE_ONLY
  access_from_current_agent: BLOCKED_UNVERIFIED

shared_audio_vault:
  path: "C:/Users/user/Documents/GitHub/shered audio vault"
  access: READ_ONLY_SOURCE_LIBRARY
  path_status: AUDIO_VAULT_PATH_UNVERIFIED
  rights_status: AUDIO_RIGHTS_UNVERIFIED
  runtime_reference_policy: COPY_APPROVED_ASSETS_INTO_RES_NOT_ABSOLUTE_PATH
```

`ASSET_MANIFEST.yml`이 현재 `main`에 없다는 사실만으로 제품 실패를 선언하지 않는다. 승인된 제품 자산을 promote했다고 주장하려면 manifest와 tracked `res://assets/...` readback이 필수다. 현재 바인딩은 새 자산 승격을 수행하지 않는다.

현재 대화에 제공된 Godot demo/template/plugin ZIP은 `REFERENCE_ONLY` 또는 별도 검토 전 `REUSE_TRIAL` 후보이며 실제 `C:/Users/user/Documents/GitHub/Godot_Reference`에 복사되었다고 주장하지 않는다.

## 6. Google Sheet 권위 범위

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

현재 Sheet는 GUT vendor-equivalence 및 public Actions Decision을 GitHub `main`의 오래된 cold-start 문서보다 더 최신 상태로 기록하고 있었다. 이번 작업은 Sheet를 프로젝트 정본보다 상위 권위로 승격시키는 것이 아니라, drift를 `CANON_CONFLICT/STALE_STATUS`로 보고하고 같은 Decision ID로 다시 맞추는 작업이다.

## 7. 보호 결정과 현재 작업 경계

```yaml
protected_decisions:
  - GM-STAR-CIRCUIT-MASTERY-BALANCE-01
  - GM-SPELL-WORKFLOW-UI-V2-01
  - GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
  - GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01
  - GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
new_binding_decision:
  - GM-CONTRACT-V4-4-BINDING-01
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
visual_audio_completion: NOT_COMPLETE
```

이미지 `GR-IMG-011` 방향 승인은 재질문하지 않는다. 방향 승인만 완료됐으며 실제 3-screen runtime/최종 art/오디오 완료는 주장하지 않는다.

## 8. 현재 Entry Gate

세부 readback은 `docs/planning/ENTRY_STATE_RECONCILIATION_V4_4.md`가 담당한다.

```yaml
entry_gate: BLOCK
blocking_scope: GUT_FORMAL_ADOPTION_FINALIZATION
allowed_next_actions:
  - BIND_V4_4_TO_GITHUB_AND_SHEET
  - PROVE_LEGACY_TO_GUT_REQUIRED_CONTRACT_PARITY
  - PROVE_HIGODOT_ZERO_PROTECTED_DIFF_OR_REQUIRE_RECEIPT
  - RUN_ROLE_SEPARATED_EXACT_HEAD_REVIEW
  - SYNC_FINAL_GUT_STATE_TO_SHEET
forbidden_next_action:
  - START_PR82_TASK2
```

로컬 Windows checkout을 이 환경에서 읽거나 수정할 수 없으므로 최종 `Fetch/Pull`, merged-local-main, clean Godot Project Play는 실제 수행 전 `BLOCKED_NO_LOCAL_ACCESS`로 유지한다.

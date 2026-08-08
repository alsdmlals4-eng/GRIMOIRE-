# GRIMOIRE 현재 확정 결정 스냅샷

```yaml
status: ACTIVE_CANON_V4_4_GUT_FORMALLY_ADOPTED
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_binding_decision: GM-CONTRACT-V4-4-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_pr: 87
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
gut_vendor_equivalence_decision: GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
gut_status: GUT_FORMALLY_ADOPTED
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
```

현재 `main` 자체는 저장된 SHA가 아니라 `project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK`로 판정한다. `gut_formal_adoption_main`은 PR #85의 역사 merge, `post_merge_canon_sync_merge`는 PR #87의 역사 merge다.

## GM-CONTRACT-V4-4-BINDING-01

사용자가 제공한 v4.4 통합 작업지시문을 GRIMOIRE의 활성 계약으로 바인딩한다.

```yaml
project_repository: alsdmlals4-eng/GRIMOIRE-
project_default_branch: main
project_local_path: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-
godot_project_path: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-
project_google_sheet: 19FftrZ4WzB-CXa9Q-y25iKMhmEs1Ip4Ea3ramf2xKqM
base_current_main_observed: fa69a77a14f923a756064f6ae151d34cadb374f7
base_release_pin: 9.4.3
codex_handoff: NOT_REQUESTED
```

v4.3 바인딩은 역사 증거로 보존하지만 현재 권위가 아니다.

## 보존 제품 결정

`GM-STAR-CIRCUIT-MASTERY-BALANCE-01`의 `FIVE_POINT_STAR`, Typed Glyph Stock, Exactly-once 처리와 `GM-SPELL-WORKFLOW-UI-V2-01`의 `글자 그리기 → 회로 배치 → 주문 사용`을 유지한다.

PR #82 Task 1 GREEN은 보존한다. `spell_workflow_task2_authorized: false`이며 broader authoring/QA/visual/platform Gate가 닫히기 전에는 Task 2를 시작하지 않는다.

## GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01

```yaml
gut_release: v9.7.1
gut_pinned_commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
gut_spec_pr: 84
gut_implementation_pr: 85
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
gut_formal_adoption: GUT_FORMALLY_ADOPTED
gut_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
gut_editor_plugin: DISABLED
full_vendor_tree_identity: false
critical_runtime_equivalence: APPROVED
legacy_required_contract_parity: PASS
hosted_godot_4_7_1_gut: PASS
junit_discovery_exit: PASS
product_mutation_hash_gate: PASS
higodot_zero_protected_diff_gate: PASS
```

## GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01

```yaml
repo_wide_actions_full_sha: PASS
status: REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS
enforcement_test: tests/test_v4_4_ci_supply_chain.py
normal_pr_gate: Validate Godot Authoring and GUT Authority Gate
```

모든 active workflow의 official `actions/*` ref는 full 40-hex commit SHA로 강제되며 known action pin은 검증 목록과 일치해야 한다.

## Google Sheet

`GM-CONTRACT-V4-4-BINDING-01`은 Sheet write/readback PASS다. 현재 main SHA는 GitHub default branch live readback으로 판정하고 Sheet에는 PR #85/#87/이후 canon semantics merge를 역사 증거로 기록한다.

## 현재 남은 Gate

```text
HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2
HERA_CLI_ADDON_PAIR_UNVERIFIED
WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

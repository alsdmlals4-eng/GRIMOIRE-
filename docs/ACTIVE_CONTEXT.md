# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
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
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
gut_formal_adoption: GUT_FORMALLY_ADOPTED
gut_formal_adoption_pr: 85
gut_exact_head: fc178bdc7a3e12faf4ae7ae78fd1f92dd2735849
gut_validation_run: 31227323973
authority_validation_run: 31227323956
godot_toolchain_run: 31227323954
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
higodot_vendor_integrity: MISMATCH_REQUIRES_RELEASE_ARCHIVE_AUDIT
hera_status: HERA_CLI_ADDON_PAIR_UNVERIFIED
base_release_pin: 9.4.3
base_current_main_observed: fa69a77a14f923a756064f6ae151d34cadb374f7
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
local_sync: LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
godot_run: GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

`project_main_authority`는 매 작업에서 GitHub default branch를 다시 읽는 live 권위다. 역사 SHA는 역할명으로만 보존한다.

## 보존된 Star Circuit runtime authority

```yaml
decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
sync_id: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
canon_status: SYNCED_TO_MAIN
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
human_validation: NOT_RUN
tuning_status: PLAYTEST_TUNING_REQUIRED
```

v4.4/GUT 정본 갱신은 위 제품 runtime 결정과 검증 상태를 대체하지 않는다.

## GUT formal adoption readback

PR #85의 formal-adoption merge는 `gut_formal_adoption_main`으로 기록한다. PR #87의 current-canon sync는 `post_merge_canon_sync_merge`로 기록한다. 둘 다 live current-main SHA가 아니다.

```yaml
gut_release: v9.7.1
gut_pinned_commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
gut_official_addons_tree: 5d6893836af4917ee62b1a395125a7530b1f239d
gut_project_tree: 09d040309bbed0e07420ad72c4aa69cbd0e58190
full_vendor_tree_identity: false
critical_runtime_equivalence: APPROVED
decision: GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01
editor_plugin: DISABLED
hosted_windows_godot_4_7_1_gut: PASS
hosted_ubuntu_godot_4_7_1_gut: PASS
legacy_required_contract_parity: PASS
product_mutation_hash_gate: PASS
higodot_zero_protected_diff_gate: PASS
```

## GitHub Actions supply chain

```yaml
decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
status: REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS
enforcement: tests/test_v4_4_ci_supply_chain.py
```

## 현재 작업 경계

GUT formal adoption과 repo-wide official Actions full-SHA hardening은 더 이상 PR #82 Task 2의 선행 blocker가 아니다. 그러나 Task 2가 persistent Godot authoring, Hera acceptance, visual/audio, Windows/Android product validation을 소비하므로 다음 broader blocker를 먼저 닫아야 한다.

```text
HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2
HERA_CLI_ADDON_PAIR_UNVERIFIED
WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
```

사용자 로컬 checkout과 shared audio vault는 이 agent에서 직접 읽을 수 없다. 따라서 `LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS`, `GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS`를 유지한다.

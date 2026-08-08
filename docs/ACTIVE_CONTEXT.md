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
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_vendor_integrity_evidence: docs/validation/HIGODOT_V3_1_2_VENDOR_INTEGRITY.json
hera_exact_pair: PASS
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_live_canary_run: 31254032278
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
base_release_pin: 9.4.3
base_binding_main_observed: fa69a77a14f923a756064f6ae151d34cadb374f7
base_latest_main_observed_pr91: eee98a930219065e30b4d7d14d99d5ac7db44c60
base_pin_update: NOT_APPROVED_NOT_PERFORMED
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
local_sync: LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
godot_run: GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

`project_main_authority`는 매 작업에서 GitHub default branch를 다시 읽는 live 권위다. 역사 SHA는 역할명으로만 보존한다. Base `fa69a77...`는 v4.4 바인딩 시점 관찰이고, PR #91 진입 시 최신 Base `main`은 `eee98a930...`이다. Base release pin `9.4.3`은 갱신 승인되지 않았다.

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

v4.4/GUT/Hera 정본 갱신은 위 제품 runtime 결정과 검증 상태를 대체하지 않는다.

## HiGodot v3.1.2 vendor integrity

```yaml
release: v3.1.2
pinned_commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
official_plugin_wrapper_tree: e559376d95c12f67ae0117a23bcc1dd2519206c2
official_plugin_subtree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
project_plugin_subtree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
comparison_scope_rule: COMPARE_PLUGIN_SUBTREE_TO_PLUGIN_SUBTREE
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
correction_sync: GR-SYNC-20260808-04-HIGODOT-VENDOR-INTEGRITY
```

과거 mismatch는 official `plugin/` wrapper와 project plugin subtree를 비교한 scope 오류였다. vendor subtree는 exact identity PASS이며 HiGodot은 계속 sole persistent-authoring authority다. authoring receipt Gate는 유지한다.

## Hera v1.0.0 exact pair

```yaml
upstream_tag_commit: 10f245ddae9e7a5d569150302acbde0d78f2aa03
upstream_addon_tree: 6cb87ac8ba768de1d924447f385fba6d80bcde68
project_addon_tree: 6cb87ac8ba768de1d924447f385fba6d80bcde68
linux_cli_sha256: 384d93652ade67f0a2c975e152521760d3bf32f8770edd4b9ee382ea98bcab8a
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
live_canary_run: 31254032278
loopback_bind: PASS_127_0_0_1_ONLY
wrong_token_rejection: PASS
correct_token_status: PASS
godot_4_7_1_status: PASS
repository_source_delta_zero: PASS
acceptance_qa_authorized: true
persistent_source_mutation_authorized: false
```

Hera는 `LIVE_QA_AND_OBSERVABILITY_ONLY`다. canary는 임시 Godot 프로젝트에서 실행됐고 GRIMOIRE `project.godot`/addon/source를 변경하지 않았다. 최신 Base `main@eee98a930...`의 current toolchain contract test도 exact pair, localhost-only, shared token, persistent write 금지, acceptance source-delta `NONE`을 계속 요구한다.

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

GUT formal adoption, repo-wide official Actions full-SHA hardening, HiGodot vendor integrity, Hera exact CLI/addon pair는 더 이상 PR #82 Task 2의 선행 blocker가 아니다. 그러나 Task 2가 visual/audio 및 Windows/Android product validation을 소비하므로 다음 broader blocker는 계속 닫아야 한다.

```text
WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
```

사용자 로컬 checkout과 shared audio vault는 이 agent에서 직접 읽을 수 없다. 따라서 `LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS`, `GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS`를 유지한다.

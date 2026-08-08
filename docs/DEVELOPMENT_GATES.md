# GRIMOIRE 개발·기획 게이트

```yaml
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
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
hera_exact_pair: PASS
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
gut_formal_adoption: GUT_FORMALLY_ADOPTED
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
implementation_entry: BLOCKED_BY_BROADER_PROJECT_GATES
```

`project_main_authority`는 GitHub default branch live readback이다. `gut_formal_adoption_main`과 `post_merge_canon_sync_merge`는 역사 SHA다.

## Gate 0 — v4.4 Application Binding

`PASS_MERGED_MAIN`

- 바인딩: `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md`
- Base v4.4 binding 시점 main 관찰: `fa69a77a14f923a756064f6ae151d34cadb374f7`.
- PR #91 진입 시 최신 Base main 관찰: `eee98a930219065e30b4d7d14d99d5ac7db44c60`.
- project Base release pin은 9.4.3 그대로이며 pin update는 승인·수행되지 않았다.
- Decision/미확정/이미지 Sheet 및 GitHub live main을 작업 진입 때마다 다시 읽는다.

## 보존 Runtime Gate

```yaml
decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
```

## Gate 15.1 — HiGodot single authoring authority

`PASS_EXACT_TREE_IDENTITY`

```yaml
release: v3.1.2
pinned_commit: 678b16a6a0a335cf80cbb7d3f85c183cd3e616de
authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
official_plugin_subtree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
project_plugin_subtree: a7d1e2fe8564cc385d683ec50d15fc66e1a17a35
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
evidence: docs/validation/HIGODOT_V3_1_2_VENDOR_INTEGRITY.json
```

기존 `e559376d...` 대 `a7d1e2fe...` mismatch는 official `plugin/` wrapper와 plugin subtree를 비교한 scope 오류였다. persistent Godot authoring은 계속 HiGodot 단일 권위를 사용하고, protected diff에는 fail-closed authoring receipt Gate를 적용한다.

## Gate 15.2–15.3 — GUT 9.7.1

`GUT_FORMALLY_ADOPTED`

```yaml
spec_pr: 84
implementation_pr: 85
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
release: v9.7.1
pinned_commit: aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605
full_vendor_tree_identity: false
critical_runtime_equivalence_decision: GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01
adoption_mode: CLI_ONLY_WITHOUT_EDITOR_PLUGIN
editor_plugin: DISABLED
windows_godot_gut: PASS
ubuntu_godot_gut: PASS
junit_discovery_exit: PASS
product_mutation_hash: PASS
legacy_required_contract_parity: PASS
```

## Gate 15.4 — Hera v1.0.0 exact pair

`HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS`

```yaml
release: v1.0.0
upstream_tag_commit: 10f245ddae9e7a5d569150302acbde0d78f2aa03
upstream_addon_tree: 6cb87ac8ba768de1d924447f385fba6d80bcde68
project_addon_tree: 6cb87ac8ba768de1d924447f385fba6d80bcde68
linux_cli_sha256: 384d93652ade67f0a2c975e152521760d3bf32f8770edd4b9ee382ea98bcab8a
live_canary_run: 31254032278
localhost_127_0_0_1_only: PASS
shared_token_required: PASS
wrong_token_rejected: PASS
correct_token_status: PASS
godot_4_7_1: PASS
repository_source_delta_zero: PASS
acceptance_qa_authorized: true
persistent_source_mutation_authorized: false
evidence: docs/validation/HERA_V1_0_0_EXACT_PAIR.json
```

Hera는 `LIVE_QA_AND_OBSERVABILITY_ONLY`다. persisted GRIMOIRE `project.godot`에는 Hera를 enable하지 않는다. 최신 Base `main@eee98a930...`의 current contract도 exact CLI/addon pair, localhost-only, shared token, persistent write 금지, acceptance source delta `NONE`을 유지한다.

## Gate 15.5 — PR #82 Task 2 entry

```yaml
pr: 82
task1: GREEN
task2: NOT_STARTED_ON_BRANCH
spell_workflow_task2_authorized: false
```

## Gate 16 — Windows·Android shared core

`WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED`

## Gate 17 — Visual·Audio

```text
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN
```

## Gate 18 — CI supply chain

`REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS`

```yaml
decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
enforcement_test: tests/test_v4_4_ci_supply_chain.py
```

## Delivery Gate

```text
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

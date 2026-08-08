# GRIMOIRE 현재 미확정·차단 게이트

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_version: "4.4"
contract_binding_decision_id: GM-CONTRACT-V4-4-BINDING-01
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
product_decision_id: GM-SPELL-WORKFLOW-UI-V2-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
hera_exact_pair: PASS
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_pr: 87
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
status: TASK2_AUTHORIZED_AWAITING_HIGODOT_CHANNEL_POST_IMPLEMENTATION_ACCEPTANCE_REMAINS
formal_adoption_scope: MERGED_MAIN_VERIFIED
gut_implementation_pr: 85
gut_implementation_status: GUT_FORMALLY_ADOPTED
gut_exact_head: fc178bdc7a3e12faf4ae7ae78fd1f92dd2735849
gut_validation_run: 31227323973
authority_validation_run: 31227323956
spell_workflow_pr: 82
spell_workflow_status: TASK2_AUTHORIZED_AWAITING_HIGODOT_CHANNEL
spell_workflow_task2_authorized: true
spell_workflow_task2_readiness: READY_FOR_HIGODOT_AUTHORING
spell_workflow_task2_execution_status: AUTHORIZED_AWAITING_HIGODOT_CHANNEL
spell_workflow_task2_approval_sync: GR-SYNC-20260809-01-TASK2-USER-APPROVAL
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
```

현재 main은 `project_main_authority`에 따라 GitHub default branch를 live readback한다. `gut_formal_adoption_main`과 `post_merge_canon_sync_merge`는 PR #85/#87의 역사 merge 증거다.

## 닫힌 Gate

```text
GUT_ADOPTION_SPEC_MERGED
GUT_GODOT_4_7_1_RUNTIME_COMPATIBILITY_PASS
GUT_ACTUAL_PRODUCT_TEST_CONSUMPTION_PASS
GUT_PUBLIC_STANDARD_GITHUB_ACTIONS_PASS
GUT_JUNIT_DISCOVERY_EXIT_PASS
GUT_PRODUCT_MUTATION_HASH_GATE_PASS
LEGACY_TO_GUT_COVERAGE_PARITY_PASS
HIGODOT_ZERO_PROTECTED_DIFF_GATE_PASS
HIGODOT_VENDOR_INTEGRITY_PASS_EXACT_TREE_IDENTITY
ROLE_SEPARATED_REVIEW_P0_P1_ZERO
PR85_MERGED_MAIN_VERIFIED
REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS
HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
TASK2_USER_AUTHORIZATION_GRANTED
```

HiGodot v3.1.2의 current vendor-integrity는 `docs/validation/HIGODOT_V3_1_2_VENDOR_INTEGRITY.json`에 고정한다. official `plugin/addons/godot_ai`와 project `addons/godot_ai`가 동일 tree `a7d1e2fe...`다. 과거 mismatch는 wrapper/subtree scope 오류로 `GR-SYNC-20260808-04-HIGODOT-VENDOR-INTEGRITY`에서 교정했다.

Hera v1.0.0 exact pair evidence는 `docs/validation/HERA_V1_0_0_EXACT_PAIR.json`에 고정한다. upstream/project addon tree는 `6cb87ac8...`로 동일하고 hosted canary run `31254032278`에서 official CLI digest/version, localhost-only bind, shared-token enforcement, wrong-token rejection, correct-token status, Godot 4.7.1, repository source-delta zero가 PASS했다. Hera는 `LIVE_QA_AND_OBSERVABILITY_ONLY`이며 persistent source mutation 권위가 아니다.

PR #91 진입 시 Base main은 `eee98a930219065e30b4d7d14d99d5ac7db44c60`, visual/platform Gate 진입 시 Base main은 `a912cc001ff4d4e3415fb4b4931723c49eb08d9a`였다. Base release pin은 9.4.3으로 유지한다.

Shared-core 구조 PASS evidence는 `docs/validation/WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL.json`이다. `src/core`는 플랫폼 API를 직접 소유하지 않고 단일 `project.godot`과 모바일 layout adapter를 사용한다. 같은 focused contract가 hosted Windows 2025와 Ubuntu 24.04에서 PASS했다. 이 결과는 export/device 완료를 뜻하지 않는다.

## Task 2 승인 후 실행 대기

`GM-SPELL-WORKFLOW-UI-V2-01` Task 2는 `GR-SYNC-20260809-01-TASK2-USER-APPROVAL`로 승인됐다. 구현은 아직 `NOT_STARTED_ON_BRANCH`이며 현재 필요한 실행 권위는 `HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE`다. 이 세션에 HiGodot authoring channel이 없으므로 상태는 `AUTHORIZED_AWAITING_HIGODOT_CHANNEL`이고, 일반 GitHub source write로 persistent Godot product authoring을 우회하지 않는다.

## 구현 이후 acceptance 대기

| ID | 상태 |
|---|---|
| `THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9` | `SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE` |
| `WINDOWS_EXPORT_NOT_RUN` | `NOT_CLAIMED` |
| `ANDROID_EXPORT_NOT_RUN` | `NOT_CLAIMED` |
| `ANDROID_DEVICE_NOT_RUN` | `NOT_CLAIMED` |

승인된 UI v2 계획에서 root/end-to-end는 Task 9, render/CI evidence는 Task 10이다. 따라서 three-screen runtime은 Task 2 선행조건이 아니다.

## remaining broader project blockers

| ID | 상태 |
|---|---|
| `AUDIO_VAULT_PATH_UNVERIFIED` | `BLOCKED_NO_LOCAL_ACCESS` |
| `AUDIO_RIGHTS_UNVERIFIED` | `BLOCKING_FOR_AUDIO_INGESTION` |
| `VISUAL_AUDIO_COMPLETE_NOT_PROVEN` | `BLOCKING_FOR_FINAL_VISUAL_AUDIO_COMPLETION` |
| `LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS` | `DELIVERY_BLOCKING` |
| `GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS` | `DELIVERY_BLOCKING` |

## Asset Vault

```yaml
tracked_manifest: ASSET_MANIFEST.yml
current_main_readback: MISSING
interpretation: ASSET_MANIFEST_CURRENT_MAIN_MISSING_NO_PROMOTED_ASSET_CLAIM
```

## 현재 허용

```yaml
allowed_next_actions:
  - HIGODOT_PERSISTENT_TASK2_AUTHORING_WITH_REQUIRED_RECEIPT_GATE
  - HERA_ACCEPTANCE_QA_OBSERVABILITY_ONLY
  - CONTINUE_TASKS_2_9_THEN_RUN_THREE_SCREEN_ACCEPTANCE
  - VISUAL_AUDIO_REQUIREMENT_AND_LOCAL_ASSET_REVIEW
forbidden_next_actions:
  - PERSISTENT_GODOT_PRODUCT_AUTHORING_OUTSIDE_HIGODOT
  - LET_HERA_PERSISTENTLY_MUTATE_SOURCE
  - CLAIM_TASK2_IMPLEMENTED_BEFORE_HIGODOT_AUTHORING_AND_GREEN_VALIDATION
  - CLAIM_THREE_SCREEN_RUNTIME_PASS_BEFORE_TASKS_2_9_AND_RENDER_EVIDENCE
  - CLAIM_WINDOWS_OR_ANDROID_EXPORT_OR_DEVICE_PASS
  - CLAIM_VISUAL_AUDIO_COMPLETE
  - CLAIM_LOCAL_SYNC_OR_PROJECT_PLAY_COMPLETE
spell_workflow_task2_authorized: true
spell_workflow_task2_readiness: READY_FOR_HIGODOT_AUTHORING
spell_workflow_task2_execution_status: AUTHORIZED_AWAITING_HIGODOT_CHANNEL
```

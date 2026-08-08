# GRIMOIRE 현재 미확정·차단 게이트

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_version: "4.4"
contract_binding_decision_id: GM-CONTRACT-V4-4-BINDING-01
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
hera_exact_pair: PASS
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
gut_status: GUT_FORMALLY_ADOPTED
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_pr: 87
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
```

현재 main은 `project_main_authority`에 따라 GitHub default branch를 live readback한다. `gut_formal_adoption_main`과 `post_merge_canon_sync_merge`는 역사적 merge 증거다.

## 닫힌 Gate

```text
GUT_ADOPTION_SPEC_MERGED
GUT_GODOT_4_7_1_RUNTIME_COMPATIBILITY_PASS
GUT_ACTUAL_PRODUCT_TEST_CONSUMPTION_PASS
GUT_JUNIT_DISCOVERY_EXIT_PASS
GUT_PRODUCT_MUTATION_HASH_GATE_PASS
LEGACY_TO_GUT_COVERAGE_PARITY_PASS
HIGODOT_ZERO_PROTECTED_DIFF_GATE_PASS
HIGODOT_VENDOR_INTEGRITY_PASS_EXACT_TREE_IDENTITY
REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS
HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
```

Hera v1.0.0 exact pair evidence는 `docs/validation/HERA_V1_0_0_EXACT_PAIR.json`에 고정한다. upstream/project addon tree는 `6cb87ac8...`로 동일하고 hosted canary run `31254032278`에서 official CLI digest/version, localhost-only bind, wrong-token rejection, correct-token status, Godot 4.7.1, repository source-delta zero가 PASS했다. Hera는 `LIVE_QA_AND_OBSERVABILITY_ONLY`이며 persistent source mutation 권위가 아니다.

## broader project blockers

| ID | 상태 |
|---|---|
| `WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED` | `BLOCKING_FOR_PRODUCT_PLATFORM_COMPLETION` |
| `AUDIO_VAULT_PATH_UNVERIFIED` | `BLOCKED_NO_LOCAL_ACCESS` |
| `AUDIO_RIGHTS_UNVERIFIED` | `BLOCKING_FOR_AUDIO_INGESTION` |
| `VISUAL_AUDIO_COMPLETE_NOT_PROVEN` | `BLOCKING_FOR_VISUAL_AUDIO_COMPLETION` |
| `SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN` | `BLOCKING_FOR_VISUAL_COMPLETION` |
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
  - HERA_ACCEPTANCE_QA_OBSERVABILITY_ONLY
  - VISUAL_AUDIO_REQUIREMENT_AND_RUNTIME_REVIEW
  - WINDOWS_ANDROID_SHARED_CORE_PLANNING_AND_VALIDATION
  - HIGODOT_PERSISTENT_AUTHORING_WITH_REQUIRED_RECEIPT_GATE
forbidden_next_actions:
  - START_PR82_TASK2_BEFORE_ITS_APPLICABLE_PACKAGE_GATES_PASS
  - LET_HERA_PERSISTENTLY_MUTATE_SOURCE
  - CLAIM_VISUAL_AUDIO_COMPLETE
  - CLAIM_LOCAL_SYNC_OR_PROJECT_PLAY_COMPLETE
spell_workflow_task2_authorized: false
```

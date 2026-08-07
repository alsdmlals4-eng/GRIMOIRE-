# GRIMOIRE 현재 미확정·차단 게이트

```yaml
contract_version: "4.4"
contract_binding_decision_id: GM-CONTRACT-V4-4-BINDING-01
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
current_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
status: GUT_FORMAL_ADOPTION_COMPLETE_BROADER_PROJECT_BLOCKERS_REMAIN
formal_adoption_scope: MERGED_MAIN_VERIFIED
gut_implementation_pr: 85
gut_implementation_status: GUT_FORMALLY_ADOPTED
gut_exact_head: fc178bdc7a3e12faf4ae7ae78fd1f92dd2735849
gut_validation_run: 31227323973
authority_validation_run: 31227323956
spell_workflow_pr: 82
spell_workflow_status: PAUSED_AFTER_TASK1_GREEN
spell_workflow_task2_authorized: false
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
```

## 닫힌 GUT formal-adoption Gate

```text
GUT_ADOPTION_SPEC_MERGED
GUT_GODOT_4_7_1_RUNTIME_COMPATIBILITY_PASS
GUT_ACTUAL_PRODUCT_TEST_CONSUMPTION_PASS
GUT_PUBLIC_STANDARD_GITHUB_ACTIONS_PASS
GUT_JUNIT_DISCOVERY_EXIT_PASS
GUT_PRODUCT_MUTATION_HASH_GATE_PASS
LEGACY_TO_GUT_COVERAGE_PARITY_PASS
HIGODOT_ZERO_PROTECTED_DIFF_GATE_PASS
ROLE_SEPARATED_REVIEW_P0_P1_ZERO
PR85_MERGED_MAIN_VERIFIED
```

`GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01`에 따라 GUT full vendor-tree identity는 계속 false다. 이는 CLI/headless formal test authority의 승인된 critical-runtime equivalence와 구분한다.

## broader project blockers

| ID | 상태 | 다음 해소 조건 |
|---|---|---|
| `HIGODOT_VENDOR_TREE_MISMATCH_OFFICIAL_V3_1_2` | `BLOCKING_BEFORE_PERSISTENT_AUTHORING` | official v3.1.2 release archive와 project vendor audit 또는 승인된 교체 |
| `HERA_CLI_ADDON_PAIR_UNVERIFIED` | `BLOCKING_BEFORE_HERA_ACCEPTANCE_QA` | exact CLI/addon pair + localhost/token + zero-source-delta canary |
| `WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED` | `BLOCKING_FOR_PRODUCT_PLATFORM_COMPLETION` | 공용 core + Windows/Android export/smoke |
| `AUDIO_VAULT_PATH_UNVERIFIED` | `BLOCKED_NO_LOCAL_ACCESS` | shared audio vault inventory |
| `AUDIO_RIGHTS_UNVERIFIED` | `BLOCKING_FOR_AUDIO_INGESTION` | 선택 파일 권리·출처·hash |
| `VISUAL_AUDIO_COMPLETE_NOT_PROVEN` | `BLOCKING_FOR_VISUAL_AUDIO_COMPLETION` | visual/audio requirement 승인·promotion 또는 not-required 근거 |
| `SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_NOT_RUN` | `BLOCKING_FOR_VISUAL_COMPLETION` | 실제 3-screen Godot render/interaction |
| `CI_MUTABLE_ACTION_TAGS_OUTSIDE_PR85_SCOPE` | `BLOCKING_FOR_REPO_WIDE_SUPPLY_CHAIN_COMPLETE` | 남은 active workflows를 verified full SHA로 pin |
| `LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS` | `DELIVERY_BLOCKING` | 사용자 로컬 main Fetch/Pull SHA readback |
| `GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS` | `DELIVERY_BLOCKING` | merged local main clean import + Project Play smoke |

## Asset Vault

```yaml
tracked_manifest: ASSET_MANIFEST.yml
current_main_readback: MISSING
interpretation: ASSET_MANIFEST_CURRENT_MAIN_MISSING_NO_PROMOTED_ASSET_CLAIM
```

## 현재 허용

```yaml
allowed_next_actions:
  - HIGODOT_VENDOR_INTEGRITY_AUDIT
  - HERA_EXACT_PAIR_VERIFICATION
  - REPO_WIDE_ACTIONS_FULL_SHA_HARDENING
  - VISUAL_AUDIO_REQUIREMENT_AND_LOCAL_ASSET_REVIEW
  - WINDOWS_ANDROID_SHARED_CORE_PLANNING_AND_VALIDATION
forbidden_next_actions:
  - START_PR82_TASK2_BEFORE_ITS_APPLICABLE_PACKAGE_GATES_PASS
  - CLAIM_VISUAL_AUDIO_COMPLETE
  - CLAIM_LOCAL_SYNC_OR_PROJECT_PLAY_COMPLETE
spell_workflow_task2_authorized: false
```

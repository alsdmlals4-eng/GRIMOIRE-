# GRIMOIRE 현재 미확정·차단 게이트

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_version: "4.5"
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
contract_binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
external_process_policy: EXTERNAL_PROCESS_OVERLAY
current_state_sync: GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision_id: GM-SPELL-WORKFLOW-UI-V2-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_RECEIPT_HERA_REVIEW_PR
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
local_execution_policy: PROJECT_DEDICATED_LOCAL_EXECUTION_ENVIRONMENT_FIRST
fresh_shell_policy: ASSUME_PREVIOUS_POWERSHELL_CLOSED
missing_local_environment_policy: CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST
higodot_release: v3.1.4
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_integrity_status: HIGODOT_VENDOR_INTEGRITY_PASS_EXACT_TREE_IDENTITY
higodot_tracked_sync: GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION
higodot_sheet_sync: SHEET_WRITE_READBACK_PASS
higodot_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_live_session: task8-spell-use-screen-v2@3cfa
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
gut_implementation_status: GUT_FORMALLY_ADOPTED
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
formal_adoption_scope: MERGED_MAIN_VERIFIED
gut_ci: GUT_PUBLIC_STANDARD_GITHUB_ACTIONS_PASS
role_separated_review: ROLE_SEPARATED_REVIEW_P0_P1_ZERO
gut_implementation_pr: PR85_MERGED_MAIN_VERIFIED
repo_wide_actions_supply_chain: REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
hera_task8_acceptance: PENDING_HERA_SOURCE_DELTA_NONE
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
```

## v4.5 binding gate

```yaml
v4_5_binding: USER_APPROVED_CURRENT_BINDING
binding_decision: GM-CONTRACT-V4-5-BINDING-01
binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md
execution_request_state: USER_EXPLICIT_EXECUTION_REQUEST_PRESENT
base_current_main_observed: 6d2feba2bc49fda2d8d273248b55087853615d5d
base_project_pin: v9.4.3
base_pin_update: NOT_APPROVED_NOT_PERFORMED
base_source_snapshot_7ce3fb64_role: HISTORICAL_OBSERVATION_ONLY
silent_rebinding: NOT_APPLICABLE_USER_EXPLICITLY_APPROVED
sheet_sync: SHEET_WRITE_READBACK_PASS
current_binding_status: ACTIVE_NO_REBIND_REQUIRED
```

v4.5 r2는 현재 계약이며 Base current SHA는 영구 authority/pin이 아니다. Base `6d2feba2...`의 dedicated-local-environment invariant를 현재 project consumer로 사용한다.

## 닫힌 Spell Workflow implementation gates

Task 2와 Tasks 3–7은 unresolved가 아니다.

```yaml
task2:
  merge: 975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0
  status: TASK2_MERGED_MAIN_VERIFIED
  authoring_receipt_status: TASK2_HIGODOT_RECEIPT_READBACK_PASS
  checkpoint_role: HISTORICAL_TASK2_TO_TASK3_ENTRY_PROVENANCE_NOT_CURRENT_NEXT_TASK
task3:
  pr: 104
  merge: 3a79c8d1aab67813ef6d1c6662f1e460a711613c
  status: MERGED_MAIN_VERIFIED
task4:
  pr: 105
  merge: 97942d0be7404d52316dec0143041e2971c365f1
  status: MERGED_MAIN_VERIFIED
task5:
  pr: 106
  merge: 275ba48eb9c07ce24d4b17b2c57de66c98923e1a
  status: MERGED_MAIN_VERIFIED
task6:
  pr: 108
  merge: 4a9daf0ed8de7bb39173a71e6ada9324d5a462b7
  status: MERGED_MAIN_VERIFIED
task7:
  pr: 110
  merge: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
  status: TASK7_MERGED_MAIN_VERIFIED
```

## Historical v4.4 / HiGodot v3.1.3 provenance contract

```yaml
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
historical_contract_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
historical_contract_disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
higodot_v3_1_3_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
higodot_v3_1_3_status: HISTORICAL_PASS_EXACT_TREE_IDENTITY_AND_LIVE_READBACK
```

Historical Sync19/validation documents may correctly say that the v3.1.4 live handshake was pending at that time. Sync20 does not rewrite those historical receipts.

## 현재 Task8 gate

The user-supplied current local execution observed exact-project session `task8-spell-use-screen-v2@3cfa`, Godot 4.7.1, HiGodot server/plugin 3.1.4, readiness `ready`. The tool did not surface a separate `expected_version` field; no such equality is claimed.

```yaml
next_task: TASK8_RECEIPT_HERA_REVIEW_PR
scope:
  - explicit target selection UI
  - prepared-spell summary
  - supplied final expected-result preview
  - two-stage user confirmation boundary
  - stale/invalid target visual fail-closed
  - actual cancel intent
  - deterministic focus/text semantics
  - consume existing Task 5 Stage 3 transaction authority
must_not:
  - duplicate target/use authority
  - auto-select target as final behavior
  - spend Mana before explicit confirmation
  - let Hera persistently mutate source
  - upgrade human/device/performance evidence without new runs
tracked_higodot_v3_1_4: PASS_EXACT_TREE_IDENTITY
live_higodot_v3_1_4: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
expected_version_field: NOT_SURFACED_DO_NOT_CLAIM
focused_local_gut: 15_TESTS_90_ASSERTIONS_0_FAILURES
predecessor_regression: 42_SUITES_1588_ASSERTIONS_0_FAILURES
persistent_godot_authoring: HIGODOT_ONLY_WITH_FRESH_PROTECTED_DELTA_RECEIPT
formal_test_authority: GUT_9_7_1
live_qa: HERA_LIVE_QA_AND_OBSERVABILITY_ONLY
hera_source_delta_required: NONE
merge_state: UNMERGED_LOCAL_WORK
```

The former live-handshake blocker is closed for the observed session. The new actual merge blockers are receipt/readback, Hera source-delta acceptance, independent/adversarial review, exact-head CI, merge, and merged-main readback.

## Dedicated local execution gate

```text
ASSUME_PREVIOUS_POWERSHELL_CLOSED
→ new PowerShell
→ verify/create-or-repair dedicated self-contained GRIMOIRE Godot
→ exact requested project/worktree
→ project-scoped HiGodot profile/server/ports
→ project-scoped CODEX_HOME
→ Hera exact project-approved pair/profile when live QA is required
→ Codex exact worktree
→ fresh exact-project HiGodot receipt
```

The launcher is one complete copy/paste block and appears before the Codex prompt. It fails closed on wrong project/worktree, other-project editor/HiGodot/Hera profile or port, CODEX_HOME leakage, ambiguous duplicate process, quoting problems, and process/port-not-readiness. It does not reset/restore/clean/stage/rewrite user work, kill unrelated processes, or front-load broad Git diff/LF-CRLF noise.

If this dedicated environment is missing or incomplete, `CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST` precedes product work.

## Hera acceptance gate

```yaml
release: v1.0.0
authority: LIVE_QA_AND_OBSERVABILITY_ONLY
persistent_source_mutation: FORBIDDEN
shared_token_plaintext_in_repo_prompt_log_evidence: FORBIDDEN
task8_acceptance:
  pre_source_snapshot: REQUIRED
  live_qa: REQUIRED
  post_source_snapshot: REQUIRED
  source_delta: NONE_REQUIRED
```

A Hera-discovered product defect returns to HiGodot persistent authoring, then GUT/regression and Hera are rerun. Hera is not a write fallback.

## Task 9 precondition findings

1. **APPROVED_DEVICE_MATRIX_PROPAGATION** — `16:9`, `18:9`, `19.5:9`, `20:9`, cutout/safe-area, foldable/tablet 분류를 Task 9 acceptance에 명시한다.
2. **GODOT_STRETCH_ASPECT_EXPLICIT_VERIFICATION** — multiple-aspect 처리 설정을 실제 project setting에서 확인한다.

## 구현 이후 acceptance 대기

| ID | 상태 |
|---|---|
| `THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9` | Task8 unmerged; Tasks 8–9 + Task 10 evidence remaining |
| `TASK8_PROTECTED_DELTA_HIGODOT_RECEIPT_PENDING` | `BLOCKING_FOR_TASK8_MERGE` |
| `TASK8_HERA_ACCEPTANCE_PENDING` | `BLOCKING_FOR_TASK8_MERGE` |
| `TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING` | `BLOCKING_FOR_TASK8_MAIN` |
| `WINDOWS_EXPORT_NOT_RUN` | `NOT_CLAIMED` |
| `ANDROID_EXPORT_NOT_RUN` | `NOT_CLAIMED` |
| `ANDROID_DEVICE_NOT_RUN` | `NOT_CLAIMED` |
| `HUMAN_NOT_RUN` | `NOT_CLAIMED` |
| `PERFORMANCE_NOT_RUN` | `NOT_CLAIMED` |
| `FULL_VERTICAL_SLICE_NOT_RUN` | `NOT_CLAIMED` |

## 현재 provenance / delivery limits

| ID | 상태 |
|---|---|
| `HIGODOT_EXPECTED_VERSION_FIELD_NOT_SURFACED` | `EVIDENCE_LIMIT_NOT_LIVE_READY_BLOCKER` |
| `HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT` | `PROVENANCE_LIMIT` |
| `AUDIO_VAULT_PATH_UNVERIFIED` | `BLOCKED_UNVERIFIED` |
| `AUDIO_RIGHTS_UNVERIFIED` | `BLOCKING_FOR_AUDIO_INGESTION` |
| `VISUAL_AUDIO_COMPLETE_NOT_PROVEN` | `BLOCKING_FOR_FINAL_VISUAL_AUDIO_COMPLETION` |

## 현재 허용

```yaml
allowed_next_actions:
  - FRESH_DEDICATED_LOCAL_ENVIRONMENT_BOOTSTRAP
  - FRESH_EXACT_PROJECT_HIGODOT_RECEIPT
  - TASK8_PROTECTED_DELTA_HIGODOT_RECEIPT_READBACK
  - GUT_DETERMINISTIC_TASK8_REGRESSION_AS_REQUIRED
  - HERA_TASK8_ACCEPTANCE_QA_OBSERVABILITY_ONLY_WITH_SOURCE_DELTA_NONE
  - INDEPENDENT_ADVERSARIAL_REVIEW
  - TASK8_EXACT_HEAD_PR_CI_MERGE
  - PROPAGATE_APPROVED_DEVICE_MATRIX_INTO_TASK9_ACCEPTANCE
  - VERIFY_GODOT_MULTIPLE_ASPECT_POLICY_BEFORE_TASK9
forbidden_next_actions:
  - PERSISTENT_GODOT_PRODUCT_AUTHORING_OUTSIDE_HIGODOT
  - LET_HERA_PERSISTENTLY_MUTATE_SOURCE
  - STORE_HERA_SHARED_TOKEN_PLAINTEXT
  - CLAIM_TASK8_MERGED_OR_COMPLETE_BEFORE_MERGED_MAIN_READBACK
  - CLAIM_THREE_SCREEN_RUNTIME_PASS_BEFORE_TASKS8_9_AND_TASK10_EVIDENCE
  - CLAIM_WINDOWS_OR_ANDROID_EXPORT_OR_DEVICE_PASS
  - CLAIM_HUMAN_OR_PLAYER_EXPERIENCE_PASS
  - CLAIM_VISUAL_AUDIO_COMPLETE
```

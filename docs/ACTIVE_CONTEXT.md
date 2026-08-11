# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
contract_binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
external_process_policy: EXTERNAL_PROCESS_OVERLAY
base_current_main_observed: 6d2feba2bc49fda2d8d273248b55087853615d5d
base_project_pin: v9.4.3
base_pin_update: NOT_APPROVED_NOT_PERFORMED
current_state_sync: GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_RECEIPT_HERA_REVIEW_PR
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
local_execution_policy: PROJECT_DEDICATED_LOCAL_EXECUTION_ENVIRONMENT_FIRST
fresh_shell_policy: ASSUME_PREVIOUS_POWERSHELL_CLOSED
missing_local_environment_policy: CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
higodot_release: v3.1.4
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_tracked_sync: GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION
higodot_tool_state_main: 257a0dba33f8288d24b1cd291bb407f4505224b4
higodot_tool_state_sheet_sync: SHEET_WRITE_READBACK_PASS
higodot_tracked_plugin_subtree: 69010571e11123dfc4e09483f80cb9e6ca93511a
higodot_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
higodot_direct_tool_state_receipt: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
gut_formal_adoption: GUT_FORMALLY_ADOPTED
gut_release: v9.7.1
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
hera_task8_acceptance: REQUIRED_PENDING_HERA_SOURCE_DELTA_NONE
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
local_execution_route: USER_POWERSHELL_PLUS_PROJECT_CODEX_AVAILABLE
chatgpt_direct_local_access: NONE
```

## v4.5 r2 operating boundary

v4.5 r2는 `THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON`을 적용한다. Base source snapshot `7ce3fb64...`는 `HISTORICAL_OBSERVATION_ONLY`; 이 work unit의 latest Base merged-main observation은 `6d2feba2...`이고 영구 project pin이 아니다. Base v9.4.3 project pin은 변경하지 않았다. 매 작업 시작 시 Base `main`과 Registry/관련 owner를 다시 읽는다.

```yaml
execution_request_state: USER_EXPLICIT_EXECUTION_REQUEST_PRESENT
continuous_work: CONTINUOUS_WORK_ACTIVE
merge_authority: APPROVED_ITEM_INHERITS_MERGE_AUTHORITY
external_process_overlay: EXTERNAL_PROCESS_OVERLAY
```

Superpowers 등 외부 process framework는 execution-only overlay이며 프로젝트 또는 Base canon을 소유하지 않는다.

## Dedicated local execution environment

Base main `6d2feba2...`의 shared invariant를 이 프로젝트에 다음과 같이 consume한다.

```text
new PowerShell for every local work session
→ verify/create-or-repair dedicated self-contained GRIMOIRE Godot
→ exact requested GRIMOIRE project/worktree only
→ project-scoped HiGodot profile/server/ports
→ project-scoped CODEX_HOME
→ Hera exact project-approved pair/profile when live QA is required
→ Codex exact worktree
→ fresh exact-project HiGodot session/version/readiness receipt inside Codex
→ persistent authoring only through HiGodot
→ GUT deterministic verification
→ Hera LIVE_QA_AND_OBSERVABILITY_ONLY
→ HERA_SOURCE_DELTA: NONE
```

`ASSUME_PREVIOUS_POWERSHELL_CLOSED`가 기본이다. 사용자의 이전 shell 환경 변수·현재 디렉터리·process handle을 재사용 전제로 삼지 않는다. dedicated environment가 없거나 identity가 불명확하면 `CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST`로 제품 작업보다 먼저 복구한다.

사용자에게 local execution을 요청할 때는 항상 **새 PowerShell → 한 덩어리 bootstrap block → Codex가 열린 뒤 task prompt** 순서다. launcher는 wrong worktree/editor/profile/port/CODEX_HOME/Hera-profile collision을 fail-closed로 검사하되 broad Git diff, repository-wide scan, 이미 분류된 LF/CRLF/stat noise를 startup 전에 쏟지 않는다. `reset`, `restore`, `clean`, stage, rewrite, unrelated process kill은 bootstrap 권한이 아니다.

Hera shared token 원문은 저장소·prompt·log·evidence에 기록하지 않는다. Hera는 persistent source writer가 아니며 결함 수정은 HiGodot authoring으로 돌아간다.

## Current Spell Workflow state

`GM-SPELL-WORKFLOW-UI-V2-01`은 `글자 그리기 → 회로 배치 → 주문 사용`과 Stage 경계를 유지한다.

```yaml
task3:
  pr: 104
  merge: 3a79c8d1aab67813ef6d1c6662f1e460a711613c
  scope: IMMUTABLE_PREPARED_SPELL_AND_EXACTLY_ONCE_INVENTORY
task4:
  pr: 105
  merge: 97942d0be7404d52316dec0143041e2971c365f1
  scope: STAGE2_ATOMIC_GLYPH_PREPARATION
task5:
  pr: 106
  merge: 275ba48eb9c07ce24d4b17b2c57de66c98923e1a
  scope: STAGE3_TARGET_USE_ATOMIC_TRANSACTION
task6:
  pr: 108
  merge: 4a9daf0ed8de7bb39173a71e6ada9324d5a462b7
  scope: GLYPH_DRAWING_WORKFLOW_SCREEN
task7:
  pr: 110
  merge: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
  scope: CIRCUIT_PLACEMENT_WORKFLOW_SCREEN
predecessor_status: TASK7_MERGED_MAIN_VERIFIED
current_status: TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
next_task: TASK8_RECEIPT_HERA_REVIEW_PR
```

Task8 local V2 evidence from the user-supplied Codex execution proves a live exact-project HiGodot session `task8-spell-use-screen-v2@3cfa`, Godot 4.7.1, server/plugin 3.1.4, readiness `ready`. The tool did not surface a separate `expected_version` field, so no equality claim is invented.

The same local execution reported focused Task8 GUT `15 tests / 90 assertions / 0 failures` and authoritative predecessor regression `42 suites / 1,588 assertions / 0 failures`. Actual target control, caller-supplied prepared-spell summary, invalid/stale visual fail-closed behavior, CancelButton event path, deterministic focus hierarchy, and the already-approved two-stage opaque-ID confirmation are locally GREEN.

This evidence is **not merged-main product evidence**. Remaining gates are protected-delta HiGodot receipt/readback, Hera acceptance with source-delta NONE, independent/adversarial review, exact-head PR CI, merge, and merged-main readback. Mana/result atomicity and transaction authority remain Task5/Stage3-owned.

Task9 retains the Mobile landscape responsive/device matrix (16:9, 18:9, 19.5:9, 20:9, cutout/safe-area, foldable/tablet). Task8 does not pull that full matrix forward.

## Tool authority

```yaml
higodot:
  release: v3.1.4
  authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
  tracked_sync: GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION
  observed_tool_state_main: 257a0dba33f8288d24b1cd291bb407f4505224b4
  tracked_plugin_subtree: 69010571e11123dfc4e09483f80cb9e6ca93511a
  vendor_integrity: PASS_EXACT_TREE_IDENTITY
  live_session: task8-spell-use-screen-v2@3cfa
  live_project_match: PASS_FOR_OBSERVED_SESSION
  live_server_plugin: V3_1_4_V3_1_4
  live_readiness: READY
  expected_version_field: NOT_SURFACED_DO_NOT_CLAIM
  direct_local_upgrade_receipt: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
  historical_v3_1_3_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
  historical_v3_1_3_tree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
gut:
  release: v9.7.1
  authority: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY
  adoption: GUT_FORMALLY_ADOPTED
hera:
  release: v1.0.0
  authority: LIVE_QA_AND_OBSERVABILITY_ONLY
  status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
  persistent_source_mutation: FORBIDDEN
  task8_acceptance: PENDING
  task8_required_source_delta: NONE
```

## Current Task8 merge gate

```text
fresh dedicated local environment bootstrap
→ fresh exact-project HiGodot receipt
→ fresh protected-delta HiGodot authoring receipt/readback
→ focused/regression recheck if receipt process changes the tree
→ pre-Hera tracked-source snapshot
→ Hera live QA/observability only
→ post-Hera tracked-source snapshot
→ HERA_SOURCE_DELTA: NONE
→ independent/adversarial review
→ exact-head PR CI
→ merge
→ merged-main readback
→ same Decision ID GitHub + Sheet product sync
```

## Historical Task 2 / Task 3 / v4.4 evidence

```yaml
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
historical_contract_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
historical_contract_disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
higodot_v3_1_3_status: HISTORICAL_PASS_EXACT_TREE_IDENTITY_AND_LIVE_READBACK
```

```text
GR-SYNC-20260809-01-TASK2-USER-APPROVAL
GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN
GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON
GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY
975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0
```

v4.4, v3.1.3, Task2/Task3 진입 자료는 provenance로 유효하지만 current contract/tool/next-task 권위를 소유하지 않는다.

## Preserved validation boundaries

```text
TASK8_PROTECTED_DELTA_HIGODOT_RECEIPT_PENDING
TASK8_HERA_ACCEPTANCE_PENDING
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
HIGODOT_EXPECTED_VERSION_FIELD_NOT_SURFACED
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
```

자동·Editor·CI·GUT·Hera 증거로 사람/기기/성능/전체 Vertical Slice 증거를 승격하지 않는다.

## Sync21 continuation overlay — current handoff authority

This section is the current continuation overlay for Task8 resume and supersedes older pending-receipt wording in this file **only for resume routing**. Historical Sync20/Task8 markers remain in place for compatibility consumers.

```yaml
continuation_sync: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
state_observed_at_project_main: d1e4d747ee1f28b8a29adcd25726fd975a81d168
base_main_observed_for_handoff: 1d6cc79ae95ffb67ba4de618f010a6540fc6e02c
product_status: TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED
product_branch_local: feat/task8-spell-use-screen-v2
product_head_local: 8c611f601aa98397ed1558e92ab207e0e8347a9b
product_remote_branch_at_handoff: NOT_PRESENT
product_pr: NONE
resume_gate: TASK8_PR_PREP_REVERIFY_PENDING
current_higodot_session: HIGODOT_CURRENT_SESSION_REVALIDATION_REQUIRED
remote_authority_route: REMOTE_AUTHORITY_RECEIPT
local_executor_route: LOCAL_EXECUTION_RECEIPT
codex_capability_failure: EXECUTOR_CAPABILITY_BLOCKER
codex_remote_retry: DO_NOT_RETRY_BLOCKED_REMOTE_CHECK_IN_CODEX
remote_write_precondition: FRESH_GITHUB_CONNECTOR_READBACK_REQUIRED_BEFORE_REMOTE_WRITE
codex_session_reuse: CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION
base_proposal_state: BASE_PROPOSAL_STATE_PENDING_CONCURRENT_RACE_CHECK
handoff_product_git_write: NO_STAGE_COMMIT_PUSH_DURING_HANDOFF
```

Observed acceptance checkpoint before the later PR-prep interruption: exact session `task8-spell-use-screen-v2@b680`, focused GUT `15 tests / 90 assertions / 0 failures`, predecessor `42 suites / 1,588 assertions / 0 failures`, and `HERA_SOURCE_DELTA_NONE_OBSERVED`. `HISTORICAL_EDIT_OPERATION_RECEIPT_NOT_RETROACTIVELY_PROVABLE` remains an evidence ceiling rather than being upgraded.

The later Codex PR-prep attempt produced `CODEX_FETCH_HEAD_PERMISSION_DENIED` and `CODEX_GITHUB_NETWORK_BLOCKED`; it did not edit source or stage/commit/push. Resume therefore revalidates local HiGodot/test readiness but does not throw away the accepted prior checkpoint.

Learning application lives at `docs/planning/sync/GR-SYNC-20260812-21-TASK8-HANDOFF-BCP.md`. Task8 remains `TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING`; the compatibility locator `TASK8_RECEIPT_HERA_REVIEW_PR` remains searchable until its older consumers are deliberately migrated.

## Sync21 final closure overlay

This final overlay supersedes only the pending Base-proposal fields above. It does not promote Task8 product state.

```yaml
state_observed_at_project_main: d277a2f5cd4a57947d176e3c49ae7f8f6db97230
base_main_after_proposal_merge: 449b83c6f1afdf191327a52a8e71d11b4fba7eb3
base_proposal_id: BCP-2026-024-execution-sandbox-authority-split-recovery
base_proposal_pr: https://github.com/alsdmlals4-eng/Base/pull/297
base_proposal_state: BASE_PROPOSAL_STORAGE_MERGED_SUBMITTED
base_implementation_authority: BASE_IMPLEMENTATION_AUTHORITY_NOT_GRANTED_IN_THIS_STAGE
learning_closure: LEARNING_CLOSURE_OPEN_COUNT = 0
product_status: TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED
resume_gate: TASK8_PR_PREP_REVERIFY_PENDING
```

Project application is merged in GRIMOIRE PR #134 (`d277a2f5cd4a57947d176e3c49ae7f8f6db97230`). Base proposal-only storage is merged in Base PR #297 (`449b83c6f1afdf191327a52a8e71d11b4fba7eb3`) with proposal status `SUBMITTED`; this is not Base implementation approval. Base active implementation remains `NOT_STARTED_IN_THIS_STAGE` / `SEPARATE_FOLLOWUP_STAGE`.

## Contract boundary

저장소 current canon은 v4.5 r2 / `GM-CONTRACT-V4-5-BINDING-01`이다. v4.4 / `GM-CONTRACT-V4-4-BINDING-01`과 HiGodot v3.1.3은 historical provenance로 보존한다. Sync20은 운영 실행환경 consumer이며 제품 규칙을 변경하지 않는다. Sync21은 Task8 product를 변경하지 않는 continuation/handoff overlay다.

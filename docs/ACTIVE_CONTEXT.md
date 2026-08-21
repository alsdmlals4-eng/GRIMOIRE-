# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
contract_binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync: GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC
dedicated_local_environment_predecessor_sync: GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
task8_continuation_sync: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
external_process_policy: EXTERNAL_PROCESS_OVERLAY
base_live_observation_sync34: aa9a0d823db9c7373751d35d341489f64c62f7b9
base_project_pin: v9.4.3
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
spell_workflow_status: TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
compatibility_next_gate: TASK8_RECEIPT_HERA_REVIEW_PR
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
parallel_open_pr: PR151_DO_NOT_TOUCH
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
higodot_release: v3.1.4
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_tracked_sync: GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION
higodot_historical_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
higodot_direct_tool_state_receipt: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
gut_formal_adoption: GUT_FORMALLY_ADOPTED
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
```

## 현재 제품 현실

Frostbloom 00~46분 첫 세션 기획은 완료됐지만 제품 구현은 `PARTIAL_FOUNDATION`이다. 현재 `project.godot` 기본 실행점은 `res://src/ui/star_circuit_harness.tscn`이며 역할은 `DEVELOPMENT_RUNTIME_POC_ENTRY`다. 이것을 완성형 첫 세션 Product Root로 승격하지 않는다.

Star Circuit Runtime component는 이미 병합된 자동 증거를 보존한다.

```yaml
runtime_sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
runtime_main_authority: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
product_project: CREATED
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
```

위 component PASS와 전체 제품 상태를 혼동하지 않는다. `FULL_VERTICAL_SLICE_NOT_RUN`, `HUMAN_NOT_RUN`, `DEVICE_NOT_RUN`, `PERFORMANCE_NOT_RUN`은 그대로다. 모든 수치·시간·밸런스는 Human 검증 전 `PLAYTEST_TUNING_REQUIRED`다.

## Workspace authority

```text
Notion
→ 사람용 Project Home / Work / Core System / Visual / Asset / Flow

Repository
→ Markdown / JSON / game data / code / Scene / Resource / Test / runtime evidence

Google Sheets
→ MIGRATION_ONLY_UNTIL_REMOVAL
→ NO_NEW_CANON_WRITES
→ BLOCKED_UNVERIFIED_UNIQUE_MATERIAL 상태에서 역사 자료 보존
```

신규 승인/상태는 Sheet에 쓰지 않는다. 과거 Sheet write/readback은 provenance로 남긴다. 제거 전 unique-material audit에서 `UNIQUE / DUPLICATE / OBSOLETE`를 분류하고, 고유 의미를 Notion 또는 repository에 흡수한 뒤 destination readback과 active consumer 0을 확인해야 한다.

## Spell Workflow

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
  status: TASK7_MERGED_MAIN_VERIFIED
```

Task8은 기존 Task5 Stage3 authority의 thin UI consumer다. 새 Mana/inventory/result/rollback/transaction authority를 만들지 않는다.

다음 문자열은 기존 소비자와 역사 추적을 위해 유지한다.

```text
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
```

하지만 현재 실제 continuation state는 다음이다.

```yaml
product_status: TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED
product_branch_local_historical: feat/task8-spell-use-screen-v2
product_head_local_historical: 8c611f601aa98397ed1558e92ab207e0e8347a9b
remote_product_authority: NOT_CURRENTLY_VERIFIED
resume_gate: TASK8_PR_PREP_REVERIFY_PENDING
```

역사 acceptance checkpoint는 `15 tests / 90 assertions / 0 failures`, predecessor `42 suites / 1,588 assertions / 0 failures`, `HERA_SOURCE_DELTA_NONE_OBSERVED`였다. 현재 원격 branch/PR 또는 merged-main 증거로 확대하지 않는다.

## Sync21 continuation / executor boundary

```text
GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION
FRESH_POWERSHELL_REQUIRED_WHEN_SESSION_RECREATION_OR_CAPABILITY_BOUNDARY
REMOTE_AUTHORITY_RECEIPT
LOCAL_EXECUTION_RECEIPT
EXECUTOR_CAPABILITY_BLOCKER
DO_NOT_RETRY_BLOCKED_REMOTE_CHECK_IN_CODEX
FRESH_GITHUB_CONNECTOR_READBACK_REQUIRED_BEFORE_REMOTE_WRITE
```

Learning closure는 닫혀 있다.

```yaml
base_proposal_id: BCP-2026-024-execution-sandbox-authority-split-recovery
base_proposal_pr: https://github.com/alsdmlals4-eng/Base/pull/297
base_proposal_merge: 449b83c6f1afdf191327a52a8e71d11b4fba7eb3
base_proposal_state: BASE_PROPOSAL_STORAGE_MERGED_SUBMITTED
base_implementation_authority: BASE_IMPLEMENTATION_AUTHORITY_NOT_GRANTED_IN_THIS_STAGE
learning_closure: LEARNING_CLOSURE_OPEN_COUNT = 0
```

현재 exact dedicated Codex가 살아 있고 필요한 단계가 그 capability 안이면 재사용 가능하다. 새 세션, environment/session 재생성, identity 불명확, 또는 capability boundary를 넘으면 fresh PowerShell bootstrap을 사용한다. remote authority readback은 local worktree/HEAD/HiGodot/GUT evidence를 대체하지 않는다.

## Tool authority

- HiGodot/Godot AI `v3.1.4`: `SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY`; tracked subtree `69010571e11123dfc4e09483f80cb9e6ca93511a` exact identity PASS.
- historical Sync20 observation: `GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT`, session `task8-spell-use-screen-v2@3cfa`, `LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED`.
- 별도 expected version field는 surfaced되지 않았으므로 `NOT_SURFACED_DO_NOT_CLAIM`.
- GUT `v9.7.1`: `DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY`.
- Hera `v1.0.0`: `LIVE_QA_AND_OBSERVABILITY_ONLY`; persistent source mutation forbidden.

## Historical v4.4 / GUT adoption provenance

`GM-CONTRACT-V4-4-BINDING-01`은 현재 계약이 아니다. 상세 병합 SHA는 역사 machine/current-owner가 보존한다.

```yaml
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
```

## Parallel work protection

PR #151 `visual/component-sheets-semantic-ui-execution`은 진행 중 Draft다. 현재 교정과 Task8 recovery가 이 PR의 파일을 수정·재base·merge하거나 완료로 주장하지 않는다: `PR151_DO_NOT_TOUCH`.

## 현재 다음 순서

```text
1. Sync34 current-authority correction exact-head GREEN / merge / Notion readback
2. TASK8_PR_PREP_REVERIFY_PENDING — remote/local authority를 fresh하게 재확인
3. Task8 exact-head PR/merge 가능 상태 복구
4. Task9 Root + responsive/E2E integration
5. 대표 00~10분 Visualized Slice Human QA
6. 10~23 → 46분으로 증거 확장
```

## 완료로 주장하지 않는 항목

```text
TASK8_PR_PREP_REVERIFY_PENDING
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
HIGODOT_EXPECTED_VERSION_FIELD_NOT_SURFACED
HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
```

# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_binding_decision: GM-CONTRACT-V4-8-BINDING-01
contract_binding_sync: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
contract_binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
historical_contract_binding: GM-CONTRACT-V4-5-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync_predecessor: GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC
current_authority_sync_candidate: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
task8_continuation_sync: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
task8_current_reverify: docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
base_project_pin: v9.4.3
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_product_main_for_task7_lineage: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
next_product_gate: TASK8_PR_PREP_REVERIFY_PENDING
task8_recovery_subgate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
parallel_open_pr: NONE
current_task_pr: PR158_V4_8_AUTHORITY_SYNC_DRAFT
component_sheet_pr151: MERGED_MAIN_VERIFIED
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
higodot_release: v3.1.4
higodot_historical_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
gut_formal_adoption: GUT_FORMALLY_ADOPTED
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
local_sync: BLOCKED_NO_LOCAL_ACCESS
godot_run: BLOCKED_NO_LOCAL_ACCESS
task8_local_delta_existence: BLOCKED_UNVERIFIED
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
```

## 현재 제품 현실

Frostbloom 00~46분 첫 세션 기획은 완료됐지만 제품 구현은 `PARTIAL_FOUNDATION`이다. 현재 `project.godot` 기본 실행점은 `res://src/ui/star_circuit_harness.tscn`이며 역할은 `DEVELOPMENT_RUNTIME_POC_ENTRY`다. 완성형 첫 세션 Product Root로 승격하지 않는다.

Star Circuit Runtime과 Component Sheets A–D에는 자동화/렌더 evidence가 있다. 이 component evidence와 전체 제품 상태를 혼동하지 않는다. `FULL_VERTICAL_SLICE_NOT_RUN`, `HUMAN_NOT_RUN`, `DEVICE_NOT_RUN`, `PERFORMANCE_NOT_RUN`은 유지한다.

## Workspace authority

```text
Notion
→ 사람용 Project Home / Work / Core System / Visual / Asset / Flow

Repository
→ Markdown / JSON / game data / code / Scene / Resource / Test / runtime evidence

Google Sheets
→ MIGRATION_ONLY_UNTIL_REMOVAL
→ NO_NEW_CANON_WRITES
```

신규 승인/상태는 Sheet에 쓰지 않는다. 과거 Sheet write/readback은 provenance로 남긴다.

## Spell Workflow

```yaml
task3:
  pr: 104
  scope: IMMUTABLE_PREPARED_SPELL_AND_EXACTLY_ONCE_INVENTORY
task4:
  pr: 105
  scope: STAGE2_ATOMIC_GLYPH_PREPARATION
task5:
  pr: 106
  scope: STAGE3_TARGET_USE_ATOMIC_TRANSACTION
task6:
  pr: 108
  scope: GLYPH_DRAWING_WORKFLOW_SCREEN
task7:
  pr: 110
  merge: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
  status: TASK7_MERGED_MAIN_VERIFIED
```

Task8은 기존 Task5 Stage3 authority의 thin UI consumer다. 새 Mana/inventory/result/rollback/transaction authority를 만들지 않는다.

역사 compatibility locator:

```text
GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
TASK7_MERGED_MAIN_VERIFIED
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
```

현재 continuation state:

```yaml
product_status_historical: TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED
product_branch_local_historical: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
historical_product_state: UNMERGED_LOCAL_WORKTREE_DELTA
resume_gate: TASK8_PR_PREP_REVERIFY_PENDING
current_execution_subgate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
```

`8c611f...`는 당시 local Git baseline이지 Task8 product commit이 아니다. 과거 `15 tests / 90 assertions / 0 failures`, predecessor `42 suites / 1,588 assertions / 0 failures`, `HERA_SOURCE_DELTA_NONE_OBSERVED`는 그때 관찰한 uncommitted worktree의 역사 evidence다.

현재 원격에는 Task8 product branch/PR/commit이 없고 GitHub history만으로 제품 delta를 복구할 수 없다.

현재 ChatGPT 세션에는 사용자 Windows checkout/Godot local executor가 없다.

```text
LOCAL_SYNC: BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN: BLOCKED_NO_LOCAL_ACCESS
TASK8_LOCAL_DELTA_EXISTENCE: BLOCKED_UNVERIFIED
```

따라서 Task8 local delta가 남아 있다고도 소실됐다고도 주장하지 않는다. local executor가 사용 가능해지면 `tools/task8_local_recovery_probe.ps1`로 read-only 검사한다. delta가 있으면 `reset/restore/clean` 없이 보존 후 fresh HiGodot/GUT/Hera/diff/adversarial revalidation을 수행한다. 없으면 승인된 Task8 plan을 HiGodot TDD로 재작성한다.

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

Remote authority readback은 local worktree/HEAD/HiGodot evidence를 대체하지 않는다. 이미 검증된 exact dedicated Codex가 살아 있고 필요한 작업이 그 capability 안이면 Codex-only continuation에 재사용할 수 있다. 세션 재생성·identity 불명확·capability boundary를 넘으면 fresh PowerShell bootstrap을 사용한다.

## Base proposal / learning closure provenance

```yaml
base_proposal_id: BCP-2026-024-execution-sandbox-authority-split-recovery
base_proposal_pr: https://github.com/alsdmlals4-eng/Base/pull/297
base_proposal_merge: 449b83c6f1afdf191327a52a8e71d11b4fba7eb3
base_proposal_state: BASE_PROPOSAL_STORAGE_MERGED_SUBMITTED
base_implementation_authority: BASE_IMPLEMENTATION_AUTHORITY_NOT_GRANTED_IN_THIS_STAGE
learning_closure: LEARNING_CLOSURE_OPEN_COUNT = 0
```

이 값들은 Sync21 handoff가 닫은 역사 provenance이며 v4.8 전환이 새로운 Base implementation authority를 부여하지 않는다.

## Tool authority

- HiGodot/Godot AI `v3.1.4`: project-authorized persistent Godot authoring authority.
- GUT `v9.7.1`: deterministic GDScript test authority.
- Hera `v1.0.0`: live QA/observability only; persistent source mutation 금지.
- historical live receipts는 현재 local readiness를 자동 증명하지 않는다.

## PR #151 / 현재 PR 경계

PR #151 `feat(ui): build GRIMOIRE component sheets A-D`는 **병합 완료**된 current-main 역사다. 더 이상 `DO_NOT_TOUCH` open-work가 아니다. Component Sheet A–D와 semantic UI pack은 병합된 사실로 읽되, 이것이 Task8 또는 Human/Device/Performance/Full Slice PASS를 의미하지 않는다.

현재-task PR #158은 사용자가 승인한 v4.8 authority correction이다. `parallel_open_pr: NONE`은 #158 이외의 unrelated parallel open PR이 없다는 뜻이다. merge 전에는 #158 내용을 merged authority로 주장하지 않는다.

## v4.8 migration / legacy snapshot boundary

`docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `CURRENT_UNRESOLVED_GATES.md`는 v4.5 시기의 장기 machine snapshot을 보존한다. v4.8 thin-adapter 전환 후에는 **HISTORICAL_COMPATIBILITY_SNAPSHOT**으로만 사용하고 새 current decision/gate를 기록하지 않는다.

현재 authority chain:

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
→ task/domain-specific current owner
→ actual code/data/Scene/Resource/Test/runtime evidence
```

## 현재 다음 순서

```text
1. PR #158 v4.8 authority correction RED→GREEN
2. exact-head CI + 5회 이상 whole-state adversarial review
3. review/ruleset/thread gate
4. expected-head merge + merged-main readback
5. bounded Notion Registry / Task13 sync + readback
6. local executor가 가능해지는 즉시 TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
7. recovered delta가 있으면 fresh acceptance → Task8 PR/merge
8. 없으면 approved HiGodot TDD re-authoring
9. Task9 Product Root + responsive/E2E integration
10. 대표 00~10분 Human Slice
```

## 완료로 주장하지 않는 항목

```text
TASK8_PR_PREP_REVERIFY_PENDING
TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
TASK8_LOCAL_DELTA_EXISTENCE_BLOCKED_UNVERIFIED
HIGODOT_EXPECTED_VERSION_FIELD_NOT_SURFACED
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

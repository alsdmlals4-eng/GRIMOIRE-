# GRIMOIRE 시작 지점

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_binding_decision: GM-CONTRACT-V4-8-BINDING-01
contract_binding_sync: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
contract_binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync_predecessor: GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC
current_authority_sync: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
authority_sync_pr: 158
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
current_task8_continuation: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
task8_current_reverify: docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md
task8_preservation_observation: docs/planning/TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVATION_2026-08-24.md
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
task8_product_unit: TASK8_SPELL_USE_SCREEN
latest_product_main_for_task7_lineage: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
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
next_product_task: TASK8_PR_PREP_REVERIFY_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
task8_recovery_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_local_delta_existence: OBSERVED_PRESENT
task8_candidate_preservation: OBSERVED_PASS
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
component_sheet_pr151: MERGED_MAIN_VERIFIED
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
gut_status: GUT_FORMALLY_ADOPTED
higodot_historical_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_current_reconciliation_readback: NOT_RUN
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
authority_sync_local_observation: BLOCKED_NO_LOCAL_ACCESS
authority_sync_godot_observation: BLOCKED_NO_LOCAL_ACCESS
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
```

`v4.8 r2 / GM-CONTRACT-V4-8-BINDING-01`이 현재 프로젝트 실행 계약이다. v4.5 이하 binding은 역사 provenance로 보존하며 current authority로 사용하지 않는다. Base의 과거 SHA도 영구 authority가 아니고 새 실질 work unit마다 latest completed Base `main`과 필요한 owner를 다시 읽는다.

`authority_sync_pr: 158`은 v4.8 전환의 provenance 번호다. draft/ready/merged 같은 PR lifecycle 상태와 현재 open PR 집합은 이 문서에 고정하지 않고 live GitHub에서 읽는다.

`authority_sync_local_observation` / `authority_sync_godot_observation`은 Sync35 당시의 역사 관찰값이다. 현재 로컬 Task8 delta와 preservation은 별도 fresh evidence로 이미 승격됐으며 이 두 marker가 현재 로컬 상태를 의미하지 않는다.

## Workspace authority

```text
Notion
→ 사람용 Project Home / Work / Core System / Visual / Asset / Flow

GitHub repository
→ Markdown / JSON / game data / code / Scene / Resource / Test / runtime evidence

Google Sheets
→ MIGRATION_ONLY_UNTIL_REMOVAL
→ 신규 canon write 금지
→ 고유 자료 흡수 확인 전 삭제 금지
```

2026-08-24 fresh Sheet readback은 v4.5-era main/Task8 상태를 current처럼 표시해 current GitHub/Notion과 drift가 확인됐다. Sheet는 migration-only이므로 이 drift를 수정하기 위한 신규 canon write는 하지 않는다.

## 현재 제품 경계

`GM-SPELL-WORKFLOW-UI-V2-01`의 제품 흐름은 다음이다.

```text
글자 그리기
→ 회로 배치
→ 주문 사용
```

현재까지 병합된 제품 계층:

- Task 3 / PR #104 — immutable `PreparedSpell` + exactly-once inventory
- Task 4 / PR #105 — Stage 2 placement + atomic glyph preparation
- Task 5 / PR #106 — Stage 3 explicit target/use atomic transaction
- Task 6 / PR #108 — glyph drawing workflow screen
- Task 7 / PR #110 — circuit placement workflow screen (`TASK7_MERGED_MAIN_VERIFIED`)
- PR #151 — Component Sheets A–D + reusable semantic UI pack, `MERGED_MAIN_VERIFIED`

Task8은 Task5 Stage3 authority의 thin UI consumer이며 새 target/use/Mana/inventory/result/rollback authority를 만들지 않는다.

## Task8 실제 복구 상태

2026-08-24 사용자 PC read-only probe로 두 역사 Task8 worktree가 실제 남아 있음을 확인했다. 이어 병합된 preservation tool을 실행해 다음 receipt를 관찰했다.

```yaml
preservation_status: TASK8_CANDIDATES_PRESERVED
source_unchanged: true
source_content_unchanged: true
primary: feat/task8-spell-use-screen-v2@8c611f601aa98397ed1558e92ab207e0e8347a9b
primary_copied_file_count: 11
secondary: task8/spell-use-screen@fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
secondary_copied_file_count: 33
recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
current_execution_subgate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
```

따라서 로컬 delta existence와 preservation은 더 이상 `BLOCKED_UNVERIFIED`가 아니다. 다만 이것은 current-main compatibility, fresh HiGodot, GUT/Hera, runtime 또는 제품 병합 증거가 아니다.

역사 Task8 worktree에는 `pull`, `rebase`, `reset`, `restore`, `clean`, `stash`를 하지 않는다. 다음 단계는 external snapshot을 검증한 뒤 exact fresh `origin/main`에서 별도 clean reconciliation worktree를 만드는 것이다. ordinary root checkout은 이 단계에서 pull할 필요가 없다.

## Historical compatibility anchors — current gate 아님

아래 문자열은 기존 machine consumer와 과거 handoff 탐색을 위한 compatibility anchor다. 현재 실행 gate로 재승격하지 않는다.

```text
GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
TASK7_MERGED_MAIN_VERIFIED
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION
FRESH_POWERSHELL_REQUIRED_WHEN_SESSION_RECREATION_OR_CAPABILITY_BOUNDARY
REMOTE_AUTHORITY_RECEIPT
LOCAL_EXECUTION_RECEIPT
EXECUTOR_CAPABILITY_BLOCKER
DO_NOT_RETRY_BLOCKED_REMOTE_CHECK_IN_CODEX
FRESH_GITHUB_CONNECTOR_READBACK_REQUIRED_BEFORE_REMOTE_WRITE
```

## Godot 진입점과 Runtime Reality

- 프로젝트 파일: `project.godot`
- 현재 Main Scene: `res://src/ui/star_circuit_harness.tscn`
- 역할: `DEVELOPMENT_RUNTIME_POC_ENTRY`
- 권장 Godot: 4.7.1
- Renderer: GL Compatibility

Star Circuit Runtime component는 자동 실행 증거를 가진다. 그러나 현재 전체 제품 구현 판정은 `PARTIAL_FOUNDATION`; Human/Device/Performance/Full Vertical Slice는 계속 `NOT_RUN`이다.

## 현재 Authority migration 규칙

현재 cold-start authority는:

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
→ task-specific current owner / actual implementation
```

`CURRENT_CONFIRMED_DECISIONS.md` / `CURRENT_UNRESOLVED_GATES.md`는 **HISTORICAL_COMPATIBILITY_SNAPSHOT**으로만 읽고 새 current decision/gate를 쓰지 않는다.

## 현재 다음 제품 순서

```text
1. TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
2. fresh exact-project HiGodot readback + primary v2 recovery / secondary parity comparison
3. fresh Task8 GUT + predecessor/full runner + Hera source-delta + exact-path adversarial review
4. Task8 product PR / exact-head CI / merge / merged-main readback
5. Task9 Product Root + responsive/E2E integration
6. 대표 00~10분 Human Slice
7. 10~23 → 46분 증거 확장
```

## 현재 완료로 주장하지 않는 항목

```text
TASK8_PR_PREP_REVERIFY_PENDING
TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
HIGODOT_CURRENT_RECONCILIATION_READBACK_NOT_RUN
FRESH_TASK8_TESTS_NOT_RUN
FRESH_FULL_RUNNER_NOT_RUN
HERA_SOURCE_DELTA_NOT_RUN
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
```

## 읽기 순서

1. `AGENTS.md`
2. `START_HERE.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md`
5. `docs/planning/TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVATION_2026-08-24.md`
6. `docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md` — 역사 provenance로만 사용
7. 현재 목표의 분야별 owner / actual code·Scene·Resource·Test
8. `CURRENT_*` machine snapshot — historical compatibility lookup only

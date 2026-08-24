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
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
task8_product_unit: TASK8_SPELL_USE_SCREEN
latest_product_main_for_task7_lineage: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
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
task8_recovery_subgate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
authority_sync_pr: 158
component_sheet_pr151: MERGED_MAIN_VERIFIED
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
gut_status: GUT_FORMALLY_ADOPTED
higodot_historical_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
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
- Task 7 / PR #110 — circuit placement workflow screen (`fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f` lineage)
- PR #151 — Component Sheets A–D + reusable semantic UI pack, `MERGED_MAIN_VERIFIED`

PR #151은 더 이상 별도 진행 중 `DO_NOT_TOUCH` 작업이 아니다. 실제 live open PR inventory는 새 작업 시작마다 다시 조회한다. `open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED`가 current 상태를 소유하고 이 파일은 특정 시점의 open PR 수를 고정하지 않는다.

Task8은 Task5 Stage3 authority의 thin UI consumer이며 새 target/use/Mana/inventory/result/rollback authority를 만들지 않는다.

## Task8 실제 복구 상태

호환 추적용 역사 marker:

```text
GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
TASK7_MERGED_MAIN_VERIFIED
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
```

현재 parent gate와 실행 subgate:

```yaml
resume_gate: TASK8_PR_PREP_REVERIFY_PENDING
current_execution_subgate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_local_branch_historical: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
historical_product_state: UNMERGED_LOCAL_WORKTREE_DELTA
```

`8c611f...`는 Task8 제품 commit이 아니라 당시 local branch Git baseline이다. 과거 `15 tests / 90 assertions / 0 failures`, `42 suites / 1,588 assertions / 0 failures`, `HERA_SOURCE_DELTA_NONE_OBSERVED`는 당시 관찰한 uncommitted worktree 상태의 역사 acceptance다. 현재 로컬 delta 존재를 증명하지 않는다.

`docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md`는 2026-08-21 provenance이며 그 안의 PR/branch 상태를 현재값으로 재사용하지 않는다. 현재 PR 상태는 live GitHub readback을 우선한다.

Sync35 authority 작업에서 관찰한 local/Godot 접근 상태는 다음과 같았다.

```text
LOCAL_SYNC: BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN: BLOCKED_NO_LOCAL_ACCESS
TASK8_LOCAL_DELTA_EXISTENCE: BLOCKED_UNVERIFIED
```

이 값들은 이번 authority sync의 관찰 provenance이지 영구 executor 상태가 아니다. Task8 재개 시 `local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED`에 따라 다시 판정한다. local executor가 사용 가능해지면 `tools/task8_local_recovery_probe.ps1`를 read-only로 실행하고, delta가 남아 있으면 reset/restore/clean 없이 보호 후 재검증하며 없으면 승인된 HiGodot TDD plan으로 재작성한다.

## Sync21 continuation / executor boundary

아래 marker는 과거 Task8 handoff에서 검증된 **executor capability 경계**이며 v4.8 전환으로 지우지 않는다.

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

이미 exact dedicated Codex가 살아 있고 필요한 단계가 그 검증된 capability 안이면 Codex-only continuation에 재사용할 수 있다. 세션 재생성·identity 불명확·capability boundary를 넘으면 fresh PowerShell bootstrap을 사용한다. Remote authority readback은 local worktree/HEAD/HiGodot evidence를 대체하지 않는다.

## Godot 진입점과 Runtime Reality

- 프로젝트 파일: `project.godot`
- 현재 Main Scene: `res://src/ui/star_circuit_harness.tscn`
- 역할: `DEVELOPMENT_RUNTIME_POC_ENTRY`
- Godot project feature: 4.7 계열
- Renderer: GL Compatibility

Star Circuit Runtime component는 자동 실행 증거를 가진다. 그러나 현재 전체 제품 구현 판정은 `PARTIAL_FOUNDATION`; Human/Device/Performance/Full Vertical Slice는 계속 `NOT_RUN`이다.

## 현재 Authority migration 규칙

`docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `docs/planning/CURRENT_UNRESOLVED_GATES.md`에는 v4.5 시기의 장기 machine snapshot이 남아 있다. v4.8은 Base/current-state 중복을 줄이는 thin adapter 정책이므로, 이 두 파일을 또 다른 current contract owner로 유지하지 않는다.

현재 cold-start authority는:

```text
AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
→ task-specific current owner / actual implementation
```

이다. 위 두 `CURRENT_*` 파일은 **HISTORICAL_COMPATIBILITY_SNAPSHOT**으로만 읽고 새 current decision/gate를 쓰지 않는다. 필요한 살아 있는 프로젝트 결정은 `ACTIVE_CONTEXT`와 분야별 owner가 소유한다.

## 현재 다음 제품 순서

```text
1. TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
2. delta 존재 → fresh Task8 acceptance / exact-path review / PR / merge
3. delta 부재 → approved HiGodot TDD re-authoring / acceptance / PR / merge
4. Task9 Product Root + responsive/E2E integration
5. 대표 00~10분 Human Slice
6. 10~23 → 46분 증거 확장
```

## 현재 완료로 주장하지 않는 항목

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

## 읽기 순서

1. `AGENTS.md`
2. `START_HERE.md`
3. `docs/ACTIVE_CONTEXT.md`
4. `docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md`
5. `docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md` — Task8 재개 시, 역사 provenance로만 사용
6. 현재 목표에 해당하는 분야별 planning/runtime owner
7. `skills/PROJECT_BASE_ADAPTER.json` / `skills/SKILL_REGISTRY.json` — routing 확인이 필요할 때
8. 실제 `project.godot`, code/Scene/Resource/Test
9. `CURRENT_CONFIRMED_DECISIONS.md` / `CURRENT_UNRESOLVED_GATES.md` — historical compatibility lookup only
10. 역사 machine snapshots/sync receipts

현재 cold-start에서 Google Sheets나 v4.5 binding을 선행조건으로 사용하지 않는다.

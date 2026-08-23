# GRIMOIRE 시작 지점

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
contract_binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync: GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
current_task8_continuation: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
task8_current_reverify: docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
task8_product_unit: TASK8_SPELL_USE_SCREEN
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
external_process_policy: EXTERNAL_PROCESS_OVERLAY
base_current_main_observed_for_sync34: aa9a0d823db9c7373751d35d341489f64c62f7b9
base_project_pin: v9.4.3
base_pin_update: NOT_APPROVED_NOT_PERFORMED
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
latest_product_main_for_task7_lineage: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
compatibility_next_locator: TASK8_RECEIPT_HERA_REVIEW_PR
next_product_task: TASK8_PR_PREP_REVERIFY_PENDING
task8_recovery_subgate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
parallel_open_pr: PR151_DO_NOT_TOUCH
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
local_execution_policy: PROJECT_DEDICATED_LOCAL_EXECUTION_ENVIRONMENT_FIRST
fresh_shell_policy: ASSUME_PREVIOUS_POWERSHELL_CLOSED
missing_local_environment_policy: CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
higodot_release: v3.1.4
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_sync: GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION
higodot_plugin_subtree: 69010571e11123dfc4e09483f80cb9e6ca93511a
higodot_historical_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_historical_live_session: task8-spell-use-screen-v2@3cfa
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
higodot_direct_tool_state_receipt: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
tracked_project_godot_editor_plugins: GODOT_AI_GUT_HERA_ENABLED_AT_GITHUB_MAIN_READBACK
gut_status: GUT_FORMALLY_ADOPTED
gut_release: v9.7.1
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
```

`v4.5 r2 / GM-CONTRACT-V4-5-BINDING-01`은 현재 프로젝트 계약이다. `GM-CONTRACT-V4-4-BINDING-01`은 `HISTORICAL_SUPERSEDED_CURRENT_BINDING`으로만 보존한다. Base source snapshot `7ce3fb64...`와 과거 work-unit Base SHA는 provenance일 뿐 영구 authority가 아니며, 실제 Base `main`은 새 실질 작업 단위마다 다시 읽는다.

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

`docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`의 과거 write/readback은 역사 증거다. 2026-08-21 이후 active synchronization은 repository merged-main readback 뒤 Notion bounded write/readback으로 닫는다.

## 현재 제품 경계

`GM-SPELL-WORKFLOW-UI-V2-01`의 제품 흐름은 계속 다음과 같다.

```text
글자 그리기
→ 회로 배치
→ 주문 사용
```

현재까지 병합된 구현:

- Task 3 / PR #104 — immutable `PreparedSpell` + exactly-once inventory
- Task 4 / PR #105 — Stage 2 placement + atomic glyph preparation
- Task 5 / PR #106 — Stage 3 explicit target/use atomic transaction
- Task 6 / PR #108 — glyph drawing workflow screen
- Task 7 / PR #110 — circuit placement workflow screen

Task8은 Task5 Stage3 authority의 thin UI consumer이며 새 target/use authority를 만들지 않는다.

호환 consumer를 위해 다음 역사 locator를 유지한다.

```text
GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
TASK7_MERGED_MAIN_VERIFIED
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
```

현재 parent resume gate는 `TASK8_PR_PREP_REVERIFY_PENDING`이고, fresh remote reverify로 첫 실행 subgate가 `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`로 좁혀졌다.

```yaml
task8_local_branch_historical: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_product_commit: NONE
task8_remote_product_branch: NOT_PRESENT
task8_remote_product_pr: NONE
historical_product_state: UNMERGED_LOCAL_WORKTREE_DELTA
```

`8c611f...`는 PR #131 HiGodot v3.1.4 authority reconciliation commit이며 Task8 제품 커밋이 아니다. Sync21 당시 Task8 구현은 이 Git HEAD 위의 **커밋되지 않은 local worktree delta**였다. 이전 `15 tests / 90 assertions / 0 failures`, `42 suites / 1,588 assertions / 0 failures`, `HERA_SOURCE_DELTA_NONE_OBSERVED`는 당시 관찰한 그 worktree acceptance provenance이며 현재 로컬 delta 존재나 원격/merged authority를 증명하지 않는다.

Fresh remote scan 및 복구 규칙은 `docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md`가 소유한다. 로컬 delta가 남아 있으면 reset/restore/clean 없이 보존·재검증하고, 사라졌다면 GitHub text write로 복원하지 말고 승인된 HiGodot 경로에서 TDD부터 재작성한다.

PR #151 `visual/component-sheets-semantic-ui-execution`은 별도 진행 중 작업이다. `DO_NOT_TOUCH`; 이 정본 교정이나 Task8 recovery에서 수정·rebase·merge하지 않는다.

## Godot 진입점과 Runtime Reality

- 프로젝트 파일: `project.godot`
- 현재 Main Scene: `res://src/ui/star_circuit_harness.tscn`
- 역할: `DEVELOPMENT_RUNTIME_POC_ENTRY`
- Renderer: GL Compatibility
- `GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN`
- runtime component authority: `6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b`
- `product_project: CREATED`
- `product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS`
- `runtime_validation: AUTOMATED_HEADLESS_PASS`

이 Star Runtime component 증거는 보존한다. 다만 현재 전체 제품 구현 판정은 `PARTIAL_FOUNDATION`; Human/Device/Performance/Full Vertical Slice는 계속 `NOT_RUN`이다.

## 로컬 실행 시작 규칙

새 로컬 세션 또는 capability boundary를 넘을 때:

```text
새 PowerShell
→ 전용 self-contained GRIMOIRE Godot 확인/복구
→ exact requested project/worktree
→ project-scoped HiGodot profile/server/ports
→ project-scoped CODEX_HOME
→ 필요한 경우 Hera exact project-approved pair/profile
→ exact worktree Codex
→ fresh exact-project HiGodot receipt
→ 이후 persistent authoring
```

`reset`, `restore`, `clean`, stage, rewrite, unrelated process kill은 bootstrap 권한이 아니다. process/port 존재만으로 readiness를 주장하지 않는다. Hera shared token 원문은 저장소·prompt·log·evidence에 기록하지 않는다.

Sync21의 좁은 예외는 유지한다.

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

이미 exact dedicated Codex가 살아 있고 필요한 작업이 검증된 capability 안에 있으면 그 Codex를 재사용할 수 있다. 환경/세션 재생성이나 capability 경계를 넘으면 fresh PowerShell을 사용한다.

## 도구 권위

- HiGodot/Godot AI `v3.1.4`: `SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY`.
- GUT `v9.7.1`: `DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY`.
- Hera `v1.0.0`: `LIVE_QA_AND_OBSERVABILITY_ONLY`; persistent source mutation 금지.
- direct tool-state commit provenance limit: `HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT`.
- `HIGODOT_EXPECTED_VERSION_FIELD_NOT_SURFACED`는 evidence limit이며 readiness PASS로 변환하지 않는다.

## Task 9 / Product Root

Task9은 승인된 Mobile landscape matrix `16:9 / 18:9 / 19.5:9 / 20:9 / cutout / safe-area / foldable/tablet`를 소유한다. `THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9`가 남아 있으며, Star Harness를 제품 Root 완료로 오인하지 않는다.

## 현재 완료로 주장하지 않는 항목

```text
TASK8_PR_PREP_REVERIFY_PENDING
TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
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
4. `docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md` — Task8 재개 시
5. `docs/planning/CANON_AUTHORITY_REALITY_SYNC_2026-08-21.md`
6. `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
7. `docs/planning/CURRENT_UNRESOLVED_GATES.md`
8. `docs/DEVELOPMENT_GATES.md`
9. `skills/PROJECT_BASE_ADAPTER.json`
10. `skills/SKILL_REGISTRY.json`
11. 실제 `project.godot`, code/Scene/Resource/Test
12. 역사 machine snapshots와 sync receipts

현재 cold-start에서 Sheet를 읽기 선행조건으로 사용하지 않는다.

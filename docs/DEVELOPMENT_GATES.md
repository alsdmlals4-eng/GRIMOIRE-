# GRIMOIRE 개발·기획 게이트

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
contract_binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync: GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC
dedicated_local_environment_predecessor_sync: GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT
task8_continuation_sync: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_project_pin: v9.4.3
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION
workspace_human_canon: NOTION_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
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
gut_formal_adoption: GUT_FORMALLY_ADOPTED
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
```

## Gate 0 — Authority / cold-start

새 실질 작업 단위는 다음을 먼저 통과한다.

```text
latest user instruction
→ AGENTS / START_HERE / ACTIVE_CONTEXT
→ CURRENT_CONFIRMED_DECISIONS / CURRENT_UNRESOLVED_GATES
→ PROJECT_BASE_ADAPTER / Registry
→ actual project.godot / code / Scene / Resource / Test
→ fresh Base main + relevant owner
```

Sheet는 cold-start 선행조건이 아니다. 신규 상태는 GitHub branch/PR → exact-head verification → merge → merged-main readback → Notion bounded write/readback으로 닫는다.

## Gate 1 — Product core preservation

```yaml
decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
layout: FIVE_POINT_STAR
main_glyph: exactly_1_center
auxiliary_glyphs: 0_to_5_equivalent_vertices
target_selection: AFTER_CIRCUIT_PREVIEW_BY_KEYWORD
commit: EXPLICIT_EXACTLY_ONCE
stock_scope: TYPED_GLYPH_ONLY
```

활성 3×3 재도입, Universal Stock 임의 대체, 자동 Target/Commit, Best Route, Commit 전 소비, 중복 소비는 차단한다.

## Gate 2 — Current Spell Workflow implementation boundary

Tasks 3–7은 병합 완료다.

| Task | PR | Merge | Result |
|---|---:|---|---|
| 3 | #104 | `3a79c8d1aab67813ef6d1c6662f1e460a711613c` | MERGED_MAIN_VERIFIED |
| 4 | #105 | `97942d0be7404d52316dec0143041e2971c365f1` | MERGED_MAIN_VERIFIED |
| 5 | #106 | `275ba48eb9c07ce24d4b17b2c57de66c98923e1a` | MERGED_MAIN_VERIFIED |
| 6 | #108 | `4a9daf0ed8de7bb39173a71e6ada9324d5a462b7` | MERGED_MAIN_VERIFIED |
| 7 | #110 | `fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f` | TASK7_MERGED_MAIN_VERIFIED |

Task8은 Task5 Stage3의 thin UI consumer다. 역사 local acceptance는 `TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED`; 현재 remote authority를 재검증하지 않았으므로 다음 실행 gate는 `TASK8_PR_PREP_REVERIFY_PENDING`이다.

호환 locator는 유지한다.

```text
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
```

Task8이 merge/complete가 되려면 fresh local/remote identity, protected-delta authoring evidence, GUT, Hera source-delta NONE, exact-head CI/review, merge, merged-main readback이 필요하다. `TASK8_MERGED_MAIN_VERIFIED`는 현재 주장하지 않는다.

## Gate 3 — Sync21 local executor continuation

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

새 로컬 세션·환경 재생성·identity 불명확·capability boundary에서는 fresh PowerShell bootstrap을 사용한다. 이미 exact dedicated Codex가 살아 있고 필요한 작업이 그 capability 안에 있으면 재사용한다.

## Gate 4 — Persistent Godot authoring authority

```text
exact requested GRIMOIRE project/worktree
→ project-scoped HiGodot profile/ports/CODEX_HOME
→ fresh exact-project HiGodot receipt
→ HiGodot-only persistent authoring
→ GUT deterministic test
→ Hera live QA only when required
→ HERA_SOURCE_DELTA: NONE
```

- HiGodot/Godot AI `v3.1.4`: `SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY`.
- tracked plugin subtree: `69010571e11123dfc4e09483f80cb9e6ca93511a`, `PASS_EXACT_TREE_IDENTITY`.
- historical Sync20 live session: `task8-spell-use-screen-v2@3cfa`, `LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED`.
- `expected_version` field는 surfaced되지 않았으므로 `NOT_SURFACED_DO_NOT_CLAIM`.
- direct tool-state evidence limit: `HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT`.
- GUT `v9.7.1`: deterministic GDScript test authority.
- Hera `v1.0.0`: `LIVE_QA_AND_OBSERVABILITY_ONLY`, persistent source mutation forbidden.

## Gate 5 — Product Root / Task9

현재 `project.godot` Main Scene은 `res://src/ui/star_circuit_harness.tscn`, 역할은 `DEVELOPMENT_RUNTIME_POC_ENTRY`다. Star Harness를 삭제하지 않지만 완성 제품 Root로도 승격하지 않는다.

Task9은 다음 matrix와 3-stage E2E를 소유한다.

```text
16:9
18:9
19.5:9
20:9
cutout / safe-area
foldable / tablet classification
Godot multiple-aspect setting verification
Glyph → Circuit → Stage3 → Preview → Target → Confirm → Commit → Result
```

`THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9`가 해소되기 전 제품 Root 완료를 주장하지 않는다.

## Gate 6 — Human Reality Gate

자동 CI/Headless/Editor/GUT/Hera를 Human evidence로 바꾸지 않는다.

권장 증거 확장 순서:

```text
00~10분 Visualized Slice
→ Human comprehension / first impression / input burden
→ 10~23분 investigation transfer
→ 23~46분 W6/W7/result/grimoire causal loop
```

현재:

```text
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
```

## Gate 7 — Workspace synchronization

Notion은 human-facing canon, repository는 structured/runtime canon이다. Google Sheets는 `MIGRATION_ONLY_UNTIL_REMOVAL`; 신규 canon write 금지.

Sheet 삭제 전:

```text
inventory
→ UNIQUE / DUPLICATE / OBSOLETE
→ unique material absorb to Notion or repository
→ destination readback
→ active consumer/reference = 0
→ separate archive/trash/delete decision
```

현재 retirement state는 `BLOCKED_UNVERIFIED_UNIQUE_MATERIAL`다.

## Gate 8 — Parallel PR protection

PR #151 `visual/component-sheets-semantic-ui-execution`은 진행 중 Draft다. 현재 Sync34, Task8 recovery, Task9 planning은 #151을 수정·rebase·merge·완료 처리하지 않는다: `PR151_DO_NOT_TOUCH`.

## Gate 9 — Historical v4.4 / GUT / Task2 provenance

```yaml
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
historical_contract_disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
```

상세 historical hash를 모든 cold-start 문서에 복제하는 것은 요구하지 않는다. 역사 machine/sync owner가 보존한다.

## Gate 10 — Preserved runtime / platform evidence

```yaml
star_runtime:
  sync: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION-MAIN
  main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
  product_project: CREATED
  product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
  runtime_validation: AUTOMATED_HEADLESS_PASS
platform:
  shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
  visual_layout: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
  human: NOT_RUN
  device: NOT_RUN
  performance: NOT_RUN
  full_vertical_slice: NOT_RUN
```

수치·시간·밸런스는 계속 `PLAYTEST_TUNING_REQUIRED`다.

## Current unresolved delivery limits

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
```

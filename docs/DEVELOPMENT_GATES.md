# GRIMOIRE 개발·기획 게이트

```yaml
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5
contract_binding_decision: GM-CONTRACT-V4-5-BINDING-01
contract_binding_sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_MAIN_BEFORE_WORK
base_repository_review_policy: RECURSIVE_INVENTORY_THEN_RELEVANCE_DRIVEN_DEEP_READ
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
external_process_policy: EXTERNAL_PROCESS_OVERLAY
current_state_sync: GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_RECEIPT_HERA_REVIEW_PR
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
higodot_release: v3.1.4
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_tracked_sync: GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION
higodot_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
gut_formal_adoption: GUT_FORMALLY_ADOPTED
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
hera_task8_acceptance: REQUIRED_PENDING_HERA_SOURCE_DELTA_NONE
local_execution_policy: PROJECT_DEDICATED_LOCAL_EXECUTION_ENVIRONMENT_FIRST
fresh_shell_policy: ASSUME_PREVIOUS_POWERSHELL_CLOSED
missing_local_environment_policy: CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
```

## Gate 0 — v4.5 r2 current contract

```yaml
decision: GM-CONTRACT-V4-5-BINDING-01
sync: GR-SYNC-20260811-02-CONTRACT-V4-5-R2-BINDING
binding: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_5_BINDING.md
execution_request_state: USER_EXPLICIT_EXECUTION_REQUEST_PRESENT
merge_authority: APPROVED_ITEM_INHERITS_MERGE_AUTHORITY
base_current_main_observed: 6d2feba2bc49fda2d8d273248b55087853615d5d
base_project_pin: v9.4.3
base_pin_update: NOT_APPROVED_NOT_PERFORMED
base_source_snapshot_7ce3fb64_role: HISTORICAL_OBSERVATION_ONLY
```

Base current SHA는 permanent authority가 아니며 매 작업 재조회한다. v4.5 r2는 Base canon을 복제하지 않는 thin adapter다. Base `6d2feba2...`의 `PROJECT_DEDICATED_LOCAL_EXECUTION_ENVIRONMENT_FIRST`를 project-specific consumer로 적용한다.

## Gate A — current Spell Workflow implementation boundary

Tasks 3–7 are merged under `GM-SPELL-WORKFLOW-UI-V2-01`.

| Task | PR | Merge | Gate result |
|---|---:|---|---|
| 3 | #104 | `3a79c8d1aab67813ef6d1c6662f1e460a711613c` | MERGED_MAIN_VERIFIED |
| 4 | #105 | `97942d0be7404d52316dec0143041e2971c365f1` | MERGED_MAIN_VERIFIED |
| 5 | #106 | `275ba48eb9c07ce24d4b17b2c57de66c98923e1a` | MERGED_MAIN_VERIFIED |
| 6 | #108 | `4a9daf0ed8de7bb39173a71e6ada9324d5a462b7` | MERGED_MAIN_VERIFIED |
| 7 | #110 | `fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f` | TASK7_MERGED_MAIN_VERIFIED |

```yaml
task: TASK8_SPELL_USE_SCREEN
authority_reused: TASK5_STAGE3_TARGET_USE_ATOMIC_TRANSACTION
tracked_higodot: V3_1_4_EXACT_TREE_PASS
live_higodot_gate: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
live_receipt_session: task8-spell-use-screen-v2@3cfa
expected_actual_version_fields: NOT_SURFACED_DO_NOT_CLAIM
local_refinement: FOCUSED_GUT_15_TESTS_90_ASSERTIONS_GREEN
predecessor_regression: LEGACY_42_SUITES_1588_ASSERTIONS_GREEN
persistent_authoring: HIGODOT_ONLY_WITH_FRESH_PROTECTED_DELTA_RECEIPT
testing: GUT_9_7_1_DETERMINISTIC
live_qa: HERA_LIVE_QA_ONLY_HERA_SOURCE_DELTA_NONE_REQUIRED
merge_state: UNMERGED_LOCAL_WORK
```

Task 8은 explicit target, prepared-spell summary, supplied Stage3 preview, two-stage explicit confirmation, fail-closed stale target, actual CancelButton, focus/accessibility hierarchy까지 로컬 refinement GREEN 증거가 있다. 그러나 protected-delta HiGodot receipt/readback, Hera acceptance, PR exact-head CI/review, merge/readback이 남아 있으므로 `MERGED` 또는 `COMPLETE`로 승격하지 않는다.

Task8 UI는 `SpellWorkflowCoordinator` / `AtomicSpellUseService`의 기존 Stage3 authority를 소비할 뿐 Mana/inventory/result/rollback/transaction generation을 소유하지 않는다.

## Gate B — Task 9 responsive / E2E prerequisites

```text
APPROVED_DEVICE_MATRIX_PROPAGATION
GODOT_STRETCH_ASPECT_EXPLICIT_VERIFICATION
```

Approved classes include `16:9`, `18:9`, `19.5:9`, `20:9`, cutout/safe-area, foldable, and tablet classes. `1280×720` is a reference surface, not the only acceptance target. Task8 local refinement does not pull this Task9 matrix forward.

## Gate C — tool authority and dedicated local execution

```text
NEW_POWERSHELL_EACH_LOCAL_WORK_SESSION
→ DEDICATED_SELF_CONTAINED_GRIMOIRE_GODOT
→ EXACT_REQUESTED_GRIMOIRE_PROJECT_OR_WORKTREE
→ PROJECT_SCOPED_HIGODOT_PROFILE_AND_PORTS
→ PROJECT_SCOPED_CODEX_HOME
→ HERA_EXACT_PAIR_PROFILE_WHEN_LIVE_QA_REQUIRED
→ CODEX_EXACT_WORKTREE
→ FRESH_HIGODOT_EXACT_PROJECT_VERSION_READINESS_RECEIPT
→ HIGODOT_ONLY_PERSISTENT_AUTHORING
→ GUT_DETERMINISTIC_TEST
→ HERA_LIVE_QA_ONLY
→ HERA_SOURCE_DELTA_NONE
```

- Base owner: `ONE_SHOT_LOCAL_EXECUTOR_BOOTSTRAP` + `PROJECT_DEDICATED_LOCAL_EXECUTION_ENVIRONMENT_FIRST`.
- 이전 PowerShell은 종료됐다고 가정한다: `ASSUME_PREVIOUS_POWERSHELL_CLOSED`.
- dedicated environment가 없거나 불완전하면 제품 작업 전에 `CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST`.
- 사용자에게는 항상 **한 덩어리 PowerShell launcher를 Codex prompt보다 먼저** 제공한다.
- launcher는 broad Git diff/repository-wide scan/이미 분류된 LF·CRLF/stat noise dump를 Codex 실행 전 강제하지 않는다.
- launcher는 `reset`, `restore`, `clean`, stage, rewrite 또는 unrelated editor/server kill을 수행하지 않는다.
- process/port 존재는 readiness 증거가 아니다. Codex 내부에서 fresh HiGodot exact-project receipt를 다시 얻는다.
- current HiGodot project ports/profile은 local execution-time authority에서 fresh-read한다. 다른 프로젝트 profile/port를 조용히 재사용하지 않는다.
- `CODEX_HOME`은 GRIMOIRE 전용 profile을 사용하며 global/default profile leakage를 fail-closed로 처리한다.
- HiGodot/Godot AI `v3.1.4`: official/project plugin subtree `69010571e11123dfc4e09483f80cb9e6ca93511a` exact identity PASS; `SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY` 유지.
- latest Task8 live receipt: exact worktree session `task8-spell-use-screen-v2@3cfa`, Godot 4.7.1, plugin/server 3.1.4, readiness `ready`. `expected_version` field는 surfaced되지 않았으므로 그 필드의 equality를 주장하지 않는다.
- direct/local tool-state commit `257a0dba...` authoring receipt: `HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT` 유지.
- GUT `v9.7.1`: `DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY`.
- Hera `v1.0.0`: `LIVE_QA_AND_OBSERVABILITY_ONLY`; persistent source mutation forbidden.
- Hera acceptance는 pre/post tracked-source snapshot을 비교해 `HERA_SOURCE_DELTA: NONE`을 요구한다. Hera가 결함을 발견하면 persistent 수정은 HiGodot으로 돌아간다.
- Hera shared token 원문은 저장소·prompt·log·evidence에 기록하지 않는다.
- HiGodot v3.1.3 exact-tree/live evidence remains historical predecessor evidence only.

## Gate C.1 — Sync21 current Codex continuation exception

`GR-SYNC-20260812-21-TASK8-HANDOFF-BCP`는 Gate C의 fresh-session 기본값을 제거하지 않고, 이미 성립한 exact dedicated Codex를 재사용할 수 있는 좁은 continuation 예외만 추가한다.

```text
CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION
FRESH_POWERSHELL_REQUIRED_WHEN_SESSION_RECREATION_OR_CAPABILITY_BOUNDARY
TASK8_PR_PREP_REVERIFY_PENDING
```

- 새 로컬 세션 시작, 전용 environment/session 재생성, identity 불명확 상태에서는 기존 Gate C대로 fresh PowerShell bootstrap을 수행한다.
- 대화상 현재 exact dedicated Codex가 계속 열려 있고 다음 단계가 그 Codex capability 안의 Codex-only 작업이면 현재 Codex를 재사용한다.
- current Codex가 GitHub network, linked-worktree shared metadata write, 또는 required live tool/session capability를 제공하지 못하면 `EXECUTOR_CAPABILITY_BLOCKER`로 분류하고 그 capability boundary에서만 fresh PowerShell 또는 승인된 다른 authority channel로 전환한다.
- 외부 trusted connector의 remote readback은 local worktree/HEAD/staged state/HiGodot/GUT receipt를 대체하지 않으며 local mutation 권한으로 확대되지 않는다.
- remote write/merge 직전에는 fresh GitHub remote-authority readback을 다시 수행한다.
- Task8은 여전히 `TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING`; compatibility locator `TASK8_RECEIPT_HERA_REVIEW_PR`도 유지한다.

## Gate D — preserved runtime / platform evidence

```yaml
star_runtime:
  decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
  main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
  runtime_validation: AUTOMATED_HEADLESS_PASS
platform:
  shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
  visual_layout: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
  windows_export: NOT_RUN
  android_export: NOT_RUN
  android_device: NOT_RUN
  human_validation: NOT_RUN
  performance_validation: NOT_RUN
  full_vertical_slice: NOT_RUN
```

No automated, tracked-tree, editor-state, GUT, or Hera evidence upgrades HUMAN/DEVICE/PERFORMANCE/FULL_VERTICAL_SLICE to PASS unless that category is actually executed.

## Current Task8 merge gate

```text
fresh dedicated local environment bootstrap
→ fresh exact-project HiGodot receipt
→ fresh protected-delta HiGodot authoring receipt/readback
→ GUT focused/regression recheck as required
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

## Historical v4.4 / Task 2 / HiGodot v3.1.3 provenance

```yaml
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
historical_contract_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
historical_contract_disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
higodot_v3_1_3_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
higodot_v3_1_3_status: HISTORICAL_PASS_EXACT_TREE_IDENTITY_AND_LIVE_READBACK
```

```text
TASK2_MERGED_MAIN_VERIFIED
GR-SYNC-20260809-01-TASK2-USER-APPROVAL
GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN
GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON
975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0
SHEET_WRITE_READBACK_PASS
```

These values remain provenance and do not define the current contract, current HiGodot version, or next product task.

## Gate 18 — repository-wide Actions supply-chain closure

```yaml
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_supply_chain: REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS
```

## Delivery / unresolved limits

```text
TASK8_PROTECTED_DELTA_HIGODOT_RECEIPT_PENDING
TASK8_HERA_ACCEPTANCE_PENDING
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

## Contract Gate

The active repository contract is v4.5 r2 / `GM-CONTRACT-V4-5-BINDING-01`. v4.4 and HiGodot v3.1.3 remain historical provenance. Dedicated-local-environment Sync20 changes operating flow only; it does not change gameplay/product authority.

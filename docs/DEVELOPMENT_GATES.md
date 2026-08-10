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
current_state_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
higodot_release: v3.1.3
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
gut_formal_adoption: GUT_FORMALLY_ADOPTED
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
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
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
base_source_snapshot_7ce3fb64_role: HISTORICAL_OBSERVATION_ONLY
```

Base current SHA는 permanent authority가 아니며 매 작업 재조회한다. v4.5 r2는 Base canon을 복제하지 않는 thin adapter다.

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
persistent_authoring: HIGODOT_ONLY_WITH_FRESH_RECEIPT
testing: GUT_9_7_1_DETERMINISTIC
live_qa: HERA_OBSERVABILITY_ONLY_SOURCE_DELTA_NONE
```

Task 8 must expose explicit target selection, expected-result preview, and user confirmation without duplicating the already-merged Stage 3 transaction authority.

## Gate B — Task 9 responsive / E2E prerequisites

```text
APPROVED_DEVICE_MATRIX_PROPAGATION
GODOT_STRETCH_ASPECT_EXPLICIT_VERIFICATION
```

Approved classes include `16:9`, `18:9`, `19.5:9`, `20:9`, cutout/safe-area, foldable, and tablet classes. `1280×720` is a reference surface, not the only acceptance target.

## Gate C — tool authority

- HiGodot/Godot AI `v3.1.3`: `SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY`.
- GUT `v9.7.1`: `DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY`.
- Hera `v1.0.0`: `LIVE_QA_AND_OBSERVABILITY_ONLY`; persistent source mutation forbidden.
- Historical direct/local tool-state receipt remains `HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT`.

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

No automated evidence upgrades HUMAN/DEVICE/PERFORMANCE/FULL_VERTICAL_SLICE to PASS.

## Historical v4.4 / Task 2 provenance

```yaml
historical_contract_binding: GM-CONTRACT-V4-4-BINDING-01
historical_contract_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_4_BINDING.md
historical_contract_disposition: HISTORICAL_SUPERSEDED_CURRENT_BINDING
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
```

```text
TASK2_MERGED_MAIN_VERIFIED
GR-SYNC-20260809-01-TASK2-USER-APPROVAL
GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN
GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON
975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0
SHEET_WRITE_READBACK_PASS
```

These values remain provenance and do not define the current contract or next product task.

## Gate 18 — repository-wide Actions supply-chain closure

```yaml
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_supply_chain: REPO_WIDE_ACTIONS_FULL_SHA_PINNING_PASS
```

## Delivery / unresolved limits

```text
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

## Contract Gate

The active repository contract is v4.5 r2 / `GM-CONTRACT-V4-5-BINDING-01`. v4.4 remains `HISTORICAL_SUPERSEDED_CURRENT_BINDING`.

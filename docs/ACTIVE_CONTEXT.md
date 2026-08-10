# GRIMOIRE Active Context

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_binding_decision: GM-CONTRACT-V4-4-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
higodot_authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
higodot_release: v3.1.3
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_tracked_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
higodot_post_merge_sheet_sync: GR-SYNC-20260809-05-HIGODOT-V313-POST-MERGE-SHEET-CANON
higodot_tool_state_main: 75eaa8d19b8a38a21599c37dc7545818615a04c1
higodot_tool_state_sheet_sync: SHEET_WRITE_READBACK_PASS
gut_formal_adoption: GUT_FORMALLY_ADOPTED
gut_release: v9.7.1
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
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
local_sync: LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
godot_run: GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

## Current Spell Workflow state

`GM-SPELL-WORKFLOW-UI-V2-01`은 `글자 그리기 → 회로 배치 → 주문 사용`과 Stage 경계를 유지한다. 실제 merged lineage는 다음과 같다.

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
current_status: TASK7_MERGED_MAIN_VERIFIED
next_task: TASK8_SPELL_USE_SCREEN
```

Task 8은 Task 5에서 이미 병합된 explicit target/use transaction을 화면에 노출하는 단계다. Mana/result atomicity를 새 authority로 다시 만들지 않는다.

Task 9에는 기존 승인된 Mobile landscape device matrix(16:9, 18:9, 19.5:9, 20:9, cutout/safe-area, foldable/tablet 분류)를 acceptance에 전파해야 한다. 1280×720은 reference surface이지 유일 검증 비율이 아니다.

## Tool authority

```yaml
higodot:
  release: v3.1.3
  authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
  tracked_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
  post_merge_sheet_sync: GR-SYNC-20260809-05-HIGODOT-V313-POST-MERGE-SHEET-CANON
  reconciled_main: 75eaa8d19b8a38a21599c37dc7545818615a04c1
  sheet_sync: SHEET_WRITE_READBACK_PASS
  tracked_plugin_subtree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
  vendor_integrity: PASS_EXACT_TREE_IDENTITY
  historical_direct_local_upgrade_receipt: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
gut:
  release: v9.7.1
  authority: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY
  adoption: GUT_FORMALLY_ADOPTED
hera:
  release: v1.0.0
  authority: LIVE_QA_AND_OBSERVABILITY_ONLY
  persistent_source_mutation: FORBIDDEN
```

## Historical Task 2 / Task 3 entry evidence

다음 기록은 현재 next-task 지시가 아니라 provenance로 보존한다.

```text
GR-SYNC-20260809-01-TASK2-USER-APPROVAL
GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN
GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON
GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY
TASK2_MERGED_MAIN_VERIFIED
975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0
```

Task 3 handoff와 Task 2 HiGodot receipt는 역사 증거로 유효하지만 Tasks 3–7이 이미 merged된 사실을 되돌리지 않는다.

### Historical v4.4 provenance contract

```yaml
gut_formal_adoption_main: ea46923fa78c4fe7844ab6bf422e6716a3c785ed
post_merge_canon_sync_merge: ce01bb8caa5f1b224279d3fbf418eae29a88af7d
hera_exact_pair: PASS
spell_workflow_task2_authorized: true
spell_workflow_task2_historical_status: TASK2_MERGED_MAIN_VERIFIED
```

이 메타데이터는 현행 Task 7→8 권위를 되돌리지 않고 v4.4 시기의 병합·도구 채택 provenance만 보존한다.

## Preserved validation boundaries

```text
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
LOCAL_SYNC_BLOCKED_NO_LOCAL_ACCESS
GODOT_RUN_BLOCKED_NO_LOCAL_ACCESS
```

자동·Editor·CI 증거로 사람/기기/성능/전체 Vertical Slice 증거를 승격하지 않는다.

## Contract boundary

저장소 current canon은 v4.4 / `GM-CONTRACT-V4-4-BINDING-01`이다. 2026-08-11 v4.5 thin-adapter 입력은 별도 승인 전까지 `NEWER_INPUT_NOT_BOUND`로 취급한다. 이 계약 결정은 factual Task 7 → Task 8 상태 복구와 독립이다.

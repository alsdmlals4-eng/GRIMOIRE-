# GRIMOIRE 현재 확정 결정 스냅샷

```yaml
status: ACTIVE_CANON_V4_4_TASK7_CURRENT_STATE_SYNC
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
contract_binding_decision: GM-CONTRACT-V4-4-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK8_SPELL_USE_SCREEN
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
tool_authority_decision: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
higodot_release: v3.1.3
higodot_vendor_integrity: PASS_EXACT_TREE_IDENTITY
higodot_tracked_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
higodot_post_merge_sheet_sync: GR-SYNC-20260809-05-HIGODOT-V313-POST-MERGE-SHEET-CANON
higodot_tool_state_main: 75eaa8d19b8a38a21599c37dc7545818615a04c1
higodot_tool_state_sheet_sync: SHEET_WRITE_READBACK_PASS
gut_status: GUT_FORMALLY_ADOPTED
gut_release: v9.7.1
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
visual_platform_merged_main: 5016bd090ad09892d36a8b751c7a9649868b76d5
visual_platform_sheet_sync: SHEET_WRITE_READBACK_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE
review_model: GPT_ROLE_SEPARATED_PLUS_USER_DECISION_AUTHORITY
visual_audio_status: APPROVED_DIRECTION_RUNTIME_NOT_RUN_VISUAL_AUDIO_INCOMPLETE
```

## GM-SPELL-WORKFLOW-UI-V2-01 — current implementation state

확정된 제품 방향은 변하지 않았다.

```text
글자 그리기
→ 회로 배치
→ 주문 사용
```

Stage 경계도 유지한다.

- Stage 2는 glyph preparation / circuit placement 중심이며 target selection과 Mana/result commit을 소유하지 않는다.
- Stage 3는 explicit target selection, final expected-result preview, user confirm, atomic use transaction을 소유한다.
- FIVE_POINT_STAR, Typed Glyph Stock, exactly-once 의미를 보존한다.

현재 병합 상태:

| Task | PR | Merge | 확정된 구현 의미 |
|---|---:|---|---|
| 3 | #104 | `3a79c8d1aab67813ef6d1c6662f1e460a711613c` | immutable PreparedSpell, READY/USED exactly-once inventory |
| 4 | #105 | `97942d0be7404d52316dec0143041e2971c365f1` | Stage 2 placement + atomic glyph preparation |
| 5 | #106 | `275ba48eb9c07ce24d4b17b2c57de66c98923e1a` | Stage 3 target/use atomic transaction |
| 6 | #108 | `4a9daf0ed8de7bb39173a71e6ada9324d5a462b7` | glyph drawing workflow screen |
| 7 | #110 | `fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f` | circuit placement workflow screen |

```yaml
current_status: TASK7_MERGED_MAIN_VERIFIED
next_task: TASK8_SPELL_USE_SCREEN
next_task_role: UI_CONSUMER_OF_EXISTING_TASK5_STAGE3_AUTHORITY
new_product_decision_required_for_task8: false
```

Task 8은 기존 승인 범위의 다음 구현 단위이며, Task 5의 atomic target/use transaction을 중복하거나 교체할 권한을 새로 부여하지 않는다.

Task 9 responsive/E2E acceptance에는 이미 승인된 Mobile landscape matrix를 전파한다.

```text
16:9
18:9
19.5:9
20:9
cutout / safe-area
foldable folded=phone-like
foldable unfolded=tablet-like
tablet aspect families
```

1280×720은 reference surface로 유지하되 유일 검증 비율로 축소하지 않는다.

## GM-STAR-CIRCUIT-MASTERY-BALANCE-01

```yaml
main_authority_commit: 6c7b33df7347a151ce18a4bfdbf9ec212a8a4a6b
circuit_topology: FIVE_POINT_STAR
canon_status: SYNCED_TO_MAIN
product_implementation: STAR_RUNTIME_COMPLETION_AUTOMATED_PASS
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
human_validation: NOT_RUN
tuning_status: PLAYTEST_TUNING_REQUIRED
```

## GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01

```yaml
higodot:
  release: v3.1.3
  authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
  tracked_sync: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
  post_merge_sheet_sync: GR-SYNC-20260809-05-HIGODOT-V313-POST-MERGE-SHEET-CANON
  reconciled_main: 75eaa8d19b8a38a21599c37dc7545818615a04c1
  sheet_sync: SHEET_WRITE_READBACK_PASS
  plugin_subtree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
  vendor_integrity: PASS_EXACT_TREE_IDENTITY
  direct_local_upgrade_receipt: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
gut:
  release: v9.7.1
  authority: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY
  status: GUT_FORMALLY_ADOPTED
hera:
  release: v1.0.0
  authority: LIVE_QA_AND_OBSERVABILITY_ONLY
  status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
  persistent_source_mutation_authorized: false
```

HiGodot/GUT/Hera의 역할 경계는 Task 3–7 병합으로 바뀌지 않았다.

## Visual / platform preserved provenance

```yaml
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
visual_automated_layout_baseline: VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
visual_platform_merged_main: 5016bd090ad09892d36a8b751c7a9649868b76d5
visual_platform_sheet_sync: SHEET_WRITE_READBACK_PASS
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE
```

이 provenance는 Task 7 current-state 복구와 충돌하지 않으며, current canon에서 제거하지 않는다.

## Historical Task 2 / Task 3 entry evidence

다음은 삭제하지 않는 역사 증거다.

```text
GR-SYNC-20260809-01-TASK2-USER-APPROVAL
GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN
GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON
GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY
TASK2_MERGED_MAIN_VERIFIED
975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0
```

`Task 3+ 구현과 three-screen runtime acceptance는 아직 완료로 주장하지 않는다`는 문구는 **Task 2 시점의 역사적 제한 문구**였으며, 현재는 Tasks 3–7의 병합 사실로 supersede되었다. Three-screen runtime acceptance 자체는 여전히 NOT_RUN이며 Task 8–9 구현과 Task 10 evidence 뒤에 판정한다.

## 현재 증거 한계

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

## Contract binding

v4.5 thin-adapter 입력은 최신 문서이지만, 현재 확정 계약은 v4.4 / `GM-CONTRACT-V4-4-BINDING-01`이다. v4.5 채택은 별도 사용자 승인 Decision 전까지 확정 결정으로 기록하지 않는다.

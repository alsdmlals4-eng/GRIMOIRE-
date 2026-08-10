# GR-SYNC-20260811-01 — Spell Workflow Task 7 Current-State Recovery

```yaml
sync_id: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
scope: FACTUAL_CURRENT_STATE_PROPAGATION_ONLY
product_behavior_changed: false
contract_binding_changed: false
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
active_contract_decision: GM-CONTRACT-V4-4-BINDING-01
latest_product_main: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
current_status: TASK7_MERGED_MAIN_VERIFIED
next_task: TASK8_SPELL_USE_SCREEN
three_screen_acceptance: NOT_RUN
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: NOT_RUN
```

## Why this sync exists

The live GitHub implementation advanced through Tasks 3–7, while several current-state documents and the connected Google Sheet still advertised Task 2 merged / Task 3 next. The 2026-08-11 freshness audit reproduced that drift before correction.

This sync does **not** create a new product decision. It propagates already-merged facts under `GM-SPELL-WORKFLOW-UI-V2-01`.

## Merged lineage

| Task | PR | Merge commit | Scope |
|---|---:|---|---|
| 3 | #104 | `3a79c8d1aab67813ef6d1c6662f1e460a711613c` | immutable PreparedSpell + exactly-once inventory |
| 4 | #105 | `97942d0be7404d52316dec0143041e2971c365f1` | Stage 2 placement + atomic glyph preparation |
| 5 | #106 | `275ba48eb9c07ce24d4b17b2c57de66c98923e1a` | Stage 3 target/use atomic transaction |
| 6 | #108 | `4a9daf0ed8de7bb39173a71e6ada9324d5a462b7` | glyph drawing workflow screen |
| 7 | #110 | `fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f` | circuit placement workflow screen |

## Current boundary

The approved implementation plan continues with:

```text
Task 8 — Spell Use Screen / Target Selection / Expected Result
Task 9 — Root Coordinator / responsive matrix / E2E
Task 10 — render evidence / CI / main-scene / final canon+Sheet readback
```

Task 8 consumes the already-merged Task 5 Stage 3 authority. It must not duplicate or bypass the existing target/use atomic transaction.

## Preserved historical evidence

The following remain valid history, not current-next-task authority:

- `GR-SYNC-20260809-01-TASK2-USER-APPROVAL`
- `GR-SYNC-20260809-06-SPELL-WORKFLOW-TASK2-MAIN`
- `GR-SYNC-20260809-07-SPELL-WORKFLOW-TASK2-POST-MERGE-CANON`
- `GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY`
- Task 2 merged main `975b2ad278d07bf9bfa06a9f4c1fc20a9fb1bac0`
- Task 3 handoff packet and TDD entry evidence

## Validation boundaries preserved

```text
WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
```

Task 7 merge does not upgrade any of those NOT_RUN states.

## Contract boundary

The repository remains bound to v4.4 until a separate user-approved contract-binding decision changes it. The attached v4.5 contract is newer planning input but is not silently adopted by this factual sync.

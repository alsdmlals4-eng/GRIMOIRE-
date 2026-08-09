# GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION

```yaml
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
sync_id: GR-SYNC-20260809-04-HIGODOT-V313-TRACKED-EXACT-RECONCILIATION
baseline_main: 71ba449b13f8759d8f211ef88bb249bfda683e37
direct_local_tool_state_commit: 1337e267d29b00c039039e7197863e2f4f78957d
base_main_observed: 2a6ced23f6d6de1fb6e0a281c7138beb03f1a13b
base_release_pin: 9.4.3
base_pin_update: NOT_APPROVED_NOT_PERFORMED
```

## Fresh tracked readback

Current GitHub `main` no longer matches the earlier PR #96/#97 assumption that HiGodot 3.1.3 existed only in the live Editor.

```yaml
tracked_godot_ai_plugin_cfg: 3.1.3
tracked_godot_ai_plugin_subtree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
official_v3_1_3_tag_commit: 22678e5f9b038d7203d6b43b0aae20a5417c500e
official_v3_1_3_plugin_subtree: 94be4fb34d49243375c592e17a1021c8c6fcbcf2
tracked_tree_identity: PASS_EXACT_TREE_IDENTITY
tracked_project_godot_plugins:
  - res://addons/godot_ai/plugin.cfg
  - res://addons/gut/plugin.cfg
  - res://addons/hera_agent_godot/plugin.cfg
tracked_hera_autoload: HeraGameInspector
```

The v3.1.2 exact-tree record remains valid **historical evidence** for the earlier repository state; it is not current tracked tool state.

## Authority and provenance

The role boundaries do not change:

- HiGodot / Godot AI: `SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY`
- GUT 9.7.1: `DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY`
- Hera 1.0.0: `LIVE_QA_AND_OBSERVABILITY_ONLY`
- Hera persistent source mutation: `FORBIDDEN`

A repository search did not find a formal HiGodot authoring receipt/manifest tied to the direct/local tool-state commit. Therefore this reconciliation records, without inventing evidence:

```yaml
authoring_receipt_status: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
rollback_or_revert_performed: false
current_tracked_state_factually_reconciled: true
```

This missing historical receipt does not authorize GitHub/text-based persistent Godot writes. Future Task 2 product mutation still requires the HiGodot authoring channel and the project receipt/readback Gate.

## TDD / CI

Current-main authority CI exposed the stale v3.1.2 assumption. PR #98 adds a test-first reconciliation contract before updating canon and existing consumers. The reconciliation PR itself changes only docs/tests/CI; it does not mutate `project.godot`, `addons/**`, product scripts, scenes, resources, or assets.

## Sheet

The same Decision ID will be written to the project Google Sheet after merge and promoted to `SHEET_WRITE_READBACK_PASS` only after explicit readback. Until then the Sheet rows that still say `TRACKED_V3_1_2` / `NOT_SYNCED_NOT_CLAIMED` are `STALE_STATUS`.

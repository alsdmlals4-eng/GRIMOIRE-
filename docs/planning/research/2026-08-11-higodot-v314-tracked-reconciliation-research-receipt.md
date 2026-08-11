# HiGodot v3.1.4 Tracked Reconciliation — Research Receipt

```yaml
work_unit: HIGODOT_V3_1_4_TRACKED_EXACT_RECONCILIATION
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
candidate_sync_id: GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION
fresh_base_main: 7a49390bd840f5f5dc80fe661b44ad45e9ebeb7f
fresh_project_main: 257a0dba33f8288d24b1cd291bb407f4505224b4
fresh_open_pr_count: 0
sheet_conflict: TRACKED_V313_STALE_VS_GITHUB_EXACT_V314_TREE
persistent_godot_product_mutation: NONE
```

## Work question

The tracked `addons/godot_ai` tree changed after Sync17/18. Determine whether it is the exact official v3.1.4 plugin tree, distinguish tracked integrity from live executor readiness, repair stale current-state contracts without rewriting v3.1.3 history, and decide whether Task8 may enter protected GUT RED.

## Fresh source evidence

- Base current main was re-read at `7a49390bd840f5f5dc80fe661b44ad45e9ebeb7f`. Its newest change is serial-fiction-specific and does not alter Task8 product authority.
- Base Godot Live Editor safety proposal was deep-read. Applicable principles are fail-closed stale-state checks, evidence binding, file-backed hash evidence, and no runtime/readiness promotion without runtime evidence.
- GRIMOIRE current main was re-read at `257a0dba33f8288d24b1cd291bb407f4505224b4`; there were no open PRs at work-unit start.
- Current Sheet rows were re-read. They still claim tracked Godot AI v3.1.3 / tracked v3.1.4 not verified, which conflicts with current GitHub state.
- Official `hi-godot/godot-ai` latest release was re-read as v3.1.4, tag commit `96cc8b8c3d25ce487e24801d01d5214fea150349`, release plugin SHA256 `77d5bc7f8e0062f88aef08f3471cc6e4546a0d71d18813752781689ab6ce4848`.
- Official tag `plugin/addons/godot_ai` subtree is `69010571e11123dfc4e09483f80cb9e6ca93511a`.
- Project current `addons/godot_ai` subtree is exactly `69010571e11123dfc4e09483f80cb9e6ca93511a`.
- Current `plugin.cfg` reports `3.1.4`.
- Push CI on `257a0dba...` fails in the old v3.1.3 reconciliation test because the test asserts `version="3.1.3"`; the failure does not indicate a corrupt v3.1.4 tree.
- The direct tool-state commit also touched `project.godot` only by autoload ordering plus editor-generated `.uid` files. No Task8 product logic was added.

## Existing Solution First

Keep the existing Godot-authoring authority model and exact-tree reconciliation mechanism. Do not add a second installer, a second authority, or a new runtime path. Promote the already-tracked exact official v3.1.4 tree into the existing authority/canon structures while preserving v3.1.3 as historical predecessor evidence.

## Disposition

- `ADOPT`: official plugin-subtree SHA identity as tracked-vendor integrity proof.
- `ADOPT`: fail-closed separation of tracked tree PASS from live plugin/server handshake readiness and authoring receipt.
- `ADOPT`: GUT remains deterministic test authority before Task8 GREEN implementation.
- `ADAPT`: Base live-editor stale observation/hash principles to this tool-state reconciliation.
- `TEST`: live v3.1.4 plugin/server handshake, expected/actual version match, and Task8 focused GUT RED through the authorized HiGodot route.
- `AVOID`: rollback to v3.1.3 merely to satisfy stale tests; version-string-only reconciliation; GitHub edits to protected Godot product source; claiming the direct commit has a valid HiGodot receipt without evidence.
- `IGNORE`: unrelated Base serial-fiction changes for Task8 product design.
- `REFERENCE_ONLY`: upstream GridMap/CSG features; they do not change Task8 Spell Use Screen scope.

## Adversarial review before work

Fail the reconciliation if any of these occur:

- official/project plugin subtree SHA differs;
- v3.1.3 history is deleted or rewritten as if it never was current;
- live v3.1.4 handshake is inferred from the tracked tree or user report;
- direct commit `257a0dba...` is labeled receipt-verified without a receipt;
- Task8 protected `.gd/.tscn/.tres/.res/project.godot` files are changed through GitHub;
- GUT or Hera authority changes;
- Sheet is updated to a stronger live claim than GitHub evidence supports.

## Research verdict

```yaml
tracked_v314_tree_identity: PASS_EXACT_TREE_IDENTITY
live_v314_handshake: NOT_VERIFIED
tracked_vs_live_match: NOT_VERIFIED
observed_direct_tool_state_commit: 257a0dba33f8288d24b1cd291bb407f4505224b4
direct_commit_authoring_receipt: UNVERIFIED
current_ci_failure_root_cause: STALE_V313_CURRENT_CONTRACT
next_step: TDD_RED_THEN_CURRENT_CANON_RECONCILIATION
```

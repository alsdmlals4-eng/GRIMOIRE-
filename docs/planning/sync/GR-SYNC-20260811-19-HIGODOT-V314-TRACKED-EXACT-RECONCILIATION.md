# GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION

```yaml
sync_id: GR-SYNC-20260811-19-HIGODOT-V314-TRACKED-EXACT-RECONCILIATION
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
status: PREMERGE_SHEET_READBACK_PASS_EXACT_HEAD_VALIDATION_PENDING
work_unit: HIGODOT_V3_1_4_TRACKED_EXACT_RECONCILIATION
observed_project_main: 257a0dba33f8288d24b1cd291bb407f4505224b4
observed_base_main: 7a49390bd840f5f5dc80fe661b44ad45e9ebeb7f
pull_request: 131
tracked_plugin_version: 3.1.4
official_tag_commit: 96cc8b8c3d25ce487e24801d01d5214fea150349
official_release_asset_sha256: 77d5bc7f8e0062f88aef08f3471cc6e4546a0d71d18813752781689ab6ce4848
tracked_plugin_subtree: 69010571e11123dfc4e09483f80cb9e6ca93511a
official_plugin_subtree: 69010571e11123dfc4e09483f80cb9e6ca93511a
tracked_tree_identity: PASS_EXACT_TREE_IDENTITY
sheet_sync: SHEET_WRITE_READBACK_PASS
live_handshake: LIVE_V3_1_4_HANDSHAKE_NOT_VERIFIED
authoring_receipt_for_257a0dba: HIGODOT_AUTHORING_RECEIPT_UNVERIFIED_FOR_DIRECT_LOCAL_TOOL_STATE_COMMIT
persistent_task8_product_mutation_by_sync19: NONE
```

## Fresh-start and research result

This work unit began from fresh Base, GRIMOIRE, Sheet, and upstream reads. Base current main was `7a49390bd840f5f5dc80fe661b44ad45e9ebeb7f`; GRIMOIRE current main was `257a0dba33f8288d24b1cd291bb407f4505224b4`; open PR count was zero. The Sheet still described tracked Godot AI v3.1.3, while current GitHub tracked `addons/godot_ai` was already v3.1.4.

Official `hi-godot/godot-ai` v3.1.4 and the project tracked addon both resolve to plugin subtree `69010571e11123dfc4e09483f80cb9e6ca93511a`. This is exact Git-tree identity evidence, not merely a version-string match.

Research receipt:

`docs/planning/research/2026-08-11-higodot-v314-tracked-reconciliation-research-receipt.md`

## Existing Solution First / disposition

The existing Godot authoring authority model and exact-tree reconciliation mechanism were retained.

- `ADOPT`: official/project plugin-subtree identity as tracked-vendor integrity proof.
- `ADOPT`: tracked-tree PASS and live executor readiness remain separate evidence classes.
- `ADAPT`: Base stale-state/hash evidence principles to the tool-state reconciliation.
- `TEST`: live expected/actual version and READY lifecycle through the authorized HiGodot route, then focused Task8 GUT RED.
- `AVOID`: rolling back to v3.1.3 to satisfy stale tests; version-string-only reconciliation; GitHub protected-source authoring; fabricated authoring receipt or live-readiness evidence.
- `REFERENCE_ONLY`: v3.1.4 GridMap/CSG additions for this work unit; they do not alter Task8 product scope.

## TDD evidence

Initial RED head:

`4280e717294d3b760c8fd863bbc8742226b70727`

At that head, the new v3.1.4 contract proved the tracked tree test already passed while evidence/current-state/human-canon tests intentionally failed. This isolated the defect to stale current authority/canon rather than addon corruption.

Subsequent GREEN work:

- added `docs/validation/HIGODOT_V3_1_4_VENDOR_INTEGRITY.json`;
- promoted current machine canon to v3.1.4 exact-tree identity;
- preserved v3.1.2/v3.1.3 evidence as historical predecessor state;
- changed active authority validation from v3.1.3-current to v3.1.4-current + v3.1.3-historical;
- advanced v4.3/v4.4 successor tests without rewriting their historical contracts;
- corrected current human consumers to Sync19;
- preserved GUT as deterministic test authority and Hera as live QA/observability only.

## Sheet reconciliation

The original GitHub↔Sheet conflict was real: GitHub tracked v3.1.4 exact tree while the Sheet still described tracked v3.1.3 / v3.1.4 unverified.

Sync19 was written to the Sheet with the same Decision ID and read back successfully. Current Sheet semantics are:

```yaml
tracked_v3_1_4: PASS_EXACT_TREE_IDENTITY
sync19_sheet: SHEET_WRITE_READBACK_PASS
live_v3_1_4_handshake: NOT_VERIFIED
direct_257a0dba_authoring_receipt: NOT_VERIFIED
protected_task8_authoring: BLOCKED_UNTIL_AUTHORIZED_LIVE_ALIGNMENT_READBACK
```

v3.1.3 Sync04/05 remains historical provenance; it was not deleted or retroactively rewritten.

## Adversarial boundary

This sync must fail closed if any later consumer claims any of the following without new evidence:

- live `expected_version == actual_version == 3.1.4`;
- lifecycle/handshake `READY`;
- direct commit `257a0dba...` has a verified HiGodot authoring receipt;
- tracked-tree identity alone authorizes protected Task8 authoring;
- Task8 persistent `.gd/.tscn/.tres/.res/project.godot` mutation was performed by this reconciliation;
- v3.1.3 historical evidence is current again;
- GUT/Hera authority changed;
- human/device/performance/export/full-slice evidence became PASS.

## Current product boundary

Task8 remains a thin UI consumer of the already-merged Task5 Stage3 authority:

```text
SpellWorkflowCoordinator.select_prepared_spell(...)
→ prepare_target_preview(...)
→ request_use_confirmation()
→ confirm_use(transaction_id)
→ AtomicSpellUseService.use(...)
```

The next protected sequence remains:

```text
Sync19 exact-head CI/review/merge/readback
→ authorized HiGodot v3.1.4 expected/actual/READY readback
→ focused Task8 GUT RED
→ minimum Spell Use Screen GREEN via HiGodot
→ fresh HiGodot receipt/readback
→ Task5/6/7 regressions
→ Hera live QA with source delta NONE
→ exact-head CI
```

No new product decision was introduced by Sync19.

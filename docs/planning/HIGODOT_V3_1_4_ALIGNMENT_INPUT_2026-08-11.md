# HiGodot v3.1.4 Alignment Input — Task 8

```yaml
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
sync_id: GR-SYNC-20260811-17-TASK8-RESUME-V314-PREFLIGHT
work_unit: TASK8_SPELL_USE_SCREEN_RESUME
same_work_unit_research_receipt_reused: true
project_main_at_handoff_start: 821ad1255ebc620e1a9e14a1e27bc2af1844de4b
tracked_project_plugin_version: v3.1.3
user_reported_live_version: v3.1.4
official_upstream_tag_commit: 96cc8b8c3d25ce487e24801d01d5214fea150349
official_plugin_zip_sha256: 77d5bc7f8e0062f88aef08f3471cc6e4546a0d71d18813752781689ab6ce4848
persistent_godot_mutation_in_this_handoff: NONE
```

## Purpose

Provide the exact input and fail-closed criteria for the authorized HiGodot/Godot AI executor before persistent Task 8 Spell Use Screen authoring begins.

This document does **not** upgrade the tracked addon, does **not** authorize GitHub text writes to protected Godot source, and does **not** claim that the local project is already aligned to v3.1.4.

## Why exact alignment is required

Official HiGodot v3.1.4 implements a strict plugin/server version contract. Its compatibility function returns compatible only when the live server version exactly equals the plugin's expected version; otherwise the reason is `version_mismatch`. The lifecycle state model treats a mismatched live server as incompatible rather than READY.

Therefore this pairing is not an accepted steady state:

```text
tracked/editor plugin v3.1.3
↔ live godot-ai server v3.1.4
```

Do not continue protected Task 8 authoring from a mixed-version connection.

## Official upstream v3.1.3 → v3.1.4 plugin-subtree delta

Official v3.1.4 is four commits ahead of v3.1.3. The plugin subtree changed in these files:

```text
plugin/addons/godot_ai/client_configurator.gd
plugin/addons/godot_ai/clients/_base.gd
plugin/addons/godot_ai/clients/antigravity.gd
plugin/addons/godot_ai/handlers/csg_handler.gd                     NEW
plugin/addons/godot_ai/handlers/csg_handler.gd.uid                 NEW
plugin/addons/godot_ai/handlers/gridmap_handler.gd                 NEW
plugin/addons/godot_ai/handlers/gridmap_handler.gd.uid             NEW
plugin/addons/godot_ai/plugin.cfg
plugin/addons/godot_ai/plugin.gd
plugin/addons/godot_ai/tool_catalog.gd
plugin/addons/godot_ai/utils/server_lifecycle.gd
```

Upstream release-level changes include:

- GridMap and CSG authoring tools for 3D map building;
- Antigravity Windows launcher handling update;
- server startup/handshake worker-slot lifecycle fix;
- version bump to v3.1.4.

A version-string-only edit is therefore forbidden as a v3.1.4 reconciliation strategy.

## Authorized alignment pass criteria

Before the first persistent Task 8 product mutation, obtain a fresh HiGodot readback and satisfy **all** applicable criteria:

1. Live executor/server reports `v3.1.4`.
2. Editor/project plugin expected version reports `v3.1.4`.
3. Plugin/server handshake reaches `READY` with `expected_version == actual_version == 3.1.4`.
4. If the project-tracked `addons/godot_ai` subtree is upgraded, the protected vendor delta is authored through the authorized HiGodot route and covered by a fresh authoring receipt.
5. The tracked plugin subtree is reconciled against the intended official v3.1.4 plugin artifact/tree, not merely `plugin.cfg`.
6. New upstream files such as GridMap/CSG handlers and their `.gd.uid` files are included if the chosen official v3.1.4 package contains them.
7. Any vendor/tool-state delta is isolated from the Task 8 product delta in evidence so tool reconciliation cannot obscure product changes.
8. No persistent addon/product `.gd/.tscn/.tres/.res/project.godot` mutation is performed through GitHub as a HiGodot bypass.
9. GUT remains deterministic GDScript test authority; Hera remains live QA/observability only.
10. Unsupported human/device/performance/export/full-slice evidence is not promoted.

If any required criterion cannot be evidenced, disposition is:

```yaml
alignment_status: BLOCKED_UNVERIFIED
persistent_task8_authoring: STOP
```

## If local live 3.1.4 and tracked repo 3.1.3 are intentionally separated

An explicit separation is acceptable only if fresh evidence proves there is no mixed-version plugin/server connection used for protected authoring. The evidence must identify:

- which plugin instance is loaded by the editor;
- which server instance it connects to;
- expected and actual versions from the live handshake;
- which tracked/untracked files differ from repository main;
- why the tracked v3.1.3 subtree is not the plugin participating in the v3.1.4 authoring session.

Do not infer separation from installation paths or user reports alone.

## Task 8 action immediately after alignment PASS

Use the already-approved current interfaces and plan; do not redesign Stage 3:

```text
SpellWorkflowCoordinator.select_prepared_spell(...)
→ prepare_target_preview(...)
→ request_use_confirmation()
→ confirm_use(transaction_id)
→ AtomicSpellUseService.use(...)
```

Then execute:

```text
fresh alignment PASS/readback
→ focused Task 8 GUT RED
→ minimum Spell Use Screen authoring via HiGodot
→ focused GREEN
→ Task5/6/7 + workflow regressions
→ fresh HiGodot protected-delta receipt/readback
→ Hera live acceptance with HERA_SOURCE_DELTA: NONE
→ exact-head CI
→ adversarial review
→ merge/readback/Sheet sync
```

## Task 8 product boundaries preserved

Task 8 remains a thin UI adapter. It must not introduce:

- a second target/use transaction authority;
- local Mana spend or rollback logic;
- local inventory/prepared-spell consumption logic;
- local result commit authority;
- hidden auto-targeting;
- preview-time mutation;
- a touch-only semantic path;
- Task 9's full responsive/device-validation ownership.

## Evidence boundary for this handoff

```yaml
product_decision_changed: false
persistent_godot_source_mutation: NONE
tracked_v3_1_4_claim: NOT_YET_VERIFIED
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
export_validation: NOT_RUN
full_vertical_slice_runtime: NOT_RUN
next_authorized_protected_action: HIGODOT_V3_1_4_EXACT_ALIGNMENT_READBACK_THEN_TASK8_GUT_RED
```
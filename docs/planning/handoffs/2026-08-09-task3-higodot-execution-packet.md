# Task 3 HiGodot Execution Packet — 2026-08-09

## Authority and scope

```yaml
decision_id: GM-SPELL-WORKFLOW-UI-V2-01
entry_sync_id: GR-SYNC-20260809-08-SPELL-WORKFLOW-TASK3-CONTINUOUS-ENTRY
plan: docs/superpowers/plans/2026-08-06-spell-workflow-ui-v2-implementation-plan.md
plan_unit: "Task 3: Immutable Prepared Spell and Exactly-once Inventory"
continuous_work: CONTINUOUS_WORK_ACTIVE
current_entry_main_observed: 0c0be6798a65d6f5e0a478404d46c169d56aee19
base_main_observed: 2a6ced23f6d6de1fb6e0a281c7138beb03f1a13b
execution_route_state: DEFERRED_EXTERNAL_EXECUTOR
required_persistent_authority: HIGODOT_ONLY_WITH_AUTHORING_RECEIPT_GATE
```

This packet does not authorize a new product outcome. It packages the next ready unit of the already approved Spell Workflow UI v2 plan for a callable HiGodot-enabled executor. At execution start, re-read Base, GitHub default branch/open PRs/latest commit, and the project Google Sheet before authoring anything.

## Preserved product boundaries

- Preserve `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` and `FIVE_POINT_STAR`.
- Stage 2 consumes glyph resources exactly once and does not spend mana.
- Stage 3 spends mana/applies the result exactly once and does not consume glyph resources.
- Target selection remains Stage 3 only.
- Task 3 introduces the prepared-spell value/inventory boundary only; it does not implement Task 4 or Task 5 behavior early.
- Three-screen runtime, Windows/Android export/device, accessibility, performance, human validation, and visual/audio completion remain unclaimed.

## Task 3 planned files

Persistent `.gd` writes are HiGodot-only.

- Create `src/core/spells/prepared_spell.gd`.
- Create `src/core/spells/prepared_spell_inventory.gd`.
- Create `tests/unit/test_prepared_spell_inventory.gd`.
- Modify `tests/test_runner.gd` only to register the Task 3 suite.

Do not modify `project.godot`, scenes, UI files, mana services, Stage 3 use services, or unrelated runtime code in this task.

## Required TDD sequence

### 1. Fresh-state readback

Before product mutation, record the fresh GitHub `main` SHA and ensure there is no conflicting open implementation PR. Create an isolated Task 3 branch/worktree from that exact main. Confirm the HiGodot/Godot AI editor session and version by live readback.

### 2. `TASK3_TDD_RED`

Through HiGodot, author `tests/unit/test_prepared_spell_inventory.gd` first and register it in `tests/test_runner.gd`. Cover at minimum:

1. `PreparedSpell` deep-copies all input dictionaries/arrays so later caller mutation cannot change the stored value.
2. Duplicate `add_once(preparation_transaction_id, spell)` returns the original stored spell/result without creating a duplicate.
3. A different preparation transaction cannot reuse an existing `spell_id`.
4. A prepared spell can be marked used exactly once.
5. Repeating the same `use_transaction_id` returns the original first result/idempotent outcome.
6. A different use transaction after consumption returns `SPELL_ALREADY_USED`.
7. Public reads are deep copies.
8. `serialize()` is deterministic and `restore()` round-trips the state without weakening exactly-once behavior.

Run the project headless test runner and capture an intentional RED caused by missing Task 3 implementation, not by syntax/import damage or unrelated failures.

### 3. Minimal GREEN implementation

Through HiGodot, create `src/core/spells/prepared_spell.gd` with the approved immutable value fields:

```text
spell_id: StringName
layout: FIVE_POINT_STAR
main: Dictionary
auxiliaries: Array
base_preview: Dictionary
source_records: Array
status: READY
```

Reject empty IDs, missing Main, more than five auxiliaries, or a `base_preview` without both `success_percent` and `final_mana`. The Stage 2 `final_mana` value is an estimate only and must not spend mana.

Through HiGodot, create `src/core/spells/prepared_spell_inventory.gd` using the planned dictionaries:

```text
_spells_by_id
_spell_id_by_preparation_transaction
_use_transaction_by_spell_id
```

All public reads return deep copies. `serialize()` emits deterministically sorted arrays. `restore()` fails closed on malformed/conflicting state. Do not introduce Stage 3 target selection or mana mutation here.

### 3A. State-model hardening — `IMMUTABLE_PAYLOAD_INVENTORY_LIFECYCLE`

This section resolves implementation ambiguities without changing the approved product outcome.

- `PreparedSpell payload remains immutable after creation`: the deep-copied spell payload stored at preparation time is never rewritten in place to represent later use.
- `READY` versus `USED` is inventory-owned lifecycle state. `_use_transaction_by_spell_id` is the usage authority; it must not be replaced by mutating caller-owned or stored prepared-spell payload data.
- A public `spell(spell_id)` read derives `USED` when `_use_transaction_by_spell_id` contains that spell ID, otherwise derives `READY`, and returns only a deep copy. The stored immutable payload remains the preparation-time value.
- The serialized immutable spell payload must retain `status: READY`. `USED` is a derived public lifecycle status and must never be persisted by rewriting the immutable base payload.
- `add_once()` rejects an empty `preparation_transaction_id` with no mutation. `mark_used_once()` rejects an empty `use_transaction_id` with no mutation. Empty `spell_id` remains invalid at `PreparedSpell.create()` and must not enter inventory state.
- Retrying the same preparation transaction is idempotent even if the caller supplies a different candidate spell: the same preparation transaction with a different candidate spell returns the original first add result and does not replace or duplicate the stored spell.
- A different preparation transaction attempting to reuse an existing `spell_id` fails closed and must not alter either transaction index or spell state.
- Repeating the same `use_transaction_id` for the same spell returns the original first use outcome; a different use transaction after consumption returns `SPELL_ALREADY_USED`.
- `USE_TRANSACTION_SINGLE_OWNER`: one non-empty use transaction may belong to exactly one spell in an inventory. The same `use_transaction_id` cannot be rebound to a different spell. If a transaction already belongs to another spell, `mark_used_once()` fails closed with `USE_TRANSACTION_CONFLICT` and leaves all inventory state unchanged. With the planned three-dictionary design, checking existing use-transaction values is sufficient; do not add a fourth persistent index solely for this rule.
- `serialize()` must make all three indexes reconstructable and deterministic. Sort spell records by string form of `spell_id`, preparation mappings by string form of transaction ID, and use mappings by string form of `spell_id`; serialize deep copies only.
- `restore()` is validate-then-swap: validate the entire candidate state in temporary structures before replacing live dictionaries. Any malformed type, empty identifier, duplicate/conflicting mapping, missing referenced spell, inconsistent usage relationship, or duplicated use transaction assigned to multiple spells returns `false` with the pre-call inventory state unchanged.
- `restore()` rejects a serialized immutable spell payload whose base `status` is anything other than `READY`. It must preserve the immutable-payload/inventory-lifecycle split after round-trip: restored public reads derive lifecycle status from the restored use index rather than trusting a caller-supplied mutable status override.

The Task 3 GDScript tests must exercise these rules in addition to the eight minimum cases above. In particular, include mutation-after-add/read checks, empty idempotency-key checks, same-preparation/different-candidate replay, cross-spell same-use-transaction collision, malformed restore atomicity, non-READY base-payload restore rejection, and READY→USED derived-status round-trip.

### 4. Regression verification

Run the full deterministic legacy/headless suite and the adopted GUT suites. Existing Task 1/2, star runtime, typed stock, reservation recovery, and exactly-once tests must stay green. Run the applicable Python contract tests as well.

### 5. Hera acceptance observability

Hera is `LIVE_QA_AND_OBSERVABILITY_ONLY`. Use it only to observe the running/editor state if useful. Verify repository source delta before/after Hera is `NONE`; Hera must not persistently author or repair source.

## Fresh HiGodot receipt requirements

A Task 3 product merge is forbidden until a fresh receipt passes readback. Mirror the Task 2 receipt discipline and fail closed on omissions.

The receipt must record:

- a new Task 3 receipt ID under `GM-SPELL-WORKFLOW-UI-V2-01`;
- exact base commit and Task 3 result commit;
- HiGodot/Godot AI plugin/server version and live session ID;
- exact project path readback;
- every persistent Godot artifact changed for Task 3, including any Godot-generated `.gd.uid` files;
- before/after SHA-256 for every protected artifact (`ABSENT` for new files);
- HiGodot operation/readback evidence for each authored script;
- proof that unrelated editor serialization/generated deltas were restored rather than silently included;
- limitations that remain `NOT_RUN`;
- final protected-delta reconciliation status.

Expected protected Task 3 delta is limited to the planned `.gd` files plus any generated UID companions. If any other protected path changes, stop and reconcile before proceeding.

## Completion gate for this task

Task 3 may be called implemented only when all are true:

```yaml
TASK3_TDD_RED: RECORDED
TASK3_GREEN: PASS
TASK3_HIGODOT_RECEIPT_READBACK: PASS
LEGACY_REGRESSION: PASS
GUT_DETERMINISTIC_TASK3_TESTING: PASS
HERA_SOURCE_DELTA: NONE
EXACT_HEAD_APPLICABLE_CI: PASS
UNRESOLVED_REVIEW_THREADS: 0
P0_P1_BLOCKERS: 0
```

Until a callable HiGodot executor performs the above, product authoring stays `DEFERRED_EXTERNAL_EXECUTOR`; this ChatGPT session must not substitute GitHub text writes for persistent `.gd` authoring.

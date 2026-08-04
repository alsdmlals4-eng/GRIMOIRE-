# Glyph Resource Foundation POC Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement the approved Exact Glyph Vault and Universal Glyph Stock resource lifecycle as pure, headless-tested Godot domain code that can later bind to the 3×3 circuit UI without creating finished game content.

**Architecture:** Keep resource rules in focused `RefCounted` classes with no SceneTree or UI dependency. `VaultInventory` owns exact-glyph slots, `UniversalStockPool` owns fungible Stock, `ResourceReservationLedger` enforces one explicit source per glyph node, and `AtomicSpellCommitService` coordinates reservations, mana, and exactly-once results. UI receives a read-only view model and cannot mutate domain state directly.

**Tech Stack:** Godot 4.7.1 stable, typed GDScript, the repository headless test runner, Python 3.12 scope/contract tests, JSON validation artifacts, GitHub Actions.

## Global Constraints

- Decision: `GM-GLYPH-VAULT-UNIVERSAL-STOCK-01`.
- Vocabulary dependency: `GM-GLYPH-VOCABULARY-V1-01`.
- Foundation dependency: `docs/superpowers/plans/2026-08-03-foundation-poc-codex-execution-overlay.md`.
- Execution starts in an isolated Codex worktree created with `superpowers:using-git-worktrees`.
- `RED_TEST_WRITTEN_FIRST` is mandatory for every behavior change.
- `EXACT_GLYPH_VAULT` entries may place only their stored `glyph_id`.
- `UNIVERSAL_GLYPH_STOCK` may place one learned Main or Support glyph chosen at use time.
- `EXPLICIT_SOURCE_SELECTION` is mandatory when both sources are available.
- `SEPARATE_VAULT_AND_STOCK_CAPACITY` is mandatory.
- `RESOURCE_RESERVATION_DOES_NOT_CREATE_EXTRA_CAPACITY_USAGE` is mandatory.
- Target nodes and edges consume neither Vault nor Stock.
- Every successful spell Commit consumes mana.
- Completed-spell one-tap Stock does not exist.
- Natural charge produces Universal Stock only through one shared progress meter.
- Focus Scribe writes one exact glyph into a reserved Vault slot only.
- Product art, final balance, real content, ML, and release claims remain prohibited.
- Every visible harness state displays `POC / TEST_VALUE / NOT_CONTENT_COMPLETE`.
- Runtime, mobile device, performance, accessibility, and human validation remain `NOT_RUN` until actually executed.

---

## File Map

```text
src/core/resources/glyph_resource_types.gd          Shared enums and immutable reservation record helpers
src/core/resources/universal_stock_pool.gd          Fungible Stock capacity, reserve, release, consume, add
src/core/resources/vault_inventory.gd               Exact glyph slots and Focus Scribe slot lifecycle
src/core/resources/resource_reservation_ledger.gd   Explicit source selection and node-to-reservation ownership
src/core/resources/universal_stock_charge.gd        Single Active Pressure charge progress and hit pause
src/core/resources/mana_pool.gd                     Minimal POC mana reservation and consumption
src/core/spells/spell_commit_request.gd              Immutable commit request data
src/core/spells/atomic_spell_commit_service.gd       Exactly-once Stock/Vault/Mana/result transaction
src/persistence/glyph_resource_snapshot.gd          Schema-v1 resource serialization and validation
src/ui/glyph_resource_view_model.gd                  Read-only labels, counts, and source choices for UI
tests/unit/test_universal_stock_pool.gd              Universal Stock unit contracts
tests/unit/test_vault_inventory.gd                   Exact Vault and Focus Scribe contracts
tests/unit/test_resource_reservation_ledger.gd       Explicit source and cancellation contracts
tests/unit/test_universal_stock_charge.gd            Single charge progress and pause contracts
tests/unit/test_atomic_spell_commit_service.gd       Atomic consumption and exactly-once contracts
tests/unit/test_glyph_resource_snapshot.gd           Save/resume validation contracts
tests/unit/test_glyph_resource_view_model.gd         Color-independent UI data contracts
tests/integration/test_glyph_resource_lifecycle.gd   End-to-end reserve, cancel, commit, and resume flow
artifacts/foundation-poc/glyph-resource-report.json  Generated automated evidence
```

## Public Interfaces

```gdscript
class_name VaultInventory
static func create(slot_capacity: int) -> VaultInventory
func reserve_matching(glyph_id: StringName, node_id: StringName, transaction_id: StringName) -> Dictionary
func reserve_for_scribe(glyph_id: StringName, transaction_id: StringName) -> Dictionary
func complete_scribe(reservation_id: StringName) -> bool
func release(reservation_id: StringName) -> bool
func consume(reservation_id: StringName) -> bool
func matching_available_count(glyph_id: StringName) -> int
func to_dict() -> Dictionary

class_name UniversalStockPool
static func create(capacity: int) -> UniversalStockPool
func add_one() -> bool
func reserve(glyph_id: StringName, node_id: StringName, transaction_id: StringName) -> Dictionary
func release(reservation_id: StringName) -> bool
func consume(reservation_id: StringName) -> bool
func available_count() -> int
func to_dict() -> Dictionary

class_name ResourceReservationLedger
static func create(stock: UniversalStockPool, vault: VaultInventory) -> ResourceReservationLedger
func available_sources(glyph_id: StringName, learned: bool) -> Array[int]
func reserve_node(node_id: StringName, glyph_id: StringName, source: int, transaction_id: StringName, learned: bool) -> Dictionary
func release_node(node_id: StringName) -> bool
func consume_transaction(transaction_id: StringName) -> bool
func reservation_ids_for_transaction(transaction_id: StringName) -> Array[StringName]

class_name AtomicSpellCommitService
static func create(result_ledger: AtomicResultLedger) -> AtomicSpellCommitService
func commit(request: SpellCommitRequest, reservations: ResourceReservationLedger, mana: ManaPool) -> Dictionary
```

---

### Task 1: Add Resource Types and Register the New Test Suites

**Files:**
- Create: `src/core/resources/glyph_resource_types.gd`
- Create: `tests/unit/test_glyph_resource_types.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: the Foundation POC test runner.
- Produces: `GlyphResourceTypes.Source`, `GlyphResourceTypes.VaultSlotState`, and deterministic reservation IDs used by every later task.

- [ ] **Step 1: Write the failing test**

```gdscript
# tests/unit/test_glyph_resource_types.gd
extends RefCounted

const Types = preload("res://src/core/resources/glyph_resource_types.gd")

func run(case) -> void:
    case.assert_equal(0, Types.Source.UNIVERSAL_STOCK, "Stock source is stable")
    case.assert_equal(1, Types.Source.VAULT, "Vault source is stable")
    case.assert_equal(
        &"tx-1:node-2:1",
        Types.reservation_id(&"tx-1", &"node-2", Types.Source.VAULT),
        "reservation IDs are deterministic"
    )
```

Append the suite path to the explicit suite list in `tests/test_runner.gd`.

- [ ] **Step 2: Run the test and verify RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: FAIL because `glyph_resource_types.gd` does not exist.

- [ ] **Step 3: Implement the minimal shared types**

```gdscript
# src/core/resources/glyph_resource_types.gd
class_name GlyphResourceTypes
extends RefCounted

enum Source { UNIVERSAL_STOCK, VAULT }
enum VaultSlotState { EMPTY, AVAILABLE, RESERVED, RESERVED_FOR_SCRIBE }

static func reservation_id(
    transaction_id: StringName,
    node_id: StringName,
    source: int
) -> StringName:
    return StringName("%s:%s:%d" % [transaction_id, node_id, source])
```

- [ ] **Step 4: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/core/resources/glyph_resource_types.gd tests/unit/test_glyph_resource_types.gd tests/test_runner.gd
git commit -m "test: define glyph resource domain types"
```

Expected: all existing suites and the new type suite pass.

---

### Task 2: Implement UniversalStockPool Capacity and Reservation Semantics

**Files:**
- Create: `src/core/resources/universal_stock_pool.gd`
- Create: `tests/unit/test_universal_stock_pool.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `GlyphResourceTypes.reservation_id`.
- Produces: `UniversalStockPool` with fungible current count, reservation ownership, release, consume, and serialization.

- [ ] **Step 1: Write the failing tests**

```gdscript
# tests/unit/test_universal_stock_pool.gd
extends RefCounted

const Pool = preload("res://src/core/resources/universal_stock_pool.gd")

func run(case) -> void:
    var stock = Pool.create(2)
    case.assert_true(stock.add_one(), "first Stock fits")
    case.assert_true(stock.add_one(), "second Stock fits")
    case.assert_false(stock.add_one(), "capacity blocks third Stock")

    var reserved = stock.reserve(&"HEAT", &"node-a", &"tx-a")
    case.assert_equal(&"OK", reserved.status, "learned glyph choice reserves one fungible Stock")
    case.assert_equal(1, stock.available_count(), "reservation changes availability only")
    case.assert_equal(2, stock.current_total(), "reservation does not add capacity usage")

    case.assert_true(stock.release(reserved.reservation_id), "cancel releases reservation")
    case.assert_equal(2, stock.available_count(), "released Stock becomes available")

    var second = stock.reserve(&"FLOW", &"node-b", &"tx-b")
    case.assert_true(stock.consume(second.reservation_id), "commit consumes reservation")
    case.assert_equal(1, stock.current_total(), "consumption reduces total")
    case.assert_false(stock.consume(second.reservation_id), "duplicate consume is rejected")
```

- [ ] **Step 2: Run and verify RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: FAIL because `UniversalStockPool` is missing.

- [ ] **Step 3: Implement the minimal pool**

Use these internal fields exactly:

```gdscript
var _capacity: int
var _current_total: int = 0
var _reservations: Dictionary = {}
```

The constructor validates `capacity > 0`. `reserve()` returns:

```gdscript
{
    "status": &"OK",
    "reservation_id": reservation_id,
    "source": GlyphResourceTypes.Source.UNIVERSAL_STOCK,
    "glyph_id": glyph_id,
    "node_id": node_id,
    "transaction_id": transaction_id,
}
```

Reject duplicate reservation IDs with `DUPLICATE_RESERVATION`, and reject empty availability with `NO_UNIVERSAL_STOCK`. `available_count()` is `_current_total - _reservations.size()`.

- [ ] **Step 4: Add serialization tests before serialization code**

Add assertions that `to_dict()` returns `schema_version`, `capacity`, `current_total`, and sorted reservation records. Add `from_dict(data)` and reject `current_total > capacity` or duplicate reservation IDs with a structured error result.

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/core/resources/universal_stock_pool.gd tests/unit/test_universal_stock_pool.gd tests/test_runner.gd
git commit -m "feat: add universal glyph Stock pool"
```

---

### Task 3: Implement VaultInventory and Focus Scribe Slot Lifecycle

**Files:**
- Create: `src/core/resources/vault_inventory.gd`
- Create: `tests/unit/test_vault_inventory.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `GlyphResourceTypes.VaultSlotState` and deterministic reservation IDs.
- Produces: exact-glyph slot storage, exact matching, circuit reservations, and `RESERVED_FOR_SCRIBE` transitions.

- [ ] **Step 1: Write the failing tests**

```gdscript
# tests/unit/test_vault_inventory.gd
extends RefCounted

const Vault = preload("res://src/core/resources/vault_inventory.gd")

func run(case) -> void:
    var vault = Vault.create(2)
    var scribe = vault.reserve_for_scribe(&"HEAT", &"scribe-tx")
    case.assert_equal(&"OK", scribe.status, "empty slot is reserved for scribing")
    case.assert_true(vault.complete_scribe(scribe.reservation_id), "successful scribe fills exact glyph")
    case.assert_equal(1, vault.matching_available_count(&"HEAT"), "HEAT exists")
    case.assert_equal(0, vault.matching_available_count(&"FLOW"), "Vault does not convert glyphs")

    var wrong = vault.reserve_matching(&"FLOW", &"node-flow", &"tx-flow")
    case.assert_equal(&"NO_MATCHING_VAULT_GLYPH", wrong.status, "exact glyph rule is enforced")

    var heat = vault.reserve_matching(&"HEAT", &"node-heat", &"tx-heat")
    case.assert_equal(&"OK", heat.status, "matching exact glyph can be reserved")
    case.assert_true(vault.release(heat.reservation_id), "cancel restores the same slot")

    var pending = vault.reserve_for_scribe(&"FLOW", &"scribe-cancel")
    case.assert_true(vault.release(pending.reservation_id), "interrupted scribe releases slot")
    case.assert_equal(1, vault.empty_slot_count(), "released scribe slot is empty")
```

- [ ] **Step 2: Run and verify RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: FAIL because `VaultInventory` is missing.

- [ ] **Step 3: Implement exact slot records**

Each slot dictionary uses exactly:

```gdscript
{
    "slot_id": StringName,
    "glyph_id": StringName(),
    "state": GlyphResourceTypes.VaultSlotState.EMPTY,
    "reservation_id": StringName(),
    "transaction_id": StringName(),
    "node_id": StringName(),
}
```

`reserve_for_scribe()` changes one EMPTY slot to `RESERVED_FOR_SCRIBE`. `complete_scribe()` changes only that slot to AVAILABLE and keeps the selected exact `glyph_id`. `reserve_matching()` may select only AVAILABLE slots whose `glyph_id` exactly matches. `consume()` empties the reserved slot. No method may change a stored glyph into another glyph.

- [ ] **Step 4: Add corrupted-state and duplicate-event tests**

Test that `complete_scribe()` fails when called twice, a circuit reservation cannot consume a scribe reservation, and deserialization rejects duplicate `slot_id` or an AVAILABLE slot without `glyph_id`.

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/core/resources/vault_inventory.gd tests/unit/test_vault_inventory.gd tests/test_runner.gd
git commit -m "feat: add exact glyph Vault inventory"
```

---

### Task 4: Enforce Explicit Source Selection with ResourceReservationLedger

**Files:**
- Create: `src/core/resources/resource_reservation_ledger.gd`
- Create: `tests/unit/test_resource_reservation_ledger.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `UniversalStockPool`, `VaultInventory`, and `GlyphResourceTypes.Source`.
- Produces: one reservation per node, explicit source errors, cancellation, replacement, and transaction lookup.

- [ ] **Step 1: Write the failing tests**

```gdscript
# tests/unit/test_resource_reservation_ledger.gd
extends RefCounted

const Types = preload("res://src/core/resources/glyph_resource_types.gd")
const Pool = preload("res://src/core/resources/universal_stock_pool.gd")
const Vault = preload("res://src/core/resources/vault_inventory.gd")
const Ledger = preload("res://src/core/resources/resource_reservation_ledger.gd")

func run(case) -> void:
    var stock = Pool.create(2)
    stock.add_one()
    var vault = Vault.create(1)
    var scribe = vault.reserve_for_scribe(&"HEAT", &"scribe")
    vault.complete_scribe(scribe.reservation_id)
    var ledger = Ledger.create(stock, vault)

    case.assert_equal(
        [Types.Source.UNIVERSAL_STOCK, Types.Source.VAULT],
        ledger.available_sources(&"HEAT", true),
        "both sources are presented without automatic priority"
    )

    var missing_source = ledger.reserve_node(&"node-a", &"HEAT", -1, &"tx-a", true)
    case.assert_equal(&"SOURCE_SELECTION_REQUIRED", missing_source.status, "source must be explicit")

    var stock_choice = ledger.reserve_node(
        &"node-a", &"HEAT", Types.Source.UNIVERSAL_STOCK, &"tx-a", true
    )
    case.assert_equal(&"OK", stock_choice.status, "explicit Stock source reserves")
    case.assert_equal(&"NODE_ALREADY_RESERVED", ledger.reserve_node(
        &"node-a", &"HEAT", Types.Source.VAULT, &"tx-a", true
    ).status, "node cannot own two sources")

    case.assert_true(ledger.release_node(&"node-a"), "cancel releases selected source")
    case.assert_equal(1, stock.available_count(), "Stock is restored")

    var unlearned = ledger.reserve_node(
        &"node-b", &"PURIFY", Types.Source.UNIVERSAL_STOCK, &"tx-b", false
    )
    case.assert_equal(&"GLYPH_NOT_LEARNED", unlearned.status, "Stock cannot select unlearned glyph")
```

- [ ] **Step 2: Run and verify RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: FAIL because the ledger is missing.

- [ ] **Step 3: Implement minimal orchestration**

The ledger owns:

```gdscript
var _stock: UniversalStockPool
var _vault: VaultInventory
var _node_records: Dictionary = {}
var _transaction_nodes: Dictionary = {}
```

It never decrements capacity itself; it delegates reserve/release/consume to the selected source. `available_sources()` returns an empty array for unlearned glyphs and returns sources in stable UI order `[UNIVERSAL_STOCK, VAULT]` when both are available. No implicit fallback is allowed after an explicitly selected source fails.

- [ ] **Step 4: Add source replacement tests before replacement code**

Add `replace_node_source(node_id, new_source)` tests that release the prior reservation first, reserve the new source second, and restore the prior reservation when the new reservation fails. Return `REPLACEMENT_ROLLED_BACK` when rollback succeeds and `RESOURCE_STATE_CORRUPT` when rollback fails.

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/core/resources/resource_reservation_ledger.gd tests/unit/test_resource_reservation_ledger.gd tests/test_runner.gd
git commit -m "feat: require explicit glyph resource source"
```

---

### Task 5: Implement Single Universal Stock Charge Progress and Hit Pause

**Files:**
- Create: `src/core/resources/universal_stock_charge.gd`
- Create: `tests/unit/test_universal_stock_charge.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `UniversalStockPool`.
- Produces: one shared charge progress, Active Pressure advancement, capacity stop, direct-hit pause, and save data.

- [ ] **Step 1: Write the failing tests**

```gdscript
# tests/unit/test_universal_stock_charge.gd
extends RefCounted

const Pool = preload("res://src/core/resources/universal_stock_pool.gd")
const Charge = preload("res://src/core/resources/universal_stock_charge.gd")

func run(case) -> void:
    var stock = Pool.create(2)
    var charge = Charge.create(10.0)

    charge.advance_active_pressure(4.0, stock)
    case.assert_near(4.0, charge.progress_seconds(), 0.001, "one shared progress advances")
    case.assert_false(charge.has_target_glyph(), "universal charge has no glyph target")

    charge.apply_direct_hit_pause(0.5)
    charge.advance_active_pressure(0.25, stock)
    case.assert_near(4.0, charge.progress_seconds(), 0.001, "pause blocks charge advancement")
    charge.advance_active_pressure(0.25, stock)
    charge.advance_active_pressure(6.0, stock)
    case.assert_equal(1, stock.current_total(), "completion creates Universal Stock")
    case.assert_near(0.0, charge.progress_seconds(), 0.001, "progress resets after completion")

    stock.add_one()
    charge.advance_active_pressure(10.0, stock)
    case.assert_equal(2, stock.current_total(), "capacity remains full")
    case.assert_true(charge.waiting_for_capacity(), "full capacity pauses at completion boundary")
```

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: FAIL because the charge class is missing.

- [ ] **Step 3: Implement the minimal charge state**

Use:

```gdscript
var _required_seconds: float
var _progress_seconds: float = 0.0
var _pause_remaining_seconds: float = 0.0
var _waiting_for_capacity: bool = false
```

`advance_active_pressure(delta, stock)` first consumes pause time, then advances the single progress. When the threshold is reached, call `stock.add_one()`. If capacity is full, clamp progress to `_required_seconds` and set `_waiting_for_capacity = true`. After Stock is consumed, the next positive advance retries completion before adding new progress.

- [ ] **Step 4: Add exactly-once completion tests**

Simulate repeated frames at full progress and verify only one Stock is created. Serialize and restore at 9.5 seconds, then verify a resumed completion creates exactly one Stock.

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/core/resources/universal_stock_charge.gd tests/unit/test_universal_stock_charge.gd tests/test_runner.gd
git commit -m "feat: add single universal Stock charge progress"
```

---

### Task 6: Commit Reservations, Mana, and Results Atomically

**Files:**
- Create: `src/core/resources/mana_pool.gd`
- Create: `src/core/spells/spell_commit_request.gd`
- Create: `src/core/spells/atomic_spell_commit_service.gd`
- Create: `tests/unit/test_atomic_spell_commit_service.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `ResourceReservationLedger` and existing `AtomicResultLedger`.
- Produces: `AtomicSpellCommitService.commit()` with preflight, consume, rollback, and exactly-once response.

- [ ] **Step 1: Write the failing tests**

```gdscript
# tests/unit/test_atomic_spell_commit_service.gd
extends RefCounted

func run(case) -> void:
    var fixture = GlyphResourceFixture.with_stock_and_heat_vault()
    var heat = fixture.ledger.reserve_node(&"main", &"HEAT", fixture.types.Source.VAULT, &"spell-1", true)
    var flow = fixture.ledger.reserve_node(&"support", &"FLOW", fixture.types.Source.UNIVERSAL_STOCK, &"spell-1", true)
    case.assert_equal(&"OK", heat.status, "HEAT reserved")
    case.assert_equal(&"OK", flow.status, "FLOW reserved")

    var request = SpellCommitRequest.create(&"spell-1", 3, {"effect": &"HEAT_FLOW"})
    var first = fixture.service.commit(request, fixture.ledger, fixture.mana)
    case.assert_equal(&"COMMITTED", first.status, "valid transaction commits")
    case.assert_equal(2, fixture.mana.current(), "mana is consumed")
    case.assert_equal(0, fixture.vault.matching_available_count(&"HEAT"), "Vault entry is consumed")
    case.assert_equal(0, fixture.stock.current_total(), "Stock is consumed")

    var duplicate = fixture.service.commit(request, fixture.ledger, fixture.mana)
    case.assert_equal(first, duplicate, "duplicate transaction returns immutable first result")
```

Add separate tests for insufficient mana, invalid target, and missing reservation. All must leave resource and mana counts unchanged.

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: FAIL because commit classes are missing.

- [ ] **Step 3: Implement request and mana primitives**

`SpellCommitRequest` stores `transaction_id`, `mana_cost`, and a deep-duplicated `result_payload`. `ManaPool` supports `can_spend(amount)`, `spend(amount)`, and `refund(amount)`; it rejects negative amounts.

- [ ] **Step 4: Implement two-phase commit**

The service sequence is exact:

```text
1. Return prior immutable result when transaction_id already exists.
2. Validate mana and all transaction reservations without mutation.
3. Snapshot mana and resource dictionaries for rollback.
4. Consume all transaction reservations.
5. Spend mana.
6. Apply result through AtomicResultLedger.
7. On any failure, restore snapshots and return ROLLED_BACK.
8. Persist and return the immutable committed result.
```

Do not expose a path that applies the result before resource and mana validation.

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/core/resources/mana_pool.gd src/core/spells tests/unit/test_atomic_spell_commit_service.gd tests/test_runner.gd
git commit -m "feat: commit glyph resources and mana atomically"
```

---

### Task 7: Persist and Recover the Resource State Safely

**Files:**
- Create: `src/persistence/glyph_resource_snapshot.gd`
- Create: `tests/unit/test_glyph_resource_snapshot.gd`
- Create: `tests/integration/test_glyph_resource_lifecycle.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: all resource classes and Foundation `SaveRepository`.
- Produces: schema-v1 validated snapshot and an end-to-end reserve/cancel/commit/resume test.

- [ ] **Step 1: Write snapshot RED tests**

```gdscript
func run(case) -> void:
    var fixture = GlyphResourceFixture.with_stock_and_heat_vault()
    var snapshot = GlyphResourceSnapshot.capture(
        fixture.stock,
        fixture.vault,
        fixture.charge,
        fixture.ledger,
        fixture.mana
    )
    var restored = GlyphResourceSnapshot.restore(snapshot)
    case.assert_equal(&"OK", restored.status, "valid snapshot restores")
    case.assert_equal(snapshot, GlyphResourceSnapshot.capture(
        restored.stock,
        restored.vault,
        restored.charge,
        restored.ledger,
        restored.mana
    ), "round trip is deterministic")
```

Add invalid cases: Stock over capacity, duplicate Vault slot ID, missing transaction owner, reservation referencing an EMPTY slot, and negative mana. Each returns `CORRUPT_RESOURCE_SNAPSHOT` without auto-correcting or granting resources.

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

- [ ] **Step 3: Implement schema-v1 capture and restore**

Top-level fields are exactly:

```gdscript
{
    "schema_version": 1,
    "universal_stock": Dictionary,
    "vault": Dictionary,
    "charge": Dictionary,
    "reservations": Dictionary,
    "mana": Dictionary,
}
```

Restore validates all sections before constructing live objects. Do not partially restore a valid section beside a corrupt section.

- [ ] **Step 4: Add end-to-end integration test**

The integration suite performs:

```text
Stock+Vault available
→ choose explicit Vault for HEAT
→ choose explicit Stock for FLOW
→ save while both are reserved
→ restore
→ cancel FLOW and verify Stock returns
→ reserve FLOW again
→ Commit and verify Vault, Stock, mana, and result apply once
→ restore post-Commit snapshot
→ repeat Commit and verify no duplicate consumption/result
```

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/persistence/glyph_resource_snapshot.gd tests/unit/test_glyph_resource_snapshot.gd tests/integration/test_glyph_resource_lifecycle.gd tests/test_runner.gd
git commit -m "feat: persist glyph resource lifecycle safely"
```

---

### Task 8: Produce a Read-Only Resource View Model for Mobile UI

**Files:**
- Create: `src/ui/glyph_resource_view_model.gd`
- Create: `tests/unit/test_glyph_resource_view_model.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: domain read methods only.
- Produces: stable dictionaries for Vault slots, Stock counts, charge progress, and explicit source buttons.

- [ ] **Step 1: Write the failing test**

```gdscript
func run(case) -> void:
    var fixture = GlyphResourceFixture.with_stock_and_heat_vault()
    var model = GlyphResourceViewModel.build(&"HEAT", true, fixture.stock, fixture.vault, fixture.charge)
    case.assert_equal(&"HEAT", model.glyph_id, "selected glyph is named")
    case.assert_equal("Stock 1/2", model.stock.label, "Stock label is textual")
    case.assert_equal("보관함: 열 1", model.vault.label, "Vault label identifies exact glyph")
    case.assert_true(model.stock.enabled, "Stock source is enabled")
    case.assert_true(model.vault.enabled, "Vault source is enabled")
    case.assert_equal(&"SOURCE_SELECTION_REQUIRED", model.selection_state, "UI cannot auto-pick source")
    case.assert_true(model.stock.has("shape_key"), "state is not color-only")
    case.assert_true(model.vault.has("role_icon_key"), "role is not color-only")
```

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

- [ ] **Step 3: Implement the view model**

The builder returns plain dictionaries only. Required keys:

```text
glyph_id
stock: label, enabled, current, capacity, shape_key, role_icon_key
vault: label, enabled, matching_count, slot_capacity, shape_key, role_icon_key
charge: label, progress_ratio, waiting_for_capacity
selection_state
```

It must not expose mutation methods or a default selected source.

- [ ] **Step 4: Test 130%/200% copy safety**

Add tests that all labels are non-empty, use no color words as the only state, and remain under pre-registered character budgets: Stock label 24 characters, Vault label 32, charge label 32. Overflow becomes a test failure instead of truncating silently.

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/ui/glyph_resource_view_model.gd tests/unit/test_glyph_resource_view_model.gd tests/test_runner.gd
git commit -m "feat: expose glyph resources through read-only UI model"
```

---

### Task 9: Add CI, Evidence Report, and Stop Gate

**Files:**
- Modify: `.github/workflows/validate-foundation-poc.yml`
- Create: `tools/check_glyph_resource_scope.py`
- Create: `tests/test_glyph_resource_scope.py`
- Create after execution: `artifacts/foundation-poc/glyph-resource-report.json`
- Create after execution: `docs/validation/GLYPH_RESOURCE_POC_VALIDATION_REPORT.md`
- Create after execution: `docs/planning/GLYPH_RESOURCE_POC_STOP_GATE_01_2026-08-05.md`

**Interfaces:**
- Consumes: all unit/integration suites and current exact HEAD.
- Produces: reproducible CI result and an honest stop gate for the recognition/UI phase.

- [ ] **Step 1: Write the failing Python scope test**

```python
from __future__ import annotations

import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "tools/check_glyph_resource_scope.py"


class GlyphResourceScopeTests(unittest.TestCase):
    def test_scope_checker_accepts_only_approved_roots(self) -> None:
        self.assertTrue(SCRIPT.is_file())
        completed = subprocess.run(
            [sys.executable, str(SCRIPT)], cwd=ROOT, capture_output=True, text=True
        )
        self.assertEqual(0, completed.returncode, completed.stdout + completed.stderr)
```

- [ ] **Step 2: Run RED**

```bash
python -m unittest tests.test_glyph_resource_scope -v
```

Expected: FAIL because the scope checker is missing.

- [ ] **Step 3: Implement scope checks**

The checker requires the files in this plan, forbids `assets/final`, `audio/final`, `content/chapters`, `ml`, and `training-data`, and scans GDScript for prohibited tokens:

```text
COMPLETED_SPELL_STOCK
AUTO_SOURCE_PRIORITY
TYPED_GLYPH_ONLY_STOCK
stock_target_glyph_id
DRAWING_POWER_BONUS
```

- [ ] **Step 4: Add the exact validation commands to CI**

```yaml
- run: python -m unittest tests.test_glyph_resource_scope -v
- run: python tools/check_glyph_resource_scope.py
- run: godot --headless --path . --script res://tests/test_runner.gd
```

Use the repository-owned Godot provisioning path already approved in the Foundation POC workflow.

- [ ] **Step 5: Run complete verification on the exact HEAD**

```powershell
python tools/generate_project_operating_views.py --check
python -m unittest tests.test_base_v9_adoption tests.test_godot_toolchain_setup tests.test_glyph_resource_scope -v
python tools/check_glyph_resource_scope.py
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: every command exits `0`.

- [ ] **Step 6: Generate the evidence report**

`glyph-resource-report.json` records exact commit SHA, Godot version, test count, failures, Stock/Vault capacity values, duplicate transaction attempts, rollback checks, and statuses for physical device/accessibility/human validation. Unrun evidence remains `NOT_RUN`.

- [ ] **Step 7: Run adversarial review and write the stop gate**

The stop gate blocks recognition/UI integration when any of these are true:

```text
resource duplication or loss detected
implicit source selection exists
Vault glyph conversion exists
reservation double-counts capacity
Commit can consume without mana
failed Commit mutates state
resume can reapply a transaction
scope checker or headless tests fail
```

- [ ] **Step 8: Commit**

```bash
git add .github/workflows/validate-foundation-poc.yml tools/check_glyph_resource_scope.py tests/test_glyph_resource_scope.py artifacts/foundation-poc/glyph-resource-report.json docs/validation/GLYPH_RESOURCE_POC_VALIDATION_REPORT.md docs/planning/GLYPH_RESOURCE_POC_STOP_GATE_01_2026-08-05.md
git commit -m "test: validate glyph resource Foundation POC"
```

---

## Self-Review Results

- Spec coverage: Vault exact matching, Universal Stock, separate capacity, explicit source, natural charge, Focus Scribe, atomic Commit, save/resume, and UI read model each have a dedicated TDD task.
- Scope separation: recognition algorithms and visual glyph assets are excluded and handled by the separate Vocabulary Recognition plan.
- Placeholder scan: no `TBD`, generic “add tests,” or undefined implementation step remains.
- Type consistency: the public class and method names match across task interfaces and examples.
- Evidence boundary: automated headless behavior can pass; touch quality, readability, balance, and player comprehension remain `NOT_RUN` until measured.

## Execution Handoff

Recommended execution is **Subagent-Driven Development in Codex** using a fresh worker for each task and review after every GREEN commit. The alternative is inline `executing-plans` with checkpoints after Tasks 3, 6, and 9. Do not implement both this plan and the Recognition plan in one unreviewed commit series.

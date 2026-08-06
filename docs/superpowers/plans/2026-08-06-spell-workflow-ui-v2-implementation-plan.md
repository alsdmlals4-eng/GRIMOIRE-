# Spell Workflow UI v2 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a Godot 4.7.1 mobile-landscape workflow that separates glyph acquisition, spell preparation, and spell use while preserving the existing FIVE_POINT_STAR calculator, typed stock, vault, and exactly-once guarantees.

**Architecture:** Keep the existing star runtime intact as a compatibility baseline and add a new workflow layer. Stage 2 owns glyph reservations and consumes glyphs into an immutable `PreparedSpell`; Stage 3 consumes mana and applies the target result through a separate atomic transaction. Three focused screens exchange plain dictionaries through `SpellWorkflowCoordinator`; UI nodes never own inventory, mana, or result authority.

**Tech Stack:** Godot 4.7.1, GDScript, existing custom headless test runner, Python `unittest` contract tests, GitHub Actions, PR #77 `GrimoireThemeFactory` and `StarCircuitBoard`.

## Global Constraints

- Decision authority: `GM-SPELL-WORKFLOW-UI-V2-01`.
- Preserve runtime authority: `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` and `FIVE_POINT_STAR`.
- Resolution: 1280×720 Mobile Landscape, GL Compatibility.
- Minimum touch target: 48dp; Text Scale 130% must retain all primary information.
- Stage 2 consumes glyph resources exactly once and must not spend mana.
- Stage 3 spends mana and applies the result exactly once and must not consume glyph resources.
- Target selection exists only in Stage 3.
- Vault prepared count equals typed-stock prepared count; both are integers from 1 through 5.
- Common economy display is Gold only; spell cost display is Mana only.
- Incident explanation may reveal the problem, danger, required direction, and observed keywords, but never the exact glyph solution.
- `BURST` is a legacy alias for an `AMPLIFY` overload state and is not a separate v2 card.
- Existing `tests/unit/test_star_circuit_commit_coordinator.gd` and all current star-runtime suites remain green until the new root scene is ready.
- Actual Android/iOS, screen-reader, performance, and human validation remain `NOT_RUN` until physical evidence exists.
- PR #77 must either be merged before UI tasks begin or the implementation PR must remain a stacked Draft based on `agent/star-ui-kit-v1`; do not copy its theme implementation into this feature.

---

## File Structure

### Core domain

- Create: `src/core/glyphs/glyph_catalog.gd` — authoritative ten-glyph metadata and legacy alias normalization.
- Create: `src/core/workflow/glyph_source_loadout.gd` — equal-count 1–5 Vault/Stock preparation contract.
- Modify: `src/core/resources/resource_reservation_ledger.gd` — release all reservations for one transaction.
- Create: `src/core/spells/prepared_spell.gd` — immutable prepared-spell value object.
- Create: `src/core/spells/prepared_spell_inventory.gd` — exactly-once preparation and single-use state.
- Create: `src/core/spells/spell_preparation_request.gd` — Stage 2 commit request.
- Create: `src/core/spells/atomic_spell_preparation_service.gd` — consume glyph reservations and create a prepared spell without mana mutation.
- Create: `src/core/spells/spell_use_request.gd` — Stage 3 use request.
- Create: `src/core/spells/atomic_spell_use_service.gd` — spend mana, mark prepared spell used, and apply result atomically.
- Create: `src/core/workflow/circuit_placement_session.gd` — reserve/release source-specific glyphs while editing.
- Create: `src/core/workflow/spell_workflow_state.gd` — v2 state machine independent of legacy target-before-commit state.
- Create: `src/core/workflow/spell_workflow_coordinator.gd` — orchestrate Stage 2 preview/preparation and Stage 3 target/use.
- Modify: `src/ui/glyph_writing_view_model.gd` — consume `GlyphCatalog` instead of a six-glyph local table.

### UI

- Create: `src/ui/spell_workflow/spell_workflow_layout_model.gd`.
- Create: `src/ui/spell_workflow/spell_workflow_root.gd`.
- Create: `src/ui/spell_workflow/spell_workflow_root.tscn`.
- Create: `src/ui/spell_workflow/glyph_drawing_screen.gd`.
- Create: `src/ui/spell_workflow/glyph_drawing_screen.tscn`.
- Create: `src/ui/spell_workflow/circuit_placement_screen.gd`.
- Create: `src/ui/spell_workflow/circuit_placement_screen.tscn`.
- Create: `src/ui/spell_workflow/spell_use_screen.gd`.
- Create: `src/ui/spell_workflow/spell_use_screen.tscn`.
- Create: `src/ui/spell_workflow/components/incident_status_card.gd` and `.tscn`.
- Create: `src/ui/spell_workflow/components/incident_explanation_overlay.gd` and `.tscn`.
- Create: `src/ui/spell_workflow/components/glyph_source_panel.gd` and `.tscn`.
- Create: `src/ui/spell_workflow/components/glyph_card.gd` and `.tscn`.
- Create: `src/ui/spell_workflow/components/spell_preview_panel.gd` and `.tscn`.
- Create: `src/ui/spell_workflow/components/target_selection_panel.gd` and `.tscn`.
- Create: `src/ui/spell_workflow/components/expected_result_panel.gd` and `.tscn`.
- Modify only in the final task: `project.godot` — switch Main Scene after all automated and rendered evidence passes.

### Tests and evidence

- Create: `tests/test_spell_workflow_ui_v2_contract.py`.
- Create: `tests/unit/test_glyph_catalog.gd`.
- Create: `tests/unit/test_glyph_source_loadout.gd`.
- Modify: `tests/unit/test_resource_reservation_ledger.gd`.
- Create: `tests/unit/test_prepared_spell_inventory.gd`.
- Create: `tests/unit/test_atomic_spell_preparation_service.gd`.
- Create: `tests/unit/test_atomic_spell_use_service.gd`.
- Create: `tests/unit/test_circuit_placement_session.gd`.
- Create: `tests/unit/test_spell_workflow_state.gd`.
- Create: `tests/unit/test_spell_workflow_coordinator.gd`.
- Create: `tests/integration/test_spell_workflow_scene.gd`.
- Create: `tests/integration/test_spell_workflow_end_to_end.gd`.
- Modify: `tests/test_runner.gd`.
- Create: `tools/capture_spell_workflow_snapshots.gd`.
- Create: `.github/workflows/validate-spell-workflow-ui-v2.yml`.

---

### Task 1: RED Contract, Benchmark Boundary, and Glyph Catalog

**Files:**
- Create: `tests/test_spell_workflow_ui_v2_contract.py`
- Create: `src/core/glyphs/glyph_catalog.gd`
- Create: `tests/unit/test_glyph_catalog.gd`
- Modify: `src/ui/glyph_writing_view_model.gd`
- Modify: `tests/test_runner.gd`
- Create: `docs/planning/SPELL_WORKFLOW_UI_V2_IMPLEMENTATION_BENCHMARK_2026-08-06.md`

**Interfaces:**
- Produces: `GlyphCatalog.normalize_id(glyph_id: StringName) -> StringName`
- Produces: `GlyphCatalog.metadata(glyph_id: StringName) -> Dictionary`
- Produces: `GlyphCatalog.all_ids() -> Array[StringName]`
- Produces: `GlyphCatalog.drawable_vault_ids() -> Array[StringName]`
- Produces: `GlyphCatalog.is_main(glyph_id: StringName) -> bool`

- [ ] **Step 1: Write the Python contract test before creating implementation files**

```python
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]

class SpellWorkflowUiV2ContractTests(unittest.TestCase):
    def test_required_core_and_screen_files_exist(self):
        required = [
            "src/core/glyphs/glyph_catalog.gd",
            "src/core/spells/prepared_spell.gd",
            "src/core/spells/prepared_spell_inventory.gd",
            "src/core/workflow/spell_workflow_coordinator.gd",
            "src/ui/spell_workflow/spell_workflow_root.tscn",
        ]
        for path in required:
            self.assertTrue((ROOT / path).is_file(), path)

    def test_authority_tokens_and_stage_boundaries_are_present(self):
        combined = "\n".join(
            p.read_text(encoding="utf-8")
            for p in [
                ROOT / "docs/ACTIVE_CONTEXT.md",
                ROOT / "docs/DEVELOPMENT_GATES.md",
                ROOT / "docs/planning/CURRENT_CONFIRMED_DECISIONS.md",
            ]
        )
        for token in (
            "GM-SPELL-WORKFLOW-UI-V2-01",
            "GM-STAR-CIRCUIT-MASTERY-BALANCE-01",
            "FIVE_POINT_STAR",
            "MANA_ONLY_AT_SPELL_USE",
        ):
            self.assertIn(token, combined)
```

- [ ] **Step 2: Run the contract and confirm intentional RED**

Run: `python -m unittest tests.test_spell_workflow_ui_v2_contract -v`

Expected: FAIL because the v2 core and root-scene files do not exist.

- [ ] **Step 3: Write the benchmark boundary document**

Record these accepted implementation patterns:

```text
Existing GRIMOIRE baseline:
- RefCounted domain services
- explicit create(...) validation
- custom deterministic test runner
- UI as display/intent adapter

Accepted professional patterns:
- immutable prepared command between preparation and execution
- separate resource transactions for crafting and activation
- idempotency key per externally repeatable action
- rollback snapshots around multi-resource mutation
- one primary question and one primary action per mobile screen

Rejected patterns:
- one coordinator that consumes glyphs and mana in the same method
- target selection in the circuit screen
- UI animation signals as commit authority
- duplicated theme tokens outside PR #77 ThemeFactory
- silent legacy BURST card beside AMPLIFY
```

- [ ] **Step 4: Implement the ten-glyph catalog**

```gdscript
class_name GlyphCatalog
extends RefCounted

const ORDER: Array[StringName] = [
    &"HEAT", &"FLOW", &"PROTECT", &"COOL", &"MEND",
    &"FOCUS", &"DISPERSE", &"STABILIZE", &"SUSTAIN", &"AMPLIFY",
]

const META := {
    &"HEAT": {"name": "열", "role": &"MAIN", "shape_key": &"GLYPH_HEAT"},
    &"FLOW": {"name": "흐름", "role": &"MAIN", "shape_key": &"GLYPH_FLOW"},
    &"PROTECT": {"name": "보호", "role": &"MAIN", "shape_key": &"GLYPH_PROTECT"},
    &"COOL": {"name": "냉각", "role": &"MAIN", "shape_key": &"GLYPH_COOL"},
    &"MEND": {"name": "수복", "role": &"MAIN", "shape_key": &"GLYPH_MEND"},
    &"FOCUS": {"name": "집중", "role": &"AUX", "shape_key": &"GLYPH_FOCUS"},
    &"DISPERSE": {"name": "분산", "role": &"AUX", "shape_key": &"GLYPH_DISPERSE"},
    &"STABILIZE": {"name": "안정", "role": &"AUX", "shape_key": &"GLYPH_STABILIZE"},
    &"SUSTAIN": {"name": "지속", "role": &"AUX", "shape_key": &"GLYPH_SUSTAIN"},
    &"AMPLIFY": {"name": "증폭", "role": &"AUX", "shape_key": &"GLYPH_AMPLIFY"},
}

static func normalize_id(glyph_id: StringName) -> StringName:
    return &"AMPLIFY" if glyph_id == &"BURST" else glyph_id

static func metadata(glyph_id: StringName) -> Dictionary:
    return Dictionary(META.get(normalize_id(glyph_id), {})).duplicate(true)

static func all_ids() -> Array[StringName]:
    return ORDER.duplicate()

static func drawable_vault_ids() -> Array[StringName]:
    return [&"HEAT", &"FLOW", &"PROTECT", &"FOCUS", &"DISPERSE"]

static func is_main(glyph_id: StringName) -> bool:
    return StringName(metadata(glyph_id).get("role", &"")) == &"MAIN"
```

- [ ] **Step 5: Replace `GlyphWritingViewModel.GLYPH_META` reads with `GlyphCatalog.metadata()`**

Preload `res://src/core/glyphs/glyph_catalog.gd`; keep existing result-state copy unchanged. Normalize a selected legacy `BURST` before creating labels.

- [ ] **Step 6: Add GDScript tests**

Assert exact ordered IDs, five Main and five Aux entries, `FLOW` is Main, `BURST` normalizes to `AMPLIFY`, and drawable Vault IDs equal the approved five-item first slice.

- [ ] **Step 7: Run RED→GREEN checks**

Run:

```bash
python -m unittest tests.test_spell_workflow_ui_v2_contract -v
godot --headless --path . --script res://tests/test_runner.gd
```

Expected: Python contract remains RED only for files scheduled in later tasks; existing runner and new catalog suite PASS.

- [ ] **Step 8: Commit**

```bash
git add docs/planning/SPELL_WORKFLOW_UI_V2_IMPLEMENTATION_BENCHMARK_2026-08-06.md tests/test_spell_workflow_ui_v2_contract.py src/core/glyphs/glyph_catalog.gd src/ui/glyph_writing_view_model.gd tests/unit/test_glyph_catalog.gd tests/test_runner.gd
git commit -m "test: establish spell workflow v2 contract"
```

---

### Task 2: Equal-count Source Loadout and Transaction-wide Reservation Recovery

**Files:**
- Create: `src/core/workflow/glyph_source_loadout.gd`
- Create: `tests/unit/test_glyph_source_loadout.gd`
- Modify: `src/core/resources/resource_reservation_ledger.gd`
- Modify: `tests/unit/test_resource_reservation_ledger.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Produces: `GlyphSourceLoadout.create(vault_ids: Array[StringName], stock_ids: Array[StringName])`
- Produces: `GlyphSourceLoadout.to_dict() -> Dictionary`
- Produces: `ResourceReservationLedger.release_transaction(transaction_id: StringName) -> Dictionary`

- [ ] **Step 1: Write failing loadout tests**

```gdscript
var Loadout = load("res://src/core/workflow/glyph_source_loadout.gd")
case.assert_true(Loadout.create([&"HEAT"], [&"COOL"]) != null, "1+1 is valid")
case.assert_true(Loadout.create([&"HEAT", &"FLOW"], [&"COOL"]) == null, "unequal counts fail")
case.assert_true(Loadout.create([], []) == null, "zero count fails")
case.assert_true(Loadout.create([&"HEAT", &"FLOW", &"PROTECT", &"FOCUS", &"DISPERSE", &"MEND"], [&"COOL", &"MEND", &"STABILIZE", &"SUSTAIN", &"AMPLIFY", &"HEAT"]) == null, "six each fails")
```

- [ ] **Step 2: Run the suite and confirm RED**

Run: `godot --headless --path . --script res://tests/test_runner.gd`

Expected: FAIL because `glyph_source_loadout.gd` and `release_transaction` are missing.

- [ ] **Step 3: Implement `GlyphSourceLoadout`**

`create()` rejects count 0, count above 5, unequal counts, and unknown catalog IDs. `to_dict()` returns duplicated `vault_ids`, `stock_ids`, `count`, and `maximum_each: 5`.

- [ ] **Step 4: Add `release_transaction()` to the reservation ledger**

```gdscript
func release_transaction(transaction_id: StringName) -> Dictionary:
    if transaction_id.is_empty():
        return {"status": &"INVALID_TRANSACTION", "released_count": 0}
    var records := reservation_records_for_transaction(transaction_id)
    var released := 0
    for record_variant in records:
        var node_id := StringName(Dictionary(record_variant).get("node_id", &""))
        if not release_node(node_id):
            return {"status": &"RESOURCE_STATE_CORRUPT", "released_count": released}
        released += 1
    return {"status": &"OK", "released_count": released}
```

- [ ] **Step 5: Test isolation**

Reserve nodes for transactions `draft-a` and `draft-b`, release `draft-a`, and assert all `draft-b` reservations and source counts remain unchanged.

- [ ] **Step 6: Run all tests and commit**

```bash
godot --headless --path . --script res://tests/test_runner.gd
git add src/core/workflow/glyph_source_loadout.gd src/core/resources/resource_reservation_ledger.gd tests/unit/test_glyph_source_loadout.gd tests/unit/test_resource_reservation_ledger.gd tests/test_runner.gd
git commit -m "feat: add equal-count glyph source loadout"
```

---

### Task 3: Immutable Prepared Spell and Exactly-once Inventory

**Files:**
- Create: `src/core/spells/prepared_spell.gd`
- Create: `src/core/spells/prepared_spell_inventory.gd`
- Create: `tests/unit/test_prepared_spell_inventory.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Produces: `PreparedSpell.create(spell_id, main, auxiliaries, base_preview, source_records)`
- Produces: `PreparedSpell.to_dict() -> Dictionary`
- Produces: `PreparedSpellInventory.add_once(preparation_transaction_id, spell) -> Dictionary`
- Produces: `PreparedSpellInventory.spell(spell_id) -> Dictionary`
- Produces: `PreparedSpellInventory.mark_used_once(spell_id, use_transaction_id) -> Dictionary`
- Produces: `PreparedSpellInventory.serialize() -> Dictionary`
- Produces: `PreparedSpellInventory.restore(data: Dictionary) -> bool`

- [ ] **Step 1: Write failing inventory tests**

Cover: immutable copied input, duplicate preparation returns the original spell, different transaction cannot reuse an existing `spell_id`, one spell can be used once, duplicate same use transaction returns the first result, and a different use transaction receives `SPELL_ALREADY_USED`.

- [ ] **Step 2: Run and confirm RED**

Run: `godot --headless --path . --script res://tests/test_runner.gd`

- [ ] **Step 3: Implement `PreparedSpell`**

Required fields:

```gdscript
{
    "spell_id": StringName,
    "layout": &"FIVE_POINT_STAR",
    "main": Dictionary,
    "auxiliaries": Array,
    "base_preview": Dictionary,
    "source_records": Array,
    "status": &"READY",
}
```

Reject empty IDs, missing Main, more than five Aux entries, and any base preview without `success_percent` and `final_mana`. Treat Stage 2 `final_mana` as an estimate only; it is stored but not spent.

- [ ] **Step 4: Implement `PreparedSpellInventory`**

Use three dictionaries: `_spells_by_id`, `_spell_id_by_preparation_transaction`, and `_use_transaction_by_spell_id`. All public reads return deep copies. `serialize()` emits sorted arrays for deterministic tests.

- [ ] **Step 5: Run tests and commit**

```bash
godot --headless --path . --script res://tests/test_runner.gd
git add src/core/spells/prepared_spell.gd src/core/spells/prepared_spell_inventory.gd tests/unit/test_prepared_spell_inventory.gd tests/test_runner.gd
git commit -m "feat: add prepared spell inventory"
```

---

### Task 4: Stage 2 Placement Session and Atomic Glyph Preparation

**Files:**
- Create: `src/core/workflow/circuit_placement_session.gd`
- Create: `src/core/spells/spell_preparation_request.gd`
- Create: `src/core/spells/atomic_spell_preparation_service.gd`
- Create: `tests/unit/test_circuit_placement_session.gd`
- Create: `tests/unit/test_atomic_spell_preparation_service.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Produces: `CircuitPlacementSession.create(transaction_id, ledger)`
- Produces: `place_main(glyph: Dictionary) -> Dictionary`
- Produces: `place_auxiliary(slot: int, glyph: Dictionary) -> Dictionary`
- Produces: `remove_node(node_key: StringName) -> Dictionary`
- Produces: `reset() -> Dictionary`
- Produces: `draft() -> Dictionary`
- Produces: `SpellPreparationRequest.create(transaction_id, spell_id, draft, base_preview)`
- Produces: `AtomicSpellPreparationService.prepare(request, ledger, inventory) -> Dictionary`

- [ ] **Step 1: Write placement-session RED tests**

Use node IDs `StringName("%s:main" % transaction_id)` and `StringName("%s:aux-%s" % [transaction_id, slot])`. Assert placing immediately reserves the chosen source, replacing a node releases the old reservation before reserving the new source, reset releases only the current transaction, and no mana object is accepted by the API.

- [ ] **Step 2: Implement `CircuitPlacementSession` minimally**

The session stores copied glyph dictionaries only after `ledger.reserve_node()` returns `OK`. Main is required; Aux slots are integers 0–4. `draft()` returns `main`, sorted `auxiliaries`, and reservation records.

- [ ] **Step 3: Write preparation-service RED tests**

Test successful preparation consumes Vault/Stock and adds one READY spell while mana remains unchanged; duplicate preparation returns the same result; invalid reservation, inventory conflict, or consume failure restores ledger and inventory snapshots.

- [ ] **Step 4: Implement `SpellPreparationRequest`**

It exposes `transaction_id()`, `spell_id()`, `draft()`, and `base_preview()`. Reject empty IDs and invalid FIVE_POINT_STAR drafts.

- [ ] **Step 5: Implement `AtomicSpellPreparationService`**

Algorithm:

```text
return prior preparation result when idempotency key exists
validate transaction reservations
snapshot ledger and prepared-spell inventory
consume transaction glyph reservations
create immutable PreparedSpell
inventory.add_once(preparation_transaction_id, spell)
rollback both snapshots on any failure
return PREPARED with spell and consumed_count
```

Do not accept or preload `ManaPool` or `AtomicResultLedger` in this service.

- [ ] **Step 6: Run all tests and commit**

```bash
godot --headless --path . --script res://tests/test_runner.gd
git add src/core/workflow/circuit_placement_session.gd src/core/spells/spell_preparation_request.gd src/core/spells/atomic_spell_preparation_service.gd tests/unit/test_circuit_placement_session.gd tests/unit/test_atomic_spell_preparation_service.gd tests/test_runner.gd
git commit -m "feat: separate glyph preparation transaction"
```

---

### Task 5: Stage 3 Atomic Spell Use and v2 Workflow Coordinator

**Files:**
- Create: `src/core/spells/spell_use_request.gd`
- Create: `src/core/spells/atomic_spell_use_service.gd`
- Create: `src/core/workflow/spell_workflow_state.gd`
- Create: `src/core/workflow/spell_workflow_coordinator.gd`
- Create: `tests/unit/test_atomic_spell_use_service.gd`
- Create: `tests/unit/test_spell_workflow_state.gd`
- Create: `tests/unit/test_spell_workflow_coordinator.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Produces: `SpellUseRequest.create(use_transaction_id, spell_id, target_keyword, final_preview, result_payload)`
- Produces: `AtomicSpellUseService.use(request, inventory, mana_pool, result_ledger) -> Dictionary`
- Produces: `SpellWorkflowCoordinator.prepare_preview() -> Dictionary`
- Produces: `SpellWorkflowCoordinator.confirm_preparation(spell_id: StringName) -> Dictionary`
- Produces: `SpellWorkflowCoordinator.select_prepared_spell(spell_id: StringName) -> Dictionary`
- Produces: `SpellWorkflowCoordinator.prepare_target_preview(target_keyword, target, payload) -> Dictionary`
- Produces: `SpellWorkflowCoordinator.confirm_use(use_transaction_id: StringName) -> Dictionary`

- [ ] **Step 1: Write use-service RED tests**

Assert: target-invalid uses no mana and leaves spell READY; insufficient mana leaves spell READY; successful use spends only final mana, marks the spell USED, and commits one result; duplicate same use transaction spends nothing; different transaction cannot reuse the spell; result-apply failure restores mana and READY status.

- [ ] **Step 2: Implement `SpellUseRequest` and `AtomicSpellUseService`**

The service snapshots inventory, mana, and result ledger. It validates `target_valid`, a READY spell, and `mana_pool.can_spend(final_mana)` before mutation. Mutation order is mana spend → mark used → result ledger commit. Any failure restores all three snapshots.

- [ ] **Step 3: Write state-machine tests**

Allowed path:

```text
INCIDENT_BRIEF
→ GLYPH_DRAWING
→ CIRCUIT_EDIT
→ CIRCUIT_PREVIEW
→ SPELL_READY
→ SPELL_USE_TARGET
→ SPELL_USE_PREVIEW
→ SPELL_USE_CONFIRM
→ SYSTEM_RESOLVE
→ RESULT_EXPLAIN
```

Incident Overlay opens from any non-resolving screen and closes back to the exact previous state. Direct `CIRCUIT_PREVIEW → SPELL_USE_TARGET`, target selection in `CIRCUIT_EDIT`, and mana-spend state before `SPELL_USE_CONFIRM` are rejected.

- [ ] **Step 4: Implement `SpellWorkflowCoordinator` using existing validator and calculator**

Stage 2 calls `StarCircuitCalculator.preview(main, auxiliaries, {})`; Stage 3 calls the same calculator with the selected target. Preserve the stored Stage 2 base preview on `PreparedSpell`; never mutate it with target data.

- [ ] **Step 5: Add compatibility assertions**

Run the unchanged legacy `test_star_circuit_commit_coordinator.gd` and assert it still passes. The v2 coordinator must not modify or delete `StarCircuitCommitCoordinator` in this task.

- [ ] **Step 6: Run tests and commit**

```bash
godot --headless --path . --script res://tests/test_runner.gd
git add src/core/spells/spell_use_request.gd src/core/spells/atomic_spell_use_service.gd src/core/workflow/spell_workflow_state.gd src/core/workflow/spell_workflow_coordinator.gd tests/unit/test_atomic_spell_use_service.gd tests/unit/test_spell_workflow_state.gd tests/unit/test_spell_workflow_coordinator.gd tests/test_runner.gd
git commit -m "feat: separate target spell use transaction"
```

---

### Task 6: Incident Status, Explanation Overlay, and Glyph Drawing Screen

**Files:**
- Create: `src/ui/spell_workflow/components/incident_status_card.gd`
- Create: `src/ui/spell_workflow/components/incident_status_card.tscn`
- Create: `src/ui/spell_workflow/components/incident_explanation_overlay.gd`
- Create: `src/ui/spell_workflow/components/incident_explanation_overlay.tscn`
- Create: `src/ui/spell_workflow/glyph_drawing_screen.gd`
- Create: `src/ui/spell_workflow/glyph_drawing_screen.tscn`
- Create: `tests/integration/test_glyph_drawing_workflow_screen.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Screen consumes: incident dictionary, existing recognition adapter/service, Vault inventory, `GlyphWritingViewModel`.
- Screen emits: `glyph_saved(glyph_id: StringName)`, `open_incident_requested`, `continue_requested`.
- Overlay consumes: `problem`, `danger`, `required_direction`, `observed_keywords`.
- Overlay emits: `closed` and never mutates workflow state itself.

- [ ] **Step 1: Create a scene-contract test that fails before scenes exist**

Assert named nodes `CharacterPanel`, `IncidentStatusCard`, `GlyphProgressPanel`, `WritingCanvas`, `GlyphInfoPanel`, `RecognitionPanel`, `RetryButton`, and `SaveButton`; assert each action control minimum size is at least 48×48.

- [ ] **Step 2: Build the Incident components with PR #77 theme variations**

Use `AcademyPanel`, `AcademyButton`, `AcademyBadge`, and `StatusBanner` variations. Do not add per-node theme colors. Card text contains danger, one-line phenomenon, urgency, and `터치 시 상황 설명`.

- [ ] **Step 3: Build the Overlay restore contract**

Before opening, the root records `workflow_state.current_state()`, current focus owner path, selected glyph, stroke revision, and active reservations. Closing restores those values. The overlay never lists a glyph ID array or exact solution string.

- [ ] **Step 4: Build the drawing screen around existing recognition flow**

The first-slice drawable set is `HEAT`, `FLOW`, `PROTECT`, `FOCUS`, `DISPERSE`. Save confirmation calls the existing exactly-once Vault creation path only after recognition status is accepted. Failure, cancel, and retry create zero Vault items.

- [ ] **Step 5: Run screen tests and commit**

```bash
godot --headless --path . --script res://tests/test_runner.gd
git add src/ui/spell_workflow/components/incident_status_card.* src/ui/spell_workflow/components/incident_explanation_overlay.* src/ui/spell_workflow/glyph_drawing_screen.* tests/integration/test_glyph_drawing_workflow_screen.gd tests/test_runner.gd
git commit -m "feat: add glyph drawing workflow screen"
```

---

### Task 7: Circuit Placement Screen and Equal-count Source Panels

**Files:**
- Create: `src/ui/spell_workflow/components/glyph_card.gd`
- Create: `src/ui/spell_workflow/components/glyph_card.tscn`
- Create: `src/ui/spell_workflow/components/glyph_source_panel.gd`
- Create: `src/ui/spell_workflow/components/glyph_source_panel.tscn`
- Create: `src/ui/spell_workflow/components/spell_preview_panel.gd`
- Create: `src/ui/spell_workflow/components/spell_preview_panel.tscn`
- Create: `src/ui/spell_workflow/circuit_placement_screen.gd`
- Create: `src/ui/spell_workflow/circuit_placement_screen.tscn`
- Create: `tests/integration/test_circuit_placement_workflow_screen.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Screen consumes: `GlyphSourceLoadout.to_dict()`, placement-session snapshot, base preview.
- Screen emits: `place_main_requested`, `place_aux_requested`, `remove_requested`, `preview_requested`, `prepare_requested`, `reset_requested`, `undo_requested`.
- `GlyphCard.bind(data: Dictionary)` requires glyph name, role, source, remaining count, mastery/quality, and reservation state.

- [ ] **Step 1: Write the scene-contract RED test**

Assert two source panels each display the same count from 1 to 5, Main and Aux roles use text/icon/shape in addition to color, `StarCircuitBoard` is present, `TargetSelectionPanel` is absent, and Mana appears exactly once in `SpellPreviewPanel` as estimated cost.

- [ ] **Step 2: Build reusable cards and source panels**

Vault and Stock panels share one component and differ only by bound source metadata. Do not duplicate card scenes. A reserved card displays `예약됨` and its slot name; depleted cards are disabled but remain readable.

- [ ] **Step 3: Build the circuit screen using PR #77 `StarCircuitBoard`**

The screen maps v2 states to board visual states:

```text
CIRCUIT_EDIT -> EDIT
CIRCUIT_PREVIEW -> FINAL
preparation confirmation -> CONFIRM
prepared -> COMMITTED
validation failure -> INVALID
```

No Target button or target keyword button exists on this screen.

- [ ] **Step 4: Wire reservation recovery**

Reset and cancel call `CircuitPlacementSession.reset()`. Undo releases or restores only the last changed node. Closing Incident Overlay does not reset the placement session.

- [ ] **Step 5: Run tests and commit**

```bash
godot --headless --path . --script res://tests/test_runner.gd
git add src/ui/spell_workflow/components/glyph_card.* src/ui/spell_workflow/components/glyph_source_panel.* src/ui/spell_workflow/components/spell_preview_panel.* src/ui/spell_workflow/circuit_placement_screen.* tests/integration/test_circuit_placement_workflow_screen.gd tests/test_runner.gd
git commit -m "feat: add circuit placement workflow screen"
```

---

### Task 8: Spell Use Screen, Target Selection, and Expected Result

**Files:**
- Create: `src/ui/spell_workflow/components/target_selection_panel.gd`
- Create: `src/ui/spell_workflow/components/target_selection_panel.tscn`
- Create: `src/ui/spell_workflow/components/expected_result_panel.gd`
- Create: `src/ui/spell_workflow/components/expected_result_panel.tscn`
- Create: `src/ui/spell_workflow/spell_use_screen.gd`
- Create: `src/ui/spell_workflow/spell_use_screen.tscn`
- Create: `tests/integration/test_spell_use_workflow_screen.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Screen consumes: READY prepared spells, incident target nodes, target-applied final preview, current mana.
- Screen emits: `spell_selected`, `target_selected`, `preview_requested`, `use_requested`, `cancel_requested`.
- Expected result data: `success_percent`, `main_effect`, `risks`, `final_mana`, `target_keyword`.

- [ ] **Step 1: Write the scene-contract RED test**

Assert the screen contains prepared-spell list, scene target nodes, target panel, expected-result panel, and `주문 사용`; it contains no drawing canvas and no Vault/Stock placement controls. Mana appears once in expected result and once as current character MP, with distinct labels.

- [ ] **Step 2: Implement explicit target selection**

Target nodes remain unselected by default. Changing target invalidates the prior final preview and disables `주문 사용` until the coordinator produces a new preview.

- [ ] **Step 3: Implement use confirmation**

First press opens a confirmation state without mutation; second explicit press calls `confirm_use(use_transaction_id)`. Disable duplicate presses until the returned transaction result is rendered.

- [ ] **Step 4: Render failure and recovery**

`INSUFFICIENT_MANA`, `INVALID_TARGET`, and `SPELL_ALREADY_USED` retain the incident and prepared-spell context. A failed use never silently chooses another spell or target.

- [ ] **Step 5: Run tests and commit**

```bash
godot --headless --path . --script res://tests/test_runner.gd
git add src/ui/spell_workflow/components/target_selection_panel.* src/ui/spell_workflow/components/expected_result_panel.* src/ui/spell_workflow/spell_use_screen.* tests/integration/test_spell_use_workflow_screen.gd tests/test_runner.gd
git commit -m "feat: add spell use workflow screen"
```

---

### Task 9: Root Coordinator, Responsive Layout, and End-to-end Transaction Proof

**Files:**
- Create: `src/ui/spell_workflow/spell_workflow_layout_model.gd`
- Create: `src/ui/spell_workflow/spell_workflow_root.gd`
- Create: `src/ui/spell_workflow/spell_workflow_root.tscn`
- Create: `tests/integration/test_spell_workflow_scene.gd`
- Create: `tests/integration/test_spell_workflow_end_to_end.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Root owns: `SpellWorkflowState`, coordinator, current incident, current screen index, focus restoration data.
- Root does not own: Vault counts, Stock counts, Mana balance, prepared-spell data, or committed result data; it receives those from domain objects.
- Layout model produces rectangles for left context, center action, right preview, bottom actions, and overlay at 1280×720 with safe insets.

- [ ] **Step 1: Write layout RED tests**

Test 1280×720 and Text Scale 1.30 with 24px safe margins. Assert all primary controls remain in the safe rect, no bottom action overlaps center content, and each screen has exactly one enabled primary action.

- [ ] **Step 2: Build the root scene**

Instantiate all three screens once and toggle visibility; do not free/recreate screens during Overlay use. The root connects child intent signals to coordinator methods and renders returned snapshots.

- [ ] **Step 3: Write the full end-to-end test**

Fixture:

```text
Vault: HEAT, FLOW, PROTECT, FOCUS, DISPERSE
Stock: COOL, MEND, STABILIZE, SUSTAIN, AMPLIFY
Draft: HEAT Main + STABILIZE Aux
Stage 2: prepare spell, consume HEAT and STABILIZE, mana unchanged
Stage 3: target WARD, spend final mana once, result applied once
Duplicate prepare: no extra glyph consumption
Duplicate use: no extra mana or result
```

- [ ] **Step 4: Preserve legacy regression**

The same runner invocation must still pass all legacy star-circuit, recognition, resource, and UI Kit suites. Do not delete the old harness or tests in this implementation PR.

- [ ] **Step 5: Run tests and commit**

```bash
python -m unittest tests.test_spell_workflow_ui_v2_contract -v
godot --headless --path . --script res://tests/test_runner.gd
git add src/ui/spell_workflow/spell_workflow_layout_model.gd src/ui/spell_workflow/spell_workflow_root.* tests/integration/test_spell_workflow_scene.gd tests/integration/test_spell_workflow_end_to_end.gd tests/test_runner.gd
git commit -m "feat: integrate three-stage spell workflow"
```

---

### Task 10: Render Evidence, CI, Authority Sync, and Main Scene Gate

**Files:**
- Create: `tools/capture_spell_workflow_snapshots.gd`
- Create: `.github/workflows/validate-spell-workflow-ui-v2.yml`
- Modify: `project.godot`
- Modify: `START_HERE.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/DEVELOPMENT_GATES.md`
- Modify: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- Modify: `docs/planning/CANON_SYNC_STATE.json`
- Modify: `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`
- Create: `docs/planning/SPELL_WORKFLOW_UI_V2_IMPLEMENTATION_ADVERSARIAL_REVIEW_2026-08-06.md`
- Create: `docs/planning/sync/GR-SYNC-20260806-10-SPELL-WORKFLOW-UI-V2-IMPLEMENTATION.md`

**Interfaces:**
- Snapshot tool writes three 1280×720 PNG files: drawing, placement, use.
- CI uploads contract report, headless runner log, and PNG evidence.
- `project.godot` changes Main Scene only after all exact-head jobs pass.

- [ ] **Step 1: Add the dedicated CI workflow**

Jobs:

```text
contract:
  python -m unittest tests.test_spell_workflow_ui_v2_contract -v
runtime:
  install verified Godot 4.7.1
  godot --headless --path . --script res://tests/test_runner.gd
render:
  xvfb-run godot --path . --script res://tools/capture_spell_workflow_snapshots.gd
  verify each PNG is 1280×720 and non-empty
planning:
  run existing planning/Base, UTF-8 NFC, JSON, and rights gates
```

- [ ] **Step 2: Capture the three required states**

Drawing: accepted HEAT candidate before save. Placement: HEAT Main + STABILIZE Aux with base success and estimated Mana. Use: WARD selected with final success, risk, and final Mana. Use Korean text only after a licensed redistributable Korean font is actually present; otherwise keep English-safe evidence and record `KOREAN_FONT_NOT_RUN`.

- [ ] **Step 3: Run adversarial review**

Explicitly attack: duplicated Mana labels, target leakage into Stage 2, glyph consumption during Stage 3, hidden source substitution, Overlay state loss, double press, stale preview after target change, layout clipping, color-only state, unlicensed font, PR #77 duplication, and old `BURST` appearing as an eleventh card.

- [ ] **Step 4: Change Main Scene only after exact-head GREEN**

Set:

```text
run/main_scene="res://src/ui/spell_workflow/spell_workflow_root.tscn"
```

Then rerun every workflow on the new exact head. If any job fails, revert only the Main Scene switch and keep the implementation PR Draft.

- [ ] **Step 5: Sync GitHub authority and Google Sheet**

Update the same Decision ID in `00`, `01`, `02`, `04`, `05`, `12`, `15`, `40`, `41`, `60`, `71`, `72`, `80`, and `99`. Record exact head, all workflow run IDs, suite/assertion/failure counts, rendered artifact IDs, and physical gates as `NOT_RUN`. Perform Sheet readback before claiming sync.

- [ ] **Step 6: Final verification**

Run:

```bash
python -m unittest tests.test_spell_workflow_ui_v2_contract -v
godot --headless --path . --script res://tests/test_runner.gd
python tools/validate_text_integrity.py
python -m json.tool docs/planning/CANON_SYNC_STATE.json > /dev/null
python -m json.tool docs/planning/GRILL_ME_BATCH_MERGE_STATE.json > /dev/null
```

Expected: all commands PASS, three render PNGs exist at 1280×720, review threads are zero or resolved, and the PR remains Draft until user visual approval.

- [ ] **Step 7: Commit**

```bash
git add .github/workflows/validate-spell-workflow-ui-v2.yml tools/capture_spell_workflow_snapshots.gd project.godot START_HERE.md docs tests
git commit -m "feat: complete spell workflow UI v2 evidence"
```

---

## Self-review Record

### Spec coverage

- Three separate stages: Tasks 6–9.
- Incident Overlay and state restore: Tasks 5–6 and 9.
- Vault/Stock equal counts 1–5: Tasks 2 and 7.
- Main/Aux ten-glyph catalog and BURST migration: Task 1.
- Stage 2 glyph-only consumption: Tasks 3–5.
- Stage 3 mana/result-only consumption: Task 5 and Task 9.
- Target only in Stage 3: Tasks 5, 7, and 8.
- Gold-only common economy and single Mana estimate area: scene contracts in Tasks 7–8.
- 48dp, Text 130%, Reduced Motion, color-independent state: Tasks 6–10.
- Existing runtime and PR #77 preservation: Global Constraints and Tasks 5, 7, 9, 10.
- Automated, rendered, authority, and Sheet evidence: Task 10.

### Placeholder scan

The plan contains no `TBD`, `TODO`, or unspecified implementation step. Physical-device, performance, screen-reader, and human checks are explicitly retained as `NOT_RUN`, not deferred as hidden work.

### Type consistency

- Preparation idempotency uses `preparation_transaction_id: StringName` from placement through inventory.
- Use idempotency uses a separate `use_transaction_id: StringName`.
- Prepared spell identity uses `spell_id: StringName` and is never reused as a transaction ID implicitly.
- Stage 2 and Stage 3 previews remain separate dictionaries.
- UI emits intent signals; domain services return copied dictionaries.

## Execution Handoff

Plan execution should use **subagent-driven development in Codex** with one fresh implementation worker per task and a two-stage review after every task. In this ChatGPT thread, keep PR #78 as design/plan authority and open the product work as a separate Draft TDD PR after the dependency gate for PR #77 is resolved.

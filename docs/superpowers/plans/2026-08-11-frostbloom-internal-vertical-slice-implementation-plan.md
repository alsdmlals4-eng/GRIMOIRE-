# Frostbloom Internal Vertical Slice Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: use `superpowers:test-driven-development` for each implementation task and `superpowers:verification-before-completion` before any completion claim. Persistent Godot source authoring must be performed only through the project-authorized HiGodot/Godot AI route.

**Goal:** Implement the user-approved `GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01` as a deterministic 46-minute-target internal slice that reuses the existing FIVE_POINT_STAR / Spell Workflow / atomic result / persistence authorities and proves one coherent school→preparation→investigation→first solution→new context→redesign→result→Grimoire spiral.

**Architecture:** Add a bounded Frostbloom incident layer above existing domain authorities. The incident layer owns beat progression, writing-count evidence, one free-schedule choice, 2-of-4 investigation evidence, first-solution consequence preservation, old-revision context reveal, single-pressure-source state, five-dimensional result summary, portfolio evidence, and A1–A4 slice snapshots. It does **not** own glyph recognition, circuit math, mana, prepared-spell inventory, spell-use atomicity, or generic save file I/O. Stage 2/3 continues through `SpellWorkflowCoordinator` and `AtomicSpellUseService`; result idempotency reuses `AtomicResultLedger`; persistence reuses `SaveRepository` with a Frostbloom-specific plain-data snapshot.

**Tech Stack:** Godot 4.7.1, GDScript, existing deterministic GDScript runner / GUT authority, Python `unittest` planning contracts, existing `SpellWorkflowCoordinator`, `AtomicSpellUseService`, `AtomicResultLedger`, `SaveRepository`, FIVE_POINT_STAR UI components, GitHub Actions.

**Benchmark basis:** `docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_IMPLEMENTATION_BENCHMARK_2026-08-11.md` must be read before execution. Its implementation disposition is `INCIDENT_ORCHESTRATION_OVER_EXISTING_AUTHORITIES`.

---

## Global Constraints

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
sync_id: GR-SYNC-20260811-10-FROSTBLOOM-INTERNAL-VERTICAL-SLICE
slice_model: SINGLE_INCIDENT_SPIRAL
target_minutes: 46
rework_threshold_minutes: 53
hard_stop_minutes: 60
successful_direct_writing_events: 7
recovery_inclusive_writing_cap: 10
free_schedule_windows_actual: 1
free_schedule_choices: 4
investigation_available: 4
investigation_required: 2
major_five_point_star_commits_min: 2
result_dimensions: [FACILITY, LIFE, SPIRIT, RELATIONSHIP, DISCOVERY]
anchors: [A1, A2, A3, A4]
festival: PREVIEW_ONLY
separate_exam: FORBIDDEN
current_circuit_authority: FIVE_POINT_STAR
historical_3x3_current_use: FORBIDDEN
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

- First accepted major solution must improve at least one real incident dimension.
- Old-revision reveal adds context; it may not rewrite the first result to `false`, erase it, or label it retrospectively as a fake choice.
- `FACILITY_REPAIR / LIFE_RESCUE / SPIRIT_STABILIZATION / CONTAIN_AND_EVACUATE / SUPPRESS_AND_BUY_TIME` are derived semantics, **not route buttons**.
- Unregistered coherent solutions remain possible when target/circuit/context rules validate them.
- `SpellWorkflowCoordinator` owns Stage 2/3 flow; D must not create a Frostbloom-specific mana/circuit/spell-use service.
- `AtomicSpellUseService` remains the only Stage 3 mana + prepared spell + result atomic transaction in this layer.
- `AtomicResultLedger` remains the reusable exactly-once result store. Do not add a second generic result ledger.
- `SaveRepository` remains the file I/O primitive; D adds a snapshot schema/adapter only.
- UI never decides consequence quality by itself.
- Automated tests may validate event ordering and invariants, but may **not** claim that human completion is actually 46 minutes or fun.
- All `.gd/.tscn/.tres/.res/project.godot` creates/edits in Tasks 2–10 are `BLOCKED_BY_HIGODOT_EXECUTOR_AVAILABILITY` in this ChatGPT session. GitHub text-write bypass is forbidden.
- Frostbloom UI integration is also blocked until Task8 `SPELL_USE_SCREEN` is resumed and completed; the incident plan may prepare pure domain contracts before that dependency.

---

## Existing Solution First

The implementation worker must reuse these current files rather than replacing them:

```text
src/core/workflow/spell_workflow_coordinator.gd
src/core/spells/atomic_spell_use_service.gd
src/core/atomic_result_ledger.gd
src/persistence/save_repository.gd
src/ui/spell_workflow/glyph_drawing_screen.gd/.tscn
src/ui/spell_workflow/circuit_placement_screen.gd/.tscn
data/testing/frostbloom_star_ux_map.json
tests/integration/test_frostbloom_star_ux_map.gd
```

Task8 planned authority, when resumed:

```text
src/ui/spell_workflow/spell_use_screen.gd/.tscn
src/ui/spell_workflow/components/target_selection_panel.gd/.tscn
src/ui/spell_workflow/components/expected_result_panel.gd/.tscn
```

Do not create competing Frostbloom versions of those Stage 3 files.

---

## Target File Structure

### Planning / contracts — may be authored before HiGodot execution

- Create: `tests/test_frostbloom_internal_vertical_slice_contract.py`
- Modify: `.github/workflows/validate-base-v9-adoption.yml`
- Existing: `docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_01_APPROVAL_2026-08-11.md`
- Existing: `docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_IMPLEMENTATION_BENCHMARK_2026-08-11.md`

### Content data — non-Godot data, implementation stage

- Create: `data/frostbloom/internal_slice_v1.json`
- Modify: `data/testing/frostbloom_star_ux_map.json` only to align old fixture language with derived-intent/current D authority; preserve provenance fields.

### Incident domain — HiGodot-authorized persistent GDScript

- Create: `src/core/frostbloom/frostbloom_slice_state.gd`
- Create: `src/core/frostbloom/frostbloom_investigation_model.gd`
- Create: `src/core/frostbloom/frostbloom_context_affordance_model.gd`
- Create: `src/core/frostbloom/frostbloom_incident_resolver.gd`
- Create: `src/core/frostbloom/frostbloom_pressure_state.gd`
- Create: `src/core/frostbloom/frostbloom_result_summary.gd`
- Create: `src/core/frostbloom/frostbloom_grimoire_entry.gd`

### Persistence — reuse generic repository

- Create: `src/persistence/frostbloom_slice_snapshot.gd`
- Create: `src/persistence/frostbloom_slice_save_adapter.gd`

### UI orchestration — after Spell Workflow Task8/9 dependency

- Create: `src/ui/frostbloom/frostbloom_slice_root.gd`
- Create: `src/ui/frostbloom/frostbloom_slice_root.tscn`
- Create: `src/ui/frostbloom/frostbloom_context_card.gd`
- Create: `src/ui/frostbloom/frostbloom_context_card.tscn`
- Create: `src/ui/frostbloom/frostbloom_result_panel.gd`
- Create: `src/ui/frostbloom/frostbloom_result_panel.tscn`
- Create: `src/ui/frostbloom/frostbloom_portfolio_panel.gd`
- Create: `src/ui/frostbloom/frostbloom_portfolio_panel.tscn`

### Deterministic tests

- Create: `tests/unit/test_frostbloom_slice_state.gd`
- Create: `tests/unit/test_frostbloom_investigation_model.gd`
- Create: `tests/unit/test_frostbloom_context_affordance_model.gd`
- Create: `tests/unit/test_frostbloom_incident_resolver.gd`
- Create: `tests/unit/test_frostbloom_pressure_state.gd`
- Create: `tests/unit/test_frostbloom_result_summary.gd`
- Create: `tests/unit/test_frostbloom_grimoire_entry.gd`
- Create: `tests/unit/test_frostbloom_slice_snapshot.gd`
- Create: `tests/integration/test_frostbloom_slice_resume.gd`
- Create: `tests/integration/test_frostbloom_slice_paths.gd`
- Create: `tests/integration/test_frostbloom_slice_scene.gd`
- Modify: `tests/test_runner.gd`

---

# Task 1 — Planning Contract, Benchmark Gate, and Spec Promotion

**Execution status:** `AVAILABLE_NOW_NO_GODOT_SOURCE_MUTATION`

**Files:**
- Create: `tests/test_frostbloom_internal_vertical_slice_contract.py`
- Modify: `.github/workflows/validate-base-v9-adoption.yml`
- Modify: `docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_01_APPROVAL_2026-08-11.md`
- Modify: `docs/planning/sync/GR-SYNC-20260811-10-FROSTBLOOM-INTERNAL-VERTICAL-SLICE.md`

- [ ] **Step 1: Write the Python contract test before product implementation**

```python
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
CANON = ROOT / "docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_01_APPROVAL_2026-08-11.md"
BENCH = ROOT / "docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_IMPLEMENTATION_BENCHMARK_2026-08-11.md"
PLAN = ROOT / "docs/superpowers/plans/2026-08-11-frostbloom-internal-vertical-slice-implementation-plan.md"


class FrostbloomInternalVerticalSliceContractTests(unittest.TestCase):
    def test_required_planning_artifacts_exist(self):
        for path in (CANON, BENCH, PLAN):
            self.assertTrue(path.is_file(), path)

    def test_approved_slice_contract_tokens(self):
        text = CANON.read_text(encoding="utf-8")
        for token in (
            "GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01",
            "GR-SYNC-20260811-10-FROSTBLOOM-INTERNAL-VERTICAL-SLICE",
            "actual_play_target_minutes: 46",
            "content_rework_threshold_minutes: 53",
            "hard_stop_minutes: 60",
            "required_successful_writing_events: 7",
            "recovery_inclusive_writing_cap: 10",
            "investigation_nodes_available: 4",
            "investigation_nodes_required: 2",
            "free_schedule_windows_in_slice: 1",
            "major_five_point_star_commits_min: 2",
            "FIVE_POINT_STAR",
            "PREVIEW_ONLY",
            "A1",
            "A2",
            "A3",
            "A4",
        ):
            self.assertIn(token, text)

    def test_first_solution_and_route_button_guards(self):
        text = CANON.read_text(encoding="utf-8")
        self.assertIn("첫 `W6` 주요 해결은 반드시 실제 상태를 개선", text)
        self.assertIn("정답 루트 버튼으로 노출하지 않는다", text)
        self.assertIn("Historical 3×3", text)

    def test_benchmark_was_performed_before_plan(self):
        text = BENCH.read_text(encoding="utf-8")
        self.assertIn("PRE_IMPLEMENTATION_BENCHMARK_AND_INDUSTRY_RESEARCH", text)
        self.assertIn("INCIDENT_ORCHESTRATION_OVER_EXISTING_AUTHORITIES", text)

    def test_no_godot_product_source_added_by_planning_pr_contract(self):
        plan = PLAN.read_text(encoding="utf-8")
        self.assertIn("BLOCKED_BY_HIGODOT_EXECUTOR_AVAILABILITY", plan)
        self.assertIn("GitHub text-write bypass is forbidden", plan)


if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Run the planning contract**

Run:

```bash
python -m unittest tests.test_frostbloom_internal_vertical_slice_contract -v
```

Expected: PASS after this plan and benchmark artifact exist. This is a planning/spec contract only; it is not runtime evidence.

- [ ] **Step 3: Add an explicit CI invocation**

Add immediately after existing Year-One/C contract tests:

```yaml
- run: python -m unittest tests.test_frostbloom_internal_vertical_slice_contract -v
```

- [ ] **Step 4: Promote written-spec status**

Change D status from `USER_APPROVED_DESIGN_SPEC_REVIEW_PENDING` to:

```yaml
status: USER_APPROVED_SPEC_IMPLEMENTATION_PLAN_READY
implementation_plan: docs/superpowers/plans/2026-08-11-frostbloom-internal-vertical-slice-implementation-plan.md
persistent_godot_execution: BLOCKED_BY_HIGODOT_EXECUTOR_AND_TASK8_DEPENDENCY
```

Do not change Human/Device/Performance/Full Slice `NOT_RUN` claims.

- [ ] **Step 5: Commit planning-only work**

```bash
git add tests/test_frostbloom_internal_vertical_slice_contract.py \
  .github/workflows/validate-base-v9-adoption.yml \
  docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_01_APPROVAL_2026-08-11.md \
  docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_IMPLEMENTATION_BENCHMARK_2026-08-11.md \
  docs/planning/sync/GR-SYNC-20260811-10-FROSTBLOOM-INTERNAL-VERTICAL-SLICE.md \
  docs/superpowers/plans/2026-08-11-frostbloom-internal-vertical-slice-implementation-plan.md
git commit -m "docs: prepare Frostbloom slice implementation plan"
```

---

# Task 2 — Frostbloom Content Data and Slice State

**Execution status:** `BLOCKED_BY_HIGODOT_EXECUTOR_AVAILABILITY` for `.gd`; JSON may be prepared only as part of the authorized implementation work unit.

**Files:**
- Create: `data/frostbloom/internal_slice_v1.json`
- Create: `src/core/frostbloom/frostbloom_slice_state.gd`
- Create: `tests/unit/test_frostbloom_slice_state.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**

```text
FrostbloomSliceState.create() -> FrostbloomSliceState | null
record_writing_event(event_id: StringName, glyph_id: StringName) -> Dictionary
choose_free_schedule(choice_id: StringName) -> Dictionary
record_investigation(node_id: StringName) -> Dictionary
mark_first_solution(use_transaction_id: StringName) -> Dictionary
reveal_old_revision() -> Dictionary
mark_redesign(use_transaction_id: StringName) -> Dictionary
snapshot() -> Dictionary
restore(snapshot: Dictionary) -> bool
```

- [ ] **Step 1: Write RED tests for the state contract**

```gdscript
var State = load("res://src/core/frostbloom/frostbloom_slice_state.gd")
var state = State.create()
case.assert_true(state != null, "slice state creates")
case.assert_equal(0, int(state.snapshot().get("successful_writing_count", -1)), "starts with zero writings")
case.assert_equal(&"SCHOOL_DEMO", StringName(state.snapshot().get("beat", &"")), "starts at school demo")

for event_id in [&"W1", &"W2", &"W3", &"W4", &"W5", &"W6", &"W7"]:
    var result: Dictionary = state.record_writing_event(event_id, &"FLOW")
    case.assert_true(bool(result.get("accepted", false)), "approved writing event accepted: %s" % event_id)
case.assert_equal(7, int(state.snapshot().get("successful_writing_count", -1)), "normal writing count is exactly seven")
case.assert_false(bool(state.record_writing_event(&"W8", &"FLOW").get("accepted", true)), "unapproved eighth normal writing event rejected")
```

Also assert:
- exactly one free-schedule selection may be committed;
- investigation accepts exactly two unique node IDs before first solution;
- duplicate investigation does not increase count;
- old-revision reveal is rejected before first solution;
- W7/redesign is rejected before reveal;
- snapshot contains only primitives/arrays/dictionaries/StringName-compatible values, never `Node` references.

- [ ] **Step 2: Create deterministic content data**

`data/frostbloom/internal_slice_v1.json` must contain exactly:

```json
{
  "schema_version": 1,
  "scenario_id": "FROSTBLOOM_INTERNAL_SLICE_V1",
  "writing_events": ["W1", "W2", "W3", "W4", "W5", "W6", "W7"],
  "free_schedule_choices": ["REST", "PREPARE", "SOCIAL", "PRACTICUM"],
  "investigation_nodes": ["IRRIGATION_PRESSURE", "ROOT_LAYER", "SPIRIT_TRACE", "OLD_REPAIR_RECORD"],
  "result_dimensions": ["FACILITY", "LIFE", "SPIRIT", "RELATIONSHIP", "DISCOVERY"],
  "anchors": ["A1", "A2", "A3", "A4"],
  "festival_mode": "PREVIEW_ONLY"
}
```

Content strings/localization can grow later; this file owns stable IDs and slice contract only.

- [ ] **Step 3: Implement `FrostbloomSliceState` as a plain-data state machine**

Use internal dictionaries/arrays, not Nodes. Required invariants:

```gdscript
const WRITING_EVENTS: Array[StringName] = [&"W1", &"W2", &"W3", &"W4", &"W5", &"W6", &"W7"]
const FREE_CHOICES: Array[StringName] = [&"REST", &"PREPARE", &"SOCIAL", &"PRACTICUM"]
const INVESTIGATION_IDS: Array[StringName] = [&"IRRIGATION_PRESSURE", &"ROOT_LAYER", &"SPIRIT_TRACE", &"OLD_REPAIR_RECORD"]
const MAX_NORMAL_WRITING := 7
const RECOVERY_INCLUSIVE_CAP := 10
const INVESTIGATION_REQUIRED := 2
```

Store writing events by ID so retries do not double-count successful evidence.

- [ ] **Step 4: Add suite to `tests/test_runner.gd`, run GREEN, preserve all existing suites**

Run:

```bash
godot --headless --path . --script res://tests/test_runner.gd
```

Expected: new state suite PASS; all prior suites remain PASS.

- [ ] **Step 5: Commit via authorized authoring route**

Commit message:

```text
feat: add Frostbloom slice state contract
```

---

# Task 3 — Investigation and Free-Schedule Context Affordances

**Execution status:** `BLOCKED_BY_HIGODOT_EXECUTOR_AVAILABILITY`

**Files:**
- Create: `src/core/frostbloom/frostbloom_investigation_model.gd`
- Create: `src/core/frostbloom/frostbloom_context_affordance_model.gd`
- Create: `tests/unit/test_frostbloom_investigation_model.gd`
- Create: `tests/unit/test_frostbloom_context_affordance_model.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**

```text
FrostbloomInvestigationModel.create() -> model
observe(node_id: StringName) -> Dictionary
selected_ids() -> Array[StringName]
completion_evidence() -> Dictionary

FrostbloomContextAffordanceModel.for_schedule(choice_id: StringName) -> Dictionary
FrostbloomContextAffordanceModel.for_craft(tool_id: StringName) -> Dictionary
```

- [ ] **Step 1: RED-test all six investigation pairs**

There are `4 choose 2 = 6` unique pairs. For every pair assert:

```gdscript
case.assert_true(bool(model.completion_evidence().get("main_progress_possible", false)), "every 2-of-4 pair supports completion")
case.assert_true(Array(model.completion_evidence().get("known_context", [])).size() >= 2, "pair yields context")
case.assert_true(Array(model.completion_evidence().get("uncertainties", [])).size() >= 1, "omitted clues remain uncertainty")
```

No pair may yield `correct_route_id`, `required_spell`, or `best_intent`.

- [ ] **Step 2: RED-test four free-schedule choices**

Each choice must produce a different **nonmandatory** affordance and:

```gdscript
case.assert_false(bool(data.get("blocks_main_progress", true)), "choice never blocks main progress")
case.assert_false(bool(data.get("owns_required_material", true)), "choice never owns required material")
case.assert_false(bool(data.get("permanent_dominant_reward", true)), "choice is not dominant permanent reward")
```

- [ ] **Step 3: Implement data-only context models**

Approved schedule affordance types:

```text
REST      -> subtle spirit-discomfort context / calm interaction
PREPARE   -> one additional condition on contextual craft tool
SOCIAL    -> one people/facility perspective
PRACTICUM -> one frost/pressure behavior clue
```

Approved crafting tool semantics are bounded examples only:

```text
DAMPING_CATALYST     -> reduce sudden state shock tendency
TEMPORARY_SEAL       -> temporarily hold a leak/fracture point
OBSERVATION_REAGENT  -> expose subtle flow traces
```

None returns a success multiplier that makes it universally best.

- [ ] **Step 4: GREEN + regression**

Run full GDScript runner. Add both new suites; existing star/spell tests must remain green.

- [ ] **Step 5: Commit**

```text
feat: model Frostbloom context affordances
```

---

# Task 4 — First Solution Consequence and Old-Revision Reveal

**Execution status:** `BLOCKED_BY_HIGODOT_EXECUTOR_AVAILABILITY`

**Files:**
- Create: `src/core/frostbloom/frostbloom_incident_resolver.gd`
- Create: `tests/unit/test_frostbloom_incident_resolver.gd`
- Modify: `tests/test_runner.gd`

**Dependencies:** existing `SpellWorkflowCoordinator.confirm_use()` result and existing `AtomicResultLedger`.

**Interfaces:**

```text
FrostbloomIncidentResolver.create(result_ledger: AtomicResultLedger) -> resolver | null
apply_first_solution(use_result: Dictionary, context: Dictionary) -> Dictionary
reveal_old_revision(first_solution_transaction_id: StringName, reveal_id: StringName) -> Dictionary
apply_redesign(use_result: Dictionary, context: Dictionary) -> Dictionary
derive_intent_tags(spell_result: Dictionary, context: Dictionary) -> Array[StringName]
```

- [ ] **Step 1: RED-test first-solution preservation**

Fixture a successful existing spell-use result:

```gdscript
var use_result := {
    "status": &"USED",
    "use_transaction_id": &"FROST_W6_USE_001",
    "spell_id": &"SPELL_HEAT_FLOW",
    "result": {
        "target_keyword": &"IRRIGATION",
        "success_percent": 70,
        "effect_tags": [&"RESTORE_FLOW", &"LOWER_PRESSURE"]
    }
}
```

Assertions:

```gdscript
var first := resolver.apply_first_solution(use_result, context)
case.assert_equal(&"FIRST_SOLUTION_APPLIED", StringName(first.get("status", &"")), "first solution applies")
var dimensions: Dictionary = first.get("dimensions", {})
case.assert_true(dimensions.values().any(func(v): return int(v) > 0), "accepted first solution improves at least one dimension")

var reveal := resolver.reveal_old_revision(&"FROST_W6_USE_001", &"OLD_REVISION_ROOT_CONFLICT")
case.assert_true(bool(reveal.get("first_solution_preserved", false)), "reveal preserves first solution")
case.assert_equal(dimensions, resolver.first_solution(&"FROST_W6_USE_001").get("dimensions", {}), "reveal never rewrites prior dimensions")
```

- [ ] **Step 2: RED-test idempotency**

Duplicate `apply_first_solution()` for the same `use_transaction_id` must return the prior committed consequence with `applied: false`/equivalent and zero additional reward/result mutation.

- [ ] **Step 3: Implement dimension derivation without route buttons**

The resolver consumes target/effect/context tags and returns consequence tags. It may emit derived semantic tags like:

```text
FACILITY_REPAIR
LIFE_RESCUE
SPIRIT_STABILIZATION
CONTAIN_AND_EVACUATE
SUPPRESS_AND_BUY_TIME
UNREGISTERED_COHERENT
```

It must **not** accept one of these as an input `route_id` that directly selects an ending. Test that an input payload containing only `route_id` without target/effect evidence is rejected.

- [ ] **Step 4: Store first consequence through existing `AtomicResultLedger`**

Use a separate consequence transaction ID derived explicitly by the caller, e.g. `FROST_CONSEQUENCE_W6_001`; do not reuse `spell_id` as an idempotency key.

- [ ] **Step 5: GREEN + regression; commit**

```text
feat: preserve Frostbloom first-solution consequence
```

---

# Task 5 — Single Pressure Source and W7 Redesign

**Execution status:** `BLOCKED_BY_HIGODOT_EXECUTOR_AVAILABILITY`

**Files:**
- Create: `src/core/frostbloom/frostbloom_pressure_state.gd`
- Create: `tests/unit/test_frostbloom_pressure_state.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**

```text
FrostbloomPressureState.create(initial_instability: int) -> state | null
apply_spell_consequence(consequence: Dictionary) -> Dictionary
is_resolved() -> bool
snapshot() -> Dictionary
restore(snapshot: Dictionary) -> bool
```

- [ ] **Step 1: RED-test one-source contract**

State must expose exactly one pressure-source ID, e.g. `OLD_REVISION_SPIRIT_PRESSURE`. No mob array/wave index exists in serialized state.

- [ ] **Step 2: RED-test resolution quality rather than HP kill**

The state tracks bounded integers such as `instability`, `environment_risk`, and `life_risk`. It does not require an enemy HP-zero condition for normal resolution.

Example:

```gdscript
var state = Pressure.create(6)
var result := state.apply_spell_consequence({
    "instability_delta": -2,
    "environment_risk_delta": -1,
    "life_risk_delta": 0,
})
case.assert_equal(4, int(result.get("instability", -1)), "meaningful spell reduces instability")
case.assert_false(state.is_resolved(), "one action need not auto-resolve")
```

- [ ] **Step 3: W7 must pass through existing Spell Workflow**

The incident root may request another Stage2/Stage3 cycle, but it must not call a local damage/cast API. Add an integration assertion later that both W6 and W7 use existing prepared/use transaction IDs.

- [ ] **Step 4: Preserve professor/companion boundaries in data**

No pressure-state method may expose `recommended_spell`, `correct_circuit`, or `auto_solve`.

- [ ] **Step 5: GREEN + regression; commit**

```text
feat: add Frostbloom redesign pressure state
```

---

# Task 6 — Five-Dimensional Result, Grimoire Entry, and Portfolio Evidence

**Execution status:** `BLOCKED_BY_HIGODOT_EXECUTOR_AVAILABILITY`

**Files:**
- Create: `src/core/frostbloom/frostbloom_result_summary.gd`
- Create: `src/core/frostbloom/frostbloom_grimoire_entry.gd`
- Create: `tests/unit/test_frostbloom_result_summary.gd`
- Create: `tests/unit/test_frostbloom_grimoire_entry.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**

```text
FrostbloomResultSummary.create() -> summary
apply_consequence(consequence: Dictionary) -> Dictionary
finalize() -> Dictionary

FrostbloomGrimoireEntry.create(input: Dictionary) -> FrostbloomGrimoireEntry | null
to_dict() -> Dictionary
portfolio_evidence() -> Dictionary
```

- [ ] **Step 1: RED-test five independent dimensions**

Final summary must contain exactly:

```gdscript
const DIMENSIONS: Array[StringName] = [&"FACILITY", &"LIFE", &"SPIRIT", &"RELATIONSHIP", &"DISCOVERY"]
```

A positive `FACILITY` result may coexist with negative/unchanged `SPIRIT`; do not collapse into one success grade.

- [ ] **Step 2: RED-test Grimoire causal record shape**

Required fields:

```text
observations
meaning_and_circuit
selected_target
intent_tags
actual_result
side_effects_and_forgone_values
discoveries
player_naming
source_transaction_ids
```

Reject entries missing `actual_result` or `source_transaction_ids`. The record may not contain an `optimal_spell` field.

- [ ] **Step 3: Implement four portfolio evidence axes without exposing numbers**

Return evidence examples only:

```gdscript
{
    "principle_understanding": [...],
    "context_application": [...],
    "responsibility_recovery": [...],
    "reflection_explanation": [...],
}
```

No 25×4 values or -2/-6 hidden deductions appear in the Slice UI-facing dictionary.

- [ ] **Step 4: Professor feedback adapter contract**

A helper may select **two concrete evidence references + one improvement question**, but it may not calculate or expose a numeric grade.

- [ ] **Step 5: GREEN + regression; commit**

```text
feat: record Frostbloom result and Grimoire evidence
```

---

# Task 7 — A1–A4 Snapshot and Exactly-Once Resume

**Execution status:** `BLOCKED_BY_HIGODOT_EXECUTOR_AVAILABILITY`

**Files:**
- Create: `src/persistence/frostbloom_slice_snapshot.gd`
- Create: `src/persistence/frostbloom_slice_save_adapter.gd`
- Create: `tests/unit/test_frostbloom_slice_snapshot.gd`
- Create: `tests/integration/test_frostbloom_slice_resume.gd`
- Modify: `tests/test_runner.gd`

**Dependencies:** existing `SaveRepository`.

**Interfaces:**

```text
FrostbloomSliceSnapshot.create(anchor_id, slice_state, result_ledger_state, spell_workflow_state, draft_state) -> snapshot | null
serialize() -> Dictionary
restore_from(data: Dictionary) -> bool

FrostbloomSliceSaveAdapter.create(repository: SaveRepository) -> adapter | null
save_anchor(snapshot: FrostbloomSliceSnapshot) -> Dictionary
load_latest() -> Dictionary
```

- [ ] **Step 1: RED-test exact anchor set**

Accept only `A1/A2/A3/A4`; reject any arbitrary anchor.

- [ ] **Step 2: RED-test plain-data snapshot**

Snapshot must include:

```text
schema_version
anchor_id
slice_state
result_ledger_state
spell_workflow_state
draft_state
```

It must not serialize NodePath-to-live-node ownership or live `Node` instances.

- [ ] **Step 3: Use existing `SaveRepository` for file I/O**

The adapter configures a bounded file path such as:

```gdscript
repository.configure("user://frostbloom_internal_slice_v1.json")
```

Do not duplicate temp/backup/atomic-rename logic already in `SaveRepository`.

- [ ] **Step 4: Integration RED tests for interruption guarantees**

At A2, A3, and during a writing draft:

```text
Draft loss = 0
duplicate Commit = 0
duplicate reward = 0
duplicate Grimoire record = 0
stale result application = 0
```

Restore the existing `AtomicResultLedger` from saved serialized state before replaying any pending UI intent.

- [ ] **Step 5: GREEN + regression; commit**

```text
feat: persist Frostbloom slice anchors
```

---

# Task 8 — Frostbloom Slice UI Orchestration

**Execution status:** `BLOCKED_BY_TASK8_SPELL_USE_SCREEN_AND_HIGODOT_EXECUTOR`

**Hard dependency:** resume and complete Spell Workflow Task8/Task9 under `GM-SPELL-WORKFLOW-UI-V2-01`. Do not bypass Task8 by writing a Frostbloom-only Stage 3 screen.

**Files:**
- Create: `src/ui/frostbloom/frostbloom_slice_root.gd`
- Create: `src/ui/frostbloom/frostbloom_slice_root.tscn`
- Create: `src/ui/frostbloom/frostbloom_context_card.gd/.tscn`
- Create: `src/ui/frostbloom/frostbloom_result_panel.gd/.tscn`
- Create: `src/ui/frostbloom/frostbloom_portfolio_panel.gd/.tscn`
- Create: `tests/integration/test_frostbloom_slice_scene.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**

```text
FrostbloomSliceRoot consumes:
- FrostbloomSliceState
- FrostbloomInvestigationModel
- FrostbloomIncidentResolver
- FrostbloomPressureState
- FrostbloomResultSummary
- SpellWorkflow root/coordinator adapter
- FrostbloomSliceSaveAdapter

FrostbloomSliceRoot emits intents only; domain objects own mutations.
```

- [ ] **Step 1: Write scene-contract RED test**

Assert the root has named regions for:

```text
ContextCard
SchoolPrepPhase
FreeSchedulePhase
InvestigationPhase
SpellWorkflowHost
ConsequencePhase
ResultPanel
PortfolioPanel
PreviewPanel
```

`PreviewPanel` must show `PREVIEW — 이 Internal Slice에서 플레이되지 않음` and must not masquerade as an interactive Year-One chapter list.

- [ ] **Step 2: Reuse Spell Workflow screens**

The Frostbloom root hosts/transitions into the existing workflow root or existing screens. It does not instantiate alternative circuit/use implementations.

- [ ] **Step 3: Map 8 approved beats, not 13 historical scene buttons**

```text
0–6   SCHOOL_DEMO
6–11  CRAFT_PREP
11–14 FREE_SCHEDULE
14–23 INVESTIGATION
23–30 FIRST_MAJOR_SPELL
30–39 REVEAL_AND_REDESIGN
39–44 RESULT_AND_GRIMOIRE
44–46 PORTFOLIO_AND_PREVIEW
```

These minute values are metadata/telemetry goals, not timers that force-cut players.

- [ ] **Step 4: Primary-action and accessibility guards**

At any focus state, expose one primary progression action. Preserve existing 48dp and text-scale/safe-area contracts. Do not hide danger/context while Writing/Spell panels are active.

- [ ] **Step 5: GREEN + rendered smoke; commit**

```text
feat: integrate Frostbloom slice flow
```

---

# Task 9 — Deterministic Path Matrix and Adversarial End-to-End Proof

**Execution status:** `BLOCKED_BY_TASK8_SPELL_USE_SCREEN_AND_HIGODOT_EXECUTOR`

**Files:**
- Create: `tests/integration/test_frostbloom_slice_paths.gd`
- Create/Modify: `tests/integration/test_frostbloom_slice_scene.gd`
- Modify: `tests/integration/test_frostbloom_star_ux_map.gd`
- Modify: `data/testing/frostbloom_star_ux_map.json`
- Modify: `tests/test_runner.gd`

- [ ] **Step 1: Execute all 24 context combinations deterministically**

Matrix:

```text
4 free-schedule choices × 6 investigation pairs = 24
```

For every combination assert:
- main progression remains possible;
- no `correct_route_id` is required;
- W6 can produce at least one real positive dimension;
- reveal preserves W6 consequence;
- W7 is possible after reveal;
- no duplicate result/reward/record on repeat transaction IDs.

- [ ] **Step 2: Test at least two materially different solution directions**

Use existing FIVE_POINT_STAR spell fixtures with distinct targets/effect tags. Do **not** assert one is globally best.

- [ ] **Step 3: Update historical UX-map fixture language**

Keep the old file as testing provenance, but add fields:

```json
{
  "current_circuit_authority": "FIVE_POINT_STAR",
  "intent_presentation": "DERIVED_RESULT_SEMANTICS_NOT_ROUTE_BUTTONS",
  "historical_route_language": "SUPERSEDED_PRESENTATION_ONLY"
}
```

The test must stop treating the five names as selectable routes.

- [ ] **Step 4: Adversarial failures**

Explicit tests:

```text
third investigation selection does not become hidden required clue
second free-schedule selection rejected
W7 before reveal rejected
duplicate W6 use transaction reuses prior result
reveal cannot overwrite first result
route_id-only payload rejected
auto-target absent
auto-commit absent
professor exact-solution field absent
mob_wave field absent
portfolio numeric score absent
festival interactive state absent
```

- [ ] **Step 5: Run complete deterministic regression**

```bash
python -m unittest tests.test_frostbloom_internal_vertical_slice_contract -v
godot --headless --path . --script res://tests/test_runner.gd
```

Expected: every existing suite plus Frostbloom suites PASS. Do not translate this to Human/Device/Full-Slice PASS.

- [ ] **Step 6: Commit**

```text
test: prove Frostbloom systemic path matrix
```

---

# Task 10 — Render Evidence, Human Test Pack, Canon/Sheet Sync

**Execution status:** `BLOCKED_UNTIL_RUNTIME_IMPLEMENTATION_EXISTS`

**Files:**
- Create: `tools/capture_frostbloom_slice_snapshots.gd`
- Create: `.github/workflows/validate-frostbloom-internal-slice.yml`
- Create: `docs/validation/FROSTBLOOM_INTERNAL_SLICE_HUMAN_RUNBOOK_2026-08-11.md`
- Create: `docs/planning/FROSTBLOOM_INTERNAL_SLICE_IMPLEMENTATION_ADVERSARIAL_REVIEW_2026-08-11.md`
- Modify after evidence only: `START_HERE.md`, `docs/ACTIVE_CONTEXT.md`, `docs/DEVELOPMENT_GATES.md`, `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`, current-state JSON consumers.
- Update Google Sheet under the same Decision ID after exact readback.

- [ ] **Step 1: Dedicated CI**

CI jobs:

```text
planning_contract
full_gdscript_regression
frostbloom_path_matrix
render_smoke
text_integrity_json
existing Base/authority gates
```

- [ ] **Step 2: Capture required states**

At minimum:

```text
school writing
craft/free schedule
investigation 2-of-4
W6 Stage2 preview
W6 Stage3 target/final preview
first consequence + reveal
single-pressure redesign
five-axis Result
portfolio evidence
PREVIEW-only ending
```

- [ ] **Step 3: Prepare six-participant TEST_VALUE runbook without claiming results**

Separate `FIRST_ATTEMPT` and `POST_FEEDBACK`. Record:

```text
actual completion time
writing fatigue after W7
can explain why redesign happened
can name 2+ rational solution directions
can trace professor feedback to own evidence
felt hidden-right-answer pressure
free-schedule value perception
Draft/Resume trust
```

Hard stop on any duplicate result/reward/record, stale result, or draft loss.

- [ ] **Step 4: Time gate interpretation**

```text
<=53 min: may continue evaluation
>53 min: REWORK warning
>60 min: HARD STOP
```

Do not change 46/53/60 from one run. Tuning requires a separate evidence-backed decision.

- [ ] **Step 5: Adversarial review before canon promotion**

Attack:
- checklist sampler creep;
- festival sneaking into actual play;
- old 3×3 reappearing;
- first solution becoming fake;
- intent buttons becoming routes;
- professor/Nea oracle behavior;
- hidden investigation lock;
- crafting dominant strategy;
- mob-wave combat creep;
- numeric portfolio leakage;
- Task8 authority duplication;
- Save/Resume double apply;
- unsupported Human/Device/Performance claims.

- [ ] **Step 6: GitHub + Sheet sync**

Use `GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01` on both. Record exact head/run IDs and preserve unsupported gates as `NOT_RUN`. Clean the known stale lower-level Sheet consumers without deleting provenance:

```text
20 GR-G-02: remove current-looking separate-exam language
30 historical 3×3 current-looking rows: mark HISTORICAL_SUPERSEDED_BY_FIVE_POINT_STAR
40 GR-S-02: mark old main1+aux0~1 Slice rule historical/superseded
80 GR-TEST-032: preserve as historical 3×3 lineage; point current D validation to FIVE_POINT_STAR lineage
```

Perform explicit Sheet readback before `MERGED_MAIN_READBACK_PASS`.

- [ ] **Step 7: Completion criteria**

Runtime implementation may be called complete only when:

```text
all exact-head automated gates PASS
review threads = 0 unresolved
render evidence exists
same Decision ID GitHub/Sheet readback PASS
no product authority conflict
HiGodot authoring receipt present for every persistent Godot source mutation
```

Human/device/performance/full-slice remain `NOT_RUN` until their own evidence exists.

---

## Dependency Graph

```text
Task 1 planning contract
  ↓
Task 2 slice state
  ├─→ Task 3 context models
  └─→ Task 4 consequence/reveal
          └─→ Task 5 pressure/redesign
                  └─→ Task 6 result/Grimoire
Task 2 + Task 4 + Task 6
  └─→ Task 7 snapshot/resume

Spell Workflow Task8 + Task9 completion
  + Tasks 2–7
  └─→ Task 8 Frostbloom UI orchestration
        └─→ Task 9 path matrix / E2E
              └─→ Task 10 evidence / human pack / canon sync
```

Task8 Spell Use remains a separate product implementation authority. D does not cancel, replace, or silently implement it.

---

## Self-Review Record

### Spec coverage

- Single-Incident Spiral: Tasks 2–9.
- 46/53/60: Global Constraints, Task 8 metadata, Task 10 human gate.
- W1–W7 exactly seven; recovery cap10: Tasks 1–2, Task 10 measurement.
- one free schedule / four choices: Tasks 2–3, path matrix Task 9.
- 2-of-4 investigation: Tasks 2–3, all six pairs Task 9.
- first solution real improvement and preserved: Task 4 + adversarial Task 9.
- old-revision context reveal: Tasks 4–5.
- FIVE_POINT_STAR / Stage2→Stage3: Existing Solution First + Tasks 4/5/8/9.
- five intents not route buttons: Task 4 + fixture cleanup Task 9.
- single strong pressure source/no mobs: Task 5.
- five result dimensions: Task 6.
- Grimoire causal record: Task 6.
- hidden numeric portfolio: Task 6 and UI Task 8.
- A1–A4 + Draft/Snapshot: Task 7.
- explicit Preview-only festival: Tasks 1/2/8/9.
- Human/device/performance evidence honesty: Global Constraints + Task 10.

### Existing-solution review

The plan reuses:
- `SpellWorkflowCoordinator` for Stage 2/3 orchestration;
- `AtomicSpellUseService` for mana/prepared-spell/result transaction;
- `AtomicResultLedger` for idempotent committed results;
- `SaveRepository` for atomic file I/O;
- existing glyph/circuit screens and future Task8 Spell Use Screen.

No duplicate generic mana ledger, result ledger, circuit calculator, target resolver, or save writer is introduced.

### Placeholder scan

No `TBD`, `TODO`, `later`, or unspecified “implement as needed” step is permitted. Work blocked by executor/dependency is explicitly marked `BLOCKED_*`, not silently deferred.

### Type / identity consistency

- Spell use transaction identity remains `use_transaction_id: StringName`.
- Frostbloom consequence transaction IDs are separate explicit IDs; spell IDs are never reused as transaction IDs.
- Investigation/free-schedule IDs are `StringName` constants serialized as plain strings.
- Result dimensions are five fixed StringName keys.
- Snapshot schema is plain data; no live Nodes.
- First-solution evidence is append-only from D's perspective; reveal adds context rather than mutating prior evidence.

### Benchmark consistency

- Life-sim calendar patterns are used only for bounded choice structure.
- Atelier-style crafting consequence is adapted without breadth explosion.
- Dishonored-style systemic choice is adapted without action/stealth identity or route-button theater.
- Direct spell input retains embodied fantasy while respecting 7/10 writing-fatigue limits.
- Vertical slice remains a hypothesis/readiness gate, not a content sampler.

---

## Execution Handoff

The implementation plan is **ready**, but persistent Godot execution is not authorized in this ChatGPT environment because the required HiGodot executor route is unavailable and Spell Workflow Task8 is still on hold.

When those gates are available:

1. re-run Base/project/Sheet fresh-start reads;
2. perform a fresh benchmark/industry delta scan before implementation begins;
3. execute Task 2 onward through the authorized HiGodot route using TDD;
4. use GUT/deterministic runner for implementation evidence;
5. use Hera only for live QA/observability;
6. never promote Human/Device/Performance/Full Slice without direct evidence.

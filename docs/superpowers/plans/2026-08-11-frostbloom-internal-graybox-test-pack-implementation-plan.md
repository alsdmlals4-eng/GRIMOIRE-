# Frostbloom Internal Graybox Test Pack Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the user-approved internal-only Frostbloom graybox validation pack that stress-tests the 46-minute Single-Incident Spiral before Task8 resumes, without mutating persistent Godot source or promoting internal review into human evidence.

**Architecture:** Use one machine-readable JSON fixture as the stable case/index authority and seven small Markdown pack documents as the human walkthrough surface. A Python `unittest` contract verifies counts, IDs, forbidden shortcuts, W6 preservation, W7 distinctness, five-axis result shape, verdict vocabulary, and evidence-boundary language; GitHub Actions runs the contract. The pack validates approved Frostbloom assumptions only and does not replace `SpellWorkflowCoordinator`, `AtomicSpellUseService`, `AtomicResultLedger`, `SaveRepository`, FIVE_POINT_STAR, or Task8 UI ownership.

**Tech Stack:** Markdown, JSON, Python 3 `unittest`, existing GitHub Actions planning-validation workflow. No `.gd/.tscn/.tres/.res/project.godot` mutation in this plan.

## Global Constraints

- Decision ID: `GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01`.
- Design sync: `GR-SYNC-20260811-14-FROSTBLOOM-GRAYBOX-TEST-PACK-DESIGN`.
- Spec-review/plan sync: `GR-SYNC-20260811-15-FROSTBLOOM-GRAYBOX-SPEC-APPROVED-PLAN-READY`.
- Scope: `INTERNAL_DESIGN_VALIDATION_ONLY`.
- Model: `SINGLE_INCIDENT_SPIRAL`.
- Timing hypothesis: target `46`, content-rework threshold `53`, hard-stop `60`; internal review may not claim real human completion time.
- Successful direct writing events: exactly `W1` through `W7`; recovery-inclusive cap `10`.
- One actual free-schedule window with `REST / PREPARE / SOCIAL / PRACTICUM`.
- Investigation nodes: `IRRIGATION_PRESSURE / ROOT_LAYER / SPIRIT_TRACE / OLD_REPAIR_RECORD`; exactly all six unordered 2-of-4 pairs must be audited.
- W6 must improve at least one real incident dimension and remain true after old-revision reveal.
- W7 must change a meaningful judgment dimension, not merely repeat W6 for a larger number.
- Result axes remain exactly `FACILITY / LIFE / SPIRIT / RELATIONSHIP / DISCOVERY` and may not collapse into one success grade.
- Current circuit authority is `FIVE_POINT_STAR`; historical 3×3 current use is forbidden.
- Festival is `PREVIEW_ONLY`; separate exam is forbidden as required slice content.
- One strong pressure source only; mob-wave/HP-sponge replacement is forbidden.
- Derived semantic labels are not route buttons and may not be accepted as a direct lookup for the correct spell/ending.
- `PASS / RISK / FAIL / NOT_TESTABLE_YET` is the closed pack verdict vocabulary.
- Human/device/accessibility/performance/full-slice validation remain `NOT_RUN`.
- Competitor dialogue, scenario expression, UI expression, art, code, or assets may not be copied.
- Task8 execution is the next new work unit only after this pack is completed/read back and a fresh start/research gate is run.

---

## Target File Structure

### Machine-readable pack authority

- Create: `data/testing/frostbloom_internal_graybox_pack_v1.json`
  - Owns stable pack IDs, timing envelope, writing-event roles, investigation nodes/pairs, free-schedule choices, W6→Reveal→W7 case IDs, result axes, Grimoire required fields, adversarial case IDs, and allowed verdicts.

### Human-readable pack surfaces

- Create: `docs/testing/frostbloom_graybox/README.md`
  - Entry point, scope/evidence boundaries, execution order, final rollup rules.
- Create: `docs/testing/frostbloom_graybox/01_46_MINUTE_WALKTHROUGH.md`
  - Eight chronological beat rows with `PLAYER_KNOWS / PLAYER_CHOOSES / SYSTEM_CHANGES / MUST_REMAIN_UNKNOWN`.
- Create: `docs/testing/frostbloom_graybox/02_W1_W7_WRITING_LOAD_AUDIT.md`
  - Seven-event distinctness audit and recovery-count guard.
- Create: `docs/testing/frostbloom_graybox/03_INVESTIGATION_2_OF_4_MATRIX.md`
  - All six unordered investigation pairs and pair verdicts.
- Create: `docs/testing/frostbloom_graybox/04_FREE_SCHEDULE_4_CHOICE_AUDIT.md`
  - Four-choice affordance/non-dominance audit.
- Create: `docs/testing/frostbloom_graybox/05_W6_REVEAL_W7_CONSEQUENCE_CASES.md`
  - W6 real-improvement/preservation and W7 changed-judgment cases.
- Create: `docs/testing/frostbloom_graybox/06_RESULT_AND_GRIMOIRE_CASES.md`
  - Mixed five-dimensional result examples and causal Grimoire records.
- Create: `docs/testing/frostbloom_graybox/07_ADVERSARIAL_WALKTHROUGH.md`
  - Fourteen approved attacks with closed-vocabulary verdicts and stop/rework rule.

### Contract and CI

- Create: `tests/test_frostbloom_internal_graybox_pack_contract.py`
- Modify: `.github/workflows/validate-base-v9-adoption.yml`

### Completion/status artifacts

- Create during final promotion: `docs/planning/sync/GR-SYNC-20260811-16-FROSTBLOOM-GRAYBOX-PACK-COMPLETE.md`
- Modify during final promotion: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- Google Sheet: update current/sequence/audit/history rows with the same Decision ID and Sync16 after exact-head/readback.

---

### Task 1: Machine-Readable Pack Schema and Structural Contract

**Files:**
- Create: `tests/test_frostbloom_internal_graybox_pack_contract.py`
- Create: `data/testing/frostbloom_internal_graybox_pack_v1.json`

**Interfaces:**
- Consumes: approved design `docs/superpowers/specs/2026-08-11-frostbloom-internal-graybox-test-pack-design.md`.
- Produces: JSON keys `schema_version`, `pack_id`, `timing`, `writing_events`, `investigation`, `free_schedule`, `consequence_cases`, `result_dimensions`, `grimoire_required_fields`, `adversarial_case_ids`, `allowed_verdicts` used by Tasks 2–7 and final contract validation.

- [ ] **Step 1: Write the RED structural contract before the JSON fixture exists**

Create `tests/test_frostbloom_internal_graybox_pack_contract.py` with:

```python
import json
from itertools import combinations
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
FIXTURE = ROOT / "data/testing/frostbloom_internal_graybox_pack_v1.json"
PACK_DIR = ROOT / "docs/testing/frostbloom_graybox"


class FrostbloomInternalGrayboxPackContractTests(unittest.TestCase):
    def load_fixture(self):
        return json.loads(FIXTURE.read_text(encoding="utf-8"))

    def test_fixture_exists_and_core_identity_is_locked(self):
        self.assertTrue(FIXTURE.is_file(), FIXTURE)
        data = self.load_fixture()
        self.assertEqual(1, data["schema_version"])
        self.assertEqual("FROSTBLOOM_INTERNAL_GRAYBOX_PACK_V1", data["pack_id"])
        self.assertEqual("GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01", data["decision_id"])
        self.assertEqual({"target": 46, "rework": 53, "hard_stop": 60}, data["timing"])

    def test_writing_events_are_exactly_w1_to_w7(self):
        data = self.load_fixture()
        self.assertEqual([f"W{i}" for i in range(1, 8)], [x["id"] for x in data["writing_events"]])
        self.assertEqual(10, data["recovery_inclusive_writing_cap"])

    def test_investigation_has_exactly_all_six_pairs(self):
        data = self.load_fixture()
        nodes = data["investigation"]["nodes"]
        self.assertEqual(4, len(nodes))
        expected = {tuple(sorted(pair)) for pair in combinations(nodes, 2)}
        actual = {tuple(sorted(pair["nodes"])) for pair in data["investigation"]["pairs"]}
        self.assertEqual(expected, actual)
        self.assertEqual(6, len(actual))

    def test_free_schedule_and_results_are_exact(self):
        data = self.load_fixture()
        self.assertEqual(["REST", "PREPARE", "SOCIAL", "PRACTICUM"], [x["id"] for x in data["free_schedule"]])
        self.assertEqual(["FACILITY", "LIFE", "SPIRIT", "RELATIONSHIP", "DISCOVERY"], data["result_dimensions"])

    def test_verdict_vocabulary_is_closed(self):
        self.assertEqual(
            ["PASS", "RISK", "FAIL", "NOT_TESTABLE_YET"],
            self.load_fixture()["allowed_verdicts"],
        )
```

- [ ] **Step 2: Run the RED test**

Run:

```bash
python -m unittest tests.test_frostbloom_internal_graybox_pack_contract -v
```

Expected: FAIL because `data/testing/frostbloom_internal_graybox_pack_v1.json` does not yet exist.

- [ ] **Step 3: Create the minimal stable JSON authority**

Create `data/testing/frostbloom_internal_graybox_pack_v1.json` with this exact structural content; detailed case observations are added by later tasks without changing IDs:

```json
{
  "schema_version": 1,
  "pack_id": "FROSTBLOOM_INTERNAL_GRAYBOX_PACK_V1",
  "decision_id": "GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01",
  "scope": "INTERNAL_DESIGN_VALIDATION_ONLY",
  "timing": {"target": 46, "rework": 53, "hard_stop": 60},
  "writing_events": [
    {"id": "W1", "role": "SAFE_PRECEDENT_FLOW"},
    {"id": "W2", "role": "SAFE_PRECEDENT_FOCUS"},
    {"id": "W3", "role": "SAFE_PRECEDENT_DISPERSE"},
    {"id": "W4", "role": "CRAFT_CONTEXT_MARKING"},
    {"id": "W5", "role": "NONCOMBAT_FIELD_APPLICATION"},
    {"id": "W6", "role": "FIRST_MAJOR_CONTEXTUAL_SOLUTION"},
    {"id": "W7", "role": "REDESIGN_UNDER_NEW_CONTEXT"}
  ],
  "recovery_inclusive_writing_cap": 10,
  "investigation": {
    "nodes": ["IRRIGATION_PRESSURE", "ROOT_LAYER", "SPIRIT_TRACE", "OLD_REPAIR_RECORD"],
    "pairs": [
      {"id": "INV_PAIR_01", "nodes": ["IRRIGATION_PRESSURE", "ROOT_LAYER"]},
      {"id": "INV_PAIR_02", "nodes": ["IRRIGATION_PRESSURE", "SPIRIT_TRACE"]},
      {"id": "INV_PAIR_03", "nodes": ["IRRIGATION_PRESSURE", "OLD_REPAIR_RECORD"]},
      {"id": "INV_PAIR_04", "nodes": ["ROOT_LAYER", "SPIRIT_TRACE"]},
      {"id": "INV_PAIR_05", "nodes": ["ROOT_LAYER", "OLD_REPAIR_RECORD"]},
      {"id": "INV_PAIR_06", "nodes": ["SPIRIT_TRACE", "OLD_REPAIR_RECORD"]}
    ]
  },
  "free_schedule": [
    {"id": "REST", "affordance": "SPIRIT_DISCOMFORT_CONTEXT"},
    {"id": "PREPARE", "affordance": "TOOL_CONTEXT_CONDITION"},
    {"id": "SOCIAL", "affordance": "PEOPLE_FACILITY_PERSPECTIVE"},
    {"id": "PRACTICUM", "affordance": "FROST_PRESSURE_BEHAVIOR_CLUE"}
  ],
  "consequence_cases": ["CASE_W6_A", "CASE_W6_B", "CASE_W6_C"],
  "result_dimensions": ["FACILITY", "LIFE", "SPIRIT", "RELATIONSHIP", "DISCOVERY"],
  "grimoire_required_fields": [
    "observations",
    "meaning_and_circuit",
    "selected_target",
    "intent_tags",
    "actual_result",
    "side_effects_and_forgone_values",
    "discoveries",
    "player_naming"
  ],
  "adversarial_case_ids": [
    "ADV_01_ONE_NODE_W6",
    "ADV_02_PAIR_EQUIVALENCE",
    "ADV_03_FREE_CHOICE_DOMINANCE",
    "ADV_04_HELPER_ANSWER_LEAK",
    "ADV_05_W6_INVALIDATED",
    "ADV_06_W7_REPEAT",
    "ADV_07_WRITING_REDUNDANCY",
    "ADV_08_RESULT_COLLAPSE",
    "ADV_09_GRIMOIRE_UNOBSERVED_CAUSE",
    "ADV_10_EXPOSITION_OVERWEIGHT",
    "ADV_11_HISTORICAL_3X3_REAPPEARS",
    "ADV_12_EXAM_FESTIVAL_SCOPE_CREEP",
    "ADV_13_MOB_WAVE_REPLACEMENT",
    "ADV_14_ROUTE_LOOKUP_FIXTURE"
  ],
  "allowed_verdicts": ["PASS", "RISK", "FAIL", "NOT_TESTABLE_YET"],
  "human_validation": "NOT_RUN",
  "device_validation": "NOT_RUN",
  "performance_validation": "NOT_RUN",
  "full_slice_validation": "NOT_RUN"
}
```

- [ ] **Step 4: Run the structural contract GREEN**

Run the same unittest command. Expected: all Task 1 tests PASS.

- [ ] **Step 5: Commit Task 1**

```bash
git add tests/test_frostbloom_internal_graybox_pack_contract.py data/testing/frostbloom_internal_graybox_pack_v1.json
git commit -m "test: lock Frostbloom graybox pack structure"
```

---

### Task 2: Chronological Walkthrough and W1–W7 Writing-Load Audit

**Files:**
- Create: `docs/testing/frostbloom_graybox/01_46_MINUTE_WALKTHROUGH.md`
- Create: `docs/testing/frostbloom_graybox/02_W1_W7_WRITING_LOAD_AUDIT.md`
- Modify: `tests/test_frostbloom_internal_graybox_pack_contract.py`

**Interfaces:**
- Consumes: `timing`, `writing_events` from the JSON fixture.
- Produces: eight beat IDs `BEAT_01`…`BEAT_08`; writing verdict rows `W1`…`W7` using `DISTINCT / PARTIALLY_DUPLICATE / DUPLICATE / NOT_TESTABLE_YET`.

- [ ] **Step 1: Extend the contract RED for walkthrough/writing artifacts**

Add tests that require both docs and exact tokens:

```python
    def test_walkthrough_has_eight_beats_and_information_guard(self):
        text = (PACK_DIR / "01_46_MINUTE_WALKTHROUGH.md").read_text(encoding="utf-8")
        for i in range(1, 9):
            self.assertIn(f"BEAT_{i:02d}", text)
        for token in ("PLAYER_KNOWS", "PLAYER_CHOOSES", "SYSTEM_CHANGES", "MUST_REMAIN_UNKNOWN"):
            self.assertGreaterEqual(text.count(token), 8)
        self.assertIn("46 = TARGET_HYPOTHESIS_NOT_HUMAN_VALIDATION", text)

    def test_writing_audit_covers_w1_to_w7_and_cap_10(self):
        text = (PACK_DIR / "02_W1_W7_WRITING_LOAD_AUDIT.md").read_text(encoding="utf-8")
        for i in range(1, 8):
            self.assertIn(f"W{i}", text)
        self.assertIn("RECOVERY_INCLUSIVE_CAP: 10", text)
        self.assertIn("DISTINCT", text)
```

Run and confirm FAIL because docs do not exist.

- [ ] **Step 2: Create the eight-beat walkthrough with exact beat/time mapping**

Use these beat IDs and timing rows:

```text
BEAT_01 00–06 SCHOOL_SAFE_PRECEDENT       W1 W2 W3
BEAT_02 06–11 CAMPUS_MICRO_CRAFTING       W4
BEAT_03 11–14 FREE_SCHEDULE               REST|PREPARE|SOCIAL|PRACTICUM
BEAT_04 14–23 FROSTBLOOM_INVESTIGATION    choose 2 of 4 + W5
BEAT_05 23–30 FIRST_MAJOR_SOLUTION         W6 + FIVE_POINT_STAR + explicit target/use
BEAT_06 30–39 OLD_REVISION_AND_REDESIGN   preserve W6 + one pressure source + W7
BEAT_07 39–44 RESULT_AND_GRIMOIRE          five axes + causal record
BEAT_08 44–46 PORTFOLIO_AND_PREVIEW        compressed feedback + festival PREVIEW_ONLY
```

For each row write all four fields. `MUST_REMAIN_UNKNOWN` must explicitly forbid leaking a correct route/spell/circuit/target before the player has chosen it. Add footer token:

```text
46 = TARGET_HYPOTHESIS_NOT_HUMAN_VALIDATION
53 = CONTENT_REWORK_THRESHOLD
60 = HARD_STOP_HYPOTHESIS
```

- [ ] **Step 3: Create the W1–W7 distinctness audit with an initial internal verdict**

Write one row per event with `required_new_judgment`, `previous_event_difference`, `risk`, `internal_verdict`. Use:

```text
W1 SAFE_PRECEDENT_FLOW              DISTINCT
W2 SAFE_PRECEDENT_FOCUS             DISTINCT
W3 SAFE_PRECEDENT_DISPERSE          DISTINCT
W4 CRAFT_CONTEXT_MARKING            DISTINCT
W5 NONCOMBAT_FIELD_APPLICATION      DISTINCT
W6 FIRST_MAJOR_CONTEXTUAL_SOLUTION  DISTINCT
W7 REDESIGN_UNDER_NEW_CONTEXT       DISTINCT
RECOVERY_INCLUSIVE_CAP: 10
```

The doc must also state that these are design-review verdicts only; human fatigue remains `NOT_TESTABLE_YET`.

- [ ] **Step 4: Run contract GREEN and commit**

```bash
python -m unittest tests.test_frostbloom_internal_graybox_pack_contract -v
git add docs/testing/frostbloom_graybox/01_46_MINUTE_WALKTHROUGH.md docs/testing/frostbloom_graybox/02_W1_W7_WRITING_LOAD_AUDIT.md tests/test_frostbloom_internal_graybox_pack_contract.py
git commit -m "docs: add Frostbloom graybox walkthrough and writing audit"
```

---

### Task 3: Exhaustive Investigation 2-of-4 Matrix

**Files:**
- Create: `docs/testing/frostbloom_graybox/03_INVESTIGATION_2_OF_4_MATRIX.md`
- Modify: `data/testing/frostbloom_internal_graybox_pack_v1.json`
- Modify: `tests/test_frostbloom_internal_graybox_pack_contract.py`

**Interfaces:**
- Consumes: six `INV_PAIR_0N` IDs.
- Produces per-pair fields: `useful_context`, `remaining_uncertainty`, `forward_progress_to_w6`, `forbidden_answer_leak`, `verdict`.

- [ ] **Step 1: Extend RED tests for pair completeness and shortcut prohibition**

Add:

```python
    def test_each_investigation_pair_has_context_uncertainty_and_no_answer_lookup(self):
        data = self.load_fixture()
        forbidden = {"correct_route_id", "required_spell", "best_intent", "mandatory_hidden_third_clue"}
        for pair in data["investigation"]["pairs"]:
            self.assertGreaterEqual(len(pair["useful_context"]), 2, pair["id"])
            self.assertGreaterEqual(len(pair["remaining_uncertainty"]), 1, pair["id"])
            self.assertTrue(pair["forward_progress_to_w6"], pair["id"])
            self.assertTrue(forbidden.isdisjoint(pair.keys()), pair["id"])
            self.assertIn(pair["verdict"], data["allowed_verdicts"])
```

Run and confirm FAIL because detailed pair fields are missing.

- [ ] **Step 2: Add bounded graybox context tags to all six pairs**

Use only abstract internal tags, not final dialogue or a required-solution lookup. Populate as follows:

```text
INV_PAIR_01: [PRESSURE_OSCILLATION, ROOT_MAT_WATERLOGGING] / uncertainty [SPIRIT_RESPONSE, OLD_REPAIR_COUPLING]
INV_PAIR_02: [PRESSURE_OSCILLATION, SPIRIT_STATE_SHOCK] / uncertainty [ROOT_CONDITION, OLD_REPAIR_COUPLING]
INV_PAIR_03: [PRESSURE_OSCILLATION, OLD_REPAIR_COUPLING] / uncertainty [ROOT_CONDITION, SPIRIT_RESPONSE]
INV_PAIR_04: [ROOT_MAT_WATERLOGGING, SPIRIT_STATE_SHOCK] / uncertainty [PRESSURE_SOURCE, OLD_REPAIR_COUPLING]
INV_PAIR_05: [ROOT_MAT_WATERLOGGING, OLD_REPAIR_COUPLING] / uncertainty [PRESSURE_SOURCE, SPIRIT_RESPONSE]
INV_PAIR_06: [SPIRIT_STATE_SHOCK, OLD_REPAIR_COUPLING] / uncertainty [PRESSURE_SOURCE, ROOT_CONDITION]
```

Set every pair `forward_progress_to_w6: true` and initial internal `verdict: PASS`. The matrix doc must explain that equal information value is not required; coherent progress plus residual uncertainty is required.

- [ ] **Step 3: Add explicit anti-answer-leak text**

The Markdown matrix must contain:

```text
FORBIDDEN: correct_route_id
FORBIDDEN: required_spell
FORBIDDEN: best_intent
FORBIDDEN: mandatory_hidden_third_clue
```

Also state: if a later walkthrough shows one pair is a practical dead end or materially inferior because another pair reveals the answer, downgrade that pair to `RISK` or `FAIL`.

- [ ] **Step 4: Run GREEN and commit**

```bash
python -m unittest tests.test_frostbloom_internal_graybox_pack_contract -v
git add data/testing/frostbloom_internal_graybox_pack_v1.json docs/testing/frostbloom_graybox/03_INVESTIGATION_2_OF_4_MATRIX.md tests/test_frostbloom_internal_graybox_pack_contract.py
git commit -m "docs: audit all Frostbloom investigation pairs"
```

---

### Task 4: Free-Schedule Four-Choice Anti-Dominance Audit

**Files:**
- Create: `docs/testing/frostbloom_graybox/04_FREE_SCHEDULE_4_CHOICE_AUDIT.md`
- Modify: `data/testing/frostbloom_internal_graybox_pack_v1.json`
- Modify: `tests/test_frostbloom_internal_graybox_pack_contract.py`

**Interfaces:**
- Consumes: `REST / PREPARE / SOCIAL / PRACTICUM`.
- Produces per choice: `blocks_main_progress`, `owns_required_material`, `owns_required_answer`, `permanent_dominant_reward`, `later_choice_invalidated`, `verdict`.

- [ ] **Step 1: RED-test anti-dominance fields**

```python
    def test_free_schedule_choices_are_nonmandatory_and_non_dominant(self):
        data = self.load_fixture()
        for choice in data["free_schedule"]:
            self.assertFalse(choice["blocks_main_progress"], choice["id"])
            self.assertFalse(choice["owns_required_material"], choice["id"])
            self.assertFalse(choice["owns_required_answer"], choice["id"])
            self.assertFalse(choice["permanent_dominant_reward"], choice["id"])
            self.assertFalse(choice["later_choice_invalidated"], choice["id"])
            self.assertIn(choice["verdict"], data["allowed_verdicts"])
```

Run and confirm FAIL because the guard fields are missing.

- [ ] **Step 2: Add exact non-dominance guards to each JSON choice**

For all four choices add the five boolean fields above as `false` and `verdict: "PASS"`.

- [ ] **Step 3: Create the Markdown audit**

The audit must preserve the approved affordances:

```text
REST      -> SPIRIT_DISCOMFORT_CONTEXT
PREPARE   -> TOOL_CONTEXT_CONDITION
SOCIAL    -> PEOPLE_FACILITY_PERSPECTIVE
PRACTICUM -> FROST_PRESSURE_BEHAVIOR_CLUE
```

Add a dominance attack section comparing `uncertainty_removed`, `required_resource_owned`, and `tradeoff_cost`. The pack fails if one choice owns required progress or predictably dominates all three other choices without a tradeoff.

- [ ] **Step 4: Run GREEN and commit**

```bash
python -m unittest tests.test_frostbloom_internal_graybox_pack_contract -v
git add data/testing/frostbloom_internal_graybox_pack_v1.json docs/testing/frostbloom_graybox/04_FREE_SCHEDULE_4_CHOICE_AUDIT.md tests/test_frostbloom_internal_graybox_pack_contract.py
git commit -m "docs: audit Frostbloom free-schedule choice dominance"
```

---

### Task 5: W6 → Reveal → W7 Consequence-Preservation Cases

**Files:**
- Create: `docs/testing/frostbloom_graybox/05_W6_REVEAL_W7_CONSEQUENCE_CASES.md`
- Modify: `data/testing/frostbloom_internal_graybox_pack_v1.json`
- Modify: `tests/test_frostbloom_internal_graybox_pack_contract.py`

**Interfaces:**
- Produces three bounded internal cases `CASE_W6_A/B/C`; each has positive W6 dimension delta, preserved fact, reveal context, changed W7 judgment dimension, and no route-button input.

- [ ] **Step 1: RED-test preservation and W7 distinctness**

Replace the string-only `consequence_cases` entries with objects and add:

```python
    def test_w6_cases_preserve_real_improvement_and_w7_changes_judgment(self):
        data = self.load_fixture()
        allowed_change = {"meaning_and_circuit", "target", "intent_emphasis", "tradeoff", "contextual_use"}
        for case in data["consequence_cases"]:
            self.assertTrue(any(int(v) > 0 for v in case["w6_dimension_delta"].values()), case["id"])
            self.assertTrue(case["first_solution_preserved"], case["id"])
            self.assertTrue(set(case["w7_changed_judgment"]).intersection(allowed_change), case["id"])
            self.assertNotIn("route_id", case)
            self.assertNotIn("required_spell", case)
```

Run and confirm FAIL until the three objects are populated.

- [ ] **Step 2: Populate three internal semantic cases**

Use abstract tags and dimension deltas only; do not encode a canonical correct route.

```json
{
  "id": "CASE_W6_A",
  "w6_context_tags": ["PRESSURE_OSCILLATION", "ROOT_MAT_WATERLOGGING"],
  "w6_target_tag": "IRRIGATION_INTERFACE",
  "w6_dimension_delta": {"FACILITY": 2, "LIFE": 1, "SPIRIT": 0, "RELATIONSHIP": 0, "DISCOVERY": 0},
  "w6_cost_or_forgone": ["SPIRIT_UNCERTAINTY_REMAINS"],
  "old_revision_new_context": ["OLD_REPAIR_COUPLING", "SPIRIT_STATE_SHOCK"],
  "first_solution_preserved": true,
  "preserved_fact": "PRESSURE_REDUCTION_AND_ROOT_STABILITY_REMAIN_TRUE",
  "w7_changed_judgment": ["intent_emphasis", "contextual_use"],
  "w7_result_tags": ["REDUCE_STATE_SHOCK", "PRESERVE_REPAIRED_FLOW"],
  "verdict": "PASS"
}
```

Create `CASE_W6_B` and `CASE_W6_C` with different positive starting dimensions and different W7 changed-judgment fields. At least one must improve `SPIRIT` later without erasing a prior `FACILITY` or `LIFE` improvement; at least one must retain a meaningful tradeoff after W7.

- [ ] **Step 3: Create the Markdown case table with all ten required columns**

Required columns/tokens:

```text
W6_OBSERVED_CONTEXT
W6_MEANING_AND_CIRCUIT
W6_TARGET
W6_ACTUAL_IMPROVEMENT
W6_COST_OR_FORGONE_VALUE
OLD_REVISION_NEW_CONTEXT
PRESERVED_W6_FACT
NEW_TENSION
W7_CHANGED_JUDGMENT
W7_ACTUAL_RESULT
```

Add automatic-fail rule: any mechanical equivalent of “the first solution was meaningless/wrong and is erased” is `FAIL`.

- [ ] **Step 4: Run GREEN and commit**

```bash
python -m unittest tests.test_frostbloom_internal_graybox_pack_contract -v
git add data/testing/frostbloom_internal_graybox_pack_v1.json docs/testing/frostbloom_graybox/05_W6_REVEAL_W7_CONSEQUENCE_CASES.md tests/test_frostbloom_internal_graybox_pack_contract.py
git commit -m "docs: preserve Frostbloom first-solution consequence in graybox cases"
```

---

### Task 6: Five-Axis Result and Grimoire Causality Cases

**Files:**
- Create: `docs/testing/frostbloom_graybox/06_RESULT_AND_GRIMOIRE_CASES.md`
- Modify: `data/testing/frostbloom_internal_graybox_pack_v1.json`
- Modify: `tests/test_frostbloom_internal_graybox_pack_contract.py`

**Interfaces:**
- Consumes: completed consequence cases.
- Produces: `result_cases` with exactly five independent axes and complete causal Grimoire record fields.

- [ ] **Step 1: RED-test mixed results and Grimoire fields**

Add:

```python
    def test_result_cases_keep_five_axes_and_complete_grimoire_causality(self):
        data = self.load_fixture()
        expected_axes = data["result_dimensions"]
        required_fields = set(data["grimoire_required_fields"])
        self.assertGreaterEqual(len(data["result_cases"]), 3)
        mixed_found = False
        for case in data["result_cases"]:
            self.assertEqual(expected_axes, list(case["dimensions"].keys()), case["id"])
            values = list(case["dimensions"].values())
            mixed_found = mixed_found or (max(values) > 0 and min(values) <= 0)
            self.assertEqual(required_fields, set(case["grimoire"].keys()), case["id"])
            self.assertNotIn("SUCCESS_GRADE", case)
        self.assertTrue(mixed_found)
```

Run and confirm FAIL because `result_cases` is absent.

- [ ] **Step 2: Add three result cases mapped from CASE_W6_A/B/C**

Each must contain keys in exactly this order:

```text
FACILITY, LIFE, SPIRIT, RELATIONSHIP, DISCOVERY
```

Use at least one mixed result such as:

```json
{"FACILITY": 2, "LIFE": 1, "SPIRIT": -1, "RELATIONSHIP": 0, "DISCOVERY": 2}
```

Do not add `SUCCESS_GRADE` or any equivalent scalar replacement.

- [ ] **Step 3: Fill complete Grimoire causal records without unobserved knowledge**

Each `grimoire` object must contain exactly:

```text
observations
meaning_and_circuit
selected_target
intent_tags
actual_result
side_effects_and_forgone_values
discoveries
player_naming
```

Every causal statement must be traceable to that case’s listed investigation/free-schedule/W6/reveal evidence. If a cause would require an omitted clue, record it as uncertainty rather than fact.

- [ ] **Step 4: Create the Markdown cases, run GREEN, commit**

```bash
python -m unittest tests.test_frostbloom_internal_graybox_pack_contract -v
git add data/testing/frostbloom_internal_graybox_pack_v1.json docs/testing/frostbloom_graybox/06_RESULT_AND_GRIMOIRE_CASES.md tests/test_frostbloom_internal_graybox_pack_contract.py
git commit -m "docs: add Frostbloom result and Grimoire graybox cases"
```

---

### Task 7: Adversarial Walkthrough, Pack README, and CI Gate

**Files:**
- Create: `docs/testing/frostbloom_graybox/07_ADVERSARIAL_WALKTHROUGH.md`
- Create: `docs/testing/frostbloom_graybox/README.md`
- Modify: `data/testing/frostbloom_internal_graybox_pack_v1.json`
- Modify: `tests/test_frostbloom_internal_graybox_pack_contract.py`
- Modify: `.github/workflows/validate-base-v9-adoption.yml`

**Interfaces:**
- Consumes: all previous pack artifacts.
- Produces: `adversarial_cases` with exactly 14 IDs and final `pack_rollup` using closed verdicts.

- [ ] **Step 1: RED-test all fourteen adversarial IDs and evidence boundaries**

Add:

```python
    def test_adversarial_cases_cover_exactly_fourteen_attacks(self):
        data = self.load_fixture()
        self.assertEqual(data["adversarial_case_ids"], [x["id"] for x in data["adversarial_cases"]])
        self.assertEqual(14, len(data["adversarial_cases"]))
        for case in data["adversarial_cases"]:
            self.assertIn(case["verdict"], data["allowed_verdicts"])

    def test_pack_never_promotes_internal_review_to_human_evidence(self):
        readme = (PACK_DIR / "README.md").read_text(encoding="utf-8")
        for token in (
            "HUMAN_VALIDATION: NOT_RUN",
            "DEVICE_VALIDATION: NOT_RUN",
            "PERFORMANCE_VALIDATION: NOT_RUN",
            "FULL_SLICE_VALIDATION: NOT_RUN",
            "46_MINUTE_TARGET_NOT_VALIDATED_BY_INTERNAL_WALKTHROUGH",
        ):
            self.assertIn(token, readme)
```

Run and confirm FAIL until the adversarial cases/README exist.

- [ ] **Step 2: Populate exactly the fourteen approved adversarial cases**

Use the IDs already locked in the fixture. Each object requires:

```text
id
attack
expected_guard
observed_internal_result
verdict
requires_human_or_runtime
```

For purely structural/design attacks use `PASS`, `RISK`, or `FAIL`. For real comprehension, real elapsed time, device/accessibility/performance, or runtime behavior use `NOT_TESTABLE_YET` rather than guessing.

At pack completion, `FAIL` means stop/rework before Task8 handoff if the failure is inside the approved Graybox scope. `RISK` must include a bounded follow-up note but does not automatically block unless it breaks a hard invariant.

- [ ] **Step 3: Create README execution order and rollup rules**

README must state:

```text
EXECUTION_ORDER: 01 -> 02 -> 03 -> 04 -> 05 -> 06 -> 07
HUMAN_VALIDATION: NOT_RUN
DEVICE_VALIDATION: NOT_RUN
PERFORMANCE_VALIDATION: NOT_RUN
FULL_SLICE_VALIDATION: NOT_RUN
46_MINUTE_TARGET_NOT_VALIDATED_BY_INTERNAL_WALKTHROUGH
PERSISTENT_GODOT_SOURCE_MUTATION: NONE
TASK8: NEXT_NEW_WORK_UNIT_AFTER_PACK_COMPLETE
```

Rollup rule:

```text
BLOCKED = any hard-invariant FAIL
READY_WITH_RISKS = zero FAIL and one-or-more RISK
INTERNAL_PACK_PASS = zero FAIL; NOT_TESTABLE_YET may remain only on out-of-scope human/runtime/device/performance questions
```

- [ ] **Step 4: Add the contract to planning CI**

In `.github/workflows/validate-base-v9-adoption.yml`, add immediately after the existing Frostbloom/prework planning tests:

```yaml
- run: python -m unittest tests.test_frostbloom_internal_graybox_pack_contract -v
```

- [ ] **Step 5: Run complete planning contract GREEN**

Run:

```bash
python -m unittest tests.test_frostbloom_internal_vertical_slice_contract -v
python -m unittest tests.test_prework_benchmark_industry_research_contract -v
python -m unittest tests.test_frostbloom_internal_graybox_pack_contract -v
```

Expected: all PASS. This remains planning/internal-graybox evidence only.

- [ ] **Step 6: Commit Task 7**

```bash
git add docs/testing/frostbloom_graybox/README.md docs/testing/frostbloom_graybox/07_ADVERSARIAL_WALKTHROUGH.md data/testing/frostbloom_internal_graybox_pack_v1.json tests/test_frostbloom_internal_graybox_pack_contract.py .github/workflows/validate-base-v9-adoption.yml
git commit -m "test: complete Frostbloom internal graybox pack"
```

---

### Task 8: Exact-Head Review, Completion Sync, and Task8 Queue Handoff

**Files:**
- Create: `docs/planning/sync/GR-SYNC-20260811-16-FROSTBLOOM-GRAYBOX-PACK-COMPLETE.md`
- Modify: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- Google Sheet: `00_프로젝트_허브`, `01_작업순서`, `02_현재_확정결정`, `04_누락_충돌_감사`, `99_변경이력`.

**Interfaces:**
- Consumes: completed pack and exact-head GitHub validation.
- Produces: same Decision ID with completion sync `GR-SYNC-20260811-16-FROSTBLOOM-GRAYBOX-PACK-COMPLETE`, and an explicit next-work-unit marker for Task8 resume under `GM-SPELL-WORKFLOW-UI-V2-01`.

- [ ] **Step 1: Adversarially review the final diff before status promotion**

Verify all of the following from the exact branch head:

```text
seven pack blocks exist
six investigation pairs exist exactly once
four free-schedule choices exist exactly once
W6 preservation hard invariant passes
W7 changed-judgment invariant passes
five result axes remain independent
14 adversarial IDs exist
human/device/performance/full-slice remain NOT_RUN
no .gd/.tscn/.tres/.res/project.godot delta
no Task8 source delta
no historical 3x3 promotion
no separate exam required content
no competitor expression copy
```

Any hard-invariant `FAIL` blocks completion promotion.

- [ ] **Step 2: Run exact-head planning validation and inspect changed paths**

Run the three unittest commands from Task 7, then inspect the branch diff against current `main`. Expected protected product/Godot source delta: `NONE`.

- [ ] **Step 3: Create Sync16 completion artifact and update current consumer**

Sync16 must record:

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
sync_id: GR-SYNC-20260811-16-FROSTBLOOM-GRAYBOX-PACK-COMPLETE
pack_status: INTERNAL_PACK_PASS | READY_WITH_RISKS | BLOCKED
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
persistent_godot_source_mutation: NONE
next_work_unit: TASK8_SPELL_USE_SCREEN_RESUME
next_work_unit_decision: GM-SPELL-WORKFLOW-UI-V2-01
next_work_unit_requires_fresh_research: true
```

`CURRENT_CONFIRMED_DECISIONS.md` must keep D as the current planning decision but advance the Graybox child state to the final pack status and state that Task8 resume is next, not already complete.

- [ ] **Step 4: Commit/push/open PR and validate exact PR head**

Commit message:

```text
docs: finalize Frostbloom internal graybox pack
```

Open an isolated PR from this branch to `main`. Require planning contract CI green and unresolved review threads `0` before merge. Do not claim Godot/headless/Human/Device/Performance evidence from this PR.

- [ ] **Step 5: Merge only if exact-head review remains green**

Use expected-head merge protection. After merge, refetch `origin/main`, verify the merged SHA and the pack files from main, then update the Google Sheet with the same Decision ID and Sync16.

- [ ] **Step 6: Sheet write/readback and stop at Task8 boundary**

Sheet must record `INTERNAL_PACK_PASS` or `READY_WITH_RISKS`/`BLOCKED` exactly as observed, not preselected. Read back all five updated areas. After readback, stop this work unit.

The next substantive unit is:

```text
FRESH_BASE_PROJECT_SHEET
→ FRESH_TASK8_BRANCH/PR/LOCAL_CHECKPOINT
→ FRESH_BENCHMARK_AND_INDUSTRY_RESEARCH
→ TASK8_OPERATIONAL_STATUS_RESUME_SYNC
→ TASK8_EXECUTION
```

Do not reuse this Graybox Research Receipt for Task8, because product scope and comparison set change.

---

## Plan Self-Review Checklist

Before execution, verify:

1. Every design requirement maps to a Task above.
2. The plan contains no `TBD`, `TODO`, “similar to Task N”, or unspecified edge-case step.
3. Stable IDs match between fixture, docs, and tests.
4. The plan never requires persistent Godot authoring.
5. Internal `PASS` cannot be misread as human/time/device/performance validation.
6. Task8 remains a separate fresh work unit after pack completion.

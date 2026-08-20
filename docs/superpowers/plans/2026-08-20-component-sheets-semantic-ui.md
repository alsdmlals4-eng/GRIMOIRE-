# GRIMOIRE Component Sheets A–D & Semantic UI Components Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the approved Component Pack 1A/1B as reusable Godot semantic UI components and four rendered Component Sheets without changing gameplay, resource mutation, or Spell Workflow ownership.

**Architecture:** Extend the existing `GrimoireThemeFactory` and `StarCircuitBoard` rather than introducing a second UI/token or FIVE_POINT_STAR system. Add small read-only semantic composites under `src/ui/components/`, deterministic showcase sheets under `src/ui/component_sheets/`, and one dedicated contract/integration/capture pipeline that proves 1920×1080 visual-master assembly and 1280×720 minimum-regression behavior.

**Tech Stack:** Godot 4.7.1 GDScript, Godot Theme/Control/Container APIs, SVG assets already in the repository, Python 3.12 `unittest`, existing custom Godot test runner, GitHub Actions with Xvfb + GL Compatibility rendering.

**Spec:** `docs/superpowers/specs/2026-08-20-component-sheet-image-production-contract-design.md`

## Global Constraints

- Current project authority at plan creation: GRIMOIRE `main` `4c2f23c4bb8b7487559b113a5d41deab815fb62d`.
- Current Base observation at plan creation: Base `main` `e222e93e79e95364dca668eaaf0f156676123342`; reuse handoff says GRIMOIRE owns `FIVE_POINT_STAR`, composition, explicit Commit, lesson pacing, and field-practice experience.
- Reuse Base `RM-VIS-001 SEMANTIC_UI_SKIN_KIT` and `RM-VIS-002 GAMEPLAY_SYMBOL_ATLAS` only as structural contracts; project-specific Navy/Gold academy skin remains GRIMOIRE-owned.
- Visual authoring master: `1920×1080`, 16:9; safe margins at that reference are 64 px horizontal / 48 px vertical.
- Minimum PC readability regression: `1280×720`; no critical overlap, clipping, or sub-48×48 interactive controls.
- Shipping mobile battle/writing orientation remains landscape; narrow/portrait-width cases are component stress tests only, not a shipping orientation change.
- Reuse `src/ui/theme/grimoire_theme_factory.gd`; do not create a second token/theme authority.
- Reuse `src/ui/components/star_circuit_board.gd`; do not create a second FIVE_POINT_STAR renderer, validator, stock owner, or commit owner.
- Stage 2 remains circuit/base-preview authority with no Target/Mana mutation; Stage 3 remains explicit Target/final-preview/confirmation/atomic-use authority.
- `FOCUS != SELECTED`; color is never the only state channel; mobile cannot depend on Hover; Reduced Motion must permit immediate state replacement.
- Runtime copy remains `ENGLISH_SAFE_COPY_UNTIL_LICENSED_KOREAN_FONT`; Component Sheet documentation may explain Korean copy but runtime scenes introduced by this plan use English-safe sample strings only.
- Functional UI text, counts, success %, Mana, Focus/Selected/Disabled truth, Forecast wording, and Causal Thread content remain live UI—not baked imagery.
- Human visual validation, physical-device validation, performance validation, and Full Vertical Slice validation remain `NOT_RUN` throughout this plan.
- No Task8 mutation. If an active Task8 PR/path overlaps a planned file at execution time, stop and re-scope rather than editing the active work.

---

## File Structure

### Existing files to modify

- `src/ui/theme/grimoire_theme_factory.gd` — add only bounded variants needed by the approved component states; keep existing token constants as the sole color authority.
- `tests/test_runner.gd` — register the new Godot integration suite.

### New component files

- `src/ui/components/academy_panel.tscn` — reusable PanelContainer base scene using existing Theme variations.
- `src/ui/components/five_point_star_composer.gd`
- `src/ui/components/five_point_star_composer.tscn`
- `src/ui/components/context_header.gd`
- `src/ui/components/context_header.tscn`
- `src/ui/components/context_target_selector.gd`
- `src/ui/components/context_target_selector.tscn`
- `src/ui/components/commit_bar.gd`
- `src/ui/components/commit_bar.tscn`
- `src/ui/components/evidence_pin.gd`
- `src/ui/components/evidence_pin.tscn`
- `src/ui/components/forecast_card.gd`
- `src/ui/components/forecast_card.tscn`
- `src/ui/components/context_delta_card.gd`
- `src/ui/components/context_delta_card.tscn`
- `src/ui/components/result_axis_card.gd`
- `src/ui/components/result_axis_card.tscn`
- `src/ui/components/causal_thread.gd`
- `src/ui/components/causal_thread.tscn`

### New deterministic showcase/capture files

- `data/testing/component_sheet_samples_v1.json` — English-safe deterministic sample values for A–D.
- `src/ui/component_sheets/component_sheet_a_foundations.gd`
- `src/ui/component_sheets/component_sheet_a_foundations.tscn`
- `src/ui/component_sheets/component_sheet_b_spell_workflow.gd`
- `src/ui/component_sheets/component_sheet_b_spell_workflow.tscn`
- `src/ui/component_sheets/component_sheet_c_frostbloom_decision.gd`
- `src/ui/component_sheets/component_sheet_c_frostbloom_decision.tscn`
- `src/ui/component_sheets/component_sheet_d_result_grimoire.gd`
- `src/ui/component_sheets/component_sheet_d_result_grimoire.tscn`
- `tools/capture_component_sheets.gd` — deterministic 1920×1080 and 1280×720 captures for all four sheets.

### New tests/workflow/evidence files

- `tests/test_component_sheet_pack_contract.py`
- `tests/integration/test_component_sheet_pack.gd`
- `.github/workflows/validate-component-sheet-pack.yml`
- `docs/planning/COMPONENT_SHEET_PACK_01_ADVERSARIAL_REVIEW_2026-08-20.md`
- `docs/planning/sync/GR-SYNC-20260820-33-COMPONENT-SHEET-PACK-IMPLEMENTATION.md`

---

### Task 1: Contract RED and deterministic sample fixture

**Files:**
- Create: `tests/test_component_sheet_pack_contract.py`
- Create: `tests/integration/test_component_sheet_pack.gd`
- Create: `data/testing/component_sheet_samples_v1.json`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: approved written spec, existing `GrimoireThemeFactory`, existing `StarCircuitBoard`.
- Produces: hard file/API/semantic requirements that every later task must satisfy.

- [ ] **Step 1: Write the Python RED contract**

Create `tests/test_component_sheet_pack_contract.py` with path checks for all new component/sheet files and these semantic guards:

```python
from pathlib import Path
import json
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
THEME = ROOT / "src/ui/theme/grimoire_theme_factory.gd"
SPEC = ROOT / "docs/superpowers/specs/2026-08-20-component-sheet-image-production-contract-design.md"
FIXTURE = ROOT / "data/testing/component_sheet_samples_v1.json"

COMPONENTS = [
    "academy_panel.tscn",
    "five_point_star_composer.tscn",
    "context_header.tscn",
    "context_target_selector.tscn",
    "commit_bar.tscn",
    "evidence_pin.tscn",
    "forecast_card.tscn",
    "context_delta_card.tscn",
    "result_axis_card.tscn",
    "causal_thread.tscn",
]
SHEETS = [
    "component_sheet_a_foundations.tscn",
    "component_sheet_b_spell_workflow.tscn",
    "component_sheet_c_frostbloom_decision.tscn",
    "component_sheet_d_result_grimoire.tscn",
]

class ComponentSheetPackContractTests(unittest.TestCase):
    def test_required_component_and_sheet_files_exist(self):
        for name in COMPONENTS:
            self.assertTrue((ROOT / "src/ui/components" / name).is_file(), name)
        for name in SHEETS:
            self.assertTrue((ROOT / "src/ui/component_sheets" / name).is_file(), name)

    def test_existing_theme_remains_single_token_authority(self):
        theme = THEME.read_text(encoding="utf-8")
        self.assertIn('SURFACE_CANVAS := Color("071524")', theme)
        self.assertIn('LINE_GOLD_ACTIVE := Color("e2bd68")', theme)
        for path in (ROOT / "src/ui/components").glob("*.gd"):
            if path.name == "star_circuit_board.gd":
                continue
            text = path.read_text(encoding="utf-8")
            self.assertNotRegex(text, re.compile(r'Color\("(?:071524|0d2033|e2bd68|72d9e8)"\)', re.I), path.name)

    def test_fixture_preserves_frostbloom_semantics(self):
        data = json.loads(FIXTURE.read_text(encoding="utf-8"))
        self.assertEqual({"known": 2, "unknown": 2, "lens": "FIELD_HANDLING"}, data["evidence_pin"])
        self.assertEqual(
            ["KNOWN_IMPROVEMENT", "UNCERTAIN_CONSEQUENCE", "FINAL_TARGET_SUCCESS_BREAKDOWN", "MANA_COST"],
            list(data["forecast"].keys()),
        )
        self.assertEqual(["STILL_TRUE", "NEWLY_LEARNED", "NEW_TENSION"], list(data["context_delta"].keys()))
        self.assertEqual(["FACILITY", "LIFE", "SPIRIT", "RELATIONSHIP", "DISCOVERY"], list(data["result_axes"].keys()))
        self.assertEqual(
            ["OBSERVATION", "W6_CIRCUIT", "W6_TARGET", "W6_RESULT", "CONTEXT_DELTA", "W7_JUDGMENT", "W7_RESULT"],
            [item["kind"] for item in data["causal_thread"]],
        )

    def test_no_named_correct_route_or_global_grade_copy(self):
        text = FIXTURE.read_text(encoding="utf-8").lower()
        for forbidden in ("recommended", "best route", "correct route", "perfect", "s-rank", "a-rank"):
            self.assertNotIn(forbidden, text)

    def test_runtime_sample_copy_stays_english_safe_until_font_gate(self):
        for folder in (ROOT / "src/ui/components", ROOT / "src/ui/component_sheets"):
            for path in folder.glob("*.tscn"):
                self.assertNotRegex(path.read_text(encoding="utf-8"), re.compile(r"[가-힣]"), path.name)

if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Write the deterministic fixture**

Create `data/testing/component_sheet_samples_v1.json` exactly with this shape so visual captures and tests never invent hidden answers:

```json
{
  "schema_version": 1,
  "context": {"location": "FROSTBLOOM GREENHOUSE", "phase": "FIELD PRACTICUM", "task": "Read the live context before rewriting it."},
  "targets": [
    {"id": "irrigation_valve", "label": "Irrigation Valve", "hint": "Pressure path currently observed."},
    {"id": "root_layer", "label": "Root Layer", "hint": "Living structure carrying the damage."},
    {"id": "spirit_channel", "label": "Spirit Channel", "hint": "Response remains partly unknown."}
  ],
  "evidence_pin": {"known": 2, "unknown": 2, "lens": "FIELD_HANDLING"},
  "forecast": {
    "KNOWN_IMPROVEMENT": "Pressure can be reduced at the selected target.",
    "UNCERTAIN_CONSEQUENCE": "Spirit response remains unresolved.",
    "FINAL_TARGET_SUCCESS_BREAKDOWN": {"percent": 72, "rows": [{"label": "Circuit", "value": "+18"}, {"label": "Observed context", "value": "+9"}]},
    "MANA_COST": 18
  },
  "context_delta": {
    "STILL_TRUE": "The accepted W6 pressure reduction remains real.",
    "NEWLY_LEARNED": "The revised flow exposed a deeper coupling.",
    "NEW_TENSION": "The spirit channel now shares the redirected load."
  },
  "result_axes": {
    "FACILITY": "Pressure stabilized.",
    "LIFE": "Root damage remains mixed.",
    "SPIRIT": "Response changed, not erased.",
    "RELATIONSHIP": "Field trust preserved.",
    "DISCOVERY": "A deeper revision coupling was revealed."
  },
  "causal_thread": [
    {"kind": "OBSERVATION", "text": "Two field observations were confirmed."},
    {"kind": "W6_CIRCUIT", "text": "FLOW was shaped with a bounded auxiliary choice."},
    {"kind": "W6_TARGET", "text": "Root Layer was selected."},
    {"kind": "W6_RESULT", "text": "Pressure reduction was accepted and persisted."},
    {"kind": "CONTEXT_DELTA", "text": "A deeper coupling became observable."},
    {"kind": "W7_JUDGMENT", "text": "The redesign changed target/tradeoff reasoning."},
    {"kind": "W7_RESULT", "text": "The new tension was addressed without deleting the W6 gain."}
  ]
}
```

- [ ] **Step 3: Write the Godot integration RED suite**

Create `tests/integration/test_component_sheet_pack.gd` with file-load and API assertions that intentionally fail until Tasks 2–5 create the components:

```gdscript
extends RefCounted

const COMPONENTS := {
    "composer": "res://src/ui/components/five_point_star_composer.tscn",
    "header": "res://src/ui/components/context_header.tscn",
    "targets": "res://src/ui/components/context_target_selector.tscn",
    "commit": "res://src/ui/components/commit_bar.tscn",
    "evidence": "res://src/ui/components/evidence_pin.tscn",
    "forecast": "res://src/ui/components/forecast_card.tscn",
    "delta": "res://src/ui/components/context_delta_card.tscn",
    "result": "res://src/ui/components/result_axis_card.tscn",
    "causal": "res://src/ui/components/causal_thread.tscn",
}

func run(case) -> void:
    for key in COMPONENTS:
        case.assert_true(FileAccess.file_exists(COMPONENTS[key]), "%s component scene exists" % key)
    case.assert_true(FileAccess.file_exists("res://src/ui/components/star_circuit_board.tscn"), "Existing StarCircuitBoard is preserved")
```

- [ ] **Step 4: Register the suite in the existing runner**

Add exactly one entry to `tests/test_runner.gd` after `test_star_ui_kit_scene.gd`:

```gdscript
"res://tests/integration/test_component_sheet_pack.gd",
```

- [ ] **Step 5: Run RED**

Run:

```bash
python -m unittest tests.test_component_sheet_pack_contract -v
.tooling/godot/4.7.1-stable/linux/Godot_v4.7.1-stable_linux.x86_64 --headless --path . --script res://tests/test_runner.gd
```

Expected: Python and Godot suites fail only on the not-yet-created component/sheet files; all pre-existing suites remain green.

- [ ] **Step 6: Commit RED evidence**

```bash
git add tests/test_component_sheet_pack_contract.py tests/integration/test_component_sheet_pack.gd tests/test_runner.gd data/testing/component_sheet_samples_v1.json
git commit -m "test(ui): define component sheet pack contract"
```

---

### Task 2: Extend the existing Theme and build Sheet A foundations

**Files:**
- Modify: `src/ui/theme/grimoire_theme_factory.gd`
- Create: `src/ui/components/academy_panel.tscn`
- Create: `src/ui/component_sheets/component_sheet_a_foundations.gd`
- Create: `src/ui/component_sheets/component_sheet_a_foundations.tscn`
- Modify: `tests/integration/test_component_sheet_pack.gd`

**Interfaces:**
- Consumes: existing constants and `GrimoireThemeFactory.create_theme()`.
- Produces: bounded type variations `AcademyPanelPinned`, `AcademyPanelModal`, `AcademyButtonCaution`, `AcademyButtonQuiet`, `AcademyBadgeSelected`, `AcademyBadgeUnknown` while preserving all predecessor variations.

- [ ] **Step 1: Extend the integration test before Theme work**

Add assertions that `GrimoireThemeFactory.create_theme()` exposes the new variations and still exposes predecessor variations:

```gdscript
var theme_factory = load("res://src/ui/theme/grimoire_theme_factory.gd")
var theme: Theme = theme_factory.create_theme()
for variation in [
    &"AcademyPanel", &"AcademyPanelEmphasis", &"AcademyPanelPinned", &"AcademyPanelModal",
    &"AcademyButton", &"AcademyButtonPrimary", &"AcademyButtonCaution", &"AcademyButtonQuiet",
    &"AcademyBadge", &"AcademyBadgeSelected", &"AcademyBadgeUnknown"
]:
    case.assert_true(theme.get_type_variation_base(variation) != &"", "%s theme variation exists" % variation)
```

- [ ] **Step 2: Run focused Godot RED**

Run the full custom runner. Expected: only the new variation assertions fail.

- [ ] **Step 3: Add bounded variations using existing constants only**

In `grimoire_theme_factory.gd`, add registrations inside the existing panel/button/badge configuration functions. Do not add new color literals; derive styles from existing constants. The intended mappings are:

```text
AcademyPanelPinned  = SURFACE_INSET + PLAYER_CYAN border + PANEL_RADIUS
AcademyPanelModal   = SURFACE_PANEL_EMPHASIS + LINE_GOLD_ACTIVE 2px border
AcademyButtonCaution= SURFACE_PANEL + WARNING_AMBER 2px border + existing focus box
AcademyButtonQuiet  = SURFACE_INSET + LINE_BRASS 1px border + existing focus box
AcademyBadgeSelected= SURFACE_INSET + PLAYER_CYAN 2px border
AcademyBadgeUnknown = SURFACE_INSET + WARNING_AMBER 1px dashed-equivalent semantic marker via icon/label; no failure/red semantics
```

Use `_style_box()` and `_set_button_set()` rather than duplicating StyleBox construction.

- [ ] **Step 4: Create the base Academy Panel scene**

Create `academy_panel.tscn` with a `PanelContainer` root, `theme_type_variation = &"AcademyPanel"`, and a single `MarginContainer/Content` child slot. No baked copy and no local color overrides.

- [ ] **Step 5: Build deterministic Sheet A**

`component_sheet_a_foundations.gd` must call `GrimoireThemeFactory.create_theme()` in `_ready()` and expose `initialize_demo()` so the capture tool can reset it. Sheet A displays:

```text
Panel row: STANDARD / ELEVATED / PINNED / MODAL
Button row: PRIMARY / SECONDARY / CAUTION / QUIET / DISABLED
Badge row: DEFAULT / SELECTED / UNKNOWN
State comparison: FOCUS vs SELECTED vs CAUTION vs DISABLED
Context Header placeholder block reserved for Task 3
```

Use English-safe labels only and a neutral Navy canvas.

- [ ] **Step 6: Run Python + Godot tests**

Expected: Theme/foundation assertions green; failures remain only for Tasks 3–5 missing components/sheets.

- [ ] **Step 7: Commit foundations**

```bash
git add src/ui/theme/grimoire_theme_factory.gd src/ui/components/academy_panel.tscn src/ui/component_sheets/component_sheet_a_foundations.* tests/integration/test_component_sheet_pack.gd
git commit -m "feat(ui): add component sheet foundations"
```

---

### Task 3: Build Spell Workflow semantic composites and Sheet B

**Files:**
- Create: `src/ui/components/five_point_star_composer.gd`
- Create: `src/ui/components/five_point_star_composer.tscn`
- Create: `src/ui/components/context_header.gd`
- Create: `src/ui/components/context_header.tscn`
- Create: `src/ui/components/context_target_selector.gd`
- Create: `src/ui/components/context_target_selector.tscn`
- Create: `src/ui/components/commit_bar.gd`
- Create: `src/ui/components/commit_bar.tscn`
- Create: `src/ui/component_sheets/component_sheet_b_spell_workflow.gd`
- Create: `src/ui/component_sheets/component_sheet_b_spell_workflow.tscn`
- Modify: `tests/integration/test_component_sheet_pack.gd`

**Interfaces:**
- Produces: read-only/view-input APIs; no stock, Mana, validator, or commit transaction calls.

`FivePointStarComposer`:

```gdscript
signal slot_requested(role: StringName, index: int)
func set_visual_state(state: StringName, active_vertices: int, cause_vertex: int = -1) -> void
func visual_snapshot() -> Dictionary
```

`ContextHeader`:

```gdscript
func configure(location_text: String, phase_text: String, task_text: String) -> void
func visual_snapshot() -> Dictionary
```

`ContextTargetSelector`:

```gdscript
signal target_selected(target_id: StringName)
func configure_targets(targets: Array[Dictionary], selected_id: StringName = &"") -> void
func visual_snapshot() -> Dictionary
```

`CommitBar`:

```gdscript
signal edit_requested
signal commit_requested
func configure(target_label: String, mana_cost: int, can_commit: bool, confirmation_required: bool) -> void
func visual_snapshot() -> Dictionary
```

- [ ] **Step 1: Expand integration tests for the exact APIs and ownership boundary**

Instantiate each scene, call the setters, and assert snapshots. Also inspect scripts as text in the Python contract and forbid these tokens in the four new scripts:

```text
consume_mana
reserve_for_spell
confirm_commit
AtomicSpellUseService
TypedGlyphStockPool
StarCircuitValidator
```

- [ ] **Step 2: Run RED**

Expected: API assertions fail because the scripts/scenes do not yet exist.

- [ ] **Step 3: Implement `FivePointStarComposer` as a wrapper, not a fork**

The scene must instance `res://src/ui/components/star_circuit_board.tscn` as `StarCircuitBoard` and create one main + five auxiliary `Button` controls using `GlyphSlotMain` / `GlyphSlot`. `set_visual_state()` delegates directly to the existing board:

```gdscript
func set_visual_state(state: StringName, active_vertices: int, cause_vertex: int = -1) -> void:
    $StarCircuitBoard.set_visual_state(state, active_vertices, cause_vertex)

func visual_snapshot() -> Dictionary:
    var board: Dictionary = $StarCircuitBoard.visual_snapshot()
    return {
        "state": board.state,
        "active_vertices": board.active_vertices,
        "cause_vertex": board.cause_vertex,
        "main_slot_role": &"MAIN",
        "aux_slot_count": 5,
    }
```

Button presses emit `slot_requested` only; they do not mutate inventory/circuit validity.

- [ ] **Step 4: Implement `ContextHeader`**

Use Panel/Label/Badge primitives. `configure()` updates only live Label text and returns the same three strings from `visual_snapshot()`.

- [ ] **Step 5: Implement `ContextTargetSelector`**

Create one Button per supplied dictionary with required keys `id`, `label`, `hint`. Set button metadata `target_id`; emit `target_selected(StringName(id))` on press. Selection styling uses `AcademyBadgeSelected` or Button focus/selected treatment; do not add recommendation/best-route logic.

- [ ] **Step 6: Implement `CommitBar`**

Use a target summary Label, Mana Label, Edit Button, Commit Button. `configure()` sets Commit disabled when `can_commit == false`; confirmation changes copy/state only. Emit signals only.

- [ ] **Step 7: Build Sheet B**

Load `component_sheet_samples_v1.json`; compose Context Header + Five Point Star Composer + Target Selector + Commit Bar and show four labeled demonstration states:

```text
EDIT → TARGET → FINAL → CONFIRM
```

The same Composer instance changes visual state; do not render four unrelated frame families.

- [ ] **Step 8: Run tests and predecessor regressions**

Run Python contract and full Godot runner. Expected: all Spell Workflow component assertions green and all predecessor Star Circuit suites unchanged.

- [ ] **Step 9: Commit Spell Workflow composites**

```bash
git add src/ui/components/five_point_star_composer.* src/ui/components/context_header.* src/ui/components/context_target_selector.* src/ui/components/commit_bar.* src/ui/component_sheets/component_sheet_b_spell_workflow.* tests/integration/test_component_sheet_pack.gd tests/test_component_sheet_pack_contract.py
git commit -m "feat(ui): add spell workflow semantic components"
```

---

### Task 4: Build Persistent Evidence, W6 Forecast, W7 Delta, and Sheet C

**Files:**
- Create: `src/ui/components/evidence_pin.gd`
- Create: `src/ui/components/evidence_pin.tscn`
- Create: `src/ui/components/forecast_card.gd`
- Create: `src/ui/components/forecast_card.tscn`
- Create: `src/ui/components/context_delta_card.gd`
- Create: `src/ui/components/context_delta_card.tscn`
- Create: `src/ui/component_sheets/component_sheet_c_frostbloom_decision.gd`
- Create: `src/ui/component_sheets/component_sheet_c_frostbloom_decision.tscn`
- Modify: `tests/integration/test_component_sheet_pack.gd`

**Interfaces:**

`EvidencePin`:

```gdscript
func configure(known_count: int, unknown_count: int, lens_label: String, compact: bool = false) -> void
func visual_snapshot() -> Dictionary
```

`ForecastCard`:

```gdscript
func configure(known_improvement: String, uncertain_consequence: String, success_percent: int, breakdown_rows: Array[Dictionary], mana_cost: int) -> void
func visual_snapshot() -> Dictionary
```

`ContextDeltaCard`:

```gdscript
func configure(still_true: String, newly_learned: String, new_tension: String) -> void
func visual_snapshot() -> Dictionary
```

- [ ] **Step 1: Add RED assertions for exact semantic fields**

Assert `EvidencePin.visual_snapshot()` returns `known=2`, `unknown=2`, `lens="FIELD_HANDLING"`; `ForecastCard` snapshot keys are exactly the approved four semantic fields; `ContextDeltaCard` keys are exactly `STILL_TRUE`, `NEWLY_LEARNED`, `NEW_TENSION`.

- [ ] **Step 2: Run RED**

Expected: only these new APIs fail.

- [ ] **Step 3: Implement `EvidencePin`**

Use `AcademyPanelPinned` with three Badge/Label regions. Unknown uses amber/diamond-or-unknown icon plus `UNKNOWN` wording, never danger-red/failure styling. `compact=true` changes Container visibility/layout only; it does not drop Unknown or Lens.

- [ ] **Step 4: Implement `ForecastCard`**

Render sections in this order and preserve all four simultaneously:

```text
KNOWN IMPROVEMENT
UNCERTAIN CONSEQUENCE
SUCCESS BREAKDOWN
MANA COST
```

Clamp display percentage to `0..100` for rendering safety, but do not calculate it. Breakdown rows are display-only label/value pairs. No hidden facts, target recommendation, or best-route copy is introduced.

- [ ] **Step 5: Implement `ContextDeltaCard`**

Use three stable blocks. `STILL_TRUE` receives preserved/steady iconography; `NEW_TENSION` uses caution semantics, not failure semantics. No action buttons exist inside the card.

- [ ] **Step 6: Build Sheet C with persistent handoff**

Show:

```text
Evidence Pin (same instance identity)
→ W6 Forecast
→ pinned W6 result anchor strip
→ W7 Context Delta
```

The Sheet must visibly demonstrate there is no duplicate “Decision Brief” and no second “Result Anchor recap screen”.

- [ ] **Step 7: Run tests and commit**

```bash
git add src/ui/components/evidence_pin.* src/ui/components/forecast_card.* src/ui/components/context_delta_card.* src/ui/component_sheets/component_sheet_c_frostbloom_decision.* tests/integration/test_component_sheet_pack.gd
git commit -m "feat(ui): add frostbloom decision components"
```

---

### Task 5: Build Result/Causal components and Sheet D

**Files:**
- Create: `src/ui/components/result_axis_card.gd`
- Create: `src/ui/components/result_axis_card.tscn`
- Create: `src/ui/components/causal_thread.gd`
- Create: `src/ui/components/causal_thread.tscn`
- Create: `src/ui/component_sheets/component_sheet_d_result_grimoire.gd`
- Create: `src/ui/component_sheets/component_sheet_d_result_grimoire.tscn`
- Modify: `tests/integration/test_component_sheet_pack.gd`

**Interfaces:**

`ResultAxisCard`:

```gdscript
const ALLOWED_AXES := [&"FACILITY", &"LIFE", &"SPIRIT", &"RELATIONSHIP", &"DISCOVERY"]
func configure(axis_id: StringName, summary: String, detail: String = "") -> void
func visual_snapshot() -> Dictionary
```

`CausalThread`:

```gdscript
const ALLOWED_KINDS := [&"OBSERVATION", &"W6_CIRCUIT", &"W6_TARGET", &"W6_RESULT", &"CONTEXT_DELTA", &"W7_JUDGMENT", &"W7_RESULT"]
func configure(receipts: Array[Dictionary]) -> void
func visual_snapshot() -> Dictionary
```

- [ ] **Step 1: Write RED assertions**

Assert five axis cards accept only the approved axis IDs; invalid axis IDs leave the card in an explicit `INVALID_AXIS` snapshot state instead of silently becoming a sixth axis. Assert Causal Thread preserves all seven receipt kinds in supplied order and does not add a summary grade.

- [ ] **Step 2: Run RED**

Expected: new Result/Causal assertions fail.

- [ ] **Step 3: Implement `ResultAxisCard`**

Use Academy Panel + icon slot + title + live summary/detail. No score, grade, star count, or aggregate result property exists in script or scene.

- [ ] **Step 4: Implement `CausalThread`**

Create one node row per receipt with kind label, live text, and connector. Use a vertical `VBoxContainer` as the canonical constrained layout. At wide widths, the parent Sheet may arrange nodes into a stepped flow; the component's data order remains unchanged. Unsupported kinds set `status=&"INVALID_RECEIPT_KIND"` and do not invent replacement content.

- [ ] **Step 5: Build Sheet D**

Show the five Result axes as `3 + 2` at 1920×1080 and stacked at constrained width. Below or beside them, render the seven-step Causal Thread. Add one “Portfolio Receipt” mini composition using existing Panel/Badge/Label primitives only; do not create a thirteenth core component.

- [ ] **Step 6: Run tests and commit**

```bash
git add src/ui/components/result_axis_card.* src/ui/components/causal_thread.* src/ui/component_sheets/component_sheet_d_result_grimoire.* tests/integration/test_component_sheet_pack.gd
git commit -m "feat(ui): add result and causal components"
```

---

### Task 6: Responsive layout, deterministic captures, and dedicated CI

**Files:**
- Create: `tools/capture_component_sheets.gd`
- Create: `.github/workflows/validate-component-sheet-pack.yml`
- Modify: `tests/test_component_sheet_pack_contract.py`
- Modify: `tests/integration/test_component_sheet_pack.gd`

**Interfaces:**
- Consumes: four Sheet scenes and existing Godot 4.7.1 setup tool.
- Produces: eight deterministic PNG evidence files: A–D at 1920×1080 and 1280×720.

- [ ] **Step 1: Add RED capture/workflow contract**

Python contract requires `tools/capture_component_sheets.gd`, workflow path, and exact artifact filenames:

```python
CAPTURES = [
    f"component-sheet-{sheet}-{size}.png"
    for sheet in "abcd"
    for size in ("1920x1080", "1280x720")
]
```

- [ ] **Step 2: Implement the capture script using the existing snapshot pattern**

Use the same `SubViewport`/`RenderingServer.force_draw` approach as `tools/capture_star_ui_snapshot.gd`. Define exact sheet paths and sizes:

```gdscript
const SHEETS := {
    "a": "res://src/ui/component_sheets/component_sheet_a_foundations.tscn",
    "b": "res://src/ui/component_sheets/component_sheet_b_spell_workflow.tscn",
    "c": "res://src/ui/component_sheets/component_sheet_c_frostbloom_decision.tscn",
    "d": "res://src/ui/component_sheets/component_sheet_d_result_grimoire.tscn",
}
const SIZES := [Vector2i(1920, 1080), Vector2i(1280, 720)]
```

For each pair: instantiate fresh scene, full-rect it, call `initialize_demo()` when available, wait five frames, save to `res://build/visual/component-sheet-{id}-{width}x{height}.png`, and fail if file size is under 10 KB.

- [ ] **Step 3: Strengthen integration layout assertions**

Instantiate every Sheet under a 1920×1080 and 1280×720 `SubViewport`. Assert all visible `BaseButton` descendants have `custom_minimum_size.x >= 48` and `.y >= 48` when they are interactive. Assert no Sheet root reports size outside its viewport and no required semantic component is hidden.

- [ ] **Step 4: Create dedicated CI**

`validate-component-sheet-pack.yml` must:

```text
checkout
→ setup Python 3.12
→ python -m unittest tests.test_component_sheet_pack_contract -v
→ setup Godot 4.7.1 via tools/setup_godot_toolchain.py
→ Godot --headless --import
→ Godot custom test_runner.gd
→ xvfb-run GL compatibility capture_component_sheets.gd
→ assert all 8 PNGs non-empty
→ upload build/visual/component-sheet-*.png + logs
```

Do not remove or weaken `validate-star-runtime-poc.yml`; the predecessor UI kit remains independently validated.

- [ ] **Step 5: Run local/focused verification**

Run Python contract, full Godot runner, import, and capture. Expected: 8 PNGs exist and all pre-existing suites remain green.

- [ ] **Step 6: Commit capture/CI**

```bash
git add tools/capture_component_sheets.gd .github/workflows/validate-component-sheet-pack.yml tests/test_component_sheet_pack_contract.py tests/integration/test_component_sheet_pack.gd
git commit -m "test(ui): add component sheet visual evidence pipeline"
```

---

### Task 7: Five-pass adversarial closure, PR, merge, and Notion readback

**Files:**
- Create: `docs/planning/COMPONENT_SHEET_PACK_01_ADVERSARIAL_REVIEW_2026-08-20.md`
- Create: `docs/planning/sync/GR-SYNC-20260820-33-COMPONENT-SHEET-PACK-IMPLEMENTATION.md`
- Modify only current pointers/Notion records after exact-head success; do not mutate unrelated runtime canon.

**Interfaces:**
- Produces: review evidence, exact-head workflow receipt, merged main SHA, TASK-13 revision/readback.

- [ ] **Step 1: Run whole-state adversarial pass 1 — duplicate authority attack**

Verify only `GrimoireThemeFactory` owns the approved token literals and only the existing `StarCircuitBoard` draws the FIVE_POINT_STAR. Record PASS/FAIL and exact paths.

- [ ] **Step 2: Run pass 2 — semantic dishonesty attack**

Inspect W6/W7/Result sample and component APIs for recommendation, hidden-known modifiers, W6 rollback, global score/grade, or retrospective correct-answer nodes. Record findings.

- [ ] **Step 3: Run pass 3 — responsive/accessibility structural attack**

Review 1920×1080 and 1280×720 captures plus automated hit-target checks; verify Focus and Selected differ, Unknown is not failure-red, and no hover-only critical information exists. Keep physical/device/human evidence `NOT_RUN`.

- [ ] **Step 4: Run pass 4 — Task8/product ownership attack**

Compare changed paths against any current open PRs and protected Spell Workflow files. If active Task8 owns an overlapping path, stop and rebase/re-scope; otherwise record `TASK8_SOURCE_DELTA: NONE` for this UI pack.

- [ ] **Step 5: Run pass 5 — scope/art creep attack**

Verify no background/portrait/full Festival art, no font package, no new gameplay engine, and no thirteenth component family was smuggled into this plan.

- [ ] **Step 6: Create the review and sync receipt**

The sync must explicitly record:

```yaml
decision_id: GM-COMPONENT-SHEET-IMAGE-PRODUCTION-CONTRACT-01
component_sheet_pack: A_B_C_D
existing_theme_reused: true
existing_star_circuit_board_reused: true
visual_master: 1920x1080
minimum_regression: 1280x720
human_visual_validation: NOT_RUN
physical_device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice_validation: NOT_RUN
```

- [ ] **Step 7: Open PR and inspect exact-head checks/review threads**

Require the new Component Sheet workflow plus all applicable existing Planning/Spell/Star/Godot workflows to finish successfully. GUT Formal Adoption may be path-filter skipped when applicable; do not relabel a skip as PASS.

- [ ] **Step 8: Squash merge only after clean exact-head readback**

Confirm `main` did not move into a conflicting owner path; then squash merge with expected head SHA.

- [ ] **Step 9: Update Notion TASK-13 after merge**

Increase Revision, keep area `비주얼`, record merged SHA and Sheet A–D artifact evidence. Mark the component-sheet implementation substage complete, but keep TASK-13 overall `진행 중` because image production is Plan 2. Human/Device/Performance/Full Slice remain `NOT_RUN`.

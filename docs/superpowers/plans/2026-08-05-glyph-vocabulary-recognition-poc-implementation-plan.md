# Glyph Vocabulary Recognition POC Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Implement a testable six-glyph recognition POC for `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, and `BURST`, while registering the approved 10+10 semantic Vocabulary without claiming unmeasured touch or human comprehension quality.

**Architecture:** Store semantic vocabulary and input templates as versioned JSON, load them through `GlyphDefinition` and `GlyphTemplateRepository`, and keep recognition behind a pure interface. `DollarOneRecognizer` provides a verified unistroke baseline; `DollarNRecognizer` expands and caches 2–3 stroke template permutations. `GlyphRecognitionService` returns immutable `RecognitionCandidate` values and never auto-confirms low-confidence or stale results. Successful Focus Scribe recognition writes only to a reserved exact Vault slot.

**Tech Stack:** Godot 4.7.1 stable, typed GDScript, JSON fixtures, Python 3.12 report validation, `$1` Unistroke and `$N` Multistroke reference algorithms adapted for a maximum of three strokes, GitHub Actions.

## Global Constraints

- Decision: `GM-GLYPH-VOCABULARY-V1-01`.
- Parent resource decision: `GM-GLYPH-VAULT-UNIVERSAL-STOCK-01`.
- Resource implementation prerequisite: `docs/superpowers/plans/2026-08-05-glyph-resource-foundation-poc-implementation-plan.md` through Task 7 GREEN.
- `RED_TEST_WRITTEN_FIRST` is mandatory for every recognizer or data behavior.
- Vocabulary semantic registry contains 10 Main and 10 Support glyphs.
- Runtime recognition scope is `SLICE_GLYPHS_6` only.
- Input glyphs prefer 1–3 strokes; advanced candidates may use 4 only after a separate approval.
- Ornamented display glyphs never enter recognition input.
- Recognition input is normalized inside a square independent of device pixels.
- Low confidence never auto-confirms: `LOW_CONFIDENCE_REQUIRES_RETRY`.
- Stale recognition results never mutate the active writing session.
- Recognition accuracy, draw fatigue, meaning comprehension, and left/right-hand parity remain `HUMAN_NOT_RUN` until measured.
- Direct drawing creates one exact Vault glyph only after successful selected-glyph matching.
- Drawing accuracy does not increase power, mana efficiency, or resource quantity.
- ML, cloud recognition, biometric profiling, final SVG art, and production balance are prohibited in this POC.
- Visible screens display `POC / TEST_VALUE / NOT_CONTENT_COMPLETE`.

---

## File Map

```text
data/glyphs/v1/glyph_vocabulary_v1.json             Approved 10+10 semantic registry
data/glyphs/v1/slice_templates/*.json               Developer templates for six Slice glyphs
src/input/glyph_definition.gd                        Validated immutable GlyphDefinition
src/input/glyph_template_repository.gd               JSON template loading, validation, and cache
src/input/recognition_candidate.gd                   Immutable RecognitionCandidate
src/input/point_cloud_math.gd                        Resample, rotate, scale, translate, path distance
src/input/dollar_one_recognizer.gd                   DollarOneRecognizer baseline
src/input/dollar_n_recognizer.gd                     Three-stroke-bounded DollarNRecognizer
src/input/glyph_recognition_service.gd               Candidate ranking, thresholds, stale revision guards
src/input/focus_scribe_recognition_coordinator.gd     Selected glyph match and Vault completion
src/ui/glyph_writing_view_model.gd                    Candidate/retry/error read-only UI model
tests/fixtures/glyphs/*.json                         Positive, confusing, incomplete, and noisy samples
tests/unit/test_glyph_definition.gd                   Vocabulary schema and role tests
tests/unit/test_glyph_template_repository.gd          Template validation tests
tests/unit/test_dollar_one_recognizer.gd              Reference algorithm tests
tests/unit/test_dollar_n_recognizer.gd                Multi-stroke ordering/direction tests
tests/unit/test_glyph_recognition_service.gd          Confidence and stale-result tests
tests/unit/test_focus_scribe_recognition.gd           Exact selected-glyph Vault integration tests
tests/unit/test_glyph_writing_view_model.gd           Accessible state-copy tests
tests/integration/test_slice_glyph_recognition.gd     Six-glyph end-to-end fixture matrix
tools/build_glyph_confusion_report.py                 Deterministic confusion_matrix report builder
tests/test_glyph_confusion_report.py                  Report schema and threshold contract
artifacts/foundation-poc/glyph-confusion-report.json  Generated automated fixture evidence
docs/validation/GLYPH_RECOGNITION_POC_REPORT.md       Exact-head evidence and limits
docs/planning/GLYPH_RECOGNITION_POC_STOP_GATE_01_2026-08-05.md Stop/continue decision
```

## Public Interfaces

```gdscript
class_name GlyphDefinition
static func from_dict(data: Dictionary) -> Dictionary
func is_main() -> bool
func is_support() -> bool
func is_slice_enabled() -> bool

class_name GlyphTemplateRepository
static func load_from_paths(vocabulary_path: String, template_directory: String) -> Dictionary
func definition(glyph_id: StringName) -> GlyphDefinition
func templates(glyph_id: StringName) -> Array[Dictionary]
func slice_glyph_ids() -> Array[StringName]

class_name RecognitionCandidate
static func create(glyph_id: StringName, score: float, distance: float, template_id: StringName, input_revision: int) -> RecognitionCandidate
func to_dict() -> Dictionary

class_name DollarOneRecognizer
func compile(template_points: PackedVector2Array) -> PackedVector2Array
func distance(input_points: PackedVector2Array, compiled_template: PackedVector2Array) -> float

class_name DollarNRecognizer
func compile(strokes: Array[PackedVector2Array]) -> Array[PackedVector2Array]
func best_distance(input_strokes: Array[PackedVector2Array], compiled_variants: Array[PackedVector2Array]) -> float

class_name GlyphRecognitionService
static func create(repository: GlyphTemplateRepository, threshold: float, margin: float) -> GlyphRecognitionService
func recognize(strokes: Array[PackedVector2Array], input_revision: int) -> Dictionary
func accept(candidate: RecognitionCandidate, current_revision: int) -> Dictionary
```

---

### Task 1: Register the Approved 10+10 Vocabulary as Validated Data

**Files:**
- Create: `data/glyphs/v1/glyph_vocabulary_v1.json`
- Create: `src/input/glyph_definition.gd`
- Create: `tests/unit/test_glyph_definition.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: Decision `GM-GLYPH-VOCABULARY-V1-01`.
- Produces: validated `GlyphDefinition` values and a semantic registry with exactly 10 Main and 10 Support entries.

- [ ] **Step 1: Write the failing schema test**

```gdscript
# tests/unit/test_glyph_definition.gd
extends RefCounted

const Definition = preload("res://src/input/glyph_definition.gd")

func run(case) -> void:
    var parsed = Definition.from_dict({
        "id": "HEAT",
        "name_ko": "열",
        "role": "MAIN",
        "meaning": "온도 상승·가열",
        "preferred_strokes": 2,
        "slice_enabled": true
    })
    case.assert_equal(&"OK", parsed.status, "valid definition parses")
    case.assert_true(parsed.value.is_main(), "HEAT is Main")
    case.assert_true(parsed.value.is_slice_enabled(), "HEAT is Slice enabled")

    var invalid = Definition.from_dict({"id": "HEAT", "role": "UNKNOWN"})
    case.assert_equal(&"INVALID_GLYPH_DEFINITION", invalid.status, "invalid role is rejected")
```

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: FAIL because `GlyphDefinition` is missing.

- [ ] **Step 3: Implement `GlyphDefinition`**

Use immutable-style private fields and read-only methods. Valid roles are `MAIN` and `SUPPORT`. `preferred_strokes` must be 1–3. IDs must be uppercase ASCII with underscores. Required fields are `id`, `name_ko`, `role`, `meaning`, `preferred_strokes`, and `slice_enabled`.

- [ ] **Step 4: Add the complete registry data**

The JSON contains exactly these IDs:

```json
{
  "schema_version": 1,
  "decision_id": "GM-GLYPH-VOCABULARY-V1-01",
  "main": ["HEAT", "COLD", "WATER", "WIND", "LIGHT", "SHADOW", "PROTECT", "LIFE", "IMPACT", "PURIFY"],
  "support": ["FLOW", "FOCUS", "DISPERSE", "BURST", "ANCHOR", "SUSTAIN", "DELAY", "REPEAT", "PROJECT", "ABSORB"],
  "slice": ["HEAT", "PROTECT", "FLOW", "FOCUS", "DISPERSE", "BURST"]
}
```

Each entry also includes the Korean name, approved meaning, role, preferred stroke count, semantic shape description, and `ornament_is_recognition_input: false`.

- [ ] **Step 5: Add registry cardinality and uniqueness tests**

Load the JSON and assert 10 Main, 10 Support, 20 unique IDs, exactly six Slice IDs, no role overlap, and all Slice IDs exist in the registry.

- [ ] **Step 6: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add data/glyphs/v1/glyph_vocabulary_v1.json src/input/glyph_definition.gd tests/unit/test_glyph_definition.gd tests/test_runner.gd
git commit -m "feat: register approved glyph vocabulary v1"
```

---

### Task 2: Load and Validate Slice Template Fixtures

**Files:**
- Create: `src/input/glyph_template_repository.gd`
- Create: `data/glyphs/v1/slice_templates/heat-01.json`
- Create: `data/glyphs/v1/slice_templates/protect-01.json`
- Create: `data/glyphs/v1/slice_templates/flow-01.json`
- Create: `data/glyphs/v1/slice_templates/focus-01.json`
- Create: `data/glyphs/v1/slice_templates/disperse-01.json`
- Create: `data/glyphs/v1/slice_templates/burst-01.json`
- Create: `tests/unit/test_glyph_template_repository.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `GlyphDefinition` and versioned JSON.
- Produces: `GlyphTemplateRepository` with stable template IDs and normalized stroke arrays.

- [ ] **Step 1: Write the failing repository test**

```gdscript
func run(case) -> void:
    var loaded = GlyphTemplateRepository.load_from_paths(
        "res://data/glyphs/v1/glyph_vocabulary_v1.json",
        "res://data/glyphs/v1/slice_templates"
    )
    case.assert_equal(&"OK", loaded.status, "repository loads valid data")
    case.assert_equal(
        [&"BURST", &"DISPERSE", &"FLOW", &"FOCUS", &"HEAT", &"PROTECT"],
        loaded.value.slice_glyph_ids(),
        "Slice IDs are stable and sorted"
    )
    case.assert_true(loaded.value.templates(&"HEAT").size() >= 1, "HEAT has a template")
```

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

- [ ] **Step 3: Define the template JSON shape**

```json
{
  "schema_version": 1,
  "template_id": "heat-01",
  "glyph_id": "HEAT",
  "source": "DEVELOPER_REFERENCE",
  "strokes": [
    [[0.20, 0.80], [0.50, 0.15], [0.80, 0.80]],
    [[0.50, 0.68], [0.50, 0.38]]
  ]
}
```

All coordinates must be finite numbers in `[0, 1]`. Stroke count must match the definition's approved count. Every stroke needs at least two non-identical points. Repository load fails atomically when any file is invalid.

- [ ] **Step 4: Add negative tests before validation code**

Reject unknown glyph IDs, duplicate template IDs, points outside the square, empty strokes, repeated identical-only strokes, ornament fields inside recognition data, and more than three strokes.

- [ ] **Step 5: Implement repository load and cache**

Sort files and IDs deterministically. Convert point pairs to `PackedVector2Array`. Return a structured error containing the file path and reason; do not silently skip invalid templates.

- [ ] **Step 6: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/input/glyph_template_repository.gd data/glyphs/v1/slice_templates tests/unit/test_glyph_template_repository.gd tests/test_runner.gd
git commit -m "feat: load validated Slice glyph templates"
```

---

### Task 3: Implement Point-Cloud Math and DollarOneRecognizer Baseline

**Files:**
- Create: `src/input/point_cloud_math.gd`
- Create: `src/input/dollar_one_recognizer.gd`
- Create: `tests/unit/test_dollar_one_recognizer.gd`
- Create: `tests/fixtures/glyphs/flow-positive.json`
- Create: `tests/fixtures/glyphs/flow-reversed.json`
- Create: `tests/fixtures/glyphs/incomplete-line.json`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: one-stroke point arrays.
- Produces: compiled 64-point templates and normalized path distance.

- [ ] **Step 1: Write RED tests against known invariants**

```gdscript
func run(case) -> void:
    var recognizer = DollarOneRecognizer.new()
    var template = PackedVector2Array([
        Vector2(0.1, 0.2), Vector2(0.3, 0.6), Vector2(0.5, 0.4),
        Vector2(0.7, 0.8), Vector2(0.9, 0.6)
    ])
    var compiled = recognizer.compile(template)
    case.assert_equal(64, compiled.size(), "compiled template is resampled to 64 points")
    case.assert_near(0.0, recognizer.distance(template, compiled), 0.05, "self distance is near zero")

    var translated = PackedVector2Array()
    for point in template:
        translated.append(point + Vector2(4.0, -3.0))
    case.assert_near(
        recognizer.distance(template, compiled),
        recognizer.distance(translated, compiled),
        0.05,
        "translation is normalized"
    )
```

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

- [ ] **Step 3: Implement the reference pipeline**

`PointCloudMath` implements these pure functions:

```gdscript
static func path_length(points: PackedVector2Array) -> float
static func resample(points: PackedVector2Array, count: int) -> PackedVector2Array
static func indicative_angle(points: PackedVector2Array) -> float
static func rotate_by(points: PackedVector2Array, radians: float) -> PackedVector2Array
static func scale_to_square(points: PackedVector2Array, size: float) -> PackedVector2Array
static func translate_to_origin(points: PackedVector2Array) -> PackedVector2Array
static func path_distance(a: PackedVector2Array, b: PackedVector2Array) -> float
```

Reject fewer than two distinct points with `INSUFFICIENT_POINTS`. Use 64 resampled points and a normalized square size of `250.0`, matching the reference algorithm's scale convention.

- [ ] **Step 4: Add incomplete-input and numeric-stability tests**

Zero-length input, NaN coordinates, and one-point input must return structured errors instead of a candidate. Reversed FLOW remains a valid shape candidate only when the template definition allows direction reversal.

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/input/point_cloud_math.gd src/input/dollar_one_recognizer.gd tests/unit/test_dollar_one_recognizer.gd tests/fixtures/glyphs tests/test_runner.gd
git commit -m "feat: add DollarOneRecognizer baseline"
```

---

### Task 4: Implement Bounded DollarNRecognizer for Two- and Three-Stroke Glyphs

**Files:**
- Create: `src/input/dollar_n_recognizer.gd`
- Create: `tests/unit/test_dollar_n_recognizer.gd`
- Create: `tests/fixtures/glyphs/heat-positive.json`
- Create: `tests/fixtures/glyphs/heat-stroke-order-swapped.json`
- Create: `tests/fixtures/glyphs/burst-positive.json`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: 1–3 stroke arrays and `DollarOneRecognizer` normalization/distance.
- Produces: cached unistroke permutations and best distance.

- [ ] **Step 1: Write the failing multistroke tests**

```gdscript
func run(case) -> void:
    var recognizer = DollarNRecognizer.new()
    var heat = GlyphFixture.load_strokes("res://tests/fixtures/glyphs/heat-positive.json")
    var swapped = GlyphFixture.load_strokes(
        "res://tests/fixtures/glyphs/heat-stroke-order-swapped.json"
    )
    var compiled = recognizer.compile(heat)
    case.assert_equal(8, compiled.size(), "two strokes compile order and direction variants")
    case.assert_near(
        recognizer.best_distance(heat, compiled),
        recognizer.best_distance(swapped, compiled),
        0.05,
        "allowed stroke order variants remain equivalent"
    )
```

For three strokes, assert exactly `3! × 2^3 = 48` raw permutations before duplicate-path deduplication. One stroke produces two direction variants.

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

- [ ] **Step 3: Implement bounded permutation generation**

Generate all stroke orders and forward/reversed variants only during template compilation. Concatenate each variant into a unistroke, then use `DollarOneRecognizer.compile()`. Deduplicate compiled variants by rounded point hashes. Runtime input is compared against cached variants and does not regenerate permutations.

- [ ] **Step 4: Add performance and denial tests**

Reject four or more strokes with `STROKE_COUNT_OUT_OF_SLICE_SCOPE`. Assert compiled variant count never exceeds 48 for Slice templates. Record compile and match elapsed microseconds in test output without setting a production performance claim.

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/input/dollar_n_recognizer.gd tests/unit/test_dollar_n_recognizer.gd tests/fixtures/glyphs tests/test_runner.gd
git commit -m "feat: add bounded DollarNRecognizer for Slice glyphs"
```

---

### Task 5: Rank Immutable RecognitionCandidate Values and Guard Confidence

**Files:**
- Create: `src/input/recognition_candidate.gd`
- Create: `src/input/glyph_recognition_service.gd`
- Create: `tests/unit/test_glyph_recognition_service.gd`
- Create: `tests/fixtures/glyphs/heat-light-confusing.json`
- Create: `tests/fixtures/glyphs/flow-repeat-confusing.json`
- Create: `tests/fixtures/glyphs/incomplete-heat.json`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: repository and recognizers.
- Produces: sorted immutable candidates, confidence state, margin state, and stale revision rejection.

- [ ] **Step 1: Write the failing service tests**

```gdscript
func run(case) -> void:
    var service = GlyphRecognitionFixture.service(0.80, 0.10)
    var heat = GlyphFixture.load_strokes("res://tests/fixtures/glyphs/heat-positive.json")
    var result = service.recognize(heat, 7)
    case.assert_equal(&"CANDIDATE_READY", result.status, "known input produces candidate")
    case.assert_equal(&"HEAT", result.candidates[0].glyph_id(), "HEAT ranks first")
    case.assert_equal(7, result.candidates[0].input_revision(), "revision is preserved")

    var incomplete = GlyphFixture.load_strokes("res://tests/fixtures/glyphs/incomplete-heat.json")
    var low = service.recognize(incomplete, 8)
    case.assert_equal(&"LOW_CONFIDENCE_REQUIRES_RETRY", low.status, "incomplete input is not auto-confirmed")

    var stale = service.accept(result.candidates[0], 8)
    case.assert_equal(&"STALE_RECOGNITION_RESULT", stale.status, "stale candidate cannot mutate session")
```

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

- [ ] **Step 3: Implement `RecognitionCandidate`**

Private fields are `glyph_id`, `score`, `distance`, `template_id`, and `input_revision`. `to_dict()` returns a deep copy. Creation rejects scores outside `[0, 1]`, negative distances, and negative revisions.

- [ ] **Step 4: Implement candidate ranking**

Convert normalized distance to a bounded score through one documented function. Sort by descending score, then ascending glyph ID for deterministic ties. Return at most three distinct glyph IDs. Service status rules are exact:

```text
NO_VALID_INPUT
LOW_CONFIDENCE_REQUIRES_RETRY
AMBIGUOUS_CANDIDATES_REQUIRE_SELECTION
CANDIDATE_READY
STALE_RECOGNITION_RESULT
ACCEPTED
```

`CANDIDATE_READY` requires top score at or above threshold and top-minus-second margin at or above margin. The POC thresholds are constructor inputs and remain `TEST_VALUE`.

- [ ] **Step 5: Add confusing-pair tests**

`heat-light-confusing` and `flow-repeat-confusing` must return ambiguous or low-confidence status, never silently accept the nearest glyph. An input with the correct shape but wrong stroke count is rejected unless the definition explicitly allows that count.

- [ ] **Step 6: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/input/recognition_candidate.gd src/input/glyph_recognition_service.gd tests/unit/test_glyph_recognition_service.gd tests/fixtures/glyphs tests/test_runner.gd
git commit -m "feat: guard glyph recognition confidence and revisions"
```

---

### Task 6: Connect Recognition Success to Exact Vault Focus Scribe

**Files:**
- Create: `src/input/focus_scribe_recognition_coordinator.gd`
- Create: `tests/unit/test_focus_scribe_recognition.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `GlyphRecognitionService`, `VaultInventory`, selected `glyph_id`, scribe reservation ID, and writing-session revision.
- Produces: one exact Vault glyph on matching accepted recognition, or a safe retry/cancel result.

- [ ] **Step 1: Write the failing integration unit tests**

```gdscript
func run(case) -> void:
    var fixture = FocusScribeFixture.start(&"HEAT")
    var heat_candidate = fixture.candidate(&"HEAT", 0.93, 3)
    var success = fixture.coordinator.accept_candidate(heat_candidate, 3)
    case.assert_equal(&"VAULT_GLYPH_CREATED", success.status, "matching candidate completes scribe")
    case.assert_equal(1, fixture.vault.matching_available_count(&"HEAT"), "exact HEAT is stored")
    case.assert_equal(0, fixture.stock.current_total(), "Focus Scribe does not create Universal Stock")

    var wrong_fixture = FocusScribeFixture.start(&"HEAT")
    var flow_candidate = wrong_fixture.candidate(&"FLOW", 0.95, 4)
    var mismatch = wrong_fixture.coordinator.accept_candidate(flow_candidate, 4)
    case.assert_equal(&"RECOGNIZED_GLYPH_DOES_NOT_MATCH_SELECTED", mismatch.status, "wrong glyph cannot fill selected slot")
    case.assert_equal(0, wrong_fixture.vault.matching_available_count(&"FLOW"), "wrong glyph is not stored")
```

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

- [ ] **Step 3: Implement coordinator state transitions**

Constructor requires a valid `RESERVED_FOR_SCRIBE` reservation and selected glyph. Acceptance order:

```text
verify active reservation
verify current revision
verify candidate accepted by service
verify candidate glyph_id equals selected glyph_id
complete the exact Vault reservation
return immutable result
```

Low confidence, ambiguity, mismatch, stale revision, interruption, and mana-zero cancellation do not create Vault or Stock. Interruption releases the reserved Vault slot and discards active partial strokes.

- [ ] **Step 4: Add duplicate-success and interruption tests**

Calling success twice returns the first result and creates one glyph only. Direct HP loss, Focus loss, or background transition before acceptance returns `SCRIBE_INTERRUPTED` and leaves the slot EMPTY.

- [ ] **Step 5: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/input/focus_scribe_recognition_coordinator.gd tests/unit/test_focus_scribe_recognition.gd tests/test_runner.gd
git commit -m "feat: write recognized glyphs to exact Vault slots"
```

---

### Task 7: Generate a Deterministic confusion_matrix Report

**Files:**
- Create: `tools/build_glyph_confusion_report.py`
- Create: `tests/test_glyph_confusion_report.py`
- Create: `tests/integration/test_slice_glyph_recognition.gd`
- Modify: `tests/test_runner.gd`
- Generate: `artifacts/foundation-poc/glyph-confusion-report.json`

**Interfaces:**
- Consumes: fixture result JSON emitted by the headless integration suite.
- Produces: `confusion_matrix`, first-attempt fixture rate, false accept/reject counts, retry counts, and draw-time fields marked synthetic.

- [ ] **Step 1: Write the failing Python report test**

```python
from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "tools/build_glyph_confusion_report.py"


class GlyphConfusionReportTests(unittest.TestCase):
    def test_report_contains_six_by_six_confusion_matrix(self) -> None:
        self.assertTrue(SCRIPT.is_file())
        rows = [
            {"expected": "HEAT", "predicted": "HEAT", "status": "CANDIDATE_READY"},
            {"expected": "HEAT", "predicted": None, "status": "LOW_CONFIDENCE_REQUIRES_RETRY"},
        ]
        with tempfile.TemporaryDirectory() as temp:
            source = Path(temp) / "rows.json"
            source.write_text(json.dumps(rows), encoding="utf-8")
            completed = subprocess.run(
                [sys.executable, str(SCRIPT), str(source)],
                cwd=ROOT,
                capture_output=True,
                text=True,
                check=False,
            )
        self.assertEqual(0, completed.returncode, completed.stderr)
        report = json.loads(completed.stdout)
        self.assertEqual(6, len(report["confusion_matrix"]))
        self.assertEqual("SYNTHETIC_FIXTURES_ONLY", report["evidence_scope"])
```

- [ ] **Step 2: Run RED**

```bash
python -m unittest tests.test_glyph_confusion_report -v
```

- [ ] **Step 3: Implement the headless fixture matrix**

The GDScript integration suite emits one row per fixture with:

```json
{
  "fixture_id": "heat-positive",
  "expected": "HEAT",
  "predicted": "HEAT",
  "status": "CANDIDATE_READY",
  "top_score": 0.93,
  "second_score": 0.41,
  "elapsed_us": 320,
  "input_variant": "developer_reference"
}
```

Include positive, reversed/order variants where allowed, confusing pairs, incomplete shapes, noisy shapes, and unknown shapes for all six glyphs.

- [ ] **Step 4: Implement the report builder**

Output fields are exact:

```text
schema_version
decision_id
glyph_ids
confusion_matrix
fixture_first_attempt_match_rate
false_accept_count
false_reject_count
retry_required_count
median_recognition_us
evidence_scope
human_comprehension
physical_touch
```

`human_comprehension` and `physical_touch` remain `NOT_RUN`. A low-confidence retry is not counted as a false accept.

- [ ] **Step 5: Add threshold pre-registration**

Before generating the exact-head report, write `artifacts/foundation-poc/glyph-recognition-thresholds.json` with the threshold and margin used for the run. Tests fail if the result report uses thresholds not present in that preregistration file.

- [ ] **Step 6: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
python -m unittest tests.test_glyph_confusion_report -v
python tools/build_glyph_confusion_report.py artifacts/foundation-poc/glyph-fixture-rows.json > artifacts/foundation-poc/glyph-confusion-report.json
git add tools/build_glyph_confusion_report.py tests/test_glyph_confusion_report.py tests/integration/test_slice_glyph_recognition.gd tests/test_runner.gd artifacts/foundation-poc/glyph-recognition-thresholds.json artifacts/foundation-poc/glyph-confusion-report.json
git commit -m "test: report Slice glyph confusion matrix"
```

---

### Task 8: Expose Accessible Writing and Candidate States

**Files:**
- Create: `src/ui/glyph_writing_view_model.gd`
- Create: `tests/unit/test_glyph_writing_view_model.gd`
- Modify: `src/ui/mobile_safe_root.gd`
- Modify: `src/ui/mobile_safe_root.tscn`
- Modify: `tests/integration/test_mobile_safe_root.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: writing-session status and `RecognitionCandidate` values.
- Produces: color-independent labels, candidate buttons, retry actions, and preserved situation context.

- [ ] **Step 1: Write the view-model RED tests**

```gdscript
func run(case) -> void:
    var model = GlyphWritingViewModel.from_result({
        "status": &"LOW_CONFIDENCE_REQUIRES_RETRY",
        "candidates": [],
        "input_revision": 5
    })
    case.assert_equal("문양을 확인하지 못했습니다", model.title, "failure is explained")
    case.assert_equal("다시 그리기", model.primary_action_label, "retry path is explicit")
    case.assert_equal(&"RETRY", model.primary_action, "action is semantic")
    case.assert_true(model.has("status_icon_key"), "status is not color-only")
```

Add tests for ambiguous candidates, stale result, selected glyph mismatch, and accepted candidate. Candidate buttons include Korean name, role text, and shape key; color alone is insufficient.

- [ ] **Step 2: Run RED**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

- [ ] **Step 3: Implement the read-only view model**

It returns plain dictionaries and no domain mutation callbacks. Labels have pre-registered character budgets for 130% and Android 200% text scale. Buttons meet Android 48dp and iOS 44pt minimum interactive bounds in the layout matrix.

- [ ] **Step 4: Integrate only the POC Writing Focus panel**

Keep Objective, Threat/Timer, and Situation visible while the right panel expands. Show selected glyph, stroke count, candidate state, Undo, Delete, Cancel, Retry, and Confirm. Do not show numeric success probability, final art, or automatic solution hints.

- [ ] **Step 5: Add layout matrix tests**

Test `1280×720`, `1600×900`, `1920×1080`, and `2400×1080`; text scales `1.00`, `1.30`, and `2.00`; representative safe insets. Canvas and controls cannot obscure the timer or environment risk. Automated layout success does not replace physical-device touch validation.

- [ ] **Step 6: Run GREEN and commit**

```powershell
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
git add src/ui/glyph_writing_view_model.gd src/ui/mobile_safe_root.gd src/ui/mobile_safe_root.tscn tests/unit/test_glyph_writing_view_model.gd tests/integration/test_mobile_safe_root.gd tests/test_runner.gd
git commit -m "feat: expose accessible glyph recognition states"
```

---

### Task 9: Add CI, Evidence, and Human-Test Stop Gate

**Files:**
- Modify: `.github/workflows/validate-foundation-poc.yml`
- Create: `tools/check_glyph_vocabulary_scope.py`
- Create: `tests/test_glyph_vocabulary_scope.py`
- Create: `docs/validation/GLYPH_RECOGNITION_POC_REPORT.md`
- Create: `docs/planning/GLYPH_RECOGNITION_POC_STOP_GATE_01_2026-08-05.md`

**Interfaces:**
- Consumes: exact-head suites, vocabulary data, and confusion report.
- Produces: a machine-verifiable implementation boundary and a human-test handoff.

- [ ] **Step 1: Write the failing scope test**

```python
class GlyphVocabularyScopeTests(unittest.TestCase):
    def test_scope_checker_enforces_six_runtime_glyphs(self) -> None:
        self.assertTrue(SCRIPT.is_file())
        completed = subprocess.run(
            [sys.executable, str(SCRIPT)], cwd=ROOT, capture_output=True, text=True
        )
        self.assertEqual(0, completed.returncode, completed.stdout + completed.stderr)
```

- [ ] **Step 2: Run RED**

```bash
python -m unittest tests.test_glyph_vocabulary_scope -v
```

- [ ] **Step 3: Implement scope enforcement**

The checker verifies 10+10 semantic entries, exactly six `slice_enabled` entries, no runtime templates for the other 14 glyphs, no ornament points in recognition data, no ML/cloud dependency, and presence of the low-confidence retry contract. It rejects production claims and files under `assets/final`, `ml`, or `training-data`.

- [ ] **Step 4: Add complete CI commands**

```yaml
- run: python -m unittest tests.test_glyph_vocabulary_scope tests.test_glyph_confusion_report -v
- run: python tools/check_glyph_vocabulary_scope.py
- run: godot --headless --path . --script res://tests/test_runner.gd
- run: python tools/build_glyph_confusion_report.py artifacts/foundation-poc/glyph-fixture-rows.json > artifacts/foundation-poc/glyph-confusion-report.json
```

- [ ] **Step 5: Verify exact HEAD**

```powershell
python tools/generate_project_operating_views.py --check
python -m unittest tests.test_base_v9_adoption tests.test_godot_toolchain_setup tests.test_glyph_vocabulary_scope tests.test_glyph_confusion_report -v
python tools/check_glyph_vocabulary_scope.py
& $env:GODOT_BIN --headless --path . --script res://tests/test_runner.gd
```

Expected: every command exits `0`.

- [ ] **Step 6: Write the evidence report honestly**

Record exact commit, Godot version, fixture counts, thresholds, confusion matrix, false accept/reject counts, median synthetic recognition time, and current states:

```yaml
synthetic_fixture_validation: PASS_OR_FAIL_FROM_OUTPUT
physical_touch: NOT_RUN
left_right_hand_parity: NOT_RUN
human_meaning_comprehension: NOT_RUN
draw_fatigue: NOT_RUN
accessibility_assistive_technology: NOT_RUN
```

- [ ] **Step 7: Enforce the expansion stop gate**

Vocabulary expansion beyond six runtime glyphs is blocked when any condition holds:

```text
one confusion pair dominates fixture failures
unknown/incomplete input is falsely accepted
low-confidence input auto-confirms
stale result can create a Vault glyph
selected glyph mismatch can fill a Vault slot
layout hides threat or timer
physical touch and human comprehension sessions are not completed
```

Automated fixture success permits a human/device session; it does not authorize expansion by itself.

- [ ] **Step 8: Commit**

```bash
git add .github/workflows/validate-foundation-poc.yml tools/check_glyph_vocabulary_scope.py tests/test_glyph_vocabulary_scope.py docs/validation/GLYPH_RECOGNITION_POC_REPORT.md docs/planning/GLYPH_RECOGNITION_POC_STOP_GATE_01_2026-08-05.md
git commit -m "test: validate Slice glyph recognition POC"
```

---

## Self-Review Results

- Spec coverage: all approved 20 semantic glyphs are registered; only six receive runtime templates and recognition coverage.
- Benchmark adaptation: `$1` is a tested baseline, while `$N` handles the approved 2–3 stroke Slice scope with cached permutations; neither is presented as final mobile evidence.
- Safety coverage: low confidence, ambiguity, stale revision, selected-glyph mismatch, duplicate success, and interruption all have explicit RED tests.
- Scope separation: resource accounting is delegated to the Resource plan; this plan owns vocabulary, recognition, and Focus Scribe recognition coordination only.
- Placeholder scan: no `TBD`, undefined threshold, or generic test instruction remains. Runtime thresholds are constructor values pre-registered in an artifact before evaluation.
- Evidence boundary: confusion reports are synthetic fixture evidence; human comprehension, touch ergonomics, fatigue, and device accessibility remain `NOT_RUN`.

## Execution Handoff

Recommended execution is **Subagent-Driven Development in Codex** after the Resource plan reaches its stop gate. Use a fresh worker for each task and review after every GREEN commit. Do not expand beyond six runtime glyphs until the human comprehension and physical-device gates are completed.

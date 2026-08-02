# Mobile Foundation POC Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a minimal Godot Mobile Landscape foundation POC that proves writing-state recovery, atomic result application, and context-preserving UI behavior without creating full game content.

**Architecture:** Keep game rules in pure `RefCounted` state units that run headlessly. A thin Godot UI Harness binds those units to synthetic noncombat and battle contexts. Real recognition, final content, final assets, and production balance remain locked.

**Tech Stack:** Godot 4.7.1 stable candidate, GDScript, Python 3.12 contract checks, JSON reports, GitHub Actions.

## Global Constraints

- Decision: `GM-IMPLEMENTATION-ENTRY-01 / A_FOUNDATION_POC_ONLY_TDD_WITH_HARD_CONTENT_LOCK`.
- Do not execute this plan until `GM-FOUNDATION-POC-EXECUTION-READINESS-01` passes.
- Draft PR #38 and #42 must be merged, closed, or explicitly superseded before Task 1.
- The main branch must expose one Base release identity and passing Adapter·Snapshot·Generator workflows.
- Product implementation remains `NOT_STARTED` until the first code commit is intentionally created after the readiness Gate.
- Real glyph recognition, ML, training data, final art, final audio, Boss, full Grimoire/Main, and 46–53 minute content are prohibited.
- Every POC screen must display `POC / TEST_VALUE / NOT_CONTENT_COMPLETE`.
- `gl_compatibility` is a POC renderer recommendation, not a final platform decision.
- Runtime, real-device, performance, accessibility, and human evidence must remain `NOT_RUN` until actually executed.

---

## File Map

```text
project.godot                              Minimal POC project settings
src/core/focus_task_reducer.gd            Pure Focus Task state transitions
src/core/atomic_result_ledger.gd           Idempotent transaction application
src/input/stroke_buffer.gd                 Active/completed stroke ownership
src/input/glyph_recognizer.gd              Recognizer interface contract
src/input/deterministic_test_recognizer.gd Deterministic POC candidate source
src/input/writing_session.gd               Draft/candidate/confirm/commit orchestration
src/persistence/session_snapshot.gd        Schema-v1 serialization
src/persistence/save_repository.gd         Atomic save and backup recovery
src/platform/app_lifecycle_coordinator.gd  Pause/focus/background coordination
src/ui/mobile_safe_root.gd                 Layout state and debug reporting
src/ui/mobile_safe_root.tscn               Unstyled Landscape Harness
src/app/foundation_poc_app.gd              Synthetic scenario composition
src/app/foundation_poc_app.tscn            POC entry scene
tests/test_case.gd                         Minimal assertion helper
tests/test_runner.gd                       Headless suite runner
tests/unit/*.gd                            Pure unit suites
tests/integration/*.gd                     Lifecycle and UI contract suites
tools/check_godot_toolchain.py             Godot binary/version preflight
tools/check_foundation_poc_scope.py         Forbidden-path and label guard
.github/workflows/validate-foundation-poc.yml Static and headless validation
artifacts/foundation-poc/*.json             Generated evidence, ignored until run
docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md Post-run evidence report
```

---

### Task 1: Revalidate Main and Godot Toolchain

**Files:**
- Create: `tools/check_godot_toolchain.py`
- Create: `tests/test_foundation_poc_contract.py`
- Modify: `.gitignore`

**Interfaces:**
- Consumes: environment variable `GODOT_BIN`, current Git checkout.
- Produces: process exit code and JSON stdout containing `binary`, `version`, `candidate_match`, `renderer_status`, and `export_templates_status`.

- [ ] **Step 1: Write the failing Python contract test**

```python
# tests/test_foundation_poc_contract.py
from __future__ import annotations

import json
import os
import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "tools/check_godot_toolchain.py"


class FoundationPocContractTests(unittest.TestCase):
    def test_preflight_script_exists_and_reports_json(self) -> None:
        self.assertTrue(SCRIPT.is_file())
        env = os.environ.copy()
        env["GODOT_BIN"] = sys.executable
        completed = subprocess.run(
            [sys.executable, str(SCRIPT), "--allow-non-godot-test-double"],
            cwd=ROOT,
            env=env,
            capture_output=True,
            text=True,
            check=False,
        )
        self.assertEqual(0, completed.returncode, completed.stderr)
        report = json.loads(completed.stdout)
        self.assertEqual("TEST_DOUBLE", report["version"])
        self.assertFalse(report["candidate_match"])
        self.assertEqual("UNVERIFIED", report["renderer_status"])


if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Run the test and verify RED**

Run:

```bash
python -m unittest tests.test_foundation_poc_contract -v
```

Expected: FAIL because `tools/check_godot_toolchain.py` does not exist.

- [ ] **Step 3: Implement the preflight script**

```python
# tools/check_godot_toolchain.py
from __future__ import annotations

import argparse
import json
import os
import shutil
import subprocess
import sys

CANDIDATE_PREFIX = "4.7.1"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--allow-non-godot-test-double", action="store_true")
    args = parser.parse_args()

    binary = os.environ.get("GODOT_BIN") or shutil.which("godot") or shutil.which("godot4")
    if not binary:
        print(json.dumps({"error": "GODOT_BIN_NOT_FOUND"}))
        return 2

    if args.allow_non_godot_test_double:
        version = "TEST_DOUBLE"
    else:
        completed = subprocess.run(
            [binary, "--version"], capture_output=True, text=True, check=False
        )
        if completed.returncode != 0:
            print(json.dumps({"error": "GODOT_VERSION_COMMAND_FAILED", "binary": binary}))
            return 3
        version = completed.stdout.strip()

    report = {
        "binary": binary,
        "version": version,
        "candidate_match": version.startswith(CANDIDATE_PREFIX),
        "renderer_status": "UNVERIFIED",
        "export_templates_status": "UNVERIFIED",
    }
    print(json.dumps(report, ensure_ascii=False))
    return 0 if args.allow_non_godot_test_double or report["candidate_match"] else 4


if __name__ == "__main__":
    raise SystemExit(main())
```

- [ ] **Step 4: Ignore generated POC reports**

Append to `.gitignore`:

```gitignore
artifacts/foundation-poc/*.json
!artifacts/foundation-poc/.gitkeep
```

- [ ] **Step 5: Run tests and real preflight**

```bash
python -m unittest tests.test_foundation_poc_contract -v
python tools/check_godot_toolchain.py
```

Expected: Unit test PASS. Real preflight exits 0 only when `GODOT_BIN --version` starts with `4.7.1`; otherwise stop and record `TOOLCHAIN_MISMATCH` without changing project files.

- [ ] **Step 6: Commit**

```bash
git add tools/check_godot_toolchain.py tests/test_foundation_poc_contract.py .gitignore
git commit -m "test: add Godot foundation POC preflight"
```

---

### Task 2: Create Minimal Godot Project and Headless Test Runner

**Files:**
- Create: `project.godot`
- Create: `tests/test_case.gd`
- Create: `tests/test_runner.gd`
- Create: `tests/unit/test_smoke.gd`
- Create: `artifacts/foundation-poc/.gitkeep`

**Interfaces:**
- Consumes: verified `GODOT_BIN` from Task 1.
- Produces: deterministic exit code from `tests/test_runner.gd`.

- [ ] **Step 1: Write the smoke suite before the runner**

```gdscript
# tests/unit/test_smoke.gd
extends RefCounted

func run(case) -> void:
    case.assert_true(true, "headless runner executes suites")
```

- [ ] **Step 2: Run and verify RED**

```bash
"$GODOT_BIN" --headless --path . --script res://tests/test_runner.gd
```

Expected: FAIL because the project and runner do not exist.

- [ ] **Step 3: Create project settings**

```ini
; project.godot
config_version=5

[application]
config/name="GRIMOIRE Foundation POC"
run/main_scene="res://src/app/foundation_poc_app.tscn"

[display]
window/size/viewport_width=1280
window/size/viewport_height=720
window/size/window_width_override=1280
window/size/window_height_override=720
window/stretch/mode="canvas_items"
window/handheld/orientation=6

[rendering]
renderer/rendering_method="gl_compatibility"
renderer/rendering_method.mobile="gl_compatibility"
textures/default_filters/use_nearest_mipmap_filter=false

[application_run]
disable_stdout=false
```

- [ ] **Step 4: Create assertion helper**

```gdscript
# tests/test_case.gd
class_name PocTestCase
extends RefCounted

var failures: Array[String] = []

func assert_true(value: bool, message: String) -> void:
    if not value:
        failures.append(message)

func assert_false(value: bool, message: String) -> void:
    assert_true(not value, message)

func assert_eq(expected: Variant, actual: Variant, message: String) -> void:
    if expected != actual:
        failures.append("%s expected=%s actual=%s" % [message, expected, actual])
```

- [ ] **Step 5: Create runner**

```gdscript
# tests/test_runner.gd
extends SceneTree

const SUITES := [
    "res://tests/unit/test_smoke.gd",
]

func _initialize() -> void:
    var case := PocTestCase.new()
    for path in SUITES:
        var suite = load(path).new()
        suite.run(case)
    for failure in case.failures:
        push_error(failure)
    quit(case.failures.size())
```

- [ ] **Step 6: Run and verify GREEN**

```bash
"$GODOT_BIN" --headless --path . --script res://tests/test_runner.gd
```

Expected: exit 0.

- [ ] **Step 7: Commit**

```bash
git add project.godot tests artifacts/foundation-poc/.gitkeep
git commit -m "build: scaffold headless Godot foundation POC"
```

---

### Task 3: Implement Focus Task State Reducer

**Files:**
- Create: `src/core/focus_task_reducer.gd`
- Create: `tests/unit/test_focus_task_reducer.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: state and event `StringName` values.
- Produces: `{ok: bool, state: StringName, error: StringName}`.

- [ ] **Step 1: Write failing transition tests**

```gdscript
# tests/unit/test_focus_task_reducer.gd
extends RefCounted

func run(case) -> void:
    var reducer = load("res://src/core/focus_task_reducer.gd").new()
    case.assert_eq(&"ENTER_FOCUS", reducer.reduce(&"OBSERVE", &"OPEN_FOCUS").state, "open focus")
    case.assert_eq(&"INPUT", reducer.reduce(&"ENTER_FOCUS", &"BEGIN_INPUT").state, "begin input")
    case.assert_eq(&"OBSERVE", reducer.reduce(&"INPUT", &"FULL_CANCEL").state, "cancel without commit")
    case.assert_eq(&"SUSPENDED", reducer.reduce(&"REVIEW", &"SUSPEND").state, "suspend review")
    var invalid = reducer.reduce(&"OBSERVE", &"COMMIT")
    case.assert_false(invalid.ok, "observe cannot commit")
    case.assert_eq(&"INVALID_TRANSITION", invalid.error, "invalid transition code")
```

Add the suite path to `SUITES`.

- [ ] **Step 2: Run and verify RED**

Expected: FAIL because reducer file is absent.

- [ ] **Step 3: Implement reducer**

```gdscript
# src/core/focus_task_reducer.gd
class_name FocusTaskReducer
extends RefCounted

const TRANSITIONS := {
    &"OBSERVE": {&"OPEN_FOCUS": &"ENTER_FOCUS"},
    &"ENTER_FOCUS": {&"BEGIN_INPUT": &"INPUT", &"FULL_CANCEL": &"OBSERVE"},
    &"INPUT": {&"REQUEST_REVIEW": &"REVIEW", &"FULL_CANCEL": &"OBSERVE", &"SUSPEND": &"SUSPENDED"},
    &"REVIEW": {&"REVISE": &"INPUT", &"COMMIT": &"COMMITTING", &"FULL_CANCEL": &"OBSERVE", &"SUSPEND": &"SUSPENDED"},
    &"COMMITTING": {&"APPLIED": &"RESOLVED", &"ALREADY_APPLIED": &"RESOLVED"},
    &"RESOLVED": {&"RECORD": &"RECORDED"},
    &"RECORDED": {&"RETURN": &"RETURNED"},
    &"RETURNED": {&"RESET": &"OBSERVE"},
    &"SUSPENDED": {&"RESUME_INPUT": &"INPUT", &"RESUME_REVIEW": &"REVIEW"},
}

func reduce(state: StringName, event: StringName) -> Dictionary:
    var next: Variant = TRANSITIONS.get(state, {}).get(event)
    if next == null:
        return {"ok": false, "state": state, "error": &"INVALID_TRANSITION"}
    return {"ok": true, "state": next, "error": &""}
```

- [ ] **Step 4: Run tests**

Expected: all suites PASS.

- [ ] **Step 5: Commit**

```bash
git add src/core/focus_task_reducer.gd tests/unit/test_focus_task_reducer.gd tests/test_runner.gd
git commit -m "feat: add pure focus task reducer"
```

---

### Task 4: Implement Atomic Result Ledger

**Files:**
- Create: `src/core/atomic_result_ledger.gd`
- Create: `tests/unit/test_atomic_result_ledger.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `transaction_id: StringName`, `payload: Dictionary`.
- Produces: immutable first result and `applied` flag.

- [ ] **Step 1: Write duplicate-commit tests**

```gdscript
# tests/unit/test_atomic_result_ledger.gd
extends RefCounted

func run(case) -> void:
    var ledger = load("res://src/core/atomic_result_ledger.gd").new()
    var first = ledger.commit_once(&"tx-001", {"instability_delta": -1, "mana_delta": -2})
    var second = ledger.commit_once(&"tx-001", {"instability_delta": -99, "mana_delta": -99})
    case.assert_true(first.applied, "first transaction applies")
    case.assert_false(second.applied, "duplicate transaction does not apply")
    case.assert_eq(first.result, second.result, "duplicate returns original result")
    var restored = load("res://src/core/atomic_result_ledger.gd").new()
    restored.restore(ledger.serialize())
    case.assert_false(restored.commit_once(&"tx-001", {}).applied, "restored ledger remains idempotent")
```

- [ ] **Step 2: Run and verify RED**

- [ ] **Step 3: Implement ledger**

```gdscript
# src/core/atomic_result_ledger.gd
class_name AtomicResultLedger
extends RefCounted

var _results: Dictionary = {}

func commit_once(transaction_id: StringName, payload: Dictionary) -> Dictionary:
    var key := String(transaction_id)
    if _results.has(key):
        return {"applied": false, "transaction_id": transaction_id, "result": _results[key].duplicate(true)}
    var result := payload.duplicate(true)
    _results[key] = result
    return {"applied": true, "transaction_id": transaction_id, "result": result.duplicate(true)}

func serialize() -> Dictionary:
    return _results.duplicate(true)

func restore(value: Dictionary) -> void:
    _results = value.duplicate(true)
```

- [ ] **Step 4: Run tests and verify GREEN**

- [ ] **Step 5: Commit**

```bash
git add src/core/atomic_result_ledger.gd tests/unit/test_atomic_result_ledger.gd tests/test_runner.gd
git commit -m "feat: prevent duplicate result transactions"
```

---

### Task 5: Implement Stroke Ownership and Recognition Contract

**Files:**
- Create: `src/input/stroke_buffer.gd`
- Create: `src/input/glyph_recognizer.gd`
- Create: `src/input/deterministic_test_recognizer.gd`
- Create: `tests/unit/test_stroke_and_recognition.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- `StrokeBuffer.begin_stroke(pointer_id, point) -> bool`
- `StrokeBuffer.append_point(pointer_id, point) -> bool`
- `StrokeBuffer.end_stroke(pointer_id) -> bool`
- `StrokeBuffer.cancel_active_stroke() -> void`
- `GlyphRecognizer.recognize(strokes, revision) -> Dictionary`

- [ ] **Step 1: Write failing ownership and stale-result tests**

```gdscript
# tests/unit/test_stroke_and_recognition.gd
extends RefCounted

func run(case) -> void:
    var buffer = load("res://src/input/stroke_buffer.gd").new()
    case.assert_true(buffer.begin_stroke(1, Vector2(10, 10)), "first pointer owns stroke")
    case.assert_false(buffer.begin_stroke(2, Vector2(20, 20)), "second pointer cannot join stroke")
    case.assert_true(buffer.append_point(1, Vector2(30, 30)), "owner appends")
    case.assert_true(buffer.end_stroke(1), "owner completes")
    case.assert_eq(1, buffer.completed_strokes.size(), "completed stroke stored")
    buffer.begin_stroke(1, Vector2.ZERO)
    buffer.cancel_active_stroke()
    case.assert_eq(1, buffer.completed_strokes.size(), "cancel active preserves completed")

    var recognizer = load("res://src/input/deterministic_test_recognizer.gd").new()
    var result = recognizer.recognize(buffer.completed_strokes, 7)
    case.assert_eq(7, result.revision, "recognizer returns draft revision")
    case.assert_true(result.candidates.size() >= 1, "recognizer returns candidate")
```

- [ ] **Step 2: Run and verify RED**

- [ ] **Step 3: Implement StrokeBuffer**

```gdscript
# src/input/stroke_buffer.gd
class_name StrokeBuffer
extends RefCounted

var completed_strokes: Array[PackedVector2Array] = []
var _active_pointer: int = -1
var _active_points: PackedVector2Array = PackedVector2Array()

func begin_stroke(pointer_id: int, point: Vector2) -> bool:
    if _active_pointer != -1:
        return false
    _active_pointer = pointer_id
    _active_points = PackedVector2Array([point])
    return true

func append_point(pointer_id: int, point: Vector2) -> bool:
    if pointer_id != _active_pointer:
        return false
    _active_points.append(point)
    return true

func end_stroke(pointer_id: int) -> bool:
    if pointer_id != _active_pointer:
        return false
    if _active_points.size() > 1:
        completed_strokes.append(_active_points)
    cancel_active_stroke()
    return true

func cancel_active_stroke() -> void:
    _active_pointer = -1
    _active_points = PackedVector2Array()

func undo_completed_stroke() -> bool:
    if completed_strokes.is_empty():
        return false
    completed_strokes.pop_back()
    return true
```

- [ ] **Step 4: Implement recognizer interface and deterministic implementation**

```gdscript
# src/input/glyph_recognizer.gd
class_name GlyphRecognizer
extends RefCounted

func recognize(_completed_strokes: Array[PackedVector2Array], _draft_revision: int) -> Dictionary:
    return {"revision": _draft_revision, "candidates": []}
```

```gdscript
# src/input/deterministic_test_recognizer.gd
class_name DeterministicTestRecognizer
extends GlyphRecognizer

func recognize(completed_strokes: Array[PackedVector2Array], draft_revision: int) -> Dictionary:
    var count := completed_strokes.size()
    var candidates := []
    if count == 1:
        candidates = [{"glyph_id": &"FLOW", "confidence": 0.92}]
    elif count == 2:
        candidates = [
            {"glyph_id": &"FOCUS", "confidence": 0.78},
            {"glyph_id": &"DISPERSION", "confidence": 0.42},
        ]
    else:
        candidates = [{"glyph_id": &"UNKNOWN", "confidence": 0.20}]
    return {"revision": draft_revision, "candidates": candidates}
```

- [ ] **Step 5: Run tests and commit**

```bash
git add src/input tests/unit/test_stroke_and_recognition.gd tests/test_runner.gd
git commit -m "feat: add stroke ownership and deterministic recognition"
```

---

### Task 6: Implement Writing Session State and Low-Confidence Guard

**Files:**
- Create: `src/input/writing_session.gd`
- Create: `tests/unit/test_writing_session.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Produces `draft_revision`, `writing_state`, `candidates`, `confirmed_glyph_id`.
- `request_recognition()`, `apply_recognition(result)`, `confirm_candidate(index)`, `full_cancel()`.

- [ ] **Step 1: Write failing session tests**

```gdscript
# tests/unit/test_writing_session.gd
extends RefCounted

func run(case) -> void:
    var session = load("res://src/input/writing_session.gd").new()
    session.configure(load("res://src/input/deterministic_test_recognizer.gd").new(), 0.70)
    session.buffer.completed_strokes = [PackedVector2Array([Vector2.ZERO, Vector2.ONE])]
    var request = session.request_recognition()
    session.apply_recognition(request)
    case.assert_eq(&"CANDIDATE_READY", session.writing_state, "candidate state")
    case.assert_eq(&"", session.confirmed_glyph_id, "no auto confirm")
    case.assert_true(session.confirm_candidate(0), "high confidence can be manually confirmed")
    case.assert_eq(&"FLOW", session.confirmed_glyph_id, "manual confirmation")

    var old_result = {"revision": session.draft_revision - 1, "candidates": [{"glyph_id": &"FOCUS", "confidence": 1.0}]}
    case.assert_false(session.apply_recognition(old_result), "stale result rejected")
    session.full_cancel()
    case.assert_eq(&"EMPTY", session.writing_state, "full cancel clears draft")
```

- [ ] **Step 2: Run and verify RED**

- [ ] **Step 3: Implement WritingSession**

```gdscript
# src/input/writing_session.gd
class_name WritingSession
extends RefCounted

var buffer := StrokeBuffer.new()
var recognizer: GlyphRecognizer
var confidence_threshold: float = 0.70
var draft_revision: int = 0
var writing_state: StringName = &"EMPTY"
var candidates: Array = []
var confirmed_glyph_id: StringName = &""

func configure(value: GlyphRecognizer, threshold: float) -> void:
    recognizer = value
    confidence_threshold = threshold

func request_recognition() -> Dictionary:
    draft_revision += 1
    writing_state = &"RECOGNIZING"
    return recognizer.recognize(buffer.completed_strokes, draft_revision)

func apply_recognition(result: Dictionary) -> bool:
    if int(result.get("revision", -1)) != draft_revision:
        return false
    candidates = result.get("candidates", []).duplicate(true)
    confirmed_glyph_id = &""
    writing_state = &"CANDIDATE_READY"
    return true

func confirm_candidate(index: int) -> bool:
    if index < 0 or index >= candidates.size():
        return false
    var candidate: Dictionary = candidates[index]
    if float(candidate.get("confidence", 0.0)) < confidence_threshold:
        return false
    confirmed_glyph_id = candidate.get("glyph_id", &"")
    writing_state = &"CONFIRMED"
    return true

func full_cancel() -> void:
    buffer.completed_strokes.clear()
    buffer.cancel_active_stroke()
    candidates.clear()
    confirmed_glyph_id = &""
    draft_revision += 1
    writing_state = &"EMPTY"
```

- [ ] **Step 4: Run tests and commit**

```bash
git add src/input/writing_session.gd tests/unit/test_writing_session.gd tests/test_runner.gd
git commit -m "feat: guard writing candidate confirmation"
```

---

### Task 7: Implement Snapshot and Atomic Save Recovery

**Files:**
- Create: `src/persistence/session_snapshot.gd`
- Create: `src/persistence/save_repository.gd`
- Create: `tests/unit/test_snapshot_and_save.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- `SessionSnapshot.capture(...) -> Dictionary`
- `SessionSnapshot.validate(data) -> Dictionary`
- `SaveRepository.save(data) -> Dictionary`
- `SaveRepository.load_latest() -> Dictionary`

- [ ] **Step 1: Write round-trip and corruption tests**

```gdscript
# tests/unit/test_snapshot_and_save.gd
extends RefCounted

func run(case) -> void:
    var snapshot = load("res://src/persistence/session_snapshot.gd").new()
    var data = snapshot.capture(
        &"ANCHOR_B",
        &"REVIEW",
        &"CANDIDATE_READY",
        [PackedVector2Array([Vector2(1, 2), Vector2(3, 4)])],
        [{"glyph_id": &"FLOW", "confidence": 0.92}],
        &"FLOW",
        3,
        &"tx-7",
        {"tx-1": {"mana_delta": -2}},
        {"scenario_id": "synthetic_crystal_transfer"}
    )
    case.assert_true(snapshot.validate(data).ok, "snapshot validates")
    case.assert_false(data.has("active_stroke"), "active stroke never persists")

    var repo = load("res://src/persistence/save_repository.gd").new()
    repo.configure("user://foundation_poc_test.json")
    case.assert_true(repo.save(data).ok, "save succeeds")
    case.assert_eq(&"ANCHOR_B", repo.load_latest().data.anchor_id, "load round trip")
```

- [ ] **Step 2: Run and verify RED**

- [ ] **Step 3: Implement SessionSnapshot**

```gdscript
# src/persistence/session_snapshot.gd
class_name SessionSnapshot
extends RefCounted

const SCHEMA_VERSION := 1

func capture(anchor_id, focus_state, writing_state, completed_strokes, candidate_list, confirmed_glyph_id, draft_revision, pending_transaction_id, ledger_state, scene_context) -> Dictionary:
    var encoded_strokes: Array = []
    for stroke in completed_strokes:
        var encoded_points: Array = []
        for point in stroke:
            encoded_points.append([point.x, point.y])
        encoded_strokes.append(encoded_points)
    return {
        "schema_version": SCHEMA_VERSION,
        "anchor_id": anchor_id,
        "focus_state": focus_state,
        "writing_state": writing_state,
        "completed_strokes": encoded_strokes,
        "candidate_list": candidate_list,
        "confirmed_glyph_id": confirmed_glyph_id,
        "draft_revision": draft_revision,
        "pending_transaction_id": pending_transaction_id,
        "ledger_state": ledger_state,
        "scene_context": scene_context,
    }

func validate(data: Dictionary) -> Dictionary:
    var required := ["schema_version", "anchor_id", "focus_state", "writing_state", "completed_strokes", "draft_revision", "ledger_state", "scene_context"]
    for key in required:
        if not data.has(key):
            return {"ok": false, "error": &"MISSING_FIELD", "field": key}
    if int(data.schema_version) != SCHEMA_VERSION:
        return {"ok": false, "error": &"SCHEMA_MISMATCH"}
    return {"ok": true, "error": &""}
```

- [ ] **Step 4: Implement SaveRepository**

```gdscript
# src/persistence/save_repository.gd
class_name SaveRepository
extends RefCounted

var path := "user://foundation_poc.json"

func configure(value: String) -> void:
    path = value

func save(data: Dictionary) -> Dictionary:
    var temp := path + ".tmp"
    var backup := path + ".bak"
    var file := FileAccess.open(temp, FileAccess.WRITE)
    if file == null:
        return {"ok": false, "error": &"TEMP_OPEN_FAILED"}
    file.store_string(JSON.stringify(data))
    file.close()
    var parsed = JSON.parse_string(FileAccess.get_file_as_string(temp))
    if not (parsed is Dictionary):
        return {"ok": false, "error": &"TEMP_VALIDATION_FAILED"}
    if FileAccess.file_exists(path):
        DirAccess.rename_absolute(ProjectSettings.globalize_path(path), ProjectSettings.globalize_path(backup))
    var rename_error := DirAccess.rename_absolute(ProjectSettings.globalize_path(temp), ProjectSettings.globalize_path(path))
    return {"ok": rename_error == OK, "error": &"" if rename_error == OK else &"ATOMIC_RENAME_FAILED"}

func load_latest() -> Dictionary:
    for candidate in [path, path + ".bak"]:
        if not FileAccess.file_exists(candidate):
            continue
        var parsed = JSON.parse_string(FileAccess.get_file_as_string(candidate))
        if parsed is Dictionary:
            return {"ok": true, "data": parsed, "source": candidate}
    return {"ok": false, "error": &"SAVE_CORRUPTION"}
```

- [ ] **Step 5: Run tests and commit**

```bash
git add src/persistence tests/unit/test_snapshot_and_save.gd tests/test_runner.gd
git commit -m "feat: persist recoverable writing snapshots"
```

---

### Task 8: Integrate App Lifecycle Without Duplicate Commit

**Files:**
- Create: `src/platform/app_lifecycle_coordinator.gd`
- Create: `tests/integration/test_pause_resume_transaction.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `WritingSession`, `AtomicResultLedger`, `SaveRepository`, current context.
- Produces: saved Snapshot on suspend and restored state on resume.

- [ ] **Step 1: Write pause/resume integration test**

```gdscript
# tests/integration/test_pause_resume_transaction.gd
extends RefCounted

func run(case) -> void:
    var coordinator = load("res://src/platform/app_lifecycle_coordinator.gd").new()
    coordinator.configure("user://foundation_poc_lifecycle_test.json")
    coordinator.writing.buffer.completed_strokes = [PackedVector2Array([Vector2.ZERO, Vector2.ONE])]
    coordinator.focus_state = &"REVIEW"
    coordinator.pending_transaction_id = &"tx-resume"
    coordinator.suspend(&"ANCHOR_C", {"scenario_id": "synthetic_unstable_spirit"})
    coordinator.resume()
    var first = coordinator.commit_pending({"instability_delta": -1})
    var second = coordinator.commit_pending({"instability_delta": -9})
    case.assert_true(first.applied, "first resumed commit applies")
    case.assert_false(second.applied, "second resumed commit is duplicate")
    case.assert_eq(1, coordinator.writing.buffer.completed_strokes.size(), "completed draft survives")
```

- [ ] **Step 2: Run and verify RED**

- [ ] **Step 3: Implement coordinator**

```gdscript
# src/platform/app_lifecycle_coordinator.gd
class_name AppLifecycleCoordinator
extends RefCounted

var writing := WritingSession.new()
var ledger := AtomicResultLedger.new()
var repository := SaveRepository.new()
var snapshot := SessionSnapshot.new()
var focus_state: StringName = &"OBSERVE"
var pending_transaction_id: StringName = &""
var scene_context: Dictionary = {}

func configure(save_path: String) -> void:
    writing.configure(DeterministicTestRecognizer.new(), 0.70)
    repository.configure(save_path)

func suspend(anchor_id: StringName, context: Dictionary) -> Dictionary:
    writing.buffer.cancel_active_stroke()
    scene_context = context.duplicate(true)
    var data := snapshot.capture(
        anchor_id,
        focus_state,
        writing.writing_state,
        writing.buffer.completed_strokes,
        writing.candidates,
        writing.confirmed_glyph_id,
        writing.draft_revision,
        pending_transaction_id,
        ledger.serialize(),
        scene_context
    )
    return repository.save(data)

func resume() -> Dictionary:
    var loaded := repository.load_latest()
    if not loaded.ok:
        return loaded
    var data: Dictionary = loaded.data
    focus_state = data.focus_state
    writing.writing_state = data.writing_state
    writing.candidates = data.get("candidate_list", [])
    writing.confirmed_glyph_id = data.get("confirmed_glyph_id", &"")
    writing.draft_revision = int(data.draft_revision)
    writing.buffer.completed_strokes.clear()
    for encoded_stroke in data.completed_strokes:
        var stroke := PackedVector2Array()
        for encoded_point in encoded_stroke:
            stroke.append(Vector2(encoded_point[0], encoded_point[1]))
        writing.buffer.completed_strokes.append(stroke)
    pending_transaction_id = data.get("pending_transaction_id", &"")
    ledger.restore(data.ledger_state)
    scene_context = data.scene_context
    return {"ok": true}

func commit_pending(payload: Dictionary) -> Dictionary:
    return ledger.commit_once(pending_transaction_id, payload)
```

- [ ] **Step 4: Run tests and commit**

```bash
git add src/platform tests/integration/test_pause_resume_transaction.gd tests/test_runner.gd
git commit -m "feat: restore drafts without duplicate result application"
```

---

### Task 9: Build Unstyled Mobile Landscape Harness

**Files:**
- Create: `src/ui/mobile_safe_root.gd`
- Create: `src/ui/mobile_safe_root.tscn`
- Create: `src/app/foundation_poc_app.gd`
- Create: `src/app/foundation_poc_app.tscn`
- Create: `tests/integration/test_mobile_safe_root.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- `MobileSafeRoot.set_mode(mode: StringName)`.
- `MobileSafeRoot.apply_safe_insets(insets: Rect2)`.
- `MobileSafeRoot.report_layout() -> Dictionary`.
- App exposes synthetic scenario IDs only.

- [ ] **Step 1: Write layout-state test**

```gdscript
# tests/integration/test_mobile_safe_root.gd
extends RefCounted

func run(case) -> void:
    var scene = load("res://src/ui/mobile_safe_root.tscn").instantiate()
    scene.set_mode(&"WRITING_EXPANDED")
    scene.apply_safe_insets(Rect2(48, 0, 0, 24))
    var report = scene.report_layout()
    case.assert_true(report.objective_visible, "objective remains visible")
    case.assert_true(report.timer_visible, "timer remains visible")
    case.assert_true(report.player_status_visible, "player state remains visible")
    case.assert_true(report.canvas_visible, "canvas visible")
    case.assert_true(report.poc_label_visible, "POC disclosure visible")
    scene.queue_free()
```

- [ ] **Step 2: Run and verify RED**

- [ ] **Step 3: Create scene tree**

Create `src/ui/mobile_safe_root.tscn` with this named hierarchy:

```text
MobileSafeRoot (Control)
├── PocDisclosure (Label)
├── SafeMargin (MarginContainer)
│   └── RootHBox (HBoxContainer)
│       ├── ContextColumn (VBoxContainer)
│       │   ├── ObjectiveLabel (Label)
│       │   ├── TimerLabel (Label)
│       │   ├── PlayerStatusLabel (Label)
│       │   └── SituationPanel (PanelContainer)
│       └── WritingPanel (PanelContainer)
│           └── WritingVBox (VBoxContainer)
│               ├── Canvas (Control)
│               ├── CandidateLabel (Label)
│               └── ActionRow (HBoxContainer)
│                   ├── UndoButton (Button)
│                   ├── CancelButton (Button)
│                   └── CommitButton (Button)
```

Use anchors to fill the viewport. Set `PocDisclosure.text` to `POC / TEST_VALUE / NOT_CONTENT_COMPLETE`.

- [ ] **Step 4: Implement layout controller**

```gdscript
# src/ui/mobile_safe_root.gd
class_name MobileSafeRoot
extends Control

@onready var safe_margin: MarginContainer = %SafeMargin
@onready var context_column: Control = %ContextColumn
@onready var writing_panel: Control = %WritingPanel
@onready var canvas: Control = %Canvas
@onready var objective_label: Label = %ObjectiveLabel
@onready var timer_label: Label = %TimerLabel
@onready var player_status_label: Label = %PlayerStatusLabel
@onready var poc_disclosure: Label = %PocDisclosure

func set_mode(mode: StringName) -> void:
    writing_panel.custom_minimum_size.x = 512.0 if mode == &"WRITING_EXPANDED" else 160.0
    canvas.visible = mode == &"WRITING_EXPANDED"

func apply_safe_insets(insets: Rect2) -> void:
    safe_margin.add_theme_constant_override("margin_left", int(insets.position.x))
    safe_margin.add_theme_constant_override("margin_top", int(insets.position.y))
    safe_margin.add_theme_constant_override("margin_right", int(insets.size.x))
    safe_margin.add_theme_constant_override("margin_bottom", int(insets.size.y))

func report_layout() -> Dictionary:
    return {
        "objective_visible": objective_label.visible and objective_label.is_visible_in_tree(),
        "timer_visible": timer_label.visible and timer_label.is_visible_in_tree(),
        "player_status_visible": player_status_label.visible and player_status_label.is_visible_in_tree(),
        "canvas_visible": canvas.visible and canvas.is_visible_in_tree(),
        "poc_label_visible": poc_disclosure.visible and poc_disclosure.is_visible_in_tree(),
    }
```

- [ ] **Step 5: Create synthetic app composition**

`foundation_poc_app.gd` instantiates `MobileSafeRoot`, exposes buttons for `synthetic_crystal_transfer` and `synthetic_unstable_spirit`, and changes labels only. It must not load content data or final assets.

- [ ] **Step 6: Run tests and manual Harness**

```bash
"$GODOT_BIN" --headless --path . --script res://tests/test_runner.gd
"$GODOT_BIN" --path .
```

Expected: Tests PASS. Manual run displays only debug panels and the POC disclosure.

- [ ] **Step 7: Commit**

```bash
git add src/ui src/app tests/integration/test_mobile_safe_root.gd tests/test_runner.gd
git commit -m "feat: add context-preserving mobile POC harness"
```

---

### Task 10: Add Layout Matrix and Scope Guard Reports

**Files:**
- Create: `tools/check_foundation_poc_scope.py`
- Create: `src/ui/layout_matrix_runner.gd`
- Create: `tests/integration/test_layout_matrix.gd`
- Create: `tests/test_foundation_poc_scope.py`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Scope checker rejects forbidden content and asset paths.
- Layout runner writes `artifacts/foundation-poc/layout-matrix-report.json`.

- [ ] **Step 1: Write failing scope checker test**

```python
# tests/test_foundation_poc_scope.py
from __future__ import annotations

import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


class ScopeGuardTests(unittest.TestCase):
    def test_current_tree_respects_poc_scope(self) -> None:
        completed = subprocess.run(
            [sys.executable, "tools/check_foundation_poc_scope.py"],
            cwd=ROOT,
            capture_output=True,
            text=True,
            check=False,
        )
        self.assertEqual(0, completed.returncode, completed.stdout + completed.stderr)


if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Implement scope checker**

```python
# tools/check_foundation_poc_scope.py
from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
FORBIDDEN_ROOTS = (
    ROOT / "assets" / "final",
    ROOT / "audio" / "final",
    ROOT / "content" / "chapters",
    ROOT / "content" / "dialogue",
    ROOT / "ml",
    ROOT / "training-data",
)
REQUIRED_LABEL = "POC / TEST_VALUE / NOT_CONTENT_COMPLETE"


def main() -> int:
    violations = [str(path.relative_to(ROOT)) for path in FORBIDDEN_ROOTS if path.exists()]
    scene = ROOT / "src/ui/mobile_safe_root.tscn"
    if scene.is_file() and REQUIRED_LABEL not in scene.read_text(encoding="utf-8"):
        violations.append("src/ui/mobile_safe_root.tscn missing POC disclosure")
    if violations:
        print("\n".join(violations))
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
```

- [ ] **Step 3: Write layout matrix test**

Test the four viewport sizes and three text scales defined in the design. For every combination assert Objective, Timer, Player Status, Canvas, and POC disclosure remain visible. The runner writes one JSON object per combination with `viewport`, `text_scale`, `inset`, and visibility booleans.

- [ ] **Step 4: Run all tests**

```bash
python -m unittest tests.test_foundation_poc_contract tests.test_foundation_poc_scope -v
"$GODOT_BIN" --headless --path . --script res://tests/test_runner.gd
```

Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add tools/check_foundation_poc_scope.py src/ui/layout_matrix_runner.gd tests
git commit -m "test: guard POC scope and mobile layout matrix"
```

---

### Task 11: Add CI and Validation Report

**Files:**
- Create: `.github/workflows/validate-foundation-poc.yml`
- Create: `docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md`
- Create: `artifacts/foundation-poc/headless-test-report.json` only when tests have actually run.
- Create: `artifacts/foundation-poc/save-resume-report.json` only when tests have actually run.

**Interfaces:**
- CI consumes repository files and a verified Godot binary provisioning method approved during execution readiness.
- Report distinguishes automated evidence from `NOT_RUN` evidence.

- [ ] **Step 1: Add static CI before Godot provisioning**

```yaml
# .github/workflows/validate-foundation-poc.yml
name: Validate Foundation POC

on:
  pull_request:
    paths:
      - "project.godot"
      - "src/**"
      - "tests/**"
      - "tools/check_godot_toolchain.py"
      - "tools/check_foundation_poc_scope.py"
      - ".github/workflows/validate-foundation-poc.yml"

permissions:
  contents: read

jobs:
  static-contract:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"
      - run: python -m unittest tests.test_foundation_poc_contract tests.test_foundation_poc_scope -v
```

Do not add a third-party Godot setup Action until the execution readiness review approves its source, version pin, and license/maintenance risk. Headless Godot tests remain a required local check until that decision.

- [ ] **Step 2: Create evidence report with explicit statuses**

```markdown
# Foundation POC Validation Report

## Automated

- Python contract tests: PASS or FAIL with command and commit.
- Godot headless unit tests: PASS or FAIL with command and commit.
- Layout matrix Harness: PASS or FAIL with report path.
- Save/resume duplicate transaction count: exact measured value.

## Not Run

- Real glyph recognition quality: NOT_RUN.
- Smartphone physical-device test: NOT_RUN.
- Tablet smoke: NOT_RUN.
- Performance, battery, thermal: NOT_RUN.
- Accessibility assistive technology: NOT_RUN.
- Human playtest: NOT_RUN.

## Scope Statement

This POC does not represent completed game content, final UI, final art, final audio, final balance, or release readiness.
```

- [ ] **Step 3: Run complete local validation**

```bash
python -m unittest tests.test_foundation_poc_contract tests.test_foundation_poc_scope -v
python tools/check_godot_toolchain.py
python tools/check_foundation_poc_scope.py
"$GODOT_BIN" --headless --path . --script res://tests/test_runner.gd
```

Expected: all commands exit 0.

- [ ] **Step 4: Populate reports only from actual output**

Record command, exact commit SHA, test counts, failures, and generated JSON paths. Do not convert missing evidence into PASS.

- [ ] **Step 5: Commit**

```bash
git add .github/workflows/validate-foundation-poc.yml docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md artifacts/foundation-poc
git commit -m "ci: validate mobile foundation POC evidence"
```

---

### Task 12: Run Stop Gate and Prepare User Review

**Files:**
- Modify: `docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md`
- Create: `docs/planning/FOUNDATION_POC_STOP_GATE_01_<execution-date>.md`

**Interfaces:**
- Consumes: actual test and Harness evidence.
- Produces: `PASS_TO_USER_REVIEW`, `REWORK_REQUIRED`, or `BLOCKED_MISSING_EVIDENCE`.

- [ ] **Step 1: Verify exact acceptance conditions**

```text
headless_unit_integration = PASS
same_transaction_apply_count = 1
pause_resume_completed_draft_loss = 0
panel_collapse_draft_loss = 0
required_context_visibility_matrix = PASS
real_recognition = NOT_RUN
physical_device = NOT_RUN unless actually executed
performance = NOT_RUN unless actually executed
accessibility = NOT_RUN unless actually executed
human_playtest = NOT_RUN unless actually executed
```

- [ ] **Step 2: Run adversarial review**

Check for:

- Scene-owned business rules.
- UI bypass of AtomicResultLedger.
- hidden auto-confirm.
- stale recognition application.
- duplicate transaction after resume.
- final content or asset scope creep.
- unsupported PASS claims.

- [ ] **Step 3: Write Stop Gate result**

Use `PASS_TO_USER_REVIEW` only when automated acceptance conditions pass and all non-run evidence remains explicitly labeled.

- [ ] **Step 4: Commit**

```bash
git add docs/validation/FOUNDATION_POC_VALIDATION_REPORT.md docs/planning/FOUNDATION_POC_STOP_GATE_01_*.md
git commit -m "docs: record foundation POC stop gate"
```

- [ ] **Step 5: Stop**

Do not begin real recognition, final content, final art/audio, Boss, full Grimoire/Main, performance optimization, or release work. Return the POC and evidence to the user for the next Decision.

---

## Plan Self-Review

### Spec coverage

- Focus Task state: Tasks 3 and 8.
- Atomic result application: Task 4 and Task 8.
- Stroke ownership and stale recognition: Tasks 5 and 6.
- Snapshot and save recovery: Tasks 7 and 8.
- Context-preserving Writing Panel: Task 9.
- Smartphone layout matrix: Task 10.
- Scope lock and evidence ceiling: Tasks 10–12.
- Base and toolchain prerequisites: Task 1 and Global Constraints.

### Type consistency

- `transaction_id` uses `StringName` in Ledger and Lifecycle Coordinator.
- `draft_revision` uses `int` across Recognizer, WritingSession, and Snapshot.
- `completed_strokes` uses `Array[PackedVector2Array]` in memory and arrays of numeric pairs in JSON.
- Focus state and Writing state use `StringName` in memory and serialize as JSON-compatible strings.

### Execution handoff

This plan is complete but **not executable yet**. The next action is `GM-FOUNDATION-POC-EXECUTION-READINESS-01`, after Base PR #38 and #42 are resolved and the plan is revalidated against the resulting main branch.

# Three-slot Mobile Summon HUD Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build and verify a read-only Mobile Landscape summon HUD that presents MAIN plus S1/S2/S3, protects active handwriting, uses explicit management confirmation, and displays deterministic summon events without mutating gameplay State.

**Architecture:** Pure `RefCounted` builders and reducers convert authoritative roster, clock, and ledger presentation records into a nullable `SummonHudViewModel`. Thin Godot `Control` views render the rail and drawer, while the Writing Canvas retains active pointer ownership. ResultLedger remains the single exactly-once owner; the HUD only presents canonical records through a bounded presentation queue.

**Tech Stack:** Godot 4.x version selected by the verified project Toolchain gate, GDScript, headless Godot tests, Python contract checks, JSON evidence, GitHub Actions.

## Global Constraints

- Decision: `GM-MOBILE-SUMMON-HUD-WIREFRAME-01 / B_LEFT_COMPACT_RAIL_WITH_CONTEXTUAL_DETAIL_DRAWER`.
- User-spec review: `USER_APPROVED_HARDENED_SPEC_ACTIVE / 2026-08-03T21:11:00+09:00`.
- Do not execute this plan until `GM-FOUNDATION-POC-EXECUTION-READINESS-01` passes and Mobile Summon HUD implementation scope is explicitly authorized.
- `PRODUCT_IMPLEMENTATION`, `GODOT_UI_IMPLEMENTATION`, and `CODEX_EXECUTION` remain blocked at plan-writing time.
- Drawer reading never pauses the Active Pressure Clock.
- Only `MANAGEMENT_CONFIRM`, entered after active stroke completion and safe Draft preservation, may pause for recall or replacement confirmation.
- ResultLedger/Transaction owns exactly-once event application; HUD code must not inspect or mutate applied-ID collections.
- Same-time events resolve `MAIN → S1 → S2 → S3`; total HUD presentation budget is `1.2 seconds TEST_VALUE` for the whole batch.
- Writing Canvas owns the complete active pointer/touch sequence; rail contact during a stroke must not change selection or focus.
- Required font-scale cases are `100%`, `130%`, and Android maximum `200%`.
- Android interactive targets are at least `48dp × 48dp`; iOS primary targets are at least `44pt × 44pt` after measured-device validation.
- Timer accessibility text is read on focus or meaningful change only, never every second.
- Runtime, device, performance, accessibility, and human evidence remain `NOT_RUN` until executed and recorded.
- Every prototype surface displays `POC / TEST_VALUE / NOT_CONTENT_COMPLETE` until production approval.

---

## File Map

```text
src/core/summon_hud_view_model.gd                  Nullable slot and HUD value objects
src/core/summon_hud_view_model_builder.gd          Read-only State-to-view conversion
src/core/summon_management_state.gd                Explicit management request/confirm reducer
src/core/summon_event_presentation_queue.gd        Canonical event-record presentation budget
src/ui/summon_hud_rail.gd                          Rail binding and selection suppression
src/ui/summon_hud_rail.tscn                        MAIN/S1/S2/S3 compact rail
src/ui/summon_detail_drawer.gd                     Drawer and management request binding
src/ui/summon_detail_drawer.tscn                   One contextual drawer
src/ui/summon_hud_accessibility.gd                 Labels and meaningful-change announcements
src/ui/mobile_safe_root.gd                         Safe-area and responsive layout integration
src/ui/mobile_safe_root.tscn                       HUD placement in Mobile Landscape harness
src/input/writing_session.gd                       Active-stroke and safe-Draft query interfaces
src/app/foundation_poc_app.gd                      Synthetic roster/event scenarios
src/app/foundation_poc_app.tscn                    POC composition

tests/unit/test_summon_hud_view_model.gd           Nullable and ordering contracts
tests/unit/test_summon_management_state.gd         Pause-entry and cancel contracts
tests/unit/test_summon_event_presentation_queue.gd Event ordering and total-budget contracts
tests/unit/test_summon_hud_accessibility.gd        Labels and timer-announcement contracts
tests/integration/test_summon_hud_input.gd          Active-stroke input ownership
tests/integration/test_summon_hud_layout.gd         Safe area, aspect ratio, font scale
tests/integration/test_summon_hud_resume.gd         Restore, error, and dedup boundaries
tests/test_runner.gd                                Headless suite registry

tools/check_mobile_summon_hud_scope.py             Forbidden ownership and scope checks
tests/test_mobile_summon_hud_contract.py            Python static contract tests
.github/workflows/validate-foundation-poc.yml       Static and headless validation extension
docs/validation/MOBILE_SUMMON_HUD_VALIDATION_REPORT.md Executed evidence only
```

---

### Task 1: Define Nullable HUD View Models

**Files:**
- Create: `src/core/summon_hud_view_model.gd`
- Create: `src/core/summon_hud_view_model_builder.gd`
- Create: `tests/unit/test_summon_hud_view_model.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: authoritative roster snapshots and canonical event presentation records as `Dictionary` values.
- Produces: `SummonHudViewModel.build_slot(raw: Dictionary) -> Dictionary` and `SummonHudViewModelBuilder.build(roster: Dictionary, clock: Dictionary, records: Array[Dictionary]) -> Dictionary`.

- [ ] **Step 1: Write failing nullable-slot and stable-order tests**

```gdscript
# tests/unit/test_summon_hud_view_model.gd
extends RefCounted

func run(case) -> void:
    var builder = load("res://src/core/summon_hud_view_model_builder.gd").new()
    var view = builder.build(
        {
            "main": {"summon_id": "wolf", "primary_role": "MAIN"},
            "secondary": [{"slot_id": "S2", "summon_id": "guard", "primary_role": "GUARDIAN", "defense_stat": 2}],
        },
        {"remaining_ms": 4200},
        []
    )
    case.assert_eq(["MAIN", "S1", "S2", "S3"], view.slots.map(func(slot): return slot.slot_id), "stable slot order")
    case.assert_eq("EMPTY", view.slots[1].state_code, "missing S1 becomes empty")
    case.assert_eq(null, view.slots[1].representative_stat_type, "empty stat type is null")
    case.assert_eq("NONE", view.slots[1].timing_mode, "empty timing mode")
    case.assert_eq("CYCLIC", view.slots[2].timing_mode, "secondary timing mode")
```

Add the suite path to `tests/test_runner.gd`.

- [ ] **Step 2: Run the suite and verify RED**

Run:

```bash
"$GODOT_BIN" --headless --path . --script res://tests/test_runner.gd
```

Expected: FAIL because the view-model files do not exist.

- [ ] **Step 3: Implement the slot value contract**

```gdscript
# src/core/summon_hud_view_model.gd
class_name SummonHudViewModel
extends RefCounted

const SLOT_ORDER := ["MAIN", "S1", "S2", "S3"]

static func empty_slot(slot_id: String) -> Dictionary:
    return {
        "slot_id": slot_id,
        "summon_id": null,
        "summon_name": null,
        "primary_role": null,
        "representative_stat_type": null,
        "representative_stat_value": null,
        "remaining_cycle_ms": null,
        "timing_mode": "NONE",
        "target_rule_text": null,
        "state_code": "EMPTY",
        "last_event_id": null,
        "last_result_summary": null,
        "can_recall": false,
        "can_replace": slot_id != "MAIN",
        "unavailable_reason": null,
        "error_message": null,
    }
```

- [ ] **Step 4: Implement the read-only builder**

```gdscript
# src/core/summon_hud_view_model_builder.gd
class_name SummonHudViewModelBuilder
extends RefCounted

func build(roster: Dictionary, clock: Dictionary, records: Array) -> Dictionary:
    var by_slot := {}
    if roster.has("main"):
        by_slot["MAIN"] = _active_slot("MAIN", roster.main)
    for raw in roster.get("secondary", []):
        by_slot[str(raw.slot_id)] = _active_slot(str(raw.slot_id), raw)
    var slots: Array = []
    for slot_id in SummonHudViewModel.SLOT_ORDER:
        slots.append(by_slot.get(slot_id, SummonHudViewModel.empty_slot(slot_id)))
    return {"slots": slots, "clock": clock.duplicate(true), "event_records": records.duplicate(true)}

func _active_slot(slot_id: String, raw: Dictionary) -> Dictionary:
    var slot := SummonHudViewModel.empty_slot(slot_id)
    slot.summon_id = raw.get("summon_id")
    slot.summon_name = raw.get("summon_name", raw.get("summon_id"))
    slot.primary_role = raw.get("primary_role")
    slot.timing_mode = "PERSISTENT" if slot_id == "MAIN" else "CYCLIC"
    slot.remaining_cycle_ms = null if slot_id == "MAIN" else raw.get("remaining_action_cycle_ms", 0)
    slot.state_code = raw.get("state_code", "ACTIVE")
    var stat = _representative_stat(raw)
    slot.representative_stat_type = stat.type
    slot.representative_stat_value = stat.value
    slot.target_rule_text = raw.get("target_rule_text")
    slot.can_recall = slot_id != "MAIN" and slot.state_code == "ACTIVE"
    slot.can_replace = slot_id != "MAIN"
    return slot

func _representative_stat(raw: Dictionary) -> Dictionary:
    var role := str(raw.get("primary_role", ""))
    var mapping := {
        "MAIN": ["STOCK", "stock_stat"],
        "PRODUCTION": ["STOCK", "stock_stat"],
        "GUARDIAN": ["DEFENSE", "defense_stat"],
        "ASSAULT": ["ATTACK", "attack_stat"],
        "RECOVERY": ["HEAL", "heal_stat"],
    }
    if not mapping.has(role):
        return {"type": null, "value": null}
    return {"type": mapping[role][0], "value": int(raw.get(mapping[role][1], 0))}
```

- [ ] **Step 5: Run the suite and verify GREEN**

Expected: all registered suites PASS and the output reports zero failures.

- [ ] **Step 6: Commit**

```bash
git add src/core/summon_hud_view_model.gd src/core/summon_hud_view_model_builder.gd tests/unit/test_summon_hud_view_model.gd tests/test_runner.gd
git commit -m "feat: add nullable summon HUD view model"
```

---

### Task 2: Add Explicit Management Confirmation State

**Files:**
- Create: `src/core/summon_management_state.gd`
- Create: `tests/unit/test_summon_management_state.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: management state, event, `stroke_active`, and `draft_safe`.
- Produces: `{ok: bool, state: StringName, pause_clock: bool, emit_command: bool, error: StringName}`.

- [ ] **Step 1: Write failing pause-gate tests**

```gdscript
# tests/unit/test_summon_management_state.gd
extends RefCounted

func run(case) -> void:
    var reducer = load("res://src/core/summon_management_state.gd").new()
    var reading = reducer.reduce(&"NONE", &"OPEN_DRAWER", false, true)
    case.assert_false(reading.pause_clock, "drawer reading does not pause")
    var active_stroke = reducer.reduce(&"REQUESTED", &"ENTER_CONFIRM", true, true)
    case.assert_false(active_stroke.ok, "active stroke blocks confirmation")
    var unsafe_draft = reducer.reduce(&"REQUESTED", &"ENTER_CONFIRM", false, false)
    case.assert_false(unsafe_draft.ok, "unsafe draft blocks confirmation")
    var confirming = reducer.reduce(&"REQUESTED", &"ENTER_CONFIRM", false, true)
    case.assert_eq(&"CONFIRMING", confirming.state, "confirmation state")
    case.assert_true(confirming.pause_clock, "confirmation pauses")
    var cancelled = reducer.reduce(&"CONFIRMING", &"CANCEL", false, true)
    case.assert_eq(&"NONE", cancelled.state, "cancel returns without command")
    case.assert_false(cancelled.emit_command, "cancel emits no command")
```

- [ ] **Step 2: Run and verify RED**

Expected: FAIL because the reducer is absent.

- [ ] **Step 3: Implement the reducer**

```gdscript
# src/core/summon_management_state.gd
class_name SummonManagementState
extends RefCounted

func reduce(state: StringName, event: StringName, stroke_active: bool, draft_safe: bool) -> Dictionary:
    if event == &"OPEN_DRAWER":
        return _result(true, state, false, false, &"")
    if state == &"NONE" and event == &"REQUEST":
        return _result(true, &"REQUESTED", false, false, &"")
    if state == &"REQUESTED" and event == &"ENTER_CONFIRM":
        if stroke_active:
            return _result(false, state, false, false, &"ACTIVE_STROKE")
        if not draft_safe:
            return _result(false, state, false, false, &"DRAFT_NOT_SAFE")
        return _result(true, &"CONFIRMING", true, false, &"")
    if state == &"CONFIRMING" and event == &"CANCEL":
        return _result(true, &"NONE", false, false, &"")
    if state == &"CONFIRMING" and event == &"CONFIRM":
        return _result(true, &"NONE", false, true, &"")
    return _result(false, state, state == &"CONFIRMING", false, &"INVALID_TRANSITION")

func _result(ok: bool, state: StringName, pause_clock: bool, emit_command: bool, error: StringName) -> Dictionary:
    return {"ok": ok, "state": state, "pause_clock": pause_clock, "emit_command": emit_command, "error": error}
```

- [ ] **Step 4: Run and verify GREEN**

Expected: drawer, stroke, Draft, confirm, and cancel cases PASS.

- [ ] **Step 5: Commit**

```bash
git add src/core/summon_management_state.gd tests/unit/test_summon_management_state.gd tests/test_runner.gd
git commit -m "feat: gate summon management confirmation"
```

---

### Task 3: Bound Same-time Event Presentation

**Files:**
- Create: `src/core/summon_event_presentation_queue.gd`
- Create: `tests/unit/test_summon_event_presentation_queue.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: canonical records containing `event_id`, `batch_id`, `batch_index`, `batch_size`, and `source_slot_id`.
- Produces: ordered presentation slices whose total duration is no more than `1200ms` per batch.

- [ ] **Step 1: Write failing order and total-budget tests**

```gdscript
# tests/unit/test_summon_event_presentation_queue.gd
extends RefCounted

func run(case) -> void:
    var queue = load("res://src/core/summon_event_presentation_queue.gd").new()
    var slices = queue.build_batch([
        {"event_id": "e3", "batch_id": "b1", "source_slot_id": "S2"},
        {"event_id": "e1", "batch_id": "b1", "source_slot_id": "MAIN"},
        {"event_id": "e4", "batch_id": "b1", "source_slot_id": "S3"},
        {"event_id": "e2", "batch_id": "b1", "source_slot_id": "S1"},
    ])
    case.assert_eq(["MAIN", "S1", "S2", "S3"], slices.map(func(item): return item.source_slot_id), "canonical source order")
    var total := 0
    for item in slices:
        total += item.duration_ms
    case.assert_true(total <= 1200, "whole batch fits total budget")
    case.assert_eq("e1", slices[0].event_id, "canonical records preserved")
```

- [ ] **Step 2: Run and verify RED**

Expected: FAIL because the queue is absent.

- [ ] **Step 3: Implement deterministic bounded slices**

```gdscript
# src/core/summon_event_presentation_queue.gd
class_name SummonEventPresentationQueue
extends RefCounted

const SLOT_RANK := {"MAIN": 0, "S1": 1, "S2": 2, "S3": 3}
const TOTAL_BUDGET_MS := 1200

func build_batch(records: Array) -> Array:
    var ordered := records.duplicate(true)
    ordered.sort_custom(func(a, b): return SLOT_RANK.get(a.source_slot_id, 99) < SLOT_RANK.get(b.source_slot_id, 99))
    if ordered.is_empty():
        return []
    var duration := int(floor(float(TOTAL_BUDGET_MS) / ordered.size()))
    var result: Array = []
    for index in ordered.size():
        var item: Dictionary = ordered[index].duplicate(true)
        item.batch_index = index
        item.batch_size = ordered.size()
        item.duration_ms = duration
        result.append(item)
    return result
```

- [ ] **Step 4: Add a boundary test proving the HUD receives records, not applied IDs**

```gdscript
case.assert_false(slices[0].has("applied_event_ids"), "presentation has no dedup ownership")
```

- [ ] **Step 5: Run and verify GREEN**

Expected: deterministic ordering, total budget, and ownership tests PASS.

- [ ] **Step 6: Commit**

```bash
git add src/core/summon_event_presentation_queue.gd tests/unit/test_summon_event_presentation_queue.gd tests/test_runner.gd
git commit -m "feat: bound summon event presentation batches"
```

---

### Task 4: Build Rail and Drawer Without Stealing Active Strokes

**Files:**
- Create: `src/ui/summon_hud_rail.gd`
- Create: `src/ui/summon_hud_rail.tscn`
- Create: `src/ui/summon_detail_drawer.gd`
- Create: `src/ui/summon_detail_drawer.tscn`
- Create: `tests/integration/test_summon_hud_input.gd`
- Modify: `src/input/writing_session.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: `WritingSession.is_stroke_active()`, `WritingSession.is_draft_safe()`, and immutable HUD view data.
- Produces: `slot_inspection_requested(slot_id)` and `management_requested(slot_id, action)` signals only when permitted.

- [ ] **Step 1: Write failing active-stroke ownership tests**

```gdscript
# tests/integration/test_summon_hud_input.gd
extends RefCounted

func run(case) -> void:
    var rail = load("res://src/ui/summon_hud_rail.gd").new()
    rail.set_stroke_active(true)
    rail.request_slot("S1")
    case.assert_eq(null, rail.selected_slot_id, "rail cannot select during active stroke")
    rail.set_stroke_active(false)
    rail.request_slot("S1")
    case.assert_eq("S1", rail.selected_slot_id, "rail selects after stroke")
    var drawer = load("res://src/ui/summon_detail_drawer.gd").new()
    drawer.bind_permissions({"can_recall": true, "can_replace": true}, true)
    case.assert_false(drawer.management_enabled, "management disabled during stroke")
```

- [ ] **Step 2: Run and verify RED**

Expected: FAIL because rail and drawer scripts do not exist.

- [ ] **Step 3: Implement rail input suppression**

```gdscript
# src/ui/summon_hud_rail.gd
class_name SummonHudRail
extends Control

signal slot_inspection_requested(slot_id: String)

var selected_slot_id: Variant = null
var _stroke_active := false

func set_stroke_active(value: bool) -> void:
    _stroke_active = value

func request_slot(slot_id: String) -> void:
    if _stroke_active:
        return
    selected_slot_id = slot_id
    slot_inspection_requested.emit(slot_id)
```

- [ ] **Step 4: Implement drawer permission binding**

```gdscript
# src/ui/summon_detail_drawer.gd
class_name SummonDetailDrawer
extends Control

signal management_requested(slot_id: String, action: String)

var management_enabled := false
var _slot_id := ""

func bind_slot(slot: Dictionary, stroke_active: bool) -> void:
    _slot_id = str(slot.slot_id)
    bind_permissions(slot, stroke_active)

func bind_permissions(slot: Dictionary, stroke_active: bool) -> void:
    management_enabled = not stroke_active and bool(slot.get("can_recall", false) or slot.get("can_replace", false))

func request_management(action: String) -> void:
    if management_enabled:
        management_requested.emit(_slot_id, action)
```

- [ ] **Step 5: Create minimal scenes with non-intercepting decorative nodes**

Set decorative portrait and FX `mouse_filter = Control.MOUSE_FILTER_IGNORE`; only explicit slot hit areas use `MOUSE_FILTER_STOP`. The Writing Canvas retains its active event sequence and calls `accept_event()` for stroke events.

- [ ] **Step 6: Run and verify GREEN**

Expected: active-stroke selection and management attempts produce no state or focus change; post-stroke inspection works.

- [ ] **Step 7: Commit**

```bash
git add src/ui/summon_hud_rail.gd src/ui/summon_hud_rail.tscn src/ui/summon_detail_drawer.gd src/ui/summon_detail_drawer.tscn src/input/writing_session.gd tests/integration/test_summon_hud_input.gd tests/test_runner.gd
git commit -m "feat: protect writing strokes from summon HUD input"
```

---

### Task 5: Integrate Safe-area and Responsive Layout

**Files:**
- Modify: `src/ui/mobile_safe_root.gd`
- Modify: `src/ui/mobile_safe_root.tscn`
- Create: `tests/integration/test_summon_hud_layout.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: safe rectangle, viewport size, font scale, Writing Panel state.
- Produces: rail rectangle, drawer rectangle, and overlap report.

- [ ] **Step 1: Write failing matrix tests**

```gdscript
# tests/integration/test_summon_hud_layout.gd
extends RefCounted

func run(case) -> void:
    var root = load("res://src/ui/mobile_safe_root.gd").new()
    var cases := [
        {"size": Vector2i(1280, 720), "safe": Rect2i(0, 0, 1280, 720), "scale": 1.0},
        {"size": Vector2i(2340, 1080), "safe": Rect2i(80, 0, 2260, 1080), "scale": 1.3},
        {"size": Vector2i(2400, 1080), "safe": Rect2i(0, 0, 2320, 1080), "scale": 2.0},
    ]
    for item in cases:
        var report = root.compute_summon_layout(item.size, item.safe, item.scale, true)
        case.assert_true(item.safe.encloses(report.rail_rect), "rail remains in safe area")
        case.assert_false(report.rail_rect.intersects(report.writing_rect), "rail avoids writing panel")
        case.assert_true(report.critical_fields_visible, "critical fields remain visible")
```

- [ ] **Step 2: Run and verify RED**

Expected: FAIL because `compute_summon_layout` is absent.

- [ ] **Step 3: Implement deterministic layout calculation**

```gdscript
# addition to src/ui/mobile_safe_root.gd
func compute_summon_layout(viewport: Vector2i, safe: Rect2i, font_scale: float, writing_open: bool) -> Dictionary:
    var rail_width := clampi(int(safe.size.x * 0.09), 96, 240)
    var writing_width := int(safe.size.x * (0.36 if writing_open else 0.18))
    var rail_rect := Rect2i(safe.position.x, safe.position.y + int(safe.size.y * 0.14), rail_width, int(safe.size.y * 0.68))
    var writing_rect := Rect2i(safe.end.x - writing_width, safe.position.y, writing_width, safe.size.y)
    return {
        "rail_rect": rail_rect,
        "writing_rect": writing_rect,
        "two_line_slots": font_scale >= 1.3,
        "scroll_enabled": font_scale >= 2.0,
        "critical_fields_visible": rail_rect.end.x <= writing_rect.position.x,
    }
```

- [ ] **Step 4: Bind runtime safe-area query behind an injectable adapter**

Use `DisplayServer.get_display_safe_area()` in production runtime and inject explicit rectangles in tests. Do not hard-code a cutout side.

- [ ] **Step 5: Run and verify GREEN**

Expected: all aspect, cutout, Writing Panel, and scale cases pass without overlap.

- [ ] **Step 6: Commit**

```bash
git add src/ui/mobile_safe_root.gd src/ui/mobile_safe_root.tscn tests/integration/test_summon_hud_layout.gd tests/test_runner.gd
git commit -m "feat: add safe-area summon HUD layout"
```

---

### Task 6: Add Accessibility Labels and Non-spamming Announcements

**Files:**
- Create: `src/ui/summon_hud_accessibility.gd`
- Create: `tests/unit/test_summon_hud_accessibility.gd`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: slot view data and previous/current meaningful state.
- Produces: `accessible_name(slot) -> String` and `announcement(previous, current) -> Dictionary` with `emit` and `priority`.

- [ ] **Step 1: Write failing label and timer tests**

```gdscript
# tests/unit/test_summon_hud_accessibility.gd
extends RefCounted

func run(case) -> void:
    var a11y = load("res://src/ui/summon_hud_accessibility.gd").new()
    var slot = {"slot_id": "S1", "summon_name": "정령", "primary_role": "PRODUCTION", "representative_stat_value": 2, "remaining_cycle_ms": 3000, "state_code": "ACTIVE"}
    var name = a11y.accessible_name(slot)
    case.assert_true(name.contains("S1"), "name contains slot")
    case.assert_true(name.contains("3초"), "name contains focused timer value")
    var tick = a11y.announcement({"remaining_cycle_ms": 3000, "state_code": "ACTIVE"}, {"remaining_cycle_ms": 2000, "state_code": "ACTIVE"})
    case.assert_false(tick.emit, "ordinary second tick is silent")
    var event = a11y.announcement({"state_code": "ACTIVE", "last_event_id": null}, {"state_code": "ACTIVE", "last_event_id": "e1"})
    case.assert_true(event.emit, "new event announces")
    case.assert_eq("POLITE", event.priority, "ordinary event is queued")
```

- [ ] **Step 2: Run and verify RED**

Expected: FAIL because the accessibility helper is absent.

- [ ] **Step 3: Implement accessible names and meaningful-change classification**

```gdscript
# src/ui/summon_hud_accessibility.gd
class_name SummonHudAccessibility
extends RefCounted

func accessible_name(slot: Dictionary) -> String:
    var seconds := "상시" if slot.get("remaining_cycle_ms") == null else "%d초" % int(ceil(float(slot.remaining_cycle_ms) / 1000.0))
    return "%s, %s, %s, 수치 %s, %s, %s" % [
        slot.get("slot_id", ""),
        slot.get("summon_name", "빈 슬롯"),
        slot.get("primary_role", "역할 없음"),
        slot.get("representative_stat_value", "없음"),
        seconds,
        slot.get("state_code", "ERROR"),
    ]

func announcement(previous: Dictionary, current: Dictionary) -> Dictionary:
    if previous.get("error_message") != current.get("error_message") and current.get("error_message") != null:
        return {"emit": true, "priority": "ASSERTIVE", "text": str(current.error_message)}
    if previous.get("state_code") != current.get("state_code") or previous.get("last_event_id") != current.get("last_event_id"):
        return {"emit": true, "priority": "POLITE", "text": current.get("last_result_summary", current.get("state_code", ""))}
    return {"emit": false, "priority": "NONE", "text": ""}
```

- [ ] **Step 4: Run and verify GREEN**

Expected: unique names, silent second ticks, queued ordinary changes, and critical error priority tests PASS.

- [ ] **Step 5: Commit**

```bash
git add src/ui/summon_hud_accessibility.gd tests/unit/test_summon_hud_accessibility.gd tests/test_runner.gd
git commit -m "feat: add summon HUD accessibility semantics"
```

---

### Task 7: Verify Restore, Error, and Exactly-once Boundaries

**Files:**
- Create: `tests/integration/test_summon_hud_resume.gd`
- Modify: `src/app/foundation_poc_app.gd`
- Modify: `src/app/foundation_poc_app.tscn`
- Modify: `tests/test_runner.gd`

**Interfaces:**
- Consumes: restored roster, independent cycle values, canonical ledger records, and invalid snapshots.
- Produces: a read-only HUD state that never repairs or reapplies gameplay data.

- [ ] **Step 1: Write failing restore and ownership tests**

```gdscript
# tests/integration/test_summon_hud_resume.gd
extends RefCounted

func run(case) -> void:
    var builder = load("res://src/core/summon_hud_view_model_builder.gd").new()
    var restored = builder.build(
        {"main": {"summon_id": "wolf", "primary_role": "MAIN"}, "secondary": [
            {"slot_id": "S1", "summon_id": "a", "primary_role": "PRODUCTION", "remaining_action_cycle_ms": 1000},
            {"slot_id": "S2", "summon_id": "b", "primary_role": "GUARDIAN", "remaining_action_cycle_ms": 2000},
            {"slot_id": "S3", "summon_id": "c", "primary_role": "ASSAULT", "remaining_action_cycle_ms": 3000},
        ]},
        {"remaining_ms": 4000},
        [{"event_id": "already-applied", "source_slot_id": "S1"}]
    )
    case.assert_eq([1000, 2000, 3000], [restored.slots[1].remaining_cycle_ms, restored.slots[2].remaining_cycle_ms, restored.slots[3].remaining_cycle_ms], "independent cycles restore")
    case.assert_false(restored.has("applied_event_ids"), "HUD has no dedup collection")
    var invalid = builder.build({"main": {"summon_id": "wolf", "primary_role": "MAIN"}, "secondary": [{"slot_id": "S1", "state_code": "INVALID", "error_message": "DUPLICATE_SLOT"}]}, {}, [])
    case.assert_eq("INVALID", invalid.slots[1].state_code, "invalid slot remains explicit")
    case.assert_eq("DUPLICATE_SLOT", invalid.slots[1].error_message, "error is not silently repaired")
```

- [ ] **Step 2: Run and verify RED**

Expected: FAIL until invalid-state mapping and error preservation are implemented.

- [ ] **Step 3: Extend the builder without mutation**

Copy `state_code`, `unavailable_reason`, `error_message`, `last_event_id`, and `last_result_summary` from validated recovery output into the view model. Never edit the source roster dictionary.

- [ ] **Step 4: Add synthetic POC scenarios**

Create selectable synthetic fixtures for:

```gdscript
const SUMMON_HUD_SCENARIOS := [
    "MAIN_ONLY",
    "THREE_ACTIVE",
    "S1_EMPTY_S2_PAUSED_S3_ERROR",
    "SAME_TIME_FOUR_EVENTS",
    "RESUME_THREE_INDEPENDENT_CYCLES",
]
```

Each screen must show `POC / TEST_VALUE / NOT_CONTENT_COMPLETE`.

- [ ] **Step 5: Run and verify GREEN**

Expected: independent cycle, error preservation, immutable source, and dedup-boundary tests PASS.

- [ ] **Step 6: Commit**

```bash
git add tests/integration/test_summon_hud_resume.gd src/core/summon_hud_view_model_builder.gd src/app/foundation_poc_app.gd src/app/foundation_poc_app.tscn tests/test_runner.gd
git commit -m "test: cover summon HUD restore and error boundaries"
```

---

### Task 8: Add Scope Guard, CI, and Evidence Report Contract

**Files:**
- Create: `tools/check_mobile_summon_hud_scope.py`
- Create: `tests/test_mobile_summon_hud_contract.py`
- Modify: `.github/workflows/validate-foundation-poc.yml`
- Create: `docs/validation/MOBILE_SUMMON_HUD_VALIDATION_REPORT.md`

**Interfaces:**
- Consumes: repository tree and generated headless test result.
- Produces: nonzero exit on forbidden HUD ownership, missing tests, missing `POC / TEST_VALUE` labels, or invalid evidence claims.

- [ ] **Step 1: Write the failing Python contract test**

```python
# tests/test_mobile_summon_hud_contract.py
from __future__ import annotations

import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CHECK = ROOT / "tools" / "check_mobile_summon_hud_scope.py"


class MobileSummonHudContractTests(unittest.TestCase):
    def test_scope_checker_passes_repository_contract(self) -> None:
        completed = subprocess.run(
            [sys.executable, str(CHECK)],
            cwd=ROOT,
            capture_output=True,
            text=True,
            check=False,
        )
        self.assertEqual(0, completed.returncode, completed.stdout + completed.stderr)


if __name__ == "__main__":
    unittest.main()
```

- [ ] **Step 2: Run and verify RED**

Run:

```bash
python -m unittest tests.test_mobile_summon_hud_contract -v
```

Expected: FAIL because the checker is absent.

- [ ] **Step 3: Implement the scope checker**

```python
# tools/check_mobile_summon_hud_scope.py
from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
HUD_FILES = list((ROOT / "src").rglob("*summon*hud*.gd")) + list((ROOT / "src" / "ui").glob("summon_*.gd"))
FORBIDDEN = (
    "applied_event_ids",
    "applied_summon_event_ids",
    "commit_once(",
    "player_mana -=",
    "secondary_summon_states.append",
)
REQUIRED_TESTS = (
    "tests/unit/test_summon_hud_view_model.gd",
    "tests/unit/test_summon_management_state.gd",
    "tests/unit/test_summon_event_presentation_queue.gd",
    "tests/unit/test_summon_hud_accessibility.gd",
    "tests/integration/test_summon_hud_input.gd",
    "tests/integration/test_summon_hud_layout.gd",
    "tests/integration/test_summon_hud_resume.gd",
)


def main() -> int:
    failures: list[str] = []
    for path in HUD_FILES:
        text = path.read_text(encoding="utf-8")
        for token in FORBIDDEN:
            if token in text:
                failures.append(f"FORBIDDEN_OWNERSHIP {path.relative_to(ROOT)} {token}")
    for relative in REQUIRED_TESTS:
        if not (ROOT / relative).is_file():
            failures.append(f"MISSING_TEST {relative}")
    if failures:
        print("\n".join(failures))
        return 1
    print(f"PASS hud_files={len(HUD_FILES)} required_tests={len(REQUIRED_TESTS)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
```

- [ ] **Step 4: Extend CI**

Run in the workflow after project Toolchain verification:

```yaml
- name: Check Mobile Summon HUD scope
  run: python tools/check_mobile_summon_hud_scope.py

- name: Run Mobile Summon HUD contract tests
  run: python -m unittest tests.test_mobile_summon_hud_contract -v

- name: Run Godot headless suites
  run: "$GODOT_BIN" --headless --path . --script res://tests/test_runner.gd
```

- [ ] **Step 5: Create the evidence-report template with truthful initial state**

```markdown
# Mobile Summon HUD Validation Report

```yaml
decision_id: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_validation: NOT_RUN
```

No field may change to PASS without the command, device, configuration, result count, artifact path, and reviewer recorded in this document.
```

- [ ] **Step 6: Run full static and headless verification**

```bash
python -m unittest tests.test_mobile_summon_hud_contract -v
python tools/check_mobile_summon_hud_scope.py
python tools/check_text_integrity.py
"$GODOT_BIN" --headless --path . --script res://tests/test_runner.gd
```

Expected: all commands exit 0. If the Godot Toolchain gate has not passed, stop before execution and retain every runtime/device/accessibility/human field as `NOT_RUN`.

- [ ] **Step 7: Commit**

```bash
git add tools/check_mobile_summon_hud_scope.py tests/test_mobile_summon_hud_contract.py .github/workflows/validate-foundation-poc.yml docs/validation/MOBILE_SUMMON_HUD_VALIDATION_REPORT.md
git commit -m "test: guard mobile summon HUD implementation scope"
```

---

## Plan Self-review

### Spec coverage

- Nullable empty/error slots: Task 1 and Task 7.
- Drawer reading and management Pause: Task 2 and Task 4.
- Exactly-once ownership and total event budget: Task 3 and Task 7.
- Active-stroke input ownership: Task 4.
- Safe area, aspect ratios, cutouts, 100/130/200% scaling: Task 5.
- Touch and screen-reader semantics: Task 6, with measured-device validation explicitly deferred.
- Save/Resume and damaged-state handling: Task 7.
- CI, forbidden ownership, and truthful evidence: Task 8.

### Placeholder scan

The plan contains no `TBD`, `TODO`, implicit “implement later,” or unowned interface. Prototype dimensions and presentation time remain explicitly labeled `TEST_VALUE` by design.

### Type consistency

The plan consistently uses four slot IDs, nullable slot fields, `NONE/REQUESTED/CONFIRMING` management states, canonical event records, and the `1200ms` total batch budget.

## Execution Handoff

This plan is written but execution is blocked. After Toolchain preflight, Base v9.4.3 plan revalidation, `GM-FOUNDATION-POC-EXECUTION-READINESS-01` PASS, and explicit HUD scope approval, use one of these modes:

1. **Subagent-Driven — recommended:** execute one task per fresh worker and review spec compliance and code quality between tasks.
2. **Inline Execution:** use `superpowers:executing-plans` and complete task batches with review checkpoints.

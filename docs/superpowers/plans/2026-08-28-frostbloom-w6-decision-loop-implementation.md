# Frostbloom W6 Decision Loop Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make one short Frostbloom W6 loop playable: observed context → direct glyph/circuit foundation → equal preservation target choice → bounded forecast → explicit exactly-once cast → causal receipt.

**Architecture:** A typed Godot `Resource` is the sole W6 content authority and is assigned to the existing Product Root. Product Root adapts that Resource into the existing Coordinator, selector, commit bar, and result panel; it does not create a new transaction layer. The existing Coordinator, `AtomicSpellUseService`, and `AtomicResultLedger` retain all target-preview, confirmation, exactly-once, and rollback authority.

**Tech Stack:** Godot 4.7.1, GDScript, Godot Resource (`.tres`), current Academy Control/Container UI, project custom headless runner, GUT 9.7.1 exact-head validation, HiGodot-only persistent Scene/Resource authoring.

**Spec:** `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md`; traceability: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md`.

## Execution update — 2026-08-29

The user explicitly authorized Issue #242 implementation on 2026-08-29. The W6-only changed worktree is now implemented and has passed the custom Godot runner, GUT, editor readback, and a 1280×720 runtime smoke. The current evidence owner is `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md`; PR exact-head, Human, device, performance, accessibility, export, and full-slice evidence remain pending. The task boxes below preserve the pre-execution route and must not override the current receipt.

## Global Constraints

- Implement only GitHub Issue #242. The required explicit Godot implementation authorization was received on 2026-08-29; this document itself was never the authorization.
- Keep `글자 → 주문 → 대상 → 시전`, `FIVE_POINT_STAR`, typed glyph stock, and `EXPLICIT_EXACTLY_ONCE`; do not create another target/use/Mana/result engine.
- Author every persistent `.tscn` and `.tres` mutation through the approved Godot/HiGodot route. Do not reconstruct `spell_use_screen.gd/.tscn` through GitHub text recovery.
- W6 content is exactly `Known 2 / Unknown 2 / Lens 1` and exactly two targets: `FROST_SEEDLINGS` and `GREENHOUSE_STRUCTURE`.
- Initial values are visibly matched: both definitions use `difficulty = 3` and `mana_cost = 3`; all values remain `PLAYTEST_TUNING_REQUIRED`.
- `Unknown` is text-only category-level uncertainty: it never changes calculator inputs, Mana, success, a hidden penalty, or a later moral judgement.
- Player-visible terms are Korean: `글자`, `주문`, `완성 주문 이름`, `대상`, `시전`, `확인된 개선`, `남는 위험`, `아직 미확인`.
- Do not bind, copy, or promote the planning-board binary; use warm-academy visual grammar and the already bound greenhouse background only.
- No W7 implementation, persistent Grimoire, save migration, new asset batch, audio/VFX batch, 46-minute flow, Task8 recovery, auto-target, auto-cast, best-route, score, star, or moral grade.
- Human, device, performance, accessibility, export, and full-slice validation begin as `NOT_RUN`; automated checks cannot promote them.
- Fresh exact `origin/main`, open PR read-only check, external research, implementation-feasibility readback, five adversarial loops, exact-head checks, PR CI, merge, and post-merge readback are required by the project quality gate.

---

## Contracted W6 content

Create the Resource data below through the Godot editor. These strings are live editable text, not generated-image text.

```yaml
context_id: W6_FROSTBLOOM_PRESERVATION
known_observations:
  - "희귀 서리 묘목의 잎맥이 얼음으로 갈라지고 있습니다."
  - "온실 동쪽 지지대의 균열이 넓어지고 있습니다."
unknown_categories:
  - "서리를 퍼뜨린 원인은 아직 확인되지 않았습니다."
  - "한쪽을 먼저 지킬 때 다른 쪽이 얼마나 버틸지는 아직 모릅니다."
lens_label: "식물학 관찰"
targets:
  FROST_SEEDLINGS:
    player_label: "희귀 서리 묘목"
    hint: "잎맥의 냉기를 가라앉혀 묘목을 우선 보존합니다."
    protected_value: "희귀 서리 묘목의 생장과 수집 기록"
    target_keyword: FROST_SEEDLINGS
    effect: STABILIZE_FROST_SEEDLINGS
    difficulty: 3
    mana_cost: 3
    receipt_actual: "희귀 서리 묘목의 잎맥 균열이 가라앉아, 지금은 보존할 수 있습니다."
    receipt_remaining: "온실 동쪽 지지대의 균열은 남아 있어, 다음 관찰에서 상태를 다시 확인해야 합니다."
    receipt_unknown: "서리를 퍼뜨린 원인은 아직 확인되지 않았습니다."
  GREENHOUSE_STRUCTURE:
    player_label: "온실 동쪽 지지대"
    hint: "균열 확산을 멈춰 온실 통로를 우선 지킵니다."
    protected_value: "온실 동쪽 통로와 관찰 환경"
    target_keyword: GREENHOUSE_STRUCTURE
    effect: STABILIZE_GREENHOUSE_STRUCTURE
    difficulty: 3
    mana_cost: 3
    receipt_actual: "온실 동쪽 지지대의 균열 확산을 멈춰, 온실의 통로를 지킬 수 있습니다."
    receipt_remaining: "희귀 서리 묘목의 잎맥 냉기는 남아 있어, 다음 시도에서 보존 방법을 찾아야 합니다."
    receipt_unknown: "한쪽을 먼저 지킬 때 다른 쪽이 얼마나 버틸지는 아직 모릅니다."
```

### Task W6-T01: Create and validate the sole W6 content owner

**Files:**
- Create: `src/core/content/frostbloom_w6_target_definition.gd`
- Create: `src/core/content/frostbloom_w6_decision_context.gd`
- Create through Godot/HiGodot: `data/frostbloom/w6/w6_decision_context_01.tres`
- Create: `tests/unit/test_frostbloom_w6_decision_context.gd`
- Modify: `tests/test_runner.gd` — append the new unit suite before Product Root integration suites.

**Interfaces:**
- Produces `class_name FrostbloomW6TargetDefinition extends Resource` with `func validate() -> Dictionary` and `func to_choice() -> Dictionary`.
- Produces `class_name FrostbloomW6DecisionContext extends Resource` with `func validate() -> Dictionary`, `func target_choice(target_id: StringName) -> Dictionary`, `func target_choices() -> Array[Dictionary]`, and `func summary() -> Dictionary`.
- `validate()` returns `{ "status": &"OK" }` only for the exact W6 shape; any failure returns `{ "status": &"INVALID_W6_CONTEXT", "reason": <StringName> }` and never returns a generic target.
- `to_choice()` returns `id`, `label`, `hint`, `protected_value`, `known_improvement`, `forgone_or_remaining`, `unknown`, `target_keyword`, `target`, and `payload`. `known_improvement` derives from the same `actual` field used by `payload.receipt`; `payload.receipt` contains `actual`, `forgone_or_remaining`, and `unknown`.
- `FrostbloomW6TargetDefinition.validate()` verifies every exported string and ID used by `to_choice()`, plus positive `difficulty` and `mana_cost`. `FrostbloomW6DecisionContext` exports `known_observations`, `unknown_categories`, `lens`, and `targets: Array[FrostbloomW6TargetDefinition]`, validates all child definitions, then deep-duplicates consumer results.

- [ ] **Step 1: Write the failing Resource-contract tests**

```gdscript
func run(case) -> void:
    var context = load("res://data/frostbloom/w6/w6_decision_context_01.tres")
    case.assert_true(context != null, "W6 has one loadable Resource owner")
    case.assert_equal(&"OK", context.validate().get("status", &""), "W6 context validates")
    var choices: Array = context.target_choices()
    case.assert_equal(2, choices.size(), "W6 exposes exactly two targets")
    var seedlings: Dictionary = context.target_choice(&"FROST_SEEDLINGS")
    var structure: Dictionary = context.target_choice(&"GREENHOUSE_STRUCTURE")
    case.assert_equal(3, Dictionary(seedlings.get("target", {})).get("difficulty", -1), "seedlings uses the matched first difficulty")
    case.assert_equal(3, Dictionary(structure.get("target", {})).get("mana_cost", -1), "structure uses the matched first Mana")
    case.assert_true(context.target_choice(&"WARD").is_empty(), "generic prototype target cannot fall back into W6")
```

- [ ] **Step 2: Run the suite and verify it fails before the Resource exists**

Run: `& $GodotExecutable --headless --path . --script res://tests/test_runner.gd`

Expected: FAIL because `res://data/frostbloom/w6/w6_decision_context_01.tres` and its test suite do not exist.

- [ ] **Step 3: Implement the typed Resource classes and create the Resource through Godot/HiGodot**

```gdscript
# Frostbloom W6 대상 정의와 안전한 runtime payload를 소유한다.
class_name FrostbloomW6TargetDefinition
extends Resource

@export var target_id: StringName
@export var player_label := ""
@export var protected_value := ""
@export var hint := ""
@export var unknown := ""
@export var target_keyword: StringName
@export var effect: StringName
@export var difficulty := 3
@export var mana_cost := 3
@export var actual := ""
@export var forgone_or_remaining := ""

func to_choice() -> Dictionary:
    return {
        "id": target_id,
        "label": player_label,
        "protected_value": protected_value,
        "hint": hint,
        "known_improvement": actual,
        "forgone_or_remaining": forgone_or_remaining,
        "unknown": unknown,
        "target_keyword": target_keyword,
        "target": {"difficulty": difficulty, "mana_cost": mana_cost, "target_valid": true},
        "payload": {"effect": effect, "receipt": {"actual": actual, "forgone_or_remaining": forgone_or_remaining, "unknown": unknown}},
    }
```

`FrostbloomW6DecisionContext.validate()` must require non-empty IDs/text, `known_observations.size() == 2`, `unknown_categories.size() == 2`, non-empty `lens_label`, `target_definitions.size() == 2`, IDs exactly `FROST_SEEDLINGS` and `GREENHOUSE_STRUCTURE`, and equal non-negative `difficulty`/`mana_cost`. It must deep-duplicate values returned to consumers.

- [ ] **Step 4: Run the custom runner and inspect the Resource in the editor**

Run: `& $GodotExecutable --headless --import --path .`; then `& $GodotExecutable --headless --path . --script res://tests/test_runner.gd`

Expected: PASS with the new unit suite included. In Godot, the Resource inspector shows two W6 targets, two known observations, two unknown categories, and one Lens.

- [ ] **Step 5: Commit the isolated schema/data/test change**

```text
git add src/core/content/frostbloom_w6_target_definition.gd src/core/content/frostbloom_w6_decision_context.gd data/frostbloom/w6/w6_decision_context_01.tres tests/unit/test_frostbloom_w6_decision_context.gd tests/test_runner.gd
git commit -m "feat: add Frostbloom W6 decision context"
```

### Task W6-T02: Bind W6 context to Product Root and remove prototype ownership

**Files:**
- Modify through Godot/HiGodot: `src/ui/spell_workflow/spell_workflow_product_root.tscn`
- Modify: `src/ui/spell_workflow/spell_workflow_product_root.gd`
- Modify: `tests/integration/test_spell_workflow_product_root.gd`

**Interfaces:**
- Consumes `FrostbloomW6DecisionContext.target_choices()`, `target_choice()`, `summary()`, and `validate()` from W6-T01.
- Produces `SpellWorkflowProductRoot.target_choices() -> Array` that delegates to the Resource and `choose_target(target_id: StringName) -> Dictionary` with no `match`-based generic target dictionary.
- The root has exported `w6_context: FrostbloomW6DecisionContext`; scene assignment is the one `.tres` from W6-T01. A missing/invalid resource returns `W6_CONTEXT_REQUIRED` before slice setup.
- Adds persistent non-interactive `W6ObservationSummary` root nodes. The data text is configured by Product Root, not baked into the scene.

- [ ] **Step 1: Write the failing Product Root tests**

```gdscript
var packed_scene = load("res://src/ui/spell_workflow/spell_workflow_product_root.tscn")
var scene_root = packed_scene.instantiate()
var tree := Engine.get_main_loop() as SceneTree
tree.root.add_child(scene_root)
case.assert_equal(&"SLICE_READY", scene_root.start_slice().get("status", &""), "scene-bound W6 context starts the slice")
var targets: Array = scene_root.target_choices()
case.assert_equal([&"FROST_SEEDLINGS", &"GREENHOUSE_STRUCTURE"], [StringName(Dictionary(targets[0]).get("id", &"")), StringName(Dictionary(targets[1]).get("id", &""))], "only W6 targets are available")
case.assert_true(scene_root.choose_target(&"WARD").get("status", &"") != &"FINAL_PREVIEW_READY", "generic ward cannot be selected")
var pin: Label = scene_root.get_node(NodePath("W6ObservationSummary/Margin/Rows/Counts"))
case.assert_true(pin.text.contains("확인 2 / 미확인 2 / Lens 1"), "W6 handoff stays visible as live text")
scene_root.queue_free()
```

Update every direct `Root.new()` setup in `tests/integration/test_spell_workflow_product_root.gd`: load and assign the same `.tres` before calling `start_slice()`. Add the complementary fail-closed assertion that an unassigned fresh Root returns `W6_CONTEXT_REQUIRED` and leaves the slice unstarted.

- [ ] **Step 2: Run the custom runner and verify the new root assertions fail**

Run: `& $GodotExecutable --headless --path . --script res://tests/test_runner.gd`

Expected: FAIL because the root still offers `WARD`/`FLOWER`, owns duplicate dictionaries, and has no W6 observation summary nodes.

- [ ] **Step 3: Implement one root binding and one persistent context pin**

```gdscript
@export var w6_context: FrostbloomW6DecisionContext

func start_slice() -> Dictionary:
    if w6_context == null or StringName(w6_context.validate().get("status", &"")) != &"OK":
        return {"status": &"W6_CONTEXT_REQUIRED"}
    # Existing stock, glyph, coordinator, Mana, and ledger setup remains unchanged below.

func target_choices() -> Array:
    return w6_context.target_choices() if w6_context != null else []

func _target_choice(target_id: StringName) -> Dictionary:
    return w6_context.target_choice(target_id) if w6_context != null else {}
```

Create `W6ObservationSummary/Margin/Rows/Counts`, `Known`, `Unknown`, and `Lens` under the root. Give the panel `mouse_filter = MOUSE_FILTER_IGNORE`, a visible text contrast surface, and `z_index = 10`. Give the three full-screen hosts enough top offset to avoid overlap with the summary pin. `_render_w6_observation_summary()` writes headings plus the Resource text; no state is stored in node text.

- [ ] **Step 4: Run root and all custom suites, then inspect the 1280×720 scene composition**

Run: `& $GodotExecutable --headless --import --path .`; then `& $GodotExecutable --headless --path . --script res://tests/test_runner.gd`

Expected: PASS. The W6 pin remains visible across glyph, circuit, target, and receipt states without blocking input.

- [ ] **Step 5: Commit the Root adaptation**

```text
git add src/ui/spell_workflow/spell_workflow_product_root.gd src/ui/spell_workflow/spell_workflow_product_root.tscn tests/integration/test_spell_workflow_product_root.gd
git commit -m "feat: bind W6 context to product root"
```

### Task W6-T03: Render equal preservation cards and a bounded Korean forecast

**Files:**
- Modify through Godot/HiGodot: `src/ui/components/context_target_selector.tscn`
- Modify: `src/ui/components/context_target_selector.gd`
- Modify through Godot/HiGodot: `src/ui/components/commit_bar.tscn`
- Modify: `src/ui/components/commit_bar.gd`
- Modify through Godot/HiGodot: `src/ui/spell_workflow/spell_use_screen.tscn`
- Modify: `src/ui/spell_workflow/spell_use_screen.gd`
- Modify: `tests/integration/test_spell_use_screen.gd`
- Modify: `tests/gut/integration/test_spell_use_screen.gd`

**Interfaces:**
- Consumes one W6 choice dictionary returned by W6-T01/W6-T02.
- `ContextTargetSelector.configure_targets(targets: Array[Dictionary], selected_id: StringName = &"")` retains its generic `id`/`label`/`hint` contract and additionally renders W6 semantic fields when supplied; it emits only `target_selected(id)` and never recommends a choice. The W6 consumer validates the stricter semantic payload before use.
- `SpellUseScreen.set_target_choices()` retains each full W6 choice. On selection it passes only `target_keyword`, `target`, and `payload` to the existing Coordinator, then renders semantic fields from that stored choice alongside the authoritative preview. If an invalid selection is attempted after a valid preview, its Korean error guidance appears without clearing the existing preview or enabling a new cast; with no valid preview, it remains empty.
- `CommitBar.configure(target_label: String, mana_cost: int, can_commit: bool, confirmation_required: bool)` remains display-only and owns no transaction.

- [ ] **Step 1: Write failing UI contract tests**

```gdscript
selection_screen.set_target_choices([seedlings_choice, structure_choice])
var selector = selection_screen.find_child("TargetSelector", true, false)
var displayed: Array = selector.visual_snapshot().get("targets", [])
case.assert_equal(2, displayed.size(), "two equal W6 cards are shown")
case.assert_true(String(Dictionary(displayed[0]).get("protected_value", "")).length() > 0, "each card names its protected value")
case.assert_true(String(Dictionary(displayed[1]).get("remaining_risk", "")).length() > 0, "each card names its remaining risk")
selector.target_selected.emit(&"FROST_SEEDLINGS")
case.assert_true((selection_screen.find_child("KnownImprovement", true, false) as Label).text.contains("확인된 개선"), "forecast names the known improvement")
case.assert_true((selection_screen.find_child("Unknown", true, false) as Label).text.contains("아직 미확인"), "forecast keeps unknown explicit")
case.assert_false(selection_screen.find_child("PreparedSpellSummary", true, false).text.contains("COMPLETED"), "raw English no longer owns the player surface")
```

- [ ] **Step 2: Run the custom runner and verify forecast/card assertions fail**

Run: `& $GodotExecutable --headless --path . --script res://tests/test_runner.gd`

Expected: FAIL because selector cards only receive `label`/`hint`, the screen prints raw statuses, and current scene text is English.

- [ ] **Step 3: Implement the smallest semantic UI adaptation**

```gdscript
func _render_preview_status(status: StringName, preview_result: Dictionary, can_commit: bool) -> void:
    var forecast := Dictionary(_current_choice)
    _set_label("Content/FinalPreview/Status", _player_status(status))
    _set_label("Content/FinalPreview/KnownImprovement", "확인된 개선\n%s" % forecast.get("known_improvement", ""))
    _set_label("Content/FinalPreview/RemainingRisk", "남는 위험\n%s" % forecast.get("remaining_risk", ""))
    _set_label("Content/FinalPreview/Unknown", "아직 미확인\n%s" % forecast.get("unknown", ""))
    var preview: Dictionary = Dictionary(preview_result.get("preview", {}))
    _set_label("Content/FinalPreview/Rationale", "성공 근거\n완성 주문의 기본 성공률과 대상 난도를 반영했습니다. 예상 성공률: %d%%" % int(preview.get("success_percent", 0)))
    _commit_bar.configure(String(forecast.get("label", "—")), int(preview.get("estimated_mana", 0)), can_commit, _confirmation_requested)
```

Set static scene copy to `완성 주문 이름`, `대상을 고르세요.`, `취소`, `대상`, `마나`, `다시 선택`, `시전`, and `시전 확인`. Map `INVALID_TARGET`, `INSUFFICIENT_MANA`, and use-confirmation failures to Korean action guidance while preserving the valid preview until the player edits or cancels. Use heading plus body text for all forecast sections; a highlight may assist but cannot be the only state signal.

- [ ] **Step 4: Run custom and GUT UI suites**

Run: `& $GodotExecutable --headless --path . --script res://tests/test_runner.gd`; then `& $GodotExecutable --headless --path . -s addons/gut/gut_cmdln.gd -gconfig=res://.gutconfig.json -gexit`

Expected: PASS. The selector keeps two equal semantic cards; the commit bar still delegates confirmation/use exactly once; UI tests find Korean player copy and forecast headings.

- [ ] **Step 5: Commit the UI adaptation**

```text
git add src/ui/components/context_target_selector.gd src/ui/components/context_target_selector.tscn src/ui/components/commit_bar.gd src/ui/components/commit_bar.tscn src/ui/spell_workflow/spell_use_screen.gd src/ui/spell_workflow/spell_use_screen.tscn tests/integration/test_spell_use_screen.gd tests/gut/integration/test_spell_use_screen.gd
git commit -m "feat: show Frostbloom target forecast"
```

### Task W6-T04: Render causal receipt and prove transaction regressions

**Files:**
- Modify through Godot/HiGodot: `src/ui/spell_workflow/spell_workflow_product_root.tscn`
- Modify: `src/ui/spell_workflow/spell_workflow_product_root.gd`
- Modify: `tests/integration/test_spell_workflow_product_root.gd`
- Modify: `tests/unit/test_spell_workflow_coordinator.gd`
- Modify: `tests/unit/test_atomic_spell_use_service.gd`
- Modify: `tests/unit/test_atomic_result_ledger.gd`

**Interfaces:**
- Consumes `result.result.receipt.actual`, `forgone_or_remaining`, and `unknown` from the same W6 Resource payload.
- Produces `ResultPanel/Actual`, `Remaining`, `Unknown`, and `ManaSpent` labels. `_on_cast_resolved()` renders only a `USED` result with all three fields; a malformed receipt has no fabricated outcome and stays in the existing error/retry path.
- Does not alter Coordinator or atomic service signatures. Existing nested payload transport and rollback are regression-protected, not duplicated.

- [ ] **Step 1: Write failing receipt and transaction tests**

```gdscript
var used: Dictionary = scene_root.confirm_cast()
case.assert_equal(&"USED", used.get("status", &""), "one explicit W6 cast succeeds")
var actual: Label = scene_root.get_node(NodePath("ResultPanel/Actual"))
var remaining: Label = scene_root.get_node(NodePath("ResultPanel/Remaining"))
var unknown: Label = scene_root.get_node(NodePath("ResultPanel/Unknown"))
case.assert_true(actual.text.contains("실제로 개선된 것"), "receipt separates actual improvement")
case.assert_true(remaining.text.contains("선택으로 남은 것"), "receipt separates remaining value")
case.assert_true(unknown.text.contains("아직 미확인"), "receipt separates uncertainty")
case.assert_equal(&"USE_CONFIRMATION_REQUIRED", scene_root.confirm_cast().get("status", &""), "repeat cast stays closed")
```

Add unit assertions that `AtomicSpellUseService.use()` returns the nested receipt unchanged for the first matching transaction and returns the same result without a second Mana spend for the same transaction ID. Keep existing insufficient-Mana and rollback tests; add one malformed W6 payload case that leaves inventory, Mana, and result ledger snapshots unchanged.

- [ ] **Step 2: Run the custom runner and verify the receipt assertions fail**

Run: `& $GodotExecutable --headless --path . --script res://tests/test_runner.gd`

Expected: FAIL because current `ResultPanel` has one `Receipt` label and no three-layer W6 result representation.

- [ ] **Step 3: Implement three live receipt sections without a new result system**

```gdscript
func _on_cast_resolved(result: Dictionary) -> void:
    if StringName(result.get("status", &"")) != &"USED":
        return
    var resolved: Dictionary = Dictionary(result.get("result", {}))
    var receipt: Dictionary = Dictionary(resolved.get("receipt", {}))
    if not receipt.has_all(["actual", "forgone_or_remaining", "unknown"]):
        return
    _set_label("ResultPanel/Actual", "실제로 개선된 것\n%s" % receipt["actual"])
    _set_label("ResultPanel/Remaining", "선택으로 남은 것\n%s" % receipt["forgone_or_remaining"])
    _set_label("ResultPanel/Unknown", "아직 미확인\n%s" % receipt["unknown"])
    _set_label("ResultPanel/ManaSpent", "사용 마나: %d" % int(result.get("mana_spent", 0)))
    _cast_committed = true
    _last_result = result.duplicate(true)
    _step = &"RESULT"
    _show_step()
```

Replace the old one-line receipt label with the four labels above. Do not add score, star, reward, alignment, or inferred W7 fact. The same W6 context remains visible behind/alongside the result as a read-only pin.

- [ ] **Step 4: Run all deterministic transaction and product-root checks**

Run: `& $GodotExecutable --headless --import --path .`; then `& $GodotExecutable --headless --path . --script res://tests/test_runner.gd`

Expected: PASS. W6 target switching has no side effect; cancel-before-commit, insufficient Mana, malformed payload rollback, confirmation spam, and repeat confirmation preserve the existing atomic boundaries.

- [ ] **Step 5: Commit the receipt and regression change**

```text
git add src/ui/spell_workflow/spell_workflow_product_root.gd src/ui/spell_workflow/spell_workflow_product_root.tscn tests/integration/test_spell_workflow_product_root.gd tests/unit/test_spell_workflow_coordinator.gd tests/unit/test_atomic_spell_use_service.gd tests/unit/test_atomic_result_ledger.gd
git commit -m "feat: add Frostbloom causal receipt"
```

### Task W6-T05: Execute exact-head validation and evidence-bound acceptance review

**Files:**
- Create: `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_RUNTIME_INSPECTION_2026-08-28.md`
- Create: `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_HUMAN_OBSERVATION_SCRIPT_2026-08-28.md`
- Modify: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/PROJECT_HOME.md`

**Interfaces:**
- Consumes implemented paths and test outputs from W6-T01 through W6-T04.
- Produces an evidence record that separates static, custom runner, GUT, runtime visual, Human, device, performance, export, and full-slice results.
- The traceability packet moves to `CONVERGED` only when every W6 requirement maps to its required evidence. It stays `PARTIAL_EVIDENCED` when any required evidence layer is absent.

- [ ] **Step 1: Write failing evidence-contract checks**

```python
def test_w6_traceability_does_not_claim_convergence_without_execution():
    packet = Path("docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md").read_text(encoding="utf-8")
    assert "coverage_status: GAP" in packet or "coverage_status: BLOCKED_UNVERIFIED" in packet
    assert "Human, device, performance, export, and full-slice evidence are absent." in packet
```

Add this assertion to the existing current-authority reality contract only if that suite already owns similar documentation status checks; otherwise leave the check in the W6 review record and do not create a duplicate policy test.

- [ ] **Step 2: Run document and current custom checks before evidence is collected**

Run: `python -m unittest tests.test_current_authority_reality_contract -v`; then `& $GodotExecutable --headless --path . --script res://tests/test_runner.gd`

Expected: PASS only for the implemented deterministic scope; runtime visual and human evidence remain explicitly `NOT_RUN`.

- [ ] **Step 3: Perform and record the required exact-head checks**

```text
1. Read fresh origin/main, current Base completed main, open PRs, and the exact PR head.
2. Run Godot import and the custom headless runner on the exact head.
3. Run GUT exact-head validation with the generated PR number, actual base SHA, and actual Godot 4.7.1 executable.
4. Inspect the Product Root through the authorised Godot/HiGodot route at 1280×720 GL Compatibility and a real mobile-landscape target; capture overlap, focus, contrast, and touch-size findings.
5. Run the W6 human script: ask the player before cast what each choice protects and leaves, and after receipt what changed, remains, and is still unknown.
6. Record device, performance, export, and full-slice as NOT_RUN unless each one is actually executed.
```

The runtime inspection must check: persistent W6 pin, equal card geometry/information density, no clipped forecast/receipt, readable headings, action size at least the current 48 px control baseline, edit/cancel escape, no planning-board binary binding, and no colour-only state meaning.

- [ ] **Step 4: Run post-implementation adversarial review and PR checks**

Run: `python tools/generate_project_operating_views.py --check`; `python -m unittest tests.test_current_authority_reality_contract tests.test_base_v91_operating_contract tests.test_base_v942_planning_first_adoption tests.test_base_v943_first_prompt_adoption`; then run the repository’s required PR checks on the exact head.

Expected: all applicable exact-head checks pass. Complete five full-scope adversarial loops covering: player-value connection, target parity, unknown-as-penalty, transaction rollback, UI readability/copy, planning-image boundary, implementation scope, documentation freshness, and evidence-claim ceiling.

- [ ] **Step 5: Commit evidence records, push, review, merge, and read main back**

```text
git add docs/validation/W6_FROSTBLOOM_DECISION_LOOP_RUNTIME_INSPECTION_2026-08-28.md docs/validation/W6_FROSTBLOOM_DECISION_LOOP_HUMAN_OBSERVATION_SCRIPT_2026-08-28.md docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md docs/ACTIVE_CONTEXT.md docs/PROJECT_HOME.md
git commit -m "docs: record W6 decision-loop validation"
git push -u origin <current-w6-implementation-branch>
```

Create a PR linked to #242, wait for exact-head required checks, merge only after all required evidence is present, then fetch/read `origin/main`, rerun the required post-merge checks, and update the Packet with the merge SHA and actual evidence statuses. Do not use direct main, force push, blind reset, clean, or rebase.

## Plan self-review

| Check | Result |
| --- | --- |
| W6-R01–R09 each map to at least one task, planned implementation path, and verification ID. | PASS — see the L3 Packet matrix. |
| W6-AC01–AC08 are covered by Resource, Root, UI, receipt, runtime, and human checks. | PASS — automated coverage is separate from W6-VFY07/08. |
| Existing Coordinator / atomic transaction authority remains the only mutation owner. | PASS — no core transaction API is changed. |
| Generic WARD/FLOWER fallback and numeric asymmetry are excluded. | PASS — Resource validation and Root tests reject it. |
| Planning image stays non-runtime and exact state stays live text. | PASS — no asset path is introduced. |
| Placeholder scan for `TBD`, `TODO`, `implement later`, and unnamed error handling. | PASS — no unresolved implementation step is used. |
| Type/signature consistency across tasks. | PASS — W6-T01’s Resource API is the only new producer API. |

## Execution boundary

Issue #242 implementation was authorized and completed in the changed worktree on 2026-08-29. This plan remains a historical execution route; the implementation receipt is the current status owner. No production asset batch was created. The next action is PR exact-head validation, then separate Human/device/performance/accessibility/export/full-slice gates.

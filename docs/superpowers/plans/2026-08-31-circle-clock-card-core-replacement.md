# Circle, Clock, Card Core Replacement Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox syntax for tracking.

**Goal:** Replace GRIMOIRE's star runtime with a story-led front door, role-free 1–3 layered-circle magic, event clocks, and a narrative-gated card ruleset shell.

**Architecture:** Focused GDScript units own circle composition, event-clock resolution, card rules, and story progress. The front door starts or resumes StoryProgress and never selects lesson, practicum, duel, or festival modes. The old star runtime remains only long enough to prove the replacement, then its runtime code, scenes, tests, and unused assets are removed.

**Tech Stack:** Godot 4.7.1, GDScript, Godot Resources, custom tests/test_runner.gd, GL Compatibility, 1280×720 landscape.

**Spec:** docs/superpowers/specs/2026-08-31-circle-clock-card-core-replacement-design.md

## Global Constraints

- CircleComposition accepts exactly 1–3 role-free glyph instances. It has no Main, Auxiliary, centre, vertex, or hidden slot bonus.
- Direct glyph writing, explicit target choice, visible pre-commit preview, explicit exactly-once commit, and no automatic target/commit survive.
- Event clocks move only from declared story-action/phase resolutions, never menus, dialogue reading, or wall-clock time.
- Every event action and round-end action is idempotent by action id.
- The front door owns only new record, resume record, and settings.
- Card types are WIZARD, ATTACK_SPELL, DEFENSE_SPELL, and SUMMON. Rounds are 3; budgets are [7, 7, 6]; total is 20; first to 2 rounds wins; unused prepared spells resolve once at round end.
- Unspecified duel rules remain RULESET_PENDING.
- Functional text, values, buttons, and clock segments are live Controls, never baked into art.
- Preserve the approved warm academy visual tone. Character cards use student-feeling upper-body illustrations only.
- Do not touch the concurrent codex-first-session-r2-runtime editor worktree.
- Historical documents remain. Star runtime code, scenes, tests, and unconsumed assets are deleted only after replacement tests pass.

---

## File Structure

| Path | Responsibility |
|---|---|
| src/core/circle/circle_composition.gd | Immutable 1–3 glyph composition, logical signature, visual layer order. |
| src/core/circle/circle_composition_resolver.gd | Target-independent semantic/method/risk Preview. |
| src/core/events/event_clock_definition.gd | Static event and clock Resource data. |
| src/core/events/event_clock_state.gd | Serializable clock values and exactly-once action history. |
| src/core/events/event_clock_resolver.gd | One explicit goal/threat resolution per story action. |
| src/core/cards/card_definition.gd | Card type, composition, story unlock, art state. |
| src/core/cards/card_ruleset.gd | Fixed approved round/mana rules and pending-rule list. |
| src/core/cards/card_round_state.gd | Separate duel state and once-only round-end state. |
| src/core/story/story_progress.gd | Narrative beat, record identity, next scene route. |
| src/ui/front_door/story_front_door.gd/.tscn | New record/resume/settings front door. |
| src/ui/story/admission_prologue.gd/.tscn | First story scene; it advances only from a visible narrative action. |
| src/ui/story/story_event_root.gd/.tscn | First event: composition, target, action, clocks, result. |
| src/ui/components/event_clock_view.gd/.tscn | Live goal/threat clock presentation. |
| src/ui/cards/card_archive_screen.gd/.tscn | Story-unlocked card archive and pending duel state. |
| data/events/frostbloom/frostbloom_event_01.tres | First practicum event definition. |
| data/cards/card_ruleset_01.tres | Approved fixed card rules. |
| tests/unit/test_circle_composition.gd | Circle validation, signature, preview tests. |
| tests/unit/test_event_clock_resolver.gd | Clock movement and idempotency tests. |
| tests/unit/test_card_ruleset.gd | Fixed card rule contract tests. |
| tests/unit/test_story_progress.gd | Narrative route tests. |
| tests/integration/test_story_front_door.gd | No activity-mode hub test. |
| tests/integration/test_story_event_root.gd | First event and clock UI integration. |
| tests/integration/test_card_archive_screen.gd | Card archive and pending-duel integration. |

All tests run through:

~~~powershell
& 'C:\Users\user\.cache\omenward-tools\godot-4.7.1\Godot_v4.7.1-stable_win64_console.exe' --headless --path . --script res://tests/test_runner.gd
~~~

Scene smoke uses:

~~~powershell
& 'C:\Users\user\.cache\omenward-tools\godot-4.7.1\Godot_v4.7.1-stable_win64_console.exe' --headless --path . --quit-after 3
~~~

### Task 1: Establish the replacement test boundary

**Files:**
- Modify: tests/test_runner.gd
- Create: tests/unit/test_circle_composition.gd
- Create: tests/unit/test_event_clock_resolver.gd
- Create: tests/unit/test_card_ruleset.gd
- Create: tests/unit/test_story_progress.gd
- Create: tests/integration/test_story_front_door.gd
- Create: tests/integration/test_story_event_root.gd
- Create: tests/integration/test_card_archive_screen.gd

**Interfaces:**
- Consumes: tests/test_case.gd and its run(case) convention.
- Produces: registered test coverage for every replacement unit before star removal starts.

- [ ] **Step 1: Register every new suite ahead of the old star suites.**

~~~gdscript
"res://tests/unit/test_circle_composition.gd",
"res://tests/unit/test_event_clock_resolver.gd",
"res://tests/unit/test_card_ruleset.gd",
"res://tests/unit/test_story_progress.gd",
"res://tests/integration/test_story_front_door.gd",
"res://tests/integration/test_story_event_root.gd",
"res://tests/integration/test_card_archive_screen.gd",
~~~

- [ ] **Step 2: Give every suite an existence assertion for its first production path.**

~~~gdscript
const PATH := "res://src/core/circle/circle_composition.gd"

func run(case) -> void:
    case.assert_true(FileAccess.file_exists(PATH), "Circle composition implementation must exist")
~~~

- [ ] **Step 3: Run the full test command.**

Expected: FAIL because the replacement paths do not exist; existing star suites still pass.

- [ ] **Step 4: Commit the boundary.**

~~~powershell
git add tests/test_runner.gd tests/unit/test_circle_composition.gd tests/unit/test_event_clock_resolver.gd tests/unit/test_card_ruleset.gd tests/unit/test_story_progress.gd tests/integration/test_story_front_door.gd tests/integration/test_story_event_root.gd tests/integration/test_card_archive_screen.gd
git commit -m "test: define circle clock card replacement boundary"
~~~

### Task 2: Implement role-free layered-circle composition

**Files:**
- Create: src/core/circle/circle_composition.gd
- Create: src/core/circle/circle_composition_resolver.gd
- Modify: src/core/glyphs/glyph_catalog.gd
- Modify: tests/unit/test_circle_composition.gd

**Interfaces:**
- Consumes: glyph ids from GlyphCatalog.
- Produces: CircleComposition.create(glyph_ids, visual_layers), validation(), logical_signature(), and CircleCompositionResolver.preview(composition, context_tags).

- [ ] **Step 1: Write failing cap, role-removal, and layer-order tests.**

~~~gdscript
var composition = CircleComposition.create([&"HEAT", &"SUMMON"], [&"SUMMON", &"HEAT"])
case.assert_equal(&"OK", composition.validation().get("status", &""), "Two glyphs form a valid layered circle")
var reversed = CircleComposition.create([&"SUMMON", &"HEAT"], [&"HEAT", &"SUMMON"])
case.assert_equal(composition.logical_signature(), reversed.logical_signature(), "Logical meaning ignores visual layer order")
var overflow = CircleComposition.create([&"HEAT", &"FLOW", &"PROTECT", &"SUMMON"], [])
case.assert_equal(&"GLYPH_COUNT_EXCEEDED", overflow.validation().get("status", &""), "Four glyphs exceed the three-circle cap")
case.assert_false(composition.to_snapshot().has("main_glyph"), "Layered circles expose no Main glyph")
~~~

- [ ] **Step 2: Run the full test command.**

Expected: FAIL because CircleComposition does not exist.

- [ ] **Step 3: Implement immutable composition and semantic Preview.**

~~~gdscript
class_name CircleComposition
extends RefCounted

const MAX_GLYPH_COUNT := 3
var _glyph_ids: Array[StringName] = []
var _visual_layers: Array[StringName] = []

static func create(glyph_ids: Array[StringName], visual_layers: Array[StringName]) -> CircleComposition:
    var value := CircleComposition.new()
    value._glyph_ids = glyph_ids.duplicate()
    value._visual_layers = visual_layers.duplicate()
    return value

func logical_signature() -> StringName:
    var names: Array[String] = []
    for glyph_id in _glyph_ids:
        names.append(String(glyph_id))
    names.sort()
    return StringName("+".join(names))
~~~

GlyphCatalog must expose semantic and method tags. Remove its public Main/Auxiliary role classification rather than renaming it.

- [ ] **Step 4: Run the full test command.**

Expected: PASS. Preview has composition_signature, meaning_tags, method_tags, and risk_tags, but no star slot/main/auxiliary label.

- [ ] **Step 5: Commit the composition core.**

~~~powershell
git add src/core/circle src/core/glyphs/glyph_catalog.gd tests/unit/test_circle_composition.gd
git commit -m "feat: add role-free layered circle composition"
~~~

### Task 3: Implement the event-clock engine

**Files:**
- Create: src/core/events/event_clock_definition.gd
- Create: src/core/events/event_clock_state.gd
- Create: src/core/events/event_clock_resolver.gd
- Modify: tests/unit/test_event_clock_resolver.gd

**Interfaces:**
- Consumes: composition Preview and a declared action with action_id, target_id, and method_tags.
- Produces: EventClockResolver.resolve(state, action), one ClockResolution, state snapshot, and visible consequence tags.

- [ ] **Step 1: Write failing exact-once and no-menu-clock tests.**

~~~gdscript
var first = resolver.resolve(state, {"action_id": &"frost-1", "method_tags": [&"HEAT", &"STABILIZE"], "target_id": &"FROST_SEEDLINGS"})
case.assert_equal(&"RESOLVED", first.get("status", &""), "Declared action resolves clocks")
var second = resolver.resolve(first.get("state"), {"action_id": &"frost-1", "method_tags": [&"HEAT", &"STABILIZE"], "target_id": &"FROST_SEEDLINGS"})
case.assert_equal(&"ALREADY_RESOLVED", second.get("status", &""), "One action cannot move clocks twice")
var menu = resolver.resolve(first.get("state"), {"action_id": &"menu-open", "kind": &"MENU_OPEN"})
case.assert_equal(&"NO_CLOCK_CHANGE", menu.get("status", &""), "Opening a menu never moves an event clock")
~~~

- [ ] **Step 2: Run the full test command.**

Expected: FAIL because event-clock classes do not exist.

- [ ] **Step 3: Implement definition, state, and resolver.**

~~~gdscript
class_name EventClockState
extends RefCounted

var goal_segments := 0
var threat_segments := 0
var resolved_action_ids: Dictionary = {}

func has_resolved(action_id: StringName) -> bool:
    return resolved_action_ids.has(action_id)

func mark_resolved(action_id: StringName) -> void:
    resolved_action_ids[action_id] = true
~~~

The resolver applies one explicit change set per action id. It may advance goal and threat together, but never erases a successful goal advance because threat also advances.

- [ ] **Step 4: Run the full test command and commit.**

~~~powershell
git add src/core/events tests/unit/test_event_clock_resolver.gd
git commit -m "feat: add explicit event clock resolver"
~~~

Expected: PASS; no clock test depends on elapsed real seconds.

### Task 4: Add narrative progress and a story-led front door

**Files:**
- Create: src/core/story/story_progress.gd
- Create: src/ui/front_door/story_front_door.gd
- Create: src/ui/front_door/story_front_door.tscn
- Create: src/ui/story/admission_prologue.gd
- Create: src/ui/story/admission_prologue.tscn
- Modify: project.godot
- Modify: tests/unit/test_story_progress.gd
- Modify: tests/integration/test_story_front_door.gd

**Interfaces:**
- Consumes: StoryProgress.create_new() and next_scene_path().
- Produces: default main scene with NewRecordButton, optional ResumeRecordButton, and SettingsButton only.

- [ ] **Step 1: Write failing narrative-route and forbidden-mode tests.**

~~~gdscript
var progress = StoryProgress.create_new()
case.assert_equal(&"ADMISSION_PROLOGUE", progress.current_beat(), "New record begins at admission")
case.assert_true(ResourceLoader.exists(progress.next_scene_path()), "New record route loads the admission prologue")
case.assert_false(progress.available_front_door_actions().has(&"LESSON"), "Front door never offers lesson mode selection")
case.assert_false(progress.available_front_door_actions().has(&"DUEL"), "Front door never offers duel mode selection")
~~~

- [ ] **Step 2: Run the full test command.**

Expected: FAIL because StoryProgress and the front-door scene do not exist.

- [ ] **Step 3: Implement StoryProgress and live-Control front door.**

~~~gdscript
class_name StoryProgress
extends RefCounted

const ADMISSION_PROLOGUE := &"ADMISSION_PROLOGUE"
var _current_beat: StringName = ADMISSION_PROLOGUE

static func create_new() -> StoryProgress:
    return StoryProgress.new()

func next_scene_path() -> String:
    return "res://src/ui/story/admission_prologue.tscn"
~~~

ResumeRecordButton is visible only when valid progress is supplied. AdmissionPrologue owns a single visible continue action that advances StoryProgress to the first event route. Do not add lesson, practicum, duel, festival, card archive, or event archive as front-door buttons.

- [ ] **Step 4: Set the main scene through the exact-worktree Godot editor, run full tests and scene smoke, then commit.**

~~~powershell
git add src/core/story src/ui/front_door src/ui/story/admission_prologue.gd src/ui/story/admission_prologue.tscn project.godot tests/unit/test_story_progress.gd tests/integration/test_story_front_door.gd
git commit -m "feat: add story-led front door"
~~~

Expected: the configured main scene is story_front_door.tscn at 1280×720.

### Task 5: Build the first event and live clock UI

**Files:**
- Create: data/events/frostbloom/frostbloom_event_01.tres
- Create: src/ui/components/event_clock_view.gd
- Create: src/ui/components/event_clock_view.tscn
- Create: src/ui/story/story_event_root.gd
- Create: src/ui/story/story_event_root.tscn
- Modify: tests/integration/test_story_event_root.gd

**Interfaces:**
- Consumes: CircleComposition, CircleCompositionResolver, EventClockResolver, StoryProgress.
- Produces: goal/threat clocks, explicit target, explicit action, and a result receipt.

- [ ] **Step 1: Write failing first-event integration tests.**

~~~gdscript
var result = root.resolve_event_action(&"frost-action-01", [&"HEAT", &"STABILIZE"], &"FROST_SEEDLINGS")
case.assert_equal(&"RESOLVED", result.get("status", &""), "Explicit story action resolves once")
case.assert_true(root.goal_clock_segments() > 0, "Matching method advances the goal clock")
var repeated = root.resolve_event_action(&"frost-action-01", [&"HEAT", &"STABILIZE"], &"FROST_SEEDLINGS")
case.assert_equal(&"ALREADY_RESOLVED", repeated.get("status", &""), "Repeated UI input cannot resolve the event twice")
~~~

- [ ] **Step 2: Run the full test command.**

Expected: FAIL because the event resource and scene root do not exist.

- [ ] **Step 3: Implement the event resource, event root, and clock view.**

The resource declares the six-segment goal 서리 안정화 and four-segment threat 온실 균열 확산. The view creates live segment Controls and changes them only from returned resolutions. The event root requires a target choice and explicit action before resolution.

- [ ] **Step 4: Run full tests and scene smoke, then commit.**

~~~powershell
git add data/events src/ui/components/event_clock_view.gd src/ui/components/event_clock_view.tscn src/ui/story tests/integration/test_story_event_root.gd
git commit -m "feat: connect frostbloom clocks to story"
~~~

Expected: result receipt shows both improvement and remaining risk.

### Task 6: Produce and register visual candidates

**Files:**
- Create: docs/planning/visual/CIRCLE_CLOCK_CARD_CORE_VISUAL_BRIEF_2026-08-31.md
- Create: assets/art/source_candidates/circle_clock_card_core/front_door/
- Create: assets/art/source_candidates/circle_clock_card_core/cards/
- Modify: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json

**Interfaces:**
- Consumes: approved style lock, front-door requirements, card type definitions, and visual ownership rules.
- Produces: candidate images and provenance. Candidates are never runtime assets before final user lock.

- [ ] **Step 1: Write a concrete brief for four consumers.**

The brief contains one warm academy front-door background with no logo/text; one card-frame/card-back family with no rules text; attack/defense/summon symbolic art with no numeric text; and one student upper-body wizard card. It rejects empty decorative side panels, adult-teacher character reads, 3D exploration, copied card frames, and baked UI values.

- [ ] **Step 2: Generate exactly one candidate per brief, inspect it, and register GENERATED_CANDIDATE.**

Store originals under assets/art/source_candidates/circle_clock_card_core/. Record generator, prompt identifier, SHA-256, consumer, and runtime_status NOT_IMPLEMENTED in the coverage source.

- [ ] **Step 3: Validate assets and provenance.**

~~~powershell
Get-ChildItem assets/art/source_candidates/circle_clock_card_core -File
Get-Content docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json -Raw | ConvertFrom-Json | Out-Null
~~~

Expected: every candidate has one consumer and is not referenced from a runtime scene.

- [ ] **Step 4: Show candidates to the user and obtain final lock or a requested revision.**

Do not copy a candidate into assets/art or reference it in a runtime scene before the user locks that family.

- [ ] **Step 5: Commit brief, candidate provenance, and source candidates.**

~~~powershell
git add docs/planning/visual/CIRCLE_CLOCK_CARD_CORE_VISUAL_BRIEF_2026-08-31.md docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json assets/art/source_candidates/circle_clock_card_core
git commit -m "art: add circle clock card visual candidates"
~~~

### Task 7: Implement the narrative-gated card ruleset shell

**Files:**
- Create: src/core/cards/card_definition.gd
- Create: src/core/cards/card_ruleset.gd
- Create: src/core/cards/card_round_state.gd
- Create: data/cards/card_ruleset_01.tres
- Create: src/ui/cards/card_archive_screen.gd
- Create: src/ui/cards/card_archive_screen.tscn
- Modify: tests/unit/test_card_ruleset.gd
- Modify: tests/integration/test_card_archive_screen.gd

**Interfaces:**
- Consumes: CircleComposition, StoryProgress, and fixed CardRuleset values.
- Produces: CardRuleset.validate(), CardRoundState.resolve_round_end(action_id), and a card archive that states pending rules.

- [ ] **Step 1: Write failing fixed-rule and pending-duel tests.**

~~~gdscript
case.assert_equal([7, 7, 6], ruleset.round_mana_budget(), "Approved per-round mana budget is fixed")
case.assert_equal(20, ruleset.total_mana_budget(), "Approved total mana budget is fixed")
case.assert_equal(&"RULESET_PENDING", archive.request_start_duel().get("status", &""), "Archive cannot start a duel before detailed rules exist")
case.assert_equal(&"ROUND_END_RESOLVED", state.resolve_round_end(&"round-01").get("status", &""), "Unspent prepared cards resolve once")
case.assert_equal(&"ALREADY_RESOLVED", state.resolve_round_end(&"round-01").get("status", &""), "Round end cannot resolve twice")
~~~

- [ ] **Step 2: Run the full test command.**

Expected: FAIL because the card model and archive scene do not exist.

- [ ] **Step 3: Implement cards and archive.**

CardDefinition.type validates exactly one approved type. CardRuleset rejects any budget other than [7, 7, 6], total other than 20, or circle cap other than 3. CardArchiveScreen receives story_unlocked_cards and reports pending rules without offering an independent front-door duel mode.

- [ ] **Step 4: Run full tests and scene smoke, then commit.**

~~~powershell
git add src/core/cards data/cards src/ui/cards tests/unit/test_card_ruleset.gd tests/integration/test_card_archive_screen.gd
git commit -m "feat: add narrative card ruleset shell"
~~~

Expected: cards are visible only in a story context and the unavailable full duel gives its reason.

### Task 8: Remove star runtime and prove the new default route

**Files:**
- Delete: src/core/star/
- Delete: src/ui/star_circuit_harness.gd
- Delete: src/ui/star_circuit_harness.tscn
- Delete: src/ui/star_circuit_layout_model.gd
- Delete: src/ui/components/star_circuit_board.gd
- Delete: src/ui/components/star_circuit_board.tscn
- Delete: src/ui/components/five_point_star_composer.tscn
- Delete: star-only unit/integration suites and their test-runner entries
- Replace: old spell-workflow consumers that are only star consumers
- Modify: docs/ACTIVE_CONTEXT.md, docs/DESIGN_DOCUMENT_REGISTRY.json, docs/DOCUMENTATION_MAP.md, and the replacement spec status

**Interfaces:**
- Consumes: completed Tasks 2–7 and a save preflight result.
- Produces: zero runtime star consumers and a verified story-front-door main scene.

- [ ] **Step 1: Add and register a failing no-star runtime guard.**

~~~gdscript
func run(case) -> void:
    for path in ["res://src/core/star", "res://src/ui/star_circuit_harness.tscn", "res://src/ui/components/star_circuit_board.tscn"]:
        case.assert_false(FileAccess.file_exists(path), "Replacement runtime removes star-only path: %s" % path)
    var main_scene_path := str(ProjectSettings.get_setting("application/run/main_scene", ""))
    case.assert_true(main_scene_path.contains("story_front_door"), "Story front door is default main scene")
~~~

- [ ] **Step 2: Run the full test command.**

Expected: FAIL while old star runtime remains.

- [ ] **Step 3: Read persistent-save locations without modifying them. Then delete only confirmed star runtime files and replace registered runner references.**

If a real user-owned save exists, stop this removal task and report its format and migration risk before changing it. If none exists, review the exact results of:

~~~powershell
rg -l 'FIVE_POINT_STAR|star_circuit|main_glyph|auxiliary_glyphs' src tests project.godot
~~~

Delete only confirmed runtime consumers and star-only suites. Do not delete historical documentation.

- [ ] **Step 4: Run full tests, scene smoke, diff checks, and the scoped removal scan.**

~~~powershell
git diff --check
rg -n 'FIVE_POINT_STAR|star_circuit|main_glyph|auxiliary_glyphs' src tests project.godot
~~~

Expected: no runtime or registered-test consumer; historical docs retain only SUPERSEDED mentions.

- [ ] **Step 5: Attach only to the exact-worktree Godot editor and perform visual proof, then commit.**

Run hera status and require its project_path to equal this worktree. Run hera guidance ui, inspect the live UI tree, capture a runtime screenshot after front-door interaction, and inspect hera output --type error. Never attach to another worktree.

~~~powershell
git add -- src/core/circle src/core/events src/core/cards src/core/story src/ui/front_door src/ui/story src/ui/cards src/ui/components/event_clock_view.gd src/ui/components/event_clock_view.tscn data/events data/cards tests docs/ACTIVE_CONTEXT.md docs/DESIGN_DOCUMENT_REGISTRY.json docs/DOCUMENTATION_MAP.md docs/superpowers/specs/2026-08-31-circle-clock-card-core-replacement-design.md
git add -u -- src/core/star src/ui/star_circuit_harness.gd src/ui/star_circuit_harness.tscn src/ui/star_circuit_layout_model.gd src/ui/components/star_circuit_board.gd src/ui/components/star_circuit_board.tscn src/ui/components/five_point_star_composer.tscn
git commit -m "feat: replace star runtime with circle clock card core"
~~~

## Plan Self-Review

| Spec requirement | Implementing task |
|---|---|
| Remove star runtime without a runtime adapter | Tasks 2 and 8 |
| Role-free 1–3 layered circles | Task 2 |
| Goal/threat clocks with no wall-clock punishment | Tasks 3 and 5 |
| Story-led front door rather than activity hub | Task 4 |
| Narrative-gated four-type card shell | Task 7 |
| Image candidates separate from functional UI | Task 6 |
| Exactly-once event and round-end behavior | Tasks 3, 5, and 7 |
| Removal, automated checks, editor proof, evidence boundary | Task 8 |

Every approved requirement has an assigned task. The only deferred behavior is the card-rule detail explicitly marked RULESET_PENDING in the approved spec.

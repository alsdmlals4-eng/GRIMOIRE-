# Event Playable Loop Implementation Plan

> For agentic workers: use superpowers:executing-plans inline; the user explicitly delegates routine decisions and requests continuous implementation without repeated approval.

**Goal:** Make the specified lesson, greenhouse and festival events executable through the common spells, with exact preview, consequences, recovery and a playable Godot entry.

**Architecture:** Preserve the shared spell transaction. A session reducer owns event goals, paid manual actions and time consequences; immutable event definitions initialize independent state. A dedicated scene consumes the reducer, not duplicated UI rules. Keep the historical main intact until integration is verified.

**Tech Stack:** Godot 4.7.1, GDScript, existing AtomicResultLedger and shared_spell, local headless runners and Hera editor.

**Spec:** ../specs/2026-09-10-shared-spell-rules-design.md sections 11,13; ../specs/2026-09-11-human-blueprint.md.

## Global constraints

- Latest user authorizes research, implementation and improvement loops without routine approval. No destructive cleanup, protected-main bypass, unrelated PR absorption or art final-approval inference.
- Event choices use learned glyphs, not random duel hands. Explicit confirm; cancelled/invalid/read-only actions cost nothing.
- Outcomes ONGOING/SOLVED/ASSISTED/STOPPED; simultaneous objective and consequence preserve both.
- Existing Base pin9.4.3 remains. Latest Base two-review policy differs from project five-review binding: project-specific binding retained, not silently migrated.
- Current branch e1b1bf17; main d384c454; Base remote d830c0f6. Re-read before delivery.

## Alternatives and research

1. ADOPT an event reducer over current shared spells: one effect implementation, testable actions and previews.
2. REJECT separate duplicated spell logic per event: faster initial scene code, inconsistent effect/cost/replay later.
3. REJECT a general event graph/editor now: no demonstrated consumer beyond three specified events.

2026-09-12 primary sources: [Into the Breach](https://www.subsetgames.com/itb.html) public attack telegraphing ADAPT to explicit preview; [Weather Factory retrospective](https://weatherfactory.biz/cultist-simulator-the-retrospective/) incremental playable builds and early onboarding ADAPT; [Blades clocks](https://bladesinthedark.com/progress-clocks) obstacle-based clocks ADAPT, their numerical rules not imported. This is published developer-practice research, not private code access or proof of our fun/balance.

## Task 1: Event reducer and definitions

Files: create src/core/shared_spell/event_session.gd, event_definitions.gd, tests/run_event_session_tests.gd.
Interfaces: `start(event_id, attempt_id)->Dictionary`, `act(state, command)->Dictionary`, `preview(state,command)->Dictionary`; commands carry id, expected_revision, kind, optional glyphs/target_id/destination_id. Result has status/state/receipt or rejection reason. Event state nests spell_state; outer receipts own whole actions, inner spell receipts only spell effects.

- [x] Write and run failing tests for source-preserving greenhouse close→transport SOLVED/hazard0/mana4; collect-before-close reappears/hazard1; ward creation+next action, third leaks; zero-mana manual close+two cleanup actions; help/stop; lesson focus→cool; festival warm+place+lock; replay/invalid immutability and preview parity.
- [x] Implement definitions with explicit IDs/properties and pure reducers. Core time rule: `if leak_open and expiry <= actions_before: cloud.empty=false; hazard += 1`. Solve only after time consequences; then hazard cap and assistance.
- [x] Run new runner then run_event_cast_tests.gd and run_shared_spell_tests.gd. Test literals derive from section13, not production helpers.
- [x] Record discrepancies and correction in existing spec and Active Context; commit only owned files.

## Task 2: Playable scene and recovery

Files: create src/ui/event_session/event_session_screen.gd/.tscn and tests/run_event_screen_tests.gd; extend tests for serialization as needed.
Interfaces: scene owns current session, selection, preview and explicit confirm. `preview` simulates `act` on an independent copy; cancel only clears selection. Button input and drag-drop must produce the same selected glyphs, never auto-cast. Start lesson→greenhouse→festival through result continuation, not mode-selection home.

- [x] Test scene selection creates a quote without changing state; confirm adopts one result; completion exposes continuation; help/stop never trap player.
- [x] Implement readable functional controls with text separate from art; approved/new-art assets are not assumed production-ready. UI is labeled an implementation preview, not final art.
- [x] Save only new schema to a project-local ignored runtime path; no legacy slot overwrite. Reload must validate before adopting and reject corrupted data without destroying current state.
- [x] Open the exact GRIMOIRE Godot editor, run the new scene, click representative path and inspect errors/screenshot. Existing main, unrelated editor instances and user files preserved.
- [ ] Run all affected tests; update implementation/runtimes separately. Fetch/pull current branch, selective commit/push, exact remote readback. No whole-game/CI/main/Human PASS without evidence.

## Remaining scope after this plan

New duel rules, full story/save rewards, final approved-art integration, mobile/Human/accessibility/performance and main integration remain required project work, not hidden by this event slice. Continue safe units under the user's authorization; never mark the entire game complete based on these tests.

## Execution receipt — 2026-09-12

- RED→GREEN: missing session/save/scene runners first failed; Godot Engine name collision corrected; actual-change/expiry preview, malformed save consequences and long-receipt footer regressions reproduced then corrected.
- Final related Godot runners: shared252 + cast70 + session60 + save12 + screen21 = 415 assertions, zero failures. Python diagnostic4 tests pass. Local operating-contract validator CURRENT, pin9.4.3.
- Runtime: exact GRIMOIRE editor21468, final game50976, lesson→greenhouse→festival solved with actual controls. Native mouse drag confirmed separately; save/change/load restored state. Final diagnostics zero errors/warnings. Screenshots under ignored artifacts/local-validation; old failed-layout captures are historical observations, not delivery pictures.
- Five review iterations retained under project contract: baseline scope/definitions/transaction review; reducer tests and time/goal boundary review; persistence and UI consumer review; live input/layout/recovery review; independent findings correction and final affected-suite/readback review. Each covered scope, current owners, consumer, failure/rollback, asset/cost boundary and evidence ceiling. This is bounded implementation review, not five independent player tests or a full-game audit.
- Independent read-only reviewer identified omitted target/expiry display and insufficient consequences element validation; both were regression-tested and corrected, then readback reviewed. Reviewer did not execute tests or certify runtime.
- Learning retained here: use one reducer for preview and commit; persist the complete event receipt, not just spell effects; test worst-case result length; tool input recording does not prove native drag. Base promotion deferred until reusable cross-project evidence. No paid tools, new asset approval, old-main replacement or deletion.
- Delivery remains branch-scoped. No main merge, CI, mobile, human, accessibility, performance or export PASS is inferred.

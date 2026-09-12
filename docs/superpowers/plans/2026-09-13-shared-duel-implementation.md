# Shared Duel Implementation Plan

> For agentic workers: execute inline with test-driven-development; user approved this plan's direction on 2026-09-13. Preserve unrelated work.

**Goal:** A complete practice duel using shared spell meanings, followed by result review.
**Architecture:** Keep FIRST_DUEL_1 saves and consumers unchanged. First add a pure shared-spell exchange resolver; then integrate a versioned match transaction and persistence; finally a designed card screen. UI never calculates damage independently.
**Tech Stack:** Godot4.7.1/GDScript, current project validator, existing test_case runners.
**Spec:** ../specs/2026-09-10-shared-spell-rules-design.md sections12,15–17.

## Constraints and research

Current branch ab4f9f4b; main d384c454; Base d830c0f6, pinned9.4.3 validator CURRENT. No main push, old-save overwrite, unrelated PR absorption, final art approval inference or automatic deletion. User requires a written plan before changes. Sample balance is not final balance.

[Into the Breach official](https://www.subsetgames.com/itb.html), rechecked2026-09-13: ADAPT announced attacks to immutable exchange input; REJECT copying its grid/combat values. ADOPT shared composition IDs; REJECT replacing legacy EFFECTS in place because existing match/save consumers assume old values. Shared action meanings stay stable; context-specific effects are explicit.

## Difference map

| Owner | Existing | New requirement |
|---|---|---|
| duel_rules.gd | WIND attack1/guard2; GATHER attack2 | WIND flow2; GATHER focus for next direct attack |
| duel_exchange.gd | generic reduction/reflection | heat/flow/fixed_pulse, conditional defense, bounded flow redirection |
| duel_match.gd | FIRST_DUEL_1, no duration | versioned focus/suppression, tidy action, exact snapshot replay |
| screen | no shared duel consumer | hand selection/overlap/preview/explicit cast, result continuation |

## Task1 — Pure exchange

Create `src/core/shared_spell/duel_spell_exchange.gd` and `tests/run_duel_spell_exchange_tests.gd`.
Interface `resolve(state:Dictionary,glyphs:Array,opponent:Dictionary)->Dictionary`: state owns player_barrier/opponent_barrier (1..16), focus/suppression (0..1); opponent has attack>=0, guard>=0, nature heat/flow/fixed_pulse, guard_kind none/flow/fixed. Result OK/state/receipt or REJECTED/reason; never mutates arguments. No cards consumed here; match consumer owns consumption and replay.

- [ ] Write failing test: `resolve({player_barrier:16,opponent_barrier:16,focus:0,suppression:0},["WARD","WIND"],{attack:4,guard:0,nature:"flow",guard_kind:"none"})` yields barriers15/13.
- [ ] Test all10 spells with independent literal outcomes; focus survives generation, expires after next exchange, only direct attack consumes; suppression applies once to flow shield; heat-only defense and flow-only redirect reject mismatches; restore before damage; simultaneous draw; malformed input rejected unchanged.
- [x] Implement pure resolver using spell_semantics.compose; no new generic engine or old-rule replacement.
- [x] Run new runner and existing shared/event runners; record exact evidence and gaps.

Task1 receipt2026-09-13: missing-service RED, new77 assertions GREEN, existing415 GREEN. Recast suppression initially removed6; independent cap3 regression failed, then corrected. Test cases exercise all10 effects, pair order, immutability, focus/expiry/refresh, shield nature, repair cap, counter shield, simultaneous draw and malformed ranges. Own bounded reviews covered (1) current scope/legacy preservation, (2) public preview research/shared meaning, (3) arithmetic and duration, (4) reapplication counterexample, (5) actual consumer/evidence boundary. These are not independent human reviews. No runtime/main/CI/fun claim. Task2/3 remain open, not complete from Task1 evidence.

## Task2 — Versioned match and save (dependent follow-up)

### Execution contract2026-09-13

Create `src/core/shared_spell/duel_session.gd`, test `tests/run_duel_session_tests.gd`. APIs create(seed:int,tutorial:bool=true), apply(state,command), preview(state,command), restore(snapshot). Commands id/revision/kind/ids; kinds CAST/TIDY/WAIT/STOP. Physical IDs0..7 map pairs to EMBER/WIND/WARD/GATHER. Draw from back; tidy draws replacement before inserting returned card at index0. Tutorial hand0/2/4/6. Fixed candidate opponent cycle follows spec12, not balance lock.

Snapshots keep seed/tutorial, commands, full piles, RNG state, focus/suppression and receipts. Restore deterministically replays the command log under this rules/engine version and compares the whole snapshot; no cross-engine migration claim. This trades load/validation cost for strict first-slice consistency; long-match performance remains a measured follow-up, not a hidden turn limit. No live user save overwrite. Binary roundtrip test uses ignored project-local file and bytes_to_var (no objects). File crash-recovery/user-facing save integration remains separate from snapshot validation.

- [x] RED: missing service; tutorial four kinds, invalid/replay/conflict/stale commands, immutable preview, legal cast consumption, tidy replacement and cost, stop/terminal, saved focus next effect.
- [x] GREEN: implement session. WAIT/TIDY are match-owned nonspell actions: announced damage, no defense, expire durations. No artificial glyph or extra public pass_turn API was needed. Reuse RNG shuffle pattern, not old spell values or old replay bug (same ID different payload must reject).
- [x] Test seeded replay across casts, tidy and reshuffle; corrupt piles/focus rejection, binary roundtrip, repeat until terminal. Run all affected suites. Receipt/schema validation uses full deterministic readback; exhaustive hostile-file fuzzing remains outside this test set.

Task2 implementation receipt: `tests/run_duel_session_tests.gd`459 assertions/0 failures. Missing module RED preceded code (test type-inference parse issue corrected before observing intended RED). Actual ignored snapshot.bin file roundtrip; 12 seeded wait/tidy paths and20 seeded greedy legal-cast paths, card conservation/replay after actions, at least one WIN reached. Test policy uses current full-state quote, not hidden future draws; not a player, optimal solver or balance evidence. Snapshot serializer is not a user-facing crash-safe save service. No screen/native input/mobile verification in Task2.

Official RNG source rechecked: https://docs.godotengine.org/en/4.7/tutorials/math/random_number_generation.html . ADOPT dedicated RNG seed/state; REJECT assuming cross-engine replay compatibility. Five bounded review passes covered authority/legacy ownership, command/cost boundary, pile/recycle ordering, restore corruption/replay, consumer/evidence ceiling. Shared learning retained locally: normalize request identity before replay and validate full deterministic state, with long-log performance explicitly unresolved.

Before code, expand this task against current duel_match.gd full consumer/restore validation and spec15 tidy rules. Deliverable: new schema with physical card IDs, deterministic shuffle, legal hand/discard/draw conservation, atomic request/revision/receipt handling, valid snapshot roundtrip. Mandatory tests: duplicate/stale command costs0; illegal card rejected; cancel read-only; tidy consumes the exchange; focus/suppression stored identically; win/loss/draw/stop block further casts. Do not call Task1 a playable match.

## Task3 — Screen/asset and practice loop (dependent follow-up)

Before UI implementation, prepare wireframe and approved-asset consumer inventory. Hand and opponent preview remain visually separate; no baked labels. Needed states: idle/selected/combination/invalid/cast/result. Reuse approved portraits/background only after alpha/space/provenance checks; new images remain candidates until approval. Actual Godot checks must include native overlap, cancel, explicit cast, completion and save/resume; mobile/Human separately. Keep old main until integration evidence.

## Delivery boundary

Task1 automated evidence is not Task2/3, runtime, fun, mobile or release evidence. Update Active Context and spec as each real deliverable is verified. Fetch/pull/push only current branch and preserve user fixture/import files.

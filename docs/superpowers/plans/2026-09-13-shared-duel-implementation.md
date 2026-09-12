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

### Planned input layout before implementation

1280x720 landscape: top status (my barrier / exchange / foe barrier); upper-middle announced foe attack and shield; middle selected spell and exact predicted outcome; lower hand of four physical cards; bottom persistent cast/cancel/tidy/wait/stop/save/load controls. Selection and drop never cast. Result state disables actions and exposes explicit retry. This is a functional practice entry, not main/story replacement.

Assets: approved background `output/imagegen/card-duel/duel-background-candidate-01.png`, SHA2568445F4409DA8CB388F1157D9CF1CE41C1222746F3818D48FF71325EC1F4F6F36, consumed without duplication by Background TextureRect. Character owner still records alpha/framing pending: do not insert opaque reference portraits. Card illustration family not approved/runtime-ready: functional text cards explicitly labeled, no invented vector illustration; final art remains separate.

Create `src/ui/shared_duel/shared_duel_screen.gd/.tscn`, `src/core/shared_spell/duel_save.gd`, `tests/run_duel_screen_tests.gd`. Save reuses existing two-slot file envelope in a dedicated duel folder via payload-validator specialization; old event folders never shared. Save packet contains snapshot plus latest receipt sourced from that snapshot. Development storage only; export user path integration later.

- [ ] RED missing screen/store; selection/cancel no revision change; pair quote; explicit confirm once; tidy requires one; stop disables cast; save/change/load equality; corrupt newest fallback; footer720.
- [ ] Implement screen as pure session consumer with physical-card drop IDs and user-readable rejection reasons; no duplicated combat arithmetic.
- [ ] Run exact GRIMOIRE editor, inspect image and representative controls; diagnostics and relevant regression suites. Report native drag separately from programmatic drop.

Task3 partial delivery: functional screen and dedicated two-slot save consumer implemented, new12 assertions and full affected963 assertions pass. Screen-missing RED observed before implementation. Actual editor11900/runtime16444: click selection/cast, save/change/load, loss/retry; native mouse drag selects GATHER+EMBER without auto-cast. Readability improved after screenshot review. Approved background hash confirmed and owner updated; card art/portrait/motion still pending. Godot Control drag/drop and TextureRect KEEP_ASPECT_COVERED official documentation rechecked. ADOPT native drag callbacks, ADAPT existing semantic selection to physical IDs, REJECT baked text or new art approval inference. No default-main replacement.

Remaining gates intentionally open: final card/portrait states, detailed post-cast review/story handoff, actual-screen WIN path, mobile/Human/performance/export save path. Functional screen is not final visual approval. Five bounded passes: owner/asset inspection, input contract, save payload isolation, runtime readability correction, native input/final regression. Not five independent player reviews. Computer Use initially captured occluding surface; activated exact returned game window and re-observed before input, never used occluded coordinates.

Before UI implementation, prepare wireframe and approved-asset consumer inventory. Hand and opponent preview remain visually separate; no baked labels. Needed states: idle/selected/combination/invalid/cast/result. Reuse approved portraits/background only after alpha/space/provenance checks; new images remain candidates until approval. Actual Godot checks must include native overlap, cancel, explicit cast, completion and save/resume; mobile/Human separately. Keep old main until integration evidence.

## Delivery boundary

## Task5 — Persistent last-exchange review

Delivered: screen23/session459/exchange77 assertions0 failures; observed missing review RED1. Live editor11900 selection/cast and save/wait/load restore verified, final runtime15960 diagnostics0/0; screenshot duel-review-20260913.png. Scroll120 keeps footer720 including long warning test. Official ITB direct read timed out; official search excerpt subsequently confirmed announced attacks. No art promotion, save schema, rule or main change. Native drag/mobile/Human not rerun. Receipt presentation is implemented/runtime-observed, not full story completion.

User authorizes continuous bounded implementation without routine approval. Existing receipt already owns damage/block/redirect/repair values but screen hides them after cast. Add a separate fixed-height scrollable last-exchange Label in shared_duel_screen.gd; derive text from last command and its stored receipt, not new arithmetic or new save fields. Preserve preview, legacy main, art candidate status and dirty user files.

- [ ] Extend run_duel_screen_tests.gd: real redirect cast must show returned3/received1; save/wait/load restores review; STOP cannot show old damage; retry clears review; footer remains720. Missing review is expected RED.
- [ ] Implement receipt rendering using session.commands.back().id and session.receipts[id]. CAST shows actual raw incoming damage, opponent damage, blocked/redirected/restored, opponent shield absorption, focus used and warnings. Explicitly label raw damage as before barrier floor so overkill is not called actual barrier reduction. WAIT/TIDY describe no spell and incoming damage; STOP no damage. No future action/outcome claims.
- [ ] Run screen/session/exchange regression and actual editor controls, diagnostics and screenshot. Scroll fixed120px rather than expand layout. Check no session mutation by read, stale review after load/retry, pending preview separation, terminal controls and screen fit.

Research continuation: Into the Breach's previously documented announced-threat approach motivates keeping intent and outcome separately readable; fresh official-page request timed out, do not claim new source readback. This is an ADAPT presentation decision, not imported gameplay or new balance evidence. Reusable local lesson: display authoritative receipts, never recompute combat in UI. Five review passes cover owner/schema, receipt branches, save/retry lifecycle, layout/input and final regression; not five independent human reviews.

## Task4 — Spell-card meaning and illustration candidate (2026-09-13)

### Current override — magical writing, not effect illustration

Latest revision: user rejected the specimen as insufficiently magical/mysterious and requested magic/rune references. Make a sibling candidate, not a polish-only glow change. Research: British Museum seax H_1857-0623-1 (historical runic inscription) and British Library Harley MS2267 (ritual manuscript signs/diagrams). ADAPT angular stems, deliberate branching and small terminal marks into an original fictional letter family; REJECT treating all historical runes as spells, copied inscriptions, large enclosing spell circles and ornamental noise. Use primary structural strokes plus a few meaningful-looking secondary marks; preserve letter-combination premise, four semantic IDs and separate functional text. Candidate01 is USER_REVISION_REQUESTED; retain without runtime application or deletion. Inspect candidate02 for distinct silhouettes and small-stroke readability limits before review.

User explicitly corrected the visual premise and approved proceeding: cards carry magical written characters; combining characters makes a spell. Earlier EMBER bowl/flame picture is NOT the card face direction. Preserve that unselected file without runtime promotion or deletion. No drawing-input mechanic or new order-sensitive recipe introduced.

Before generation: create one coherent four-character writing specimen (EMBER/WIND/WARD/GATHER in reading order), shared broad-nib ink, sparse strokes, comparable visual weight, distinct silhouette without color reliance. This is a review sheet, NOT a runtime-ready atlas. Character marks are art; localized names/cost/rules remain engine text. Use navy/ivory academy language, not existing franchises' runes, pictorial flame/shield icons, star circuits or pseudo-text wallpaper.

Research ADOPT: compositional meaning and recognisable building blocks from developer interview https://www.gamedeveloper.com/business/road-to-the-igf-inkle-s-i-heaven-s-vault-i- . ADAPT to known spell meanings, not translation uncertainty. REJECT copied letterforms, hidden recipe/order changes, forced handwriting. Feasibility: existing GLYPHS/RECIPES and physical Card IDs remain owners; eventual TextureRect glyph art plus independent labels, pair preview displays original two shapes without obscuring them. Validate individual glyph alpha/crop, small-size distinction and native input after final approval; this specimen alone proves none of those.

Sequence: generate specimen → inspect shapes/meaning mapping → user art review → individual transparent glyph exports and separate card UI → unchanged compose/cancel/cast tests and runtime preview. Combination baseline follows existing order-normalized semantics; decorative joining must not imply order-specific power.

User clarified improvement loops include comparable-game research, design linkage and implementation, not only bug fixes. Start with a representative EMBER illustration candidate; prepare meanings for all four existing glyphs. No new glyph alphabet or gameplay values introduced. Current consumers are shared_duel_screen Card and event_session_screen selection; candidate art is NOT automatically wired before final art approval.

Research: https://shadowverse.com/gameguide/ distinguishes one-shot spell effects; https://www.playgwent.com/en/join emphasizes illustrated cards; https://www.playgwent.com/en/faq describes learning combinations. ADOPT spell readability, ADAPT strong narrative illustration to shared actions across school incidents and duels, REJECT importing factions/units/round economy or making illustrations imply new rules.

Plan: (1) inspect approved anime anchor and semantic consumer; (2) generate one portrait EMBER art candidate using image model, no baked letters/numbers/frame; (3) retain exact prompt/provenance and explain all four glyph meanings; (4) after selected direction, produce remaining family and separate UI frame/text states; (5) connect approved assets, test overlap/cancel/cast and story context. No default-main or balance changes during candidate preparation.

Meaning brief: EMBER = small localized heat, not explosion; WIND = move light objects/flow, not teleport; WARD = interrupt passage across a boundary, not universal invulnerability; GATHER = gather nearby scattered material into a receiver, not create material. Canonical action IDs remain owned by spell_semantics.gd. Illustrated props are visual examples, not new inventory items or guaranteed legal targets.

Task1 automated evidence is not Task2/3, runtime, fun, mobile or release evidence. Update Active Context and spec as each real deliverable is verified. Fetch/pull/push only current branch and preserve user fixture/import files.

# Story Arc First-Session Adversarial Review — 2026-09-01

```yaml
review_id: GR-STORY-ARC-IMPL-ADVERSARIAL-20260901-01
feature_id: GR-STORY-ARC-BLUEPRINT-01
decision_id: GM-CIRCLE-CLOCK-CARD-CORE-01
review_scope: first-session story implementation and approved duel environment binding
required_full_scope_loops: 5
completed_full_scope_loops: 5
human_device_release_evidence: NOT_RUN
```

## Loop 1 — Story-gate bypass attack

| Attack | Evidence checked | Result |
| --- | --- | --- |
| Front door regresses into a lesson/practicum/duel/festival picker | `StoryProgress.available_front_door_actions()`, `StoryFrontDoor` integration test | PASS — only new/resume/archive/settings/quit remain |
| Admission skips first class | `advance_from_admission()` and `FirstClassRoot` integration test | PASS — admission only produces `FIRST_CLASS_ROUTE` |
| First class skips direct glyph writing, candidate selection, and explicit acceptance | `CircleGlyphWritingPanel`, `FirstClassRoot` integration test, 1280×720 runtime capture | PASS — continuation is disabled and its method rejects until a lesson glyph emits `glyph_accepted` |
| First practicum or duel can be reached from an earlier beat | `tests/unit/test_story_progress.gd` and handoff tests | PASS — every transition has an exact prerequisite beat |

## Loop 2 — Explicit-action and Clock abuse attack

| Attack | Evidence checked | Result |
| --- | --- | --- |
| Preview resolves a Clock before explicit cast | `test_story_event_root.gd`, `test_duel_practicum_root.gd` | PASS — preview leaves both clocks at 0 |
| Cast repeats and advances a Clock twice | existing practicum repeat-commit assertions | PASS — second cast returns `ALREADY_RESOLVED` without movement |
| Duel can bypass target or use raw glyph IDs as Clock methods | duel integration test and inherited StoryEventRoot resolver path | PASS — target is required and Circle semantic tags feed the resolver |

## Loop 3 — Card-system scope creep attack

| Attack | Evidence checked | Result |
| --- | --- | --- |
| Story duel becomes a card minigame route | `test_duel_practicum_root.gd` checks no `request_start_duel()` | PASS — supervised story practice is a separate Circle/Clock scene |
| Existing card shell obtains turn/mana/score/victory rules | `test_card_ruleset.gd`, `test_card_archive_screen.gd`, `rg` readback | PASS — `RULESET_PENDING` remains; `20 / 7,7,6` stays illustrative only |

## Loop 4 — Asset and layer-boundary attack

| Attack | Evidence checked | Result |
| --- | --- | --- |
| Candidate bytes change on promotion | SHA-256 readback and manifest contract test | PASS — canonical PNG equals `3D16DBCC5015550914CD420498DE3C2DCD85783E6EE8D819E04D6D5A2E1B4EFF` |
| Background captures clicks or leaves black frame | `DuelPracticumRoot` test checks `MOUSE_FILTER_IGNORE` and aspect-covered stretch; 1280×720 screenshot | PASS |
| Rejected candidate 01 sneaks into runtime | asset manifest and scene path readback | PASS — candidate 01 remains provenance-only and unbound |
| Functional gameplay text becomes baked into the environment | candidate constraints, live node tree, screenshot | PASS — targets, clocks, labels, and buttons are Controls |

## Loop 5 — Runtime presentation and hygiene attack

| Attack | Evidence checked | Result |
| --- | --- | --- |
| Direct glyph panel says greenhouse seedlings in the duel | 1280×720 runtime screenshot and duel test | CORRECTED — shared panel receives a duel-specific practice-ward hint |
| Class/festival frames look like empty ornamental windows or hide the class continuation below the viewport | runtime screenshots at 1280×720 | CORRECTED — panel hierarchy and dimensions tightened; the direct-glyph gate and continuation now render together within the lesson panel |
| Runtime error/warning is hidden by headless test success | Hera exact-editor diagnostics after final captures | PASS — 0 errors, 0 warnings |
| Temporary screenshots/import sidecars consume project space | `artifacts/runtime/.gdignore` and exact stale-file cleanup | PASS — only four final evidence captures remain; they are not Godot runtime assets |

## Consolidated evidence

| Check | Result |
| --- | --- |
| `git diff --check` | PASS — no whitespace error reported |
| Godot headless test runner | PASS — 34 suites, 1,450 assertions, 0 failures |
| Story-arc Python contract | PASS — 4 tests, 0 failures |
| JSON parse: manifest / visual coverage / registry | PASS |
| Hera runtime capture and diagnostics | PASS at 1280×720; exact editor diagnostics clean |

## Residual risks deliberately not closed

- The story route has not received a human/player session walkthrough or target-device observation.
- 1920×1080 crop/readability remains unobserved; the tested Godot viewport is 1280×720.
- Festival-specific visual art is not locked; the festival intentionally reuses the existing canonical academy environment.
- Card detailed rules remain awaiting user authority.
- Release rights/similarity review remains conditional for the generated duel environment.

## Direct glyph input repair addendum — 2026-09-01

```yaml
scope: glyph_capture__touch_coordinate_space__recognition_handoff__live_reference_guide
required_full_scope_loops: 5
completed_full_scope_loops: 5
external_research: ADAPT_OFFICIAL_GODOT_INPUT_COORDINATE_AND_EMULATION_GUIDANCE
human_touch_validation: NOT_RUN
```

| Loop | Full-scope attack | Finding | Disposition / evidence |
| --- | --- | --- | --- |
| 1 | A visible writing canvas may record no usable mouse stroke | The old `1.0` de-duplication threshold was evaluated after normalisation, so normal movement was discarded | `MUST_FIX`: a `0.002` normalised threshold plus canvas regression verifies a stored multi-point mouse stroke |
| 2 | Touch drawing may use a different coordinate system than mouse drawing | Screen touch positions are viewport-relative rather than Control-local | `MUST_FIX`: canvas-transform conversion and a nonzero-origin viewport-touch regression preserve `0.20, 0.80 → 0.80, 0.80` local coordinates |
| 3 | One physical touch may produce a second emulated mouse stroke | Default emulation can send paired input routes to a custom canvas | `MUST_FIX`: canvas owns one physical pointer source and ignores `DEVICE_ID_EMULATION`; regression injects conflicting emulated mouse coordinates |
| 4 | Captured strokes can look correct yet fail recognition at the type boundary | `$N` accepts `PackedVector2Array`; old canvas snapshots returned generic arrays | `MUST_FIX`: submitted runtime strokes are packed and the exact editor path reaches `열 후보` from the visible guide |
| 5 | A guide can become a decorative image that drifts from permitted/recognised glyphs | A static raster would not reflect the event's actual allowed vocabulary or canonical recognition template | `MUST_FIX`: live guide is rendered from the first canonical template for the selected allowed glyph; no new raster asset, baked gameplay text, auto-selection, threshold relaxation, target, or cast was introduced |

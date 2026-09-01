# Story Arc First-Session Runtime Receipt — 2026-09-01

## Scope and evidence ceiling

```yaml
feature_id: GR-STORY-ARC-BLUEPRINT-01
decision_id: GM-CIRCLE-CLOCK-CARD-CORE-01
implementation_state: IMPLEMENTED__MACHINE_VERIFIED__EDITOR_RUNTIME_OBSERVED
human_validation: NOT_RUN
player_ux_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_device_validation: NOT_RUN
export_validation: NOT_RUN
release_validation: NOT_RUN
card_detail_rules: RULESET_PENDING
adversarial_review: docs/validation/STORY_ARC_FIRST_SESSION_ADVERSARIAL_REVIEW_2026-09-01.md
```

This receipt records exact-worktree automated and editor-runtime observations only. It is not a human/player, device, performance, accessibility, export, release, or card-rules acceptance.

## Implemented authored route

```text
StoryFrontDoor
→ AdmissionPrologue
→ FirstClassRoot
→ StoryEventRoot (Frostbloom first practicum)
→ DuelPracticumRoot (supervised student practice, not a card duel)
→ FestivalCanopyRoot
```

- `StoryProgress` permits each transition only from its preceding beat.
- The first practicum and supervised duel each use direct glyph input → Circle Preview → live target → explicit cast → `EventClock` result.
- The first practicum must resolve before the duel handoff; the duel must resolve before the festival handoff.
- The front door remains `NEW_RECORD / RESUME_RECORD / ARCHIVE / SETTINGS / QUIT`; it does not expose class, practicum, duel, or festival as a free activity picker.
- Card archive stays read-only. No mana, turn, score, victory, or independent card-duel route was added.

## Duel environment promotion

```yaml
asset_id: GR-CAND-STORY-ARC-DUEL-ENV-02
user_final_lock: USER_APPROVED_CURRENT_THREAD_2026-09-01
canonical_path: assets/art/backgrounds/academy/bg_duel_practice_cloister.png
sha256: 3D16DBCC5015550914CD420498DE3C2DCD85783E6EE8D819E04D6D5A2E1B4EFF
promotion: MOVED_WITHOUT_BYTE_CHANGE_FROM_APPROVED_CANDIDATE_PATH
consumer: res://src/ui/story/duel_practicum_root.tscn::DuelPracticumRoot/EnvironmentBackground
runtime_binding: TextureRect + MOUSE_FILTER_IGNORE + STRETCH_KEEP_ASPECT_COVERED
release_rights_state: CONDITIONAL__RELEASE_SIMILARITY_AND_RIGHTS_REVIEW_REQUIRED
```

Candidate 01 remains `REJECTED_CANDIDATE__RETAINED_FOR_PROVENANCE`; it was not imported or bound.

## Automated evidence

| Check | Result | Evidence |
| --- | --- | --- |
| Godot headless suite | PASS | 34 suites, 1,450 assertions, 0 failures |
| Story-arc blueprint contract | PASS | 4 Python checks, 0 failures |
| Exact editor diagnostics after final runtime capture | PASS | 0 errors, 0 warnings |
| Candidate byte identity | PASS | Canonical PNG SHA-256 equals manifest SHA-256 |

## Editor runtime observations

Godot 4.7.1 exact worktree editor PID 16236 ran the following 1280×720 scene observations. Each scene had a nonblank capture, complete required node tree, and clean editor diagnostics at capture time.

| Scene | Observed live nodes / state | Capture |
| --- | --- | --- |
| `FirstClassRoot` | environment layer, direct glyph input/recognition/acceptance, locked continuation button; later guide/input repair includes on-canvas `HEAT` guide and accepted-glyph feedback | `artifacts/runtime/2026-09-01-first-class-glyph-gate-1280x720.png`; `artifacts/runtime/2026-09-01-first-class-glyph-input-runtime-1280x720.png` |
| `DuelPracticumRoot` | canonical environment, direct glyph panel, Preview/target/cast controls, two 4-segment live clocks | `artifacts/runtime/2026-09-01-duel-practicum-1280x720-v2.png` |
| `FestivalCanopyRoot` | reusable canonical academy environment, closing copy, one first-session confirmation button | `artifacts/runtime/2026-09-01-festival-canopy-1280x720-v3.png` |

The capture folder uses `.gdignore`, so these evidence images are not imported as game assets.

## Direct glyph input repair — 2026-09-01

```yaml
scope: DIRECT_GLYPH_WRITING_CAPTURE__REFERENCE_GUIDE__RECOGNITION_HANDOFF
implementation_state: IMPLEMENTED__MACHINE_VERIFIED__EDITOR_RUNTIME_OBSERVED
human_touch_validation: NOT_RUN
device_validation: NOT_RUN
new_raster_asset: NONE
runtime_capture: artifacts/runtime/2026-09-01-first-class-glyph-input-runtime-1280x720.png
```

### Observed causes and applied correction

| Observed state | Applied correction | Request reason | Expected effect |
| --- | --- | --- | --- |
| The canvas normalised points before comparing them against a `1.0` point-distance threshold | Replaced the threshold with `0.002` in normalised space | On a visible canvas every two normalised points are less than `1.0` apart, so mouse and touch movement could leave no valid multi-point stroke | Direct mouse/touch motion retains a recognisable stroke without lowering recognition confidence |
| `InputEventScreenTouch` and drag positions are viewport coordinates, while the canvas stores local coordinates | Converts touch points through the canvas transform before normalisation; keeps a single active mouse or touch owner and ignores emulated duplicate events | A landscape touch position was being measured against the local canvas dimensions and could clamp into the wrong shape; one physical touch could also be mirrored as mouse input | Mouse and physical touch feed equivalent local stroke data, with no duplicate emulation stroke |
| Runtime canvas snapshots used generic arrays but `$N` recognition accepts `PackedVector2Array` strokes | Converts every submitted/snapshotted runtime stroke to `PackedVector2Array` | The player could visibly draw a valid shape but the actual recognizer rejected its runtime payload as invalid | The on-screen stroke reaches the same recognition contract used by fixture tests |
| The player had no visible reference for the event's currently permitted glyphs | Displays the selected canonical template as a faint live guide and reuses the existing option row as `도안: <글자>` selection before recognition | The player must be able to view a glyph design and draw it during spell use | A guide is always visible for the current allowed glyph; guide selection remains distinct from later recognition-candidate selection |

The guide is a functional live `Control` rendering of the canonical glyph-template strokes, not a new raster or baked-text art asset. It changes with the event's allowed glyph IDs and therefore cannot drift from the recognition source. Background art remains an environment layer; labels, guide choice, candidate choice, and feedback remain live UI.

### Fresh external check and evidence

- Godot documents `InputEventMouse.position` as Control-local in `_gui_input`, while `InputEventScreenTouch.position` is in viewport coordinates. The implementation adapts the latter through the canvas transform instead of changing the recognizer threshold. Sources checked 2026-09-01: https://docs.godotengine.org/en/4.7/tutorials/inputs/mouse_and_input_coordinates.html and https://docs.godotengine.org/en/4.7/classes/class_inputeventscreentouch.html
- Godot's default touch-to-mouse emulation can be useful for standard controls. The canvas therefore filters only emulated duplicate events instead of globally disabling the setting and risking ordinary button touch behaviour. Source checked 2026-09-01: https://docs.godotengine.org/en/4.7/classes/class_projectsettings.html
- Headless regression: 34 suites, 1,450 assertions, 0 failures. New coverage verifies normalised mouse retention, viewport-touch conversion, emulated mouse de-duplication, submitted `PackedVector2Array` data, empty-canvas recovery feedback, an initial visible `HEAT` guide, and a pressed `도안: 보호` selector that switches the guide to the canonical `PROTECT` template.
- Exact-worktree Godot 4.7.1 editor observation: a synthetic mouse path matching the visible `HEAT` guide produced two packed strokes, `글자 인식` produced `열 후보`, and explicit candidate selection plus `글자로 사용` produced the accepted-glyph message. Editor diagnostics after capture: 0 errors, 0 warnings.

This establishes machine and editor-runtime behaviour only. It does not establish human handwriting tolerance, physical touch ergonomics, accessibility, target-device behaviour, or release readiness.

## Observed correction during runtime review

| Current state | Recommended correction applied | Request reason | Expected effect |
| --- | --- | --- | --- |
| Duel glyph panel reused a Frostbloom-specific hint | Added a scene-context hint API; duel now names the practice ward | The direct-input component should not tell the player they are handling seedlings during a supervised duel | Shared input stays reusable while the story context remains clear |
| First class initially had no glyph-acceptance gate, and its first corrected continuation button exceeded the 1280×720 viewport | Added the real direct glyph panel, block continuation until `glyph_accepted`, then placed the button inside the compact lesson panel | The first class must teach the core loop before the greenhouse practicum and must not crop its sole next action | A player writes → recognizes → accepts before progressing, and the complete lesson flow fits the observed landscape viewport |
| Festival `PanelContainer` children were split across siblings | Moved all closing content into one vertical container and reduced the panel height | Runtime render hid the festival copy behind an invalid container layout and then left excess empty space | Text, notice, and button render together without a blank panel |
| Direct glyph drawing appeared not to register and an on-screen drawing could not reach the recognizer | Repaired normalised point retention, viewport-touch conversion, emulation de-duplication, packed-stroke handoff, and event-specific live guide rendering | A player needs to see the permitted glyph and have direct writing actually become a recognition candidate | The write → recognize → explicitly use path is observable in the first-class runtime instead of appearing to fail silently |

## Remaining verification and next safe work

1. Run human/player observation through the authored handoff chain on target landscape devices; no human UX PASS has been claimed.
2. Check crop/readability at a real 1920×1080 window or device; current editor capture evidence is 1280×720 only.
3. Create a festival-specific environment candidate only when there is a concrete consumer and then obtain a separate final visual lock before runtime use. The current festival reuses an existing canonical academy environment.
4. Await user-provided detailed card rules before implementing card mana, turn/round, scoring, victory, or a card-duel route.

# Star UI Kit v1 Adversarial Review — 2026-08-06

## Scope

```yaml
parent_decisions:
  - ART-STYLE-01
  - ART-BIBLE-01
  - ASSET-SPEC-01
  - GM-INGAME-ART-CHECKPOINT-01
  - GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-08-STAR-UI-KIT-V1
pull_request: 77
source_main: d682d9955cf4a75ac3953fb33a0cfed235fd2473
implementation_evidence_head: 2a12d4af946d747de1da901012f1abc20e5c2398
product_logic_change: NONE
final_art: NOT_CLAIMED
physical_device_validation: NOT_RUN
human_visual_validation: NOT_RUN
```

## Review Questions

1. Does the Runtime now read as the approved Navy/Gold magic-academy game rather than a generic gray debug form?
2. Are state and action priorities visible without color-only signaling?
3. Are visual components reusable rather than duplicated per screen?
4. Do vector assets have recorded provenance and actual Runtime import evidence?
5. Does the visual layer preserve all FIVE_POINT_STAR, Typed Stock, Mana, Preview, Target, and two-step Commit behavior?
6. Does automation detect missing textures and rendering failures rather than passing a text-only shell?
7. Are unsupported font/localization claims prevented?

## Findings and Resolutions

### A1 — Branch could have discarded newly merged Godot AI integration

**Risk:** The UI branch was originally based on `1178dae9`, while `main` advanced to `d682d995` with `addons/godot_ai/` and `project.godot` plugin/autoload configuration.

**Resolution:** Rebuilt the UI Kit RED contract directly on `d682d995`. The Godot AI addon and project settings are preserved. Headless logs confirm the game helper still registers during Runtime tests and screenshot capture.

### A2 — Initial UI tests allowed a false GREEN with missing SVG textures

**Risk:** A clean headless checkout loaded the Scene before Godot imported SVGs. Parser errors appeared, but the old tests only checked node existence, so `TextureRect.texture == null` could still pass.

**Resolution:** Added real Texture2D assertions for all six TextureRect consumers and a dedicated `godot --import` step before Runtime tests. The hardened test first failed as expected, then passed only after all five SVG sources were imported.

### A3 — Regular pentagon geometry did not match actual A0–A4 button anchors

**Risk:** A mathematically regular star could look correct in isolation while its lines miss the actual interactive slot centers.

**Resolution:** `StarCircuitBoard` now uses the same normalized anchor ratios as the Harness buttons and accepts the exact active-slot list. The selected slot ring and invalid-cause marker point to the actual interactive vertex.

### A4 — Headless screenshot evidence used a Dummy Renderer

**Risk:** `--headless` produced no Viewport texture. A screenshot gate could either fail forever or be weakened into a non-rendering claim.

**Resolution:** Capture now runs through Xvfb, software OpenGL GL Compatibility, and a dedicated 1280×720 `SubViewport`. It fails on missing/empty/wrong-size images or PNGs below 10 KB.

### A5 — Default font produced Korean tofu boxes

**Risk:** The first rendered PNG showed missing Korean glyphs in the phase badge and accessibility panel. Assuming the user's desktop fallback would hide this would make CI evidence dishonest.

**Resolution:** Runtime v1 uses English-safe copy until a licensed Korean font and redistribution record are approved. Korean localization remains planned but is not silently replaced with an untracked font. No text is baked into image assets.

### A6 — New UI assets were outside the rights workflow path filter

**Risk:** `assets/art/ui/common/**` changes could bypass the existing asset-rights workflow.

**Resolution:** Added UI asset/theme/component paths to the workflow trigger and recorded `GR-UI-VECTOR-COMMON-01` as project-authored owned-original source. The approved Board A/B images remain reference-only; no tracing, glyph copying, font outline, character, or environment art was imported.

### A7 — Theme could become a new screen-specific frame set

**Risk:** Direct per-node colors and styles would recreate the component duplication prohibited by `ASSET-SPEC-01`.

**Resolution:** One `GrimoireThemeFactory` owns colors, focus states, panels, buttons, badges, glyph slots, status banners, and progress styling. Scene nodes select stable type variations. Per-node font-color overrides are rejected by contract.

### A8 — Visual work could accidentally change gameplay state

**Risk:** A decorative board component might begin validating circuits or consuming resources.

**Resolution:** `StarCircuitBoard` is draw-only and rejects references to Validator, Typed Stock, reservation, Mana consumption, or Commit operations. The existing Harness remains the sole adapter to Core Runtime. Full Runtime regression remains green.

## Rendered Evidence Review

```yaml
workflow_run: 31075087908
artifact_id: 8957170542
renderer: gl_compatibility
viewport: 1280x720
png_bytes: 168781
runtime_suites: 32
assertions: 1274
failures: 0
```

Visual inspection of the generated PNG confirmed:

- no left/right clipping;
- no A0 or phase-badge overlap;
- no missing Korean glyph boxes because unsupported copy was removed;
- central star lines align with A0–A4 controls;
- Main is visually dominant over Aux slots;
- Preview is the only primary action in Edit;
- Commit is visibly disabled before Final Preview;
- warning/status information has text and border/icon semantics;
- decorative corners do not obstruct text or touch controls.

## Remaining Limits

```yaml
final_background_illustration: NOT_STARTED
character_and_companion_art: NOT_STARTED
licensed_korean_font: NOT_SELECTED
korean_runtime_localization: BLOCKED_BY_FONT_RIGHTS_AND_RENDER_EVIDENCE
mobile_device_safe_area: NOT_RUN
performance_on_device: NOT_RUN
screen_reader: NOT_RUN
human_visual_comprehension: NOT_RUN
full_vertical_slice_representativeness: NOT_RUN
release_readiness: NOT_CLAIMED
```

## Verdict

`UI_KIT_V1_AUTOMATED_AND_RENDERED_EVIDENCE_PASS / FINAL_ART_DEVICE_HUMAN_NOT_RUN`

The branch is suitable for direct Godot desktop review as a reusable visual-system checkpoint. It is not final art, Korean localization, mobile-device validation, or release evidence.

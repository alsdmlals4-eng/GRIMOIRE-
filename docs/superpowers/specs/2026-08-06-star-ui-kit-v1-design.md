# GRIMOIRE Star Circuit UI Kit v1 Design

## Status

```yaml
decision_parent:
  - ART-STYLE-01
  - ART-BIBLE-01
  - ASSET-SPEC-01
  - GM-INGAME-ART-CHECKPOINT-01
  - GM-STAR-CIRCUIT-MASTERY-BALANCE-01
status: IMPLEMENTATION_DESIGN_FOR_APPROVED_VISUAL_DIRECTION
source_runtime: FIVE_POINT_STAR_INTERACTIVE_POC
source_main: d682d9955cf4a75ac3953fb33a0cfed235fd2473
godot_ai_addon: PRESERVED_FROM_MAIN
final_art: NOT_CLAIMED
physical_device_validation: NOT_RUN
human_visual_validation: NOT_RUN
```

## Goal

Replace the temporary gray Harness presentation with a reusable Godot UI component system that reads as the same Navy/Gold magic-academy game as approved Board A/B while preserving all existing star-circuit behavior.

## Selected Approach

Use a **context-preserving writing workbench** rather than a generic full-screen settings panel.

```text
left information rail
+ central five-point star workbench
+ right result/commit rail
+ persistent bottom action tier
```

This keeps the current POC easy to inspect while matching the Board B rule that writing UI preserves context, danger, resources, and explicit Commit.

## Visual Hierarchy

1. Brightest element: selected glyph and circuit path.
2. Primary action: Preview or Commit, never both visually dominant at once.
3. Current phase: Edit → Circuit Ready → Target → Final Preview → Confirm → Committed.
4. Supporting information: mastery, mana, typed stock, accessibility mode.
5. Decorative ornament: low contrast and never crossing text or touch targets.

## Token Direction

### Color

```yaml
surface_canvas: "#071524"
surface_panel: "#0D2033"
surface_panel_emphasis: "#132D45"
surface_inset: "#081827"
line_brass: "#B58A43"
line_gold_active: "#E2BD68"
text_primary: "#F3EAD4"
text_secondary: "#B8C7D6"
text_muted: "#71879A"
player_cyan: "#72D9E8"
player_cyan_bright: "#B9F6FF"
warning_amber: "#E6A84B"
danger_red: "#C95D58"
success_mint: "#8BD2B2"
disabled_surface: "#17212B"
disabled_text: "#66727B"
```

Color never acts as the only status signal; text labels, icons, line styles, and focus rings remain mandatory.

### Shape

- Panels use 8 px corner radius, 1–2 px brass border, and restrained corner accents.
- Primary buttons use a wider horizontal silhouette and gold border.
- Secondary buttons use navy fill and thin brass outline.
- Glyph slots use circular or rounded-octagonal frames distinct from rectangular panels.
- Warning states use diamond marker plus text; no full-screen red wash.

### Typography

- Runtime v1 uses Godot's available dynamic default font until a licensed Korean font is approved.
- Title labels: 20–24 px equivalent, semibold direction.
- Body: 16–18 px equivalent at 1280×720.
- Numeric preview: 22–28 px equivalent.
- Decorative serif direction is not baked into image assets.

## Component Families Used in v1

The approved 12-family cap remains intact. This pass implements the first six reusable families:

1. `AcademyPanel` — standard information container.
2. `AcademyPanelEmphasis` — final preview and current-phase container.
3. `AcademyButton` — secondary action.
4. `AcademyButtonPrimary` — Preview/Commit action.
5. `AcademyBadge` — phase, source, target, warning markers.
6. `GlyphSlot` / `GlyphSlotMain` — auxiliary and main glyph controls.

Existing Label, ProgressBar, Tooltip, Modal, Divider, Focus Ring, and Cursor families remain follow-up extensions rather than separate screen-specific frame sets.

## Star Workbench Component

`StarCircuitBoard` is a reusable Control behind the six glyph buttons.

Responsibilities:

- draw the five-point star and five vertex guide rings;
- draw the central main ring;
- show inactive, valid-preview, target-ready, confirm, committed, and invalid states;
- never own gameplay validation or resource mutation;
- expose read-only visual state setters only;
- support reduced motion with immediate state replacement and no looping animation requirement.

## Image Elements

Runtime v1 adds only reusable vector decoration, not final character/background art.

- academy corner ornament SVG;
- star circuit sigil SVG or procedural line component;
- phase diamond icon SVG;
- warning diamond icon SVG;
- typed-stock crystal icon SVG;
- mana droplet icon SVG.

No Korean or English text is baked into these images. Approved Board A/B files remain untouched and external visual references.

## UX Changes

### Edit

- Main and Aux slots show role label separately from glyph name.
- Empty slots clearly read `비어 있음` rather than relying on dark color.
- Preview is the only primary action.

### Circuit Ready

- Star lines become cyan-gold.
- Target keyword area moves from disabled-looking generic buttons to explicit selectable chips.
- Commit stays unavailable.

### Final Preview

- Success and Mana become the largest numbers in the right rail.
- Typed Stock and cause glyph remain visible below.
- Commit becomes the only primary action.

### Confirm

- Button text and status banner both say confirmation is required.
- No resource count changes before second press.

### Invalid / Insufficient

- Central banner appears below A0 without covering slots.
- Cause glyph and recovery action are stated in text.

## Layout Contract at 1280×720

- Outer safe margin: 24 px minimum.
- Left rail: 288–320 px.
- Central workbench: flexible 440–520 px.
- Right rail: 312–336 px.
- Center and right rails must not overlap at 1280×720.
- All interactive controls remain at least 48×48.
- Text must remain readable at current 130% contract without clipping the primary action labels.

## Non-goals

- no final background illustration;
- no protagonist or companion sprite production;
- no final font licensing decision;
- no battle HUD or summon rail implementation;
- no new gameplay formula, target, glyph, stock, or mana behavior;
- no mobile portrait layout;
- no physical-device or human visual PASS claim.

## Acceptance

- Existing interactive sequence and all resource invariants remain unchanged.
- Theme is applied from one shared resource/factory rather than per-node duplicated colors.
- At least one reusable star-board component and one shared icon asset are loaded in the Scene.
- Runtime uses approved Navy/Gold/Cyan state semantics.
- Automated tests validate theme tokens, component families, touch targets, node paths, and existing interaction behavior.

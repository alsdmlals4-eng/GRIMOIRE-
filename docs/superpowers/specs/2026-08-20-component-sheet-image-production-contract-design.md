# GRIMOIRE Component Sheet & Image Production Contract Design

## Status

```yaml
decision_id: GM-COMPONENT-SHEET-IMAGE-PRODUCTION-CONTRACT-01
status: USER_APPROVED_DESIGN_WRITTEN_SPEC_REVIEW_PENDING
approved_design_scope:
  - COMPONENT_PACK_1A_CORE_12
  - COMPONENT_PACK_1B_PRODUCTION_RULES
master_layout: PC_16_9_MASTER_MOBILE_RESPONSIVE
visual_master_reference: 1920x1080
implementation_minimum_regression_reference: 1280x720
source_main: 5718d9b92bb783be687ab18eed9338f2f5862ade
implementation_authority: BLOCKED_PENDING_WRITTEN_SPEC_USER_REVIEW
image_generation_authority: BLOCKED_PENDING_WRITTEN_SPEC_USER_REVIEW
human_visual_validation: NOT_RUN
physical_device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice_validation: NOT_RUN
```

This contract turns the already approved Component Pack 1A/1B into a production-ready design specification. It does **not** implement new gameplay behavior, change Spell Workflow ownership, or claim final art/device/human validation.

## 1. Authority and Existing Solution First

This work extends, rather than replaces, the existing visual/runtime stack:

- `ART-STYLE-01` and `ART-BIBLE-01` remain the visual authority.
- Approved Board A/B remain visual checkpoint references and are not modified.
- `docs/superpowers/specs/2026-08-06-star-ui-kit-v1-design.md` is the reusable UI-kit predecessor.
- `src/ui/theme/grimoire_theme_factory.gd` remains the shared Navy/Gold/Cyan token and Theme authority.
- `src/ui/components/star_circuit_board.gd` remains the Five Point Star drawing component; no duplicate star renderer is created.
- Existing text-free SVG icon/ornament assets are reused before any new UI vector asset is added.
- `GM-SPELL-WORKFLOW-UI-V2-01` remains the interaction authority: Stage 2 owns circuit preparation; Stage 3 owns explicit Target, final preview, confirmation, and atomic use.

The new “12 components” are **production deliverables**, not twelve new low-level Theme families. They consume the existing Theme variations and add semantic composites only where the current UI kit does not already provide one.

## 2. Selected Architecture

```text
Design Tokens
  ↓
Existing Theme Variations / Primitives
  ↓
Reusable Composite Components
  ↓
Frostbloom Semantic Components
  ↓
Screen Assemblies
```

### 2.1 Existing primitive reuse map

| Component Pack deliverable | Existing solution / implementation direction |
|---|---|
| `UI-PANEL-01 Academy Panel` | reuse `AcademyPanel` / `AcademyPanelEmphasis`; add compact/pinned/modal composition, not a new frame set |
| `UI-BUTTON-01 Academy Action Button` | reuse `AcademyButton` / `AcademyButtonPrimary`; caution/quiet are Theme variations or semantic wrappers |
| `UI-BADGE-01 Semantic Badge` | reuse `AcademyBadge`; icon + label + count composition |
| `UI-HEADER-01 Context Header` | composite of existing Panel/Label/Badge primitives |
| `SPELL-CIRCUIT-01 Five Point Star Composer` | wrap existing `StarCircuitBoard` + existing glyph slot controls; never duplicate validation or resource mutation |
| `SPELL-TARGET-01 Context Target Selector` | semantic composite using Button/Badge/Card primitives |
| `SPELL-COMMIT-01 Commit Bar` | semantic composite consuming Stage 3 state; no transaction ownership |
| `EVIDENCE-PIN-01 Persistent Pin` | semantic composite using Panel/Badge/Label primitives |
| `FORECAST-CARD-01 W6 Forecast` | semantic composite only; observed-evidence data consumer |
| `DELTA-CARD-01 W7 Context Delta` | semantic composite only; preserved-fact/context-delta consumer |
| `RESULT-AXIS-01 Five Axis Result` | semantic result display; no global score authority |
| `CAUSAL-THREAD-01 Grimoire Causal Thread` | read-only causal receipt visualization |

## 3. Layout Contract

### 3.1 PC visual master

- Design reference: `1920×1080`, 16:9.
- Outer visual safe margin: 64 px horizontal / 48 px vertical at the reference size.
- Use relative Containers/anchors and proportional rails; fixed pixel positioning is prohibited for production layouts.
- `1920×1080` is the **visual authoring master**, not the minimum supported viewport.
- The existing `1280×720` no-overlap/touch/readability regression contract remains mandatory during implementation.

### 3.2 Mobile responsive reconciliation

Existing mobile battle/writing canon is **landscape fixed**. Component Pack 1B therefore does not silently convert the shipping game to portrait.

```yaml
shipping_mobile_orientation: LANDSCAPE_UNCHANGED
responsive_component_requirement: NARROW_CONTAINER_REFLOW_REQUIRED
portrait_reference_use: COMPONENT_STRESS_TEST_ONLY_NOT_SHIPPING_LAYOUT_AUTHORITY
safe_area: REQUIRED
```

- Battle/Writing and summon HUD continue to follow the existing landscape safe-area contract.
- Generic cards, badges, result blocks, and evidence panels must also survive narrow-container tests so that resizing/font growth does not destroy hierarchy.
- Runtime safe areas must be queried rather than assumed.
- Android `48dp` / iOS `44pt` practical touch-target contracts remain implementation test targets.
- Android maximum font-scale testing remains required before device PASS can be claimed.

## 4. Typography and Localization Gate

Component Sheet documents may contain Korean explanatory copy, but production runtime copy remains constrained by the existing font gate:

```yaml
font_localization_status: ENGLISH_SAFE_COPY_UNTIL_LICENSED_KOREAN_FONT
korean_runtime_copy: BLOCKED_UNTIL_FONT_LICENSE_IMPORT_FALLBACK_EVIDENCE
```

### Visual test values at 1920×1080

- Major heading: 48–52 px equivalent.
- Section title: 32–40 px.
- Card title: 24–28 px.
- Body: 24–26 px.
- Secondary: 20–22 px.
- Small label: 16–18 px.

These are visual-authoring `TEST_VALUE`s, not final accessibility proof. Runtime implementation must derive scalable sizes from Theme/layout policy rather than hard-code screenshot typography.

### Copy length contracts

- Button: one line; 8–14 Korean characters recommended when Korean localization is later enabled.
- Short badge: 1–2 terms; use a Card instead of forcing long copy into a Chip.
- Card title: one line whenever possible.
- Card body: normally 1–2 sentences; if the player needs more than 3 mobile lines, move detail into an explicit detail region rather than shrinking text.
- No critical information may exist only in a tooltip/hover state.

## 5. Interaction State Contract

All interactive primitives/composites use a common state vocabulary:

```text
DEFAULT
HOVER        # pointer only
FOCUS        # keyboard/controller navigation location
PRESSED
SELECTED     # persisted player selection
DISABLED
CAUTION
CRITICAL
LOADING
```

Hard rules:

- `FOCUS != SELECTED`.
- Color is never the only state signal.
- Focus uses a visible outline/shape treatment and survives grayscale.
- Mobile cannot depend on Hover.
- Caution is selectable-but-risk-bearing; it is not equivalent to Disabled.
- Critical is reserved for genuinely critical game/environment state and does not mean “wrong answer”.
- Reduced Motion must support immediate state replacement without looping ornamental animation.

## 6. Component Pack 1A/1B Production Contract

### 6.1 `UI-PANEL-01 Academy Panel`

Variants: `STANDARD / COMPACT / ELEVATED / MODAL / PERSISTENT_PIN`.

- Reuse the existing Academy Panel Theme language.
- Only density, elevation, padding, and structural header/footer treatment may vary.
- Do not create screen-specific frame art.
- Long text uses deliberate information hierarchy; avoid tiny scroll boxes for core reading.

### 6.2 `UI-BUTTON-01 Academy Action Button`

Variants: `PRIMARY / SECONDARY / TERTIARY / CAUTION / QUIET`.

- Primary action height target: 52–56 px equivalent at 1080p authoring reference.
- Major Commit action receives stronger hierarchy but not a different art family.
- Primary and caution states must remain distinguishable without hue.
- Text remains live UI text, never baked into image assets.

### 6.3 `UI-BADGE-01 Semantic Badge`

- Optional icon + short label + optional numeric count.
- Used for glyph, Lens, Known/Unknown, phase, warning, state, and source identity.
- Badge meaning must remain readable with icon/label shape in grayscale.

### 6.4 `UI-HEADER-01 Context Header`

- Displays location/context + current phase + current task.
- Keeps the player oriented without becoming a quest-log wall.
- Compact version must preserve current phase and task before decorative context.

### 6.5 `SPELL-CIRCUIT-01 Five Point Star Composer`

- Reuses the existing `StarCircuitBoard` and glyph slot controls.
- Main center + five Auxiliary slots remain the only topology.
- Stage 2 owns circuit/base preview only; no Target ownership and no Mana mutation.
- Component is visual/input composition only; validator/stock/transaction authority remains elsewhere.

### 6.6 `SPELL-TARGET-01 Context Target Selector`

- Shows concrete world targets, not named moral/intent routes.
- Forbidden labels include “best”, “recommended”, “correct route”, and named value-priority buttons.
- Target name: one line preferred; short context hint: up to two lines.

### 6.7 `SPELL-COMMIT-01 Commit Bar`

Contains:

- selected Target summary;
- Mana cost;
- Edit/Back action;
- explicit Commit action.

Rules:

- No resource mutation before the authoritative confirm/commit transaction.
- On mobile landscape it remains safe-area anchored and must not cover the writing stroke/target context.
- The Commit Bar does not duplicate the entire Forecast card.

### 6.8 `EVIDENCE-PIN-01 Known / Unknown / Lens Persistent Pin`

- Carries `Known 2 / Unknown 2 / Lens 1` from investigation into W6.
- Must use the same persisted summary rather than a duplicate Decision Brief screen.
- Compact mode may reduce wording, but not hide Unknown or Lens.
- Unknown is uncertainty, not failure/penalty styling.

### 6.9 `FORECAST-CARD-01 W6 Consequence Forecast`

Exactly four semantic fields:

1. `KNOWN_IMPROVEMENT`
2. `UNCERTAIN_CONSEQUENCE`
3. `FINAL_TARGET_SUCCESS_BREAKDOWN`
4. `MANA_COST`

Rules:

- Consumes observed evidence only.
- Hidden facts do not appear as known numeric modifiers.
- Success percentage must not visually dominate the meaning/tradeoff information as a “correct-answer score”.
- Breakdown may collapse in constrained layout; Known/Uncertain/Mana remain directly readable.

### 6.10 `DELTA-CARD-01 W7 Context Delta`

Exactly three meaning blocks:

1. `STILL_TRUE`
2. `NEWLY_LEARNED`
3. `NEW_TENSION`

Rules:

- `STILL_TRUE` must visibly preserve the accepted W6 improvement.
- New Tension is not styled as proof that W6 was wrong.
- The card does not recommend a new Target/circuit/priority.

### 6.11 `RESULT-AXIS-01 Five Axis Result`

Exactly five axes:

- FACILITY
- LIFE
- SPIRIT
- RELATIONSHIP
- DISCOVERY

Forbidden:

- total score;
- star rating;
- S/A/B grade;
- “perfect” or “best ending” aggregate verdict.

Mixed results remain visually legible as mixed results.

### 6.12 `CAUSAL-THREAD-01 Grimoire Causal Thread`

Canonical receipt sequence:

```text
observations
→ W6 meaning/circuit
→ W6 Target
→ W6 actual result
→ post-W6 context delta
→ W7 changed judgment
→ W7 actual result
```

- Read-only visualization.
- Actual receipt sources only.
- No hidden “true cause” or retrospective correct-answer node.
- PC may use horizontal/stepped presentation; constrained layouts use vertical flow.

## 7. Component Sheet Deliverables

### Sheet A — Foundations

- Academy Panel variants.
- Academy Action Button variants/states.
- Semantic Badge variants/states.
- Context Header variants.
- Focus/Selected/Caution/Disabled comparison row.

### Sheet B — Spell Workflow

- Five Point Star Composer.
- Context Target Selector.
- Commit Bar.
- Persistent Evidence Pin.
- Edit → Target → Final Preview → Confirm state sequence using one shared visual system.

### Sheet C — Frostbloom Decision

- W6 Forecast card.
- W7 Context Delta card.
- Persistent W6 receipt → W7 anchor handoff example without duplicate recap screen.

### Sheet D — Result / Grimoire

- Five Axis Result.
- Causal Thread.
- Portfolio Receipt mini block may be shown as a **composition example**, not promoted to a thirteenth core component.

## 8. Image / UI Ownership Boundary

### 8.1 Image assets may own

- background illustration;
- character/mentor portrait;
- spirit/creature art;
- world object illustration;
- glyph symbol artwork;
- reusable result/Lens icon source shapes;
- low-contrast decorative academy motif;
- VFX texture/mask source.

### 8.2 Image assets must not own

- button labels;
- Korean/English functional UI text;
- success/Mana/count numbers;
- Focus/Selected/Disabled state truth;
- Known/Unknown counts;
- Forecast wording;
- Result-axis wording;
- Causal Thread content;
- final runtime safe-area placement.

Approved Board A/B are composition references, not raster UI spritesheets.

## 9. Layer and Reuse Contract

Generated/painted imagery should be decomposable into reusable layers where practical:

```text
background
character
world_object
foreground_occluder
icon_or_symbol
ornament
vfx_texture
```

UI decomposition:

```text
panel_surface
border_or_9slice
optional_corner_ornament
header_region
divider
icon_slot
live_text_region
state_overlay_or_focus_ring
```

Do not bake state meaning into a unique raster panel for every state. State differences belong to Theme/Control behavior whenever possible.

## 10. File and Scene Naming Contract

### UI scenes/scripts

```text
src/ui/components/academy_panel.tscn
src/ui/components/context_header.tscn
src/ui/components/context_target_selector.tscn
src/ui/components/commit_bar.tscn
src/ui/components/evidence_pin.tscn
src/ui/components/forecast_card.tscn
src/ui/components/context_delta_card.tscn
src/ui/components/result_axis_card.tscn
src/ui/components/causal_thread.tscn
```

Existing `star_circuit_board.*` remains unchanged in identity and is composed rather than forked.

Naming rules:

- snake_case files;
- PascalCase `class_name` only when code-level reuse benefits from one;
- `GR_` prefix is reserved for exported asset IDs/manifests, not every node name;
- semantic component names describe meaning, not screen number (`forecast_card`, not `w6_right_panel_2`).

### Image/vector assets

```text
assets/art/ui/common/
assets/art/ui/glyphs/
assets/art/ui/lens/
assets/art/ui/result/
assets/art/characters/
assets/art/backgrounds/frostbloom/
assets/art/objects/frostbloom/
```

Generated candidate assets are never marked APPROVED solely because they exist in these paths.

## 11. Initial Image Production Set

First production batch after implementation-plan approval should remain small:

1. Frostbloom greenhouse/background key scene.
2. Classroom/guided-practicum background key scene.
3. Maren half-body dialogue portrait.
4. Nea/main spirit key visual or reusable field portrait source.
5. Glyph symbol source set needed by the first session.
6. Lens icon set: REST / PREPARE / SOCIAL / PRACTICUM.
7. Five Result Axis icon set.
8. Reusable academy ornament/VFX texture set only if existing vectors are insufficient.

No Festival full-content art batch, all-NPC portrait batch, or Year-One full asset set is authorized by this contract.

## 12. Production Sequence

```text
Component Sheet A Foundations
→ Component Sheet B Spell Workflow
→ Component Sheet C W6/W7 Decision
→ Component Sheet D Result/Grimoire
→ first-session image asset candidates
→ layer/reuse classification
→ Godot assembly
→ automated layout/regression
→ Human/Device validation later
```

This order prevents image generation from inventing UI structure before the live component system exists.

## 13. Acceptance Criteria for the Later Implementation Plan

The implementation plan must include tests/evidence for all of the following:

- no duplicate Theme token system;
- no duplicate StarCircuitBoard/validation ownership;
- all 12 deliverables can be assembled from shared primitives/composites;
- existing 1280×720 star UI regression remains intact;
- 1920×1080 visual master screenshots are produced;
- mobile landscape safe-area layouts are tested for representative 19.5:9 and 20:9 classes;
- constrained-width reflow tests exist for generic semantic cards;
- Focus and Selected are visually distinct;
- grayscale/color-independent state review exists;
- minimum touch contracts are measurable;
- Korean runtime copy is not introduced before the approved font gate;
- Board A/B are not edited or raster-sliced into functional UI;
- no score/grade/correct-route UI appears in W6/W7/Result components;
- generated images contain no baked functional text/numbers;
- image assets are registered with source, rights/license status, reuse classification, and approval state;
- Human/Device/Performance/Full Slice remain `NOT_RUN` until actually executed.

## 14. Adversarial Review — Five Whole-State Passes

### Pass 1 — Existing-solution duplication attack

Finding: the new Component Pack could recreate Theme tokens and Star Circuit behavior already implemented in v1.

Guard: explicit reuse map; existing Theme and `StarCircuitBoard` remain predecessors and implementation authorities for their responsibilities.

### Pass 2 — Mobile orientation drift attack

Finding: generic narrow-layout design could silently override the existing landscape mobile battle contract.

Guard: shipping mobile orientation remains landscape; portrait/narrow tests are component stress tests only unless a later explicit product decision supersedes the mobile layout contract.

### Pass 3 — Raster UI / AI-output lock-in attack

Finding: generated “complete screenshot” art could bake text, numbers, and states into images and become impossible to localize or reuse.

Guard: image/UI ownership boundary and mandatory layer/reuse classification.

### Pass 4 — Information-honesty attack

Finding: Forecast/Delta/Result styling could accidentally imply a best answer, rollback W6, or collapse results into a grade.

Guard: semantic field contracts, forbidden aggregate grade, no named correct route, and preserved W6 fact.

### Pass 5 — Validation-overclaim attack

Finding: polished Component Sheets or generated key art could be mistaken for runtime/device/human proof.

Guard: `human_visual_validation`, `physical_device_validation`, `performance_validation`, and `full_vertical_slice_validation` remain `NOT_RUN`; screenshots are design/automated evidence only until the corresponding tests run.

## 15. Non-goals

- no new gameplay formula or spell resolution behavior;
- no Task8 ownership change;
- no final Korean font selection in this contract;
- no final balance/timing proof;
- no full Main Menu/Inventory/Settings system;
- no Festival full UI/art set;
- no all-NPC portrait production;
- no full Year-One asset production;
- no mobile orientation change;
- no Human/Device/Performance PASS claim.

## 16. User Review Gate

The approved design has now been converted into a written specification. **Implementation planning and actual component/image production remain blocked until the user reviews this written spec and approves it.**

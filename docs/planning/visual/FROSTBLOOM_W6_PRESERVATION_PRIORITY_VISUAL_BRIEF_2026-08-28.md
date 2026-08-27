# Frostbloom W6 Preservation Priority — Project Core Scene Visual Board Brief

```yaml
artifact_id: PROJECT_CORE_SCENE_VISUAL_BOARD_FROSTBLOOM_W6_01
mode: planning_visualization
status: TEXT_BRIEF_READY__USER_IMAGE_APPROVAL_REQUIRED
project_relation: GRIMOIRE
decision_id: GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01
consumer_kind: PLANNED_GAME_SURFACE
consumer_surface: Frostbloom W6 target-preview and result-flow visual interpretation
primary_use: player-experience and visual-direction review
runtime_compare_required: true
project_asset_status: NOT_A_RUNTIME_ASSET
generation_authority: PENDING_NEXT_USER_EXPLICIT_APPROVAL
```

## 1. Purpose and required reading

This is a single planning visualization for the actual planned W6 screen flow, not a runtime asset, UI implementation, character approval, or human-validation proof.

It must demonstrate this question visually:

> In the same unstable greenhouse incident, what do I preserve first: the rare seedlings or the greenhouse structure?

Canonical constraints:

- `ART-STYLE-01` and `GM-VISUAL-DIRECTION-20260825-01`
- `GM-SPELL-WORKFLOW-UI-V2-01`
- `GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01`
- `GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01`

## 2. User-provided reference classification

| Reference | Role to adapt | Explicitly not adopted |
| --- | --- | --- |
| `ChatGPT Image 2026년 8월 26일 오전 08_45_56.png` | high-arched glasshouse depth, warm lantern against blue night, dialogue-safe lower framing | pictured people, clothing, Korean copy, exact composition/UI skin |
| `ChatGPT Image 2026년 8월 26일 오전 08_46_29.png` | annotated-board density only | time/city premise, protagonist identity, logo, book UI, all embedded copy |
| `KakaoTalk_20260826_193205188_24.png` | field-at-left / writing-overlay-at-right relationship, one focal instability, navy-gold material contrast | exact star layout, labels, numerical HUD, enemy design, UI skin, generic protagonist, baked pseudo-text |

These are `USER_PROVIDED_REFERENCE` inputs. They contain no executable task instruction, do not override project canon, are not approved project assets, and must not be copied into a build or used as a rights/provenance shortcut.

## 3. Continuity card

### Keep

- Soft Storybook Cel 2D Hybrid; deep navy and restrained aged-gold framing.
- Tall arched glasshouse, perimeter botanical density, warm lantern pools, blue-to-violet magic as a small accent.
- A readable focal subject and live-UI reserve; direct-written magical glyphs rather than talismans/cards.

### Avoid

- Time/city/ruin identity, pre-rendered readable or pseudo text, numbers, buttons, target arrows, exact reference character looks, copied UI skins and compositions.
- Photorealism, pastel conservatory, neon floodlight, generic mobile-casual vector appearance.

### Do Not Drift

- `글자 → 주문 → 대상 → 시전` remains the player-facing structure.
- The visual must make two preservation values legible without declaring a best route.
- Any text needed for shipping is editable live UI, not part of generated art.

## 4. Single-board composition

One 16:9, five-panel planning board with no logos, no readable words, no numbers, and no production-ready UI copy.

| Panel | Planned surface / player question | Visual requirement |
| --- | --- | --- |
| 01 | Enter the greenhouse incident — “what is unstable?” | dark glasshouse at night, one restrained botanical-spirit instability at centre, clear lantern-lit negative space |
| 02 | Direct glyph writing — “what can this letter do?” | close hand/stroke impression and luminous ink trail; no card or talisman metaphor |
| 03 | Complete spell — “what am I shaping?” | FIVE_POINT_STAR as direct writing/light on a live parchment-like overlay, not a copied UI layout |
| 04 | Preservation target preview — “what do I protect first?” | visually equal rare seedlings and strained glass/metal support, separated by composition and light rather than text; neither receives a crown, checkmark, or stronger glow |
| 05 | Result and reflection — “what changed and what remains?” | a split visual consequence: one side shows recovering seedlings with an unresolved structural crack; the other stabilised structure with stressed seedlings; no score, victory grade, or fixed moral judgment |

The player avatar, if present, is a small face-obscured apprentice silhouette only. No supplied-image character identity is adopted.

## 5. Proposed generation prompt

```text
Use case: ui-mockup
Asset type: planning-only project core scene visual board for a mobile-landscape fantasy game
Primary request: Create one 16:9 five-panel visual board that explains a magical greenhouse incident from direct glyph writing through spell composition, a preservation choice, and a mixed consequence. The key choice is visually equal: preserve rare frost-damaged seedlings first, or stabilise the cracked greenhouse structure first. Neither choice is framed as correct.
Input images: user-provided references are mood and layout-principle references only; do not copy their characters, logos, text, UI skins, exact compositions, or story premises.
Scene/backdrop: an old academy glasshouse at night, tall arched glass, dense plants around the perimeter, one botanical instability at centre.
Style/medium: original soft storybook cel 2D hybrid, anime-influenced but not copying any named artist; deep navy ink, aged muted gold, warm lantern pools, small blue-violet magic accents.
Composition/framing: five coherent panels. Panel 1 incident; panel 2 direct written glyph stroke; panel 3 five-point spell circuit as handwritten light; panel 4 equal visual choice between rare seedlings and cracked greenhouse structure; panel 5 two mixed result variants that show what was preserved and what remains at risk. Reserve lower or side zones for editable live UI but draw no interface text.
Lighting/mood: thoughtful, intimate, responsible magic; high contrast focal lighting and legible silhouettes at mobile scale.
Constraints: no readable words, no pseudo-text, no numbers, no buttons, no target arrows, no checkmarks, no best-route symbols, no logo, no city, no time-travel motif, no copied character identity, no photorealism, no generic mobile-casual UI.
```

## 6. Screen Interpretation Review criteria

| Check | Pass condition |
| --- | --- |
| Choice clarity | A viewer can distinguish the rare-seedling and greenhouse-structure stakes without reading UI text. |
| Fairness | Neither target receives a visual recommendation or looks like a fake option. |
| Flow fidelity | Writing → circuit → target → explicit cast/result reads in that order. |
| Visual continuity | Navy/gold/glasshouse/lantern/magic grammar follows the approved direction without copying reference expression. |
| Scope boundary | Generated output remains `GENERATED_EXPLORATION`, not a project asset or runtime evidence. |

## 7. Next approval boundary

This exact text brief is ready. A next user message that explicitly approves generation authorises **exactly one** generated board. After that one result, generation stops for review; any resulting planning finding is written back to the original decision owner before future assets or Godot implementation begin.

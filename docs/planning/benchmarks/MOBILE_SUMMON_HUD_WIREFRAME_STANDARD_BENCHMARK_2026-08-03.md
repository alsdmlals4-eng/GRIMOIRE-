# GR-BM-MOBILE-SUMMON-HUD-20260803-01 — Mobile Summon HUD Standard Benchmark

## Status

```yaml
benchmark_id: GR-BM-MOBILE-SUMMON-HUD-20260803-01
scale: STANDARD
status: COMPLETE_FOR_DESIGN
related_decision: GM-MOBILE-SUMMON-HUD-WIREFRAME-01
completed_at: 2026-08-03T07:49:00+09:00
product_runtime_validation: NOT_RUN
```

## Decision question

How should one persistent main summon and up to three secondary summons remain readable on a Mobile Landscape battle and writing screen without obscuring target, intent, timer, environmental risk, player resources, or the right Writing Focus Panel?

## Project constraints

- Mobile first, PC later.
- Landscape fixed.
- Right-side expandable Writing Focus Panel.
- Target, enemy intent, timer, environmental risk, HP, and mana remain visible during writing.
- Summon event order is `MAIN → S1 → S2 → S3`.
- Secondary roles are unique in the Slice.
- HUD reads State and does not mutate it.
- Runtime, device, accessibility, and human validation remain `NOT_RUN`.

## Sources

### Platform and engine standards

1. Apple Human Interface Guidelines — Designing for iOS
   - https://developer.apple.com/design/human-interface-guidelines/designing-for-ios/
   - Limit onscreen controls, prioritize primary content, and keep secondary details discoverable with minimal interaction.

2. Apple Human Interface Guidelines — Designing for games
   - https://developer.apple.com/design/human-interface-guidelines/designing-for-games/
   - Keep game text legible, make controls usable, accommodate safe areas and varied aspect ratios, and avoid fixed layouts where possible.

3. Apple Human Interface Guidelines — Game controls
   - https://developer.apple.com/design/human-interface-guidelines/game-controls/
   - Reduce virtual controls that overlap game content, show or hide controls according to context, and use at least 44×44 pt for frequently used touch controls.

4. Android Developers — Make apps more accessible
   - https://developer.android.com/guide/topics/ui/accessibility/views/apps-views
   - Interactive elements should provide at least 48×48 dp touch targets and unique descriptions.

5. Godot Engine stable documentation — DisplayServer
   - https://docs.godotengine.org/en/stable/classes/class_displayserver.html
   - `get_display_safe_area()` returns the unobscured display area where interactive controls should be rendered.

### Direct mobile game comparison cases

6. League of Legends: Wild Rift — Google Play developer listing
   - https://play.google.com/store/apps/details?id=com.riotgames.leagueoflegends.wildrift
   - Mobile-first real-time combat uses persistent edge controls and central battlefield visibility.

7. Pokémon UNITE — Google Play developer listing
   - https://play.google.com/store/apps/details?id=jp.pokemon.pokemonunite
   - Mobile team combat keeps persistent team and match state at the edges while preserving the center for action.

8. Diablo Immortal — Google Play developer listing
   - https://play.google.com/store/apps/details?id=com.blizzard.diablo.immortal
   - A permanent companion can remain part of combat identity without requiring a separate full-screen management dashboard.

The direct game observations are interface-pattern inferences from developer-provided store materials, not claims that those games use GRIMOIRE's exact architecture.

## Comparison axes

| Approach | Situation visibility | Writing Panel compatibility | Touch reliability | Event-source clarity | Production and QA cost |
|---|---|---|---|---|---|
| Top horizontal rail | weak; competes with intent and timer | medium | medium | high | medium |
| Left compact vertical rail | high when safe-area anchored | high | high with compliant hit areas | high; order matches MAIN/S1/S2/S3 | medium |
| Bottom horizontal rail | medium; competes with HP, mana, Stock | weak during hand writing | high | high | medium |
| Four full cards always visible | low | very low | high | high | very high |
| One icon plus carousel | high | high | medium | low; hidden slot state | low |

## ADOPT / ADAPT / REJECT

### ADOPT

- Stable edge anchoring that preserves the central situation.
- One persistent main companion identity separated from secondary roles.
- Platform touch-target minimums.
- Safe-area-aware relative layout.
- Contextual display of controls and secondary detail.
- Unique accessible descriptions and color-independent state labels.

### ADAPT

- Use a left vertical rail because GRIMOIRE reserves the right side for writing.
- Keep all four slot identities visible, but expand details for only one selected slot.
- Preserve result-source highlighting without copying real-time action-game ability clusters.
- Use `MAIN → S1 → S2 → S3` as both visual and event order.

### REJECT

- Four permanently expanded summon cards.
- A top rail that competes with enemy intent and timer.
- A bottom rail that competes with HP, mana, Stock, Commit, and hand occlusion.
- Hidden carousel pages that make inactive slots invisible.
- Color-only role or error states.
- Opening a detail panel as a free tactical pause.
- Fixed pixel coordinates that ignore safe areas and aspect ratios.

## Recommended design

```text
left safe-area compact rail
= MAIN + S1 + S2 + S3 always identifiable

one contextual detail drawer
= selected target rule + expected integer result + last event + management actions

Writing Focus
= compact rail remains + read-only micro detail only
```

## Industry and production implications

### UX

- The rail must be subordinate to target, intent, timer, risk, HP, mana, and the writing canvas.
- The player should identify role and next event without opening a management screen.
- Management actions must require explicit confirmation and cannot become a pause exploit.

### Art and content

- Four compact identity assets are needed: MAIN plus three secondary slots.
- Missing portraits require a stable silhouette fallback.
- Role, state, and result-source visuals require icon and text variants, including grayscale and reduced-motion states.

### Engineering

- Use a read-only HUD view model.
- Query safe area at runtime.
- Preserve independent cycle times and exactly-once event IDs.
- Separate observe, writing, resolve, result, pause, resume, and error states.

### QA

Combinatorial cases grow across:

- MAIN plus zero to three secondary summons;
- four role choices with unique-role limits;
- active, paused, sealed, invalid, error, and empty states;
- three aspect-ratio classes and both cutout sides;
- Writing Panel collapsed and expanded;
- 100% and 130% text scale;
- simultaneous event order and Save/Resume.

The design reduces this cost by allowing only one expanded detail drawer and prohibiting duplicate roles in the Slice.

## Adversarial findings

1. Left rail may still overlap a left-aligned target or dialogue card.
   - Guard: alternate lower-left safe anchor without changing slot order.

2. Detail drawer can become a free pause.
   - Guard: reading does not stop the Active Pressure Clock; only explicit confirmation mode may pause.

3. Rail taps can interfere with handwriting.
   - Guard: management controls disappear during active drawing; rail is read-only and does not steal the stroke.

4. Four simultaneous event cues can overwhelm the player.
   - Guard: deterministic sequence, one source highlight at a time, and compact integer delta text.

5. Accessibility enlargement can break the stack.
   - Guard: decorative portrait size reduces before touch target, role, number, timer, or state text.

## Verification plan

- Layout matrix: `16:9`, `19.5:9`, `20:9`; left and right cutouts.
- Text scale: `100%`, `130%`.
- Touch target measurements on Android and iOS devices.
- Grayscale and reduced-motion review.
- Same-time event source order.
- Writing stroke preservation while rail is visible.
- Save/Resume with three independent cycle times.

## Verdict

```yaml
recommended_option: B_LEFT_COMPACT_RAIL_WITH_CONTEXTUAL_DETAIL_DRAWER
confidence: DESIGN_READY_RUNTIME_UNVERIFIED
adopt: EDGE_ANCHOR_SAFE_AREA_TOUCH_ACCESSIBILITY
adapt: LEFT_RAIL_ONE_DETAIL_FOR_RIGHT_WRITING_PANEL
reject: TOP_OR_BOTTOM_DENSE_RAIL_AND_ALWAYS_EXPANDED_CARDS
```

# IMG-01 Six-Glyph Runtime Integration Design

## Status

- GitHub Issue: [#179](https://github.com/alsdmlals4-eng/GRIMOIRE-/issues/179)
- Decision: approved implementation design; awaiting this written-spec review before code and task plan.
- Asset state: HEAT and PROTECT are already represented by `main` / open PR #178 respectively. FLOW, FOCUS, DISPERSE, and BURST are user-approved temporary runtime candidates with local PNGs and manifests.

## Player experience

The same handwritten magical glyph must be recognizable in every spell-building surface. When the player sees `흐름` in Task6 recognition, chooses it in a Task7 card, or places it on the star circuit, the ink silhouette remains the same. A Korean name is live UI text at the lower right of the presentation; it is never baked into the PNG.

The player-facing flow stays `글자 → 주문 → 대상 → 시전`. This slice only improves visual continuity for the first two steps.

## Scope and guardrails

In scope:

- A read-only shared visual resolver for `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, and `BURST`.
- Task6 recognition preview and name label.
- Task7 glyph-card texture and lower-right name label.
- Star-circuit display slots for exactly one center Main glyph and zero to five outer Aux glyphs.
- UI tests and documentation/provenance evidence.

Out of scope:

- Task8, target selection, casting, reservations, explicit commit, stock, Mana, success/risk math, or scene-flow changes.
- New image generation, baking labels into images, replacing approved art, or claiming device/performance validation.
- Any merge or modification of unrelated PR #166. PR #178 remains an upstream asset source and is not merged by this task.

## Source-of-truth reconciliation

`data/glyphs/v1/glyph_vocabulary_v1.json` defines the Slice as `HEAT`, `PROTECT`, `FLOW`, `FOCUS`, `DISPERSE`, `BURST`. Existing `GlyphCatalog` deliberately normalizes legacy `BURST` to gameplay ID `AMPLIFY` and existing tests protect that behavior.

The new resolver is presentation-only:

| Request ID | Visual asset ID | Reason |
| --- | --- | --- |
| HEAT, PROTECT, FLOW, FOCUS, DISPERSE, BURST | same ID | Direct Slice mapping |
| AMPLIFY | BURST | Explicit legacy visual compatibility only |
| unknown ID | none | No invented texture or fallback artwork |

No code in this slice changes `GlyphCatalog.normalize_id`, glyph metadata, reservation, or commit behavior. The resolver owns the Korean display-name mapping for these six approved visuals, including `AMPLIFY → 폭발` when the visual compatibility path is used.

## Component contract

### `GlyphVisualResolver`

Add a small static GDScript helper under `src/ui/spell_workflow/` or another existing UI-only shared location. It exposes:

- `asset_id_for(glyph_id: StringName) -> StringName`
- `texture_path_for(glyph_id: StringName) -> String`
- `texture_for(glyph_id: StringName) -> Texture2D`
- `korean_name_for(glyph_id: StringName) -> String`

It contains the only runtime file-path mapping for the six glyph PNGs. Missing or unsupported IDs return an empty `StringName`, empty path, null texture, and empty label. It must not mutate input or consult transaction state.

### Task6 recognition screen

Add `RecognitionPanel/GlyphPreview` (a `TextureRect`) and a lower-right `GlyphNameLabel`. `GlyphDrawingScreen._show_recognition` binds them from the recognized/selected glyph ID through `GlyphVisualResolver`; message text and the accepted-save path stay unchanged. No preview means an empty texture and hidden/empty name.

### Task7 glyph card

Add `Content/GlyphTexture` and `Content/GlyphNameLabel` to the reusable glyph card scene. `GlyphCard.bind` resolves `glyph_id`; its existing card labels, source, availability, pointer behavior, and disabled `modulate` state stay intact. `GlyphNameLabel` is anchored bottom-right inside the glyph presentation area and uses the resolver’s localized Korean name.

### Star circuit board

`StarCircuitBoard` remains a display-only `Control` and retains its procedural circles, guides, state color, and `visual_snapshot().owns_gameplay_state == false` contract. Add display-only glyph TextureRects: one central slot plus five outer slots. Expose a binding method that receives the main glyph ID and an ordered/slotted auxiliary glyph-ID collection, then applies resolver textures/names at the same vertex geometry used by `_vertex_points`.

`CircuitPlacementScreen._render_board` derives these IDs only from its already-rendered placement snapshot and invokes the board binding before/with `set_visual_state`. It does not create reservations, modify placement, or synthesize missing slots.

State meaning remains styling, not alternate art: selection/reserved/shortage/error/confirmed use existing outline, `modulate`, and semantic marks rather than duplicate PNG files.

## Test and validation contract

Automated:

1. Add resolver coverage for all six direct IDs, `AMPLIFY → BURST`, and unknown/empty fallback.
2. Extend the Task6 integration test to require the preview and live-name nodes; assert a recognized Slice glyph binds the matching visual without changing the one-time save assertion.
3. Add/extend glyph-card scene coverage for texture/name nodes and binding.
4. Add/extend circuit-placement coverage: main plus sparse auxiliary slots appear in matching board slots, and the board remains display-only.
5. Run existing glyph catalog, writing-view-model, drawing-screen, and circuit-placement regressions to prove gameplay normalization and transaction behavior remain unchanged.
6. Validate manifests against `docs/planning/ASSET_MANIFEST_SCHEMA.json` and export SHA-256 values.

Manual evidence to collect after code, without pre-claiming a pass:

- Godot imports all six PNGs without new errors.
- 48/64/96px legibility checks for HEAT, PROTECT, FLOW, FOCUS, DISPERSE, BURST.
- 1280×720 and 1920×1080 screenshots of Task6 and Task7 visual bindings.
- Existing reservation/preview/explicit-prepare regression in the editor.

## Risks and decisions

- `BURST` is explicitly temporary art canon. Its current silhouette may be replaced only with a new approval, provenance record, and resolver path update.
- The `AMPLIFY → BURST` mapping is intentionally visual-only; it preserves current test-protected gameplay semantics while representing the user-approved Slice artwork.
- Main/aux placement data can be sparse or unordered, so board slots must use stored `slot` indices rather than array position.

## Completion evidence

The implementation report must list changed scenes/scripts/tests, resolver map results, non-regression evidence, manifest verification, current GitHub/Notion asset records, and every manual validation still not run.

# Task9 Spell Workflow Product Root Design

## Decision

Build one deliberately bounded, automated playable slice that connects the already-approved spell workflow surfaces in this order:

`글자 → 주문 → 대상 → 시전 → 결과`

This is the next gate after Task8. The supplied execution contract and the user's standing product-implementation approval are recorded as the approval for this bounded current slice.

## Player outcome

In a safe academy greenhouse practicum, the player writes the already-supported `HEAT` glyph, places it as the centre of the existing five-point circuit, explicitly completes a spell, selects either an unstable ward or a wilted flower, reviews the final preview, and confirms casting once. The final result receipt shows the resolved target and cost. No target, cast, resource consumption, or result is automatic.

## Scope

- Add a `SpellWorkflowProductRoot` scene/controller that owns only scene-to-existing-domain orchestration.
- Give the existing drawing surface a thin pointer/touch stroke collector so the existing recognition path can be used through the UI.
- Use the existing `GlyphDrawingScreen`, `CircuitPlacementScreen`, `SpellUseScreen`, `SpellWorkflowCoordinator`, approved glyph PNGs, and approved school background.
- Make this root the development main scene through the Godot editor.
- Add deterministic end-to-end coverage and runtime/screen evidence for the explicit flow and failure boundaries.

## Protected meaning

- `SpellWorkflowCoordinator` remains the sole preparation/use transition authority.
- The existing reservation ledger, mana, prepared-spell inventory, result ledger, and exactly-once transaction semantics remain authoritative; the root does not duplicate them.
- The player-facing default terms stay `글자`, `완성 주문 이름`, `대상`, and `시전`. Internal `Stock`, `Stage`, `Main`, and `Aux` terms are not promoted as primary teaching copy.
- The circuit keeps one Main centre glyph and zero-to-five Aux vertices. This slice uses one recognised `HEAT` Main glyph only; it does not change the rule.
- Both target choices are valid and visibly distinct. Neither is labelled or encoded as a recommended route.

## Explicit exclusions

- No full Frostbloom incident, lesson progression, save/load, reward economy, combat, investigation, Android/Windows shipping export, audio, new VFX, new art generation, or modification of legacy Task6/7/8 domain rules.
- No automatic targeting or casting, universal stock replacement, duplicate transaction ID generation, direct main push, or runtime evidence presented as human-play evidence.

## Chosen integration

| Alternative | Decision | Reason |
| --- | --- | --- |
| Keep `star_circuit_harness` as the entry scene | Reject | It is a separate POC and leaves the approved Task6–8 consumer chain disconnected. |
| Build the full 00–46 Frostbloom session | Defer | It adds unapproved content, presentation, progression, and asset/audio scope. |
| Add a thin product root over the existing workflow surfaces | Adopt | It produces the smallest actual player path while preserving existing authority and approved assets. |

## Runtime composition

`SpellWorkflowProductRoot` constructs the same minimal valid resources used by the existing coordinator tests. It configures the drawing screen with a reservation-backed `HEAT` glyph session. After a glyph is successfully saved, it reveals the circuit screen; its public intent signals drive the existing placement session and coordinator preview/preparation calls. Only an explicit second preparation action creates the prepared spell. The root then configures `SpellUseScreen` with a caller-supplied opaque transaction ID and exactly two target choices. The screen itself requires target selection, preview, request-confirmation, and a second confirmation before `confirm_use`.

The root shows a result/restart surface only after the coordinator returns `USED`. A cancellation or invalid recognition/circuit/target remains on the current step with an explanatory state; it must not consume assets or advance the flow.

## Input, feedback, and accessibility

The stroke collector accepts mouse and touchscreen drags, normalises points to the writing surface, separates strokes on release, clears deliberately, and submits only after the player presses recognition. It does not infer a glyph before recognition. Existing Korean name labels remain live UI labels next to the glyph preview/card rather than baked into PNGs. The root relies on existing responsive safe-root layout and is checked at the project’s landscape representative sizes through automated runtime inspection.

## Acceptance criteria

1. Starting the project exposes a usable Korean `글자` first step with a real pointer/touch writing input.
2. A valid `HEAT` trace can be recognised, selected, and explicitly saved without creating a duplicate vault glyph.
3. Saved glyph intent reaches the existing circuit screen, where the player explicitly places it at Main, previews, then explicitly completes the spell.
4. The target step exposes exactly two valid, non-ranked targets; selecting either produces a final preview.
5. Casting requires preview plus two explicit actions and uses the caller-provided transaction exactly once; a replay is rejected by existing authority.
6. Invalid/empty input, invalid circuit, absent target, cancellation, and stale/replayed confirmation do not advance or silently consume.
7. The project parses/imports, existing deterministic suites remain green, new root tests are green, and a headless plus live-editor runtime inspection completes without task-related errors.
8. Repository structured canon and Notion human-facing canon identify the post-Task8 reality and this slice’s evidence ceiling: automated ready, human/player experience not run.

## Evidence ceiling

Machine evidence can establish `AUTOMATED_VERTICAL_SLICE_READY` and `READY_FOR_USER_VERTICAL_SLICE_VALIDATION` only after all required automated checks and readbacks complete. Human usability, player experience, device/performance, and shipping-export evidence remain `NOT_RUN` unless actually performed.

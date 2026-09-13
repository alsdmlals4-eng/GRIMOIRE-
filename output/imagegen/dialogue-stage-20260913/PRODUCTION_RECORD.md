# Shared-stage dialogue composition candidate

User layout authority: 2026-09-13 attached codex-clipboard-44f24b01-94f2-433b-92e4-95281e9f0905.png and `우리도 이렇게할거야`. Layout reference only; its characters, setting and text are not game canon.

Current target: continuous academy backdrop, large unframed characters sharing stage, one translucent navy/gold dialogue overlay on bottom approximately25%, nameplate on upper-left. Remove side portrait frames and center report panel. Speaker text and choices remain Godot Controls; background/characters/frame must be separate in runtime.

Input identities: approved originals student-anime-reference-01.png, peer-personality-01.png, tutor-personality-01.png in ../character-style-comparison/. Their prior provenance/hashes remain in visual owner CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md.

Output: classroom-composition-candidate-01.png. Built-in image generation; model version not provided. Status GENERATED_CANDIDATE / COMPOSITION_REVIEW_ONLY. Generated from three original portraits, preserving costume/props and showing classroom shared stage with blank lower dialogue box. No baked functional text. This is a flattened visual prototype, NOT separated runtime asset, NOT final appearance approval, NOT implementation evidence. Do not preload it as scene-independent dialogue background (would bake three actors and classroom into every location).

Rejected prior output: .cleanup-review/20260913-dialogue-alpha/rejected-rgb-checkerboard.png. Asked image model for a separated transparent three-character atlas; output decoded RGB1536x1024 and contains painted checkerboard, no alpha. Character thirds also not safely isolated. REJECTED_FOR_RUNTIME. Do not chroma-key or claim transparency. Kept for user-controlled cleanup, no original files deleted.

Next implementation needs: genuine alpha individually addressable portraits, location-only backdrop, bottom overlay layout with scrolling32px text/choices, all present actors retained during speaker changes. Keep current game unchanged until usable layer assets are available; do not replace it with a false transparent substitute.

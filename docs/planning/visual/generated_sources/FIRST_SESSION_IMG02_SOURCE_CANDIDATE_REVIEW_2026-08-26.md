# IMG-02 Source Candidate Review — 2026-08-26

## Outcome

The three required IMG-02 source candidates are stored locally and have matching Notion ASSET LIBRARY records. Each also has a matching native-resolution lossless WebP export and provenance manifest. None is bound to a runtime Scene yet.

| Asset ID | Intended consumer | Source candidate | Composition review | Runtime export fit |
| --- | --- | --- | --- | --- |
| `bg_school_common` | Class/Safe Precedent | `assets/art/source_candidates/first_session_01/backgrounds/school/bg_school_common_candidate_01.png` | Safe conservatory classroom, central practicum surface, no people/UI/text | `assets/art/backgrounds/school/bg_school_common.webp` — 1672×941 WebP Lossless; manifest hash verified; 2560×1440 remains a regeneration target, not an upscale task |
| `bg_greenhouse_field_base` | Guided Field Practicum; Investigation/Return | `assets/art/source_candidates/first_session_01/backgrounds/greenhouse/bg_greenhouse_field_base_candidate_01.png` | Open central field space and calm greenhouse identity; decorative floor medallion is background-only | `assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp` — 1672×941 WebP Lossless; manifest hash verified; 2560×1440 remains a regeneration target, not an upscale task |
| `bg_greenhouse_battle_arena` | Greenhouse Battle | `assets/art/source_candidates/first_session_01/backgrounds/greenhouse/bg_greenhouse_battle_arena_candidate_01.png` | Clear combat floor and side actor space, intact greenhouse, no embedded circuit/target mark | `assets/art/backgrounds/greenhouse/bg_greenhouse_battle_arena.webp` — 1672×941 WebP Lossless; manifest hash verified; 2560×1440 remains a regeneration target, not an upscale task |

## Rejected generation

The first battle-arena generation was not persisted as a source candidate because concentric floor geometry read as a spell-circle interface. The selected candidate has ordinary irregular stone masonry instead.

## Deliberate boundary

- The built-in generation result is `1672×941`, rather than the planned runtime delivery size. The lossless WebP candidates intentionally preserve that size without blind upscale.
- Source and export SHA-256 values are recorded in `assets/manifests/background_*.json`; Godot image decode validation passed.
- Godot import readback, Scene binding, gameplay, device, and performance claims remain `NOT_RUN`.
- `IMG-03` environment-state overlays remain blocked until the runtime effect-reuse test determines whether Light/Material/Particles communicate the states without extra images.

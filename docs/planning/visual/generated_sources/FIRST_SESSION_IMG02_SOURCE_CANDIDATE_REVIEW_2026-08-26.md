# IMG-02 Source Candidate Review — 2026-08-26

## Outcome

The three required IMG-02 source candidates are stored locally and have matching Notion ASSET LIBRARY records. They establish the intended environment direction, but none is promoted to a runtime asset yet.

| Asset ID | Intended consumer | Source candidate | Composition review | Runtime export fit |
| --- | --- | --- | --- | --- |
| `bg_school_common` | Class/Safe Precedent | `assets/art/source_candidates/first_session_01/backgrounds/school/bg_school_common_candidate_01.png` | Safe conservatory classroom, central practicum surface, no people/UI/text | Needs decision — 1672×941 PNG, not the planned 2560×1440 WebP Lossless |
| `bg_greenhouse_field_base` | Guided Field Practicum; Investigation/Return | `assets/art/source_candidates/first_session_01/backgrounds/greenhouse/bg_greenhouse_field_base_candidate_01.png` | Open central field space and calm greenhouse identity; decorative floor medallion is background-only | Needs decision — 1672×941 PNG, not the planned 2560×1440 WebP Lossless |
| `bg_greenhouse_battle_arena` | Greenhouse Battle | `assets/art/source_candidates/first_session_01/backgrounds/greenhouse/bg_greenhouse_battle_arena_candidate_01.png` | Clear combat floor and side actor space, intact greenhouse, no embedded circuit/target mark | Needs decision — 1672×941 PNG, not the planned 2560×1440 WebP Lossless |

## Rejected generation

The first battle-arena generation was not persisted as a source candidate because concentric floor geometry read as a spell-circle interface. The selected candidate has ordinary irregular stone masonry instead.

## Deliberate boundary

- The built-in generation result is `1672×941`, rather than the planned runtime export size.
- No blind upscale, lossy runtime conversion, runtime manifest, Godot import, Scene binding, or gameplay claim has been made.
- `IMG-03` environment-state overlays remain blocked until the runtime effect-reuse test determines whether Light/Material/Particles communicate the states without extra images.

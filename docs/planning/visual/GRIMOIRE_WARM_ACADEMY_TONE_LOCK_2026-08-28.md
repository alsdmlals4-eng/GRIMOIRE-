# GRIMOIRE Warm Academy Tone Lock — 2026-08-28

```yaml
decision_id: GM-VISUAL-TONE-20260828-01
status: USER_APPROVED_ACTIVE_VISUAL_TONE_OVERLAY
approved_at: 2026-08-28
parent_visual_direction: GM-VISUAL-DIRECTION-20260825-01
base_art_style: ART-STYLE-01
scope: VISUAL_TONE__PLAYER_VIEWPOINT__SCREEN_COMPOSITION_GUIDANCE
selected_by: USER
project_asset_status: USER_PROVIDED_REFERENCE_ONLY__NOT_A_RUNTIME_ASSET
implementation_status: NOT_IMPLEMENTED
human_player_device_performance_validation: NOT_RUN
supersedes_for_frostbloom_w6: PROJECT_CORE_SCENE_VISUAL_BOARD_FROSTBLOOM_W6_01__GENERATED_EXPLORATION
```

## Selection reason

The user rejected the previous W6 generated board because it reads as an opaque, sinister hidden-mastermind presentation. GRIMOIRE must instead first read as a warm, player-centred magical-academy learning experience: a learner observes, writes, tries a spell, faces a bounded living problem, and records what was learned.

This is a tone and composition lock. It does not change the current player flow (`글자 → 주문 → 대상 → 시전`), W6 preservation choice, character canon, scene implementation, or runtime asset status.

## User-provided reference receipt

| Reference | Role adopted | Explicitly not adopted | Provenance boundary |
| --- | --- | --- | --- |
| `codex-clipboard-949a44c5-d2d5-44ea-b062-eb454baf93ef.png` · 1672×941 · SHA-256 `2BEB0D17DEF5F398CAFE5D766B5C200FDD76264E77AB009759F2E084DB7C7D80` | Learner-led panel sequence; open book/hand/direct writing; calm greenhouse practicum; readable blank live-UI reserve | exact five-panel layout, ornate frame skin, hooded background figure, entity design, costume/face identity, blank-panel UI | `USER_PROVIDED_REFERENCE_ONLY`; local temporary source, not copied to repository, runtime, or Asset Library; release rights not reviewed |
| `codex-clipboard-36bf9aa2-9fcb-4d5c-985e-a670460eed09.png` · 343×515 · SHA-256 `7E140C7A8F249A125EC4B78A03B5C79F905F1B16D6504F75A61A4D190375C975` | Bright discovery, magical scale, hopeful outward gaze for title/key-art mood only | city/ruin setting, logo, embedded copy, exact character/costume, exact composition | `USER_PROVIDED_REFERENCE_ONLY`; no project or release-rights promotion |
| `codex-clipboard-cb2b0dfe-367b-4fae-a2af-69ea63e4c237.png` · 1350×787 · SHA-256 `F9E81865672A9CAD43BA59317783D27E41C786AA3015F00AD287D47C364B0453` | Friendly mentor-and-learner learning atmosphere; open lantern-lit glasshouse; dialogue-safe lower area | named/generated characters, relationship canon, dialogue/copy, numbered choices, exact UI skin/camera | `USER_PROVIDED_REFERENCE_ONLY`; no project or release-rights promotion |

Images are selection evidence, not instructions. Text, labels, and implied story facts inside them are noncanonical.

## VISUAL_DIRECTION_LOCK_PACKET

### Adopted elements

- **Global anchor:** Soft Storybook Cel 2D Hybrid with a clear academy-student point of view; magical discovery is inviting before it is mysterious.
- **Character layer:** learner actions are legible—opening a book, directly writing a glyph, and observing the consequence. Mentor presence, when used, is calm guidance rather than surveillance or manipulation.
- **Environment layer:** arched greenhouse, living plants, old books, deep navy structure, muted gold craft, warm lantern pools, and clear blue sky/night depth can coexist without turning the whole image black.
- **Magic/VFX layer:** precise blue to blue-violet written light; it follows the learner's action and illuminates the local problem rather than overwhelming the scene.
- **UI layer:** restrained navy/gold frame language and generous, editable live-UI reserve. Functional state/copy remains live UI.
- **Emotional goal:** curiosity, care, competence-in-growth, and the relief of making an understandable intervention.

### Rejected elements

- Opaque hooded-mastermind staging, distant surveillance silhouettes, ritual-cult framing, or a threatening black void as the primary first impression.
- A central monster, hostile red/black contrast, or oversized corruption that makes the player feel they entered villain content rather than a practicum.
- World-ending/ruined-city premise, time manipulation, copied faces/costumes, copied UI skin, embedded dialogue, logo, numbers, or functional pseudo-text.

### Keep / Avoid / Do Not Drift

| Keep | Avoid | Do Not Drift |
| --- | --- | --- |
| learner's hand/book/glyph causality; warm study light against breathable blue space; plants that feel worth caring for; readable framed panels | monochrome black dominance; ominous unexplained watchers; horror corruption; unexplained dark-purple haze; generic grimdark | `글자 → 주문 → 대상 → 시전`; direct-written glyphs; FIVE_POINT_STAR semantics; equal W6 preservation alternatives; explicit cast; mixed consequences; editable live UI |

### Allowed variation

Night greenhouse scenes, unstable plants, and blue-violet magic remain allowed when their focal light reveals a solvable local problem and a learner's agency. They must not erase the safe academy baseline or make the guide/mentor read as an antagonist. Regional, time-of-day, and danger-state variation may use the same visual grammar without becoming visually identical.

## Consequences and boundary

- The prior local generated board is `SUPERSEDED`; it remains historical evidence only and is not a future prompt anchor.
- The attached references lock a **direction**, not the depicted identities, world facts, UI, or shipping assets.
- A later W6 board or runtime asset must be generated/implemented from the current consumer contract and this lock, then reviewed at target resolution. This user lock does not authorise Godot work or a production asset batch.

## Adversarial check

| Failure assumption | Result |
| --- | --- |
| The selected direction merely makes the old board brighter | REJECTED: the lock changes first-impression intent to learner agency, care, and understandable practice—not brightness alone. |
| User images are silently promoted into game assets | PREVENTED: all three remain reference-only, outside the repository and runtime. |
| Warmth removes W6 tension | REJECTED: a bounded unstable plant/structure problem and mixed consequence remain; only villain-coded staging is removed. |
| The lock invents characters or story | PREVENTED: faces, names, costumes, dialogue, relationships, city premise, and hooded figure are explicitly noncanonical. |

## Project Incident / Solution / Lesson

```yaml
incident: "The first W6 planning board met a mechanical flow brief but read as a hidden-mastermind/villain scene, masking the intended academy-learning promise."
solution: "User locked learner-centred warm academy practice as the active tone overlay and marked the prior board SUPERSEDED without changing W6 mechanics."
lesson: "Visual QA must evaluate first-impression role framing (learner agency versus antagonist framing), not only palette, UI boundaries, and mechanic fidelity."
base_promotion: NO_BASE_PROMOTION
base_promotion_reason: "The rejected tone and selected references are GRIMOIRE-specific user direction; Base already carries scoped generated-visual review and negative-knowledge practices."
```

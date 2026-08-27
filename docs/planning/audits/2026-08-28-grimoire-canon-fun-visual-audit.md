# GRIMOIRE 정본·핵심 경험·시각 이해 감사 — 2026-08-28

```yaml
issue: 218
audit_mode: FRESH_READ_CANON_FUN_VISUAL
project_main: 6377cbcf31958fc2b3215d7a9603dfa5f0199c04
project_main_subject: "docs: sync greenhouse spirit asset seed (#217)"
base_main: 7cfc75d607d1ed4d0f8323d4389e64da93df00c8
base_main_subject: "docs: close BCP-2026-046 as implemented (#767)"
read_at: 2026-08-28
scope: DOCUMENTATION_AND_HUMAN_CANON_RECONCILIATION_ONLY
runtime_or_product_mutation: false
audit_pr: 219
audit_merge_commit: 6ab3dd11a9bff9e5f3c3c9aebd87f63e613c5444
```

## 권위와 fresh-read 범위

| Source | Exact identity | 판정 |
| --- | --- | --- |
| Project GitHub completed `main` | `6377cbcf31958fc2b3215d7a9603dfa5f0199c04` | CURRENT repository/runtime truth |
| Base completed `main` | `7cfc75d607d1ed4d0f8323d4389e64da93df00c8` | CURRENT shared-workflow source; project pin v9.4.3 is compatibility input only |
| Open PR #187 | Draft, `5fe76b4663eb31fc07d2c97d60d53f2911de5c91` | HISTORICAL/DUPLICATE_WORK candidate; Task8 screen is already consumed by Task9 on current `main`; READ_ONLY |
| Open PR #166 | Draft, `d7d2dc94f68c94ff624836493a3ed054da7ec3d1` | HISTORICAL other-workstream; README-only; READ_ONLY |
| Repository front doors | `AGENTS.md`, `START_HERE.md`, `docs/ACTIVE_CONTEXT.md`, v4.8 binding | CURRENT authority chain |
| Notion human canon | GRIMOIRE Home and its Direction, Magic, Visual, Flow, Asset, Production owners | CURRENT only where readback agrees with current repository state; stale projections are listed below |
| Runtime/code/data/Scene/test | `project.godot`, Product Root, Task6/7/8 screens, Coordinator, assets/manifests, integration tests | CURRENT implementation evidence |

## Classification

### CURRENT

- `GM-SPELL-WORKFLOW-UI-V2-01` player wording: **글자 → 주문 → 대상 → 시전**; the internal `FIVE_POINT_STAR`, typed glyph resources, explicit preview, and exactly-once commit remain protected.
- Product Root is `res://src/ui/spell_workflow/spell_workflow_product_root.tscn`; its implemented bounded flow is write/recognise/save → circuit preview/prepare → two explicit target alternatives → two-step cast → result receipt.
- Task9 (PR #192), Task10 (#197), Task11 (#205), Task12 (#208), and Task13 (#210) are merged. Task11 binds the greenhouse field background and Academy theme; Task13 renders the authoritative result receipt/target/mana payload.
- Six glyph PNGs are current Product Root consumers via `glyph_visual_resolver.gd`. The greenhouse field background is a current Product Root Texture2D consumer.
- Visual direction `GM-VISUAL-DIRECTION-20260825-01` is approved style-only reference: Soft Storybook Cel 2D Hybrid, navy/aged gold, glasshouse night depth, warm lantern contrast, restrained blue-to-violet magic. It is not character/world/UI-content canon or a runtime asset.

### HISTORICAL / SUPERSEDED

- v4.5 `CURRENT_CONFIRMED_DECISIONS.md`, `CURRENT_UNRESOLVED_GATES.md`, and `CANON_SYNC_STATE.json` retain useful provenance/compatibility literals but cannot state current execution gates.
- Old Task8 preservation/reconciliation handoffs retain provenance only. The live current `main` has Task8's thin screen integrated through Task9; draft PR #187 must not be treated as the accepted frontier.
- The 46-minute Frostbloom Flow Map remains approved planning input, but is not proof of a completed playable first session or a current runtime implementation map.

### CONFLICT / FIX NOW

1. Notion Production Handoff still says visual work is the current boundary and product implementation must not start. This conflicts with merged Product Root work. It must be replaced with an historical boundary plus the current validation gate.
2. The Notion Visual Asset Coverage page contains older readbacks that describe Task8/Task9 as absent or pending next work. Its current header must point to the repository's current merged reality and preserve old paragraphs as provenance.
3. Repository front-door projections ended at Task10 even though Task11–13 and PR #217 are merged. This audit updates `START_HERE.md` and `docs/ACTIVE_CONTEXT.md` without promoting any unrun evidence.

### UNKNOWN_UNVERIFIED

- Fresh local Godot headless execution was unavailable because no `godot` command was present.
- No GRIMOIRE Godot editor session was connected; only other projects were listed. There is no new live runtime observation in this audit.
- Human usability, player experience, mobile device, performance, Windows/Android export, release rights, and full vertical-slice validation remain `NOT_RUN`.
- The greenhouse spirit idle/unstable PNG is `PROJECT_ASSET_APPROVED_IMPLEMENTATION_PENDING`: file/provenance exist; Godot import, Battle Scene binding, and runtime consumption are not verified.

## Recalculated current work

| Item | State | Evidence ceiling |
| --- | --- | --- |
| Current project goal | Make learned magical letters into deliberate situation-changing spells, then turn observed consequences into knowledge for the next problem. | CURRENT design intent; player appeal untested |
| Accepted frontier | Product Root automated vertical slice plus post-Task9 presentation corrections; next gate is user vertical-slice validation. | Automated/repository evidence only |
| Work 5 position | **5/5: validation and decision gate entered**, not passed. Design and bounded Product Root are connected; human/player proof remains pending. | Human gate NOT_RUN |
| Active playable slice | Safe greenhouse practicum: one recognised `HEAT` glyph, a prepared spell, `WARD` or `FLOWER`, explicit two-step cast, result receipt, restart. | Code/test evidence, not a full Frostbloom session |
| Visual/audio | Glyph set and one background are Product Root consumers; Academy live theme is bound. No approved audio runtime consumer/readback. | Visual runtime completeness and audio proof NOT_PROVEN |

## Player experience trace

```text
Player promise
→ understand a magical letter's meaning and deliberately compose a spell
→ decide what to preserve or stabilise under constraints
→ see target, cost, and consequence before committing
→ receive an explainable result/side effect record
→ learn what to try differently in the next situation
```

The current Product Root proves only the skeleton of this trace. The full promise needs the Frostbloom situation, instability/environment consequences, Grimoire reflection, and human observation before it can be claimed as fun, clear, or memorable.

## Core classification

| Candidate | Class | Evidence |
| --- | --- | --- |
| Learning a glyph meaning and using it to make a contextual spell | PROJECT_CORE | Home, player-facing decision, product flow |
| Explicit compose → preview → target → cast transaction | PROJECT_CORE | v2 decision, Coordinator, Product Root tests |
| Consequence/side-effect explanation recorded as next knowledge | PROJECT_CORE, currently PARTIAL in runtime | Home/Frostbloom canon; Product Root receipt is a thin first proof |
| FIVE_POINT_STAR and typed resource accounting | CORE_SUPPORT / TECHNICAL_FOUNDATION | approved balance decision and existing services |
| Result receipt, Academy theme, glyph/background assets | MVP_SUPPORT / PRESENTATION_SHELL | Task11/13, scene/asset consumers |
| Full 46-minute Frostbloom session, combat, investigation, meta progression | APPROVED PLANNED CORE EXPRESSION, implementation UNVERIFIED | Flow Map/Frostbloom planning; not current runtime |

## Evidence-based SWOT

| Statement | Class | Evidence / confidence | Player impact | Disposition / next validation |
| --- | --- | --- | --- | --- |
| Direct writing plus deliberate, exactly-once casting gives the player visible authorship rather than a one-click spell list. | STRENGTH | Product Root, Coordinator, tests; VERIFIED for mechanics, PARTIAL for appeal | High potential ownership | PROTECT; observe whether players understand why each confirmation exists |
| The first playable root offers two valid targets but not yet a meaningful visible trade-off with different felt consequences. | WEAKNESS | Task9 target payload/tests; VERIFIED | Choice may read as cosmetic | IMPROVE; user test must ask players to predict and explain their target choice |
| Frostbloom's nonlethal instability/environment resolution can differentiate the game from damage-first fantasy combat. | OPPORTUNITY | Battle Rules/Frostbloom planning; PARTIAL | Could make responsibility and learning memorable | TEST; build only the smallest situation evidence after user validation |
| The current UI/root is a bounded practicum rather than the whole learning→situation→record loop. | THREAT | Product Root non-scope; VERIFIED | Players may not see the selling point in one short flow | MITIGATE; validate core comprehension before expanding asset/content production |
| Visual grammar is coherent at reference level, but the generated board and assets do not prove mobile readability or screen-level consistency. | WEAKNESS | approved reference + current asset bindings; PARTIAL | Style could mask unclear decisions | TEST; actual 1280×720/phone-size user observation with live UI |

## Visual planning board

`PROJECT_CORE_SCENE_VISUAL_BOARD` was generated once in this audit as `GENERATED_EXPLORATION` for project-understanding review. It is not committed, not an Asset Library record, not a runtime asset, and not a design approval.

| Panel | Intended screen/scene | Player goal / choice | Current evidence | Unresolved |
| --- | --- | --- | --- | --- |
| 01 | Main/title invitation | Enter a magical-learning space | visual direction only | title/menu information architecture |
| 02 | First glyph practicum | Write/recognise a meaningful glyph | Task6/Product Root | onboarding language and recognition confidence |
| 03 | Spell composition | Make a complete spell with one main and optional auxiliaries | Task7/Product Root | completed-spell naming grammar |
| 04 | Greenhouse situation | choose a target, inspect final preview, explicitly cast | Task8/Task9 structure | visible trade-off/consequence design |
| 05 | Result/Grimoire reflection | understand what changed and carry knowledge forward | Task13 receipt + planned Grimoire | persistent record, reward, failure-learning loop |

Adversarial result: the board matches the lighting/material/style anchor, but it fails as a final design reference because it contains pseudo-text, an unapproved generic protagonist appearance, and does not make the two-target trade-off legible. Do not use it as a production prompt without a revised, user-approved brief.

### Frostbloom W6 direct candidate — 2026-08-28

The prior generic project-understanding board remains historical `GENERATED_EXPLORATION` and is not a current visual lock. The W6-specific generated candidate in `docs/planning/visual/FROSTBLOOM_W6_PRESERVATION_PRIORITY_VISUAL_BRIEF_2026-08-28.md` is also historical: the user rejected its opaque/villain-coded tone on 2026-08-28. `GM-VISUAL-TONE-20260828-01` is now current: learner-centred, warm academy practicum with a bounded solvable problem. The W6 trade-off remains rare frost-damaged seedlings versus greenhouse structure; mobile-scale wording/choice comprehension and release-rights review remain unverified.

## Required order

1. User vertical-slice validation of the current Product Root: comprehension, target-choice rationale, confirmation burden, result understanding, and desire to continue.
2. **Resolved 2026-08-28:** `GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01` makes the first target trade-off rare seedlings versus greenhouse structure. Validate its readability before any Battle/first-session production asset batch.
3. Update the full Frostbloom situation implementation contract from proven Product Root seams; preserve one-threat/one-situation production cap.
4. Only then bind approved greenhouse-spirit asset and create missing runtime assets with consumer contracts.

## Base promotion

`NO_BASE_PROMOTION`: this audit's stale Task8/Task9/Task11 lineage and Notion projections are GRIMOIRE-specific. The reusable lesson is already covered by Base canonical-reference freshness and adversarial-review routes.

# Frostbloom Internal Graybox Test Pack Design

## Authority

```yaml
decision_id: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
sync_id: GR-SYNC-20260811-14-FROSTBLOOM-GRAYBOX-TEST-PACK-DESIGN
status: USER_APPROVED_DESIGN_SPEC_REVIEW_PENDING
scope: INTERNAL_DESIGN_VALIDATION_ONLY
parent_design: docs/superpowers/specs/2026-08-11-frostbloom-internal-vertical-slice-design.md
parent_implementation_plan: docs/superpowers/plans/2026-08-11-frostbloom-internal-vertical-slice-implementation-plan.md
product_decision_changed: false
persistent_godot_source_mutation: none
task8_execution: NEXT_AFTER_TEST_PACK_SPEC_AND_PLAN_GATES
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

This design translates the already-approved Frostbloom internal vertical-slice contract into an **internal design-validation graybox test pack**. It does not claim fun, actual 46-minute completion, usability, accessibility, device performance, or external-player evidence. It exists to expose contradictions, dead routes, duplicate decisions, answer leakage, consequence invalidation, and timing-risk before persistent Godot implementation resumes.

## 1. Work question

Can the approved 46-minute `SINGLE_INCIDENT_SPIRAL` be represented as a coherent internal walkthrough in which:

- W1–W7 each asks for a meaningfully different decision;
- exactly one free-schedule window produces four nonmandatory but distinct contextual affordances;
- every one of the six possible 2-of-4 investigation pairs supports forward progress without revealing a correct route;
- the W6 first solution improves real state and remains true after the old-revision reveal;
- W7 is a genuine redesign under new context rather than a repeat cast;
- five result dimensions remain independently legible;
- the Grimoire can record a causal chain from observation to meaning/circuit to target to actual result;
- the paper/graybox pacing exposes the current 46/53/60 timing hypothesis without promoting it to human evidence?

## 2. Fresh research receipt

The project prework gate `GM-PREWORK-BENCHMARK-INDUSTRY-RESEARCH-01` applies. The same work unit began with fresh Base/project/Sheet reads and continued without changing scope, product decision, key assumptions, or comparison set.

### Source A — Base current Source Context owner

- Source: `alsdmlals4-eng/Base@315c66eea9614c284b9c11c4d522141065dfa4b0`, `docs/knowledge/game-development/PERIODIC_EXTERNAL_SOURCE_WATCHLIST.md`
- Role: current project-process authority / source-context owner
- Fact used: extract source fact, context conditions, freshness, overlap, smallest change, disposition; apply Existing Solution First and adversarial review before retained work.
- Applicability: direct process authority.
- Disposition: `ADOPT`.

### Source B — Games User Research, “How to run pop-up playtests”

- Surface: `https://gamesuserresearch.com/how-to-run-pop-up-playtests/`
- Role: industry practitioner guidance
- Freshness: stable-method guidance; checked 2026-08-11
- Fact used: start from the riskiest/most important questions, convert them into concrete research objectives, then choose tasks/questions/observations that can answer those objectives; avoid using an unsuitable method for questions it cannot support.
- Applicability: strong for structuring an internal graybox pack around risks and observable checks, but it does not turn an internal walkthrough into player evidence.
- Disposition: `ADAPT`.

### Source C — Games User Research, “Choose the right playtest method”

- Surface: `https://gamesuserresearch.com/choose-the-right-playtest-method/`
- Role: industry practitioner guidance
- Freshness: stable-method guidance; checked 2026-08-11
- Fact used: define what the team needs to learn before selecting a method; focused objectives should reflect current design decisions and constraints.
- Applicability: direct support for a focused internal design-validation pack rather than a general feedback checklist.
- Disposition: `ADAPT`.

### Source D — Steamworks, Testing On Steam / Steam Playtest

- Surfaces: `https://partner.steamgames.com/doc/store/testing`, `https://partner.steamgames.com/doc/features/playtest`
- Role: official platform testing documentation
- Freshness: current platform documentation; checked 2026-08-11
- Fact used: external playtesting has separate release/access/feedback concerns and can be isolated from the main game through Steam Playtest.
- Applicability: not required for this internal-only pack; useful as a boundary confirming that external distribution/recruitment is a later work unit.
- Disposition: `REFERENCE_ONLY`.

### Research dispositions retained for this work

```yaml
ADOPT:
  - explicit risk/objective/check structure
  - Existing Solution First
  - adversarial review before promotion
ADAPT:
  - moderator-style walkthrough into internal design walkthrough
  - observable behavior checks into deterministic paper/graybox acceptance checks
TEST:
  - 46-minute pacing hypothesis as internal timing-risk only
  - W1-W7 decision distinctness
  - six 2-of-4 investigation pairs
  - free-schedule dominance risk
  - W6 preservation and W7 redesign distinctness
AVOID:
  - claiming fun or human comprehension from internal review
  - survey-style opinion questions as proof
  - copying competitor dialogue, scenarios, UI expression, art, code, or content
IGNORE:
  - external recruitment/sample-size guidance for this internal-only pack
REFERENCE_ONLY:
  - Steam external playtest distribution mechanics
```

## 3. Chosen approach

### Hybrid Internal Graybox Pack

The approved approach combines three views that cover different failure modes:

1. **Chronological walkthrough** — protects beat logic and pacing.
2. **Exhaustive matrices** — protects combinatorial fairness and non-dominance.
3. **Adversarial attack checklist** — protects against answer leakage, fake choice, consequence invalidation, and result collapse.

A script-only walkthrough is too weak against 2-of-4 combinatorics. A matrix-only pack is too weak against pacing and causal flow. The hybrid pack is the smallest design artifact that covers both.

## 4. Pack structure

```text
FROSTBLOOM_INTERNAL_GRAYBOX_TEST_PACK
├── 01_46_MINUTE_WALKTHROUGH
├── 02_W1_W7_WRITING_LOAD_AUDIT
├── 03_INVESTIGATION_2_OF_4_MATRIX
├── 04_FREE_SCHEDULE_4_CHOICE_AUDIT
├── 05_W6_REVEAL_W7_CONSEQUENCE_CASES
├── 06_RESULT_AND_GRIMOIRE_CASES
└── 07_ADVERSARIAL_WALKTHROUGH
```

The pack may be represented in Markdown/JSON/tabular fixtures during planning. Persistent `.gd/.tscn/.tres/.res/project.godot` authoring remains outside this design work unit.

## 5. 46-minute walkthrough contract

The walkthrough preserves the approved timing envelope exactly:

| Beat | Target time | Internal graybox purpose |
|---|---:|---|
| School safe precedent | 0–6 | Maren precedent demo; W1 FLOW, W2 FOCUS, W3 DISPERSE |
| Campus micro-crafting | 6–11 | one contextual tool/glyph marking; W4 |
| Free schedule | 11–14 | one actual choice from REST/PREPARE/SOCIAL/PRACTICUM |
| Frostbloom investigation | 14–23 | inspect 2 of 4 nodes; one noncombat application; W5 |
| First major solution | 23–30 | first FIVE_POINT_STAR design; Stage2/Stage3 decision; W6 |
| New context + pressure + redesign | 30–39 | old-revision reveal adds context; one strong pressure source; W7 |
| Result + Grimoire | 39–44 | five-dimensional result and causal record |
| Portfolio + preview | 44–46 | compressed feedback and future preview only |

Every beat row in the executable pack must contain four fields:

```text
PLAYER_KNOWS
PLAYER_CHOOSES
SYSTEM_CHANGES
MUST_REMAIN_UNKNOWN
```

`MUST_REMAIN_UNKNOWN` is mandatory. It captures information that NPCs, copy, UI, fixtures, or facilitator notes must not expose yet. If a correct spell, circuit, target, route, or ending interpretation leaks through this field, the case fails even if progression still works.

### Timing interpretation

- `46` remains the target hypothesis.
- `53` remains the content rework threshold.
- `60` remains the hard-stop hypothesis.
- Internal walkthrough timestamps identify obvious over-allocation or impossible sequencing only.
- Internal timing may not promote `actual_play_target_minutes: 46` to validated human completion evidence.

## 6. W1–W7 writing-load audit

The audit does not merely count seven successful direct writing events. Each event must justify a different cognitive or contextual role.

| Event | Required role | Fail condition |
|---|---|---|
| W1 | safe precedent / FLOW meaning | indistinguishable from W2/W3 task |
| W2 | safe precedent / FOCUS meaning | only redraws without new judgment |
| W3 | safe precedent / DISPERSE meaning | tutorial repetition without new consequence |
| W4 | craft/tool contextual marking | can be removed with no change to later understanding |
| W5 | noncombat field application | duplicates W4 or directly reveals W6 answer |
| W6 | first major contextual solution | no real dimension improves or route is preselected |
| W7 | redesign under added context | same effective judgment as W6 with no new tradeoff |

Required audit question:

> Does this writing event require a decision that the immediately previous writing event did not require?

Result values:

```text
DISTINCT
PARTIALLY_DUPLICATE
DUPLICATE
NOT_TESTABLE_YET
```

Recovery attempts are tracked separately and may not push the approved recovery-inclusive cap above 10.

## 7. Investigation 2-of-4 exhaustive matrix

Approved investigation nodes:

```text
IRRIGATION_PRESSURE
ROOT_LAYER
SPIRIT_TRACE
OLD_REPAIR_RECORD
```

All six unordered pairs must be tested:

1. IRRIGATION_PRESSURE + ROOT_LAYER
2. IRRIGATION_PRESSURE + SPIRIT_TRACE
3. IRRIGATION_PRESSURE + OLD_REPAIR_RECORD
4. ROOT_LAYER + SPIRIT_TRACE
5. ROOT_LAYER + OLD_REPAIR_RECORD
6. SPIRIT_TRACE + OLD_REPAIR_RECORD

Every pair must satisfy all of the following:

```yaml
forward_progress_to_w6: REQUIRED
useful_context_count_min: 2
remaining_uncertainty_count_min: 1
correct_route_id: FORBIDDEN
required_spell: FORBIDDEN
best_intent: FORBIDDEN
mandatory_hidden_third_clue: FORBIDDEN
```

A pair is `FAIL` if it becomes a practical dead end, if its omitted clues secretly make completion impossible, or if it is materially inferior because another pair reveals the answer rather than merely different context.

The six pairs do not need identical information value. They must each support a coherent solution attempt while preserving different uncertainty/tradeoff profiles.

## 8. Free-schedule four-choice audit

The single actual free-schedule window offers all four choices:

```text
REST
PREPARE
SOCIAL
PRACTICUM
```

Each produces a distinct nonmandatory affordance:

- `REST` — subtle spirit-discomfort context / calmer interaction signal.
- `PREPARE` — one extra contextual condition on a crafted tool.
- `SOCIAL` — one people/facility perspective.
- `PRACTICUM` — one frost/pressure behavior clue.

Every choice must pass:

```yaml
blocks_main_progress: false
owns_required_material: false
owns_required_answer: false
permanent_dominant_reward: false
later_choice_invalidated: false
```

The audit must explicitly attack dominance: if one choice predictably removes more uncertainty, gives required resources, and also has no tradeoff, mark `RISK` or `FAIL` rather than normalizing the other three upward.

## 9. W6 → Reveal → W7 consequence-preservation cases

This is the highest-priority adversarial contract.

Each case records:

```text
W6_OBSERVED_CONTEXT
W6_MEANING_AND_CIRCUIT
W6_TARGET
W6_ACTUAL_IMPROVEMENT
W6_COST_OR_FORGONE_VALUE
OLD_REVISION_NEW_CONTEXT
PRESERVED_W6_FACT
NEW_TENSION
W7_CHANGED_JUDGMENT
W7_ACTUAL_RESULT
```

Required invariants:

1. Accepted W6 improves at least one real incident dimension.
2. Old-revision reveal adds context; it does not rewrite the W6 result to false.
3. W7 changes at least one of meaning/circuit, target, intent emphasis, tradeoff, or contextual use because of the new information.
4. W7 does not exist merely to repeat the same command for more numerical effect.
5. `FACILITY_REPAIR`, `LIFE_RESCUE`, `SPIRIT_STABILIZATION`, `CONTAIN_AND_EVACUATE`, `SUPPRESS_AND_BUY_TIME`, and `UNREGISTERED_COHERENT` remain derived semantic labels, never route buttons.

Automatic `FAIL` phrase-pattern:

```text
"Your first solution was actually meaningless/wrong and is now erased."
```

The exact wording need not appear; any mechanical equivalent fails.

## 10. Five-dimensional result and Grimoire cases

Result dimensions remain independent:

```text
FACILITY
LIFE
SPIRIT
RELATIONSHIP
DISCOVERY
```

Internal cases must include at least one mixed result where one dimension improves while another stays neutral or worsens. A single global `SUCCESS_GRADE` may summarize nothing; it cannot replace the five values.

The Grimoire case must preserve a causal record with at least:

```text
observations
meaning_and_circuit
selected_target
intent_tags
actual_result
side_effects_and_forgone_values
discoveries
player_naming
```

The internal test question is not “is this prose good?” It is:

> Can the case explain why this result happened without inventing information the player had not yet obtained?

If not, the case fails causal traceability.

## 11. Adversarial walkthrough

The pack must attack at least these cases:

1. Player attempts W6 after only one investigation node.
2. Two different investigation pairs accidentally provide the same effective answer.
3. One free-schedule choice becomes obviously dominant.
4. Maren or another helper effectively states the correct spell/circuit/target.
5. W6 result is invalidated after old-revision reveal.
6. W7 is simply W6 repeated.
7. Any W1–W7 event is cognitively redundant.
8. Five result dimensions collapse into one pass/fail grade.
9. Grimoire causality requires knowledge the player never observed.
10. School exposition consumes more space/time than investigation + redesign.
11. Historical 3×3 language reappears as current circuit authority.
12. A separate exam/festival sequence grows into required slice content.
13. A mob wave/HP-sponge structure replaces the one strong pressure source.
14. A fixture encodes a route button or required-spell lookup table.

Allowed verdicts only:

```text
PASS
RISK
FAIL
NOT_TESTABLE_YET
```

`NOT_TESTABLE_YET` is required where Godot runtime, human comprehension, device behavior, accessibility, performance, or real elapsed time is necessary.

## 12. Existing Solution First and ownership

This pack extends the approved D slice rather than creating new gameplay authorities.

```text
Graybox test pack
→ validates approved Frostbloom beat/content assumptions
→ later maps to Frostbloom incident orchestration
→ uses existing SpellWorkflowCoordinator
→ uses existing AtomicSpellUseService
→ uses existing AtomicResultLedger
→ uses existing SaveRepository
```

It does not own:

- glyph recognition;
- FIVE_POINT_STAR circuit math;
- mana;
- prepared-spell inventory;
- Stage 3 spell-use atomicity;
- generic save I/O;
- Task8 Spell Use Screen UI;
- Human/Device/Performance validation.

## 13. Promotion gates

This design approval does **not** authorize implementation yet.

Required sequence:

```text
USER_APPROVED_DESIGN
→ WRITTEN_SPEC_COMMITTED
→ SPEC_SELF_REVIEW
→ USER_WRITTEN_SPEC_REVIEW
→ WRITING_PLAN
→ INTERNAL_PACK_IMPLEMENTATION
→ PACK_READBACK_AND_ADVERSARIAL_RESULT
→ NEW WORK UNIT / FRESH RESEARCH
→ TASK8 RESUME
```

Task8 execution-path availability is now known from the user, but project GitHub/Sheet still contain the historical `ON_HOLD_USER_REQUEST_COST_DEPENDENCY` status. That status is not mutated inside this design-spec step; after this pack completes, Task8 resumes as the next work unit using a fresh start/research gate and an explicit operational-status sync under existing `GM-SPELL-WORKFLOW-UI-V2-01`.

## 14. Success criteria for this design

The design is ready for implementation planning only when:

- all seven pack blocks have explicit purpose and verdict rules;
- every six investigation pair is enumerated;
- all four free-schedule choices have anti-dominance guards;
- W6 consequence preservation is a hard invariant;
- W7 redesign distinctness is testable;
- result dimensions cannot collapse into one score;
- `NOT_TESTABLE_YET` boundaries prevent false evidence promotion;
- no persistent Godot mutation is implied;
- no competitor expression is copied;
- Task8 remains the next work unit after this pack, not an implementation dependency bypass.

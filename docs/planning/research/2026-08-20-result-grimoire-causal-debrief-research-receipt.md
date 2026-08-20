# Frostbloom Result / Grimoire · 39–44분 Fresh Research Receipt

```yaml
work_unit: FROSTBLOOM_RESULT_GRIMOIRE_39_44
research_gate: PREWORK_BENCHMARK_AND_INDUSTRY_RESEARCH
performed_at_kst: 2026-08-20
project_main_observed: 1f88ef62da84bf5065b4aa6f39160ce7124fb3ed
base_main_observed: 3cdb82f94af402fedcc9c1e80902d1d01b8d3ab3
scope: RESULT_DEBRIEF_GRIMOIRE_REFLECTION_ONLY
existing_solution_first: REQUIRED
competitor_expression_copying: FORBIDDEN
human_validation: NOT_RUN
```

## Work question

How should the first-session Result/Grimoire segment help a new player understand what happened and what they learned without collapsing mixed consequences into one success grade, inventing causes from unobserved clues, or having the system write the player's conclusion for them?

## Existing GRIMOIRE authority

The existing Frostbloom graybox already locks:

- five independent result dimensions: `FACILITY / LIFE / SPIRIT / RELATIONSHIP / DISCOVERY`;
- no scalar `SUCCESS_GRADE` replacement;
- a causal record with observations, meaning/circuit, Target, actual result, side effects/forgone values, discoveries, and player naming;
- causal traceability only from actually observed/revealed/result evidence.

Disposition: **REUSE**. This work unit only refines presentation order and authorship boundaries for minutes 39–44.

## Benchmark 1 · Outer Wilds — discovery log as comprehension aid

Primary sources:

- https://www.mobiusdigitalgames.com/news/demaking-outer-wilds
- https://www.mobiusdigitalgames.com/news/planet-progress
- https://www.mobiusdigitalgames.com/news/a-look-into-playtests
- https://www.mobiusdigitalgames.com/news/all-systems-go

Observed pattern:

- During narrative-structure playtests, testers spontaneously wrote discoveries down; Mobius treated this as evidence that the ship computer should track discoveries.
- The later ship computer was explicitly described as the player's journal, with organization affecting interpretation.
- A detective-board presentation was added to make investigation structure more visual and was reported to help new players understand the investigation without changing the core experience.
- Mobius also stated that the computer should keep track of discoveries without telling the answers to the mysteries.

Disposition: **ADAPT**.

GRIMOIRE use:

- automatically preserve actual receipts and causal adjacency;
- progressively reveal the chain rather than dump every field at once;
- do not convert organization into an answer/recommendation engine.

## Benchmark 2 · Return of the Obra Dinn — book as information organizer

Primary developer source:

- https://dukope.com/devlogs/obra-dinn/tig-37/

Observed pattern:

Lucas Pope describes the book as a device intended to collect and organize the large amount of gameplay information, establish event chronology, show death details, and contain identity clues. A story-like book was selected as an implicitly useful information metaphor over shorter logs or a navigable timeline.

Disposition: **ADAPT**.

GRIMOIRE use:

- keep Grimoire as the human-readable causal record;
- organize result chronology and evidence layers;
- do not copy Obra Dinn's content, visual expression, identity puzzle, or assessment mechanics.

## Benchmark 3 · Chants of Sennaar — notebook supports deduction, not authorship

Primary/publisher source:

- https://www.focus-entmt.com/en/news/chants-of-sennaar-shows-its-details-in-a-gameplay-overview-and-offers-a-free-demo-to-all-players

Observed pattern:

The publisher describes the player as using a notebook while translating glyphs through observation, exploration, conversation, and deduction.

Disposition: **ADAPT**.

GRIMOIRE use:

- record evidence and contextual relationships;
- leave the final learned-principle wording to the player;
- avoid giving a prewritten correct-principle card as the answer.

## Benchmark 4 · Heaven's Vault — remembered interpretation remains uncertain

Primary developer sources:

- https://www.inklestudios.com/press/heavensvault/
- https://www.inklestudios.com/heavensvault/

Observed pattern:

- translation choices feed back into Aliya's ideas and story state;
- the game remembers chosen and unchosen paths;
- the official material explicitly preserves uncertainty about whether translations are correct.

Disposition: **REFERENCE / ADAPT BOUNDARY**.

GRIMOIRE use:

- preserve the player's authored principle as a record of current understanding;
- do not immediately certify that wording as objective truth or attach a hidden correctness score.

## Alternatives considered

### A · Layered Causal Debrief + Player Principle — SELECTED

`Five-Axis Result → Causal Thread → Cost/Forgone/Discovery → Player Principle Naming`.

Strengths:
- preserves mixed outcomes;
- uses existing receipts rather than new result authority;
- lowers information-wall risk through progressive disclosure;
- gives the player authorship only where authorship is valuable: the learned principle wording.

### B · Axis Dashboard + Auto Conclusion — NOT SELECTED

Fast and readable, but a system-authored conclusion risks becoming a canonical answer.

### C · Freeform Grimoire Reflection — NOT SELECTED

High authorship, but too much mobile keyboard/time burden and too hard to guarantee causal traceability in a five-minute first-session segment.

### D · Learned-Principle Cards — NOT SELECTED

Fast, but turns reflection back into choosing a correct-looking answer card.

## Existing Solution First result

No new result engine, grading system, morality score, route selector, journal database, or reward currency is required.

Reuse:

```text
AtomicResultLedger / existing result receipts
Frostbloom five-axis result contract
W6 actual consequence receipt
W7 context-delta + actual consequence receipt
existing Grimoire causal record fields
```

Add only a planning/content presentation contract for the 39–44 minute segment.

## Evidence ceiling

This research supports design-pattern selection only. It does not prove five-minute completion, mobile keyboard comfort, emotional resonance, causal comprehension, principle-name quality, or fun. Those remain Human/Device validation `NOT_RUN`.

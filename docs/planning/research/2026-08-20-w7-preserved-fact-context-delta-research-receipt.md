# W7 Preserved Fact + Context Delta — Fresh Research Receipt

```yaml
work_unit: FROSTBLOOM_W7_REVEAL_REDESIGN
research_date_kst: 2026-08-20
project_main_parent: 1cbba070bae27e6b6e2c0982f198f1cbe712b0ea
base_main_observed: 3cdb82f94af402fedcc9c1e80902d1d01b8d3ab3
scope: MINUTE_30_TO_39
research_gate: FRESH_FOR_THIS_WORK_UNIT
competitor_expression_copying: FORBIDDEN
```

## Work question

How should W7 reveal new context after W6 so that:

- W6's accepted real improvement remains true;
- the new information changes what the player should reason about next;
- W7 is a redesign, not a larger-number repeat;
- the reveal does not become a hidden wrong-answer correction or named route recommendation;
- the first-session information load remains bounded.

## Fresh benchmark sources

### Baba Is You — Hempuli official game page

Source: https://www.hempuli.com/gamelist/index.php?rule=id&ruleid=3

The official description states that the level rules exist as pushable blocks and that the player can modify what objects in the level mean/do. The reusable pattern is not Baba's puzzle syntax; it is that **a changed rule/context can alter the logic of the next solution**.

Disposition: `ADAPT`

Applied to W7:
- new coupling changes the relevant judgment structure;
- it does not retroactively erase an already-observed W6 improvement;
- copying rule-block expression, puzzle content, or terminology is forbidden.

### Chants of Sennaar — developer/publisher Steam description

Source: https://store.steampowered.com/app/1931770/Chants_of_Sennaar/

The Rundisc/Focus store description centers on observing, listening, deciphering languages, recording symbols, tracking surroundings, and using conversations/context to establish meaning. The reusable pattern is **separating observation from interpretation and updating meaning when context expands**.

Disposition: `ADAPT`

Applied to W7:
- the reveal UI separates `STILL_TRUE`, `NEWLY_LEARNED`, and `NEW_TENSION`;
- new information is shown as context, not as an authoritative correct spell/Target instruction;
- the player's redesign remains authored through existing FIVE_POINT_STAR + Target decisions.

### Outer Wilds — GDC 2021, Kelsey Beachum

Source: https://www.gdcvault.com/play/1027368/Independent-Games-Summit-Sparking-Curiosity

The GDC overview describes a design goal of player-determined progression motivated by curiosity rather than explicit mission direction. The reusable pattern is **new knowledge creating a reason for the player to redirect themselves instead of the UI prescribing the next move**.

Disposition: `ADAPT`

Applied to W7:
- deeper revision coupling creates a new question/tension;
- the system does not name a correct route, circuit, Target, or priority;
- W7 asks the player to decide how the newly learned context changes their design.

## Existing Solution First

Existing GRIMOIRE authorities already provide everything needed:

```text
GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
  FIRST_ACCEPTED_W6_RESULT_REMAINS_TRUE
  W7 must change meaningful judgment, not only magnitude

docs/testing/frostbloom_graybox/05_W6_REVEAL_W7_CONSEQUENCE_CASES.md
  three bounded W6 → new context → W7 cases

GM-SPELL-WORKFLOW-UI-V2-01
  Stage 2 circuit preparation/base preview
  Stage 3 Target/final preview/explicit atomic use

GM-FROSTBLOOM-W6-BOUNDED-CONSEQUENCE-FORECAST-01
  observed-evidence fairness
  Unknown cannot flip accepted W6 success
```

No new rule engine, reveal transaction, priority selector, route selector, mana authority, result ledger, or spell engine is required.

## Alternatives reviewed

| Option | Core structure | Disposition |
|---|---|---|
| A · Preserved Fact + Context Delta | W6 result anchor → deeper post-W6 coupling → Still True/Newly Learned/New Tension → redesign | `ADOPT` |
| B · Live Disturbance First | dramatic new disturbance before explanatory context | `AVOID_FOR_FIRST_SLICE` — reads like W6 was wrong |
| C · Archive Interpretation First | separate hypothesis/record puzzle before W7 | `DEFER` — adds cognitive/time burden |
| D · Dual-Objective Tradeoff | explicit named priority before redesign | `AVOID_FOR_NOW` — risks route-selector behavior |

## Decision synthesis

Adopt A with these boundaries:

```text
W6 actual result receipt
→ W6_RESULT_ANCHOR
→ one POST_W6_DEEPER_REVISION_COUPLING
→ STILL_TRUE / NEWLY_LEARNED / NEW_TENSION
→ player changes >=1 meaningful judgment dimension
→ existing Stage 2/3 redesign
→ explicit W7 Commit
→ W6 preserved fact remains true
```

The reveal must remain new whether `OLD_REPAIR_RECORD` was visited or omitted during 2-of-4 investigation. It is a deeper condition made observable by the post-W6 state change, not a replay or reward for one earlier node.

## Evidence ceiling

This receipt supports design pattern selection only. It does not establish actual nine-minute completion, player comprehension, emotional impact, device readability, performance, or fun. Those remain `NOT_RUN`.
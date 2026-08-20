# GR-SYNC-20260820-23 — First 10-Minute Class → Guided Practicum

```yaml
sync_id: GR-SYNC-20260820-23-FIRST-10MIN-CLASS-PRACTICUM
decision_id: GM-FROSTBLOOM-FIRST-10MIN-CLASS-PRACTICUM-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
work_mode: PLAN
date_kst: 2026-08-20
user_approved_core_invariant: FIRST_10_MIN_CLASS_TO_GUIDED_PRACTICUM
first_10_minute_target_minutes: 10
class_target_minutes_test_value: 5
guided_field_practicum_target_minutes_test_value: 5
product_runtime_mutation: NONE
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

## Fresh state

```yaml
base_main_observed: 3cdb82f94af402fedcc9c1e80902d1d01b8d3ab3
project_main_parent_observed: 293cde60ca19bfa6528b90807f7f4622037f2dd0
project_main_concurrent_observed: 5b51169130c97807234a0c2b457ed90dc3c04f3a
concurrent_change: BASE_REUSE_PROFILE_MANIFEST_ONLY
concurrent_product_canon_conflict: NONE_OBSERVED
open_work_pr: 140
red_contract_commit: 4a814ed3cdd79c15b9ff1fe7f6674663b82e20d7
```

Concurrent project main advanced by one commit adding `docs/base-reuse-adoption.json` and extending `tests/test_base_v9_adoption.py`. It explicitly did not change product runtime or canon. The first-10-minute work therefore continues without rewriting or modifying that completed concurrent work.

## User decision

The user approved this target:

> 수업 진행하고 현장실습 해보는 것까지를 10분 목표로 한다.

Interpretation locked for this work unit:

- by the first 10-minute target, the player has learned the first meaning grammar in class;
- the player has transferred it into a guided field context;
- the player has used a small FIVE_POINT_STAR and observed a real consequence;
- this does not require the full Frostbloom major W6 solution to happen by minute 10.

## Existing Solution First

Preserved and reused:

- W1 FLOW / W2 FOCUS / W3 DISPERSE;
- W4 contextual tool marking;
- existing FIVE_POINT_STAR authority;
- Stage 2 preview → Stage 3 explicit target/final preview/confirmation;
- exactly-once inventory/Mana/result transaction ownership;
- existing 46-minute Frostbloom structure after minute 14;
- W6/W7 two major incident commits;
- 2-of-4 investigation and five-dimensional Result/Grimoire.

Removed only as an independent early beat:

- `06–11 CAMPUS_MICRO_CRAFTING`.

Its bounded tool/context purpose is absorbed into W4 during the guided practicum; long-horizon crafting canon is not deleted.

## Fresh research disposition

- Apple `Onboarding for Games`: ADAPT short progressive tutorials, active role, quick self-directed play.
- Apple HIG `Onboarding` / `Designing for games`: ADAPT learn-by-doing and world-integrated playable onboarding.
- Roblox Creator Hub `Onboarding techniques`: ADAPT contextual just-in-time tutorial and reduced cognitive load.
- Chants of Sennaar: REFERENCE_ONLY / ADAPT context-driven glyph meaning and knowledge transfer.
- Hogwarts Legacy: REFERENCE_ONLY for market-readable student/class/spell-learning fantasy; no combat/content copying.

## Alternatives

1. **A 5+5 — TEST first**: equal class/practicum split; selected default.
2. **B 4+6 — fallback**: use if field choice/result needs more time and W1~W3 comprehension remains strong.
3. **C 6+4 — fallback**: use if writing/input burden makes five-minute class unrealistic.

All three preserve the user-approved 10-minute upper target. Split ratios are TEST_VALUE until Human evidence.

## TDD

RED was intentionally created first by extending `tests/test_frostbloom_internal_vertical_slice_contract.py` to require:

- child decision file;
- 10-minute target and 5+5 TEST_VALUE;
- `00–05 CLASS_SAFE_PRECEDENT`;
- `05–10 GUIDED_FIELD_PRACTICUM`;
- Micro FIVE_POINT_STAR actual application;
- first observable field consequence by minute 10;
- W6/W7 preservation;
- `CURRENT_CONFIRMED_DECISIONS.md` linkage.

GREEN implementation surface is planning-only:

- `docs/planning/FROSTBLOOM_FIRST_10_MIN_CLASS_PRACTICUM_01_APPROVAL_2026-08-20.md`
- `docs/testing/frostbloom_graybox/01_46_MINUTE_WALKTHROUGH.md`
- `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- this sync document
- existing Frostbloom planning contract test

No `src/`, Scene, Resource, asset, addon, `project.godot`, Task8 product branch, balance, or runtime behavior is authorized in this work unit.

## Adversarial loops

1. **Cognitive overload** — Micro-Star limited to Main 1 + Auxiliary 1 and contextual instructions only.
2. **Fake choice** — FOCUS/DISPERSE must both create understandable tradeoffs; no correct badge.
3. **Main-incident spoiler** — practicum context cannot expose Frostbloom investigation nodes or W6 solution.
4. **Writing fatigue** — 5+5 remains TEST_VALUE; if human/device evidence fails, adjust transition/explanation or ratio before adding content.
5. **Authority regression** — Micro-Star is non-major transfer proof and cannot replace W6/W7 or introduce duplicate transaction authority.

## Next gates

```text
planning exact-head CI
→ adversarial diff review
→ no unresolved review threads
→ fresh main/concurrency readback
→ merge if clean
→ merged-main readback
→ Notion Project Home / Flow / TASK-2 sync and destination readback
→ Human Slice later tests whether 10 minutes is real
```

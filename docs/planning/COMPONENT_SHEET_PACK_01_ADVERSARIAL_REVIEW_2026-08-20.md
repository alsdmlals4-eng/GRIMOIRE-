# Component Sheet Pack 01 — Adversarial Review Closure

Date: 2026-08-24
Scope: Component Sheets A–D and their reusable semantic UI components only.

## Authority and scope

- Reuse `GrimoireThemeFactory` as the single project token/theme authority.
- Reuse the existing `StarCircuitBoard`; do not introduce a second FIVE_POINT_STAR renderer or validator.
- Semantic UI remains a read-only presentation/composition layer. It does not own stock, Mana consumption, spell commit, gameplay mutation, or Task8.
- Runtime sample copy remains English-safe until the licensed Korean-font gate is satisfied.
- Human, Device, Performance, and Full Slice evidence remain `NOT_RUN` unless independently executed.

## Review history

A preliminary whole-candidate review found one valid completion defect: the Task 7 review/sync closure records required by the approved implementation plan were missing. The candidate was not treated as complete. A RED regression was added first; focused CI failed only on the missing closure record, proving the gap before this correction.

## Five-pass adversarial review contract

The final doc-complete candidate must pass all five loops on the same GitHub head. Any new valid finding resets the counter to 0/5.

### Loop 1 — Scope, reuse, and ownership

Check the complete diff against current `main`.

Required:
- no gameplay/stock/Mana/commit ownership mutation;
- no Task8 mutation;
- `GrimoireThemeFactory` remains the single token authority;
- `FivePointStarComposer` instances the existing `star_circuit_board.tscn`;
- no second validator/renderer is introduced.

### Loop 2 — Semantic truth and information boundaries

Required:
- `FOCUS != SELECTED` remains visually/semantically distinct;
- Forecast preserves `KNOWN_IMPROVEMENT`, `UNCERTAIN_CONSEQUENCE`, `FINAL_TARGET_SUCCESS_BREAKDOWN`, `MANA_COST`;
- Context Delta preserves `STILL_TRUE`, `NEWLY_LEARNED`, `NEW_TENSION`;
- Result Grimoire uses only FACILITY / LIFE / SPIRIT / RELATIONSHIP / DISCOVERY axes;
- no global grade, star score, recommended route, best route, or hidden-answer promotion.

### Loop 3 — Responsive and rendered evidence

Required:
- deterministic captures exist for A–D at 1920×1080 and 1280×720;
- critical controls remain visible at 1280×720;
- enabled interactive controls remain at least 48×48;
- no critical clipping or overlap in the captured minimum-PC layout;
- captured imagery is evidence for these component sheets only, not Full Slice evidence.

### Loop 4 — Current-main compatibility and collision

Required:
- feature head includes fresh current `main` without force rewrite;
- current-main Task8 / authority changes are preserved;
- no active unrelated PR is mutated;
- no overlapping current-main owner is silently replaced.

### Loop 5 — Evidence ceiling and delivery

Required:
- dedicated component workflow and normal repository checks are exact-head GREEN;
- review threads are resolved/empty;
- runtime copy remains English-safe;
- Human / Device / Performance / Full Slice remain `NOT_RUN`;
- Notion synchronization occurs only after merge and destination readback;
- main-push evidence is reported only if observable.

## Final gate semantics

`5/5 CLEAN` is the required final verdict for the same doc-complete candidate head. This phrase is a gate token, not permission to skip the five fresh checks. The PR body records the exact final head and exact-head workflow receipt after the checks complete.

## Evidence ceiling

- Automated Godot/component regression: may become PASS after exact-head CI.
- Deterministic 1920×1080 / 1280×720 capture generation: may become PASS after exact-head CI and artifact readback.
- Human visual validation: `NOT_RUN`.
- Physical Device validation: `NOT_RUN`.
- Performance validation: `NOT_RUN`.
- Full Slice validation: `NOT_RUN`.
- Korean runtime copy/font validation: `NOT_RUN`; sample scenes remain English-safe.

No static document or CI screenshot is allowed to promote those `NOT_RUN` classes.

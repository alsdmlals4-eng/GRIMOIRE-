# Task 8 Spell Use Screen Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:test-driven-development, systematic-debugging, and verification-before-completion. Persistent Godot authoring MUST use the project-authorized HiGodot/Godot AI executor.

**Goal:** Implement `TASK8_SPELL_USE_SCREEN` as the UI consumer of the already-merged Task 5 Stage 3 atomic target/use authority, without creating a second transaction authority or weakening exactly-once semantics.

**Architecture:** Reuse the existing `GM-SPELL-WORKFLOW-UI-V2-01` flow and the Task 5 transaction API as the only target/use commit authority. Match Task 6/7 screen conventions for visual/navigation structure, keep selection/preview mutation-free, and make explicit user confirmation the only route into the existing atomic use transaction. Task 9 remains owner of root coordination and the full responsive/E2E matrix.

**Tech Stack:** Godot 4.7.1, GDScript, GUT 9.7.1, HiGodot/Godot AI v3.1.3, Hera v1.0.0 live QA/observability, GitHub Actions.

## Global Constraints

- Current contract: `PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.5`, `GM-CONTRACT-V4-5-BINDING-01`.
- Product decision: `GM-SPELL-WORKFLOW-UI-V2-01`; no new product decision is introduced by Task 8.
- Current implementation state: `TASK7_MERGED_MAIN_VERIFIED`; next task: `TASK8_SPELL_USE_SCREEN`.
- Task 5 merge `275ba48eb9c07ce24d4b17b2c57de66c98923e1a` owns the Stage 3 explicit target/use atomic transaction.
- Task 8 MUST consume Task 5 authority; it MUST NOT duplicate target selection commit, Mana spending, result mutation, inventory consumption, save mutation, or exactly-once state transitions.
- Persistent `.gd`, `.tscn`, `.tres`, `.res`, and `project.godot` authoring: `SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY = HiGodot/Godot AI v3.1.3`.
- New persistent Task 8 authoring requires a fresh HiGodot authoring receipt/readback. Generated `.gd.uid` files are part of the protected delta when produced.
- GUT v9.7.1 remains `DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY`.
- Hera v1.0.0 remains `LIVE_QA_AND_OBSERVABILITY_ONLY`; persistent source mutation is forbidden and acceptance should report `HERA_SOURCE_DELTA: NONE`.
- Human/device/performance/full-vertical-slice/export evidence remains `NOT_RUN` unless new evidence is actually produced.
- Base current authority MUST be re-fetched before executor work; no Base SHA in this plan is permanent authority.
- Task 9, not Task 8, owns root coordinator/responsive system integration across all approved aspect classes.

---

### Task 1: Recover the exact Task 5/6/7 interfaces before authoring

**Files:** Read-only repository inspection first. No product mutation in this task.

**Interfaces:**
- Consumes: Task 5 Stage 3 transaction code/tests, Task 6 glyph-drawing screen, Task 7 circuit-placement screen, current `project.godot`, UI theme/resources.
- Produces: exact existing method/signal/node/resource names for Task 8. Do not invent replacements when an existing interface exists.

- [ ] Re-read current `main`, open PRs, current Sheet state, Task 5 merge/diff, Task 6/7 current files and tests.
- [ ] Identify the exact existing Stage 3 preview/target/use transaction entry points and failure/restore semantics.
- [ ] Identify Task 6/7 conventions for root Control, focus/navigation, screen inputs, status/summary cards, test helpers, and scene ownership.
- [ ] Record any interface ambiguity as `BLOCKED_UNVERIFIED`; do not create parallel state or a guessed API.

### Task 2: Write Task 8 GUT RED tests through HiGodot

**Files:** Exact test paths must follow the current Task 6/7 GUT layout discovered in Task 1.

**Required RED behaviors:**

- [ ] Opening the Spell Use screen performs **zero** Mana/inventory/result/world mutation.
- [ ] With no valid target selected, final confirm is unavailable/fail-closed and performs zero mutation.
- [ ] Selecting a valid target updates the expected-result preview using existing Stage 3 preview authority and performs zero mutation.
- [ ] Changing the selected target updates preview deterministically and does not consume the prepared spell.
- [ ] Explicit confirm calls the existing Task 5 atomic use authority exactly once.
- [ ] Double-tap/repeated confirm cannot spend Mana, consume inventory, or apply result twice.
- [ ] A stale/invalid target at confirmation fails closed with no partial transaction.
- [ ] Cancel/back before commit preserves the existing PreparedSpell/restore semantics; Task 8 must not define a new restore policy.
- [ ] Keyboard/gamepad focus activation and touch activation resolve through the same semantic confirm action.

Run the smallest relevant GUT command and verify the new tests fail for the intended missing Task 8 UI behavior before product implementation.

### Task 3: Author the minimum Spell Use Screen through HiGodot

**Files:** Exact product paths follow the Task 6/7 pattern recovered in Task 1. Do not create a new subsystem directory solely for Task 8.

**Required UI information hierarchy:**

```text
prepared spell summary
→ explicit target choices
→ selected target state
→ Mana/final cost visibility
→ expected-result preview
→ explicit confirm
→ cancel/back
```

**Behavior boundaries:**

- [ ] No hidden final auto-targeting.
- [ ] No Mana/inventory/result mutation on screen open, hover, focus, target browsing, or preview.
- [ ] Confirm stays disabled/fail-closed until the existing Stage 3 authority reports a confirmable selection.
- [ ] Final confirmation routes into the existing Task 5 atomic transaction; no duplicate transaction implementation.
- [ ] After success, disable/reject repeated commit attempts before navigation/result handling can race.
- [ ] Failure exposes the existing reason/state without partial local rollback logic that competes with Task 5.

### Task 4: Shared Windows/Android UI accessibility and input acceptance

**Implementation guidance:**

- Use Godot `Control`/`Button`-family semantics for menu actions and focus rather than a touch-only custom interaction path.
- On Android, interactive targets must meet the platform's minimum touch-target guidance in physical-equivalent sizing; do not equate `48dp` to an unverified fixed `48px` under arbitrary project scaling.
- Preserve visible focus for keyboard/gamepad navigation and one semantic action per confirm/cancel operation.
- Avoid fixed absolute layout assumptions that make Task 9 multi-aspect work impossible.
- Keep important controls inside safe layout regions; Task 9 will validate the full approved 16:9 / 18:9 / 19.5:9 / 20:9 / cutout / foldable / tablet matrix.

**Primary references:**
- Godot 4.7 `Control`: https://docs.godotengine.org/en/4.7/classes/class_control.html
- Godot 4.7 `Button`: https://docs.godotengine.org/en/4.7/classes/class_button.html
- Godot multiple resolutions: https://docs.godotengine.org/en/4.7/tutorials/rendering/multiple_resolutions.html
- Android accessibility/touch targets: https://developer.android.com/guide/topics/ui/accessibility/apps

### Task 5: HiGodot receipt and deterministic GREEN

- [ ] Generate a fresh Task 8 HiGodot authoring receipt covering every protected persistent file changed by the authorized authoring session, including generated `.gd.uid` where applicable.
- [ ] Read back receipt completeness against the exact protected delta.
- [ ] Run the focused new GUT tests to GREEN.
- [ ] Run the existing Spell Workflow regression suite and applicable project CI.
- [ ] Run Hera acceptance/observability and require `HERA_SOURCE_DELTA: NONE`.
- [ ] Do not claim device/performance/human/export evidence from Editor/CI-only results.

### Task 6: Adversarial review and merge gate

Attack these failure assumptions before merge:

```text
screen created a second target/use authority
preview mutates Mana/inventory/result
first target is silently auto-confirmed
confirm can be double-fired
target becomes stale between preview and commit
cancel/back invents a new restore policy
screen is touch-only and loses PC focus navigation
Task8 hardcodes one aspect ratio and blocks Task9 responsive work
receipt misses generated/protected files
Hera or test tooling mutated persistent product source
human/device/performance claims were promoted without evidence
```

Required merge evidence:

```yaml
exact_head_unchanged: true
all_applicable_ci_success: true
focused_gut_green: true
spell_workflow_regression_green: true
higodot_fresh_receipt_readback: PASS
hera_source_delta: NONE
unresolved_review_threads: 0
P0: 0
P1: 0
product_decision_changed: false
```

### Task 7: Post-merge current-state and Sheet synchronization

After verified merge:

- [ ] Re-read new GitHub `main`.
- [ ] Promote Task 8 merged status and Task 9 next status only after merged-main readback.
- [ ] Synchronize GitHub canon and Google Sheet with the same product Decision ID `GM-SPELL-WORKFLOW-UI-V2-01` and the Task 8 implementation sync/checkpoint ID created by the executor.
- [ ] Keep human/device/performance/export/full-slice states unchanged unless real new evidence exists.
- [ ] Run post-merge adversarial review for stale Task 7/Task 8-next consumers.

## Benchmark disposition

- **ADAPT — Godot Control/Button focus model:** share semantic actions across touch and desktop focus/navigation; do not create a second touch-only UI architecture.
- **ADOPT — Android minimum touch-target principle:** protect physical usability, but implement through verified project scaling rather than a magic pixel constant.
- **ADAPT — Noita / Potion Craft / Opus Magnum interaction lessons already recorded in project audit:** preserve player-owned composition and visible causality, but do not copy their mechanics or turn Task 8 into a new crafting minigame.
- **REJECT — new product-direction changes in this task:** Task 8 is implementation of the already-approved three-stage Spell Workflow, not a redesign gate.

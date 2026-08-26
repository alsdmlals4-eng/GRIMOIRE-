# First-Session Environment Scene Contract Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Define the three reusable first-session environment image consumers before any IMG-02 image generation or Godot scene implementation.

**Architecture:** A planning-only contract assigns one background asset to the academy class family, one to the field/investigation family, and one to the battle family. Runtime states change through live UI, lighting, materials, and VFX rather than duplicate background images; the document deliberately creates no Godot Scene, Resource, or gameplay behavior.

**Tech Stack:** Markdown, JSON, Python `json.tool`, existing Frostbloom first-session planning canon.

**Spec:** `docs/planning/FROSTBLOOM_FIRST_10_MIN_CLASS_PRACTICUM_01_APPROVAL_2026-08-20.md`

## Global Constraints

- Preserve `ART-STYLE-01 · Soft Storybook Cel 2D Hybrid` and the `글자 → 주문 → 대상 → 시전` player-facing flow.
- Define exactly three IMG-02 background asset IDs: `bg_school_common`, `bg_greenhouse_field_base`, and `bg_greenhouse_battle_arena`.
- Do not create images, Godot product scenes, Task8 code, raster UI text, auto-targeting, auto-casting, or a best-route signal.
- The guided practicum remains a low-risk independent context and must not reveal Frostbloom’s target, circuit, or ending.
- Image generation stays gated: contract and brief → explicit user generation approval → exactly one result → stop.
- Human, device, performance, and full-slice validation remain `NOT_RUN`.

---

### Task 1: Lock the environment-consumer contract

**Files:**
- Create: `docs/planning/visual/FROSTBLOOM_FIRST_SESSION_ENVIRONMENT_SCENE_CONTRACT_2026-08-26.md`

**Interfaces:**
- Consumes: first-10-minute class/practicum approval and IMG-02 queue IDs.
- Produces: a human-readable consumer mapping that assigns four first-session scene states to three background asset IDs and preserves the information guard.

- [ ] **Step 1: Write the consumer mapping**

Record the following exact state-to-asset relations:

```text
CLASS_SAFE_PRECEDENT → bg_school_common
GUIDED_FIELD_PRACTICUM → bg_greenhouse_field_base
GREENHOUSE_INVESTIGATION_RETURN → bg_greenhouse_field_base
GREENHOUSE_BATTLE → bg_greenhouse_battle_arena
```

- [ ] **Step 2: State the visual and implementation boundaries**

For each state, define player promise, allowed live overlays, prohibited baked image content, entry/exit role, and whether a new base background is permitted. Explicitly prohibit Frostbloom target/circuit/ending leakage from the guided practicum.

- [ ] **Step 3: Verify the source documents remain parseable and unchanged**

Run: `python -m json.tool docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json > $null`

Expected: exit status `0`; this task does not modify the queue yet.

- [ ] **Step 4: Commit the planning contract**

```bash
git add docs/planning/visual/FROSTBLOOM_FIRST_SESSION_ENVIRONMENT_SCENE_CONTRACT_2026-08-26.md
git commit -m "docs(art): define first-session environment consumers"
```

### Task 2: Attach IMG-02 to the approved consumer contract

**Files:**
- Modify: `docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json`

**Interfaces:**
- Consumes: the committed environment contract.
- Produces: IMG-02 `CONSUMER_SCENE_CONTRACT_DEFINED` with a link to the contract and a next gate requiring its image brief.

- [ ] **Step 1: Update only IMG-02’s consumer fields**

Set `consumer_contract` to `docs/planning/visual/FROSTBLOOM_FIRST_SESSION_ENVIRONMENT_SCENE_CONTRACT_2026-08-26.md`, set `status` to `CONSUMER_SCENE_CONTRACT_DEFINED`, and set `next_gate` to `PRESENT_BG_SCHOOL_COMMON_TEXT_BRIEF_THEN_STOP_FOR_EXPLICIT_GENERATION_APPROVAL`. Do not alter IMG-01 evidence or any later Goal.

- [ ] **Step 2: Validate the updated queue as JSON**

Run: `python -m json.tool docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json > $null`

Expected: exit status `0`.

- [ ] **Step 3: Commit the queue update**

```bash
git add docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json
git commit -m "docs(art): connect IMG-02 environment contract"
```

### Task 3: Verify planning boundaries and hand off the first brief

**Files:**
- Verify: `docs/planning/visual/FROSTBLOOM_FIRST_SESSION_ENVIRONMENT_SCENE_CONTRACT_2026-08-26.md`
- Verify: `docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json`
- Verify: `tests/test_frostbloom_internal_vertical_slice_contract.py`
- Verify: `tests/test_frostbloom_first_session_handoff_buffer_contract.py`

**Interfaces:**
- Consumes: the completed planning contract and IMG-02 queue record.
- Produces: evidence that no image or product implementation was falsely claimed, plus a single next image Brief for user approval.

- [ ] **Step 1: Run first-session regression tests**

Run: `python -m unittest tests.test_frostbloom_internal_vertical_slice_contract tests.test_frostbloom_first_session_handoff_buffer_contract -v`

Expected: all tests pass.

- [ ] **Step 2: Run generated operating-view verification**

Run: `python tools/generate_project_operating_views.py --check`

Expected: exit status `0`.

- [ ] **Step 3: Review the changed-file diff**

Run: `git diff origin/main -- docs/planning/visual`

Expected: only the environment contract and the IMG-02 queue fields change.

- [ ] **Step 4: Present the `bg_school_common` text brief and stop**

State that the contract is defined but no image is generated. Wait for a new explicit user instruction to generate exactly one candidate.

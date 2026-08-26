# GR-SYNC-20260826-39 · GPT Work Image Goal Handoff

```yaml
sync_id: GR-SYNC-20260826-39-GPT-WORK-IMAGE-GOAL-HANDOFF
handoff_id: GR-WORK-HANDOFF-20260826-01
project: GRIMOIRE
scope: VISUAL_IMAGE_GOAL_HANDOFF_TO_CHATGPT_WORK
source_project_main: 27749d2b3a552193283182143fe772e18f0ef45f
source_base_main: 06669fe9c6a3ccd6f3b0d19c5757540bfdcc0623
open_pr_readback: "#166 draft README-only unrelated/read-only"
google_sheet: MIGRATION_ONLY_NO_NEW_CANON_WRITE
image_generation: NOT_AUTHORIZED_BY_HANDOFF
godot_implementation: NOT_AUTHORIZED_BY_HANDOFF
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: NOT_RUN
```

## Purpose

Move the current GRIMOIRE image-planning continuation into ChatGPT Work without treating chat memory as canon and without converting explanatory/reference visuals into production assets.

## Fresh-read observations

- GRIMOIRE latest completed `main` remained `27749d2b3a552193283182143fe772e18f0ef45f` at handoff start.
- Open PR set contained Draft PR #166 only; it remains unrelated/read-only.
- Base latest completed `main` was `06669fe9c6a3ccd6f3b0d19c5757540bfdcc0623`, whose latest Work/memory rule keeps persistent memory below project canon and requires fresh project readback.
- Google Sheet `71_이미지기획_생성목록` still contains historical image-planning rows and remains migration-only.
- Notion Home still exposes `글자 → 주문 → 대상 → 시전` and the current Visual lock.

## Handoff artifacts

- `docs/planning/GRIMOIRE_GPT_WORK_IMAGE_GOAL_HANDOFF_2026-08-26.md`
- `docs/planning/visual/GRIMOIRE_IMAGE_GOAL_QUEUE_2026-08-26.json`
- Notion `GRIMOIRE · GPT Work Image Goal Handoff · 2026-08-26`
- Notion `Runtime Image Consumer Checklist · 2026-08-26` updated to point to the Work handoff and the six-glyph Slice runtime set.

## Glyph correction

Existing `GM-VISUAL-PRODUCTION-CHECKLIST-20260826-01` preserved a three-glyph Asset-Spec history (`FLOW / FOCUS / DISPERSE`). The current Slice runtime vocabulary and actual Task6/Task7 consumers require six glyphs:

```text
HEAT / PROTECT / FLOW / FOCUS / DISPERSE / BURST
```

The user explicitly approved proceeding on this six-glyph runtime basis. The new Image Goal Queue carries this correction without deleting historical provenance.

## Current Goal Queue

```text
IMG-01 P0 Slice Magic Glyph Runtime Set
IMG-02 P1 First-Session Environment Base Pack
IMG-03 P1 Frostbloom Environment State Pack
IMG-04 P1 Maren Dialogue Portrait Pack
IMG-05 P1 Protagonist Portrait Pack
IMG-06 P1 Greenhouse Spirit Combat Pack
IMG-07 P1 Main Companion Initial Runtime Pack
IMG-08 P1 Field SD Character Pack
IMG-09 P2 Main/Title Runtime Pack
IMG-10 P3 Store Key Art
```

## Immediate next action

`IMG-01` only.

```text
fresh consumer read
→ exact Task6/Task7 glyph visual slot/path/manifest contract
→ six-glyph text brief
→ STOP
→ explicit user generation approval
```

No image is generated and no Godot/Task8 product code is modified by this sync.

## Sync state

`PR_PENDING_AT_DOCUMENT_CREATION`.

After merge, read back exact `main`, update the Notion handoff/Home pointer, and do not upgrade any runtime/Human/device evidence beyond what was actually observed.

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

## Creation-time sync state

`PR_PENDING_AT_DOCUMENT_CREATION` was the historical state when this receipt was first written. It is not the current state.

## Closeout Readback

```yaml
handoff_pr: 175
handoff_pr_title: "docs: hand off image goals to ChatGPT Work"
handoff_pr_exact_head: fb53bd4e76688ec968fac28577d7cab4d51b030d
handoff_merge_sha: 56fc578db4ee41ec45bf164ee78a8f0656a17247
pr_exact_head_workflows: "7 SUCCESS + 1 conditional SKIPPED"
merged_main_push_workflows: "4/4 SUCCESS"
notion_runtime_consumer_checklist: "six-glyph Slice set read back"
image_generation: NOT_AUTHORIZED_BY_HANDOFF
godot_implementation: NOT_AUTHORIZED_BY_HANDOFF
current_work_resume_goal: IMG-01
sync_state: SYNCED_TO_HANDOFF_MERGE_AWAITING_RECEIPT_CLOSEOUT_MERGE
```

This receipt-only closeout does not change the Image Goal queue, gameplay design, product implementation, or evidence ceiling. After this closeout itself merges, the exact repository `main` may advance beyond `handoff_merge_sha`; Notion/System records should use that final exact main SHA while preserving `56fc578...` as the decision/handoff merge provenance.

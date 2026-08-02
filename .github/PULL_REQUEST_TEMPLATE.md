## Decision / Sync Scope

- Decision ID(s):
- Sync ID:
- Grill Me batch count before → after:
- Merge trigger: `COUNTER_REACHES_10 / EXPLICIT_USER_MERGE_REQUEST / GATE_OR_IMPLEMENTATION_BOUNDARY / P0_P1_CANON_SAFETY_FIX / WORK_HANDOFF_FLUSH`
- Authority document(s):
- Google Sheet range(s):

## Summary

- 

## Protected Scope

- [ ] No unapproved product code, Godot Scene/Script/Resource, game data, or locked Asset change.
- [ ] `PLANNING_ONLY_PROFILE`, `implementation: NOT_STARTED`, and `codex: BLOCKED` remain unless explicitly approved otherwise.
- [ ] Test values and `NOT_RUN` states are not presented as validated final values.

## Working-Branch Canon Sync

- [ ] GitHub authority commit recorded.
- [ ] Google Sheet updated with the same Decision ID.
- [ ] GitHub and Sheet target ranges read back.
- [ ] Status is `SYNCED_TO_WORKING_BRANCH`, not prematurely `SYNCED_TO_MAIN`.
- [ ] `GRILL_ME_BATCH_MERGE_STATE.json` count and pending IDs are current.

## Mandatory Pre-Merge Audit

Reference: `docs/planning/PRE_MERGE_ADVERSARIAL_REVIEW_CHECKLIST_2026-08-02.md`

### GitHub

- [ ] Latest main SHA and merge-base checked.
- [ ] Open, stale, duplicate, and unmerged approved PRs checked.
- [ ] All changed files inspected; scope creep is zero.
- [ ] Authority paths, Current Decisions, cold-start, Gate, Registry, and Adapter checked.
- [ ] Generator check and all JSON parsing pass.
- [ ] Stale `TODO/TBD/placeholder` and superseded-state search completed.

### Google Sheet

- [ ] `00`, `01`, `02`, domain tabs, `04`, and `99` checked.
- [ ] Decision values, paths, SHAs, status, and next Gate match GitHub.
- [ ] Sheet write Readback passes.

### PR

- [ ] PR title/body describe the actual scope.
- [ ] Final head SHA is the SHA that passed verification.
- [ ] Mergeable.
- [ ] CI Gate passes.
- [ ] Adversarial Gate passes.
- [ ] No unresolved review threads or requested changes.

## Adversarial Verdict

- Verdict: `PASS / PASS_WITH_DECLARED_P2_P3 / BLOCK_P0_P1 / SYNC_CONFLICT / CI_FAILED / REVIEW_BLOCKED`
- P0 findings:
- P1 findings:
- Declared P2/P3:
- Corrections applied:

## Merge / Post-Merge

- [ ] User approval or policy merge trigger confirmed.
- [ ] Squash merge performed with expected final head SHA.
- [ ] Merge main SHA recorded.
- [ ] Main files re-read.
- [ ] Sheet main SHA updated and `MAIN_SHEET_READBACK_PASS` confirmed.
- [ ] Cold-start/main-sync propagation completed when needed.
- [ ] Batch counter reset only after final `SYNCED_TO_MAIN`.

## Remaining NOT_RUN

- Runtime:
- Device / Aspect:
- Performance / Battery / Thermal:
- Accessibility:
- Human playtest:

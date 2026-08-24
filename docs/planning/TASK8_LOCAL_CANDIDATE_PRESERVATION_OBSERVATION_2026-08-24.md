# GRIMOIRE Task8 Local Candidate Preservation Observation — 2026-08-24

```yaml
status: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
preservation_status: TASK8_CANDIDATES_PRESERVED
source_unchanged: true
source_content_unchanged: true
snapshot_root: C:\GRIMOIRE-Task8-Recovery\task8-preservation-20260824T100804144Z-e9e7eb66
primary_role: primary_v2
primary_branch: feat/task8-spell-use-screen-v2
primary_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
primary_manifest: primary_v2/manifest.json
primary_copied_file_count: 11
secondary_role: secondary_original
secondary_branch: task8/spell-use-screen
secondary_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
secondary_manifest: secondary_original/manifest.json
secondary_copied_file_count: 33
next_gate: TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
product_state: UNMERGED
fresh_higodot_reconciliation: NOT_RUN
fresh_task8_tests: NOT_RUN
human_device_performance_export_full_slice: NOT_RUN
```

## Direct user-machine receipt

The user executed the merged preservation tool from project main `ceb219c5acf2828edb37925c38f28106d0d99363` and returned the complete JSON receipt. The tool reported both exact historical Task8 identities, `source_unchanged: true`, and `source_content_unchanged: true`.

This closes the local candidate-preservation gate. It does **not** promote Task8 product compatibility, HiGodot readiness, tests, runtime, device, human, performance, export, or full-slice evidence.

## Preserved candidates

Primary recovery source:

```yaml
role: primary_v2
branch: feat/task8-spell-use-screen-v2
head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
copied_file_count: 11
```

Secondary/reference source:

```yaml
role: secondary_original
branch: task8/spell-use-screen
head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
copied_file_count: 33
```

Both historical worktrees remain frozen recovery evidence. Do not pull, rebase, clean, reset, restore, stash, or merge either worktree wholesale.

## Next execution gate

```text
TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
→ verify external preservation manifests
→ fetch origin only after preservation is proven
→ require explicit exact origin/main SHA
→ create a new branch/worktree from that exact origin/main
→ verify the new worktree is clean and contains project.godot
→ fresh exact-project HiGodot readback
→ reconcile primary v2 first, secondary only for parity evidence
→ fresh focused Task8 GUT + predecessor/full runner + Hera source-delta + adversarial review
→ Task8 product PR
```

The ordinary checkout does not need to be pulled or rewritten to start reconciliation. A separate clean current-main worktree is the preferred path because it minimizes risk to the preserved historical worktrees.

## Google Sheet drift note

Fresh 2026-08-24 Sheet readback still presents older v4.5-era/current-main/Task8 states as if current. Under v4.8, Google Sheets is migration-only and receives no new canon writes. The current authority is GitHub + Notion + actual runtime evidence; the Sheet drift is retained only as audit evidence.

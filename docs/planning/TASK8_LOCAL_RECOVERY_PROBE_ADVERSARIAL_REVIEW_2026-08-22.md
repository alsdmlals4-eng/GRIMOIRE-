# Task8 Local Recovery Probe — Five-Pass Adversarial Review

```yaml
work_unit: TASK8_LOCAL_RECOVERY_PROBE
source_main: 935da4afe89478d9aff07a85325ef006059e1575
base_live_main_observed: aadd7aea74cb609d012fc70cc976d4bbcb794e39
pull_request: 154
product_paths_changed: false
parallel_pr_151: DO_NOT_TOUCH
local_machine_probe_execution: NOT_RUN
review_status: FIVE_PASS_COMPLETE_FINAL_EXACT_HEAD_CI_PENDING
p0_open: 0
p1_open: 0
```

## Round 1 — Mutation risk

**Attack:** A command described as read-only can still cause optional Git index refresh/lock activity. The first implementation used ordinary `git status --short --branch` and did not explicitly suppress optional locks.

**Finding:** `IMPORTANT` — logical content was not intentionally changed, but the probe contract promised read-only behavior more strongly than the implementation proved.

**Correction:** Set process-local `GIT_OPTIONAL_LOCKS=0`. The synthetic worktree regression captures main-worktree and linked-worktree index bytes before execution and requires byte-for-byte equality afterward, in addition to unchanged refs and porcelain status.

**Result:** PASS after correction.

## Round 2 — False-negative / executor-shape robustness

**Attack:** What happens with zero or one changed path, a missing historical baseline object, a partially broken worktree, or a renamed/moved Task8 worktree?

**Findings:**

1. `IMPORTANT` — PowerShell output unrolling converted one-element path arrays into scalars. Under StrictMode, `.Count` failed. This was reproduced by the synthetic one-file Spell Use fixture.
2. `IMPORTANT` — missing baseline-object probing could surface as a native-command error under strict error handling.
3. `MINOR` — historical branch/path matching alone could miss a moved/renamed worktree.

**Corrections:**

- explicitly array-wrap every Git path/log output and every count operation;
- treat historical baseline absence as a valid `baseline_object_available=false` state;
- give inspection error entries the same schema as successful inspections;
- add conservative working/cached/untracked `task8` / `spell_use` signal-path detection.

**Result:** PASS after correction, pending final exact-head CI.

## Round 3 — Evidence inflation

**Attack:** Could a successful probe be misread as Task8 recovered, tested, merged, or product-ready?

**Controls:**

- output state is `LOCAL_TASK8_EVIDENCE_FOUND_REVIEW_REQUIRED`, not PASS;
- no remote branch/PR/merge claim is created;
- historical `15/90`, `42/1588`, and Hera NONE remain historical only;
- current overlay explicitly requires fresh HiGodot/GUT/Hera/adversarial checks before any Git write;
- Human/Device/Performance/Full Vertical Slice remain NOT_RUN.

**Result:** PASS.

## Round 4 — Parallel/user-work protection

**Attack:** Could the probe or packet adopt unrelated local changes, alter PR #151, or force the historical nine-path count?

**Controls:**

- probe only inventories; it never stages or writes product files;
- no `fetch/reset/restore/clean/stash/add/commit/merge/rebase/cherry-pick/checkout/switch` commands exist in the probe;
- no report file is written inside the repository;
- current packet keeps PR #151 `DO_NOT_TOUCH`;
- the historical nine-path filename list is not invented; discovered paths must be explicit and classified;
- PR #154 changed paths are operations/docs/tests only and are checked against PR #151 before merge.

**Result:** PASS.

## Round 5 — Completion / destination freshness semantics

**Attack:** Could merging this tooling PR incorrectly close `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`?

**Base check:** Fresh Base main includes the completion/destination-freshness gate. It distinguishes readiness from completion and requires destination readback for a completion claim. Existing projects are not bulk-migrated solely because that Base contract exists.

**Disposition:**

- this PR may complete only the **probe tooling work unit** after exact-head CI, merge, merged-main readback, and bounded Notion readback;
- actual local-machine probe execution remains `NOT_RUN` until run on the user's GRIMOIRE checkout;
- therefore the Task8 parent/subgate remains open after this PR merges;
- no new broad Loop Capsule migration is introduced here.

**Result:** PASS.

## Final review disposition

```yaml
mutation_risk: PASS_AFTER_CORRECTION
false_negative_robustness: PASS_AFTER_CORRECTION
evidence_inflation: PASS
parallel_user_work_protection: PASS
completion_semantics: PASS
p0_open: 0
p1_open: 0
merge_gate: FINAL_EXACT_HEAD_CI_MAIN_STABILITY_REVIEW_THREADS_PATH_OVERLAP
```

# Task8 TEMP Bootstrap — Five-Pass Adversarial Review

```yaml
work_unit: TASK8_TEMP_BOOTSTRAP
source_main: 15139d80ab7112ea93e5090eece9cc145ae80f6b
pull_request: 155
bootstrap_source_commit: 15139d80ab7112ea93e5090eece9cc145ae80f6b
bootstrap_destination: OS_TEMP_ONLY
repository_sync_before_probe: FORBIDDEN
actual_user_machine_probe_execution: NOT_RUN
parallel_pr_151: DO_NOT_TOUCH
review_status: FIVE_PASS_COMPLETE_FINAL_EXACT_HEAD_CI_PENDING
p0_open: 0
p1_open: 0
```

## Round 1 — Repository mutation before evidence capture

**Attack:** If the local checkout does not yet contain the merged probe, telling the executor to pull/fetch first could alter Git metadata or interact with the only surviving uncommitted Task8 worktree before inventory.

**Correction:** Prefer an exact-commit probe copy downloaded to `$env:TEMP`. The packet explicitly forbids fetch, pull, checkout, switch, reset, restore, clean, or stash before the probe.

**Result:** PASS.

## Round 2 — Supply/source drift

**Attack:** A moving `main` raw URL could silently change the script after review.

**Control:** The bootstrap URL is pinned to merge commit `15139d80ab7112ea93e5090eece9cc145ae80f6b`, not `main`. Fresh GitHub readback confirms `tools/task8_local_recovery_probe.ps1` exists at that exact commit with blob `78477cce3b8ea1e3fe7d806fd7df4b72545a3c94`.

**Limit:** No separate local SHA-256 verification is claimed. Exact Git commit pinning is the source identity used by this bootstrap.

**Result:** PASS.

## Round 3 — Failure-path safety

**Attack:** What happens if the raw download is blocked or unavailable?

**Control:** `Invoke-WebRequest` uses `-ErrorAction Stop`. The packet requires the executor to stop at download failure and explicitly forbids using repository fetch/pull merely to obtain the probe.

**Result:** PASS.

## Round 4 — Evidence inflation / completion semantics

**Attack:** Could availability of the bootstrap be misreported as execution of the local recovery gate?

**Control:** The packet and PR keep `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED` open and state `actual user-machine probe execution NOT_RUN`. Probe availability, synthetic verification, and actual user-PC observation remain separate evidence classes.

**Result:** PASS.

## Round 5 — Parallel/user-work protection

**Attack:** Could the bootstrap touch the active Component Sheet PR #151 or unrelated local work?

**Control:** The bootstrap writes only a commit-specific `.ps1` copy under `$env:TEMP`; the probe itself is read-only, runs with `GIT_OPTIONAL_LOCKS=0`, and has executable regression proof that refs, porcelain status, and both main/linked-worktree index bytes remain unchanged. PR #151 stays `DO_NOT_TOUCH`.

**Result:** PASS.

## Final disposition

```yaml
repo_mutation_before_probe: PASS
source_identity: PASS_EXACT_GIT_COMMIT_PIN
failure_path: PASS_FAIL_CLOSED
evidence_inflation: PASS
parallel_user_work_protection: PASS
p0_open: 0
p1_open: 0
merge_gate: FINAL_EXACT_HEAD_CI_MAIN_STABILITY_REVIEW_THREADS_PATH_OVERLAP
```

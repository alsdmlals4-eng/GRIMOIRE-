# Task8 Local Recovery Probe — RED Target

```yaml
status: RED_EXPECTED
project_main_source: 935da4afe89478d9aff07a85325ef006059e1575
base_live_main_observed: aadd7aea74cb609d012fc70cc976d4bbcb794e39
parent_gate: TASK8_PR_PREP_REVERIFY_PENDING
execution_subgate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
probe_path: tools/task8_local_recovery_probe.ps1
focused_contract: tests/test_task8_local_recovery_probe_contract.py
product_paths_changed: false
parallel_pr_151: DO_NOT_TOUCH
```

The first CI run is expected to fail because the probe file does not exist yet and the existing recovery packet does not yet route to it. Existing Spell Workflow / Sync21 / Task8 remote-local reverify tests must remain green.

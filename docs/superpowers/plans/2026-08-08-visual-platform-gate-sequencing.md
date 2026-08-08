# Visual / Platform Gate Sequencing and Shared-Core Validation Plan

```yaml
approved_scope:
  - VISUAL_AUDIO_AND_THREE_SCREEN_RUNTIME_REVIEW
  - WINDOWS_ANDROID_SHARED_CORE_VALIDATION
decision_owner: GM-SPELL-WORKFLOW-UI-V2-01
base_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.4
baseline_main: 5ca877a392373211c0fc397e815310f26bb80c02
base_release_pin: 9.4.3
base_latest_main_observed_at_entry: a912cc001ff4d4e3415fb4b4931723c49eb08d9a
status: APPROVED_IMPLEMENTATION_PLAN
```

## Goal

Remove the circular gate that treats three-screen runtime evidence as a prerequisite for Task 2 even though the approved Spell Workflow UI v2 implementation plan creates that evidence only after Tasks 2–9, and validate the existing Windows/Android one-core architecture without claiming exports, devices, audio rights, or human review that have not run.

## Authority boundaries

- `GM-SPELL-WORKFLOW-UI-V2-01` remains the product/workflow decision owner.
- `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` and `FIVE_POINT_STAR` remain preserved runtime authority.
- HiGodot remains the sole persistent Godot authoring authority.
- GUT remains deterministic GDScript test authority.
- Hera remains `LIVE_QA_AND_OBSERVABILITY_ONLY` and may not persistently mutate source.
- This package changes contracts, validation, workflows, canon, and PR metadata only. It does not author `.gd`, `.tscn`, `.tres`, `project.godot`, or other persistent Godot product sources.

## Package A — Gate sequencing correction

### RED contract

Add `tests/test_visual_platform_gate_sequencing.py` that requires current canon to distinguish:

- `SPELL_WORKFLOW_THREE_SCREEN_RUNTIME_POST_IMPLEMENTATION_ACCEPTANCE`
- `THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9`
- `VISUAL_AUTOMATED_LAYOUT_BASELINE_PASS`
- audio/path/rights/device/human limitations remain explicit
- Task 2 is not blocked by a runtime artifact that the approved plan only creates in Tasks 9–10

The test must still forbid a false claim that visual/audio completion or three-screen runtime has already passed.

### GREEN change

Reconcile `START_HERE.md`, `docs/ACTIVE_CONTEXT.md`, `docs/DEVELOPMENT_GATES.md`, `docs/planning/CURRENT_UNRESOLVED_GATES.md`, `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`, and machine-state canon so the gate order matches the approved implementation plan.

Task 2 may become `READY_FOR_HIGODOT_AUTHORING` only after the independent shared-core structural gate below passes. This is readiness, not proof that Task 2 product implementation has occurred.

## Package B — Windows/Android shared-core structural validation

### RED contract

The same focused contract requires a durable evidence record at `docs/validation/WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL.json` and a dedicated workflow.

### Structural pass criteria

- Shared gameplay/data/save/deterministic logic remains under `src/core`.
- `src/core/**/*.gd` has no direct Windows/Android/store/platform API ownership.
- `project.godot` retains one shared main project, Godot 4.7, GL Compatibility, 1280×720, `canvas_items`, landscape orientation, and mobile GL Compatibility renderer.
- `src/ui/mobile_safe_root.gd` is a UI/layout adapter and its integration test covers 1280×720 through ultrawide resolutions, safe insets, 48dp minimum controls, and 130% text scale without converting that automated result into a physical-device claim.
- The dedicated workflow runs the focused Python contract on hosted Windows and Ubuntu so the same repository/core contract is evaluated on both host OS families.
- No `export_presets.cfg` exists at baseline; therefore Windows export and Android export/device execution remain explicitly `NOT_RUN`.

### Allowed conclusion

`WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS`

This closes only `WINDOWS_ANDROID_SHARED_CORE_NOT_VALIDATED` as a structural architecture blocker. It does not imply:

- `WINDOWS_EXPORT_PASS`
- `ANDROID_EXPORT_PASS`
- Android physical-device PASS
- performance/thermal PASS
- store/account readiness
- local merged-main Project Play

## Review and merge gate

- RED must fail for the newly required evidence/canon tokens before GREEN changes.
- Exact-head focused workflow plus all applicable existing workflows must pass.
- Static review P0/P1 = 0.
- No protected Godot product file changes.
- Review threads = 0.
- Merge with exact expected head under inherited approval authority.
- After merged-main readback, synchronize Google Sheet under `GM-SPELL-WORKFLOW-UI-V2-01` and read it back before marking Sheet PASS.

## Post-merge state target

```yaml
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
three_screen_runtime: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
three_screen_runtime_gate_role: POST_IMPLEMENTATION_ACCEPTANCE
visual_automated_layout_baseline: PASS
audio_vault: AUDIO_VAULT_PATH_UNVERIFIED
audio_rights: AUDIO_RIGHTS_UNVERIFIED
visual_audio_complete: false
spell_workflow_task2: READY_FOR_HIGODOT_AUTHORING
spell_workflow_task2_implemented: false
```

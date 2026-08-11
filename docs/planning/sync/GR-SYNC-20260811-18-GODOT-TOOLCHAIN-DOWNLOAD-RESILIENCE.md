# GR-SYNC-20260811-18 — Godot 4.7.1 Toolchain Download Resilience

```yaml
sync_id: GR-SYNC-20260811-18-GODOT-TOOLCHAIN-DOWNLOAD-RESILIENCE
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
status: IMPLEMENTED_PENDING_EXACT_HEAD_MERGE_GATE
scope: CI_TOOLCHAIN_RESILIENCE_ONLY
base_main_observed: 069f0c9654a6cde7cea6f3343dd2fa81c6248d5d
project_main_observed: 821ad1255ebc620e1a9e14a1e27bc2af1844de4b
triggering_pr: 128
implementation_pr: 129
persistent_godot_source_mutation: NONE
product_decision_changed: false
```

## Why this work unit exists

PR #128's documentation-only Task 8 alignment input repeatedly failed the Godot 4.7.1 toolchain lane after offline contract tests passed. The repeated exception was `zipfile.BadZipFile` while extracting the 4.7.1 export-template download.

The existing downloader treated a non-empty response as sufficient and performed no expected-size or digest check before extraction.

This is a CI/toolchain reliability defect, not a Task 8 product defect. The work was separated into its own work unit and PR instead of weakening #128's merge gate or mixing product logic with infrastructure repair.

## Fresh prework gate

Completed:

```text
fresh Base current main/structure
→ fresh GRIMOIRE main/open PR/latest
→ fresh Sheet current rows
→ define toolchain integrity question
→ official Godot/Python/GitHub research
→ source role/freshness/applicability
→ Existing Solution First
→ disposition
→ adversarial review
→ TDD RED/GREEN implementation
```

Research receipt:

`docs/planning/research/2026-08-11-godot-toolchain-download-resilience-research-receipt.md`

## Implementation

`tools/setup_godot_toolchain.py` now keeps the existing installer architecture and adds only the missing integrity behavior for the pinned export templates:

```text
direct official 4.7.1 release asset URL
→ fresh download attempt
→ exact byte-size check
→ exact SHA256 check
→ delete failed bytes
→ bounded retry (max 3)
→ extraction only after verification passes
```

Pinned artifact:

```yaml
asset: Godot_v4.7.1-stable_export_templates.tpz
size_bytes: 1280486955
sha256: 86409db6200b6f8fd3230989c2d2002851f3dd18acf11d7bdbafddf5a0dd0f72
max_attempts: 3
```

The engine download path is unchanged because the observed defect was the export-template artifact and the smallest correction is preferred.

## TDD proof

PR #129 observed the intended RED state before each implementation increment:

- pinned official URL missing;
- integrity/retry parameters missing;
- truncated artifact accepted;
- checksum mismatch accepted;
- integrity failure not retried;
- `install_templates()` not passing official metadata.

Each RED failed for the targeted missing behavior before its GREEN implementation was added.

## Authority boundaries

Unchanged:

```yaml
higodot: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
gut: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY
hera: LIVE_QA_OBSERVABILITY_ONLY
persistent_godot_source_mutation_via_github: FORBIDDEN
product_source_mutation_this_sync: NONE
```

This work changes only Python CI/toolchain setup logic, its deterministic unit tests, and planning/audit documentation.

## Adversarial merge gate

Before merge require:

```yaml
exact_pr_head_unchanged: true
toolchain_contract_tests: PASS
real_godot_4_7_1_engine_download: PASS
real_export_template_1280486955_byte_sha256_verification: PASS
real_export_template_extraction: PASS
headless_probe: PASS
planning_base_gate: PASS
spell_current_state_gate: PASS
godot_authoring_authority_gate: PASS
star_gates: PASS_OR_APPLICABLE_SKIP
review_threads: 0
persistent_godot_source_delta: NONE
P0: 0
P1: 0
```

## Interaction with Task 8

PR #128 remains the Task 8 v3.1.4 alignment-input PR and must not be merged while its exact-head toolchain check is red. After this resilience fix merges to `main`, #128 must be refreshed onto the repaired base (or replaced by an equivalent fresh branch) and re-run at an exact head before merge.

Task 8 protected product authoring still requires:

```text
HiGodot v3.1.4 exact alignment readback
→ focused GUT RED
→ minimum Spell Use Screen GREEN via HiGodot
```

## Current evidence boundary

```yaml
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
export_product_validation: NOT_RUN
full_vertical_slice_runtime: NOT_RUN
task8_product_authoring: NOT_STARTED_IN_THIS_SYNC
```

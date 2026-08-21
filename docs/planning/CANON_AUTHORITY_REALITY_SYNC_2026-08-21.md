# GRIMOIRE Canon Authority Reality Sync — 2026-08-21

```yaml
decision: EXISTING_APPROVED_CORRECTION_SCOPE
sync_id: GR-SYNC-20260821-34-CANON-AUTHORITY-REALITY-SYNC
source_main: bdf964629b08204666905996c587e5e99ad0b32c
base_live_observation: aa9a0d823db9c7373751d35d341489f64c62f7b9
base_project_pin: v9.4.3
open_pr_151: DO_NOT_TOUCH
scope: CANON_ROUTING_AND_WORKSPACE_AUTHORITY_ONLY
product_runtime_mutation: NONE
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: NOT_RUN
```

## Purpose

Correct active project routing that still describes GRIMOIRE as planning-only / Godot-not-created / Sheet-first, while preserving actual runtime evidence ceilings and all historical provenance.

## Current reality to preserve

- `project.godot` exists and currently opens `res://src/ui/star_circuit_harness.tscn`.
- Frostbloom 00–46 planning is complete, but Full Vertical Slice runtime and Human/Device/Performance evidence remain `NOT_RUN`.
- Spell Workflow Tasks 3–7 are merged; Task8 has historical local acceptance evidence but no current remote product branch/PR authority.
- The current next product gate is fresh Task8 PR-prep revalidation, not a claim that Task8 is merged.
- PR #151 is an active draft implementation and is excluded from this correction.

## Workspace authority correction

- Notion: human-facing project canon.
- Repository: structured data, code, scenes, resources, tests, runtime evidence.
- Google Sheets: migration-only provenance until unique-material audit proves removal safe.

Historical Sheet sync receipts are not rewritten. The workbook document remains available for migration audit and rollback provenance, but must not remain an active routing source.

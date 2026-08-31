---
archive_id: AR-TASK8-LOCAL-CANDIDATES-20260831
classification: EVIDENCE_RETENTION
original_path: C:\GRIMOIRE-Task8-Recovery
current_path: artifacts/recovery/Task8-Recovery
content_sha256: AE7BC251E4CA47F80CAABD4AD41B1D93B872B8DC8239B73FA7E14DDAEE8AC9A5
archived_at: 2026-08-31
superseded_by: UNKNOWN_NOT_CURRENT_CANON
reason: User-directed consolidation into the repository root before external C-drive cleanup.
unique_material_preserved:
  - primary_v2 Task8 local candidate patch, copied files, and manifest
  - secondary_original Task8 local candidate patch, copied files, and manifest
active_authority: false
implementation_authority: NONE
compatibility_consumers:
  - historical Task8 recovery and parity comparison only
rollback_ref: task8-preservation-20260824T100804144Z-e9e7eb66
validation_status: MOVED_WITH_CONTENT_DIGEST_MATCH
---

# Task8 local candidate recovery package

This is a local recovery package, not an active Godot source tree and not a
current implementation authority. It was moved from the external C-drive
location into the repository root at the user's direction.

Do not copy these files back into `src/`, `tests/`, `addons/`, or a live
worktree directly. For a future recovery, read the retained manifests, verify
their per-file hashes, compare against fresh `origin/main`, and create a
separate reconciliation change.

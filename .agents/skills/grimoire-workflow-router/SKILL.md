---
name: grimoire--workflow-router
description: Use for GRIMOIRE work requiring project-local or Base shared guidance; resolve the preserved v9.4.3 registry and selectively adopted current policy.
---

# GRIMOIRE Workflow Router

Read AGENTS.md → START_HERE.md → current Active Context and the actual target consumer first.
Run `.agents/skills/grimoire-workflow-router/scripts/validate_operating_contract.ps1 -BaseRoot <verified Base repository>`.
If validation fails, report the exact mismatch and hold dependent routing; read-only diagnosis and independent approved work may continue. Never infer a passing contract.

Read `skills/PROJECT_BASE_ADAPTER.json` and generated `skills/PROJECT_SKILL_SNAPSHOT.json`.
Select only the needed effective route; same-name project-local routes take precedence.
Local Skills use their recorded repository paths. Shared Skills and required references are read from the adopted Git object, NOT a potentially stale/dirty Base working copy:

`python tools/generate_project_operating_views.py --base-root <Base repository> --read-base-path <selected path>`

The response identifies the exact source revision, raw-byte hash and current remote drift.
Use `base_policy_adoption.owner_paths` or a reference inside a recorded Base route. A required out-of-route owner must be assessed and explicitly added to the adoption; do not fall back to an unverified local copy.
Read each selected instruction fully. Fetch current Base main before assessing drift; do not silently replace the release/registry lock or adopted policy when remote changes.
This router contains no copied Base shared Skill body. Missing required sources block only the dependent work.

For player-facing planning or UI work, use the existing UX/UI `fun-verification-binding` and its adopted Base references; no extra fun-supervisor Skill.
Reuse the same approved plan, valid evidence and cumulative review budget across stages. Historical snapshots never re-open a resolved approval or replace actual consumers.

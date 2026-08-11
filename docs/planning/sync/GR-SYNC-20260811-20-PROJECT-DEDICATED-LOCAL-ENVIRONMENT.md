# GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT

```yaml
sync_id: GR-SYNC-20260811-20-PROJECT-DEDICATED-LOCAL-ENVIRONMENT
decision_id: GM-GODOT-AUTHORING-GUT-TEST-AUTHORITY-01
approval: USER_APPROVED_ACTIVE
scope: PROJECT_OPERATING_FLOW_ONLY
product_decision_change: false
protected_godot_product_mutation: NONE
source_base_main: 6d2feba2bc49fda2d8d273248b55087853615d5d
source_base_pr: 288
base_invariant: PROJECT_DEDICATED_LOCAL_EXECUTION_ENVIRONMENT_FIRST
fresh_shell_rule: ASSUME_PREVIOUS_POWERSHELL_CLOSED
missing_environment_rule: CREATE_OR_REPAIR_DEDICATED_LOCAL_ENVIRONMENT_FIRST
```

## Approved GRIMOIRE local execution contract

Every user-executed local work session starts from a new PowerShell process. A previous PowerShell window, environment variable, current directory, process handle, or Codex session is never assumed to survive.

The project-dedicated local environment is:

```text
new PowerShell process
→ verify/create-or-repair the dedicated self-contained GRIMOIRE Godot distribution
→ reuse/start only the exact requested GRIMOIRE Godot project/worktree
→ verify/start-or-attach the GRIMOIRE-scoped HiGodot profile/server/ports
→ set the GRIMOIRE-scoped CODEX_HOME
→ verify the project-adopted Hera exact pair/profile when live QA is required
→ launch Codex in the exact requested GRIMOIRE worktree
→ inside Codex obtain a fresh exact-project HiGodot session/version/readiness receipt
→ persistent Godot authoring only through HiGodot
→ deterministic GDScript verification through GUT when required
→ live acceptance through Hera only under LIVE_QA_AND_OBSERVABILITY_ONLY
→ require HERA_SOURCE_DELTA: NONE
```

Concrete host values such as current HiGodot ports and Hera token/profile are execution-time project inputs. They must be read from the current project/local configuration before each launcher is generated. Shared-token plaintext is never copied into repository canon, prompts, logs, or evidence.

## One-block handoff rule

When the user must execute the local step, GPT/Codex handoff order is fixed:

```text
1. tell the user to open a new PowerShell window
2. provide one complete copy/paste PowerShell block first
3. that block validates/repairs the project-dedicated environment and launches Codex
4. only after Codex opens, provide the Codex task prompt
```

The launcher uses minimum identity/startup checks only. It does not begin with broad `git diff`, repository-wide scans, already-classified LF/CRLF/stat/index noise dumps, or destructive cleanup.

It must fail closed on wrong worktree, wrong branch when a branch is required, other-project Godot/HiGodot/Hera profile reuse, port/profile collision, missing project CODEX_HOME, path quoting failure, ambiguous duplicate editor, or other-project process ownership. It must not `reset`, `restore`, `clean`, stage, rewrite, or kill unrelated editors/servers.

## Authority boundaries

```yaml
higodot:
  release: v3.1.4
  authority: SOLE_PERSISTENT_GODOT_AUTHORING_AUTHORITY
  tracked_vendor: PASS_EXACT_TREE_IDENTITY

gut:
  release: v9.7.1
  authority: DETERMINISTIC_GDSCRIPT_TEST_AUTHORITY

hera:
  release: v1.0.0
  authority: LIVE_QA_AND_OBSERVABILITY_ONLY
  persistent_source_mutation: FORBIDDEN
  acceptance_source_delta: NONE_REQUIRED
```

Hera is part of the dedicated GRIMOIRE local QA environment when the current acceptance gate requires live QA, but Hera is not an authoring fallback. Any persistent product correction discovered during Hera QA returns to HiGodot authoring, then deterministic tests are rerun before Hera acceptance is repeated.

## Fresh local evidence carried into this sync

The latest user-supplied Codex execution receipt for the active Task8 V2 worktree returned a live HiGodot session with:

```yaml
session_id: task8-spell-use-screen-v2@3cfa
project_path: C:/Users/user/Documents/GitHub/Ninza/GRIMOIRE-/.worktrees/task8-spell-use-screen-v2/
godot: 4.7.1-stable
plugin_version: 3.1.4
server_version: 3.1.4
readiness: ready
```

This proves a live exact-project v3.1.4/ready session was observed for that run. The prior `LIVE_V3_1_4_HANDSHAKE_NOT_VERIFIED` current wording is therefore stale as a blanket statement. It does **not** prove an `expected_version` field that the tool did not surface, and it does not verify the old direct/local tool-state commit's formal authoring receipt.

The same execution reported Task8 local refinement GREEN (focused 15 tests / 90 assertions; legacy 42 suites / 1,588 assertions; zero failures), but Task8 remains unmerged local work. This Sync20 does not promote Task8 to merged/complete.

## Current next product gate

Task8 remains local and unpushed. Before product staging/commit/push:

```text
fresh dedicated local environment bootstrap
→ fresh exact-project HiGodot receipt
→ fresh protected-delta authoring receipt/readback
→ pre-Hera tracked-source snapshot
→ Hera live QA only
→ post-Hera tracked-source snapshot
→ HERA_SOURCE_DELTA: NONE
→ independent/adversarial review
→ exact-head PR CI
→ merge and merged-main readback
```

Human/device/performance/export/full-vertical-slice evidence remains `NOT_RUN` unless separately executed.

## Base / project boundary

Base main `6d2feba2bc49fda2d8d273248b55087853615d5d` owns the generic dedicated-environment invariant. GRIMOIRE owns its concrete Godot/HiGodot/CODEX_HOME/Hera configuration and this same existing Decision ID. The Base v9.4.3 project pin is unchanged; the current Base main observation is not a pin update.

# Foundation POC Stage 0 Preflight Bootstrap Design

## 1. Goal

Build a non-product diagnostic package that can determine whether a specific environment is capable of starting the approved Foundation POC work without creating Godot project or game runtime files in the repository.

The package exists to break the circular dependency between Toolchain evidence and Execution Readiness. It observes the environment, records evidence, and stops. It does not implement gameplay.

A renderer-startup probe may create a minimal ephemeral Godot probe project only inside an operating-system temporary directory. The probe must remove that directory after execution and must never write `project.godot`, `.godot/`, imported resources, or runtime files inside the repository.

## 2. Decision and Scope

```yaml
decision_id: GM-FOUNDATION-POC-EXECUTION-READINESS-01
selected_approach: B_STAGE_0_PREFLIGHT_BOOTSTRAP
status: USER_APPROVED_DESIGN_SCOPE
implementation_status: NOT_STARTED
product_implementation: NOT_AUTHORIZED
baseline_main: 9632b2036c1b351141f8740a4fc8df572fd2e7f0
base_release: v9.4.3
```

### Allowed package

```text
tools/check_godot_toolchain.py
tests/test_foundation_preflight_contract.py
.github/workflows/validate-godot-preflight.yml
docs/validation/GODOT_TOOLCHAIN_PREFLIGHT_REPORT.md
```

Canon freshness updates may touch the registered entrypoints, Adapter source, generated views, batch state, and sync receipts. Generated files must only be produced through the repository generator.

### Prohibited repository package

```text
project.godot
.godot/**
src/**
scenes/**
addons/**
data/**
assets/**
content/**
ml/**
training-data/**
```

An ephemeral probe project under the host temporary directory is not a repository product project. It is allowed only for renderer-startup observation and must be deleted whether the probe succeeds, fails, or times out.

## 3. Architecture

Stage 0 contains four bounded units.

### 3.1 Toolchain probe

`tools/check_godot_toolchain.py` is a read-only Python CLI with respect to the repository and persistent host configuration.

Responsibilities:

- resolve `GODOT_BIN`, then approved fallback executable names;
- run the actual binary with `--version`;
- compare the output to an exact approved engine pin;
- test a binary-level headless invocation;
- create a minimal temporary probe project outside the repository when renderer startup needs a project context;
- delete the temporary probe project and generated cache on every exit path;
- inspect matching export-template locations without installing or modifying them;
- inspect Android SDK, JDK, and adb environment signals;
- report host platform and the iOS host boundary;
- emit deterministic JSON and a meaningful exit code.

Non-responsibilities:

- downloading or installing Godot;
- creating persistent project files;
- writing any Godot-generated cache inside the repository;
- modifying user environment variables or host configuration;
- creating Android or iOS exports;
- claiming device, performance, or gameplay quality beyond the probe performed.

### 3.2 Contract tests

`tests/test_foundation_preflight_contract.py` tests parser behavior, state classification, exit codes, redaction, temporary-directory cleanup, repository write protection, and test-double separation.

A fake executable may be used to test the Python contract, but its report must contain `evidence_kind: TEST_DOUBLE` and can never yield `REAL_PREFLIGHT_PASS`.

### 3.3 CI workflow

`.github/workflows/validate-godot-preflight.yml` validates the diagnostic package without silently converting a CI runner into the project’s authoritative local environment.

The workflow has two layers:

1. `contract-gate`: always runs Python tests and scope protection.
2. `real-toolchain-probe`: runs only when an exact approved install source and checksum are configured. Otherwise it reports `BLOCKED_NO_APPROVED_INSTALL_SOURCE` rather than passing.

The stable required check is a final gate that interprets optional-job states explicitly. A skipped real probe may be acceptable for a contract-only PR, but it cannot close Toolchain Readiness.

### 3.4 Evidence report

`docs/validation/GODOT_TOOLCHAIN_PREFLIGHT_REPORT.md` is generated or updated from actual JSON evidence.

It must separate:

- official release-source verification;
- local environment evidence;
- Codex environment evidence;
- CI environment evidence;
- temporary probe-project cleanup evidence;
- blocked and not-run items;
- canon freshness and plan revalidation status.

## 4. Data Contract

The probe emits UTF-8 JSON with this minimum shape.

```json
{
  "schema_version": 1,
  "evidence_kind": "REAL_BINARY | TEST_DOUBLE | NO_BINARY",
  "host": {
    "os": "string",
    "architecture": "string"
  },
  "engine": {
    "binary": "string or null",
    "version_output": "string or null",
    "exact_pin": "string or null",
    "exact_pin_match": "PASS | FAIL | UNVERIFIED"
  },
  "headless": {
    "status": "PASS | BLOCKED | NOT_RUN",
    "command": "redacted string or null",
    "exit_code": "integer or null"
  },
  "renderer": {
    "status": "PASS | BLOCKED | NOT_RUN",
    "scope": "TEMP_PROJECT_STARTUP_ONLY",
    "temporary_project_cleanup": "PASS | FAIL | NOT_RUN"
  },
  "export_templates": {
    "status": "PASS | BLOCKED | NOT_RUN",
    "version_match": "PASS | FAIL | UNVERIFIED"
  },
  "android": {
    "status": "PASS | BLOCKED | NOT_REQUIRED_CURRENT_HOST",
    "sdk": "PASS | BLOCKED | NOT_RUN",
    "jdk": "PASS | BLOCKED | NOT_RUN",
    "adb": "PASS | BLOCKED | NOT_RUN"
  },
  "ios": {
    "status": "PASS | HOST_REQUIRED | NOT_RUN"
  },
  "repository": {
    "product_paths_changed": false,
    "godot_cache_created": false
  },
  "verdict": "REAL_PREFLIGHT_PASS | PARTIAL | BLOCKED | CONTRACT_TEST_ONLY"
}
```

Paths and environment values that may expose secrets or user-specific locations are redacted in published logs. The full local path may be retained only in local evidence when the project policy permits it.

## 5. State and Exit-Code Model

```yaml
exit_0:
  - REAL_PREFLIGHT_PASS
  - CONTRACT_TEST_ONLY when explicitly requested by tests
exit_2: GODOT_BINARY_NOT_FOUND
exit_3: VERSION_COMMAND_FAILED
exit_4: EXACT_PIN_MISMATCH
exit_5: HEADLESS_OR_RENDERER_STARTUP_FAILED
exit_6: EXPORT_TEMPLATE_MISSING_OR_MISMATCH
exit_7: ANDROID_TOOLCHAIN_BLOCKED
exit_8: INVALID_CONFIGURATION_OR_SCHEMA
exit_9: TEMP_PROJECT_CLEANUP_OR_REPOSITORY_WRITE_VIOLATION
```

The CLI must not collapse multiple failures into a false success. JSON records all findings; the exit code represents the highest-priority blocking state. Repository-write or temporary-cleanup violations outrank ordinary capability failures.

## 6. Engine Pin Policy

The Stage 0 package must not treat `latest` or `stable candidate` as an exact executable contract.

Required flow:

```text
official Godot release source
→ exact version identification
→ approved binary source and checksum
→ matching export templates
→ repository exact pin
→ actual --version comparison
```

Until the official source is reachable and verified, the exact pin remains unresolved and the real probe cannot pass.

Changing the engine pin from the current recorded candidate is a canon update, not a silent implementation detail.

## 7. Security and Trust Boundaries

- The probe is read-only with respect to the repository and persistent host configuration.
- A renderer probe may write only to a newly created operating-system temporary directory.
- Temporary files are removed in a `finally` path after success, failure, timeout, or interruption handled by the process.
- The probe checks the repository before and after execution for prohibited generated paths.
- No package manager, installer, shell profile, registry, system setting, SDK manager, or export-template installer is invoked.
- Commands use argument arrays, not shell interpolation.
- User-controlled executable paths are validated as files before invocation.
- Output size and command timeouts are bounded.
- Environment output is allowlisted and redacted.
- CI downloads are prohibited until an official source and checksum are explicitly approved.
- A test double cannot produce actual readiness evidence.

## 8. Canon Freshness Work

Stage 0 must resolve current active drift before Readiness can pass.

Canonical source and consumer map:

```text
AGENTS.md
START_HERE.md
docs/ACTIVE_CONTEXT.md
docs/DEVELOPMENT_GATES.md
docs/DESIGN_DOCUMENT_REGISTRY.json
skills/PROJECT_BASE_ADAPTER.json
→ generator
→ skills/PROJECT_BASE_SKILL_ADAPTER.json
→ skills/BASE_V9_ADAPTER.json
→ skills/PROJECT_SKILL_SNAPSHOT.json
→ CI and sync receipts
```

The review must distinguish historical receipts from active stale references. Past merge documents are not rewritten merely because they contain earlier SHAs or states.

## 9. Plan Revalidation Boundary

After real Toolchain evidence and canon freshness pass, Codex Plan performs a read-only revalidation of the existing Foundation POC implementation plan.

It checks:

- exact engine version and APIs;
- actual repository paths;
- Test Runner feasibility without a third-party plugin;
- workflow and branch protection compatibility;
- package boundaries and forbidden paths;
- interaction with the approved Stock, Summon, State/Ledger/Save, and Mobile HUD contracts;
- Red → Green → Refactor order;
- rollback and stop conditions.

Codex Plan may propose technical improvements. It may not change player rules or create files.

## 10. Testing Strategy

### Python contract tests

- binary resolution precedence;
- no-binary classification;
- exact-pin match and mismatch;
- subprocess failure and timeout;
- binary-level headless success and failure;
- temporary renderer-probe project creation outside the repository;
- cleanup after success, failure, and timeout;
- repository-write violation detection;
- export-template version match;
- Android partial and blocked states;
- non-macOS iOS host boundary;
- JSON schema and UTF-8 output;
- secret/path redaction;
- test-double inability to produce real pass;
- deterministic highest-priority exit code.

### Scope tests

A changed-file guard rejects Stage 0 PRs that touch prohibited product paths. A runtime probe additionally verifies that `.godot/`, `project.godot`, and imported resources were not created inside the repository.

### Evidence tests

The Markdown report must reference one actual JSON evidence set and preserve all `NOT_RUN`, `BLOCKED`, and `UNVERIFIED` states without upgrading them.

## 11. Error Handling

- Missing dependency: record the specific dependency and closure action.
- Unsupported host: return a host-boundary state, not generic failure.
- Official-source outage: preserve unresolved exact pin and block real pass.
- Multiple binaries: use explicit `GODOT_BIN` first and report ambiguity when fallbacks conflict.
- Permission denied: report executable-path permission failure without changing permissions.
- Malformed output: retain bounded stderr and return version-command failure.
- Temporary cleanup failure: fail closed and report the retained path only in redacted form.
- Repository generated-file detection: fail closed and identify the prohibited relative path.
- CI optional-job skipped: final gate distinguishes allowed skip from missing evidence.

## 12. Completion Criteria

Stage 0 is complete only when all conditions hold.

1. User reviewed this written design.
2. A separate TDD implementation plan was written and approved for execution.
3. Contract tests passed with an explicit RED→GREEN record.
4. The actual binary and exact pin were verified from an official source.
5. Binary-level headless and temporary-project renderer startup evidence were collected.
6. Temporary project and cache cleanup passed.
7. No Godot project or generated cache was created in the repository.
8. Matching export templates were verified.
9. Android environment status was recorded accurately.
10. iOS host restrictions were recorded accurately.
11. Prohibited product paths were unchanged.
12. Canon freshness and generated-view checks passed.
13. Base v9.4.3 plan read-only revalidation completed.
14. A new Readiness report reached P0=0 and P1=0.

Even then, Foundation POC product implementation requires a separate scope decision.

## 13. Spec Self-Review

```yaml
placeholder_scan: PASS
internal_consistency: PASS_AFTER_TEMP_PROJECT_BOUNDARY_CLARIFICATION
scope_check: PASS_SINGLE_STAGE_0_PACKAGE
ambiguity_check: PASS
product_scope_leak: NONE
```

The initial draft said renderer startup should be tested without creating a project. Because Godot renderer initialization may require project context, the final design explicitly permits only an ephemeral probe project outside the repository and requires cleanup evidence. This does not authorize the repository’s Foundation POC project.

## 14. Current Status

```text
DESIGN_SCOPE = USER_APPROVED
WRITTEN_DESIGN = READY_FOR_USER_REVIEW
IMPLEMENTATION_PLAN = NOT_WRITTEN
DIAGNOSTIC_CODE = NOT_STARTED
OFFICIAL_ENGINE_PIN = UNVERIFIED
GODOT_BINARY = NOT_RUN
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
```

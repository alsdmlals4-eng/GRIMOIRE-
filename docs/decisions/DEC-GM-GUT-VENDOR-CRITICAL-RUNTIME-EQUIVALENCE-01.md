# GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01

- Status: `USER_APPROVED_ACTIVE`
- Approved: 2026-08-07
- Scope: GUT 9.7.1 CLI/headless formal adoption only
- Applies to: PR #85 (`agent/gut-9-7-1-formal-adoption-v4-3-tdd`)

## Decision

Accept the verified critical-runtime equivalence of the bundled GUT 9.7.1 vendor tree as the vendor gate for CLI/headless GUT use in GRIMOIRE.

This Decision does **not** assert complete vendor-tree identity.

## Pinned authority

- Official repository: `bitwes/Gut`
- Official commit: `aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605`
- Official `addons/gut` tree: `5d6893836af4917ee62b1a395125a7530b1f239d`
- Project `addons/gut` tree observed during approval audit: `09d040309bbed0e07420ad72c4aa69cbd0e58190`

## Audit evidence

The approval audit established:

- official and project trees contain the same 259 paths;
- after CRLF/LF normalization and removal of only the top-level Godot `load_steps` hint, 257 of 259 files are identical;
- all 11 defined CLI/headless critical-runtime files are identical under that limited normalization;
- the remaining two differing resources are:
  - `addons/gut/gui/GutSceneTheme.tres`
  - `addons/gut/source_code_pro.fnt`

The accepted audit classification is `CRITICAL_RUNTIME_GODOT_LOAD_STEPS_NORMALIZED_IDENTICAL_FULL_TREE_MISMATCH`.

## Runtime evidence at approval

GitHub-hosted validation run `31177852337` on exact head `9dd276757cc3c4121e351c5df69acb48157cda08` passed:

- Windows CPython 3.11 contract lane;
- Windows CPython 3.13 contract lane;
- Windows CPython 3.12 + Godot 4.7.1 + import + product `GutTest` + JUnit + protected-product hash lane;
- Ubuntu CPython 3.12 + Godot 4.7.1 + import + product `GutTest` + JUnit + protected-product hash lane;
- final `GUT Validation Gate`.

The full lanes discovered 1 product GUT test and passed 1 with 0 failures and 0 errors. Protected production hashes remained equal before and after GUT execution.

## Gate semantics

When the pinned official checkout passes the approved critical-runtime audit classification, the hosted validator may use the project vendor tree for CLI/headless runtime validation and records:

- vendor status: `CRITICAL_RUNTIME_EQUIVALENCE_USER_APPROVED`;
- vendor Decision ID: `GM-GUT-VENDOR-CRITICAL-RUNTIME-EQUIVALENCE-01`.

Approval never converts a real runtime, JUnit, discovery, hash, source, or audit failure into PASS. Those failures remain fail-closed.

## Explicit boundaries

This Decision does not authorize:

- claiming full vendor-tree identity;
- enabling the GUT editor plugin;
- treating the two differing UI/font resources as identical;
- using GUT editor/UI functionality under this equivalence Decision;
- bypassing exact-head, Godot 4.7.1, JUnit, product-test discovery, or protected-hash gates.

A fresh audit and a new or amended approved Decision are required before editor/UI GUT use, a change to the pinned official GUT commit/tree, a change to the project vendor tree, or a change to the defined critical-runtime file set.

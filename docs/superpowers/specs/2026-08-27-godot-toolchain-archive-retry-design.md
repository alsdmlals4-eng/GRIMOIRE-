# Godot Toolchain Archive Retry Design

Issue: #199

## Goal

Prevent a transient non-ZIP response from the official Godot engine endpoint from immediately failing otherwise unrelated CI jobs.

## Confirmed problem

On 2026-08-27, independent `component-contract`, `godot-toolchain`, and `star-runtime-poc` jobs downloaded a file that failed `zipfile.ZipFile` with `BadZipFile`. A separate probe of the same official endpoint returned a valid ZIP signature. The current engine installer downloads once and only discovers archive invalidity during extraction.

## Scope

- Keep the pinned Godot version and official endpoint unchanged.
- Retry engine download-plus-extraction at most three times when the downloaded archive is invalid or extraction fails.
- Remove only the per-attempt temporary extraction directory and archive before retrying.
- Raise an actionable error after the final failed attempt.
- Add focused Python coverage for invalid-first/valid-second and all-invalid archive sequences.

## Exclusions

- No Godot scene, runtime, asset, export-template, or CI-workflow changes.
- No alternate third-party mirror or integrity-policy weakening.

## Acceptance criteria

1. A fake invalid first archive followed by a valid archive installs the expected executable in two attempts.
2. Repeated invalid archives fail after the bounded retry count and do not leave an installed executable.
3. Existing toolchain tests remain green.

# Godot Toolchain Archive Retry Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Retry a transient invalid Godot engine archive before failing CI.

**Architecture:** `install_engine` owns the download-plus-extraction boundary, so it retries that boundary rather than treating downloaded bytes as valid. `download_file` retains its generic transport and integrity responsibilities.

**Tech Stack:** Python 3.12 standard library, unittest, zipfile.

**Spec:** `docs/superpowers/specs/2026-08-27-godot-toolchain-archive-retry-design.md`

## Global Constraints

- Keep Godot `4.7.1-stable` and the official downloads endpoint unchanged.
- Retry only transient engine archive extraction failure, at most three total attempts.
- Preserve safe ZIP traversal checks and fail closed after the final attempt.

### Task 1: Test archive-level retry

**Files:**
- Modify: `tests/test_godot_toolchain_setup.py`
- Modify: `tools/setup_godot_toolchain.py`

- [x] Add a failing test with a fake downloader that writes non-ZIP bytes first and a ZIP containing the expected executable second. Assert the installation succeeds in two calls.
- [x] Run `python -m unittest tests.test_godot_toolchain_setup.GodotToolchainSetupTests.test_install_engine_retries_invalid_archive_then_installs` and confirm it fails with `BadZipFile` before implementation.
- [x] Add a three-attempt `install_engine` loop which downloads, safely extracts, locates, and copies only a valid executable; discard failed temporary attempt artifacts and raise an actionable `RuntimeError` after the final attempt.
- [x] Run `python -m unittest tests.test_godot_toolchain_setup` and confirm it passes.
- [x] Commit the test, implementation, and these two documents with `fix(ci): retry invalid Godot engine archives`.

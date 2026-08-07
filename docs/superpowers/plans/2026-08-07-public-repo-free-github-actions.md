# Public-Repository Free GitHub Actions Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace PR #85's mandatory Windows+WSL2 user-run validation with a free standard GitHub-hosted runner gate.

**Architecture:** One four-lane matrix invokes the existing fail-closed GUT validator through an Actions-specific wrapper. One aggregate job exposes the stable `GUT Validation Gate` check.

**Tech Stack:** GitHub Actions, CPython 3.11/3.12/3.13, Godot 4.7.1, GUT 9.7.1, unittest, JUnit XML.

## Global Constraints

- Use only `windows-latest` and `ubuntu-latest`.
- Do not use larger or self-hosted runners.
- Do not upload artifacts or use Actions caches.
- Do not modify `project.godot`, scenes, resources, or production data.
- Do not authorize PR #82 Task 2.
- Do not merge PR #85 before exact-head CI and review gates pass.

---

### Task 1: Lock the decision and workflow contract

- [ ] Add the active Decision ID `GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01`.
- [ ] Mark `GM-ACTIONS-BUDGET-LOCAL-VERIFICATION-MODE-01` superseded.
- [ ] Add contract tests for four standard-runner lanes, exact-head checkout, final gate, and forbidden paid/persistent features.

### Task 2: Add Actions execution

- [ ] Add `tools/run_gut_actions_validation.py` to bind the existing validator to the active Decision ID.
- [ ] Add the Actions manifest schema.
- [ ] Add `.github/workflows/validate-gut-formal-adoption.yml`.
- [ ] Set UTF-8 Python mode for Windows Godot output.
- [ ] Install Godot only on the two Python 3.12 full-runtime lanes.
- [ ] Summarize lane results without uploading artifacts.

### Task 3: Synchronize authority state

- [ ] Update the GUT authority state from local-required to public-standard-runner mode.
- [ ] Update PR #85 title/body while keeping it Draft and merge unauthorized.
- [ ] Write the same Decision ID to the Google Sheet and verify readback.
- [ ] Inspect the resulting workflow run; do not claim PASS until all lanes actually pass.

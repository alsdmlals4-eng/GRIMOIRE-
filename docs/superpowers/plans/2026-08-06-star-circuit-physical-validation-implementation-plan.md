# Star Circuit Physical Validation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Prepare a fail-closed GR-TEST-033 execution package for physical mobile-device, accessibility, performance, and human validation of the current FIVE_POINT_STAR runtime.

**Architecture:** Keep runtime code unchanged. Add a documentation-led execution pack, raw evidence schemas, a deterministic Python analyzer, authority routing, Google Sheet synchronization, and CI contracts. Raw attempts and observations remain separate from the session aggregate and are bound by SHA-256 and record counts.

**Tech Stack:** Markdown, JSON, Python 3.12 standard library, unittest, GitHub Actions, Google Sheets.

## Global Constraints

- `TEST_FIRST`
- Runtime layout is `FIVE_POINT_STAR` only.
- Stock scope is `TYPED_GLYPH_ONLY` only.
- `FIRST_ATTEMPT_POST_FEEDBACK_SEPARATED`.
- `HUMAN_PASS_NOT_CLAIMED`.
- Physical Device·Performance·Screen Reader·Human·Full Vertical Slice remain `NOT_RUN` until real evidence exists.
- No final art, seventh glyph, automatic target, automatic commit, or best-route recommendation.

---

### Task 1: Contract RED

**Files:**
- Create: `tests/test_gr_test_033_star_physical_contract.py`
- Create: `.github/workflows/validate-star-physical-pack.yml`

**Interfaces:**
- Consumes: current main authority and Runtime contracts.
- Produces: failing requirements for all execution-pack files and analyzer functions.

- [ ] Write tests for required files, NOT_RUN claims, hashes, PII, hard stops, and exploratory classifications.
- [ ] Run `python -m unittest tests.test_gr_test_033_star_physical_contract -v`.
- [ ] Confirm failure is caused only by missing GR-TEST-033 artifacts.
- [ ] Commit the RED boundary.

### Task 2: Evidence Analyzer

**Files:**
- Create: `tools/analyze_gr_test_033.py`
- Create: `artifacts/human-validation/gr-test-033-session-template.json`
- Create: `artifacts/human-validation/gr-test-033-attempt-schema.json`
- Create: `artifacts/human-validation/gr-test-033-observation-schema.json`
- Create: `artifacts/human-validation/gr-test-033-result-template.json`

**Interfaces:**
- Consumes: JSON objects with `records` arrays.
- Produces: `canonical_sha256(records)`, `build_session_for_records(attempts, observations)`, `validate_payloads(session, attempts, observations)`, and `analyze(session, attempts, observations)`.

- [ ] Implement deterministic compact sorted JSON hashing.
- [ ] Reject source hash or record-count mismatch.
- [ ] Reject forbidden PII keys, email values, and Korean mobile-phone values.
- [ ] Return `PENDING_NOT_RUN` before physical execution.
- [ ] Return `STOP` on validation error, hard stop, or critical accessibility failure.
- [ ] Compute first-attempt completion, preview comprehension, and cause-explanation rates.
- [ ] Return only `PROMISING`, `TUNE`, or `REWORK` for clean completed evidence.
- [ ] Force all PASS/release/full-slice claim fields to false.
- [ ] Run the focused unittest and commit GREEN.

### Task 3: Physical Execution Pack

**Files:**
- Create: `docs/validation/GR_TEST_033_STAR_PHYSICAL_RUNBOOK.md`
- Create: `docs/validation/GR_TEST_033_MODERATOR_SCRIPT.md`
- Create: `docs/validation/GR_TEST_033_DEVICE_PREFLIGHT.md`
- Create: `docs/planning/GR_TEST_033_STAR_PHYSICAL_EXECUTION_READY_GATE_2026-08-06.md`

**Interfaces:**
- Consumes: current Low-fi Star Circuit Harness and approved Runtime behavior.
- Produces: repeatable participant, device, moderation, and stop-gate procedures.

- [ ] Define anonymous participant setup and consent boundary.
- [ ] Define the six required tasks and first/retry separation.
- [ ] Define Android/iOS, touch/stylus, finger occlusion, Text130%, safe-area, reduced-motion, screen-reader, and frame-time checks.
- [ ] Prohibit solution prompting, ranking, and best-route guidance.
- [ ] Define evidence sealing and analyzer invocation.
- [ ] Re-run focused tests and commit.

### Task 4: Canon and Sheet Sync

**Files:**
- Create: `docs/planning/sync/GR-SYNC-20260806-04-STAR-PHYSICAL-VALIDATION-READY.md`
- Modify: `AGENTS.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/DEVELOPMENT_GATES.md`
- Modify: `docs/planning/CURRENT_CONFIRMED_DECISIONS.md`
- Modify: `docs/planning/CANON_SYNC_STATE.json`
- Modify: Google Sheet append-only validation rows.

**Interfaces:**
- Consumes: exact PR head and CI evidence.
- Produces: `GR_TEST_033_READY_FOR_PHYSICAL_EXECUTION_HUMAN_NOT_RUN` authority state.

- [ ] Route all active authority to GR-TEST-033 without changing product Runtime decisions.
- [ ] Preserve Device·Performance·Accessibility Device·Human·Full Slice as NOT_RUN.
- [ ] Append Google Sheet rows with the same Decision and Sync IDs.
- [ ] Read back every written range.
- [ ] Run focused, planning/base, runtime, toolchain, and rights checks.
- [ ] Update Draft PR evidence without claiming physical execution.

### Task 5: Adversarial Closure

**Files:**
- Review all changed files.

**Interfaces:**
- Consumes: final exact-head diff and CI.
- Produces: a verified Draft execution-ready checkpoint.

- [ ] Verify no `src/**` product code changed.
- [ ] Verify no active 3×3 or Universal Stock contract reappeared.
- [ ] Verify templates cannot claim Human PASS.
- [ ] Verify review threads and comments are zero or resolved.
- [ ] Verify fresh exact-head CI before any completion statement.

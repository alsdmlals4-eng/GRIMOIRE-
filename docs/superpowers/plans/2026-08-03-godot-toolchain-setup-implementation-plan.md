# Godot Toolchain Setup Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Automatically download and verify Godot 4.7.1 stable and its export templates without treating a missing engine as a planning blocker.

**Architecture:** A standard-library Python installer resolves the host package, downloads from the official Godot download endpoint, extracts into an ignored local tooling directory, installs matching export templates, verifies `--version`, and runs a temporary headless probe project. GitHub Actions executes the same installer on Linux so the repository always has reproducible evidence.

**Tech Stack:** Python 3.12 standard library, GitHub Actions, Godot 4.7.1 stable.

## Global Constraints

- Exact engine pin: `4.7.1-stable`.
- Official download endpoint only: `https://downloads.godotengine.org/`.
- Local binaries and templates live under `.tooling/` and are never committed.
- No gameplay project, Scene, Resource, data, or asset is created.
- Temporary probe projects are deleted after the check.
- Missing Godot triggers installation, not an approval stop.

---

### Task 1: Host package and URL contract

**Files:**
- Create: `tests/test_godot_toolchain_setup.py`
- Create: `tools/setup_godot_toolchain.py`

**Interfaces:**
- Produces: `resolve_platform(system: str, machine: str) -> PlatformSpec`
- Produces: `build_engine_url(spec: PlatformSpec) -> str`
- Produces: `build_templates_url() -> str`
- Produces: `version_matches(output: str) -> bool`

- [ ] **Step 1: Write failing tests**

Test Windows x86_64 and Linux x86_64 package resolution, official URLs, unsupported hosts, and exact stable-version matching.

- [ ] **Step 2: Run the test and verify RED**

Run: `python -m unittest tests.test_godot_toolchain_setup`
Expected: FAIL because `tools.setup_godot_toolchain` does not exist.

- [ ] **Step 3: Implement the minimal contract**

Use a frozen `PlatformSpec` dataclass and these official query forms:

```text
https://downloads.godotengine.org/?flavor=stable&platform=windows.64&slug=win64.exe.zip&version=4.7.1
https://downloads.godotengine.org/?flavor=stable&platform=linux.64&slug=linux.x86_64.zip&version=4.7.1
https://downloads.godotengine.org/?flavor=stable&platform=templates&slug=export_templates.tpz&version=4.7.1
```

- [ ] **Step 4: Run tests and verify GREEN**

Run: `python -m unittest tests.test_godot_toolchain_setup`
Expected: PASS.

### Task 2: Safe download, extraction, and local installation

**Files:**
- Modify: `tools/setup_godot_toolchain.py`
- Modify: `tests/test_godot_toolchain_setup.py`
- Modify: `.gitignore`

**Interfaces:**
- Produces: `safe_extract_zip(archive: Path, destination: Path) -> None`
- Produces: `install_engine(install_root: Path, spec: PlatformSpec) -> Path`
- Produces: `install_templates(install_root: Path) -> Path`

- [ ] **Step 1: Add failing traversal and archive-layout tests**
- [ ] **Step 2: Verify RED**
- [ ] **Step 3: Implement bounded downloads, zip-slip protection, executable discovery, and `.tooling/` storage**
- [ ] **Step 4: Verify GREEN**

### Task 3: Actual engine verification

**Files:**
- Modify: `tools/setup_godot_toolchain.py`
- Modify: `tests/test_godot_toolchain_setup.py`

**Interfaces:**
- Produces: `run_version(binary: Path) -> str`
- Produces: `run_headless_probe(binary: Path) -> None`
- Produces: CLI JSON report.

- [ ] **Step 1: Add failing tests for version mismatch and temporary-project cleanup**
- [ ] **Step 2: Verify RED**
- [ ] **Step 3: Implement `--version` verification and an ephemeral `project.godot` under a temporary directory**
- [ ] **Step 4: Verify GREEN**

### Task 4: Reproducible CI installation

**Files:**
- Create: `.github/workflows/validate-godot-toolchain.yml`

**Interfaces:**
- Consumes: `python tools/setup_godot_toolchain.py --install-dir .tooling/godot --with-templates --json-report godot-toolchain-report.json`
- Produces: a workflow artifact containing the JSON report.

- [ ] **Step 1: Add workflow on pull requests and manual dispatch**
- [ ] **Step 2: Run unit tests**
- [ ] **Step 3: Download Godot 4.7.1 stable and matching templates**
- [ ] **Step 4: Verify version and headless startup**
- [ ] **Step 5: Upload the report artifact**

### Task 5: Canon simplification

**Files:**
- Modify: `AGENTS.md`
- Modify: `START_HERE.md`
- Modify: `docs/ACTIVE_CONTEXT.md`
- Modify: `docs/DEVELOPMENT_GATES.md`
- Modify: `docs/planning/sync/GR-SYNC-20260803-07-WORKING.md`

- [ ] Replace user-facing `Stage 0` terminology with `Godot 개발환경 준비`.
- [ ] State that a missing engine triggers automatic setup.
- [ ] Keep Foundation POC gameplay scope separate from environment setup.
- [ ] Record actual CI evidence without upgrading unrun mobile-device or gameplay validation.

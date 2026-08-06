# Android Debug APK Package Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build and distribute a reproducible Godot 4.7.1 Android Debug APK ZIP for direct installation on the user's phone.

**Architecture:** Add one Android export preset, one fail-closed Python build/packaging tool, one dedicated GitHub Actions workflow, one Korean installation guide, and one focused contract test. The existing star-circuit Runtime remains unchanged; Android export evidence is kept separate from physical-device and human validation.

**Tech Stack:** Godot 4.7.1, Python 3.12, GitHub Actions, Android SDK command-line tools, Java 17, ZIP/SHA-256.

## Global Constraints

- Package ID is exactly `com.alsdmlals4eng.grimoire.poc`.
- Build output is `build/android/GRIMOIRE-Star-Circuit-POC.apk`.
- Debug signing only; release credentials and store submission are prohibited.
- Existing `FIVE_POINT_STAR`, Typed Stock, Mana, and Atomic Commit behavior must not change.
- Physical device, performance, screen-reader, human, and full-slice validation remain `NOT_RUN`.
- Final deliverable ZIP contains APK, `SHA256SUMS.txt`, `설치안내.txt`, and `BUILD_INFO.json`.

---

### Task 1: Android package contract test

**Files:**
- Create: `tests/test_android_debug_package_contract.py`

**Interfaces:**
- Consumes: repository text files.
- Produces: fail-closed contract checks for preset, workflow, tool, guide, and validation boundaries.

- [ ] **Step 1: Write failing tests** requiring `export_presets.cfg`, `tools/build_android_debug.py`, `.github/workflows/build-android-debug-apk.yml`, and the Korean install guide.
- [ ] **Step 2: Run** `python -m unittest tests.test_android_debug_package_contract -v` and confirm missing-file failures.
- [ ] **Step 3: Commit the RED contract.**

### Task 2: Android export preset

**Files:**
- Create: `export_presets.cfg`

**Interfaces:**
- Produces: Godot preset named `Android Debug` and output `build/android/GRIMOIRE-Star-Circuit-POC.apk`.

- [ ] **Step 1: Add minimal Android preset** with package ID, version, landscape-compatible project settings, debug export, and no release credentials.
- [ ] **Step 2: Run the focused contract** and confirm only tool/workflow/guide requirements remain RED.
- [ ] **Step 3: Commit the preset.**

### Task 3: Build and packaging tool

**Files:**
- Create: `tools/build_android_debug.py`

**Interfaces:**
- Consumes: `--godot`, project root, installed export templates, Android SDK environment.
- Produces: APK, SHA-256 manifest, build metadata, Korean text guide copy, and distribution ZIP.

- [ ] **Step 1: Implement argument parsing** for `--godot`, `--project-dir`, `--output-dir`, and `--zip-path`.
- [ ] **Step 2: Verify Godot version** matches `4.7.1.stable`.
- [ ] **Step 3: Execute** `godot --headless --path <project> --export-debug "Android Debug" <apk>`.
- [ ] **Step 4: Reject missing/empty APK** and compute SHA-256.
- [ ] **Step 5: Create deterministic distribution files** and ZIP.
- [ ] **Step 6: Run the focused contract.**
- [ ] **Step 7: Commit the tool.**

### Task 4: Installation guide

**Files:**
- Create: `docs/validation/ANDROID_DEBUG_APK_INSTALL_GUIDE_2026-08-06.md`

**Interfaces:**
- Produces: exact phone download, unzip, permission, install, launch, update, and uninstall instructions.

- [ ] **Step 1: Document Android installation** without claiming device PASS.
- [ ] **Step 2: Include SHA-256 verification and package ID.**
- [ ] **Step 3: Run the focused contract.**
- [ ] **Step 4: Commit the guide.**

### Task 5: GitHub Actions APK builder

**Files:**
- Create: `.github/workflows/build-android-debug-apk.yml`

**Interfaces:**
- Consumes: source checkout, Java 17, Android SDK, Godot 4.7.1 engine/templates.
- Produces: artifact `GRIMOIRE-Android-Debug-POC` containing one ZIP.

- [ ] **Step 1: Add pull-request, push-to-main, and workflow-dispatch triggers.**
- [ ] **Step 2: Install Java 17 and Android SDK packages.**
- [ ] **Step 3: Install pinned Godot engine/templates with `tools/setup_godot_toolchain.py`.**
- [ ] **Step 4: Create a CI-only debug keystore and expose paths to Godot.**
- [ ] **Step 5: Run focused contract and APK packaging tool.**
- [ ] **Step 6: Upload ZIP artifact with `if-no-files-found: error`.**
- [ ] **Step 7: Commit the workflow.**

### Task 6: PR verification and downloadable ZIP

**Files:**
- Modify only if exact-head CI exposes a reproducibility defect.

**Interfaces:**
- Produces: merged PR, main-build artifact, and chat-downloadable ZIP.

- [ ] **Step 1: Open Draft PR.**
- [ ] **Step 2: Verify focused RED→GREEN history and all existing required workflows.**
- [ ] **Step 3: Inspect changed files, reviews, and unresolved threads.**
- [ ] **Step 4: Merge with expected head SHA.**
- [ ] **Step 5: Verify main push APK build.**
- [ ] **Step 6: Download the Actions artifact ZIP and materialize it in `/mnt/data`.**
- [ ] **Step 7: Inspect ZIP members, APK size, and SHA-256 before linking it to the user.**

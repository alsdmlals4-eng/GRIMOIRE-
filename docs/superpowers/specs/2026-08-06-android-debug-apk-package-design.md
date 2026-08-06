# Android Debug APK Package Design

## Status

- User-approved direction: Android Debug APK package for direct phone download.
- Product decision: `GM-STAR-CIRCUIT-MASTERY-BALANCE-01` unchanged.
- Runtime: existing `FIVE_POINT_STAR` interactive Low-fi harness.
- Package ID: `com.alsdmlals4eng.grimoire.poc`.
- Physical device, performance, screen-reader, human, and full-slice validation remain `NOT_RUN` until a real phone session is recorded.

## Goal

Produce a reproducible unsigned-for-release, debug-signed Android APK for the existing Godot 4.7.1 project, publish it as a GitHub Actions ZIP artifact, and provide a phone-installable ZIP download containing the APK, SHA-256 manifest, and Korean installation guide.

## Architecture

1. `export_presets.cfg` owns the Android Debug export preset and mobile-facing package metadata.
2. `tools/build_android_debug.py` validates host prerequisites, locates the pinned Godot binary/templates, exports the APK, verifies the output is non-empty, computes SHA-256, and assembles a deterministic distribution folder.
3. `.github/workflows/build-android-debug-apk.yml` installs Java/Android tooling, installs the pinned Godot 4.7.1 engine and templates, creates a CI-only debug keystore, runs contract tests, exports the APK, and uploads one ZIP artifact.
4. `tests/test_android_debug_package_contract.py` prevents release credentials, package-ID drift, portrait export, missing artifact files, or claims of physical validation.
5. `docs/validation/ANDROID_DEBUG_APK_INSTALL_GUIDE_2026-08-06.md` explains phone download, unzip, unknown-app permission, installation, and uninstall/reinstall behavior.

## Export Contract

- Preset name: `Android Debug`.
- Export path: `build/android/GRIMOIRE-Star-Circuit-POC.apk`.
- Package ID: `com.alsdmlals4eng.grimoire.poc`.
- Version name: `0.1.0-poc`.
- Version code: `1`.
- Orientation: landscape, inherited from `project.godot` handheld orientation.
- Renderer: GL Compatibility.
- Debug signing only; no release keystore, password, upload key, Play signing, or store submission.
- The artifact ZIP contains:
  - `GRIMOIRE-Star-Circuit-POC.apk`
  - `SHA256SUMS.txt`
  - `설치안내.txt`
  - `BUILD_INFO.json`

## Failure Boundaries

The build fails closed when:

- Godot is not exactly `4.7.1.stable` compatible;
- export templates are missing;
- Android SDK/JDK paths are unavailable;
- release signing fields are populated;
- APK output is missing or empty;
- SHA-256 or build metadata cannot be generated;
- the workflow omits the APK from the uploaded ZIP.

## Evidence Boundary

A successful APK build proves only export reproducibility and package integrity. It does not prove installation on a specific phone, touch usability, safe-area correctness, frame performance, TalkBack behavior, human comprehension, full vertical-slice representativeness, store readiness, or legal/rating clearance.

from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
import subprocess
import sys
import tempfile
import zipfile
from datetime import datetime, timezone
from pathlib import Path
from typing import Final

EXPECTED_GODOT_VERSION = "4.7.1"
PRESET_NAME = "Android Debug"
PACKAGE_ID = "com.alsdmlals4eng.grimoire.poc"
APK_NAME = "GRIMOIRE-Star-Circuit-POC.apk"
ZIP_MEMBERS = (
    APK_NAME,
    "SHA256SUMS.txt",
    "설치안내.txt",
    "BUILD_INFO.json",
)


def _run(command: list[str], *, cwd: Path | None = None, timeout: int = 900) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(
        command,
        cwd=str(cwd) if cwd else None,
        check=False,
        capture_output=True,
        text=True,
        timeout=timeout,
    )
    if result.returncode != 0:
        output = ((result.stdout or "") + "\n" + (result.stderr or "")).strip()
        raise RuntimeError(
            f"command failed ({result.returncode}): {' '.join(command)}\n{output[-5000:]}"
        )
    return result


def _verify_godot(godot: Path) -> str:
    if not godot.is_file():
        raise RuntimeError(f"Godot binary not found: {godot}")
    version = _run([str(godot), "--version"], timeout=30).stdout.strip()
    if not version.startswith(f"{EXPECTED_GODOT_VERSION}.stable"):
        raise RuntimeError(
            f"Godot version mismatch: expected {EXPECTED_GODOT_VERSION}.stable, got {version!r}"
        )
    return version


def _required_env(name: str) -> str:
    value = os.environ.get(name, "").strip()
    if not value:
        raise RuntimeError(f"required environment variable is missing: {name}")
    return value


def _write_editor_settings() -> Path:
    java_home = Path(_required_env("JAVA_HOME")).resolve()
    android_home = Path(os.environ.get("ANDROID_HOME") or _required_env("ANDROID_SDK_ROOT")).resolve()
    debug_keystore = Path(_required_env("GODOT_ANDROID_KEYSTORE_DEBUG_PATH")).resolve()
    debug_user = _required_env("GODOT_ANDROID_KEYSTORE_DEBUG_USER")
    debug_password = _required_env("GODOT_ANDROID_KEYSTORE_DEBUG_PASSWORD")

    if not (java_home / "bin" / "java").exists():
        raise RuntimeError(f"JAVA_HOME does not contain bin/java: {java_home}")
    if not (android_home / "platform-tools" / "adb").exists():
        raise RuntimeError(f"Android SDK does not contain platform-tools/adb: {android_home}")
    if not debug_keystore.is_file():
        raise RuntimeError(f"debug keystore not found: {debug_keystore}")

    config_home = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config"))
    settings_path = config_home / "godot" / "editor_settings-4.tres"
    settings_path.parent.mkdir(parents=True, exist_ok=True)

    def quoted(value: str | Path) -> str:
        return json.dumps(str(value), ensure_ascii=False)

    settings_path.write_text(
        "[gd_resource type=\"EditorSettings\" format=3]\n\n"
        "[resource]\n"
        f"export/android/java_sdk_path = {quoted(java_home)}\n"
        f"export/android/android_sdk_path = {quoted(android_home)}\n"
        f"export/android/debug_keystore = {quoted(debug_keystore)}\n"
        f"export/android/debug_keystore_user = {quoted(debug_user)}\n"
        f"export/android/debug_keystore_pass = {quoted(debug_password)}\n"
        "export/android/shutdown_adb_on_exit = true\n",
        encoding="utf-8",
    )
    return settings_path


def _sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _zip_deterministically(source_dir: Path, zip_path: Path) -> None:
    zip_path.parent.mkdir(parents=True, exist_ok=True)
    if zip_path.exists():
        zip_path.unlink()
    with zipfile.ZipFile(zip_path, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as bundle:
        for name in ZIP_MEMBERS:
            source = source_dir / name
            if not source.is_file():
                raise RuntimeError(f"distribution member missing: {name}")
            info = zipfile.ZipInfo(name, date_time=(1980, 1, 1, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o644 << 16
            bundle.writestr(info, source.read_bytes())


def build_package(godot: Path, project_dir: Path, output_dir: Path, zip_path: Path) -> dict[str, object]:
    project_dir = project_dir.resolve()
    output_dir = output_dir.resolve()
    zip_path = zip_path.resolve()
    if not (project_dir / "project.godot").is_file():
        raise RuntimeError(f"project.godot not found in {project_dir}")
    if not (project_dir / "export_presets.cfg").is_file():
        raise RuntimeError(f"export_presets.cfg not found in {project_dir}")

    version = _verify_godot(godot.resolve())
    editor_settings = _write_editor_settings()
    output_dir.mkdir(parents=True, exist_ok=True)
    apk_path = output_dir / APK_NAME
    if apk_path.exists():
        apk_path.unlink()

    _run(
        [
            str(godot.resolve()),
            "--headless",
            "--path",
            str(project_dir),
            "--export-debug",
            PRESET_NAME,
            str(apk_path),
        ],
        cwd=project_dir,
        timeout=1200,
    )

    if not apk_path.is_file() or apk_path.stat().st_size <= 0:
        raise RuntimeError(f"APK export did not produce a non-empty file: {apk_path}")

    apk_sha256 = _sha256(apk_path)
    guide_path = project_dir / "docs" / "validation" / "ANDROID_DEBUG_APK_INSTALL_GUIDE_2026-08-06.md"
    if not guide_path.is_file():
        raise RuntimeError(f"installation guide is missing: {guide_path}")

    build_info = {
        "schema_version": 1,
        "package_id": PACKAGE_ID,
        "preset": PRESET_NAME,
        "godot_version": version,
        "source_commit": os.environ.get("GITHUB_SHA", "LOCAL_UNKNOWN"),
        "built_at_utc": datetime.now(timezone.utc).isoformat(),
        "apk": {"name": APK_NAME, "bytes": apk_path.stat().st_size, "sha256": apk_sha256},
        "physical_device_validation": "NOT_RUN",
        "performance_validation": "NOT_RUN",
        "screen_reader_validation": "NOT_RUN",
        "human_validation": "NOT_RUN",
        "full_vertical_slice_representativeness": "NOT_RUN",
        "release_ready_claimed": False,
    }

    with tempfile.TemporaryDirectory(prefix="grimoire-android-dist-") as temp_dir:
        staging = Path(temp_dir)
        shutil.copy2(apk_path, staging / APK_NAME)
        (staging / "SHA256SUMS.txt").write_text(
            f"{apk_sha256}  {APK_NAME}\n", encoding="utf-8"
        )
        (staging / "설치안내.txt").write_text(
            guide_path.read_text(encoding="utf-8"), encoding="utf-8"
        )
        (staging / "BUILD_INFO.json").write_text(
            json.dumps(build_info, ensure_ascii=False, indent=2) + "\n", encoding="utf-8"
        )
        _zip_deterministically(staging, zip_path)

    if not zip_path.is_file() or zip_path.stat().st_size <= 0:
        raise RuntimeError(f"distribution ZIP was not created: {zip_path}")

    result = {
        "verdict": "PASS",
        "apk_path": str(apk_path),
        "apk_sha256": apk_sha256,
        "zip_path": str(zip_path),
        "zip_bytes": zip_path.stat().st_size,
        "editor_settings": str(editor_settings),
        **build_info,
    }
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return result


def _parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Build the GRIMOIRE Android Debug APK ZIP.")
    parser.add_argument("--godot", type=Path, required=True)
    parser.add_argument("--project-dir", type=Path, default=Path("."))
    parser.add_argument("--output-dir", type=Path, default=Path("build/android"))
    parser.add_argument(
        "--zip-path",
        type=Path,
        default=Path("build/distribution/GRIMOIRE-Android-Debug-POC.zip"),
    )
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(sys.argv[1:] if argv is None else argv)
    build_package(args.godot, args.project_dir, args.output_dir, args.zip_path)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

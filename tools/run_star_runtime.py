#!/usr/bin/env python3
"""Install the pinned Godot toolchain and run or open the star-circuit POC."""
from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_INSTALL_DIR = ROOT / ".tooling" / "godot"
DEFAULT_REPORT = ROOT / "godot-star-runtime-local-report.json"
SETUP_SCRIPT = ROOT / "tools" / "setup_godot_toolchain.py"


def build_test_command(binary: Path, root: Path) -> list[str]:
    return [str(binary), "--headless", "--path", str(root), "--script", "res://tests/test_runner.gd"]


def build_editor_command(binary: Path, root: Path) -> list[str]:
    return [str(binary), "--editor", "--path", str(root)]


def install_toolchain(install_dir: Path, report: Path) -> Path:
    command = [
        sys.executable,
        str(SETUP_SCRIPT),
        "--install-dir",
        str(install_dir),
        "--with-templates",
        "--json-report",
        str(report),
    ]
    subprocess.run(command, cwd=ROOT, check=True)
    payload = json.loads(report.read_text(encoding="utf-8"))
    if payload.get("verdict") != "PASS":
        raise RuntimeError("Godot toolchain verification did not pass")
    binary = Path(payload["engine"]["binary"])
    if not binary.is_file():
        raise FileNotFoundError(f"Verified Godot binary not found: {binary}")
    return binary


def binary_from_report(report: Path) -> Path:
    if not report.is_file():
        raise FileNotFoundError(f"Toolchain report not found: {report}")
    payload = json.loads(report.read_text(encoding="utf-8"))
    binary = Path(payload["engine"]["binary"])
    if not binary.is_file():
        raise FileNotFoundError(f"Godot binary from report not found: {binary}")
    return binary


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--editor", action="store_true", help="Open the project in the verified Godot editor")
    parser.add_argument("--skip-setup", action="store_true", help="Reuse the existing verified toolchain report")
    parser.add_argument("--install-dir", type=Path, default=DEFAULT_INSTALL_DIR)
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    args = parser.parse_args()

    try:
        binary = binary_from_report(args.report) if args.skip_setup else install_toolchain(args.install_dir, args.report)
        command = build_editor_command(binary, ROOT) if args.editor else build_test_command(binary, ROOT)
        return subprocess.run(command, cwd=ROOT, check=False).returncode
    except (OSError, KeyError, ValueError, RuntimeError, json.JSONDecodeError) as error:
        print(f"star-runtime error: {error}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())

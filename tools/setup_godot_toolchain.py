from __future__ import annotations

import argparse
import hashlib
import json
import os
import platform
import re
import shutil
import stat
import subprocess
import sys
import tempfile
import urllib.request
import zipfile
from dataclasses import dataclass
from pathlib import Path
from typing import Final

GODOT_VERSION: Final = "4.7.1"
GODOT_STATUS: Final = "stable"
OFFICIAL_DOWNLOAD_ENDPOINT: Final = "https://downloads.godotengine.org/"
GODOT_TEMPLATES_SIZE: Final = 1_280_486_955
GODOT_TEMPLATES_SHA256: Final = "86409db6200b6f8fd3230989c2d2002851f3dd18acf11d7bdbafddf5a0dd0f72"
GODOT_TEMPLATES_DOWNLOAD_ATTEMPTS: Final = 3
VERSION_PATTERN: Final = re.compile(r"^4\.7\.1\.stable(?:\.|$)")


@dataclass(frozen=True)
class PlatformSpec:
    system: str
    architecture: str
    download_platform: str
    slug: str
    executable_name: str


_PLATFORM_SPECS: Final[dict[tuple[str, str], PlatformSpec]] = {
    ("Windows", "x86_64"): PlatformSpec(
        system="Windows",
        architecture="x86_64",
        download_platform="windows.64",
        slug="win64.exe.zip",
        executable_name="Godot_v4.7.1-stable_win64.exe",
    ),
    ("Linux", "x86_64"): PlatformSpec(
        system="Linux",
        architecture="x86_64",
        download_platform="linux.64",
        slug="linux.x86_64.zip",
        executable_name="Godot_v4.7.1-stable_linux.x86_64",
    ),
}


def _normalize_machine(machine: str) -> str:
    normalized = machine.strip().lower()
    aliases = {
        "amd64": "x86_64",
        "x64": "x86_64",
        "x86_64": "x86_64",
    }
    return aliases.get(normalized, normalized)


def resolve_platform(system: str, machine: str) -> PlatformSpec:
    key = (system.strip(), _normalize_machine(machine))
    try:
        return _PLATFORM_SPECS[key]
    except KeyError as exc:
        raise RuntimeError(f"Unsupported Godot host: system={system!r}, machine={machine!r}") from exc


def _download_url(download_platform: str, slug: str) -> str:
    return (
        f"{OFFICIAL_DOWNLOAD_ENDPOINT}?flavor={GODOT_STATUS}"
        f"&platform={download_platform}&slug={slug}&version={GODOT_VERSION}"
    )


def build_engine_url(spec: PlatformSpec) -> str:
    return _download_url(spec.download_platform, spec.slug)


def build_templates_url() -> str:
    return (
        f"https://github.com/godotengine/godot-builds/releases/download/"
        f"{GODOT_VERSION}-{GODOT_STATUS}/"
        f"Godot_v{GODOT_VERSION}-{GODOT_STATUS}_export_templates.tpz"
    )


def version_matches(output: str) -> bool:
    return bool(VERSION_PATTERN.match(output.strip()))


def safe_extract_zip(archive: Path, destination: Path) -> None:
    destination = destination.resolve()
    destination.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(archive) as bundle:
        for member in bundle.infolist():
            target = (destination / member.filename).resolve()
            try:
                target.relative_to(destination)
            except ValueError as exc:
                raise RuntimeError(f"unsafe archive member: {member.filename}") from exc
        bundle.extractall(destination)


def _sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def download_file(
    url: str,
    destination: Path,
    timeout_seconds: int = 180,
    *,
    expected_size: int | None = None,
    expected_sha256: str | None = None,
    max_attempts: int = 1,
) -> None:
    if max_attempts < 1:
        raise ValueError("max_attempts must be at least 1")
    destination.parent.mkdir(parents=True, exist_ok=True)

    for attempt in range(1, max_attempts + 1):
        destination.unlink(missing_ok=True)
        try:
            request = urllib.request.Request(
                url,
                headers={"User-Agent": "GRIMOIRE-Godot-Toolchain/1"},
            )
            with urllib.request.urlopen(request, timeout=timeout_seconds) as response:
                with destination.open("wb") as output:
                    shutil.copyfileobj(response, output)

            actual_size = destination.stat().st_size
            if actual_size == 0:
                raise RuntimeError(f"downloaded empty file from {url}")
            if expected_size is not None and actual_size != expected_size:
                raise RuntimeError(
                    f"download size mismatch for {url}: expected {expected_size} bytes, got {actual_size}"
                )
            if expected_sha256 is not None:
                actual_sha256 = _sha256_file(destination)
                if actual_sha256.lower() != expected_sha256.lower():
                    raise RuntimeError(
                        f"download sha256 mismatch for {url}: expected {expected_sha256}, got {actual_sha256}"
                    )
            return
        except (OSError, RuntimeError):
            destination.unlink(missing_ok=True)
            if attempt >= max_attempts:
                raise


def _find_executable(root: Path, executable_name: str) -> Path:
    candidates = list(root.rglob(executable_name))
    if len(candidates) != 1:
        raise RuntimeError(
            f"expected exactly one {executable_name!r} after extraction, found {len(candidates)}"
        )
    binary = candidates[0]
    if os.name != "nt":
        binary.chmod(binary.stat().st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)
    return binary


def install_engine(install_root: Path, spec: PlatformSpec) -> Path:
    engine_root = install_root / f"{GODOT_VERSION}-{GODOT_STATUS}" / spec.system.lower()
    binary = engine_root / spec.executable_name
    if binary.is_file():
        return binary

    engine_root.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="grimoire-godot-download-") as temp_dir:
        archive = Path(temp_dir) / spec.slug
        extract_root = Path(temp_dir) / "engine"
        download_file(build_engine_url(spec), archive)
        safe_extract_zip(archive, extract_root)
        extracted_binary = _find_executable(extract_root, spec.executable_name)
        shutil.copy2(extracted_binary, binary)

    if os.name != "nt":
        binary.chmod(binary.stat().st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)
    return binary


def install_templates(install_root: Path) -> Path:
    template_root = install_root / "export_templates" / f"{GODOT_VERSION}.{GODOT_STATUS}"
    marker = template_root / ".installed-from-official-download"
    if marker.is_file():
        return template_root

    if template_root.exists():
        shutil.rmtree(template_root)
    template_root.mkdir(parents=True, exist_ok=True)

    with tempfile.TemporaryDirectory(prefix="grimoire-godot-templates-") as temp_dir:
        temp_root = Path(temp_dir)
        archive = temp_root / "export_templates.tpz"
        extract_root = temp_root / "templates-extracted"
        download_file(
            build_templates_url(),
            archive,
            expected_size=GODOT_TEMPLATES_SIZE,
            expected_sha256=GODOT_TEMPLATES_SHA256,
            max_attempts=GODOT_TEMPLATES_DOWNLOAD_ATTEMPTS,
        )
        safe_extract_zip(archive, extract_root)
        source = extract_root / "templates"
        if not source.is_dir():
            directories = [path for path in extract_root.iterdir() if path.is_dir()]
            if len(directories) == 1:
                source = directories[0]
            else:
                raise RuntimeError("export template archive does not contain a templates directory")
        for child in source.iterdir():
            destination = template_root / child.name
            if child.is_dir():
                shutil.copytree(child, destination)
            else:
                shutil.copy2(child, destination)

    marker.write_text(build_templates_url() + "\n", encoding="utf-8")
    return template_root


def run_version(binary: Path, timeout_seconds: int = 30) -> str:
    result = subprocess.run(
        [str(binary), "--version"],
        check=False,
        capture_output=True,
        text=True,
        timeout=timeout_seconds,
    )
    output = (result.stdout or result.stderr).strip()
    if result.returncode != 0:
        raise RuntimeError(f"Godot --version failed with exit {result.returncode}: {output[:500]}")
    if not version_matches(output):
        raise RuntimeError(
            f"Godot version mismatch: expected {GODOT_VERSION}.{GODOT_STATUS}, got {output!r}"
        )
    return output


def run_headless_probe(binary: Path, timeout_seconds: int = 60) -> None:
    with tempfile.TemporaryDirectory(prefix="grimoire-godot-probe-") as temp_dir:
        project_dir = Path(temp_dir)
        project_file = project_dir / "project.godot"
        project_file.write_text(
            "; Temporary GRIMOIRE toolchain probe. Deleted after execution.\n"
            "config_version=5\n\n"
            "[application]\n"
            'config/name="GRIMOIRE Toolchain Probe"\n\n'
            "[rendering]\n"
            'renderer/rendering_method="gl_compatibility"\n'
            'renderer/rendering_method.mobile="gl_compatibility"\n',
            encoding="utf-8",
        )
        result = subprocess.run(
            [
                str(binary),
                "--headless",
                "--editor",
                "--path",
                str(project_dir),
                "--quit-after",
                "1",
            ],
            check=False,
            capture_output=True,
            text=True,
            timeout=timeout_seconds,
        )
        if result.returncode != 0:
            output = ((result.stdout or "") + "\n" + (result.stderr or "")).strip()
            raise RuntimeError(f"Godot headless probe failed with exit {result.returncode}: {output[-1500:]}")


def _parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Install and verify the pinned GRIMOIRE Godot toolchain.")
    parser.add_argument("--install-dir", type=Path, default=Path(".tooling/godot"))
    parser.add_argument("--with-templates", action="store_true")
    parser.add_argument("--json-report", type=Path)
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = _parse_args(sys.argv[1:] if argv is None else argv)
    spec = resolve_platform(platform.system(), platform.machine())
    install_root = args.install_dir.resolve()
    binary = install_engine(install_root, spec)
    version_output = run_version(binary)
    run_headless_probe(binary)
    templates = install_templates(install_root) if args.with_templates else None

    report = {
        "schema_version": 1,
        "engine": {
            "requested": f"{GODOT_VERSION}-{GODOT_STATUS}",
            "version_output": version_output,
            "binary": str(binary),
            "download_url": build_engine_url(spec),
        },
        "host": {"system": spec.system, "architecture": spec.architecture},
        "headless_probe": "PASS",
        "export_templates": {
            "status": "PASS" if templates else "NOT_REQUESTED",
            "path": str(templates) if templates else None,
            "download_url": build_templates_url() if templates else None,
        },
        "product_project_created": False,
        "verdict": "PASS",
    }

    encoded = json.dumps(report, ensure_ascii=False, indent=2) + "\n"
    if args.json_report:
        args.json_report.parent.mkdir(parents=True, exist_ok=True)
        args.json_report.write_text(encoded, encoding="utf-8")
    print(encoded, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

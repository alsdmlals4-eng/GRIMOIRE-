from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
import re
import subprocess
from pathlib import Path
from typing import Mapping


PINNED_COMMIT = "aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605"
PINNED_TREE = "5d6893836af4917ee62b1a395125a7530b1f239d"
TEXT_NORMALIZED_SUFFIXES = {
    ".cfg",
    ".fnt",
    ".gd",
    ".import",
    ".json",
    ".md",
    ".svg",
    ".tres",
    ".tscn",
    ".txt",
    ".uid",
}
GODOT_LOAD_STEPS_SUFFIXES = {".fnt", ".tres", ".tscn"}
GODOT_LOAD_STEPS_PATTERN = re.compile(
    rb"^(\[(?:gd_scene|gd_resource)) load_steps=\d+ ", re.MULTILINE
)
CRITICAL_RUNTIME_PATHS = (
    "addons/gut/plugin.cfg",
    "addons/gut/versions.json",
    "addons/gut/LICENSE.md",
    "addons/gut/gut_cmdln.gd",
    "addons/gut/cli/gut_cli.gd",
    "addons/gut/gut_config.gd",
    "addons/gut/gut.gd",
    "addons/gut/test.gd",
    "addons/gut/gut_loader.gd",
    "addons/gut/version_conversion.gd",
    "addons/gut/gui/GutRunner.tscn",
)


def git_text(root: Path, *args: str) -> str:
    completed = subprocess.run(
        ["git", *args],
        cwd=root,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    if completed.returncode != 0:
        raise RuntimeError(completed.stderr.strip() or completed.stdout.strip())
    return completed.stdout.strip()


def read_tree_manifest(root: Path, treeish: str, prefix: str = "addons/gut") -> dict[str, str]:
    output = git_text(root, "ls-tree", "-r", treeish, "--", prefix)
    manifest: dict[str, str] = {}
    for line in output.splitlines():
        if not line:
            continue
        metadata, path = line.split("\t", 1)
        _mode, object_type, object_id = metadata.split()
        if object_type == "blob":
            manifest[path.replace("\\", "/")] = object_id
    return manifest


def _normalized_payload(path: Path, payload: bytes) -> bytes:
    if path.suffix.lower() not in TEXT_NORMALIZED_SUFFIXES:
        return payload
    normalized = payload.replace(b"\r\n", b"\n").replace(b"\r", b"\n")
    if path.suffix.lower() in GODOT_LOAD_STEPS_SUFFIXES:
        normalized = GODOT_LOAD_STEPS_PATTERN.sub(rb"\1 ", normalized)
    return normalized


def _content_digest(path: Path, *, normalize_text: bool) -> str:
    payload = path.read_bytes()
    if normalize_text:
        payload = _normalized_payload(path, payload)
    return hashlib.sha256(payload).hexdigest()


def read_filesystem_manifest(
    root: Path,
    prefix: str = "addons/gut",
    *,
    normalize_text: bool = False,
) -> dict[str, str]:
    vendor_root = root / prefix
    if not vendor_root.is_dir():
        raise RuntimeError(f"GUT_VENDOR_DIRECTORY_MISSING:{vendor_root}")
    return {
        path.relative_to(root).as_posix(): _content_digest(
            path, normalize_text=normalize_text
        )
        for path in sorted(vendor_root.rglob("*"))
        if path.is_file()
    }


def compare_manifests(
    official: Mapping[str, str], project: Mapping[str, str]
) -> dict[str, object]:
    official_paths = set(official)
    project_paths = set(project)
    missing = sorted(official_paths - project_paths)
    extra = sorted(project_paths - official_paths)
    changed = sorted(
        path
        for path in official_paths & project_paths
        if official[path] != project[path]
    )
    identical = sorted(
        path
        for path in official_paths & project_paths
        if official[path] == project[path]
    )
    critical = {
        path: (
            "IDENTICAL"
            if official.get(path) == project.get(path) and path in official and path in project
            else "MISSING_PROJECT"
            if path in official and path not in project
            else "MISSING_OFFICIAL"
            if path in project and path not in official
            else "DIFFERENT"
        )
        for path in CRITICAL_RUNTIME_PATHS
    }
    return {
        "official_file_count": len(official),
        "project_file_count": len(project),
        "identical_count": len(identical),
        "missing_from_project": missing,
        "extra_in_project": extra,
        "changed_blob": changed,
        "critical_runtime": critical,
        "critical_runtime_all_identical": all(
            value == "IDENTICAL" for value in critical.values()
        ),
        "full_tree_identical": not missing and not extra and not changed,
    }


def build_audit_report(
    official_root: Path,
    project_root: Path,
    *,
    expected_project_head: str | None = None,
) -> dict[str, object]:
    official_root = official_root.resolve()
    project_root = project_root.resolve()
    official_head = git_text(official_root, "rev-parse", "HEAD")
    official_tree = git_text(official_root, "rev-parse", "HEAD:addons/gut")
    project_head = git_text(project_root, "rev-parse", "HEAD")
    project_tree = git_text(project_root, "rev-parse", "HEAD:addons/gut")

    raw_comparison = compare_manifests(
        read_tree_manifest(official_root, "HEAD"),
        read_tree_manifest(project_root, "HEAD"),
    )
    normalized_comparison = compare_manifests(
        read_filesystem_manifest(official_root, normalize_text=True),
        read_filesystem_manifest(project_root, normalize_text=True),
    )
    preflight = {
        "official_head_match": official_head == PINNED_COMMIT,
        "official_tree_match": official_tree == PINNED_TREE,
        "project_head_match": (
            expected_project_head is None or project_head == expected_project_head
        ),
    }
    preflight_pass = all(preflight.values())
    result = (
        "FULL_TREE_IDENTICAL"
        if preflight_pass and raw_comparison["full_tree_identical"]
        else "FULL_TREE_GODOT_LOAD_STEPS_NORMALIZED_IDENTICAL"
        if preflight_pass and normalized_comparison["full_tree_identical"]
        else "CRITICAL_RUNTIME_SUBSET_IDENTICAL_FULL_TREE_MISMATCH"
        if preflight_pass and raw_comparison["critical_runtime_all_identical"]
        else "CRITICAL_RUNTIME_GODOT_LOAD_STEPS_NORMALIZED_IDENTICAL_FULL_TREE_MISMATCH"
        if preflight_pass and normalized_comparison["critical_runtime_all_identical"]
        else "FAIL"
    )
    return {
        "schema_version": 3,
        "generated_at": dt.datetime.now(dt.timezone.utc).isoformat(),
        "official": {
            "checkout": str(official_root),
            "head": official_head,
            "expected_head": PINNED_COMMIT,
            "tree": official_tree,
            "expected_tree": PINNED_TREE,
        },
        "project": {
            "root": str(project_root),
            "head": project_head,
            "expected_head": expected_project_head,
            "tree": project_tree,
        },
        "preflight": preflight,
        "raw_comparison": raw_comparison,
        "normalized_comparison": normalized_comparison,
        "normalization_policy": {
            "line_endings": "CRLF_AND_CR_TO_LF",
            "godot_load_steps": "REMOVE_TOP_LEVEL_LOAD_STEPS_HINT_ONLY",
            "semantic_fields": "PRESERVED",
        },
        "result": result,
        "mutation_performed": False,
    }


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Read-only comparison of GRIMOIRE's vendored GUT with official v9.7.1."
    )
    parser.add_argument("--official-checkout", type=Path, required=True)
    parser.add_argument("--project-root", type=Path, default=Path.cwd())
    parser.add_argument("--expected-project-head")
    parser.add_argument(
        "--output",
        type=Path,
        default=Path("artifacts/local-validation/gut-vendor-audit.json"),
    )
    args = parser.parse_args()

    project_root = args.project_root.resolve()
    output_path = args.output
    if not output_path.is_absolute():
        output_path = project_root / output_path
    report = build_audit_report(
        args.official_checkout,
        project_root,
        expected_project_head=args.expected_project_head,
    )
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(
        json.dumps(report, ensure_ascii=False, sort_keys=True, indent=2) + "\n",
        encoding="utf-8",
    )
    print(output_path)
    return 0 if report["result"] in {
        "FULL_TREE_IDENTICAL",
        "FULL_TREE_GODOT_LOAD_STEPS_NORMALIZED_IDENTICAL",
    } else 1


if __name__ == "__main__":
    raise SystemExit(main())

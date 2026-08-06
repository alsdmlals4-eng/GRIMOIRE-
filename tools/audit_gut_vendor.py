from __future__ import annotations

import argparse
import datetime as dt
import json
import subprocess
from pathlib import Path
from typing import Mapping


PINNED_COMMIT = "aeb5d4f3f7f0a6c9b5e178876d6c99b791fda605"
PINNED_TREE = "5d6893836af4917ee62b1a395125a7530b1f239d"
CRITICAL_RUNTIME_PATHS = (
    "addons/gut/plugin.cfg",
    "addons/gut/versions.json",
    "addons/gut/LICENSE.md",
    "addons/gut/gut_cmdln.gd",
    "addons/gut/cli/gut_cli.gd",
    "addons/gut/gut_config.gd",
    "addons/gut/test.gd",
    "addons/gut/gut_loader.gd",
    "addons/gut/version_conversion.gd",
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

    official_root = args.official_checkout.resolve()
    project_root = args.project_root.resolve()
    output_path = args.output
    if not output_path.is_absolute():
        output_path = project_root / output_path

    official_head = git_text(official_root, "rev-parse", "HEAD")
    official_tree = git_text(official_root, "rev-parse", "HEAD:addons/gut")
    project_head = git_text(project_root, "rev-parse", "HEAD")
    project_tree = git_text(project_root, "rev-parse", "HEAD:addons/gut")

    official_manifest = read_tree_manifest(official_root, "HEAD")
    project_manifest = read_tree_manifest(project_root, "HEAD")
    comparison = compare_manifests(official_manifest, project_manifest)

    preflight = {
        "official_head_match": official_head == PINNED_COMMIT,
        "official_tree_match": official_tree == PINNED_TREE,
        "project_head_match": (
            args.expected_project_head is None
            or project_head == args.expected_project_head
        ),
    }
    report = {
        "schema_version": 1,
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
            "expected_head": args.expected_project_head,
            "tree": project_tree,
        },
        "preflight": preflight,
        "comparison": comparison,
        "result": (
            "FULL_TREE_IDENTICAL"
            if all(preflight.values()) and comparison["full_tree_identical"]
            else "CRITICAL_RUNTIME_SUBSET_IDENTICAL_FULL_TREE_MISMATCH"
            if all(preflight.values()) and comparison["critical_runtime_all_identical"]
            else "FAIL"
        ),
        "mutation_performed": False,
    }
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(
        json.dumps(report, ensure_ascii=False, sort_keys=True, indent=2) + "\n",
        encoding="utf-8",
    )
    print(output_path)

    return 0 if report["result"] == "FULL_TREE_IDENTICAL" else 1


if __name__ == "__main__":
    raise SystemExit(main())

from __future__ import annotations

import argparse
import subprocess
from pathlib import PurePosixPath
from typing import Iterable


PROTECTED_PREFIXES = (
    "src/",
    "scenes/",
    "resources/",
    "data/",
    "assets/",
    "ui/",
)
PROTECTED_SUFFIXES = (".tscn", ".tres", ".res")
PROTECTED_EXACT = {"project.godot"}


def _normalize(path: str) -> str:
    return PurePosixPath(path.replace("\\", "/")).as_posix().lstrip("./")


def protected_paths(paths: Iterable[str]) -> list[str]:
    protected: set[str] = set()
    for raw in paths:
        path = _normalize(raw.strip())
        if not path:
            continue
        if path in PROTECTED_EXACT:
            protected.add(path)
            continue
        if path.startswith(PROTECTED_PREFIXES):
            protected.add(path)
            continue
        if path.lower().endswith(PROTECTED_SUFFIXES):
            protected.add(path)
    return sorted(protected)


def changed_paths(base_sha: str, head_sha: str) -> list[str]:
    completed = subprocess.run(
        ["git", "diff", "--name-only", base_sha, head_sha],
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    if completed.returncode != 0:
        raise RuntimeError(completed.stderr.strip() or "GIT_DIFF_FAILED")
    return [line for line in completed.stdout.splitlines() if line.strip()]


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Fail-closed HiGodot authoring receipt gate. Current adoption PR may pass "
            "without a receipt only when protected production diff is exactly zero."
        )
    )
    parser.add_argument("--base-sha", required=True)
    parser.add_argument("--head-sha", required=True)
    args = parser.parse_args()

    protected = protected_paths(changed_paths(args.base_sha, args.head_sha))
    if protected:
        print("HIGODOT_AUTHORING_MANIFEST_REQUIRED")
        for path in protected:
            print(path)
        print("Current PR gate intentionally fails closed for protected production changes.")
        return 1

    print("HIGODOT_AUTHORING_RECEIPT_GATE_PASS_NO_PROTECTED_GODOT_DIFF")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

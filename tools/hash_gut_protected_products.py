from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Iterable


PROTECTED_ROOTS = (
    "project.godot",
    "src",
    "data",
    "assets",
    "ui",
    "scenes",
    "resources",
    "addons/godot_ai",
)
PROTECTED_SUFFIXES = (".tscn", ".tres", ".res")
EXCLUDED_PARTS = {".git", ".godot", "artifacts", "tests", "__pycache__"}


def _is_excluded(path: Path, root: Path) -> bool:
    relative = path.relative_to(root)
    return any(part in EXCLUDED_PARTS for part in relative.parts)


def _iter_files(path: Path, root: Path) -> Iterable[Path]:
    if path.is_file() and not _is_excluded(path, root):
        yield path
    elif path.is_dir():
        for candidate in path.rglob("*"):
            if candidate.is_file() and not _is_excluded(candidate, root):
                yield candidate


def build_manifest(root: Path) -> dict[str, str]:
    root = root.resolve()
    files: set[Path] = set()

    for item in PROTECTED_ROOTS:
        files.update(_iter_files(root / item, root))

    for candidate in root.rglob("*"):
        if (
            candidate.is_file()
            and candidate.suffix.lower() in PROTECTED_SUFFIXES
            and not _is_excluded(candidate, root)
        ):
            files.add(candidate)

    return {
        path.relative_to(root).as_posix(): hashlib.sha256(path.read_bytes()).hexdigest()
        for path in sorted(files, key=lambda item: item.relative_to(root).as_posix())
    }


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Hash GRIMOIRE product files protected from GUT mutation."
    )
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    manifest = build_manifest(args.root)
    rendered = json.dumps(manifest, ensure_ascii=False, sort_keys=True, indent=2) + "\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    else:
        print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

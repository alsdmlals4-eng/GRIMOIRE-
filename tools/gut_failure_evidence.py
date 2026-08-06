from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Mapping, Sequence


def resolve_evidence_dir(argv: Sequence[str]) -> Path:
    for index, argument in enumerate(argv):
        if argument == "--evidence-dir" and index + 1 < len(argv):
            return Path(argv[index + 1])
        if argument.startswith("--evidence-dir="):
            return Path(argument.split("=", 1)[1])
    return Path("artifacts/local-validation")


def render_failure_evidence(evidence_dir: Path) -> str:
    manifest_path = evidence_dir / "manifest.json"
    if not manifest_path.is_file():
        return f"validation manifest missing: {manifest_path}"

    data: Mapping[str, Any] = json.loads(manifest_path.read_text(encoding="utf-8"))
    sections = [
        "--- validation manifest ---",
        json.dumps(data, ensure_ascii=False, sort_keys=True, indent=2),
    ]

    for command in data.get("commands", []):
        if command.get("exit_code") == 0:
            continue
        name = str(command.get("name", "unknown-command"))
        log_path = Path(str(command.get("log_path", "")))
        sections.append(f"--- failed command log: {name} ---")
        if log_path.is_file():
            sections.append(log_path.read_text(encoding="utf-8", errors="replace"))
        else:
            sections.append(f"log missing: {log_path}")

    return "\n".join(sections)
